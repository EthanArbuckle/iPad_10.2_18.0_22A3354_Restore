@implementation GKStoreBag

+ (void)addAppOriginHeadersToRequest:(id)a3 clientProxy:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[GKClientAppSigningStatus headerValueForSignatureType:](GKClientAppSigningStatus, "headerValueForSignatureType:", objc_msgSend(v5, "appSignatureType")));
  v7 = objc_alloc((Class)NSNumber);
  v8 = objc_msgSend(v5, "distributorIsFirstPartyApple");

  v9 = objc_msgSend(v7, "initWithBool:", v8);
  +[GKStoreBag addAppOriginHeadersToRequest:signatureType:isFirstPartyApple:](GKStoreBag, "addAppOriginHeadersToRequest:signatureType:isFirstPartyApple:", v6, v10, v9);

}

+ (void)addAppOriginHeadersToRequest:(id)a3 signatureType:(id)a4 isFirstPartyApple:(id)a5
{
  id v7;
  const __CFString *v8;
  id v9;

  v9 = a3;
  v7 = a5;
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", a4, CFSTR("x-gk-app-sig"));
  if (v7)
  {
    if (objc_msgSend(v7, "BOOLValue"))
      v8 = CFSTR("true");
    else
      v8 = CFSTR("false");
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v8, CFSTR("x-gk-app-store"));
  }

}

+ (id)storeBagForEnvironment:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GKDataRequestManager sharedManager](GKDataRequestManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKStoreBag storeBagForEnvironment:dataRequestManager:](GKStoreBag, "storeBagForEnvironment:dataRequestManager:", a3, v4));

  return v5;
}

+ (id)storeBagForEnvironment:(int64_t)a3 dataRequestManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "storeBagURLForEnvironment:", a3));
  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "storeBagForURL:dataRequestManager:", v7, v6));
  else
    v8 = 0;

  return v8;
}

+ (id)storeBagURLForEnvironment:(int64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;

  v4 = CFSTR("jgubuxqd");
  if (a3 == 4)
  {
LABEL_9:
    v9 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKStoreBag storeBagURLTemplateForEnvironment:](GKStoreBag, "storeBagURLTemplateForEnvironment:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{ix}"), v9));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
    goto LABEL_10;
  }
  if (a3 != 7)
  {
LABEL_7:
    if (!_os_feature_enabled_impl("gseui", "de7bbd8e"))
      v4 = CFSTR("3");
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GKPreferences shared](GKPreferences, "shared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeBagURL"));

  if (!v6
    || (v7 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6))) == 0)
  {

    goto LABEL_7;
  }
  v8 = (void *)v7;
LABEL_10:

  return v8;
}

+ (id)storeBagURLTemplateForEnvironment:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 7)
    return CFSTR("https://init.gc.apple.com/WebObjects/GKInit.woa/wa/getBag?ix={ix}");
  else
    return off_1002C21B0[a3 - 3];
}

- (void)performSync:(id)a3
{
  NSObject *syncQueue;

  syncQueue = self->_syncQueue;
  if (dispatch_get_current_queue() == syncQueue)
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (dispatch_get_current_queue() != queue)\n[%s (%s:%d)]"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the same queue(\"%s\"), would deadlock at %@"), "-[GKStoreBag performSync:]", dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag performSync:]", -[NSString UTF8String](-[NSString lastPathComponent](+[NSString stringWithUTF8String:](
              NSString,
              "stringWithUTF8String:",
              "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),
            "lastPathComponent"),
          "UTF8String"),
        111));
  dispatch_sync(syncQueue, a3);
}

- (void)performAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_syncQueue, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKStoreBag;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ : %@"), -[GKStoreBag description](&v3, "description"), -[GKStoreBag url](self, "url"));
}

