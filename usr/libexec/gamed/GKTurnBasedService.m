@implementation GKTurnBasedService

+ (unint64_t)requiredEntitlements
{
  return 256;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKTurnBasedServiceInterface, a2);
}

- (void)getTurnBasedMatchesWithHandler:(id)a3
{
  -[GKTurnBasedService getTurnBasedMatchesAndCompatibleBundleID:handler:](self, "getTurnBasedMatchesAndCompatibleBundleID:handler:", 0, a3);
}

- (id)turnsForParticipantIndexes:(id)a3 turnTimeout:(double)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v20[1] = CFSTR("turn-timeout");
        v21[0] = v11;
        v20[0] = CFSTR("next-turn-on-slot");
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber _gkServerTimeInterval:](NSNumber, "_gkServerTimeInterval:", a4));
        v21[1] = v12;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
        objc_msgSend(v6, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  return v6;
}

- (void)createTurnBasedGameForMatchRequest:(id)a3 individualMessages:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  _UNKNOWN **v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v56;
  id obj;
  id v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  GKTurnBasedService *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  GKTurnBasedService *v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  _QWORD v77[5];
  const __CFString *v78;
  uint64_t v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _BYTE v82[128];
  const __CFString *v83;
  void *v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  uint8_t v89[128];
  uint8_t buf[4];
  id v91;

  v7 = a3;
  v58 = a4;
  v8 = a5;
  v54 = v8;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v8);
  v10 = os_log_GKMatch;
  if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v91 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "TBGame - createTurnBasedGameForMatchRequest, matchRequest = %@", buf, 0xCu);
  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recipients"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v74 = 0uLL;
    v75 = 0uLL;
    v72 = 0uLL;
    v73 = 0uLL;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recipients"));
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
    if (!v13)
      goto LABEL_34;
    v15 = v13;
    v56 = v7;
    v16 = *(_QWORD *)v73;
    v17 = &IDSCopyIDForPhoneNumber_ptr;
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v73 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v18);
        v20 = objc_opt_class(v17[96], v14);
        if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
        {
          v87[0] = CFSTR("player-id");
          v21 = v19;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hostPlayerInternal"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "playerID"));
          v88[0] = v23;
          v87[1] = CFSTR("guest-id");
          v24 = v17;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "guestIdentifier"));
          v88[1] = v25;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v88, v87, 2));

          v17 = v24;
LABEL_16:

          goto LABEL_17;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "playerID"));
        v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v22));
        if (v21 || (v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "inviteMessage"))) != 0)
        {
          v85[0] = CFSTR("player-id");
          v85[1] = CFSTR("invite-message");
          v86[0] = v22;
          v86[1] = v21;
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v86, v85, 2));
          goto LABEL_16;
        }
        v83 = CFSTR("player-id");
        v84 = v22;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
LABEL_17:

        objc_msgSend(v59, "addObject:", v26);
        v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
      v15 = v27;
      if (!v27)
      {
        v7 = v56;
        goto LABEL_34;
      }
    }
  }
  v70 = 0uLL;
  v71 = 0uLL;
  v68 = 0uLL;
  v69 = 0uLL;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recipientPlayerIDs"));
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v69;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v69 != v30)
          objc_enumerationMutation(obj);
        v32 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v32));
        if (v33 || (v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inviteMessage"))) != 0)
        {
          v80[0] = CFSTR("player-id");
          v80[1] = CFSTR("invite-message");
          v81[0] = v32;
          v81[1] = v33;
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 2));

        }
        else
        {
          v78 = CFSTR("player-id");
          v79 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1));
        }
        objc_msgSend(v59, "addObject:", v34);

        v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      v29 = v35;
    }
    while (v35);
  }
