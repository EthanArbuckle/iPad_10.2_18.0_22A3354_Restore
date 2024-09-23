@implementation GKGameStatService

+ (unint64_t)requiredEntitlements
{
  return 16;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKGameStatServiceInterface, a2);
}

- (void)_getRecentMatchesForGameDescriptor:(id)a3 type:(int)a4 reference:(id)a5 handler:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  GKGameStatService *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  GKGameStatService *v40;
  id v41;
  id v42;
  int v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[2];
  _QWORD v51[2];

  v7 = *(_QWORD *)&a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dictionaryForRequest"));
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "gameDescriptor"));

  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundle-id")));
  v31 = (void *)v14;
  if ((_DWORD)v7 == 3)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("game.bundleID = %@ AND type = %d AND reference = %@"), v14, 3, v10));
    v46[0] = CFSTR("game");
    v46[1] = CFSTR("match-type");
    v47[0] = v12;
    v47[1] = CFSTR("achievement-compatible");
    v46[2] = CFSTR("achievement-id");
    v47[2] = v10;
    v16 = v47;
    v17 = v46;
  }
  else
  {
    if ((_DWORD)v7 != 2)
    {
      if ((_DWORD)v7 == 1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("game.bundleID = %@ AND type = %d"), v14, 1));
        v50[0] = CFSTR("game");
        v50[1] = CFSTR("match-type");
        v51[0] = v12;
        v51[1] = CFSTR("multiplayer-compatible");
        v16 = v51;
        v17 = v50;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("game.bundleID = %@ AND type = %d"), v14, v7));
        v44[0] = CFSTR("game");
        v44[1] = CFSTR("match-type");
        v45[0] = v12;
        v45[1] = CFSTR("exact-match");
        v16 = v45;
        v17 = v44;
      }
      v18 = 2;
      goto LABEL_12;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("game.bundleID = %@ AND type = %d AND reference = %@"), v14, 2, v10));
    v48[0] = CFSTR("game");
    v48[1] = CFSTR("match-type");
    v49[0] = v12;
    v49[1] = CFSTR("leaderboard-compatible");
    v48[2] = CFSTR("leaderboard-id");
    v49[2] = v10;
    v16 = v49;
    v17 = v48;
  }
  v18 = 3;
LABEL_12:
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v17, v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 118, "-[GKGameStatService _getRecentMatchesForGameDescriptor:type:reference:handler:]"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "replyQueue"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100057FC8;
  v36[3] = &unk_1002BEA10;
  v24 = v21;
  v37 = v24;
  v25 = v15;
  v38 = v25;
  v26 = v19;
  v39 = v26;
  v40 = self;
  v43 = v7;
  v27 = v10;
  v41 = v27;
  v28 = v12;
  v42 = v28;
  objc_msgSend(v24, "performOnQueue:block:", v23, v36);

  if (v11)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "replyQueue"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000588B0;
    v32[3] = &unk_1002BB568;
    v33 = v24;
    v34 = self;
    v35 = v11;
    objc_msgSend(v33, "notifyOnQueue:block:", v30, v32);

  }
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 leaderboardIdentifier:(id)a4 handler:(id)a5
{
  -[GKGameStatService _getRecentMatchesForGameDescriptor:type:reference:handler:](self, "_getRecentMatchesForGameDescriptor:type:reference:handler:", a3, 2, a4, a5);
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 achievementIdentifier:(id)a4 handler:(id)a5
{
  -[GKGameStatService _getRecentMatchesForGameDescriptor:type:reference:handler:](self, "_getRecentMatchesForGameDescriptor:type:reference:handler:", a3, 3, a4, a5);
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 includeCompatibleMultiplayerGames:(BOOL)a4 handler:(id)a5
{
  -[GKGameStatService _getRecentMatchesForGameDescriptor:type:reference:handler:](self, "_getRecentMatchesForGameDescriptor:type:reference:handler:", a3, a4, 0, a5);
}

- (void)fetchRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  GKGameStatService *v18;
  id v19;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100058C14;
  v14[3] = &unk_1002BB4C8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = self;
  v19 = a6;
  v10 = v19;
  v11 = v17;
  v12 = v16;
  v13 = v15;
  objc_msgSend(v11, "performBlock:", v14);

}

- (void)fetchRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  GKGameStatService *v18;
  id v19;

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100058EAC;
  v14[3] = &unk_1002BB4C8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = self;
  v19 = a6;
  v10 = v19;
  v11 = v17;
  v12 = v16;
  v13 = v15;
  objc_msgSend(v11, "performBlock:", v14);

}

- (void)loadRecentPlayersWithPlayer:(id)a3 game:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  GKGameStatService *v35;
  id v36;
  id v37;
  _QWORD *v38;
  id v39;
  _QWORD v40[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 296, "-[GKGameStatService loadRecentPlayersWithPlayer:game:context:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v14, v12, v15));

  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v18 = objc_msgSend(v17, "maxRecentPlayersCount");
  objc_msgSend(v17, "maxRecentPlayersTime");
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000592F4;
  v32[3] = &unk_1002BEAD8;
  v39 = v18;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v19));
  v33 = v20;
  v21 = v11;
  v34 = v21;
  v35 = self;
  v38 = v40;
  v22 = v16;
  v36 = v22;
  v23 = v10;
  v37 = v23;
  objc_msgSend(v22, "performOnManagedObjectContext:", v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyQueue"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100059E20;
  v28[3] = &unk_1002BBD40;
  v26 = v13;
  v30 = v26;
  v31 = v40;
  v27 = v22;
  v29 = v27;
  objc_msgSend(v27, "notifyOnQueue:block:", v25, v28);

  _Block_object_dispose(v40, 8);
}

