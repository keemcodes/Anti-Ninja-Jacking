// This is not all of my work. I basically found this somewhere and edited it to work for NGG. I've tested it several times.
// It works well and stops like 95% of ninjajacks.


// Add these defines.
#define HOLDING(%0) \
    ((newkeys & (%0)) == (%0))
#define RELEASED(%0) \
    (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))
#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
// Done.

// Variables.
new IsPlayerSteppingInVehicle[MAX_PLAYERS] = -1; // This variable is set when player is entering a car.
// Done.

// Add this under "OnPlayerEnterVehicle"
IsPlayerSteppingInVehicle[playerid] = vehicleid;
// Done.

// new IsPlayerSteppingInVehicle[MAX_PLAYERS] = -1;
if (HOLDING(KEY_SPRINT) || PRESSED(KEY_SPRINT) || RELEASED(KEY_SPRINT))
{
    if (IsPlayerSteppingInVehicle[playerid] > -1)
    {
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if (GetPlayerVehicleID(i) == IsPlayerSteppingInVehicle[playerid] && i != playerid)
            {
                new Float:x,Float:y,Float:z;
                GetPlayerPos(playerid,x,y,z);
                SetPlayerPos(playerid,x,y,z);
                GameTextForPlayer(playerid,"~r~Ninja jack detection",5000,4);
                IsPlayerSteppingInVehicle[playerid] = -1;
				SendClientMessageEx(playerid, COLOR_GRAD4, "Please don't press, hold or release shift/jump while entering a vehicle");
            }
        }
    }
}
if (HOLDING(KEY_JUMP) || PRESSED(KEY_JUMP) || RELEASED(KEY_JUMP))
{
    if (IsPlayerSteppingInVehicle[playerid] > -1)
    {
        for(new i = 0; i < MAX_PLAYERS; i++)
        {
            if (GetPlayerVehicleID(i) == IsPlayerSteppingInVehicle[playerid] && i != playerid)
            {
                new Float:x,Float:y,Float:z;
                GetPlayerPos(playerid,x,y,z);
                SetPlayerPos(playerid,x,y,z);
                GameTextForPlayer(playerid,"~r~Ninja jack detection",5000,4);
                IsPlayerSteppingInVehicle[playerid] = -1;
				SendClientMessageEx(playerid, COLOR_GRAD4, "Please don't press, hold or release shift/jump while entering a vehicle");
            }
        }
    }
}
// Here is a short explaination of how the script works all together.
// When a player presses, holds or releases Sprint or Jump key while entering a vehicle it sets their position.
// Done.



// I've showed this script to many people and they really want it implemented. Thank you for viewing my work.