+ (id)storeBagForURL:(id)a3 dataRequestManager:(id)a4
{
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  if (qword_1003180A0 != -1)
    dispatch_once(&qword_1003180A0, &stru_1002C3F78);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_10011D4E4;
  v13 = sub_10011D4F4;
  v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011D500;
  block[3] = &unk_1002C3FA0;
  block[5] = a4;
  block[6] = &v9;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)qword_100318090, block);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (GKStoreBag)initWithURL:(id)a3 dataRequestManager:(id)a4
{
  GKStoreBag *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKStoreBag;
  v6 = -[GKStoreBag init](&v8, "init");
  if (v6)
  {
    v6->_url = (NSURL *)objc_msgSend(a3, "copy");
    v6->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GameKit.GKStoreBag.sync", 0);
    *(int32x2_t *)&v6->_playerIDHashMod = vdup_n_s32(0xF4240u);
    v6->_activity = (GKActivity *)+[GKActivity named:](GKActivity, "named:", CFSTR("GKStoreBag initWithURL:"));
    v6->_dataRequestManager = (GKDataRequestManager *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_syncQueue);
  v3.receiver = self;
  v3.super_class = (Class)GKStoreBag;
  -[GKStoreBag dealloc](&v3, "dealloc");
}

- (BOOL)_isExpired
{
  double v2;

  -[NSDate timeIntervalSinceNow](self->_expiration, "timeIntervalSinceNow");
  return v2 <= 0.0;
}

- (BOOL)_isValid
{
  return -[NSDictionary count](self->_internalBag, "count") != 0;
}

- (BOOL)_isValidAndNotExpired
{
  NSUInteger v3;
  double v4;

  v3 = -[NSDictionary count](self->_internalBag, "count");
  if (v3)
  {
    -[NSDate timeIntervalSinceNow](self->_expiration, "timeIntervalSinceNow");
    LOBYTE(v3) = v4 > 0.0;
  }
  return v3;
}

- (BOOL)_isFetching
{
  return self->_fetchGroup != 0;
}

- (BOOL)_isLastProtocolVersionUsedValid
{
  id v2;
  NSUserDefaults *v3;

  v2 = objc_msgSend((id)objc_opt_class(self, a2), "protocolVersionForClient:", 0);
  v3 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  return objc_msgSend(v2, "isEqualToString:", -[NSUserDefaults valueForKey:](v3, "valueForKey:", GKLastProtocolVersionUsedKey));
}

- (void)_fetchFromCacheWithHandler:(id)a3
{
  NSObject *current_queue;
  NSObject *syncQueue;
  const char *label;
  id v8;
  id v9;
  id v10;
  NSData *v11;
  double v12;
  double v13;
  NSDate *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v17[9];
  uint64_t v18;
  _QWORD v19[5];

  current_queue = dispatch_get_current_queue();
  syncQueue = self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKStoreBag _fetchFromCacheWithHandler:]", label, dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag _fetchFromCacheWithHandler:]", -[NSString UTF8String](-[NSString lastPathComponent](
            +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"), "lastPathComponent"), "UTF8String"), 215));
  }
  if (-[GKStoreBag _isLastProtocolVersionUsedValid](self, "_isLastProtocolVersionUsedValid"))
  {
    v8 = -[NSURL cacheKeyRepresentation](-[GKStoreBag url](self, "url"), "cacheKeyRepresentation");
    v9 = objc_msgSend(objc_msgSend((id)GKInsecureCacheRoot(v8), "stringByAppendingPathComponent:", CFSTR("StoreBag")), "stringByAppendingPathComponent:", v8);
    v10 = objc_alloc_init((Class)NSFileManager);
    v11 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v9);
    objc_msgSend(v10, "_gkExpirationIntervalOfFileAtPath:", v9);
    v13 = v12;

    v18 = 0;
    if (v11)
    {
      v11 = -[GKStoreBag _storeBagForData:error:](self, "_storeBagForData:error:", v11, &v18);
      v14 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", v13);
      -[GKStoreBag _setupAPNSRequired:](self, "_setupAPNSRequired:", v11);
      -[GKStoreBag _setupSignatureRequired:](self, "_setupSignatureRequired:", v11);
      -[GKStoreBag _setupResponseSignatureRequired:](self, "_setupResponseSignatureRequired:", v11);
      v15 = v18;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10011D9F8;
    v17[3] = &unk_1002C3FF0;
    v17[4] = self;
    v17[5] = v11;
    v17[6] = v14;
    v17[7] = v15;
    v17[8] = a3;
    v16 = v17;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10011D9EC;
    v19[3] = &unk_1002C3FC8;
    v19[4] = a3;
    v16 = v19;
  }
  -[GKStoreBag performAsync:](self, "performAsync:", v16);
}

+ (id)protocolVersionForClient:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return _objc_msgSend(a3, "protocolVersion");
  else
    return (id)GKGetProtocolVersionString(objc_msgSend(+[GKPreferences shared](GKPreferences, "shared", v3, v4), "useTestProtocols"));
}

- (void)_fetchFromServerWithHandler:(id)a3
{
  NSObject *current_queue;
  NSObject *syncQueue;
  const char *label;
  NSURL *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[8];

  current_queue = dispatch_get_current_queue();
  syncQueue = self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKStoreBag _fetchFromServerWithHandler:]", label, dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag _fetchFromServerWithHandler:]", -[NSString UTF8String](-[NSString lastPathComponent](
            +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"), "lastPathComponent"), "UTF8String"), 268));
  }
  v8 = -[GKStoreBag url](self, "url");
  v10 = objc_msgSend((id)objc_opt_class(self, v9), "protocolVersionForClient:", 0);
  v11 = +[NSMutableURLRequest _gkHTTPRequestWithURL:postData:protocolVersion:](NSMutableURLRequest, "_gkHTTPRequestWithURL:postData:protocolVersion:", v8, 0, v10);
  objc_msgSend(v11, "setRequestPriority:", 2);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10011DC2C;
  v13[3] = &unk_1002C4040;
  v13[4] = self;
  v13[5] = v10;
  v13[6] = v8;
  v13[7] = a3;
  objc_msgSend((id)objc_opt_class(NSURLSession, v12), "_gkSendAsynchronousRequest:completionHandler:", v11, v13);
}