- (void)loadRecentGamesBetweenPlayer:(id)a3 otherPlayer:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD *v36;
  _QWORD v37[4];
  id v38;
  GKGameStatService *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 375, "-[GKGameStatService loadRecentGamesBetweenPlayer:otherPlayer:context:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v14, v12, v15));

  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v18 = objc_msgSend(v17, "maxRecentPlayersCount");
  objc_msgSend(v17, "maxRecentPlayersTime");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v19));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_10005A194;
  v45[3] = &unk_1002BEB00;
  v21 = v16;
  v46 = v21;
  v49 = v18;
  v22 = v20;
  v47 = v22;
  v23 = v11;
  v48 = v23;
  objc_msgSend(v12, "performBlockAndWait:", v45);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10005A2A0;
  v37[3] = &unk_1002BEB28;
  v24 = v21;
  v38 = v24;
  v39 = self;
  v44 = v50;
  v25 = v12;
  v40 = v25;
  v26 = v10;
  v41 = v26;
  v27 = v23;
  v42 = v27;
  v28 = v22;
  v43 = v28;
  objc_msgSend(v24, "perform:", v37);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "replyQueue"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10005AC8C;
  v33[3] = &unk_1002BBD40;
  v31 = v13;
  v35 = v31;
  v36 = v50;
  v32 = v24;
  v34 = v32;
  objc_msgSend(v32, "notifyOnQueue:block:", v30, v33);

  _Block_object_dispose(v50, 8);
}

- (void)getRecentPlayersForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  GKGameStatService *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 453, "-[GKGameStatService getRecentPlayersForGameDescriptor:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005AE94;
  v19[3] = &unk_1002BB4A0;
  v12 = v9;
  v20 = v12;
  v13 = v6;
  v21 = v13;
  v22 = self;
  objc_msgSend(v12, "performOnQueue:block:", v11, v19);

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005B644;
    v16[3] = &unk_1002BB450;
    v18 = v7;
    v17 = v12;
    objc_msgSend(v17, "notifyOnQueue:block:", v15, v16);

  }
}

- (void)getRecentGamesWithPlayer:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKGameStatService *v18;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 507, "-[GKGameStatService getRecentGamesWithPlayer:handler:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005B858;
  v16[3] = &unk_1002BB590;
  v10 = v7;
  v17 = v10;
  v18 = self;
  objc_msgSend(v10, "performOnQueue:block:", v9, v16);

  if (v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10005BF8C;
    v13[3] = &unk_1002BB450;
    v15 = v5;
    v14 = v10;
    objc_msgSend(v14, "notifyOnQueue:block:", v12, v13);

  }
}

- (void)getRecentMatchesForGameDescriptor:(id)a3 otherPlayer:(id)a4 handler:(id)a5
{
  if (a4)
    -[GKGameStatService getRecentGamesWithPlayer:handler:](self, "getRecentGamesWithPlayer:handler:", a4, a5);
  else
    -[GKGameStatService getRecentPlayersForGameDescriptor:handler:](self, "getRecentPlayersForGameDescriptor:handler:", a3, a5);
}

- (void)getRecentPlayersWithHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005C0B0;
  v5[3] = &unk_1002BEB78;
  v6 = a3;
  v4 = v6;
  -[GKGameStatService getRecentPlayersForGameDescriptor:handler:](self, "getRecentPlayersForGameDescriptor:handler:", 0, v5);

}

- (void)fetchAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005C180;
  v10[3] = &unk_1002BB568;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v7 = v13;
  v8 = v12;
  v9 = v11;
  objc_msgSend(v8, "performBlock:", v10);

}

- (void)loadAchievementDescriptionsForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  GKGameStatService *v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[4];
  _QWORD v32[5];
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_10005C4A4;
  v32[4] = sub_10005C4B4;
  v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 603, "-[GKGameStatService loadAchievementDescriptionsForGameDescriptor:context:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v11, v9, v12));

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005C4BC;
  v24[3] = &unk_1002BEC18;
  v14 = v8;
  v25 = v14;
  v29 = v32;
  v15 = v10;
  v28 = v15;
  v30 = v31;
  v16 = v13;
  v26 = v16;
  v27 = self;
  objc_msgSend(v16, "performOnManagedObjectContext:", v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005CDAC;
  v20[3] = &unk_1002BEC40;
  v19 = v16;
  v21 = v19;
  v22 = v32;
  v23 = v31;
  objc_msgSend(v19, "notifyOnQueue:block:", v18, v20);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);

}

+ (id)friendsRequiringHydration:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableSet);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = v3;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("results")));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v8);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("friends-with-achievement")));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v14), "objectForKeyedSubscript:", CFSTR("friend-player-id")));
              objc_msgSend(v4, "addObject:", v15);

              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  v16 = objc_msgSend(v4, "copy");
  return v16;
}

+ (id)getFriendsWhoHaveTheseAchievementsPredicate:(id)a3 playerID:(id)a4 gameBundleID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[2];

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("game.bundleID == %@"), a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("achievementDescription.identifier IN %@"), v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("achievementDescription.groupIdentifier IN %@"), v8));

  v19[0] = v10;
  v19[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("player.playerID == %@"), v7));
  v18[0] = v14;
  v18[1] = v9;
  v18[2] = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));

  return v16;
}

