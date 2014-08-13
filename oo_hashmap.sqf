	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014 Nicolas BOITEUX

	CLASS OO_HASMAP
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "oop.h"

	CLASS("OO_HASHMAP")
		PRIVATE VARIABLE("array","index");
		PRIVATE VARIABLE("array","map");

		PUBLIC FUNCTION("array","constructor") {
			MEMBER("index", nil) = [];
			MEMBER("map", nil) = [];
		};

		// Removes all of the mappings from this map.
		PUBLIC FUNCTION("array", "Clear") {
			MEMBER("index", nil) = [];
			MEMBER("map", nil) = [];
		};

		// Returns true if this map contains a mapping for the specified key.
		PUBLIC FUNCTION("array", containsKey) {
			private ["_return", "_key"];

			_key = _this select 0;
			_return = _false;

			{
				if(_key == _x) then {
					_return = true;
				};
			}foreach MEMBER("index", nil);

			_return;
		};

		// Returns true if this map maps one or more keys to the specified value.
		PUBLIC FUNCTION("array", containsValue) {
			private ["_return", "_value"];

			_value = _this select 0;
			_return = _false;

			{
				if(_value == _x) then {
					_return = true;
				};
			}foreach MEMBER("map", nil);

			_return;
			
		};

		// Returns a Set view of the mappings contained in this map.
		PUBLIC FUNCTION("","entrySet") FUNC_GETVAR("map");

		// Returns the value to which the specified key is mapped, or null if this map contains no mapping for the key.
		PUBLIC FUNCTION("array", "Get") {
			private ["_key", "_index", "_map", "_return"];

			_key = _this select 0;
		
			_index = MEMBER("SearchIndex", _key);
			if(index == -1) then {
				_return = null;
			} else {
				_return = MEMBER("map", nil) select _index;
			};
			_return;
		};

		// Returns true if this map contains no key-value mappings.
		PUBLIC FUNCTION("array", "IsEmpty") {
			if(count MEMBER("index", nil) == 0) then { true; } else { false };
		};


		//Returns a Set view of the keys contained in this map.
		PUBLIC FUNCTION("","keySet") FUNC_GETVAR("index");

		// Associates the specified value with the specified key in this map.
		PUBLIC FUNCTION("array", "Put") {
			_key = _this select 0;
			_value = _this select 1;

			if(isnil _key) exitwith {false};

			MEMBER("index", nil) = MEMBER("index", nil) + [_key];
			MEMBER("map", nil) = MEMBER("map", nil) + [_value];
		};

		// Copies all of the mappings from the specified map to this map.
		PUBLIC FUNCTION("array", "PutAll") {	
			private ["_return", "_extmap"];
			_extmap = _this select 0;
			
			_return = true;
			{
				if(MEMBER("containsKey", _x)) then {
					_return = _false;
				};
			}foreach ("keySet" call _extmap);

			if(_return) then {
				MEMBER("index", nil) = MEMBER("index", nil) + ("keySet" call _extmap);
				MEMBER("map", nil) = MEMBER("map", nil) + ("entrySet" call _extmap);
			};
			_return;
		};

		// Removes the mapping for the specified key from this map if present.
		PUBLIC FUNCTION("array", "Remove") {
			private ["_key", "_index", "_map"];

			_key = _this select 0;
		
			_index = MEMBER("SearchIndex", _key);
						
			MEMBER("index", nil) set [_index, "hasmapdeletedobject"];
			MEMBER("map", nil) set [_index, "hasmapdeletedobject"];

			MEMBER("index", nil) =  MEMBER("index", nil) - ["hasmapdeletedobject"];
			MEMBER("map", nil) =  MEMBER("map", nil) - ["hasmapdeletedobject"];
		};

		// Returns the number of key-value mappings in this map
		PUBLIC FUNCTION("array", "Size") {
			private ["_count"];

			_count = count MEMBER("index", nil);
			_count;
		};

		PUBLIC FUNCTION("array", "SearchIndex") {
			private ["_i", "_index", "_key"];
			
			_key = _this select 0;

			_index = -1;
			_i = 0;

			{
				if(_value == _x) then {
					_index = _i;
				};
				_i = _i + 1;
			}foreach MEMBER("index", nil);
			_index;
		};


		PUBLIC FUNCTION("","deconstructor") { 
			DELETE_VARIABLE("index");
			DELETE_VARIABLE("map");
		};
	ENDCLASS;