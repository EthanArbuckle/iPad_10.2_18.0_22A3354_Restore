@implementation GKMultiplayerMatchServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x800000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(GKMultiplayerServicePrivateInterface, a2);
}

- (void)invitePlayersV2:(id)a3 toGame:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerMatchService.m", 2365, "-[GKMultiplayerMatchServicePrivate invitePlayersV2:toGame:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100089440;
  v23[3] = &unk_1002BB8A0;
  v13 = v9;
  v24 = v13;
  v25 = v12;
  v26 = v8;
  v14 = v8;
  v15 = v12;
  objc_msgSend(v15, "performOnManagedObjectContext:", v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "replyQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100089630;
  v20[3] = &unk_1002BB450;
  v21 = v13;
  v22 = v10;
  v18 = v13;
  v19 = v10;
  objc_msgSend(v15, "notifyOnQueue:block:", v17, v20);

}

@end