- (id)getFriendsWhoHaveTheseAchievements:(id)a3 playerID:(id)a4 gameBundleID:(id)a5 context:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *k;
  void *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  os_signpost_id_t spid;
  void *v51;
  void *v52;
  unint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id obj;
  uint64_t v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  id v75;
  uint8_t buf[16];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "count"))
  {
    v13 = os_signpost_id_generate(os_log_GKPerf);
    v14 = os_log_GKPerf;
    v15 = v14;
    v53 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "FriendsWhoHaveThisQuery", ", buf, 2u);
    }

    v57 = v11;
    v16 = objc_claimAutoreleasedReturnValue(+[GKGameStatService getFriendsWhoHaveTheseAchievementsPredicate:playerID:gameBundleID:](GKGameStatService, "getFriendsWhoHaveTheseAchievementsPredicate:playerID:gameBundleID:", v9, v10, v11));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheObject fetchRequestForContext:](GKAchievementThatAFriendHasListCacheObject, "fetchRequestForContext:", v12));
    v55 = (void *)v16;
    objc_msgSend(v17, "setPredicate:", v16);
    v75 = 0;
    v54 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeFetchRequest:error:", v17, &v75));
    v19 = v75;
    v20 = v19;
    if (v19)
    {
      if (!os_log_GKGeneral)
        v21 = (id)GKOSLoggers(v19);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100071E8C();
    }
    v52 = v20;
    spid = v13;
    v56 = v12;
    v58 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v18, "count")));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v23 = v18;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v72 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "achievementDescription"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "achievementDescription"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "groupIdentifier"));

          if (objc_msgSend(v30, "length"))
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v30);
          if (objc_msgSend(v32, "length"))
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v32);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      }
      while (v25);
    }
    v51 = v23;

    v62 = objc_alloc_init((Class)NSMutableArray);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v59 = v9;
    obj = v9;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v33)
    {
      v34 = v33;
      v61 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(_QWORD *)v68 != v61)
            objc_enumerationMutation(obj);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)j)));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "entries"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v37, "count")));

          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "entries"));
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v64;
            do
            {
              for (k = 0; k != v41; k = (char *)k + 1)
              {
                if (*(_QWORD *)v64 != v42)
                  objc_enumerationMutation(v39);
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1)
                                                                                   + 8 * (_QWORD)k), "internalRepresentation"));
                objc_msgSend(v38, "addObject:", v44);

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
            }
            while (v41);
          }

          v45 = objc_msgSend(v38, "copy");
          objc_msgSend(v62, "addObject:", v45);

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v34);
    }

    v46 = os_log_GKPerf;
    v47 = v46;
    v10 = v58;
    if (v53 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, spid, "FriendsWhoHaveThisQuery", ", buf, 2u);
    }

    v48 = objc_msgSend(v62, "copy");
    v9 = v59;
    v12 = v56;
    v11 = v57;
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

- (void)getAchievementDescriptionsForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 796, "-[GKGameStatService getAchievementDescriptionsForGameDescriptor:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryForRequest"));
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "gameDescriptor"));

  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005DA80;
  v20[3] = &unk_1002BCAA8;
  v20[4] = self;
  v14 = v12;
  v21 = v14;
  v15 = v9;
  v22 = v15;
  v16 = v11;
  v23 = v16;
  objc_msgSend(v15, "performOnManagedObjectContext:", v20);
  if (v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005E140;
    v17[3] = &unk_1002BB450;
    v19 = v6;
    v18 = v15;
    objc_msgSend(v18, "notifyOnQueue:block:", v16, v17);

  }
}

- (void)fetchAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 865, "-[GKGameStatService fetchAchievementsForGameDescriptor:players:context:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v14, v12, v15));

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10005E3DC;
  v28[3] = &unk_1002BED98;
  v28[4] = self;
  v17 = v10;
  v29 = v17;
  v18 = v11;
  v30 = v18;
  v19 = v16;
  v31 = v19;
  v32 = v33;
  objc_msgSend(v19, "performOnManagedObjectContext:", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005EA08;
  v24[3] = &unk_1002BBE98;
  v22 = v13;
  v26 = v22;
  v23 = v19;
  v25 = v23;
  v27 = v33;
  objc_msgSend(v23, "notifyOnQueue:block:", v21, v24);

  _Block_object_dispose(v33, 8);
}

- (void)achievementsForPlayersAndGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  GKGameStatService *v31;
  id v32;
  _QWORD *v33;
  _QWORD v34[4];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 950, "-[GKGameStatService achievementsForPlayersAndGameDescriptor:players:context:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v14, v12, v15));

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10005ECD0;
  v27[3] = &unk_1002BEE08;
  v17 = v10;
  v28 = v17;
  v18 = v11;
  v29 = v18;
  v19 = v16;
  v30 = v19;
  v31 = self;
  v20 = v13;
  v32 = v20;
  v33 = v34;
  objc_msgSend(v19, "performOnManagedObjectContext:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005F7A8;
  v24[3] = &unk_1002BC800;
  v23 = v19;
  v25 = v23;
  v26 = v34;
  objc_msgSend(v23, "notifyOnQueue:block:", v22, v24);

  _Block_object_dispose(v34, 8);
}

- (void)loadAchievementsForGameDescriptor:(id)a3 players:(id)a4 context:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "_gkMapWithBlock:", &stru_1002BEE48));
  -[GKGameStatService achievementsForPlayersAndGameDescriptor:players:context:handler:](self, "achievementsForPlayersAndGameDescriptor:players:context:handler:", v12, v13, v11, v10);

}

- (void)primeCacheWithAchievementDescriptions:(id)a3 context:(id)a4 gameDescriptor:(id)a5 players:(id)a6 missingPlayers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  GKGameStatService *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1065, "-[GKGameStatService primeCacheWithAchievementDescriptions:context:gameDescriptor:players:missingPlayers:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transactionGroupWithName:", v17));

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10005FC08;
  v37[3] = &unk_1002BC010;
  v37[4] = self;
  v19 = v14;
  v38 = v19;
  v39 = v16;
  v20 = v13;
  v40 = v20;
  v21 = v18;
  v41 = v21;
  v22 = v16;
  objc_msgSend(v21, "perform:", v37);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "replyQueue"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10005FCE8;
  v30[3] = &unk_1002BC358;
  v31 = v12;
  v32 = v21;
  v33 = self;
  v34 = v19;
  v35 = v15;
  v36 = v20;
  v25 = v20;
  v26 = v15;
  v27 = v19;
  v28 = v21;
  v29 = v12;
  objc_msgSend(v29, "join:queue:block:", v28, v24, v30);

}

