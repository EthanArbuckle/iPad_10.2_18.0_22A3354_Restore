@implementation GKService

- (id)transactionGroupBypassingMultiUser
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKService.m", 138, "-[GKService transactionGroupBypassingMultiUser]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v3));

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_localPlayer, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v11)), "initWithTransport:forClient:localPlayer:credential:", v10, v9, v8, 0);

  return v12;
}

+ (id)serviceFromService:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(a1, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localPlayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "credential"));

  v11 = objc_msgSend(v6, "initWithTransport:forClient:localPlayer:credential:", v7, v8, v9, v10);
  return v11;
}

- (id)transactionGroupWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService localPlayer](self, "localPlayer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:forPlayerID:](self, "transactionGroupWithName:forPlayerID:", v4, v6));

  return v7;
}

- (id)transactionGroupWithName:(id)a3 forPlayerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transactionGroupWithName:forPlayerID:", v7, v6));

  return v9;
}

- (GKPlayerInternal)localPlayer
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 24, 1);
}

- (GKClientProxy)clientProxy
{
  return (GKClientProxy *)objc_getProperty(self, a2, 8, 1);
}

+ (id)serviceWithTransport:(id)a3 forClient:(id)a4 credential:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_alloc((Class)objc_opt_class(a1, v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerInternal"));
  v14 = objc_msgSend(v12, "initWithTransport:forClient:localPlayer:credential:", v10, v9, v13, v8);

  return v14;
}

- (GKService)initWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GKService *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)GKService;
  v14 = -[GKService init](&v22, "init");
  if (v14)
  {
    if (!v13)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountName"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accountName"));
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "credentialForUsername:environment:", v17, objc_msgSend(v11, "environment")));

        if (!v12)
          goto LABEL_9;
        goto LABEL_10;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "credential"));

      if (!v18)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerCredentialController sharedController](GKPlayerCredentialController, "sharedController"));
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "primaryCredentialForEnvironment:", objc_msgSend(v11, "environment")));

        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerInternal"));
        v12 = (id)v21;
        if (v21)
          goto LABEL_10;
        goto LABEL_9;
      }
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "credential"));
    }
    if (!v12)
LABEL_9:
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playerInternal"));
LABEL_10:
    -[GKService _coreInitWithTransport:forClient:localPlayer:credential:](v14, "_coreInitWithTransport:forClient:localPlayer:credential:", v10, v11, v12, v13);
  }

  return v14;
}

- (void)_coreInitWithTransport:(id)a3 forClient:(id)a4 localPlayer:(id)a5 credential:(id)a6
{
  GKDataTransport *v10;
  id v11;
  id v12;
  GKPlayerCredential **p_credential;
  GKPlayerCredential *v14;
  GKPlayerCredential *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  GKDataTransport *transport;
  id v20;

  v10 = (GKDataTransport *)a3;
  v20 = a4;
  v11 = a5;
  v12 = a6;
  objc_storeStrong((id *)&self->_clientProxy, a4);
  objc_storeStrong((id *)&self->_localPlayer, a5);
  p_credential = &self->_credential;
  objc_storeStrong((id *)&self->_credential, a6);
  if (!v10)
    v10 = (GKDataTransport *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "transportWithCredential:", v12));
  v14 = *p_credential;
  if (*p_credential)
  {
    v15 = (GKPlayerCredential *)objc_claimAutoreleasedReturnValue(-[GKDataTransport credential](v10, "credential"));

    if (v14 != v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport storeBag](v10, "storeBag"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKDataTransport clientProxy](v10, "clientProxy"));
      v18 = objc_claimAutoreleasedReturnValue(+[GKDataTransport transportWithBag:clientProxy:credential:](GKDataTransport, "transportWithBag:clientProxy:credential:", v16, v17, *p_credential));

      v10 = (GKDataTransport *)v18;
    }
  }
  transport = self->_transport;
  self->_transport = v10;

}

- (BOOL)requiresAuthentication
{
  return 1;
}

- (GKDataTransport)transport
{
  return (GKDataTransport *)objc_getProperty(self, a2, 16, 1);
}

- (GKPlayerCredential)credential
{
  return (GKPlayerCredential *)objc_getProperty(self, a2, 32, 1);
}

- (GKService)initWithoutCredentialWithTransport:(id)a3 forClient:(id)a4
{
  id v6;
  id v7;
  GKService *v8;
  GKService *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKService;
  v8 = -[GKService init](&v11, "init");
  v9 = v8;
  if (v8)
    -[GKService _coreInitWithTransport:forClient:localPlayer:credential:](v8, "_coreInitWithTransport:forClient:localPlayer:credential:", v6, v7, 0, 0);

  return v9;
}

+ (id)serviceForBundleID:(id)a3 localPlayer:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy clientForBundleID:](GKClientProxy, "clientForBundleID:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceWithTransport:forClient:localPlayer:", 0, v7, v6));

  return v8;
}

+ (unint64_t)requiredEntitlements
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclasses must override +requiredEntitlements.")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKService.m"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v2, "+[GKService requiredEntitlements]", objc_msgSend(v4, "UTF8String"), 111));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v5);
  return 0;
}

+ (Class)interfaceClass
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclasses must override +interfaceClass.")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKService.m"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v2, "+[GKService interfaceClass]", objc_msgSend(v4, "UTF8String"), 117));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v5);
  return 0;
}

- (id)transportBypassingMultiUser
{
  return self->_transport;
}

- (void)setClientProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setTransport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setLocalPlayer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end
