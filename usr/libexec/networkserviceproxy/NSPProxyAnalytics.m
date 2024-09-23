@implementation NSPProxyAnalytics

- (id)eventName
{
  return CFSTR("com.apple.nsp");
}

- (id)analyticsDict
{
  return 0;
}

- (void)sendAnalytics
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSPProxyAnalytics eventName](self, "eventName"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F558;
  v4[3] = &unk_1000F5F08;
  v4[4] = self;
  AnalyticsSendEventLazy(v3, v4);

}

@end