- (void)getAchievementsForGameDescriptor:(id)a3 players:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    v11 = objc_alloc((Class)GKGameDescriptor);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "gameDescriptor"));
    v8 = objc_msgSend(v11, "initWithDictionary:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dictionaryForRequest"));
  v17 = (void *)v16;
  if (v16)
  {
    if (v15)
    {
LABEL_5:
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100060174;
      v27[3] = &unk_1002BDA50;
      v27[4] = self;
      v28 = v17;
      v29 = v9;
      v18 = v14;
      v30 = v18;
      v31 = v8;
      objc_msgSend(v18, "performOnManagedObjectContext:", v27);
      if (v10)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replyQueue"));
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100060420;
        v24[3] = &unk_1002BB450;
        v26 = v10;
        v25 = v18;
        objc_msgSend(v25, "notifyOnQueue:block:", v20, v24);

      }
      goto LABEL_14;
    }
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "gameDescriptor"));

    if (v15)
      goto LABEL_5;
  }
  if (!os_log_GKGeneral)
    v22 = (id)GKOSLoggers(v16);
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    sub_100071F28();
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
  objc_msgSend(v14, "setError:", v23);

LABEL_14:
}

- (void)submitAchievements:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  GKGameStatService *v29;
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD v33[3];
  char v34;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1161, "-[GKGameStatService submitAchievements:whileScreeningChallenges:withEligibleChallenges:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000606D4;
  v27[3] = &unk_1002BE2D0;
  v17 = v13;
  v28 = v17;
  v29 = self;
  v18 = v9;
  v30 = v18;
  v19 = v14;
  v31 = v19;
  v32 = v33;
  objc_msgSend(v17, "performOnQueue:block:", v16, v27);

  if (v11)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "replyQueue"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100060E28;
    v22[3] = &unk_1002BEF28;
    v26 = v33;
    v22[4] = self;
    v25 = v11;
    v23 = v17;
    v24 = v18;
    objc_msgSend(v23, "notifyOnQueue:block:", v21, v22);

  }
  _Block_object_dispose(v33, 8);

}

- (void)resetAchievementsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKGameStatService *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1245, "-[GKGameStatService resetAchievementsWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "replyQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100061114;
  v15[3] = &unk_1002BB590;
  v9 = v6;
  v16 = v9;
  v17 = self;
  objc_msgSend(v9, "performOnQueue:block:", v8, v15);

  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000614F0;
    v12[3] = &unk_1002BB450;
    v14 = v4;
    v13 = v9;
    objc_msgSend(v13, "notifyOnQueue:block:", v11, v12);

  }
}

- (void)getLeaderboardForRequest:(id)a3 handler:(id)a4
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
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  GKGameStatService *v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gameBundleID"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleIdentifier"));
    objc_msgSend(v6, "setGameBundleID:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1303, "-[GKGameStatService getLeaderboardForRequest:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "replyQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100061728;
  v22[3] = &unk_1002BB4A0;
  v15 = v12;
  v23 = v15;
  v16 = v6;
  v24 = v16;
  v25 = self;
  objc_msgSend(v15, "performOnQueue:block:", v14, v22);

  if (v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000618F0;
    v19[3] = &unk_1002BB450;
    v21 = v7;
    v20 = v15;
    objc_msgSend(v20, "notifyOnQueue:block:", v18, v19);

  }
}

- (void)submitScores:(id)a3 whileScreeningChallenges:(BOOL)a4 withEligibleChallenges:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  GKGameStatService *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1325, "-[GKGameStatService submitScores:whileScreeningChallenges:withEligibleChallenges:handler:]"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v19), "setDate:", v14);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v17);
  }

  +[GKScoreSubmissionBulletin presentForScores:](GKScoreSubmissionBulletin, "presentForScores:", v15);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100061BE4;
  v28[3] = &unk_1002BC3A8;
  v20 = v15;
  v29 = v20;
  v30 = self;
  v21 = v10;
  v31 = v21;
  v22 = v13;
  v32 = v22;
  objc_msgSend(v22, "perform:", v28);
  if (v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "replyQueue"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100061D34;
    v25[3] = &unk_1002BB450;
    v27 = v11;
    v26 = v22;
    objc_msgSend(v26, "notifyOnQueue:block:", v24, v25);

  }
}

- (void)cleanUpLeaderboardTitles:(id)a3 set:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKGameStatService cleanUpLeaderboardTitles:set:context:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "-[GKGameStatService cleanUpLeaderboardTitles:set:context:]", objc_msgSend(v15, "UTF8String"), 1353));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leaderboardTitleMapList"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "entries"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_gkMapDictionaryWithKeyPath:", CFSTR("identifier")));
  objc_msgSend(v17, "addEntriesFromDictionary:", v20);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = v7;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "baseLeaderboardID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v27));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedTitle"));
        objc_msgSend(v26, "setLocalizedTitle:", v29);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v23);
  }

}

- (void)fetchLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  GKGameStatService *v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006214C;
  v19[3] = &unk_1002BE880;
  v20 = a5;
  v21 = v12;
  v22 = v13;
  v23 = a6;
  v24 = self;
  v25 = a7;
  v14 = v25;
  v15 = v23;
  v16 = v13;
  v17 = v12;
  v18 = v20;
  objc_msgSend(v15, "performBlock:", v19);

}

- (void)loadLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 context:(id)a6 bagKey:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  GKGameStatService *v47;
  id v48;
  id v49;
  _QWORD *v50;
  _QWORD v51[5];

  v35 = a3;
  v14 = a4;
  v36 = a5;
  v15 = a6;
  v16 = a7;
  v37 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "playerID"));

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]"), v18, "-[GKGameStatService loadLeaderboardsForGameDescriptor:player:setIdentifier:context:bagKey:handler:]", objc_msgSend(v20, "UTF8String"), 1412));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v21);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1414, "-[GKGameStatService loadLeaderboardsForGameDescriptor:player:setIdentifier:context:bagKey:handler:]"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v22, v15, v23));

  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "replyQueue"));
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10006267C;
  v42[3] = &unk_1002BEFA0;
  v27 = v35;
  v43 = v27;
  v28 = v14;
  v44 = v28;
  v29 = v36;
  v45 = v29;
  v30 = v16;
  v46 = v30;
  v47 = self;
  v50 = v51;
  v31 = v24;
  v48 = v31;
  v32 = v15;
  v49 = v32;
  objc_msgSend(v31, "performOnQueue:block:", v26, v42);

  if (v37)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "replyQueue"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100062DB0;
    v38[3] = &unk_1002BBD40;
    v40 = v37;
    v41 = v51;
    v39 = v31;
    objc_msgSend(v39, "notifyOnQueue:block:", v34, v38);

  }
  _Block_object_dispose(v51, 8);

}

- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 setIdentifier:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  GKGameStatService *v48;
  id v49;
  id v50;
  _QWORD block[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1503, "-[GKGameStatService getLeaderboardsForGameDescriptor:player:setIdentifier:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));

  if (v10)
  {
    if (v11)
      goto LABEL_6;
  }
  else
  {
    v18 = objc_alloc((Class)GKGameDescriptor);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "gameDescriptor"));
    v21 = objc_msgSend(v18, "initWithDictionary:", v20);

    v10 = v21;
    if (v11)
      goto LABEL_6;
  }
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_10005C4A4;
  v62 = sub_10005C4B4;
  v63 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_1000632CC;
  v55[3] = &unk_1002BC800;
  v56 = v15;
  v57 = &v58;
  objc_msgSend(v22, "performBlockAndWait:", v55);

  v11 = (id)v59[5];
  _Block_object_dispose(&v58, 8);

  if (v11)
  {
LABEL_6:
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));

    if (v24)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v27 = v17;
      v28 = v13;
      v29 = v12;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "replyQueue"));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100063400;
      v44[3] = &unk_1002BEC90;
      v31 = &v45;
      v11 = v11;
      v45 = v11;
      v39 = v10;
      v46 = v10;
      v40 = v15;
      v32 = v15;
      v47 = v32;
      v48 = self;
      v33 = v29;
      v34 = v29;
      v13 = v28;
      v17 = v27;
      v49 = v34;
      v50 = v27;
      objc_msgSend(v32, "performOnQueue:block:", v30, v44);

      if (v13)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "replyQueue"));
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_100063D68;
        v41[3] = &unk_1002BB450;
        v43 = v13;
        v42 = v32;
        objc_msgSend(v42, "notifyOnQueue:block:", v36, v41);

      }
      v12 = v33;
      v10 = v39;
      v15 = v40;
    }
    else
    {
      if (!os_log_GKGeneral)
        v37 = (id)GKOSLoggers(v25);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100071FE4();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000633A8;
      block[3] = &unk_1002BB540;
      v31 = &v52;
      v52 = v13;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    goto LABEL_20;
  }
  if (!os_log_GKGeneral)
    v38 = (id)GKOSLoggers(v23);
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    sub_100071FB8();
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100063350;
  v53[3] = &unk_1002BB540;
  v31 = &v54;
  v54 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v53);
  v11 = 0;
LABEL_20:

}

- (void)setDefaultLeaderboardID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  GKGameStatService *v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1597, "-[GKGameStatService setDefaultLeaderboardID:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100063F78;
  v19[3] = &unk_1002BB4A0;
  v12 = v6;
  v20 = v12;
  v21 = self;
  v13 = v9;
  v22 = v13;
  objc_msgSend(v13, "performOnQueue:block:", v11, v19);

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000642D4;
    v16[3] = &unk_1002BB450;
    v18 = v7;
    v17 = v13;
    objc_msgSend(v17, "notifyOnQueue:block:", v15, v16);

  }
}

- (void)getDefaultLeaderboardIDWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKGameServicePrivate, "serviceFromService:", self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
  v12 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006443C;
  v10[3] = &unk_1002BCA80;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v5, "getGameStatsForPlayer:bundleIDs:handler:", 0, v8, v10);

}

- (void)getLeaderboardSetsForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  GKGameStatService *v24;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1644, "-[GKGameStatService getLeaderboardSetsForGameDescriptor:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryForRequest"));
  if (v10
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "gameDescriptor")),
        v11,
        v10))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "context"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000646EC;
    v21[3] = &unk_1002BC380;
    v10 = v10;
    v22 = v10;
    v23 = v9;
    v24 = self;
    objc_msgSend(v12, "performBlockAndWait:", v21);

    v13 = v22;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 17, 0));
    objc_msgSend(v9, "setError:", v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100064DA4;
  v18[3] = &unk_1002BB450;
  v19 = v9;
  v20 = v6;
  v16 = v9;
  v17 = v6;
  objc_msgSend(v16, "notifyOnQueue:block:", v15, v18);

}

- (void)updateLeaderboardsWithIDs:(id)a3 gameDescriptor:(id)a4 player:(id)a5 context:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  GKGameStatService *v41;
  id v42;
  id v43;

  v33 = a3;
  v32 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerID"));

  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]"), v16, "-[GKGameStatService updateLeaderboardsWithIDs:gameDescriptor:player:context:handler:]", objc_msgSend(v18, "UTF8String"), 1726));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1728, "-[GKGameStatService updateLeaderboardsWithIDs:gameDescriptor:player:context:handler:]"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v20, v13, v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "replyQueue"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100065124;
  v37[3] = &unk_1002BEC90;
  v25 = v32;
  v38 = v25;
  v26 = v12;
  v39 = v26;
  v27 = v33;
  v40 = v27;
  v41 = self;
  v28 = v22;
  v42 = v28;
  v29 = v13;
  v43 = v29;
  objc_msgSend(v28, "performOnQueue:block:", v24, v37);

  if (v14)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "replyQueue"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100065684;
    v34[3] = &unk_1002BB450;
    v36 = v14;
    v35 = v28;
    objc_msgSend(v35, "notifyOnQueue:block:", v31, v34);

  }
}

+ (id)leaderboards:(id)a3 filteredWithIDs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100065798;
    v10[3] = &unk_1002BE4B8;
    v11 = v7;
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_gkFilterWithBlock:", v10));

  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (id)updateSigningStatusIfChanged:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD v8[4];
  unsigned __int8 v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = objc_msgSend(v5, "isDevSigned");

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100065894;
  v8[3] = &unk_1002BF0D8;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  return v4;
}