LABEL_34:

  v76[0] = CFSTR("bucket-id");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "playerGroup")));
  v77[0] = v36;
  v76[1] = CFSTR("min-players");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v7, "maxPlayers")));
  v77[1] = v37;
  v76[2] = CFSTR("max-players");
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", objc_msgSend(v7, "maxPlayers")));
  v77[2] = v38;
  v76[3] = CFSTR("player-attributes");
  v39 = objc_msgSend(v7, "playerAttributes");
  if (v39)
    v40 = v39;
  else
    v40 = 0xFFFFFFFFLL;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%#.8x"), v40));
  v76[4] = CFSTR("invites");
  v77[3] = v41;
  v77[4] = v59;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 5));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v42));

  if (objc_msgSend(v7, "isPreloadedMatch"))
    objc_msgSend(v43, "setObject:forKeyedSubscript:", &off_1002DB628, CFSTR("can-match-existing-session"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 150, "-[GKTurnBasedService createTurnBasedGameForMatchRequest:individualMessages:handler:]"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v44));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "replyQueue"));
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10008ABCC;
  v64[3] = &unk_1002BB4A0;
  v48 = v45;
  v65 = v48;
  v66 = self;
  v67 = v43;
  v49 = v43;
  objc_msgSend(v48, "performOnQueue:block:", v47, v64);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "replyQueue"));
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10008AED8;
  v60[3] = &unk_1002BB568;
  v61 = v48;
  v62 = self;
  v63 = v54;
  v52 = v54;
  v53 = v48;
  objc_msgSend(v53, "notifyOnQueue:block:", v51, v60);

}

- (void)_updateGamesForTurnBasedMatches:(id)a3 dispatchGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10008B408;
    v9[3] = &unk_1002BB4A0;
    v9[4] = self;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkDistinctValuesForKeyPath:", CFSTR("bundleID")));
    v11 = v6;
    v8 = v10;
    objc_msgSend(v7, "perform:", v9);

  }
}

- (void)_determineCompatibleGamesForMatches:(id)a3 dispatchGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id obj;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  GKTurnBasedService *v32;
  id v33;
  id v34;
  _QWORD v35[7];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 223, "-[GKTurnBasedService _determineCompatibleGamesForMatches:dispatchGroup:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v9));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10008B9A4;
    v45[3] = &unk_1002C0288;
    v14 = v12;
    v46 = v14;
    v48 = v9;
    v15 = v13;
    v47 = v15;
    v25 = v6;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v45);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v14;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v27)
    {
      v26 = *(_QWORD *)v42;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v42 != v26)
            objc_enumerationMutation(obj);
          v29 = v16;
          v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v16);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v17));
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(_QWORD *)v38 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_10008BC94;
                v35[3] = &unk_1002BC3A8;
                v35[4] = self;
                v35[5] = v17;
                v35[6] = v23;
                v36 = v15;
                objc_msgSend(v11, "perform:", v35);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            }
            while (v20);
          }

          v16 = v29 + 1;
        }
        while ((id)(v29 + 1) != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v27);
    }

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10008BFA0;
    v30[3] = &unk_1002BC3A8;
    v31 = v11;
    v32 = self;
    v6 = v25;
    v33 = v25;
    v34 = v7;
    v24 = v11;
    objc_msgSend(v34, "perform:", v30);

  }
}

- (void)_determineCompatibleBundleIDForAppID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 platform:(id)a6 withCompletionHandler:(id)a7
{
  id v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[2];

  v12 = a3;
  v13 = (unint64_t)a4;
  v14 = (unint64_t)a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 295, "-[GKTurnBasedService _determineCompatibleBundleIDForAppID:bundleVersion:shortBundleVersion:platform:withCompletionHandler:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v17));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("bundleID"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("bundleVersion"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("shortBundleVersion"));
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("platform"));
  if (v12 && v13 | v14)
  {
    v33[0] = CFSTR("bundle-id");
    v33[1] = CFSTR("bundle-version");
    v34[0] = v12;
    v34[1] = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v19));

    if (v14)
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("short-bundle-version"));
    v21 = objc_msgSend(v15, "integerValue");
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor stringForPlatform:](GKGameDescriptor, "stringForPlatform:", v21));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("platform"));

    }
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10008C3C0;
    v29[3] = &unk_1002BC3A8;
    v29[4] = self;
    v30 = v20;
    v31 = v12;
    v32 = v18;
    v23 = v20;
    objc_msgSend(v32, "perform:", v29);

  }
  if (v16)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10008C870;
    v26[3] = &unk_1002BB450;
    v28 = v16;
    v27 = v18;
    objc_msgSend(v27, "notifyOnQueue:block:", v25, v26);

  }
}

- (void)_determineTurnBasedBadgeCountFromList:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  GKTurnBasedService *v15;
  id v16;

  v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008C9E8;
  v12[3] = &unk_1002BB518;
  v13 = a4;
  v14 = v8;
  v15 = self;
  v16 = a5;
  v9 = v16;
  v10 = v8;
  v11 = v13;
  objc_msgSend(v11, "performBlock:", v12);

}