- (void)_fetchBagWithHandler:(id)a3
{
  NSObject *v5;
  NSObject *current_queue;
  NSObject *syncQueue;
  const char *label;
  GKDispatchGroup *v9;
  GKDispatchGroup *v10;
  GKDispatchGroup *fetchGroup;
  OS_dispatch_queue *v12;
  _QWORD *v13;
  OS_dispatch_queue *v14;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[5];
  _QWORD v18[6];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    GKOSLoggers(self);
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKStorebag: _fetchBagWithHandler:", buf, 2u);
  }
  current_queue = dispatch_get_current_queue();
  syncQueue = self->_syncQueue;
  if (current_queue != syncQueue)
  {
    label = dispatch_queue_get_label(current_queue);
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == _syncQueue)\n[%s (%s:%d)]"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[GKStoreBag _fetchBagWithHandler:]", label, dispatch_queue_get_label(syncQueue), +[NSThread callStackSymbols](NSThread, "callStackSymbols")), "-[GKStoreBag _fetchBagWithHandler:]", -[NSString UTF8String](-[NSString lastPathComponent](
            +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"), "lastPathComponent"), "UTF8String"), 334));
  }
  v9 = +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m", 335, "-[GKStoreBag _fetchBagWithHandler:]"));
  v10 = v9;
  fetchGroup = self->_fetchGroup;
  if (fetchGroup)
  {
    v12 = self->_syncQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10011E23C;
    v18[3] = &unk_1002C4068;
    v18[4] = self;
    v18[5] = a3;
    -[GKDispatchGroup join:queue:block:](v9, "join:queue:block:", fetchGroup, v12, v18);
  }
  else
  {
    self->_fetchGroup = v9;
    if (-[GKStoreBag _isValid](self, "_isValid"))
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10011E25C;
      v17[3] = &unk_1002C4090;
      v17[4] = self;
      v13 = v17;
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10011E2BC;
      v16[3] = &unk_1002C40E0;
      v16[4] = self;
      v16[5] = v10;
      v13 = v16;
    }
    -[GKDispatchGroup perform:](v10, "perform:", v13);
    v14 = self->_syncQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10011E3F0;
    v15[3] = &unk_1002C4108;
    v15[4] = self;
    v15[5] = a3;
    -[GKDispatchGroup notifyOnQueue:block:](v10, "notifyOnQueue:block:", v14, v15);
  }
}

- (void)getValuesWithCompletion:(id)a3
{
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    GKOSLoggers(self);
  v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKStorebag: getBagWithHandler", buf, 2u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10011E4F4;
  v6[3] = &unk_1002C4108;
  v6[4] = self;
  v6[5] = a3;
  -[GKStoreBag performAsync:](self, "performAsync:", v6);
}

- (void)_setupAPNSRequired:(id)a3
{
  _UNKNOWN **v4;
  uint64_t v5;
  _UNKNOWN **v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (_UNKNOWN **)objc_msgSend(a3, "objectForKey:", CFSTR("gk-push-token-required"));
  if (v4)
    v6 = v4;
  else
    v6 = &off_1002DC6C8;
  v7 = objc_opt_class(NSArray, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([APNSRequiredArray isKindOfClass:[NSArray class]])\n[%s (%s:%d)]"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("got %@, expected NSArray"), objc_opt_class(v6, v8)), "-[GKStoreBag _setupAPNSRequired:]", -[NSString UTF8String](-[NSString lastPathComponent](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:",
              "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m"),
            "lastPathComponent"),
          "UTF8String"),
        424));
  -[GKStoreBag setAPNSRequired:](self, "setAPNSRequired:", +[NSSet setWithArray:](NSSet, "setWithArray:", v6));
}

- (void)_setupSignatureRequired:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("gk-sap-signed-requests"));
  -[GKStoreBag setSignatureRequired:](self, "setSignatureRequired:", 0);
  if (v4)
    -[GKStoreBag setSignatureRequired:](self, "setSignatureRequired:", +[NSSet setWithArray:](NSSet, "setWithArray:", v4));
}

- (void)_metricsThrottleThreshold:(id)a3
{
  -[GKStoreBag setMetricsPassthroughPercentage:](self, "setMetricsPassthroughPercentage:", objc_msgSend(a3, "objectForKey:", CFSTR("gk-metrics-pct")));
}

- (void)_setupResponseSignatureRequired:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("gk-sap-signed-response-include-patterns"));
  -[GKStoreBag setResponseSignatureRequired:](self, "setResponseSignatureRequired:", 0);
  if (v4)
    -[GKStoreBag setResponseSignatureRequired:](self, "setResponseSignatureRequired:", +[NSSet setWithArray:](NSSet, "setWithArray:", v4));
}

- (void)getURLForKey:(id)a3 queue:(id)a4 handler:(id)a5
{
  _QWORD v5[8];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011E8B4;
  v5[3] = &unk_1002C41A8;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m", 457, "-[GKStoreBag getURLForKey:queue:handler:]"), v5);
}

- (void)getValuesForKeys:(id)a3 queue:(id)a4 completion:(id)a5
{
  NSObject *v9;
  _QWORD v10[8];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    GKOSLoggers(self);
  v9 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "GKStoreBag: getValuesForKeys", buf, 2u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10011EA9C;
  v10[3] = &unk_1002C4180;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  v10[7] = a5;
  -[GKStoreBag getValuesWithCompletion:](self, "getValuesWithCompletion:", v10);
}

- (id)valueForUndefinedKey:(id)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10011D4E4;
  v10 = sub_10011D4F4;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011EBF4;
  v5[3] = &unk_1002C3FA0;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  -[GKStoreBag performSync:](self, "performSync:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)omnitureQueryParametersForContext:(id)a3
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_internalBag, "objectForKey:", GKQueryParamsBagKey), "objectForKey:", a3);
}

