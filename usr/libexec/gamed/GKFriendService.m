@implementation GKFriendService

- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 withFilter:(int)a5 commonFriends:(BOOL)a6 handler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  GKFriendService *v30;
  id v31;
  _QWORD *v32;
  int v33;
  _QWORD v34[4];
  id v35;
  id v36;
  GKFriendService *v37;
  id v38;
  _QWORD *v39;
  _QWORD v40[3];
  char v41;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  if (v13)
  {
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "playerID"));
      v17 = objc_msgSend(v14, "isEqualToString:", v16);

      if (v17)
      {
LABEL_9:

        v11 = 0;
        goto LABEL_10;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerID"));

      if (!v18)
      {
        if (!os_log_GKGeneral)
          v20 = (id)GKOSLoggers(v19);
        v21 = (void *)os_log_GKError;
        if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
          sub_10003E38C((uint64_t)v11, v21);
        goto LABEL_9;
      }
    }
LABEL_10:
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupBypassingMultiUser](self, "transactionGroupBypassingMultiUser"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100008480;
    v34[3] = &unk_1002BD1A0;
    v11 = v11;
    v35 = v11;
    v23 = v22;
    v36 = v23;
    v24 = v13;
    v37 = self;
    v38 = v24;
    v39 = v40;
    objc_msgSend(v23, "performOnManagedObjectContext:", v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "replyQueue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10003623C;
    v28[3] = &unk_1002BD1C8;
    v27 = v23;
    v29 = v27;
    v33 = a5;
    v31 = v24;
    v32 = v40;
    v30 = self;
    objc_msgSend(v27, "notifyOnQueue:block:", v26, v28);

    _Block_object_dispose(v40, 8);
  }

}

+ (unint64_t)requiredEntitlements
{
  return 4;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKFriendServiceInterface, a2);
}

- (void)notifyWidgetFriendListUpdated
{
  id v2;
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)CHSTimelineController), "initForAvocadoIdentifier:inBundleIdentifier:", CFSTR("FriendsArePlayingWidget"), CFSTR("com.apple.gamecenter.widgets.extension"));
  v2 = objc_msgSend(v3, "reloadTimeline");

}

- (void)getFriendsForPlayer:(id)a3 handler:(id)a4
{
  -[GKFriendService getFriendsForPlayer:commonFriends:handler:](self, "getFriendsForPlayer:commonFriends:handler:", a3, 0, a4);
}

- (void)updateFriendsOfLocalPlayerWithHandler:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100035C00;
  v5[3] = &unk_1002BCA80;
  v6 = a3;
  v4 = v6;
  -[GKFriendService getFriendIDsForPlayer:commonFriends:handler:](self, "getFriendIDsForPlayer:commonFriends:handler:", 0, 0, v5);

}

- (void)getFriendsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v5;
  id v7;
  _QWORD v8[4];
  GKFriendService *v9;
  id v10;

  v5 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035CA8;
  v8[3] = &unk_1002BCA30;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[GKFriendService getFriendIDsForPlayer:commonFriends:handler:](v9, "getFriendIDsForPlayer:commonFriends:handler:", a3, v5, v8);

}

- (void)getFriendIDsForPlayer:(id)a3 commonFriends:(BOOL)a4 handler:(id)a5
{
  -[GKFriendService getFriendIDsForPlayer:withPredicate:commonFriends:handler:](self, "getFriendIDsForPlayer:withPredicate:commonFriends:handler:", a3, &stru_1002BD108, a4, a5);
}

- (void)getChallengableFriendIDsForPlayer:(id)a3 handler:(id)a4
{
  -[GKFriendService getFriendIDsForPlayer:withPredicate:commonFriends:handler:](self, "getFriendIDsForPlayer:withPredicate:commonFriends:handler:", a3, &stru_1002BD128, 0, a4);
}

- (void)getChallengableFriendsForPlayer:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transport](self, "transport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKProfileService, "serviceWithTransport:forClient:localPlayer:", v8, v9, v10));

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100035F00;
  v14[3] = &unk_1002BCA30;
  v15 = v11;
  v16 = v6;
  v12 = v6;
  v13 = v11;
  -[GKFriendService getChallengableFriendIDsForPlayer:handler:](self, "getChallengableFriendIDsForPlayer:handler:", v7, v14);

}

- (void)getFriendIDsForPlayer:(id)a3 withPredicate:(id)a4 commonFriends:(BOOL)a5 handler:(id)a6
{
  -[GKFriendService getFriendIDsForPlayer:withPredicate:withFilter:commonFriends:handler:](self, "getFriendIDsForPlayer:withPredicate:withFilter:commonFriends:handler:", a3, a4, 0, a5, a6);
}

- (void)getNearbyTokenForLocalPlayerWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 280, "-[GKFriendService getNearbyTokenForLocalPlayerWithHandler:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100036778;
  v15[3] = &unk_1002BB590;
  v15[4] = self;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v7, "perform:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "replyQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000369B8;
  v12[3] = &unk_1002BB450;
  v13 = v7;
  v14 = v4;
  v10 = v7;
  v11 = v4;
  objc_msgSend(v10, "notifyOnQueue:block:", v9, v12);

}

- (id)predicateForFriendPredicate:(id)a3 withFilter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[2];

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v7));
    v12[0] = v5;
    v12[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

- (void)establishNearbyRelationshipsUsingPlayerTokens:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  GKFriendService *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v10 = (id)GKOSLoggers(v7);
    v9 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10003E550();
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 316, "-[GKFriendService establishNearbyRelationshipsUsingPlayerTokens:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v11));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100036CCC;
  v20[3] = &unk_1002BB4A0;
  v13 = v6;
  v21 = v13;
  v22 = self;
  v14 = v12;
  v23 = v14;
  objc_msgSend(v14, "perform:", v20);
  if (v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "replyQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100036E98;
    v17[3] = &unk_1002BB450;
    v19 = v8;
    v18 = v14;
    objc_msgSend(v18, "notifyOnQueue:block:", v16, v17);

  }
}

- (void)createFriendRequestWithIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  GKFriendService *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKFriendService.m", 339, "-[GKFriendService createFriendRequestWithIdentifier:handler:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8));

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003705C;
  v17[3] = &unk_1002BB4A0;
  v10 = v6;
  v18 = v10;
  v19 = self;
  v11 = v9;
  v20 = v11;
  objc_msgSend(v11, "perform:", v17);
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "replyQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100037218;
    v14[3] = &unk_1002BB450;
    v16 = v7;
    v15 = v11;
    objc_msgSend(v15, "notifyOnQueue:block:", v13, v14);

  }
}

+ (id)filterFriends:(id)a3 filter:(int)a4
{
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSArray v9;
  uint64_t v10;

  v5 = a3;
  if (a3)
  {
    v6 = type metadata accessor for GKFilterableFriend();
    v5 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  }
  v7 = sub_10016162C((uint64_t)v5, a4);
  swift_bridgeObjectRelease(v5, v8);
  if (v7)
  {
    type metadata accessor for GKFilterableFriend();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7, v10);
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

@end
