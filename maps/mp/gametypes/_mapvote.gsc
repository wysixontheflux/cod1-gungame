Initialise(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  // Small wait
  wait .5;
  // Create HUD
  CreateHud();
  // Start mapvote thread
  thread init();
  // Wait for voting to finish
  level waittill("VotingComplete");
  // Delete HUD
  DeleteHud();
  // Handle CoDaM Stuff
  level.votestatus = "started";
  level.mapended = true;
  level.votestatus = "done";
}
precache(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  level.hns_mapvotehudoffset = 35;
  level.hns_debug = false;
  level.hns_mapvotereplay = false;
  if (getCvar("mapvote_replay") == "1")
    level.hns_mapvotereplay = true;
  level.mapvotetime = getCvarInt("scr_mm_mapvotetime");
  if (level.mapvotetime == 0)
    level.mapvotetime = 20;
  // MapVote //
  precacheshader("white");
  PrecacheString(level.mapvotetime);
  PrecacheString(&"Next Map Vote");
  PrecacheString(&"Time Left: ");
  PrecacheString(&"Press ^2FIRE^7 to vote       Votes");
}
CreateHud(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  if (!isDefined(level.hns_mapvotehudoffset))
	level.hns_mapvotehudoffset = 35;
  if (!isDefined(level.mapvotetime))
	level.mapvotetime = getCvarInt("scr_mm_mapvotetime");
  level.vote_hud_bgnd = newHudElem();
  level.vote_hud_bgnd.archived = false;
  level.vote_hud_bgnd.alpha = .7;
  level.vote_hud_bgnd.x = 205;
  level.vote_hud_bgnd.y = level.hns_mapvotehudoffset + 17;
  level.vote_hud_bgnd.sort = 9000;
  level.vote_hud_bgnd.color = (0, 0, 0);
  level.vote_hud_bgnd setShader("white", 260, 140);
  level.vote_header = newHudElem();
  level.vote_header.archived = false;
  level.vote_header.alpha = .3;
  level.vote_header.x = 208;
  level.vote_header.y = level.hns_mapvotehudoffset + 19;
  level.vote_header.sort = 9001;
  level.vote_header setShader("white", 254, 21);
  level.vote_headerText = newHudElem();
  level.vote_headerText.archived = false;
  level.vote_headerText.x = 200;
  level.vote_headerText.y = level.hns_mapvotehudoffset + 21;
  level.vote_headerText.sort = 9998;
  level.vote_headerText.Value = "Next Map Vote";
  level.vote_headerText.fontscale = 1.3;
  level.vote_leftline = newHudElem();
  level.vote_leftline.archived = false;
  level.vote_leftline.alpha = .3;
  level.vote_leftline.x = 207;
  level.vote_leftline.y = level.hns_mapvotehudoffset + 19;
  level.vote_leftline.sort = 9001;
  level.vote_leftline setShader("white", 1, 135);
  level.vote_rightline = newHudElem();
  level.vote_rightline.archived = false;
  level.vote_rightline.alpha = .3;
  level.vote_rightline.x = 462;
  level.vote_rightline.y = level.hns_mapvotehudoffset + 19;
  level.vote_rightline.sort = 9001;
  level.vote_rightline setShader("white", 1, 135);
  level.vote_bottomline = newHudElem();
  level.vote_bottomline.archived = false;
  level.vote_bottomline.alpha = .3;
  level.vote_bottomline.x = 207;
  level.vote_bottomline.y = level.hns_mapvotehudoffset + 154;
  level.vote_bottomline.sort = 9001;
  level.vote_bottomline setShader("white", 256, 1);
  /*	level.vote_hud_votestext = newHudElem();
          level.vote_hud_votestext.archived = false;
          level.vote_hud_votestext.x = 435;
          level.vote_hud_votestext.y = level.hns_mapvotehudoffset + 56;
          level.vote_hud_votestext.sort = 9998;
          level.vote_hud_votestext.fontscale = 0.8;
          level.vote_hud_votestext.label = level.mapvotetext["Votes"]; */
  level.vote_hud_timeleft = newHudElem();
  level.vote_hud_timeleft.archived = false;
  level.vote_hud_timeleft.x = 400;
  level.vote_hud_timeleft.y = level.hns_mapvotehudoffset + 26;
  level.vote_hud_timeleft.sort = 9998;
  level.vote_hud_timeleft.fontscale = .8;
  level.vote_hud_timeleft.Value = "Time Left: ";
  level.vote_hud_timeleft setValue(level.mapvotetime);
  level.vote_hud_instructions = newHudElem();
  level.vote_hud_instructions.archived = false;
  level.vote_hud_instructions.x = 350;
  level.vote_hud_instructions.y = level.hns_mapvotehudoffset + 56;
  level.vote_hud_instructions.sort = 9998;
  level.vote_hud_instructions.fontscale = 1;
  level.vote_hud_instructions.Value = "Press ^2FIRE^7 to vote       Votes";
  level.vote_hud_instructions.alignX = "center";
  level.vote_hud_instructions.alignY = "middle";
  level.vote_map1 = newHudElem();
  level.vote_map1.archived = false;
  level.vote_map1.x = 446;
  level.vote_map1.y = level.hns_mapvotehudoffset + 64;
  level.vote_map1.sort = 9998;
  level.vote_map2 = newHudElem();
  level.vote_map2.archived = false;
  level.vote_map2.x = 446;
  level.vote_map2.y = level.hns_mapvotehudoffset + 80;
  level.vote_map2.sort = 9998;
  level.vote_map3 = newHudElem();
  level.vote_map3.archived = false;
  level.vote_map3.x = 446;
  level.vote_map3.y = level.hns_mapvotehudoffset + 96;
  level.vote_map3.sort = 9998;
  level.vote_map4 = newHudElem();
  level.vote_map4.archived = false;
  level.vote_map4.x = 446;
  level.vote_map4.y = level.hns_mapvotehudoffset + 112;
  level.vote_map4.sort = 9998;
  level.vote_map5 = newHudElem();
  level.vote_map5.archived = false;
  level.vote_map5.x = 446;
  level.vote_map5.y = level.hns_mapvotehudoffset + 128;
  level.vote_map5.sort = 9998;
}
//**********************
getMapName(map) {
  switch (map) {
  case "mp_brecourt":
    mapname = "Brecourt";
    break;
  case "mp_carentan":
    mapname = "Carentan";
    break;
  case "mp_chateau":
    mapname = "Chateau";
    break;
  case "mp_dawnville":
    mapname = "Dawnville";
    break;
  case "mp_depot":
    mapname = "Depot";
    break;
  case "mp_harbor":
    mapname = "Harbor";
    break;
  case "mp_hurtgen":
    mapname = "Hurtgen";
    break;
  case "mp_pavlov":
    mapname = "Pavlov";
    break;
  case "mp_powcamp":
    mapname = "P.O.W Camp";
    break;
  case "mp_railyard":
    mapname = "Railyard";
    break;
  case "mp_rocket":
    mapname = "Rocket";
    break;
      case "mp_bocage":
          mapname = "Bocage";
      break;
  case "mp_ship":
    mapname = "Ship";
    break;
  default:
    mapname = map;
    break;
  }
  return mapname;
}
getGametypeName(gt) {
  switch (gt) {
  //case "hns":
  case "hideNseek":
    gtname = "Hide N' Seek";
    break;
  default:
    gtname = gt;
    break;
  }
  return gtname;
}
explode(s, delimiter) {
  j = 0;
  temparr[j] = "";
  for (i = 0; i < s.size; i++) {
    if (s[i] == delimiter) {
      j++;
      temparr[j] = "";
    } else
      temparr[j] += s[i];
  }
  return temparr;
}
isConfig(cfg) {
  temparr = explode(cfg, ".");
  if (temparr.size == 2 && temparr[1] == "cfg")
    return true;
  else
    return false;
}
isGametype(gt) {
  switch (gt) {
  //case "hns":
  case "hideNseek":
    return true;
  default:
    return false;
  }
}
strip(s) {
  if (s == "")
    return "";
  s2 = "";
  s3 = "";
  i = 0;
  while (i < s.size && s[i] == " ")
    i++;
  // String is just blanks?
  if (i == s.size)
    return "";
  for (; i < s.size; i++) {
    s2 += s[i];
  }
  i = s2.size - 1;
  while (s2[i] == " " && i > 0)
    i--;
  for (j = 0; j <= i; j++) {
    s3 += s2[j];
  }
  return s3;
}
GetRandomMapRotation() { return GetMapRotation(true, false, undefined); }
GetMapRotation(random, current, number) {
  maprot = "";
  if (!isdefined(number))
    number = 0;
  // Get current maprotation
  if (current)
    maprot = strip(getcvar("sv_maprotationcurrent"));
  // Get maprotation if current empty or not the one we want
  if (!isDefined(level.hns_debug)) level.hns_debug = 0;
  if (level.hns_debug)
    iprintln("(cvar)maprot: " + getcvar("sv_maprotation").size);
  if (maprot == "")
    maprot = strip(getcvar("sv_maprotation"));
  if (level.hns_debug)
    iprintln("(var)maprot: " + maprot.size);
  // No map rotation setup!
  if (maprot == "")
    return undefined;
  // Explode entries into an array
  //	temparr2 = explode(maprot," ");
  j = 0;
  temparr2[j] = "";
  for (i = 0; i < maprot.size; i++) {
    if (maprot[i] == " ") {
      j++;
      temparr2[j] = "";
    } else
      temparr2[j] += maprot[i];
  }
  // Remove empty elements (double spaces)
  temparr = [];
  for (i = 0; i < temparr2.size; i++) {
    element = strip(temparr2[i]);
    if (element != "") {
      if (level.hns_debug)
        iprintln("maprot" + temparr.size + ":" + element);
      temparr[temparr.size] = element;
    }
  }
  // Spawn entity to hold the array
  x = spawn("script_origin", (0, 0, 0));
  x.maps = [];
  lastexec = undefined;
  lastgt = level.hns_gametype;
  for (i = 0; i < temparr.size;) {
    switch (temparr[i]) {
    case "exec":
      if (isdefined(temparr[i + 1]))
        lastexec = temparr[i + 1];
      i += 2;
      break;
    case "gametype":
      if (isdefined(temparr[i + 1]))
        lastgt = temparr[i + 1];
      i += 2;
      break;
    case "map":
      if (isdefined(temparr[i + 1])) {
        x.maps[x.maps.size]["exec"] = lastexec;
        x.maps[x.maps.size - 1]["gametype"] = lastgt;
        x.maps[x.maps.size - 1]["map"] = temparr[i + 1];
      }
      // Only need to save this for random rotations
      if (!random) {
        lastexec = undefined;
        lastgt = undefined;
      }
      i += 2;
      break;
    // If code get here, then the maprotation is corrupt so we have to fix it
    default:
      iprintlnbold("ERROR IN MAPROTATION!!! Will try to fix.");
      if (isGametype(temparr[i]))
        lastgt = temparr[i];
      else if (isConfig(temparr[i]))
        lastexec = temparr[i];
      else {
        x.maps[x.maps.size]["exec"] = lastexec;
        x.maps[x.maps.size - 1]["gametype"] = lastgt;
        x.maps[x.maps.size - 1]["map"] = temparr[i];
        // Only need to save this for random rotations
        if (!random) {
          lastexec = undefined;
          lastgt = undefined;
        }
      }
      i += 1;
      break;
    }
    if (number && x.maps.size >= number)
      break;
  }
  if (random) {
    // Shuffle the array 20 times
    for (k = 0; k < 20; k++) {
      for (i = 0; i < x.maps.size; i++) {
        j = randomInt(x.maps.size);
        element = x.maps[i];
        x.maps[i] = x.maps[j];
        x.maps[j] = element;
      }
    }
  }
  return x;
}
spawnSpectator(origin, angles) {
  self notify("spawned");
  self notify("killed");
  self notify("end_respawn");
  resettimeout();
  self.sessionstate = "spectator";
  self.spectatorclient = -1;
  self.archivetime = 0;
  self.friendlydamage = undefined;
  if (self.pers["team"] == "spectator")
    self.statusicon = "";
  if (isDefined(origin) && isDefined(angles))
    self spawn(origin, angles);
  else {
    spawnpointname = "mp_teamdeathmatch_intermission";
    spawnpoints = getentarray(spawnpointname, "classname");
    spawnpoint =
        maps\mp\gametypes\_spawnlogic::getSpawnpoint_Random(spawnpoints);
    if (isDefined(spawnpoint))
      self spawn(spawnpoint.origin, spawnpoint.angles);
    else
      maps\mp\_utility::error("NO " + spawnpointname + " SPAWNPOINTS IN MAP");
  }
}
//**************************************************
init(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  currentgt = getcvar("g_gametype");
  currentmap = getcvar("mapname");
  x = GetRandomMapRotation();
  if (isdefined(x)) {
    if (isdefined(x.maps))
      maps = x.maps;
    x delete ();
  }
  // Any maps?
  if (!isdefined(maps)) {
    wait 0.05;
    level notify("VotingComplete");
    return;
  }
  // Fill all alternatives with the current map in case there is not enough
  // unique maps
  for (j = 0; j < 5; j++) {
    level.mapcandidate[j]["map"] = currentmap;
    level.mapcandidate[j]["mapname"] = "Replay this map";
    level.mapcandidate[j]["gametype"] = currentgt;
    level.mapcandidate[j]["exec"] = undefined;
    level.mapcandidate[j]["votes"] = 0;
  }
  // get candidates
  i = 0;
  for (j = 0; j < 5; j++) {
    // Skip current map and gametype combination
    if (maps[i]["map"] == currentmap && maps[i]["gametype"] == currentgt)
      i++;
    // Any maps left?
    if (!isdefined(maps[i]))
      break;
    level.mapcandidate[j]["map"] = maps[i]["map"];
    level.mapcandidate[j]["mapname"] = getMapName(maps[i]["map"]);
    level.mapcandidate[j]["gametype"] = maps[i]["gametype"];
    level.mapcandidate[j]["exec"] = maps[i]["exec"];
    level.mapcandidate[j]["votes"] = 0;
    i++;
    // Any maps left?
    if (!isdefined(maps[i]))
      break;
    // Keep current map as last alternative?
	if (!isDefined(level.hns_mapvotereplay)) level.hns_mapvotereplay = 0;
    if (level.hns_mapvotereplay && j > 2)
      break;
  }
  thread DisplayMapChoices();
  game["menu_team"] = "";
  // start a voting thread per player
  players = getentarray("player", "classname");
  for (i = 0; i < players.size; i++)
    players[i] thread PlayerVote();
  thread VoteLogic();
  // Take a breath for players to restart with the map
  wait 0.1;
  level.mapended = true;
}
DeleteHud(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  level.vote_headerText destroy();
  //	level.vote_hud_votestext destroy();
  level.vote_hud_timeleft destroy();
  level.vote_hud_instructions destroy();
  level.vote_map1 destroy();
  level.vote_map2 destroy();
  level.vote_map3 destroy();
  level.vote_map4 destroy();
  level.vote_map5 destroy();
  level.vote_hud_bgnd destroy();
  level.vote_header destroy();
  level.vote_leftline destroy();
  level.vote_rightline destroy();
  level.vote_bottomline destroy();
  players = getentarray("player", "classname");
  for (i = 0; i < players.size; i++)
    if (isdefined(players[i].vote_indicator))
      players[i].vote_indicator destroy();
}
// Displays the map candidates
DisplayMapChoices(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  level endon("VotingDone");
  for (;;) {
    iprintlnbold(level.mapcandidate[0]["mapname"] + " (^2" +
                 level.mapcandidate[0]["gametype"] + "^7)");
    iprintlnbold(level.mapcandidate[1]["mapname"] + " (^2" +
                 level.mapcandidate[1]["gametype"] + "^7)");
    iprintlnbold(level.mapcandidate[2]["mapname"] + " (^2" +
                 level.mapcandidate[2]["gametype"] + "^7)");
    iprintlnbold(level.mapcandidate[3]["mapname"] + " (^2" +
                 level.mapcandidate[3]["gametype"] + "^7)");
    iprintlnbold(level.mapcandidate[4]["mapname"] + " (^2" +
                 level.mapcandidate[4]["gametype"] + "^7)");
    wait 7.8;
  }
}
// Changes the players vote as he hits the attack button and updates HUD
PlayerVote(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  level endon("VotingDone");
  // No voting for spectators
  /* if (self.pers["team"] == "spectator")
    novote = true; */
  // Spawn player as spectator
  self spawnSpectator();
  self.sessionstate = "spectator";
  self.spectatorclient = -1;
  resettimeout();
  // remove the scoreboard
  self setClientCvar("g_scriptMainMenu", "");
  self closeMenu();
  if (isdefined(novote))
    return;
  self.votechoice = 5;
  colors[0] = (0, 0, 1);
  colors[1] = (0, 0.5, 1);
  colors[2] = (0, 1, 1);
  colors[3] = (0, 1, 0.5);
  colors[4] = (0, 1, 0);
  self.vote_indicator = newClientHudElem(self);
  self.vote_indicator.alignY = "middle";
  self.vote_indicator.x = 208;
  self.vote_indicator.y = level.hns_mapvotehudoffset + 75;
  self.vote_indicator.archived = false;
  self.vote_indicator.sort = 9998;
  self.vote_indicator.alpha = .3;
  self.vote_indicator.color = colors[0];
  self.vote_indicator setShader("white", 254, 17);
  for(;;) {
    wait .01;
    if (self attackButtonPressed() == true) {
	  self.votechoice++;
      if (self.votechoice >= 5)
        self.votechoice = 0;
      self iprintln("You have voted for ^2" +
                    level.mapcandidate[self.votechoice]["mapname"]);
      self.vote_indicator.y =
          level.hns_mapvotehudoffset + 77 + self.votechoice * 16;
      self.vote_indicator.color = colors[self.votechoice];
      self playLocalSound("hq_score");
    }
    while (self attackButtonPressed() == true)
      wait .01;
    self.sessionstate = "spectator";
    self.spectatorclient = -1;
  }
}
// Determines winning map and sets rotation
VoteLogic(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4, b5, b6, b7, b8,
     b9) {
  // Vote Timer
  for (; level.mapvotetime >= 0; level.mapvotetime--) {
    for (j = 0; j < 10; j++) {
      // Count votes
      for (i = 0; i < 6; i++)
        level.mapcandidate[i]["votes"] = 0;
      players = getentarray("player", "classname");
      for (i = 0; i < players.size; i++)
        if (isdefined(players[i].votechoice))
          level.mapcandidate[players[i].votechoice]["votes"]++;
      // Update HUD
      level.vote_map1 setValue(level.mapcandidate[0]["votes"]);
      level.vote_map2 setValue(level.mapcandidate[1]["votes"]);
      level.vote_map3 setValue(level.mapcandidate[2]["votes"]);
      level.vote_map4 setValue(level.mapcandidate[3]["votes"]);
      level.vote_map5 setValue(level.mapcandidate[4]["votes"]);
      wait .1;
    }
    level.vote_hud_timeleft setValue(level.mapvotetime);
  }
  wait 0.2;
  newmapnum = 0;
  topvotes = 0;
  for (i = 0; i < 5; i++) {
    if (level.mapcandidate[i]["votes"] > topvotes) {
      newmapnum = i;
      topvotes = level.mapcandidate[i]["votes"];
    }
  }
  SetMapWinner(newmapnum);
}
// change the map rotation to represent the current selection
SetMapWinner(winner) {
  map = level.mapcandidate[winner]["map"];
  mapname = level.mapcandidate[winner]["mapname"];
  gametype = level.mapcandidate[winner]["gametype"];
  exec = level.mapcandidate[winner]["exec"];
  // write to cvars
  if (!isdefined(exec))
    exec = "";
  else
    exec = " exec " + exec;
  setcvar("sv_maprotationcurrent",
          exec + " gametype " + gametype + " map " + map);
  wait 0.1;
  // Stop threads
  level notify("VotingDone");
  // Wait for threads to die
  wait 0.05;
  // Announce winner
  iprintlnbold(" ");
  iprintlnbold(" ");
  iprintlnbold(" ");
  iprintlnbold("The winner is");
  iprintlnbold("^2" + mapname);
  iprintlnbold("^2" + getGametypeName(gametype));
  // Fade HUD elements
  level.vote_headerText fadeOverTime(1);
  //	level.vote_hud_votestext fadeOverTime (1);
  level.vote_hud_timeleft fadeOverTime(1);
  level.vote_hud_instructions fadeOverTime(1);
  level.vote_map1 fadeOverTime(1);
  level.vote_map2 fadeOverTime(1);
  level.vote_map3 fadeOverTime(1);
  level.vote_map4 fadeOverTime(1);
  level.vote_map5 fadeOverTime(1);
  level.vote_hud_bgnd fadeOverTime(1);
  level.vote_header fadeOverTime(1);
  level.vote_leftline fadeOverTime(1);
  level.vote_rightline fadeOverTime(1);
  level.vote_bottomline fadeOverTime(1);
  level.vote_headerText.alpha = 0;
  //	level.vote_hud_votestext.alpha = 0;
  level.vote_hud_timeleft.alpha = 0;
  level.vote_hud_instructions.alpha = 0;
  level.vote_map1.alpha = 0;
  level.vote_map2.alpha = 0;
  level.vote_map3.alpha = 0;
  level.vote_map4.alpha = 0;
  level.vote_map5.alpha = 0;
  level.vote_hud_bgnd.alpha = 0;
  level.vote_header.alpha = 0;
  level.vote_leftline.alpha = 0;
  level.vote_rightline.alpha = 0;
  level.vote_bottomline.alpha = 0;
  players = getentarray("player", "classname");
  for (i = 0; i < players.size; i++) {
    if (isdefined(players[i].vote_indicator)) {
      players[i].vote_indicator fadeOverTime(1);
      players[i].vote_indicator.alpha = 0;
    }
  }
  // Show winning map for a few seconds
  wait 4;
  level notify("VotingComplete");
}
// Overrides the player vote's - Incompatible with awe mapvote
_cmd_forcevote(args, adminId) { return; }
PlayerVoteControl(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, b0, b1, b2, b2, b4,
                  b5, b6, b7, b8, b9) {
  return;
}