- (BOOL)shouldUseHTTPPipelining
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011ED00;
  v4[3] = &unk_1002C41D0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_shouldUseHTTPPipelining
{
  id v3;

  v3 = objc_msgSend(+[GKPreferences shared](GKPreferences, "shared"), "pipeliningSetting");
  if (v3 == (id)2)
    return 1;
  if (v3)
    return 0;
  return objc_msgSend(-[NSDictionary objectForKey:](self->_internalBag, "objectForKey:", CFSTR("gk-disable-http-pipelining")), "BOOLValue") ^ 1;
}

- (int64_t)gkSessionRateLimiting
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011EE30;
  v4[3] = &unk_1002C41D0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_gkSessionRateLimiting
{
  int64_t result;

  result = (int64_t)objc_msgSend(-[NSDictionary valueForKey:](self->_internalBag, "valueForKey:", GKSessionRateLimiting), "integerValue");
  if (!result)
    return 5;
  return result;
}

- (int64_t)achievementsThrottleThreshold
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011EF34;
  v4[3] = &unk_1002C41D0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_achievementsThrottleThreshold
{
  int64_t result;

  result = (int64_t)objc_msgSend(-[NSDictionary valueForKey:](self->_internalBag, "valueForKey:", GKAchievementsThrottleThreshold), "integerValue");
  if (!result)
    return 5;
  return result;
}

- (int64_t)scoresThrottleThreshold
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011F038;
  v4[3] = &unk_1002C41D0;
  v4[4] = self;
  v4[5] = &v5;
  -[GKStoreBag performSync:](self, "performSync:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (int64_t)_scoresThrottleThreshold
{
  int64_t result;

  result = (int64_t)objc_msgSend(-[NSDictionary valueForKey:](self->_internalBag, "valueForKey:", GKScoresThrottleThreshold), "integerValue");
  if (!result)
    return 5;
  return result;
}

- (id)_storeBagForData:(id)a3 error:(id *)a4
{
  uint64_t isKindOfClass;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;

  v31 = 100;
  isKindOfClass = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", a3, 0, &v31, a4);
  if (!isKindOfClass
    || (v8 = (void *)isKindOfClass,
        v9 = objc_opt_class(NSDictionary, v7),
        isKindOfClass = objc_opt_isKindOfClass(v8, v9),
        (isKindOfClass & 1) == 0))
  {
    if (!os_log_GKGeneral)
      GKOSLoggers(isKindOfClass);
    v16 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v18 = objc_opt_class(self, v17);
    v19 = *a4;
    *(_DWORD *)buf = 138412546;
    v33 = v18;
    v34 = 2112;
    v35 = v19;
    v20 = "GKStoreBag: %@: bad responseDict: %@";
    v21 = v16;
    v22 = 22;
    goto LABEL_12;
  }
  v10 = objc_msgSend(v8, "objectForKey:", CFSTR("bag"));
  if (!v10)
  {
    if (!os_log_GKGeneral)
      GKOSLoggers(0);
    v28 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v30 = objc_opt_class(self, v29);
    *(_DWORD *)buf = 138412290;
    v33 = v30;
    v20 = "GKStoreBag: %@: bad bagData";
    v21 = v28;
    v22 = 12;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v11 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v10, 0, &v31, a4);
  v13 = (void *)v11;
  if (v11)
  {
    v14 = objc_opt_class(NSDictionary, v12);
    v11 = objc_opt_isKindOfClass(v13, v14);
    if ((v11 & 1) != 0)
    {
      v15 = 0;
      if (!a4)
        return v13;
      goto LABEL_15;
    }
  }
  if (!os_log_GKGeneral)
    GKOSLoggers(v11);
  v24 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    v26 = objc_opt_class(self, v25);
    v27 = *a4;
    *(_DWORD *)buf = 138412546;
    v33 = v26;
    v34 = 2112;
    v35 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "GKStoreBag: %@: Could not unserialize the URL bag: %@", buf, 0x16u);
  }
LABEL_14:
  v15 = +[NSError userErrorForCode:underlyingError:](NSError, "userErrorForCode:underlyingError:", 3, 0);
  if (a4)
LABEL_15:
    *a4 = v15;
  return v13;
}

