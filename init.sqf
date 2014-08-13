		call compilefinal preprocessFileLineNumbers "oo_grid.sqf";
		call compilefinal preprocessFileLineNumbers "oo_node.sqf";

		_grid = ["new", [31000,31000,100,100]] call OO_GRID;

		_result = ["parseAllSectors", "isBuilding"] call _grid;

		_temp = [];		
		{
			_temp = _temp + [_x];
			["DrawSector", _x] call _grid;
			if(count _temp > 10) then {
				diag_log format["building: %1", _temp];
				_temp = [];
			};
		}foreach _result;
		diag_log format["building: %1", _temp];