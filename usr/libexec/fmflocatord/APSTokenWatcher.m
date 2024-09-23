@implementation APSTokenWatcher

+ (id)sharedInstance
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (qword_1000697E8 != -1)
    dispatch_once(&qword_1000697E8, &stru_100056598);
  v2 = (void *)qword_1000697E0;
  if (!qword_1000697E0)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** The APSTokenWatcher singleton seems to have been deallocated. This is unexpected & damaging.", v6, 2u);
    }

    v2 = (void *)qword_1000697E0;
  }
  return v2;
}

- (APSTokenWatcher)init
{
  APSTokenWatcher *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)APSTokenWatcher;
  v2 = -[APSTokenWatcher init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)APSConnection);
    v4 = objc_msgSend(v3, "initWithEnvironmentName:namedDelegatePort:queue:", APSEnvironmentProduction, CFSTR("com.apple.icloud.fmflocatord.APSTokenWatcher.prod"), &_dispatch_main_q);
    -[APSTokenWatcher setProdConnection:](v2, "setProdConnection:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher prodConnection](v2, "prodConnection"));
    objc_msgSend(v5, "setDelegate:", v2);

    v6 = objc_alloc((Class)APSConnection);
    v7 = objc_msgSend(v6, "initWithEnvironmentName:namedDelegatePort:queue:", APSEnvironmentDevelopment, CFSTR("com.apple.icloud.fmflocatord.APSTokenWatcher.dev"), &_dispatch_main_q);
    -[APSTokenWatcher setDevConnection:](v2, "setDevConnection:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher devConnection](v2, "devConnection"));
    objc_msgSend(v8, "setDelegate:", v2);

  }
  return v2;
}

- (NSArray)tokenList
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher prodToken](self, "prodToken"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher prodToken](self, "prodToken"));
    objc_msgSend(v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher devToken](self, "devToken"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher devToken](self, "devToken"));
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = objc_msgSend(v3, "copy");

  return (NSArray *)v8;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher prodConnection](self, "prodConnection"));

  if (v8 == v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_hexString"));
    v13 = objc_claimAutoreleasedReturnValue(-[APSTokenWatcher prodToken](self, "prodToken"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher prodToken](self, "prodToken"));
      v16 = objc_msgSend(v15, "isEqualToString:", v12);

      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
    -[APSTokenWatcher setProdToken:](self, "setProdToken:", v12);
LABEL_12:

    v11 = objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:userInfo:](NSNotification, "notificationWithName:object:userInfo:", CFSTR("kAPSTokenWatcherUpdatedNotification"), self, 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationQueue defaultQueue](NSNotificationQueue, "defaultQueue"));
    objc_msgSend(v21, "enqueueNotification:postingStyle:coalesceMask:forModes:", v11, 2, 3, 0);

LABEL_13:
    goto LABEL_14;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher devConnection](self, "devConnection"));

  if (v9 != v6)
  {
    v10 = sub_10001C4E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000357B8((uint64_t)v6, v11);
    goto LABEL_13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fm_hexString"));
  v17 = objc_claimAutoreleasedReturnValue(-[APSTokenWatcher devToken](self, "devToken"));
  if (!v17
    || (v18 = (void *)v17,
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSTokenWatcher devToken](self, "devToken")),
        v20 = objc_msgSend(v19, "isEqualToString:", v12),
        v19,
        v18,
        (v20 & 1) == 0))
  {
    -[APSTokenWatcher setDevToken:](self, "setDevToken:", v12);
    goto LABEL_12;
  }
LABEL_10:

LABEL_14:
}

- (APSConnection)prodConnection
{
  return self->_prodConnection;
}

- (void)setProdConnection:(id)a3
{
  objc_storeStrong((id *)&self->_prodConnection, a3);
}

- (APSConnection)devConnection
{
  return self->_devConnection;
}

- (void)setDevConnection:(id)a3
{
  objc_storeStrong((id *)&self->_devConnection, a3);
}

- (NSString)prodToken
{
  return self->_prodToken;
}

- (void)setProdToken:(id)a3
{
  objc_storeStrong((id *)&self->_prodToken, a3);
}

- (NSString)devToken
{
  return self->_devToken;
}

- (void)setDevToken:(id)a3
{
  objc_storeStrong((id *)&self->_devToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devToken, 0);
  objc_storeStrong((id *)&self->_prodToken, 0);
  objc_storeStrong((id *)&self->_devConnection, 0);
  objc_storeStrong((id *)&self->_prodConnection, 0);
}

@end