- (void)updateURLPatternCache
{
  GKStoreBag *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSDictionary *v8;
  id v9;
  id v10;
  void *v11;
  NSUserDefaults *v12;
  NSURL *v13;
  double v14;
  double v15;
  id v16;
  NSObject *v17;
  NSDictionary *v18;
  id v19;
  _BOOL8 v20;
  NSData *v21;
  _BOOL8 v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  _QWORD v28[2];
  _QWORD v29[2];

  v3 = -[GKDataRequestManager storeBag](-[GKStoreBag dataRequestManager](self, "dataRequestManager"), "storeBag");
  if (v3 != self)
  {
    if (!os_log_GKGeneral)
      GKOSLoggers(v3);
    v4 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "Received update for bag that isn't current. Ignoring. See <rdar://problem/12960277>.";
      v6 = v4;
      v7 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v5, buf, v7);
      return;
    }
    return;
  }
  v8 = -[GKStoreBag internalBag](self, "internalBag");
  v9 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("gk-launch-gamecenter-host-patterns"));
  v10 = -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("gk-launch-gamecenter-path-patterns"));
  if (!v9)
    return;
  v11 = v10;
  if (!v10)
    return;
  v12 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  v13 = -[NSUserDefaults URLForKey:](v12, "URLForKey:", CFSTR("GKURLPatternCacheBagURLUserDefaultsKey"));
  objc_msgSend(-[NSUserDefaults objectForKey:](v12, "objectForKey:", CFSTR("GKURLPatternCacheExpirationDateUserDefaultsKey")), "timeIntervalSinceDate:", -[GKStoreBag expiration](self, "expiration"));
  v15 = v14;
  if (-[NSURL isEqual:](-[GKStoreBag url](self, "url"), "isEqual:", v13))
  {
    if (v15 >= 0.0)
      return;
  }
  -[NSUserDefaults setURL:forKey:](v12, "setURL:forKey:", -[GKStoreBag url](self, "url"), CFSTR("GKURLPatternCacheBagURLUserDefaultsKey"));
  v16 = -[NSUserDefaults setObject:forKey:](v12, "setObject:forKey:", -[GKStoreBag expiration](self, "expiration"), CFSTR("GKURLPatternCacheExpirationDateUserDefaultsKey"));
  if (!os_log_GKGeneral)
    GKOSLoggers(v16);
  v17 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Updating URL pattern cache", buf, 2u);
  }
  v28[1] = CFSTR("gk-launch-gamecenter-path-patterns");
  v29[0] = v9;
  v28[0] = CFSTR("gk-launch-gamecenter-host-patterns");
  v29[1] = objc_msgSend(v11, "arrayByAddingObject:", CFSTR("^/(me|players|friends|games|requests|challenges|htmlResources)($|/.*)"));
  v18 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v19 = objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Caches/com.apple.gamed/url-resolution.plist"));
  v25 = 0;
  v20 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v19, "stringByDeletingLastPathComponent"), 1, 0, &v25);
  if (!v20)
  {
    if (!os_log_GKGeneral)
      GKOSLoggers(v20);
    v24 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      return;
    *(_DWORD *)buf = 138412290;
    v27 = v25;
    v5 = "Failed to create folder for url pattern cache: %@";
LABEL_31:
    v6 = v24;
    v7 = 12;
    goto LABEL_6;
  }
  v21 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v18, 200, 0, &v25);
  if (!v21)
  {
    if (!os_log_GKGeneral)
      GKOSLoggers(0);
    v24 = os_log_GKDaemon;
    if (!os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      return;
    *(_DWORD *)buf = 138412290;
    v27 = v25;
    v5 = "Failed to decode data for url pattern cache: %@";
    goto LABEL_31;
  }
  v22 = -[NSData writeToFile:options:error:](v21, "writeToFile:options:error:", v19, 0, &v25);
  if (v22)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.gamed.changed-url-resolution"), 0, 0, 1u);
    return;
  }
  if (!os_log_GKGeneral)
    GKOSLoggers(v22);
  v24 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v25;
    v5 = "Failed to write url pattern cache: %@";
    goto LABEL_31;
  }
}

- (void)_updatePlayerIDHashParameters
{
  NSDictionary *v3;
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  int *p_playerIDHashAdd;

  v3 = -[GKStoreBag internalBag](self, "internalBag");
  v4 = -[NSDictionary objectForKey:](v3, "objectForKey:", GKPlayerIDHashModKey);
  v5 = -[NSDictionary objectForKey:](v3, "objectForKey:", GKPlayerIDHashAddKey);
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = v5;
    while (!GKAtomicCompareAndSwap32Barrier(self->_playerIDHashMod, objc_msgSend(v4, "integerValue"), &self->_playerIDHashMod));
    p_playerIDHashAdd = &self->_playerIDHashAdd;
    while (!GKAtomicCompareAndSwap32Barrier(*p_playerIDHashAdd, objc_msgSend(v7, "integerValue"), p_playerIDHashAdd));
  }
}

- (int)hashForPlayerID:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = (uint64_t)objc_msgSend(a3, "hash");
  if (v4 >= 0)
    v5 = v4;
  else
    v5 = -v4;
  return self->_playerIDHashAdd + v5 % self->_playerIDHashMod;
}

