@implementation GKAuthenticationWrapperService

- (GKAuthenticationWrapperService)initWithClient:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("initWithClient: is not the designated initialier for GKAuthenticationWrapperService, use initWithService:queue: instead.")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKAuthenticationWrapperService initWithClient:]", objc_msgSend(v6, "UTF8String"), 31));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  return 0;
}

- (void)_buildSignatureLookupForProtocol:(id)a3
{
  Protocol *v4;
  NSDictionary *v5;
  objc_method_description *v6;
  objc_method_description *v7;
  unsigned int v8;
  objc_method_description *v9;
  NSString *v10;
  void *v11;
  void *v12;
  objc_method_description *v13;
  objc_method_description *v14;
  unsigned int v15;
  objc_method_description *v16;
  NSString *v17;
  void *v18;
  void *v19;
  NSDictionary *signatureLookup;
  unsigned int outCount;

  v4 = (Protocol *)a3;
  v5 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  outCount = 0;
  v6 = protocol_copyMethodDescriptionList(v4, 1, 1, &outCount);
  v7 = v6;
  if (outCount)
  {
    v8 = 0;
    v9 = v6;
    do
    {
      v10 = NSStringFromSelector(v9->name);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v9->types));
      -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, v11);

      ++v8;
      ++v9;
    }
    while (v8 < outCount);
  }
  free(v7);
  v13 = protocol_copyMethodDescriptionList(v4, 0, 1, &outCount);
  v14 = v13;
  if (outCount)
  {
    v15 = 0;
    v16 = v13;
    do
    {
      v17 = NSStringFromSelector(v16->name);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMethodSignature signatureWithObjCTypes:](NSMethodSignature, "signatureWithObjCTypes:", v16->types));
      -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v19, v18);

      ++v15;
      ++v16;
    }
    while (v15 < outCount);
  }
  free(v14);
  signatureLookup = self->_signatureLookup;
  self->_signatureLookup = v5;

}

- (GKAuthenticationWrapperService)initWithService:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GKAuthenticationWrapperService *v13;
  uint64_t v14;
  id v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localPlayer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "credential"));
  v18.receiver = self;
  v18.super_class = (Class)GKAuthenticationWrapperService;
  v13 = -[GKService initWithTransport:forClient:localPlayer:credential:](&v18, "initWithTransport:forClient:localPlayer:credential:", v9, v10, v11, v12);

  if (v13)
  {
    objc_storeStrong((id *)&v13->_service, a3);
    objc_storeStrong((id *)&v13->_authQueue, a4);
    v15 = objc_msgSend(objc_msgSend((id)objc_opt_class(v13->_service, v14), "interfaceClass"), "interfaceProtocol");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[GKAuthenticationWrapperService _buildSignatureLookupForProtocol:](v13, "_buildSignatureLookupForProtocol:", v16);

  }
  return v13;
}

+ (id)authenticationWrapperForService:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProxy"));

  if (v5)
  {
    v7 = objc_alloc((Class)objc_opt_class(a1, v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientProxy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authQueue"));
    v10 = objc_msgSend(v7, "initWithService:queue:", v4, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)serviceForClient:(id)a3 player:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("serviceForClient: is not a valid factory for GKAuthenticationWrapperService, use authenticationWrapperForService:queue: instead."), a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "+[GKAuthenticationWrapperService serviceForClient:player:]", objc_msgSend(v6, "UTF8String"), 85));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  return 0;
}

+ (id)serviceForBundleID:(id)a3 player:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("serviceForBundleID: is not a valid factory for GKAuthenticationWrapperService, use authenticationWrapperForService:queue: instead."), a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "+[GKAuthenticationWrapperService serviceForBundleID:player:]", objc_msgSend(v6, "UTF8String"), 91));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  return 0;
}

- (void)isAppUnlistedAndDisallowed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "replyQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009990C;
  v8[3] = &unk_1002BB450;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)authenticatePlayerWithExistingCredentialsWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService authenticatePlayerWithExistingCredentialsWithHandler:]", objc_msgSend(v8, "UTF8String"), 106));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v12 = (id)objc_claimAutoreleasedReturnValue(-[GKService transport](self->_service, "transport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self->_service, "clientProxy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GKService serviceWithTransport:forClient:localPlayer:](GKAccountServicePrivate, "serviceWithTransport:forClient:localPlayer:", v12, v10, 0));
  -[GKAuthenticationWrapperService authenticateWithService:username:password:handler:](self, "authenticateWithService:username:password:handler:", v11, 0, 0, v5);

}

- (void)generateIdentityVerificationSignatureWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *authQueue;
  id v13;
  _QWORD block[5];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "wrapper generateIdentityVerificationSignatureWithCompletionHandler:", buf, 2u);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v8, "-[GKAuthenticationWrapperService generateIdentityVerificationSignatureWithCompletionHandler:]", objc_msgSend(v10, "UTF8String"), 113));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099C8C;
  block[3] = &unk_1002BB758;
  block[4] = self;
  v15 = v5;
  v13 = v5;
  dispatch_async(authQueue, block);

}

- (void)fetchItemsForIdentityVerificationSignature:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *authQueue;
  id v13;
  _QWORD block[5];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "wrapper fetchItemsForIdentityVerificationSignature:", buf, 2u);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v8, "-[GKAuthenticationWrapperService fetchItemsForIdentityVerificationSignature:]", objc_msgSend(v10, "UTF8String"), 130));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099F4C;
  block[3] = &unk_1002BB758;
  block[4] = self;
  v15 = v5;
  v13 = v5;
  dispatch_async(authQueue, block);

}

- (void)didShowSignInBanner
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v3, "-[GKAuthenticationWrapperService didShowSignInBanner]", objc_msgSend(v5, "UTF8String"), 146));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  }
  -[GKService didShowSignInBanner](self->_service, "didShowSignInBanner");
}

- (void)didShowFullscreenSignIn
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v3, "-[GKAuthenticationWrapperService didShowFullscreenSignIn]", objc_msgSend(v5, "UTF8String"), 152));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  }
  -[GKService didShowFullscreenSignIn](self->_service, "didShowFullscreenSignIn");
}

- (void)signOutPlayerWithOptOut:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *authQueue;
  id v15;
  _QWORD block[5];
  id v17;
  BOOL v18;
  uint8_t buf[4];
  _BOOL8 v20;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "wrapper signOutPlayerWithOptOut:%lu", buf, 0xCu);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v10, "-[GKAuthenticationWrapperService signOutPlayerWithOptOut:handler:]", objc_msgSend(v12, "UTF8String"), 159));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009A450;
  block[3] = &unk_1002C0440;
  v18 = v4;
  block[4] = self;
  v17 = v7;
  v15 = v7;
  dispatch_barrier_async(authQueue, block);

}

- (void)setupAccountForParameters:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  GKService *service;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  v10 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "wrapper setupAccountForParameters:handler:", buf, 2u);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v11, "-[GKAuthenticationWrapperService setupAccountForParameters:handler:]", objc_msgSend(v13, "UTF8String"), 190));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  service = self->_service;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009A8D8;
  v17[3] = &unk_1002BC0D0;
  v18 = v8;
  v16 = v8;
  -[GKService setupAccountForParameters:handler:](service, "setupAccountForParameters:handler:", v6, v17);

}

- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 altDSID:(id)a6 isGame:(BOOL)a7 usingFastPath:(BOOL)a8 displayAuthUI:(BOOL)a9 handler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  GKAccountServicePrivate *v24;
  void *v25;
  GKAccountServicePrivate *v26;
  GKAccountServicePrivate *v27;
  void *v28;
  CFAbsoluteTime Current;
  NSObject *authQueue;
  id v31;
  id v32;
  id v33;
  id v34;
  GKAccountServicePrivate *v35;
  _QWORD v36[4];
  GKAccountServicePrivate *v37;
  id v38;
  id v39;
  id v40;
  GKAuthenticationWrapperService *v41;
  id v42;
  CFAbsoluteTime v43;
  BOOL v44;
  BOOL v45;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a10;
  v21 = v20;
  if (!os_log_GKGeneral)
    v22 = (id)GKOSLoggers(v20);
  v23 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "wrapper authenticateWithService:", buf, 2u);
  }
  v24 = (GKAccountServicePrivate *)v16;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GKService credential](v24, "credential"));

  v26 = v24;
  if (v25)
  {
    v27 = [GKAccountServicePrivate alloc];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
    v26 = -[GKService initWithoutCredentialWithTransport:forClient:](v27, "initWithoutCredentialWithTransport:forClient:", 0, v28);

  }
  Current = CFAbsoluteTimeGetCurrent();
  authQueue = self->_authQueue;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10009AAF4;
  v36[3] = &unk_1002C0888;
  v37 = v26;
  v38 = v17;
  v39 = v18;
  v40 = v19;
  v44 = a7;
  v45 = a8;
  v41 = self;
  v42 = v21;
  v43 = Current;
  v31 = v21;
  v32 = v19;
  v33 = v18;
  v34 = v17;
  v35 = v26;
  dispatch_barrier_async(authQueue, v36);

}

