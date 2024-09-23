@implementation GKTurnBasedMatchInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKTurnBasedMatchInternal(Cache) updateWithCacheObject:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKInternalRepresentation+Cache.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKTurnBasedMatchInternal(Cache) updateWithCacheObject:]", objc_msgSend(v10, "UTF8String"), 308));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
  -[GKTurnBasedMatchInternal setMatchID:](self, "setMatchID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "status"));
  -[GKTurnBasedMatchInternal setStatus:](self, "setStatus:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  -[GKTurnBasedMatchInternal setCreationDate:](self, "setCreationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastTurnDate"));
  -[GKTurnBasedMatchInternal setLastTurnDate:](self, "setLastTurnDate:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
  -[GKTurnBasedMatchInternal setMessage:](self, "setMessage:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizableMessage"));
  v20 = +[NSPropertyListSerialization _gkTypesafePropertyListWithData:withClass:](NSPropertyListSerialization, "_gkTypesafePropertyListWithData:withClass:", v18, objc_opt_class(NSDictionary, v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  -[GKTurnBasedMatchInternal setLocalizableMessage:](self, "setLocalizableMessage:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reason"));
  -[GKTurnBasedMatchInternal setReason:](self, "setReason:", v22);

  -[GKTurnBasedMatchInternal setMinPlayers:](self, "setMinPlayers:", objc_msgSend(v4, "minPlayers"));
  -[GKTurnBasedMatchInternal setMaxPlayers:](self, "setMaxPlayers:", objc_msgSend(v4, "maxPlayers"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deletionDate"));
  -[GKTurnBasedMatchInternal setDeletionDate:](self, "setDeletionDate:", v23);

  -[GKTurnBasedMatchInternal setCurrentParticipant:](self, "setCurrentParticipant:", (char)objc_msgSend(v4, "currentParticipant"));
  -[GKTurnBasedMatchInternal setTurnNumber:](self, "setTurnNumber:", objc_msgSend(v4, "turnNumber"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastTurnPlayerID"));
  -[GKTurnBasedMatchInternal setLastTurnPlayerID:](self, "setLastTurnPlayerID:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gameData"));
  -[GKTurnBasedMatchInternal setMatchData:](self, "setMatchData:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "matchDataVersion"));
  -[GKTurnBasedMatchInternal setMatchDataVersion:](self, "setMatchDataVersion:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
  -[GKTurnBasedMatchInternal setBundleID:](self, "setBundleID:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleVersion"));
  -[GKTurnBasedMatchInternal setBundleVersion:](self, "setBundleVersion:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortBundleVersion"));
  -[GKTurnBasedMatchInternal setShortBundleVersion:](self, "setShortBundleVersion:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "participants"));
  v31 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPlayerID"));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPlayerID"));
    objc_msgSend(v31, "addObject:", v33);

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_gkValuesForKeyPath:", CFSTR("playerID")));
  objc_msgSend(v31, "addObjectsFromArray:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_gkValuesForKeyPath:", CFSTR("invitedBy")));
  objc_msgSend(v31, "addObjectsFromArray:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "allObjects"));
  v51 = (void *)v12;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfilesWithPlayerIDs:inManagedObjectContext:", v36, v12));

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "_gkValuesForKeyPath:", CFSTR("internalRepresentation")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "_gkMapDictionaryWithKeyPath:", CFSTR("playerID")));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPlayerID"));
  v41 = objc_msgSend(v40, "length");

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentPlayerID"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", v42));
    -[GKTurnBasedMatchInternal setCurrentPlayer:](self, "setCurrentPlayer:", v43);

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "participants"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "array"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10011C748;
  v52[3] = &unk_1002C3EA8;
  v53 = v39;
  v46 = v39;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "_gkMapWithBlock:", v52));
  -[GKTurnBasedMatchInternal setParticipants:](self, "setParticipants:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exchanges"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "array"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "_gkMapWithBlock:", &stru_1002C3EE8));
  -[GKTurnBasedMatchInternal setExchanges:](self, "setExchanges:", v50);

}

@end