- (void)signRequest:(id)a3 sapSession:(id)a4 postData:(id)a5
{
  id v9;
  id v10;
  NSData *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[16];
  unsigned __int8 md[4];
  id v19;
  __int16 v20;
  id v21;

  objc_msgSend(a3, "_gkSetSAPSession:", a4);
  objc_msgSend(a3, "setHTTPShouldUsePipelining:", -[GKStoreBag _shouldUseHTTPPipelining](self, "_shouldUseHTTPPipelining"));
  if (a4)
  {
    if (a5)
    {
      v9 = objc_msgSend(objc_msgSend(a3, "HTTPBody"), "_gkZippedData");
      if (v9)
      {
        v10 = v9;
        v16 = 0;
        if (CC_SHA1(objc_msgSend(v9, "bytes"), (CC_LONG)objc_msgSend(v9, "length"), md))
        {
          v11 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", md, 20);
        }
        else
        {
          if (!os_log_GKGeneral)
            GKOSLoggers(0);
          v12 = os_log_GKDaemon;
          if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "GKStoreBag:ISSHA1DataForBytes failed", buf, 2u);
          }
          v11 = 0;
        }
        objc_msgSend(a3, "setHTTPBody:", v10);
        objc_msgSend(a3, "setSAPSignature:", objc_msgSend(a4, "signatureForData:error:", v11, &v16));
        objc_msgSend(a3, "setSAPversion:", objc_msgSend(a4, "SAPVersion"));
        v13 = objc_msgSend(a3, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("content-encoding"));
        if (!os_log_GKGeneral)
          GKOSLoggers(v13);
        v14 = os_log_GKDaemon;
        if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
        {
          v15 = objc_msgSend(a3, "loggableHeaders");
          *(_DWORD *)md = 138412546;
          v19 = a3;
          v20 = 2112;
          v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "MESCAL:signed body of request:%@ %@", md, 0x16u);
        }
      }
    }
  }
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11
{
  uint64_t v12;
  uint64_t v13;

  LOBYTE(v13) = 0;
  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[GKStoreBag requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:](self, "requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:", a3, a4, a5, a6, a7, a8, v12, a11, v13);
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12
{
  uint64_t v13;
  uint64_t v14;

  LOWORD(v14) = a12;
  LOWORD(v13) = __PAIR16__(a10, a9);
  return -[GKStoreBag requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:includeClientInfoAuthHeader:](self, "requestWithURL:playerID:authToken:pushToken:client:postData:includeUDID:includeAPNS:sapSession:includeAppOriginHeaders:includeClientInfoAuthHeader:", a3, a4, a5, a6, a7, a8, v13, a11, v14);
}

- (id)requestWithURL:(id)a3 playerID:(id)a4 authToken:(id)a5 pushToken:(id)a6 client:(id)a7 postData:(id)a8 includeUDID:(BOOL)a9 includeAPNS:(BOOL)a10 sapSession:(id)a11 includeAppOriginHeaders:(BOOL)a12 includeClientInfoAuthHeader:(BOOL)a13
{
  id v19;
  uint64_t v20;

  v19 = +[NSMutableURLRequest _gkHTTPRequestWithURL:postData:protocolVersion:](NSMutableURLRequest, "_gkHTTPRequestWithURL:postData:protocolVersion:", a3, a8, objc_msgSend((id)objc_opt_class(self, a2), "protocolVersionForClient:", a7));
  objc_msgSend(v19, "setPlayerID:hash:authToken:", a4, -[GKStoreBag hashForPlayerID:](self, "hashForPlayerID:", a4), a5);
  if (a10)
    objc_msgSend(v19, "setPushToken:", a6);
  objc_msgSend(v19, "setGameDescriptor:", objc_msgSend(a7, "gameDescriptor"));
  objc_msgSend(v19, "setLocale:", objc_msgSend(a7, "locale"));
  if (a9)
    objc_msgSend(v19, "setDeviceUniqueID");
  if (a12)
    +[GKStoreBag addAppOriginHeadersToRequest:clientProxy:](GKStoreBag, "addAppOriginHeadersToRequest:clientProxy:", v19, a7);
  if (a13)
    objc_msgSend((id)objc_opt_class(self, v20), "addClientInfoAuthHeaderToRequest:", v19);
  -[GKStoreBag signRequest:sapSession:postData:](self, "signRequest:sapSession:postData:", v19, a11, a8);
  return v19;
}

+ (id)appleIdSession
{
  if (qword_1003180B0 != -1)
    dispatch_once(&qword_1003180B0, &stru_1002C41F0);
  return (id)qword_1003180A8;
}

+ (id)deviceInfo
{
  if (qword_1003180C0 != -1)
    dispatch_once(&qword_1003180C0, &stru_1002C4210);
  return (id)qword_1003180B8;
}

+ (BOOL)shouldIncludeClientInfoAuthHeaderForBagKey:(id)a3
{
  unsigned int v4;

  v4 = objc_msgSend(+[GKPreferences shared](GKPreferences, "shared"), "requestHeadersPrivacyEnabled");
  if (v4)
    LOBYTE(v4) = objc_msgSend(a3, "isEqualToString:", CFSTR("gk-authenticate-user"));
  return v4;
}

+ (void)addClientInfoAuthHeaderToRequest:(id)a3
{
  objc_msgSend(a3, "setValue:forHTTPHeaderField:", +[GKStoreBag deviceInfo](GKStoreBag, "deviceInfo"), CFSTR("X-MMe-Client-Info"));
}

+ (void)addAuthHeadersToRequest:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  unsigned __int8 v9;

  v5 = objc_msgSend((id)objc_opt_class(a1, a2), "appleIdSession");
  if ((objc_msgSend(+[GKPreferences shared](GKPreferences, "shared"), "requestHeadersPrivacyEnabled") & 1) == 0)objc_msgSend((id)objc_opt_class(a1, v6), "addClientInfoAuthHeaderToRequest:", a3);
  v7 = objc_msgSend(v5, "appleIDHeadersForRequest:", a3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011FDD0;
  v8[3] = &unk_1002C4238;
  v9 = objc_msgSend(+[GKPreferences shared](GKPreferences, "shared"), "requestHeadersPrivacyEnabled");
  v8[4] = a3;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
}

- (void)_sendAsynchronousRequest:(id)a3 responseMustBeSigned:(BOOL)a4 completion:(id)a5
{
  _QWORD v5[7];
  BOOL v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011FEF4;
  v5[3] = &unk_1002C4288;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  v5[6] = a5;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m", 958, "-[GKStoreBag _sendAsynchronousRequest:responseMustBeSigned:completion:]"), v5);
}

- (void)_sendOneAsyncTryWithRequest:(id)a3 responseMustBeSigned:(BOOL)a4 session:(id)a5 retryCount:(int)a6 completionHandler:(id)a7
{
  void *v13;
  NSObject *v14;
  _BOOL8 v15;
  _QWORD v16[8];
  int v17;
  BOOL v18;
  uint8_t buf[4];
  id v20;

  if (a3)
  {
    v13 = (void *)objc_opt_class(NSURLSession, a2);
    v14 = os_log_GKHTTP;
    v15 = os_log_type_enabled(os_log_GKHTTP, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (!os_log_GKGeneral)
      {
        GKOSLoggers(v15);
        v14 = os_log_GKHTTP;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = a3;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "timestamp at which REQUEST %@ was sent", buf, 0xCu);
      }
    }
    +[GKStoreBag addAuthHeadersToRequest:](GKStoreBag, "addAuthHeadersToRequest:", a3);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001201A8;
    v16[3] = &unk_1002C42B0;
    v16[4] = a5;
    v16[5] = a3;
    v17 = a6;
    v18 = a4;
    v16[6] = self;
    v16[7] = a7;
    objc_msgSend(v13, "_gkSendAsynchronousRequest:completionHandler:", a3, v16);
  }
  else if (a7)
  {
    (*((void (**)(id, _QWORD, id, double))a7 + 2))(a7, 0, +[NSError userErrorForCode:userInfo:](NSError, "userErrorForCode:userInfo:", 17, 0, a5, *(_QWORD *)&a6), 0.0);
  }
}