- (void)authenticateWithService:(id)a3 username:(id)a4 password:(id)a5 handler:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[GKAuthenticationWrapperService authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:](self, "authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:", a3, a4, a5, 0, 1, 0, v6, a6);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 usingFastPath:(BOOL)a5 displayAuthUI:(BOOL)a6 handler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v9 = a5;
  v19 = a3;
  v12 = a4;
  v13 = a7;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v14, "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:usingFastPath:displayAuthUI:handler:]", objc_msgSend(v16, "UTF8String"), 330));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v17);
  }
  LOBYTE(v18) = a6;
  -[GKAuthenticationWrapperService authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:](self, "authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:", self->_service, v19, v12, 0, 1, v9, v18, v13);

}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 usingFastPath:(BOOL)a6 handler:(id)a7
{
  -[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:](self, "authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:", a3, a4, a5, 1, a6, a7);
}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 altDSID:(id)a5 isGame:(BOOL)a6 usingFastPath:(BOOL)a7 handler:(id)a8
{
  uint64_t v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  unsigned int v22;
  id v23;

  v9 = a7;
  v10 = a6;
  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v22 = v9;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v17, "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:altDSID:isGame:usingFastPath:handler:]", objc_msgSend(v19, "UTF8String"), 348));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v20);
    v9 = v22;
  }
  LOBYTE(v21) = 0;
  -[GKAuthenticationWrapperService authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:](self, "authenticateWithService:username:password:altDSID:isGame:usingFastPath:displayAuthUI:handler:", self->_service, v23, v14, v15, v10, v9, v21, v16);

}

- (void)authenticatePlayerWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v10, "-[GKAuthenticationWrapperService authenticatePlayerWithUsername:password:handler:]", objc_msgSend(v12, "UTF8String"), 370));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  -[GKAuthenticationWrapperService authenticateWithService:username:password:handler:](self, "authenticateWithService:username:password:handler:", self->_service, v14, v8, v9);

}

- (void)validateAccountWithUsername:(id)a3 password:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  GKService *service;
  id v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v11, "-[GKAuthenticationWrapperService validateAccountWithUsername:password:handler:]", objc_msgSend(v13, "UTF8String"), 378));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }
  service = self->_service;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10009B7F8;
  v17[3] = &unk_1002BC080;
  v18 = v10;
  v16 = v10;
  -[GKService validateAccountWithUsername:password:handler:](service, "validateAccountWithUsername:password:handler:", v8, v9, v17);

}

- (void)getAccountAuthTokenWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v4, "-[GKAuthenticationWrapperService getAccountAuthTokenWithHandler:]", objc_msgSend(v6, "UTF8String"), 387));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  -[GKService getAccountAuthTokenWithHandler:](self->_service, "getAccountAuthTokenWithHandler:", v8);

}

- (void)getDevicePushTokenWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v4, "-[GKAuthenticationWrapperService getDevicePushTokenWithHandler:]", objc_msgSend(v6, "UTF8String"), 393));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  -[GKService getDevicePushTokenWithHandler:](self->_service, "getDevicePushTokenWithHandler:", v8);

}

- (void)isICloudAvailableWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v4, "-[GKAuthenticationWrapperService isICloudAvailableWithHandler:]", objc_msgSend(v6, "UTF8String"), 399));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  -[GKService isICloudAvailableWithHandler:](self->_service, "isICloudAvailableWithHandler:", v8);

}

- (void)notifyClient:(id)a3 playerAuthenticatedFromClient:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v7, "-[GKAuthenticationWrapperService notifyClient:playerAuthenticatedFromClient:]", objc_msgSend(v9, "UTF8String"), 405));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }
  -[GKService notifyClient:playerAuthenticatedFromClient:](self->_service, "notifyClient:playerAuthenticatedFromClient:", v11, v6);

}

- (void)resetCredentialsWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService resetCredentialsWithHandler:]", objc_msgSend(v8, "UTF8String"), 411));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "signOutPlayerWithOptOut:handler:", 0, v5);

}

- (void)setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v5, "-[GKAuthenticationWrapperService setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:]", objc_msgSend(v7, "UTF8String"), 417));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v9, "setLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayer:", a3);

}

- (void)getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:]", objc_msgSend(v8, "UTF8String"), 423));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "getLastWelcomeWhatsNewCopyVersionDisplayedForSignedInPlayerWithHandler:", v5);

}

- (void)setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v5, "-[GKAuthenticationWrapperService setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:]", objc_msgSend(v7, "UTF8String"), 429));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v9, "setLastPrivacyNoticeVersionDisplayedForSignedInPlayer:", a3);

}