- (void)getLeaderboardsForGameDescriptor:(id)a3 player:(id)a4 leaderboardIDs:(id)a5 setIdentifier:(id)a6 handler:(id)a7
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
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  GKGameStatService *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  GKGameStatService *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD block[4];
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[4];
  id v65;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 1811, "-[GKGameStatService getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:]"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replyQueue"));

  if (v12
    || (v21 = objc_alloc((Class)GKGameDescriptor),
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "gameDescriptor")),
        v12 = objc_msgSend(v21, "initWithDictionary:", v23),
        v23,
        v22,
        v12))
  {
    if (v13)
    {
LABEL_6:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerID"));

      if (v27)
      {
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100065FB0;
        v43[3] = &unk_1002BF040;
        v29 = v18;
        v44 = v29;
        v45 = self;
        v30 = v12;
        v46 = v30;
        v31 = v13;
        v47 = v31;
        v48 = v15;
        v49 = v14;
        v32 = v20;
        v50 = v32;
        objc_msgSend(v29, "performOnQueue:block:", v32, v43);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1000671F8;
        v37[3] = &unk_1002BB4C8;
        v38 = v29;
        v39 = self;
        v13 = v31;
        v40 = v13;
        v12 = v30;
        v41 = v12;
        v42 = v16;
        objc_msgSend(v38, "notifyOnQueue:block:", v32, v37);

        v33 = v44;
      }
      else
      {
        if (!os_log_GKGeneral)
          v34 = (id)GKOSLoggers(v28);
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
          sub_100072074();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100065F58;
        block[3] = &unk_1002BB540;
        v52 = v16;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        v33 = v52;
      }

      goto LABEL_14;
    }
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = sub_10005C4A4;
    v62 = sub_10005C4B4;
    v63 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "context"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100065E7C;
    v55[3] = &unk_1002BC800;
    v56 = v18;
    v57 = &v58;
    objc_msgSend(v25, "performBlockAndWait:", v55);

    v26 = (id)v59[5];
    if (v26)
    {
      v13 = v26;

      _Block_object_dispose(&v58, 8);
      goto LABEL_6;
    }
    if (!os_log_GKGeneral)
      v36 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100071FB8();
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100065F00;
    v53[3] = &unk_1002BB540;
    v54 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v53);

    _Block_object_dispose(&v58, 8);
    v13 = 0;
  }
  else
  {
    if (!os_log_GKGeneral)
      v35 = (id)GKOSLoggers(v24);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100072048();
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100065E24;
    v64[3] = &unk_1002BB540;
    v65 = v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v64);

    v12 = 0;
  }
LABEL_14:

}

- (void)mixinHasActiveChallengesWithLeaderboards:(id)a3 playerID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  GKGameStatService *v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count") && (_os_feature_enabled_impl("gseui", "de7bbd8e") & 1) != 0)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKChallengeServicePrivate, "serviceFromService:", self));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100067554;
    v19[3] = &unk_1002BCE80;
    v20 = v10;
    v21 = self;
    v22 = v13;
    v15 = v13;
    v16 = v10;
    objc_msgSend(v14, "getActiveLeaderboardChallengeDetailsForPlayerID:bundleID:allowStaleChallengeDetailsData:completionHandler:", v11, v12, 1, v19);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100067544;
    block[3] = &unk_1002BB450;
    v24 = v10;
    v25 = v13;
    v16 = v13;
    v14 = v10;
    dispatch_async(v18, block);

    v15 = v25;
  }

}

- (void)fetchLeaderboardWithRecordID:(id)a3 context:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100067850;
  v10[3] = &unk_1002BB568;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v7 = v13;
  v8 = v12;
  v9 = v11;
  objc_msgSend(v8, "performBlock:", v10);

}

- (void)loadPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 playerPlayedIn:(BOOL)a6 context:(id)a7 handler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  GKGameStatService *v45;
  id v46;
  id v47;
  BOOL v48;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v37 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playerID"));

  if (!v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m"));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (player.playerID != ((void *)0))\n[%s (%s:%d)]"), v18, "-[GKGameStatService loadPreviousInstanceForLeaderboard:gameDescriptor:player:playerPlayedIn:context:handler:]", objc_msgSend(v20, "UTF8String"), 2036));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v21);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2038, "-[GKGameStatService loadPreviousInstanceForLeaderboard:gameDescriptor:player:playerPlayedIn:context:handler:]"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v22, v16, v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "replyQueue"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100067BE0;
  v41[3] = &unk_1002BDD68;
  v42 = v14;
  v43 = v15;
  v48 = a6;
  v44 = v13;
  v45 = self;
  v27 = v24;
  v46 = v27;
  v47 = v16;
  v28 = v16;
  v29 = v13;
  v30 = v15;
  v31 = v14;
  objc_msgSend(v27, "performOnQueue:block:", v26, v41);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "replyQueue"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000680D0;
  v38[3] = &unk_1002BB450;
  v39 = v27;
  v40 = v37;
  v34 = v27;
  v35 = v37;
  objc_msgSend(v34, "notifyOnQueue:block:", v33, v38);

}

