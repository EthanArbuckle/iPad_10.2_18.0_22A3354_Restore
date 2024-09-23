@implementation BKiAPController

- (BKiAPController)init
{
  BKiAPController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKiAPController;
  v2 = -[BKiAPController init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setPlaybackQueueCommand"));
    v5 = BKCarPlayLog(objc_msgSend(v4, "setEnabled:", 1));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1006A19B0(v6);

    objc_msgSend(v4, "addTarget:action:", v2, "handleSetPlaybackQueueCommand:completionHandler:");
  }
  return v2;
}

+ (void)setup
{
  if (qword_1009F5080 != -1)
    dispatch_once(&qword_1009F5080, &stru_1008EBB18);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setPlaybackQueueCommand"));
  objc_msgSend(v4, "removeTarget:", self);

  v5.receiver = self;
  v5.super_class = (Class)BKiAPController;
  -[BKiAPController dealloc](&v5, "dealloc");
}

- (id)_currentMediaItemFromQuery:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10004E438;
  v19 = sub_10004E290;
  v20 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100128AAC;
    v13[3] = &unk_1008EBB40;
    v13[4] = v14;
    v13[5] = &v15;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);

    _Block_object_dispose(v14, 8);
  }
  v7 = (void *)v16[5];
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = (void *)v16[5];
    v16[5] = v9;

    v7 = (void *)v16[5];
  }
  v11 = v7;
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (void)handleSetPlaybackQueueCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  BKiAPController *v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = BKCarPlayLog(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received handleSetPlaybackQueueCommand:completionHandler:", buf, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
  objc_msgSend(v10, "setSuppressOpenLastBook:", 1);
  kdebug_trace(725353452, 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appLaunchCoordinator"));
  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100128CBC;
    v12[3] = &unk_1008E9110;
    v13 = v6;
    v14 = self;
    v15 = v7;
    objc_msgSend(v11, "appLaunchCoordinatorOnConditionMask:blockID:performBlock:", 2, CFSTR("Audiobook playback queue request"), v12);

  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 200);
  }

}

@end
