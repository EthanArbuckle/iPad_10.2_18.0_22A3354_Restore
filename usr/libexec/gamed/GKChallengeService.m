@implementation GKChallengeService

+ (unint64_t)requiredEntitlements
{
  return 64;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKChallengeServiceInterface, a2);
}

- (void)_updatePlayersForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100072774;
    v14[3] = &unk_1002BF8F8;
    v9 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2 * (_QWORD)v8);
    v15 = v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100072810;
    v11[3] = &unk_1002BB4A0;
    v11[4] = self;
    v12 = v9;
    v13 = v6;
    v10 = v9;
    objc_msgSend(v7, "perform:", v11);

  }
}

- (id)_filterChallenges:(id)a3 compatibleWithBundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100072AFC;
    v11[3] = &unk_1002BF920;
    v12 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v11));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v8));

    v5 = (id)v9;
  }

  return v5;
}

- (void)_determineCompatibleGamesForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v33 = v6;
    v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v5, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleID"));
          objc_msgSend(v7, "addObject:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "compatibleBundleIDs"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "array"));
          objc_msgSend(v7, "addObjectsFromArray:", v16);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v10);
    }
    v32 = v7;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GKApplicationWorkspace defaultWorkspace](GKApplicationWorkspace, "defaultWorkspace"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v8;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        v21 = 0;
        v35 = v19;
        do
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v21);
          v23 = objc_autoreleasePoolPush();
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bundleID"));
          v25 = objc_msgSend(v17, "applicationIsInstalled:", v24);

          if ((v25 & 1) == 0)
          {
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "compatibleBundleIDs"));
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v38;
              while (2)
              {
                for (j = 0; j != v28; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v38 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j);
                  if (objc_msgSend(v17, "applicationIsInstalled:", v31))
                  {
                    objc_msgSend(v22, "setBundleID:", v31);
                    goto LABEL_25;
                  }
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
                if (v28)
                  continue;
                break;
              }
            }
LABEL_25:

            v19 = v35;
          }
          objc_autoreleasePoolPop(v23);
          v21 = (char *)v21 + 1;
        }
        while (v21 != v19);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v19);
    }

    v6 = v33;
    v5 = v34;
  }

}

- (void)_updateGamesForChallenges:(id)a3 dispatchGroup:(id)a4
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
    v9[2] = sub_100072F5C;
    v9[3] = &unk_1002BB4A0;
    v9[4] = self;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkDistinctValuesForKeyPath:", CFSTR("bundleID")));
    v11 = v6;
    v8 = v10;
    objc_msgSend(v7, "perform:", v9);

  }
}

- (void)fetchChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000731EC;
  v8[3] = &unk_1002BB758;
  v9 = a4;
  v10 = a5;
  v6 = v10;
  v7 = v9;
  objc_msgSend(v7, "performBlock:", v8);

}

- (void)loadChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeService.m", 203, "-[GKChallengeService loadChallengesForGameDescriptor:context:handler:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheTransactionGroup transactionGroupWithName:context:client:](GKCacheTransactionGroup, "transactionGroupWithName:context:client:", v10, v7, v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000735AC;
  v21[3] = &unk_1002BC3A8;
  v21[4] = self;
  v14 = v11;
  v22 = v14;
  v15 = v7;
  v23 = v15;
  v16 = v9;
  v24 = v16;
  objc_msgSend(v14, "performOnQueue:block:", v13, v21);

  if (v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100073934;
    v18[3] = &unk_1002BB450;
    v20 = v8;
    v19 = v14;
    objc_msgSend(v19, "notifyOnQueue:block:", v17, v18);

  }
}

- (void)getChallengesForGameDescriptor:(id)a3 handler:(id)a4
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
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  GKChallengeService *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  GKChallengeService *v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeService.m", 249, "-[GKChallengeService getChallengesForGameDescriptor:handler:]"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "replyQueue"));

  if (!v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "gameDescriptor"));

  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100073BD4;
  v25[3] = &unk_1002BC3A8;
  v14 = v10;
  v26 = v14;
  v27 = self;
  v15 = v6;
  v28 = v15;
  v16 = v12;
  v29 = v16;
  objc_msgSend(v14, "performOnQueue:block:", v16, v25);
  if (v7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "replyQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000743A4;
    v19[3] = &unk_1002BB4C8;
    v20 = v14;
    v21 = self;
    v22 = v15;
    v23 = v8;
    v24 = v7;
    objc_msgSend(v20, "notifyOnQueue:block:", v18, v19);

  }
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 handler:(id)a4
{
  -[GKChallengeService getChallengeDetailsForChallengeIDs:receiverID:clientBundleID:handler:](self, "getChallengeDetailsForChallengeIDs:receiverID:clientBundleID:handler:", a3, 0, 0, a4);
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 handler:(id)a5
{
  -[GKChallengeService getChallengeDetailsForChallengeIDs:receiverID:clientBundleID:handler:](self, "getChallengeDetailsForChallengeIDs:receiverID:clientBundleID:handler:", a3, a4, 0, a5);
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 clientBundleID:(id)a5 handler:(id)a6
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
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  GKChallengeService *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  GKChallengeService *v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeService.m", 343, "-[GKChallengeService getChallengeDetailsForChallengeIDs:receiverID:clientBundleID:handler:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000749A0;
  v31[3] = &unk_1002BC3A8;
  v18 = v15;
  v32 = v18;
  v33 = v10;
  v34 = self;
  v35 = v11;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v18, "performOnQueue:block:", v17, v31);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "replyQueue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000758F0;
  v26[3] = &unk_1002BB518;
  v27 = v18;
  v28 = self;
  v29 = v12;
  v30 = v13;
  v23 = v13;
  v24 = v12;
  v25 = v18;
  objc_msgSend(v25, "notifyOnQueue:block:", v22, v26);

}

- (void)issueChallenge:(id)a3 toPlayers:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GKChallengeNetworkRequest *v18;
  void *v19;
  void *v20;
  GKChallengeNetworkRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v9, "count")));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serverRepresentationForReceivingPlayer:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v16)));
        objc_msgSend(v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  v18 = [GKChallengeNetworkRequest alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleIdentifier"));
  v21 = -[GKChallengeNetworkRequest initWithChallenges:bundleID:](v18, "initWithChallenges:bundleID:", v11, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[GKNetworkRequestManager commonNetworkRequestManager](GKNetworkRequestManager, "commonNetworkRequestManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  objc_msgSend(v22, "writeToNetwork:clientProxy:handler:", v21, v23, 0);

  if (v10)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "replyQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100076008;
    block[3] = &unk_1002BB540;
    v28 = v10;
    dispatch_async(v25, block);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v26, "reportEvent:type:", GKReporterDomainChallenge, GKReporterChallengeIssue);

}

- (void)abortChallenges:(id)a3 handler:(id)a4
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
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  GKChallengeService *v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKChallengeService.m", 536, "-[GKChallengeService abortChallenges:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000761E8;
  v19[3] = &unk_1002BB4A0;
  v12 = v6;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  v22 = self;
  objc_msgSend(v13, "performOnQueue:block:", v11, v19);

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "replyQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100076774;
    v17[3] = &unk_1002BB450;
    v17[4] = self;
    v18 = v7;
    objc_msgSend(v13, "notifyOnQueue:block:", v15, v17);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
  objc_msgSend(v16, "reportEvent:type:", GKReporterDomainChallenge, GKReporterChallengeAbort);

}

@end