- (void)getPreviousInstanceForLeaderboard:(id)a3 gameDescriptor:(id)a4 player:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  GKGameStatService *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  GKGameStatService *v43;
  id v44;
  id v45;
  id v46;
  _QWORD block[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _QWORD v60[4];
  id v61;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2093, "-[GKGameStatService getPreviousInstanceForLeaderboard:gameDescriptor:player:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  if (v11
    || (v16 = objc_alloc((Class)GKGameDescriptor),
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "gameDescriptor")),
        v11 = objc_msgSend(v16, "initWithDictionary:", v18),
        v18,
        v17,
        v11))
  {
    if (v12)
    {
LABEL_6:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playerID"));

      if (v22)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyQueue"));
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1000687E4;
        v41[3] = &unk_1002BC010;
        v26 = v15;
        v42 = v26;
        v43 = self;
        v44 = v10;
        v27 = v11;
        v45 = v27;
        v28 = v12;
        v46 = v28;
        objc_msgSend(v26, "performOnQueue:block:", v25, v41);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "replyQueue"));
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100068C88;
        v35[3] = &unk_1002BCEA8;
        v36 = v26;
        v40 = v13;
        v37 = self;
        v12 = v28;
        v38 = v12;
        v11 = v27;
        v39 = v11;
        objc_msgSend(v36, "notifyOnQueue:block:", v30, v35);

        v31 = v42;
      }
      else
      {
        if (!os_log_GKGeneral)
          v32 = (id)GKOSLoggers(v23);
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
          sub_1000722D8();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10006878C;
        block[3] = &unk_1002BB540;
        v48 = v13;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        v31 = v48;
      }

      goto LABEL_14;
    }
    v54 = 0;
    v55 = &v54;
    v56 = 0x3032000000;
    v57 = sub_10005C4A4;
    v58 = sub_10005C4B4;
    v59 = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000686B0;
    v51[3] = &unk_1002BC800;
    v52 = v15;
    v53 = &v54;
    objc_msgSend(v20, "performBlockAndWait:", v51);

    v21 = (id)v55[5];
    if (v21)
    {
      v12 = v21;

      _Block_object_dispose(&v54, 8);
      goto LABEL_6;
    }
    if (!os_log_GKGeneral)
      v34 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_1000722AC();
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100068734;
    v49[3] = &unk_1002BB540;
    v50 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v49);

    _Block_object_dispose(&v54, 8);
    v12 = 0;
  }
  else
  {
    if (!os_log_GKGeneral)
      v33 = (id)GKOSLoggers(v19);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100072280();
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100068658;
    v60[3] = &unk_1002BB540;
    v61 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v60);

    v11 = 0;
  }
LABEL_14:

}

- (void)updatePlayersForEntries:(id)a3 localPlayerEntry:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
  v12 = v11;
  if (v8)
    objc_msgSend(v11, "addObject:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKAnonymousPlayerInternal internalRepresentation](GKAnonymousPlayerInternal, "internalRepresentation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_gkValuesForKeyPath:", CFSTR("player.playerID")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKProfileService, "serviceFromService:", self));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006900C;
  v19[3] = &unk_1002BCE80;
  v20 = v12;
  v21 = v13;
  v22 = v9;
  v16 = v9;
  v17 = v13;
  v18 = v12;
  objc_msgSend(v15, "getProfilesForPlayerIDs:handler:", v14, v19);

}

- (void)generateEntriesFromServerResponse:(id)a3 context:(id)a4 leaderboard:(id)a5 handler:(id)a6
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
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  GKGameStatService *v28;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2219, "-[GKGameStatService generateEntriesFromServerResponse:context:leaderboard:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v14, v13, v15));

  if (v10)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100069398;
    v24[3] = &unk_1002BCAA8;
    v25 = v10;
    v26 = v11;
    v27 = v16;
    v28 = self;
    objc_msgSend(v27, "performOnManagedObjectContext:", v24);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100069A40;
  v21[3] = &unk_1002BB450;
  v22 = v16;
  v23 = v12;
  v19 = v16;
  v20 = v12;
  objc_msgSend(v19, "notifyOnQueue:block:", v18, v21);

}

- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 handler:(id)a11
{
  -[GKGameStatService loadEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:context:locale:handler:](self, "loadEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:context:locale:handler:", a3, a4, a5, a6, a7, a8.location, a8.length, a9, a10, 0, a11);
}

- (void)loadEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 context:(id)a10 locale:(id)a11 handler:(id)a12
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v37;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  GKGameStatService *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int64_t v53;
  int64_t v54;
  _NSRange v55;

  v34 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a10;
  v33 = a11;
  v40 = a12;
  v18 = a9;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2306, "-[GKGameStatService loadEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:context:locale:handler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v19, v17, v20));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_gkMapWithBlock:", &stru_1002BF2F8));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "replyQueue"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100069E00;
  v44[3] = &unk_1002BF348;
  v45 = v15;
  v46 = v16;
  v47 = v34;
  v48 = self;
  v53 = a7;
  v54 = a6;
  v55 = a8;
  v49 = v22;
  v50 = v33;
  v25 = v21;
  v51 = v25;
  v52 = v17;
  v39 = v17;
  v37 = v33;
  v35 = v22;
  v26 = v34;
  v27 = v16;
  v28 = v15;
  objc_msgSend(v25, "performOnQueue:block:", v24, v44);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "replyQueue"));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10006A2DC;
  v41[3] = &unk_1002BB450;
  v42 = v25;
  v43 = v40;
  v31 = v25;
  v32 = v40;
  objc_msgSend(v31, "notifyOnQueue:block:", v30, v41);

}

- (id)playerScopeName:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("FRIENDS");
  else
    return CFSTR("ALL");
}

- (id)timeScopeName:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("AllTIME");
  if (a3 == 1)
    v3 = CFSTR("THISWEEK");
  if (a3)
    return (id)v3;
  else
    return CFSTR("TODAY");
}

- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 handler:(id)a10
{
  -[GKGameStatService getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:handler:](self, "getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:handler:", a3, a4, a5, a6, a7, a8.location, a8.length, a9, 0, a10);
}

