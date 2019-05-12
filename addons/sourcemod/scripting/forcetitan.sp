#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Draakoor"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>
//#include <sdkhooks>

public Plugin myinfo = 
{
	name = "Force AOT CMD",
	author = PLUGIN_AUTHOR,
	description = "Forces RED Team AOT Command",
	version = PLUGIN_VERSION,
	url = "https://german-gamers-united.com"
};

public void OnPluginStart()
{
	HookEvent("player_spawn", SpawnEvent, EventHookMode);
}

public Action:SpawnEvent(Handle event,char[] name,bool dontBroadcast)
{
	int iClient_id = GetEventInt(event, "userid");
	int iClient = GetClientOfUserId(iClient_id);
	if(IsClientInGame(iClient) && IsPlayerAlive(iClient) && GetClientTeam(iClient)==2)
	{
		ServerCommand("sm_titan \"%N\" ", iClient);
		return;
	}
	else
	{
		PrintToServer("NOT WORKING");
	}
}