- (void)loadTurnBasedMatchesForGame:(id)a3 loadDetails:(BOOL)a4 prefetchOnly:(BOOL)a5 context:(id)a6 handler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKTurnBasedService *v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a6;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 415, "-[GKTurnBasedService loadTurnBasedMatchesForGame:loadDetails:prefetchOnly:context:handler:]"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008CE80;
  v17[3] = &unk_1002BB518;
  v18 = v11;
  v19 = self;
  v20 = v10;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v13, v17);

}

- (void)fetchTurnBasedMatchesForGame:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKTurnBasedService *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 468, "-[GKTurnBasedService fetchTurnBasedMatchesForGame:context:handler:]"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008D6D4;
  v15[3] = &unk_1002BB518;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v11, v15);

}

- (void)getTurnBasedMatchesAndCompatibleBundleID:(BOOL)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 501, "-[GKTurnBasedService getTurnBasedMatchesAndCompatibleBundleID:handler:]"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008DC38;
  v9[3] = &unk_1002C0440;
  v9[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v7, v9);

}

- (void)_updatePlayersForMatches:(id)a3 group:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;
  GKTurnBasedService *v9;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008E9F0;
  v7[3] = &unk_1002BB590;
  v8 = a3;
  v9 = self;
  v6 = v8;
  objc_msgSend(a4, "perform:", v7);

}

- (void)fetchDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 responseKind:(int)a5 context:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  GKTurnBasedService *v21;
  id v22;
  id v23;
  int v24;
  BOOL v25;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 639, "-[GKTurnBasedService fetchDetailsForTurnBasedMatchIDs:includeGameData:responseKind:context:handler:]"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008F16C;
  v19[3] = &unk_1002C0558;
  v20 = v13;
  v21 = self;
  v24 = a5;
  v25 = a4;
  v22 = v12;
  v23 = v14;
  v16 = v14;
  v17 = v12;
  v18 = v13;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v15, v19);

}

- (void)loadDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKTurnBasedService *v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 705, "-[GKTurnBasedService loadDetailsForTurnBasedMatchIDs:includeGameData:context:handler:]"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008F950;
  v17[3] = &unk_1002BC058;
  v18 = v11;
  v19 = self;
  v22 = a4;
  v20 = v10;
  v21 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v13, v17);

}

- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 prefetchOnly:(BOOL)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 771, "-[GKTurnBasedService getDetailsForTurnBasedMatchIDs:includeGameData:prefetchOnly:handler:]"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100090278;
  v15[3] = &unk_1002C0690;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v15[4] = self;
  v19 = a4;
  v13 = v10;
  v14 = v11;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v12, v15);

}

- (void)getDetailsForTurnBasedMatchIDs:(id)a3 includeGameData:(BOOL)a4 handler:(id)a5
{
  -[GKTurnBasedService getDetailsForTurnBasedMatchIDs:includeGameData:prefetchOnly:handler:](self, "getDetailsForTurnBasedMatchIDs:includeGameData:prefetchOnly:handler:", a3, a4, 0, a5);
}

- (void)acceptInviteForTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __objc2_meth_list *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  GKTurnBasedService *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  GKTurnBasedService *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  GKTurnBasedService *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 832, "-[GKTurnBasedService acceptInviteForTurnBasedMatch:handler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchID"));
  v12 = &OBJC_INSTANCE_METHODS_GKTurnBasedMultiplayerTurnReminderBulletin;
  if (v11)
  {
    v35 = v10;
    v38 = v7;
    v37 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v13, "clearTurnBasedBulletinsForMatchID:", v11);

    v36 = self;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "credential"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playerInternal"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playerID"));

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "participants"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "playerID"));
          if ((objc_msgSend(v24, "isEqualToString:", v17) & 1) != 0)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "status"));
            v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("Invited"));

            if (!v26)
            {
              v8 = v37;
              v10 = v35;
              self = v36;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v20);
    }

    self = v36;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](v36, "clientProxy"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "replyQueue"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100090EC8;
    v44[3] = &unk_1002BC010;
    v10 = v35;
    v45 = v35;
    v46 = v11;
    v47 = v6;
    v8 = v37;
    v48 = v37;
    v49 = v36;
    objc_msgSend(v45, "performOnQueue:block:", v28, v44);

    v18 = v45;
LABEL_15:

    v7 = v38;
    v12 = &OBJC_INSTANCE_METHODS_GKTurnBasedMultiplayerTurnReminderBulletin;
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v10, "setError:", v29);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "replyQueue"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = v12[254];
  v39[2] = sub_100091280;
  v39[3] = &unk_1002BB518;
  v40 = v11;
  v41 = v10;
  v42 = self;
  v43 = v7;
  v32 = v7;
  v33 = v10;
  v34 = v11;
  objc_msgSend(v33, "notifyOnQueue:block:", v31, v39);

}

