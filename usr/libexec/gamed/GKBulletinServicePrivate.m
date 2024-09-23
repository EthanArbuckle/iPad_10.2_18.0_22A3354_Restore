@implementation GKBulletinServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x10000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKBulletinServicePrivateInterface, a2);
}

- (void)markAllBadgesAsViewedForType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  GKBulletinServicePrivate *v11;
  unint64_t v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKBulletinService.m", 63, "-[GKBulletinServicePrivate markAllBadgesAsViewedForType:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001706C;
  v9[3] = &unk_1002BBA40;
  v11 = self;
  v12 = a3;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

- (void)fetchBadgeCountsForBundleID:(id)a3 handler:(id)a4
{
  void (**v5)(id, void *, _QWORD);
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[3];

  if (a4)
  {
    v5 = (void (**)(id, void *, _QWORD))a4;
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKBadgeController sharedController](GKBadgeController, "sharedController"));
    v8 = objc_msgSend(v7, "badgeCountForBundleID:badgeType:", v6, 1);
    v9 = objc_msgSend(v7, "badgeCountForBundleID:badgeType:", v6, 0);
    v10 = objc_msgSend(v7, "badgeCountForBundleID:badgeType:", v6, 2);

    v15[0] = &off_1002DB4F0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v9));
    v16[0] = v11;
    v15[1] = &off_1002DB508;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
    v16[1] = v12;
    v15[2] = &off_1002DB520;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v10));
    v16[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
    v5[2](v5, v14, 0);

  }
}

- (void)clearBulletinsForReceivedChallenges:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v6 = objc_msgSend(v4, "getBulletinsOfType:", objc_opt_class(GKChallengeReceivedBulletin, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11)));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "challenge"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "challengeID"));
        v15 = objc_msgSend(v3, "containsObject:", v14);

        if (v15)
          objc_msgSend(v4, "withdrawBulletin:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)clearBulletinsForTurnBasedTurn:(id)a3 exchangeID:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
  v7 = objc_msgSend(v5, "getBulletinsOfType:", objc_opt_class(GKTurnBasedMultiplayerTurnBulletin, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12)));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "matchID"));
        v15 = objc_msgSend(v4, "isEqualToString:", v14);

        if (v15)
          objc_msgSend(v5, "withdrawBulletin:", v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)fetchMessageImageForBundleID:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationProxyForBundleID:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_gkPathForMessageImage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v9));
  if (v11)
    v11[2](v11, v10);

}

@end
