@implementation NDCredentialStorage

- (NDCredentialStorage)initWithDelegate:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  NDCredentialStorage *v8;
  NDCredentialStorage *v9;
  uint64_t v10;
  NSMutableDictionary *cachedCredentials;
  uint64_t v12;
  NSMutableDictionary *cachedDefaultCredentialUsers;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NDCredentialStorage;
  v8 = -[NDCredentialStorage init](&v21, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_bundleID, a4);
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cachedCredentials = v9->_cachedCredentials;
    v9->_cachedCredentials = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cachedDefaultCredentialUsers = v9->_cachedDefaultCredentialUsers;
    v9->_cachedDefaultCredentialUsers = (NSMutableDictionary *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create("com.apple.nsurlsessiond.credential-storage-queue", v17);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v18;

  }
  return v9;
}

- (void)populateWithInitialCredentials
{
  id WeakRetained;
  void *v4;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000EAC4;
    v5[3] = &unk_1000B1A30;
    v5[4] = self;
    objc_msgSend(v4, "credStorage_getInitialCredentialDictionariesWithReply:", v5);
  }

}

- (id)credentialsForProtectionSpace:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_1000B1A70));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000525F4;
    v21[3] = &unk_1000B1A98;
    v21[4] = self;
    v22 = v4;
    objc_msgSend(v7, "credStorage_credentialsForProtectionSpace:reply:", v22, v21);

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100051FD0;
  v19 = sub_100051FE0;
  v20 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052690;
  block[3] = &unk_1000B20E0;
  v13 = v4;
  v14 = &v15;
  block[4] = self;
  v9 = v4;
  dispatch_sync(queue, block);
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (id)allCredentials
{
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_1000B1AB8));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100052440;
    v16[3] = &unk_1000B1AE0;
    v16[4] = self;
    objc_msgSend(v5, "credStorage_allCredentialsWithReply:", v16);

  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_100051FD0;
  v14 = sub_100051FE0;
  queue = self->_queue;
  v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000524C8;
  block[3] = &unk_1000B1B08;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(queue, block);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)setCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v12)
    objc_msgSend(v12, "credStorage_setCredential:forProtectionSpace:", v6, v7);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052344;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_sync(queue, block);

}

- (void)removeCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v12)
    objc_msgSend(v12, "credStorage_setCredential:forProtectionSpace:", v6, v7);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000522C0;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_sync(queue, block);

}

- (id)defaultCredentialForProtectionSpace:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *queue;
  NSObject *v19;
  id v20;
  id v21;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &stru_1000B1B28));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100051E1C;
    v36[3] = &unk_1000B1B50;
    v36[4] = self;
    v37 = v4;
    objc_msgSend(v7, "credStorage_defaultCredentialForProtectionSpace:reply:", v37, v36);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
  if (!objc_msgSend(v8, "isInSyncBubble") || !self->_bundleID)
    goto LABEL_9;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedCredentials, "objectForKeyedSubscript:", v4));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("__com.apple.CFNetwork.prefix__"), v10, self->_bundleID));

    v11 = objc_alloc((Class)NSURLProtectionSpace);
    v12 = objc_msgSend(v4, "port");
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "protocol"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "realm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authenticationMethod"));
    v15 = objc_msgSend(v11, "initWithHost:port:protocol:realm:authenticationMethod:", v8, v12, v23, v13, v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredentialStorage sharedCredentialStorage](NSURLCredentialStorage, "sharedCredentialStorage"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "defaultCredentialForProtectionSpace:", v15));

    if (v17)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100051EB8;
      block[3] = &unk_1000B20B8;
      block[4] = self;
      v34 = v4;
      v35 = v17;
      dispatch_sync(queue, block);

    }
LABEL_9:

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100051FD0;
  v31 = sub_100051FE0;
  v32 = 0;
  v19 = self->_queue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100051FE8;
  v24[3] = &unk_1000B20E0;
  v24[4] = self;
  v25 = v4;
  v26 = &v27;
  v20 = v4;
  dispatch_sync(v19, v24);
  v21 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v21;
}

- (void)setDefaultCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "getClientProxy"));

  if (v12)
    objc_msgSend(v12, "credStorage_setDefaultCredential:forProtectionSpace:", v6, v7);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051CC4;
  block[3] = &unk_1000B20B8;
  block[4] = self;
  v14 = v7;
  v15 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_sync(queue, block);

}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100051C84;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NDCredentialStorageDelegate)delegate
{
  return (NDCredentialStorageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedDefaultCredentialUsers, 0);
  objc_storeStrong((id *)&self->_cachedCredentials, 0);
}

@end
