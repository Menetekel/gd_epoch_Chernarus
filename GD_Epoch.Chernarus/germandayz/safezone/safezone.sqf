while{alive player} do {
        waitUntil{inSafeZone};
        player allowDamage false;
        _eh = player addEventHandler ["fired",{deleteVehicle (_this select 6);}];
        if(vehicle player != player) then {
                vehicle player allowDamage false;
                _ehVeh = player addEventHandler ["fired",{deleteVehicle (_this select 6);}];
                vehicle player setVariable ["ehNum",_ehVeh];
        };
        waitUntil{!inSafeZone};
        player allowDamage true;
        player removeEventHandler ["fired",_eh];
        if(vehicle player != player) then {
                vehicle player allowDamage true;
                vehicle player removeEventHandler ["fired",vehicle player getVariable ["ehNum",0]];
        };
        _eh = 0;
        _ehVeh = 0;
};