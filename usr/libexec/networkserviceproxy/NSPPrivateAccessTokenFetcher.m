@implementation NSPPrivateAccessTokenFetcher

- (NSPPrivateAccessTokenFetcher)initWithChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSPPrivateAccessTokenFetcher *v14;
  const char *v15;
  uint64_t v16;
  NSPPrivateAccessTokenFetcher *v17;
  SEL v18;
  SEL v19;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v13 = v10;
  if (!v8)
  {
    v21 = nplog_obj(v10, v11, v12);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      v17 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v28 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v23 = "%s called with null challenge";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, v23, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v9)
  {
    v24 = nplog_obj(v10, v11, v12);
    v22 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v28 = "-[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]";
    v23 = "%s called with null tokenKey";
    goto LABEL_14;
  }
  v26.receiver = self;
  v26.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v14 = -[NSPPrivateAccessTokenFetcher init](&v26, "init");
  if (!v14)
  {
    v25 = nplog_obj(0, v15, v16);
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_12;
  }
  v17 = v14;
  objc_setProperty_atomic(v14, v15, v8, 48);
  objc_setProperty_atomic(v17, v18, v9, 64);
  objc_setProperty_atomic(v17, v19, v13, 72);
LABEL_5:

  return v17;
}

- (id)initForKnownIssuerWithChallenge:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSPPrivateAccessTokenFetcher *v7;
  const char *v8;
  uint64_t v9;
  NSPPrivateAccessTokenFetcher *v10;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;

  v6 = a3;
  if (!v6)
  {
    v12 = nplog_obj(0, v4, v5);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithChallenge:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%s called with null challenge", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v15.receiver = self;
  v15.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v7 = -[NSPPrivateAccessTokenFetcher init](&v15, "init");
  if (!v7)
  {
    v14 = nplog_obj(0, v8, v9);
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_10:

    v10 = 0;
    goto LABEL_4;
  }
  v10 = v7;
  objc_setProperty_atomic(v7, v8, v6, 48);
LABEL_4:

  return v10;
}

- (id)initForKnownIssuerWithLongLivedTokenChallenge:(id)a3 oneTimeTokenChallenge:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSPPrivateAccessTokenFetcher *v11;
  const char *v12;
  uint64_t v13;
  NSPPrivateAccessTokenFetcher *v14;
  SEL v15;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v6)
  {
    v17 = nplog_obj(v7, v8, v9);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

LABEL_12:
      v14 = 0;
      goto LABEL_5;
    }
    *(_DWORD *)buf = 136315138;
    v24 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    v19 = "%s called with null longLivedTokenChallenge";
LABEL_14:
    _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, v19, buf, 0xCu);
    goto LABEL_9;
  }
  if (!v7)
  {
    v20 = nplog_obj(0, v8, v9);
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    v24 = "-[NSPPrivateAccessTokenFetcher initForKnownIssuerWithLongLivedTokenChallenge:oneTimeTokenChallenge:]";
    v19 = "%s called with null oneTimeTokenChallenge";
    goto LABEL_14;
  }
  v22.receiver = self;
  v22.super_class = (Class)NSPPrivateAccessTokenFetcher;
  v11 = -[NSPPrivateAccessTokenFetcher init](&v22, "init");
  if (!v11)
  {
    v21 = nplog_obj(0, v12, v13);
    self = (NSPPrivateAccessTokenFetcher *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
    goto LABEL_12;
  }
  v14 = v11;
  objc_setProperty_atomic(v11, v12, v6, 48);
  objc_setProperty_atomic(v14, v15, v10, 56);
LABEL_5:

  return v14;
}

- (void)addSecondaryChallenge:(id)a3 tokenKey:(id)a4 originNameKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  NSPPrivateAccessTokenFetcher *v12;
  const char *v13;
  id v14;
  SEL v15;
  id Property;
  NSPPrivateAccessTokenFetcher *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v17 = -[NSPPrivateAccessTokenFetcher initWithChallenge:tokenKey:originNameKey:]([NSPPrivateAccessTokenFetcher alloc], "initWithChallenge:tokenKey:originNameKey:", v10, v9, v8);

  v12 = v17;
  if (v17)
  {
    if (self)
    {
      if (!objc_getProperty(self, v11, 80, 1))
      {
        v14 = objc_alloc_init((Class)NSMutableArray);
        objc_setProperty_atomic(self, v15, v14, 80);

      }
      Property = objc_getProperty(self, v13, 80, 1);
    }
    else
    {

      Property = 0;
    }
    objc_msgSend(Property, "addObject:", v17);
    v12 = v17;
  }

}