- (void)declineInviteForTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  GKTurnBasedService *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  GKTurnBasedService *v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 925, "-[GKTurnBasedService declineInviteForTurnBasedMatch:handler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "matchID"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v12, "clearTurnBasedBulletinsForMatchID:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100091AE0;
    v26[3] = &unk_1002BC010;
    v27 = v10;
    v28 = v11;
    v29 = v6;
    v30 = v8;
    v31 = self;
    objc_msgSend(v27, "performOnQueue:block:", v14, v26);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v10, "setError:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100091ECC;
  v21[3] = &unk_1002BB518;
  v22 = v11;
  v23 = v10;
  v24 = self;
  v25 = v7;
  v18 = v7;
  v19 = v10;
  v20 = v11;
  objc_msgSend(v19, "notifyOnQueue:block:", v17, v21);

}

- (void)removeTurnBasedMatch:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  GKTurnBasedService *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  GKTurnBasedService *v30;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 988, "-[GKTurnBasedService removeTurnBasedMatch:handler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "matchID"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v12, "clearTurnBasedBulletinsForMatchID:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100092530;
    v26[3] = &unk_1002BC3A8;
    v27 = v10;
    v28 = v11;
    v29 = v8;
    v30 = self;
    objc_msgSend(v27, "performOnQueue:block:", v14, v26);

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v10, "setError:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10009286C;
  v21[3] = &unk_1002BB518;
  v22 = v11;
  v23 = v10;
  v24 = self;
  v25 = v6;
  v18 = v6;
  v19 = v10;
  v20 = v11;
  objc_msgSend(v19, "notifyOnQueue:block:", v17, v21);

}

- (void)submitTurnForTurnBasedMatch:(id)a3 nextParticipantIndexes:(id)a4 turnTimeout:(double)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  GKTurnBasedService *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  GKTurnBasedService *v35;
  id v36;
  id v37;
  double v38;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1041, "-[GKTurnBasedService submitTurnForTurnBasedMatch:nextParticipantIndexes:turnTimeout:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchID"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v17, "clearTurnBasedBulletinsForMatchID:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100092D08;
    v31[3] = &unk_1002BFC98;
    v32 = v15;
    v33 = v16;
    v34 = v10;
    v35 = self;
    v36 = v11;
    v38 = a5;
    v37 = v13;
    objc_msgSend(v32, "performOnQueue:block:", v19, v31);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v15, "setError:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000931C8;
  v26[3] = &unk_1002BB518;
  v27 = v16;
  v28 = v15;
  v29 = self;
  v30 = v12;
  v23 = v12;
  v24 = v15;
  v25 = v16;
  objc_msgSend(v24, "notifyOnQueue:block:", v22, v26);

}

- (void)saveDataForTurnBasedMatch:(id)a3 resolvedExchangeIDs:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  GKTurnBasedService *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  GKTurnBasedService *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1116, "-[GKTurnBasedService saveDataForTurnBasedMatch:resolvedExchangeIDs:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "matchID"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v15, "clearTurnBasedBulletinsForMatchID:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100093864;
    v29[3] = &unk_1002BEC90;
    v30 = v13;
    v31 = v14;
    v32 = v8;
    v33 = v9;
    v34 = v11;
    v35 = self;
    objc_msgSend(v30, "performOnQueue:block:", v17, v29);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v13, "setError:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100093CB8;
  v24[3] = &unk_1002BB518;
  v25 = v14;
  v26 = v13;
  v27 = self;
  v28 = v10;
  v21 = v10;
  v22 = v13;
  v23 = v14;
  objc_msgSend(v22, "notifyOnQueue:block:", v20, v24);

}

