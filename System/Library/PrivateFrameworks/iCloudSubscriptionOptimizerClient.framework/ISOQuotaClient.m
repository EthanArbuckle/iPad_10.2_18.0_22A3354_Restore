@implementation ISOQuotaClient

- (id)parseNotification:(id)a3
{
  return 0;
}

- (void)newOffer:(id)a3 andCallback:(id)a4
{
  id v4;

  v4 = +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException", a3, a4);
}

- (void)isNotificationPending:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)clearNotificationState:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)parseDelayedOfferFromJson:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)parseDelayedOffer:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)failsafeDelayedOfferJsonContext
{
  id v2;

  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)logFailsafeEvent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

+ (id)shared
{
  return +[ISOSharedInstance get](ISOSharedInstance, "get");
}

@end
