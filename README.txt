	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	CLASS OO_HASMAP OBJECT

	Interface reference
	http://docs.oracle.com/javase/7/docs/api/java/util/HashMap.html
	
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

	Create an hasmap object
	
	Usage:
		put the "oo_hashmap.sqf" and the "oop.h" files in your mission directory
		put this code into your mission init.sqf
		call compile preprocessFileLineNumbers "oo_hasmap.sqf";

	See example mission in directory: init.sqf
	
	Licence: 
	You can share, modify, distribute this script but don't remove the licence and the name of the original author

	logs:
		0.50 - fix private keywords
		0.40 - improve perfomance with native array 	
		0.31 - OO HASHMAP
			- hotfix - multipe instance hashmap - instanceid
		0.3 - OO HASHMAP
			- use key string now
			- use missionnamespace instead entryset array
			- remove useless code
			- fix test init code & add some use cases
			- fix function names typo
			- remove slow searchindex function
		0.2 - OO HASHMAP
			- add documentation
			- add performance improvements
			- fix clear function
		0.1 - OO HASHMAP - first release


