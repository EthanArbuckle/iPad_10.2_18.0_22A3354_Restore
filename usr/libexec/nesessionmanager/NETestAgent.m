@implementation NETestAgent

- (void)startWithCompletionHandler:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  v7 = Property;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100063B38;
  v9[3] = &unk_1000BECD0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, v9);

}

- (BOOL)isPerUser
{
  return 1;
}

- (BOOL)isLocal
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
}

@end