- (void)getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:]", objc_msgSend(v8, "UTF8String"), 435));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "getLastPrivacyNoticeVersionDisplayedForSignedInPlayerWithHandler:", v5);

}

- (void)setLastPersonalizationVersionDisplayedForSignedInPlayer:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService setLastPersonalizationVersionDisplayedForSignedInPlayer:]", objc_msgSend(v8, "UTF8String"), 441));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "setLastPersonalizationVersionDisplayedForSignedInPlayer:", v5);

}

- (void)getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:]", objc_msgSend(v8, "UTF8String"), 447));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "getLastPersonalizationVersionDisplayedForSignedInPlayerWithHandler:", v5);

}

- (void)setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:]", objc_msgSend(v8, "UTF8String"), 453));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "setLastFriendSuggestionsVersionDisplayedForSignedInPlayer:", v5);

}

- (void)getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:]", objc_msgSend(v8, "UTF8String"), 459));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "getLastFriendSuggestionsVersionDisplayedForSignedInPlayerWithHandler:", v5);

}

- (void)setLastProfilePrivacyVersionDisplayedForSignedInPlayer:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService setLastProfilePrivacyVersionDisplayedForSignedInPlayer:]", objc_msgSend(v8, "UTF8String"), 465));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "setLastProfilePrivacyVersionDisplayedForSignedInPlayer:", v5);

}

- (void)getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:]", objc_msgSend(v8, "UTF8String"), 471));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "getLastProfilePrivacyVersionDisplayedForSignedInPlayerWithHandler:", v5);

}

- (void)setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:]", objc_msgSend(v8, "UTF8String"), 477));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "setLastContactsIntegrationConsentVersionDisplayedForSignedInPlayer:", v5);

}

- (void)getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:]", objc_msgSend(v8, "UTF8String"), 483));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "getLastContactsIntegrationConsentVersionDisplayedForSignedInPlayerWithHandler:", v5);

}

- (void)getOnboardingInfoForPlayerID:(id)a3 withCompletion:(id)a4
{
  GKService *service;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  service = self->_service;
  v7 = a4;
  v8 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v9, "-[GKAuthenticationWrapperService getOnboardingInfoForPlayerID:withCompletion:]", objc_msgSend(v11, "UTF8String"), 488));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v13, "getOnboardingInfoForPlayerID:withCompletion:", v8, v7);

}

- (void)notifyWidgetPlayerAuthenticationUpdated
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v3, "-[GKAuthenticationWrapperService notifyWidgetPlayerAuthenticationUpdated]", objc_msgSend(v5, "UTF8String"), 493));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v7, "notifyWidgetPlayerAuthenticationUpdated");

}

- (void)getAccountAgeCategoryForPlayerID:(id)a3 withCompletion:(id)a4
{
  GKService *service;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  service = self->_service;
  v7 = a4;
  v8 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v9, "-[GKAuthenticationWrapperService getAccountAgeCategoryForPlayerID:withCompletion:]", objc_msgSend(v11, "UTF8String"), 500));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v13, "getAccountAgeCategoryForPlayerID:withCompletion:", v8, v7);

}

- (void)checkActivitySharingRepromptWithCompletion:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService checkActivitySharingRepromptWithCompletion:]", objc_msgSend(v8, "UTF8String"), 506));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "checkActivitySharingRepromptWithCompletion:", v5);

}

- (void)setActivitySharingRepromptLastTriggerDate:(id)a3
{
  GKService *service;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  service = self->_service;
  v5 = a3;
  if ((-[GKService conformsToProtocol:](service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountService) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountService protocol!")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountService)])\n[%s (%s:%d)]"), v6, "-[GKAuthenticationWrapperService setActivitySharingRepromptLastTriggerDate:]", objc_msgSend(v8, "UTF8String"), 511));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKService serviceFromService:](GKAccountServicePrivate, "serviceFromService:", self));
  objc_msgSend(v10, "setActivitySharingRepromptLastTriggerDate:", v5);

}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 finished:(BOOL)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *authQueue;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  uint8_t buf[16];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = v18;
  if (!os_log_GKGeneral)
    v20 = (id)GKOSLoggers(v18);
  v21 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "wrapper accountCreated:", buf, 2u);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v32 = a7;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v22, "-[GKAuthenticationWrapperService accountCreated:playerID:authenticationToken:alias:finished:handler:]", objc_msgSend(v24, "UTF8String"), 524));

    a7 = v32;
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v25);

  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D430;
  block[3] = &unk_1002C08B0;
  block[4] = self;
  v34 = v14;
  v35 = v15;
  v36 = v16;
  v39 = a7;
  v37 = v17;
  v38 = v19;
  v27 = v19;
  v28 = v17;
  v29 = v16;
  v30 = v15;
  v31 = v14;
  dispatch_barrier_async(authQueue, block);

}

