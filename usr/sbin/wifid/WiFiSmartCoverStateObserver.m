@implementation WiFiSmartCoverStateObserver

- (void)smartCoverStateDidChange:(int64_t)a3
{
  const __CFString *v3;
  void *v4;
  id v5;

  if ((unint64_t)(a3 - 1) > 2)
    v3 = CFSTR("Unknown");
  else
    v3 = off_100232728[a3 - 1];
  v4 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "smartCoverStateDidChange %@", v3);
  objc_autoreleasePoolPop(v4);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[WiFiUsageMonitor sharedInstance](WiFiUsageMonitor, "sharedInstance"));
  objc_msgSend(v5, "setSmartCoverState:", v3);

}

- (WiFiSmartCoverStateObserver)init
{
  objc_super v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  if (!qword_10026DBC8)
  {
    v6 = off_100232710;
    v7 = 0;
    qword_10026DBC8 = _sl_dlopen(&v6, &v5);
  }
  if (!qword_10026DBC8)
    sub_100187770(&v5);
  if (v5)
    free(v5);
  v4.receiver = self;
  v4.super_class = (Class)WiFiSmartCoverStateObserver;
  return -[WiFiSmartCoverStateObserver init](&v4, "init");
}

- (void)registerSmartCoverStateCallback
{
  void *v3;
  BSInvalidatable *v4;
  BSInvalidatable *observability;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SBSSmartCoverService sharedInstance](SBSSmartCoverService, "sharedInstance"));
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "registerSmartCoverStateObserver:", self));
  observability = self->observability;
  self->observability = v4;

  if (!self->observability)
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "registerSmartCoverStateObserver failed - Observability is nil");
    objc_autoreleasePoolPop(v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->observability, 0);
}

@end