- (void)resignFromTurnBasedGame:(id)a3 outcome:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  GKTurnBasedService *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  GKTurnBasedService *v31;
  unint64_t v32;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1176, "-[GKTurnBasedService resignFromTurnBasedGame:outcome:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "matchID"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100094254;
    v27[3] = &unk_1002BF3C0;
    v28 = v12;
    v29 = v13;
    v31 = self;
    v32 = a4;
    v30 = v10;
    objc_msgSend(v28, "performOnQueue:block:", v15, v27);

  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v12, "setError:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10009459C;
  v22[3] = &unk_1002BB518;
  v23 = v13;
  v24 = v12;
  v25 = self;
  v26 = v8;
  v19 = v8;
  v20 = v12;
  v21 = v13;
  objc_msgSend(v20, "notifyOnQueue:block:", v18, v22);

}

- (id)_requestForTurnBasedSubmitValues:(id)a3 withServerLabel:(id)a4 sessionID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];

  v7 = a3;
  v8 = a4;
  v25 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playerID"));
        if (v16)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v16));
          if (!v17)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("player-id"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, v8);

            objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v16);
          }
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v8));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serverRepresentation"));
          objc_msgSend(v19, "addObject:", v20);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v21 = v25;
    v30[0] = CFSTR("session-id");
    v30[1] = CFSTR("players");
    v31[0] = v25;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
    v31[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));

  }
  else
  {
    v23 = 0;
    v21 = v25;
  }

  return v23;
}

- (void)completeTurnBasedMatch:(id)a3 scores:(id)a4 achievements:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  GKTurnBasedService *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  GKTurnBasedService *v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1259, "-[GKTurnBasedService completeTurnBasedMatch:scores:achievements:handler:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "matchID"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
    objc_msgSend(v18, "clearTurnBasedBulletinsForMatchID:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v33 = v13;
    v20 = v12;
    v21 = v11;
    v22 = v10;
    v23 = v14;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replyQueue"));
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100094EEC;
    v41[3] = &unk_1002BC010;
    v42 = v16;
    v43 = v17;
    v44 = v22;
    v45 = v23;
    v46 = self;
    objc_msgSend(v42, "performOnQueue:block:", v24, v41);

    v14 = v23;
    v10 = v22;
    v11 = v21;
    v12 = v20;
    v13 = v33;

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v16, "setError:", v25);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "replyQueue"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10009537C;
  v34[3] = &unk_1002BE880;
  v35 = v17;
  v36 = self;
  v37 = v16;
  v38 = v11;
  v39 = v12;
  v40 = v13;
  v28 = v13;
  v29 = v12;
  v30 = v11;
  v31 = v16;
  v32 = v17;
  objc_msgSend(v31, "notifyOnQueue:block:", v27, v34);

}

- (void)sendExchangeToParticipants:(id)a3 data:(id)a4 message:(id)a5 timeout:(double)a6 match:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  GKTurnBasedService *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  GKTurnBasedService *v50;
  id v51;
  double v52;
  _QWORD v53[4];
  id v54;
  id v55;

  v36 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v38 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1360, "-[GKTurnBasedService sendExchangeToParticipants:data:message:timeout:match:handler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "context"));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100095F00;
  v53[3] = &unk_1002BB658;
  v22 = v17;
  v54 = v22;
  v23 = v20;
  v55 = v23;
  objc_msgSend(v21, "performBlockAndWait:", v53);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyQueue"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100095F98;
  v44[3] = &unk_1002BEA88;
  v45 = v16;
  v46 = v36;
  v52 = a6;
  v47 = v15;
  v48 = v14;
  v49 = v18;
  v50 = self;
  v26 = v23;
  v51 = v26;
  v37 = v18;
  v27 = v14;
  v28 = v15;
  v29 = v36;
  v30 = v16;
  objc_msgSend(v26, "performOnQueue:block:", v25, v44);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "replyQueue"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100096204;
  v39[3] = &unk_1002BB518;
  v40 = v26;
  v41 = v22;
  v42 = self;
  v43 = v38;
  v33 = v38;
  v34 = v22;
  v35 = v26;
  objc_msgSend(v35, "notifyOnQueue:block:", v32, v39);

}

