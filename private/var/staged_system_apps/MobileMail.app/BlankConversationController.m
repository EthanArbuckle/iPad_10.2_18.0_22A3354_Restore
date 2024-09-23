@implementation BlankConversationController

- (BlankConversationController)init
{
  BlankConversationController *v2;
  EMCoreAnalyticsCollector *v3;
  EMCoreAnalyticsCollector *analyticsCollector;
  NSMutableDictionary *v5;
  NSMutableDictionary *blankConversationViewReasons;
  NSMutableDictionary *v7;
  NSMutableDictionary *webViewCrashReasons;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BlankConversationController;
  v2 = -[BlankConversationController init](&v10, "init");
  if (v2)
  {
    v3 = (EMCoreAnalyticsCollector *)objc_alloc_init((Class)EMCoreAnalyticsCollector);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    blankConversationViewReasons = v2->_blankConversationViewReasons;
    v2->_blankConversationViewReasons = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    webViewCrashReasons = v2->_webViewCrashReasons;
    v2->_webViewCrashReasons = v7;

  }
  return v2;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004BCD4;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9A78 != -1)
    dispatch_once(&qword_1005A9A78, block);
  return (OS_os_log *)(id)qword_1005A9A70;
}

- (void)conversationViewDidLoadMessageSuccessfully
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BlankConversationController setNumberOfLoadAttempts:](self, "setNumberOfLoadAttempts:", (char *)-[BlankConversationController numberOfLoadAttempts](self, "numberOfLoadAttempts") + 1);
  os_unfair_lock_unlock(p_lock);
}

- (void)conversationViewIsBlankWithReason:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *blankConversationViewReasons;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _UNKNOWN **v11;
  _UNKNOWN **v12;
  void *v13;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BlankConversationController setNumberOfLoadAttempts:](self, "setNumberOfLoadAttempts:", (char *)-[BlankConversationController numberOfLoadAttempts](self, "numberOfLoadAttempts") + 1);
  -[BlankConversationController setNumberOfFailedAttempts:](self, "setNumberOfFailedAttempts:", (char *)-[BlankConversationController numberOfFailedAttempts](self, "numberOfFailedAttempts") + 1);
  if (self)
    blankConversationViewReasons = self->_blankConversationViewReasons;
  else
    blankConversationViewReasons = 0;
  v7 = blankConversationViewReasons;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reason_%ld"), a3));
  v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8));
  v10 = (void *)v9;
  v11 = &off_1005412A8;
  if (v9)
    v11 = (_UNKNOWN **)v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v12, "integerValue") + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v13, v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)conversationViewWebViewDidLoadMessage
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BlankConversationController setNumberOfWebViewLoads:](self, "setNumberOfWebViewLoads:", (char *)-[BlankConversationController numberOfWebViewLoads](self, "numberOfWebViewLoads") + 1);
  os_unfair_lock_unlock(p_lock);
}

- (void)conversationViewWebViewCrashedWithReason:(int64_t)a3 isBackgrounded:(BOOL)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lock;
  void *v8;
  NSMutableDictionary *webViewCrashReasons;
  NSMutableDictionary *v10;
  uint64_t v11;
  void *v12;
  _UNKNOWN **v13;
  _UNKNOWN **v14;
  void *v15;

  v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BlankConversationController setNumberOfWebViewLoads:](self, "setNumberOfWebViewLoads:", (char *)-[BlankConversationController numberOfWebViewLoads](self, "numberOfWebViewLoads") + 1);
  if (v4)
    -[BlankConversationController setNumberOfBackgroundWebViewCrashes:](self, "setNumberOfBackgroundWebViewCrashes:", (char *)-[BlankConversationController numberOfBackgroundWebViewCrashes](self, "numberOfBackgroundWebViewCrashes")+ 1);
  else
    -[BlankConversationController setNumberOfForegroundWebViewCrashes:](self, "setNumberOfForegroundWebViewCrashes:", (char *)-[BlankConversationController numberOfForegroundWebViewCrashes](self, "numberOfForegroundWebViewCrashes")+ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reason_%ld"), a3));
  if (self)
    webViewCrashReasons = self->_webViewCrashReasons;
  else
    webViewCrashReasons = 0;
  v10 = webViewCrashReasons;
  v11 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v8));
  v12 = (void *)v11;
  v13 = &off_1005412A8;
  if (v11)
    v13 = (_UNKNOWN **)v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v14, "integerValue") + 1));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v15, v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)reportMetrics
{
  sub_10004C0F0((os_unfair_lock_s *)self);
  sub_10004C150((os_unfair_lock_s *)self);
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (int64_t)numberOfLoadAttempts
{
  return self->_numberOfLoadAttempts;
}

- (void)setNumberOfLoadAttempts:(int64_t)a3
{
  self->_numberOfLoadAttempts = a3;
}

- (int64_t)numberOfFailedAttempts
{
  return self->_numberOfFailedAttempts;
}

- (void)setNumberOfFailedAttempts:(int64_t)a3
{
  self->_numberOfFailedAttempts = a3;
}

- (int64_t)numberOfWebViewLoads
{
  return self->_numberOfWebViewLoads;
}

- (void)setNumberOfWebViewLoads:(int64_t)a3
{
  self->_numberOfWebViewLoads = a3;
}

- (int64_t)numberOfForegroundWebViewCrashes
{
  return self->_numberOfForegroundWebViewCrashes;
}

- (void)setNumberOfForegroundWebViewCrashes:(int64_t)a3
{
  self->_numberOfForegroundWebViewCrashes = a3;
}

- (int64_t)numberOfBackgroundWebViewCrashes
{
  return self->_numberOfBackgroundWebViewCrashes;
}

- (void)setNumberOfBackgroundWebViewCrashes:(int64_t)a3
{
  self->_numberOfBackgroundWebViewCrashes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewCrashReasons, 0);
  objc_storeStrong((id *)&self->_blankConversationViewReasons, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
}

@end
