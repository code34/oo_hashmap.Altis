
		call compilefinal preprocessFileLineNumbers "oo_hashmap.sqf";
		
		private ["_map", "_size", "_i", "_key", "_value"];

		_map = ["new", []] call OO_HASHMAP;
	
		_return = "isEmpty" call _map;
		diag_log format["isempty %1", _return];

		["put", ["toto", [3,7]]] call _map;
		["put", ["tata", "turlututu"]] call _map;
		["put", ["jp", "test du hashmap"]] call _map;

		_return = ["containsKey", "toto"] call _map;
		diag_log format["contains key toto %1", _return];

		_return = ["containsValue", ["bullshit"]] call _map;
		diag_log format["contains value bullshit %1", _return];	

		_return = ["containsValue", [[3,7]]] call _map;
		diag_log format["contains value [3,7] %1", _return];

		_return = "entrySet" call _map;
		diag_log format["entryset %1", _return];

		_return = ["get", "toto"] call _map;
		diag_log format["get toto %1", _return];

		_return = "isEmpty" call _map;
		diag_log format["isempty %1", _return];

		_return = "keySet" call _map;
		diag_log format["keySet %1", _return];

		_return = "size" call _map;
		diag_log format["Size %1", _return];

		["put", ["toto", [8,8]]] call _map;
		["put", ["toto", [4,1]]] call _map;

		_return = "keySet" call _map;
		diag_log format["check for toto doublon, keySet %1", _return];		

		_return = ["get", "toto"] call _map;
		diag_log format["after toto setting, get toto %1", _return];

		["remove", "tata"] call _map;
		diag_log "remove tata";

		_return = ["containsKey", "tata"] call _map;
		diag_log format["contains key tata %1", _return];		

		_return = "keySet" call _map;
		diag_log format["after tata remove, keySet %1", _return];

		_return = "entrySet" call _map;
		diag_log format["after tata remove, entryset %1", _return];

		"clear" call _map;

		_return = "size" call _map;
		diag_log format["Size %1 after clear", _return];

		_return = "IsEmpty" call _map;
		diag_log format["isempty %1", _return];	
	
		

		