- (id)_bagKeyValidationDict
{
  if (qword_1003180D0 != -1)
    dispatch_once(&qword_1003180D0, &stru_1002C42D0);
  return (id)qword_1003180C8;
}

- (void)invalidateBagKeys:(id)a3
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100120BE0;
  v4[3] = &unk_1002C42F8;
  v4[4] = a3;
  v4[5] = +[NSDate date](NSDate, "date");
  objc_msgSend(-[GKStoreBag _bagKeyValidationDict](self, "_bagKeyValidationDict"), "writeToDictionary:", v4);
}

- (BOOL)isLoadValidForBagKey:(id)a3 date:(id)a4
{
  id v5;
  double v6;

  v5 = objc_msgSend(-[GKStoreBag _bagKeyValidationDict](self, "_bagKeyValidationDict"), "objectForKey:", a3);
  if (!v5)
    return 1;
  objc_msgSend(a4, "timeIntervalSinceDate:", v5);
  return v6 > 0.0;
}

- (id)_networkSynchonizationQueue
{
  if (qword_1003180E0 != -1)
    dispatch_once(&qword_1003180E0, &stru_1002C4318);
  return (id)qword_1003180D8;
}

- (void)verifyEligibilityForBagKey:(id)a3 replyQueue:(id)a4 client:(id)a5 completion:(id)a6
{
  _QWORD v11[8];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100120E60;
  v11[3] = &unk_1002C4340;
  objc_copyWeak(&v12, &location);
  v11[4] = a3;
  v11[5] = a5;
  v11[6] = a4;
  v11[7] = a6;
  -[GKStoreBag getValuesWithCompletion:](self, "getValuesWithCompletion:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)verifyEligibilityForBagKey:(id)a3 checkingAllowedRequestKeys:(id)a4 client:(id)a5
{
  GKPlayerInternalProvider *v8;
  id v9;
  GKNetworkRequestEligibilityChecker *v10;
  id v11;
  GKNetworkRequestEligibilityChecker *v12;
  id v13;

  v8 = objc_alloc_init(GKPlayerInternalProvider);
  v9 = objc_msgSend(-[GKPlayerInternalProvider localPlayer](v8, "localPlayer"), "hasAcknowledgedLatestGDPR");

  v10 = [GKNetworkRequestEligibilityChecker alloc];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("gk-app-init")) & 1) != 0)
    v11 = 0;
  else
    v11 = objc_msgSend(a5, "isAppUnlistedAndDisallowed");
  v12 = -[GKNetworkRequestEligibilityChecker initWithHasAcknowledgedLatestGDPR:alwaysAllowedBagKeysObject:isAppUnlistedAndDisallowed:](v10, "initWithHasAcknowledgedLatestGDPR:alwaysAllowedBagKeysObject:isAppUnlistedAndDisallowed:", v9, a4, v11);
  v13 = -[GKNetworkRequestEligibilityChecker verifyEligibilityWithBagKey:](v12, "verifyEligibilityWithBagKey:", a3);

  return v13;
}