- (void)accountCreated:(id)a3 playerID:(id)a4 authenticationToken:(id)a5 alias:(id)a6 altDSID:(id)a7 finished:(BOOL)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  BOOL v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *authQueue;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  BOOL v47;
  uint8_t buf[16];

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = v20;
  if (!os_log_GKGeneral)
    v22 = (id)GKOSLoggers(v20);
  v23 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "wrapper accountCreated:", buf, 2u);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v39 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v38 = v18;
    v25 = v17;
    v26 = v16;
    v27 = a8;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent")));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v24, "-[GKAuthenticationWrapperService accountCreated:playerID:authenticationToken:alias:altDSID:finished:handler:]", objc_msgSend(v29, "UTF8String"), 559));

    a8 = v27;
    v16 = v26;
    v17 = v25;
    v18 = v38;

    v15 = v39;
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v30);

  }
  authQueue = self->_authQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DA70;
  block[3] = &unk_1002C0900;
  block[4] = self;
  v41 = v15;
  v42 = v16;
  v43 = v17;
  v44 = v18;
  v45 = v19;
  v47 = a8;
  v46 = v21;
  v32 = v21;
  v33 = v19;
  v34 = v18;
  v35 = v17;
  v36 = v16;
  v37 = v15;
  dispatch_barrier_async(authQueue, block);

}

- (void)accountEdited:(id)a3 alias:(id)a4 firstName:(id)a5 lastName:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  GKService *service;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!os_log_GKGeneral)
    v18 = (id)GKOSLoggers(v16);
  v19 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "wrapper accountEdited:", buf, 2u);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v26 = v12;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v20, "-[GKAuthenticationWrapperService accountEdited:alias:firstName:lastName:handler:]", objc_msgSend(v22, "UTF8String"), 592));

    v12 = v26;
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v23);

  }
  service = self->_service;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10009E04C;
  v27[3] = &unk_1002BB540;
  v28 = v17;
  v25 = v17;
  -[GKService accountEdited:alias:firstName:lastName:handler:](service, "accountEdited:alias:firstName:lastName:handler:", v12, v13, v14, v15, v27);

}

- (void)setLoginStatus:(unint64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  GKService *service;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[16];

  v6 = a4;
  v7 = v6;
  if (!os_log_GKGeneral)
    v8 = (id)GKOSLoggers(v6);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "wrapper setLoginStatus:", buf, 2u);
  }
  if ((-[GKService conformsToProtocol:](self->_service, "conformsToProtocol:", &OBJC_PROTOCOL___GKAccountServicePrivate) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Wrapped service must conform to the GKAccountServicePrivate protocol!")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKAuthenticationWrapperService.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([_service conformsToProtocol:@protocol(GKAccountServicePrivate)])\n[%s (%s:%d)]"), v10, "-[GKAuthenticationWrapperService setLoginStatus:handler:]", objc_msgSend(v12, "UTF8String"), 603));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  service = self->_service;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10009E224;
  v16[3] = &unk_1002BC0D0;
  v17 = v7;
  v15 = v7;
  -[GKService setLoginStatus:handler:](service, "setLoginStatus:handler:", a3, v16);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  void *v11;
  id v12;
  objc_super v13;
  const __CFString *v14;
  void *v15;

  v13.receiver = self;
  v13.super_class = (Class)GKAuthenticationWrapperService;
  v5 = -[GKAuthenticationWrapperService methodSignatureForSelector:](&v13, "methodSignatureForSelector:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
    v7 = NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_signatureLookup, "objectForKeyedSubscript:", v8));
    if (!v9)
    {
      v14 = CFSTR("selector");
      v15 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("GKNoSuchServiceException"), CFSTR("Attempted to dispatch a selector which is not recognized by any service"), v11));

      objc_exception_throw(v12);
    }
    v6 = (void *)v9;

  }
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  NSObject *authQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[GKService requiresAuthenticationForSelector:](self->_service, "requiresAuthenticationForSelector:", objc_msgSend(v4, "selector")))
  {
    objc_msgSend(v4, "retainArguments");
    authQueue = self->_authQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10009E424;
    v6[3] = &unk_1002BB658;
    v6[4] = self;
    v7 = v4;
    dispatch_async(authQueue, v6);

  }
  else
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_service);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureLookup, 0);
  objc_storeStrong((id *)&self->_authQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