- (void)getEntriesForLeaderboard:(id)a3 gameDescriptor:(id)a4 localPlayer:(id)a5 playerScope:(int64_t)a6 timeScope:(int64_t)a7 range:(_NSRange)a8 players:(id)a9 locale:(id)a10 handler:(id)a11
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  GKGameStatService *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  int64_t v58;
  int64_t v59;
  _NSRange v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _QWORD block[4];
  id v75;
  _QWORD v76[4];
  id v77;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v46 = a9;
  v17 = a10;
  v18 = a11;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2402, "-[GKGameStatService getEntriesForLeaderboard:gameDescriptor:localPlayer:playerScope:timeScope:range:players:locale:handler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  if (v15
    || (v21 = objc_alloc((Class)GKGameDescriptor),
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy")),
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "gameDescriptor")),
        v15 = objc_msgSend(v21, "initWithDictionary:", v23),
        v23,
        v22,
        v15))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "baseLeaderboardID"));
    v26 = objc_msgSend(v25, "length");

    if (!v26)
    {
      if (!os_log_GKGeneral)
        v38 = (id)GKOSLoggers(v27);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_100072460();
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
      v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "replyQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006AAA4;
      block[3] = &unk_1002BB540;
      v75 = v18;
      dispatch_async(v40, block);

      v37 = v75;
      goto LABEL_19;
    }
    if (v16)
    {
LABEL_7:
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playerID"));

      if (v30)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "replyQueue"));
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10006AC48;
        v50[3] = &unk_1002BF370;
        v34 = v20;
        v51 = v34;
        v52 = self;
        v53 = v14;
        v15 = v15;
        v54 = v15;
        v16 = v16;
        v55 = v16;
        v58 = a6;
        v59 = a7;
        v60 = a8;
        v56 = v46;
        v57 = v17;
        objc_msgSend(v34, "performOnQueue:block:", v33, v50);

        v35 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "replyQueue"));
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_10006AF08;
        v47[3] = &unk_1002BB450;
        v49 = v18;
        v48 = v34;
        objc_msgSend(v48, "notifyOnQueue:block:", v36, v47);

        v37 = v51;
      }
      else
      {
        if (!os_log_GKGeneral)
          v41 = (id)GKOSLoggers(v31);
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
          sub_1000724B8();
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10006ABE8;
        v61[3] = &unk_1002BB540;
        v62 = v18;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v61);
        v37 = v62;
      }
LABEL_19:

      goto LABEL_20;
    }
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = sub_10005C4A4;
    v72 = sub_10005C4B4;
    v73 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "context"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10006AB04;
    v65[3] = &unk_1002BC800;
    v66 = v20;
    v67 = &v68;
    objc_msgSend(v28, "performBlockAndWait:", v65);

    v29 = (id)v69[5];
    if (v29)
    {
      v16 = v29;

      _Block_object_dispose(&v68, 8);
      goto LABEL_7;
    }
    if (!os_log_GKGeneral)
      v43 = (id)GKOSLoggers(0);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_10007248C();
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_10006AB88;
    v63[3] = &unk_1002BB540;
    v64 = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v63);

    _Block_object_dispose(&v68, 8);
    v16 = 0;
  }
  else
  {
    if (!os_log_GKGeneral)
      v42 = (id)GKOSLoggers(v24);
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
      sub_100072434();
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_10006AA44;
    v76[3] = &unk_1002BB540;
    v77 = v18;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v76);

    v15 = 0;
  }
LABEL_20:

}

- (void)submitScore:(int64_t)a3 context:(unint64_t)a4 leaderboardIDs:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 gameDescriptor:(id)a9 handler:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  GKGameStatService *v35;
  id v36;
  id v37;
  int64_t v38;
  unint64_t v39;

  v14 = a6;
  v15 = a8;
  v16 = a10;
  v17 = a9;
  v18 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2478, "-[GKGameStatService submitScore:context:leaderboardIDs:forPlayer:whileScreeningChallenges:withEligibleChallenges:gameDescriptor:handler:]"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v19));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v18));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006B1A0;
  v30[3] = &unk_1002BF410;
  v31 = v21;
  v32 = v14;
  v33 = v22;
  v34 = v20;
  v35 = self;
  v36 = v15;
  v38 = a3;
  v39 = a4;
  v37 = v16;
  v23 = v16;
  v24 = v15;
  v25 = v20;
  v26 = v22;
  v27 = v14;
  v28 = v21;
  -[GKGameStatService getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:](self, "getLeaderboardsForGameDescriptor:player:leaderboardIDs:setIdentifier:handler:", v17, v27, v26, 0, v30);

}

- (void)submitInstanceScore:(int64_t)a3 context:(unint64_t)a4 leaderboard:(id)a5 forPlayer:(id)a6 whileScreeningChallenges:(BOOL)a7 withEligibleChallenges:(id)a8 handler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  GKGameStatService *v35;
  id v36;
  int64_t v37;
  unint64_t v38;

  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKGameStatService.m", 2580, "-[GKGameStatService submitInstanceScore:context:leaderboard:forPlayer:whileScreeningChallenges:withEligibleChallenges:handler:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v18));

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006C0C4;
  v30[3] = &unk_1002BF438;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v31 = v20;
  v21 = v14;
  v32 = v21;
  v37 = a3;
  v38 = a4;
  v22 = v15;
  v33 = v22;
  v23 = v16;
  v34 = v23;
  v35 = self;
  v24 = v19;
  v36 = v24;
  objc_msgSend(v24, "perform:", v30);
  if (v17)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "replyQueue"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10006C490;
    v27[3] = &unk_1002BB758;
    v28 = v24;
    v29 = v17;
    objc_msgSend(v28, "notifyOnQueue:block:", v26, v27);

  }
}

- (void)createLeaderboardBasedOnID:(id)a3 recipients:(id)a4 inviteMessage:(id)a5 context:(id)a6 duration:(double)a7 handler:(id)a8
{
  if (a8)
    (*((void (**)(id, _QWORD, _QWORD, double))a8 + 2))(a8, 0, 0, a7);
}

- (void)startLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)endLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)deleteLeaderboardWithID:(id)a3 handler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)getLeaderboardSummaryForGameDescriptor:(id)a3 localPlayer:(id)a4 baseLeaderboardID:(id)a5 leaderboardID:(id)a6 timeScope:(int64_t)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (v14 && v16)
  {
    v19 = objc_alloc_init((Class)NSMutableDictionary);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dictionaryForRequest"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("game"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playerID"));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("player-id"));

    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, CFSTR("base-leaderboard-id"));
    if (objc_msgSend(v17, "length"))
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("leaderboard-id"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKGameStatService timeScopeName:](self, "timeScopeName:", a7));
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("time-scope"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10006C7C0;
    v26[3] = &unk_1002BCB98;
    v26[4] = self;
    v27 = v18;
    objc_msgSend(v23, "issueRequest:bagKey:clientProxy:handler:", v19, CFSTR("gk-get-leaderboard-summary"), v24, v26);

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 16, 0));
    (*((void (**)(id, _QWORD, void *))v18 + 2))(v18, 0, v25);

  }
}

@end