- (void)sendRequest:(id)a3 forBagKey:(id)a4 exchange:(id)a5 matchID:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  GKTurnBasedService *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  GKTurnBasedService *v40;

  v27 = a3;
  v26 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1416, "-[GKTurnBasedService sendRequest:forBagKey:exchange:matchID:responseHandler:]"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v16));

  if (v13)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "replyQueue"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100096904;
    v34[3] = &unk_1002BEC90;
    v35 = v17;
    v36 = v13;
    v37 = v15;
    v38 = v27;
    v39 = v26;
    v40 = self;
    objc_msgSend(v35, "performOnQueue:block:", v19, v34);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100096B24;
  v28[3] = &unk_1002BB4C8;
  v29 = v13;
  v30 = v17;
  v31 = self;
  v32 = v12;
  v33 = v14;
  v22 = v14;
  v23 = v12;
  v24 = v17;
  v25 = v13;
  objc_msgSend(v24, "notifyOnQueue:block:", v21, v28);

}

- (void)cancelExchange:(id)a3 withMessage:(id)a4 match:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v17[0] = CFSTR("session-id");
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "matchID"));
  v18[0] = v14;
  v18[1] = v13;
  v17[1] = CFSTR("request-id");
  v17[2] = CFSTR("notification-message");
  v18[2] = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "matchID"));
  -[GKTurnBasedService sendRequest:forBagKey:exchange:matchID:responseHandler:](self, "sendRequest:forBagKey:exchange:matchID:responseHandler:", v15, CFSTR("gk-tb-cancel-request"), v13, v16, v10);

}

- (void)replyToExchange:(id)a3 withMessage:(id)a4 data:(id)a5 match:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  _QWORD v22[4];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v21[0] = CFSTR("session-id");
  v15 = a7;
  v16 = a6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchID"));
  v22[0] = v17;
  v22[1] = v12;
  v21[1] = CFSTR("request-id");
  v21[2] = CFSTR("notification-message");
  v22[2] = v13;
  v21[3] = CFSTR("data");
  v18 = v14;
  if (!v14)
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v22[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 4));
  if (!v14)

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "matchID"));
  -[GKTurnBasedService sendRequest:forBagKey:exchange:matchID:responseHandler:](self, "sendRequest:forBagKey:exchange:matchID:responseHandler:", v19, CFSTR("gk-tb-send-reply"), v12, v20, v15);

}

- (void)getNextTurnBasedEventWithHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  signed int v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  const __CFString *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "getNextTurnBasedEventWithHandler called", (uint8_t *)&v22, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "gameDescriptor"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "acceptedInviteManager"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "turnBasedInviteForGame:", v9));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "matchID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "exchangeID"));
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v16 = objc_msgSend(v13, "pushCommand");
  v17 = objc_msgSend(v13, "userTapped");
  if (v5)
  {
    v18 = v17;
    if (!os_log_GKGeneral)
      v19 = (id)GKOSLoggers(v17);
    v20 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("NO");
      v22 = 138413058;
      v23 = v14;
      v24 = 2112;
      if ((_DWORD)v18)
        v21 = CFSTR("YES");
      v25 = v15;
      v26 = 2048;
      v27 = v16;
      v28 = 2112;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "getNextTurnBasedEventWithHandler matchID: %@ exchangeID:%@ command: %ld userTapped:%@", (uint8_t *)&v22, 0x2Au);
    }
    ((void (**)(_QWORD, void *, void *, _QWORD, id, _QWORD))v5)[2](v5, v14, v15, v16, v18, 0);
  }

}

- (void)sendReminderToParticipants:(id)a3 message:(id)a4 match:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  GKTurnBasedService *v32;
  id v33;
  _QWORD v34[4];
  _QWORD v35[4];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1518, "-[GKTurnBasedService sendReminderToParticipants:message:match:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v34[0] = CFSTR("session-id");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "matchID"));

  v35[0] = v17;
  v35[1] = v11;
  v34[1] = CFSTR("localized-message");
  v34[2] = CFSTR("participants");
  v35[2] = v10;
  v34[3] = CFSTR("push-token");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pushToken"));
  v19 = v18;
  if (!v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v35[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 4));
  if (!v18)

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100097720;
  v29[3] = &unk_1002BC3A8;
  v21 = v16;
  v30 = v21;
  v22 = v20;
  v31 = v22;
  v32 = self;
  v23 = v15;
  v33 = v23;
  objc_msgSend(v23, "perform:", v29);
  if (v12)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100097838;
    v26[3] = &unk_1002BB450;
    v28 = v12;
    v27 = v23;
    objc_msgSend(v27, "notifyOnQueue:block:", v25, v26);

  }
}