- (void)setCustomAttester:(id)a3 headers:(id)a4
{
  SEL v6;
  SEL v7;
  id newValue;

  if (self)
  {
    newValue = a4;
    objc_setProperty_atomic(self, v6, a3, 32);
    objc_setProperty_atomic(self, v7, newValue, 40);

  }
}

- (void)fetchTokenWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t ServerConnection;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v6)
  {
    v14 = nplog_obj(v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    v15 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    v16 = nplog_obj(0, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenWithQueue:completionHandler:]";
    v15 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  ServerConnection = getServerConnection();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000AD850;
  v17[3] = &unk_1000F7110;
  v18 = v6;
  v19 = v10;
  objc_msgSend(v12, "fetchPrivateAccessTokenWithFetcher:completionHandler:", self, v17);

  v13 = v18;
LABEL_4:

}

- (void)fetchTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t ServerConnection;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v6)
  {
    v14 = nplog_obj(v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    v15 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    v16 = nplog_obj(0, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher fetchTokenPairWithQueue:completionHandler:]";
    v15 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  ServerConnection = getServerConnection();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000ADB24;
  v17[3] = &unk_1000F7160;
  v18 = v6;
  v19 = v10;
  objc_msgSend(v12, "fetchPrivateAccessTokenPairWithFetcher:completionHandler:", self, v17);

  v13 = v18;
LABEL_4:

}

- (void)fetchLinkedTokenPairWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t ServerConnection;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v6)
  {
    v14 = nplog_obj(v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    v15 = "%s called with null queue";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v15, buf, 0xCu);
    goto LABEL_4;
  }
  if (!v7)
  {
    v16 = nplog_obj(0, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_4;
    *(_DWORD *)buf = 136315138;
    v21 = "-[NSPPrivateAccessTokenFetcher fetchLinkedTokenPairWithQueue:completionHandler:]";
    v15 = "%s called with null completionHandler";
    goto LABEL_9;
  }
  ServerConnection = getServerConnection();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000ADE20;
  v17[3] = &unk_1000F7160;
  v18 = v6;
  v19 = v10;
  objc_msgSend(v12, "fetchPrivateAccessTokenPairWithFetcher:completionHandler:", self, v17);

  v13 = v18;
LABEL_4:

}

+ (BOOL)checkOriginAllowedAsThirdParty:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t ServerConnection;
  void *v7;
  unsigned __int8 v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;

  v5 = a3;
  if (v5)
  {
    ServerConnection = getServerConnection();
    v7 = (void *)objc_claimAutoreleasedReturnValue(ServerConnection);
    v8 = objc_msgSend(v7, "checkOriginAllowedAsThirdParty:", v5);

  }
  else
  {
    v10 = nplog_obj(0, v3, v4);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v12 = 136315138;
      v13 = "+[NSPPrivateAccessTokenFetcher checkOriginAllowedAsThirdParty:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s called with null origin", (uint8_t *)&v12, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)systemClient
{
  return self->_systemClient;
}

- (void)setSystemClient:(BOOL)a3
{
  self->_systemClient = a3;
}

- (NSString)selectedOrigin
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSelectedOrigin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
  objc_copyStruct(&self->_auditToken, a3, 32, 1, 0);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)customAttester
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)customAttesterHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFetchers, 0);
  objc_storeStrong((id *)&self->_originNameKey, 0);
  objc_storeStrong((id *)&self->_tokenKey, 0);
  objc_storeStrong((id *)&self->_pairedChallengeData, 0);
  objc_storeStrong((id *)&self->_challengeData, 0);
  objc_storeStrong((id *)&self->_customAttesterHeaders, 0);
  objc_storeStrong((id *)&self->_customAttester, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_selectedOrigin, 0);
}

@end
