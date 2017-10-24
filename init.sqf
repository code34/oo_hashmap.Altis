
		call compilefinal preprocessFileLineNumbers "oo_hashmap.sqf";
		
		private ["_map", "_return"];

		_map = ["new", []] call OO_HASHMAP;
	
		_return = "isEmpty" call _map;
		hint format["isempty %1 (should return true)", _return];

		sleep 2;

		["put", ["toto", [3,7]]] call _map;
		["put", ["tata", "turlututu"]] call _map;
		["put", ["jp", "test du hashmap"]] call _map;

		_return = ["containsKey", "toto"] call _map;
		hint format["contains key toto %1 (should return true)", _return];

		sleep 2;

		_return = ["containsValue", ["bullshit"]] call _map;
		hint format["contains value bullshit %1 (should return false)", _return];	

		sleep 2;

		_return = ["containsValue", [[3,7]]] call _map;
		hint format["contains value [3,7] %1 (should return true)", _return];

		sleep 2;

		_return = "entrySet" call _map;
		hint format["entryset %1 (should return [[3,7],'turlututu','test du hashmap']", _return];

		sleep 2;

		_return = ["get", "toto"] call _map;
		hint format["get toto %1 (should return [3,7])", _return];

		sleep 2;

		_return = "isEmpty" call _map;
		hint format["isempty %1 (should return false)", _return];

		sleep 2;

		_return = "keySet" call _map;
		hint format["keySet %1 (should return ['toto', 'tata', 'jp'])", _return];

		sleep 2;

		_return = "size" call _map;
		hint format["Size %1 (should return 3)", _return];

		sleep 2;

		["put", ["toto", [8,8]]] call _map;
		["put", ["toto", [4,1]]] call _map;

		sleep 2;

		_return = "keySet" call _map;
		hint format["check for toto doublon, keySet %1 (should return ['toto', 'tata', 'jp'])", _return];		

		sleep 2;

		_return = ["get", "toto"] call _map;
		hint format["after toto setting, get toto %1 (should return [4,1])", _return];

		sleep 2;

		["remove", "tata"] call _map;
		hint "remove tata";

		sleep 2;

		_return = ["containsKey", "tata"] call _map;
		hint format["contains key tata %1 (should return false)", _return];

		sleep 2;

		_return = "keySet" call _map;
		hint format["after tata remove, keySet %1 (should return ['toto', 'jp'])", _return];

		sleep 2;

		_return = "entrySet" call _map;
		hint format["after tata remove, entryset %1 (should return  [[4,1],'test du hashmap']", _return];

		sleep 2;

		"clear" call _map;

		_return = "size" call _map;
		hint format["Size %1 after clear (should return 0)", _return];

		sleep 2;

		_return = "IsEmpty" call _map;
		hint format["isempty %1 (should return true)", _return];	