- (void)loadURLWithTBGMatch:(id)a3 player:(id)a4 matchRequest:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
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
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  GKTurnBasedService *v42;
  id v43;

  v9 = a3;
  v10 = a6;
  v11 = a4;
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", CFSTR("loadRecordURL")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));
  objc_msgSend(v12, "setObject:forKey:", v15, CFSTR("bundle-id"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bundleVersion"));
  objc_msgSend(v12, "setObject:forKey:", v17, CFSTR("bundle-version"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));
  objc_msgSend(v12, "setObject:forKey:", v18, CFSTR("playerID"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleShortVersion"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bundleShortVersion"));
    objc_msgSend(v12, "setObject:forKey:", v22, CFSTR("short-bundle-version"));

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "adamID"));

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "adamID"));
    objc_msgSend(v12, "setObject:forKey:", v26, CFSTR("adam-id"));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "matchID"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "matchID"));
    objc_msgSend(v12, "setObject:forKey:", v28, CFSTR("session-id"));

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  objc_msgSend(v12, "setObject:forKey:", v29, CFSTR("turn-count"));

  objc_msgSend(v12, "setObject:forKey:", &off_1002DB658, CFSTR("invite-type"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, 0));
  v31 = objc_msgSend(objc_alloc((Class)CKRecordZoneID), "initWithZoneName:ownerName:", CFSTR("com.apple.legacygaming.invites"), CKCurrentUserDefaultName);
  v32 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:zoneID:", CFSTR("LegacyMultiplayerInvites"), v31);
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v30, CFSTR("connectionData"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100097C44;
  v40[3] = &unk_1002BB4A0;
  v41 = v32;
  v42 = self;
  v33 = v13;
  v43 = v33;
  v34 = v32;
  objc_msgSend(v33, "perform:", v40);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100097E5C;
  v37[3] = &unk_1002BB450;
  v38 = v33;
  v39 = v10;
  v35 = v33;
  v36 = v10;
  objc_msgSend(v35, "notifyOnQueue:block:", &_dispatch_main_q, v37);

}

- (void)reserveShareParticipantSlots:(int64_t)a3 minPlayerCount:(int64_t)a4 maxPlayerCount:(int64_t)a5 andInvitePlayers:(id)a6 withMessage:(id)a7 forMatch:(id)a8 handler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  GKTurnBasedService *v38;
  id v39;
  int64_t v40;
  int64_t v41;
  int64_t v42;

  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1605, "-[GKTurnBasedService reserveShareParticipantSlots:minPlayerCount:maxPlayerCount:andInvitePlayers:withMessage:forMatch:handler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000980F8;
  v34[3] = &unk_1002C0720;
  v40 = a3;
  v41 = a4;
  v42 = a5;
  v35 = v16;
  v36 = v14;
  v37 = v15;
  v38 = self;
  v22 = v19;
  v39 = v22;
  v23 = v15;
  v24 = v14;
  v25 = v16;
  objc_msgSend(v22, "performOnQueue:block:", v21, v34);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "replyQueue"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10009849C;
  v31[3] = &unk_1002BB450;
  v32 = v22;
  v33 = v17;
  v28 = v22;
  v29 = v17;
  objc_msgSend(v28, "notifyOnQueue:block:", v27, v31);

}

- (id)privateDatabase
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", CFSTR("com.apple.socialgaming.sessions")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "privateCloudDatabase"));

  return v3;
}

- (void)saveRecord:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  GKTurnBasedService *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)CKModifyRecordsOperation);
  v19 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v10 = objc_msgSend(v8, "initWithRecordsToSave:recordIDsToDelete:", v9, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKCloudGameSession cloudKitOperationConfigurationForSocialGamingSessionsContainer](GKCloudGameSession, "cloudKitOperationConfigurationForSocialGamingSessionsContainer"));
  objc_msgSend(v10, "setConfiguration:", v11);

  objc_msgSend(v10, "setSavePolicy:", 1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000986B4;
  v15[3] = &unk_1002BFEF0;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "setModifyRecordsCompletionBlock:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKTurnBasedService privateDatabase](self, "privateDatabase"));
  objc_msgSend(v14, "addOperation:", v10);

}

@end
