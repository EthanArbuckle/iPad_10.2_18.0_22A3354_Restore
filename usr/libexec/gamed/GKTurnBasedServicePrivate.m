@implementation GKTurnBasedServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x1000000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKTurnBasedServicePrivateInterface, a2);
}

- (void)getTurnBasedBadgeCountWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  GKTurnBasedServicePrivate *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKTurnBasedService.m", 1688, "-[GKTurnBasedServicePrivate getTurnBasedBadgeCountWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v5));

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "context"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100098A98;
  v21[3] = &unk_1002C0748;
  v21[4] = self;
  v8 = v6;
  v22 = v8;
  v23 = v29;
  v24 = &v25;
  objc_msgSend(v7, "performBlockAndWait:", v21);

  if (*((_BYTE *)v26 + 24))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100098BC4;
    v17[3] = &unk_1002BDE58;
    v17[4] = self;
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("game")));
    v18 = v9;
    v19 = v8;
    v20 = v29;
    objc_msgSend(v19, "perform:", v17);

  }
  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "replyQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100098E20;
    v12[3] = &unk_1002C07C0;
    v15 = v4;
    v16 = v29;
    v13 = v8;
    v14 = self;
    objc_msgSend(v13, "notifyOnQueue:block:", v11, v12);

  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

}

- (void)showMatch:(id)a3
{
  uint64_t v3;
  GKTurnBasedMultiplayerBulletin *v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "matchID"));
  if (v3)
  {
    v4 = (GKTurnBasedMultiplayerBulletin *)v3;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleID"));
    if (!v5)
    {
LABEL_8:

      goto LABEL_9;
    }
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleVersion"));

    if (v7)
    {
      v4 = objc_alloc_init(GKTurnBasedMultiplayerBulletin);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleVersion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "shortBundleVersion"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "game"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "adamID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[GKGameDescriptor gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:](GKGameDescriptor, "gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:", v8, v9, v10, v12));

      -[GKBulletin setGameDescriptor:](v4, "setGameDescriptor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "matchID"));
      -[GKTurnBasedMultiplayerBulletin setMatchID:](v4, "setMatchID:", v14);

      -[GKBulletin setPushCommand:](v4, "setPushCommand:", 81);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleVersion"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](v4, "gameDescriptor"));
      objc_msgSend(v16, "setBundleVersion:", v15);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "shortBundleVersion"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GKBulletin gameDescriptor](v4, "gameDescriptor"));
      objc_msgSend(v18, "setShortBundleVersion:", v17);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[GKBulletinController sharedController](GKBulletinController, "sharedController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "acceptedInviteManager"));

      objc_msgSend(v20, "addTurnBasedEvent:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleID"));
      v22 = GKGetApplicationStateForBundleID(v21);

      if (v22 == 8
        || (v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleID")),
            GKLaunchApplicationWithIdentifier(v23, 0),
            v23,
            v22 >= 4))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", v24));

        objc_msgSend(v25, "fetchTurnBasedData");
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[GKReporter reporter](GKReporter, "reporter"));
      objc_msgSend(v26, "reportEvent:type:", GKReporterDomainTurnBased, GKReporterTurnBasedShowMatch);

      goto LABEL_8;
    }
  }
LABEL_9:

}

@end