- (void)_loadDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  id v13;
  NSObject *v14;
  dispatch_group_t v15;
  NSDate *v16;
  _QWORD v17[15];
  BOOL v18;
  _QWORD v19[4];
  _QWORD v20[6];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;

  v13 = a5;
  if (!a5)
  {
    if (!os_log_GKGeneral)
      GKOSLoggers(self);
    v14 = os_log_GKTrace;
    if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "_loadDataForBagKey: nil client provided, will instantiate one", buf, 2u);
    }
    v13 = +[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient");
  }
  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x3052000000;
  v24 = sub_10011D4E4;
  v25 = sub_10011D4F4;
  v26 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3052000000;
  v20[3] = sub_10011D4E4;
  v20[4] = sub_10011D4F4;
  v20[5] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v15 = dispatch_group_create();
  v16 = +[NSDate date](NSDate, "date");
  if (!a4)
  {
    if ((objc_msgSend(a3, "isEqual:", CFSTR("gk-sap-setup-cert-url")) & 1) != 0)
      a4 = 0;
    else
      a4 = -[NSDictionary _gkPlistXMLDataForClient:player:](+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v16, CFSTR("gk-post-data"), 0), "_gkPlistXMLDataForClient:player:", v13, objc_msgSend(a6, "playerInternal"));
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100121278;
  v17[3] = &unk_1002C4450;
  v17[4] = self;
  v17[5] = v15;
  v17[6] = a3;
  v17[7] = v13;
  v17[8] = a6;
  v17[9] = a4;
  v17[12] = v20;
  v17[13] = buf;
  v17[14] = v19;
  v17[10] = v16;
  v17[11] = a7;
  v18 = a5 == 0;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m", 1219, "-[GKStoreBag _loadDataForBagKey:postData:client:credential:completion:]"), v17);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(buf, 8);
}

- (void)writeDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  NSObject *v13;
  _QWORD v14[10];
  uint8_t buf[16];

  if (!os_log_GKGeneral)
    GKOSLoggers(self);
  v13 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "GKStoreBag: writeDataForBagKey", buf, 2u);
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100121C60;
  v14[3] = &unk_1002C44A0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v14[7] = a5;
  v14[8] = a6;
  v14[9] = a7;
  dispatch_barrier_async((dispatch_queue_t)-[GKStoreBag _networkSynchonizationQueue](self, "_networkSynchonizationQueue"), v14);
}

- (void)readDataForBagKey:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 completion:(id)a7
{
  _QWORD v7[10];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100121DA4;
  v7[3] = &unk_1002C44A0;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = a4;
  v7[7] = a5;
  v7[8] = a6;
  v7[9] = a7;
  -[GKActivity childNamed:execute:](-[GKStoreBag activity](self, "activity"), "childNamed:execute:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKStoreBag+NoARC.m", 1368, "-[GKStoreBag readDataForBagKey:postData:client:credential:completion:]"), v7);
}

- (void)readDataForURL:(id)a3 postData:(id)a4 client:(id)a5 credential:(id)a6 includeUDID:(BOOL)a7 includeAPNS:(BOOL)a8 completion:(id)a9
{
  id v10;
  NSObject *v14;
  NSObject *global_queue;
  _QWORD v18[8];
  _QWORD block[13];
  BOOL v20;
  BOOL v21;
  _QWORD v22[4];
  _QWORD v23[6];
  _QWORD v24[7];

  v10 = a5;
  if (!a5)
    v10 = +[GKClientProxy gameCenterClient](GKClientProxy, "gameCenterClient");
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3052000000;
  v24[3] = sub_10011D4E4;
  v24[4] = sub_10011D4F4;
  v24[5] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3052000000;
  v23[3] = sub_10011D4E4;
  v23[4] = sub_10011D4F4;
  v23[5] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122004;
  block[3] = &unk_1002C44F0;
  block[4] = self;
  block[5] = a3;
  block[6] = a6;
  block[7] = v10;
  v20 = a7;
  v21 = a8;
  block[8] = a4;
  block[9] = v14;
  block[10] = v24;
  block[11] = v22;
  block[12] = v23;
  dispatch_async((dispatch_queue_t)-[GKStoreBag _networkSynchonizationQueue](self, "_networkSynchonizationQueue"), block);
  global_queue = dispatch_get_global_queue(0, 0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001221E0;
  v18[3] = &unk_1002C4518;
  v18[4] = a9;
  v18[5] = v24;
  v18[6] = v22;
  v18[7] = v23;
  dispatch_group_notify(v14, global_queue, v18);
  dispatch_release(v14);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSSet)APNSRequired
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAPNSRequired:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSSet)signatureRequired
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSignatureRequired:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSSet)responseSignatureRequired
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponseSignatureRequired:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)metricsPassthroughPercentage
{
  return self->_metricsPassthroughPercentage;
}

- (void)setMetricsPassthroughPercentage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSDictionary)internalBag
{
  return self->_internalBag;
}

- (void)setInternalBag:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSDate)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (double)mescalSetupStartTimeStamp
{
  return self->_mescalSetupStartTimeStamp;
}

- (void)setMescalSetupStartTimeStamp:(double)a3
{
  self->_mescalSetupStartTimeStamp = a3;
}

- (GKActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (GKDataRequestManager)dataRequestManager
{
  return self->_dataRequestManager;
}

- (void)setDataRequestManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
