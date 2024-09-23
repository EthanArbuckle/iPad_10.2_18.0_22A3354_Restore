@implementation NESMFilterSessionStateRunning

- (NESMFilterSessionStateRunning)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateRunning;
  return -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 3, 0);
}

- (void)enterWithSession:(id)a3
{
  const char *v4;
  id Property;
  const char *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NESMFilterSessionStateRunning;
  -[NESMFilterSessionState enterWithSession:](&v9, "enterWithSession:", a3);
  if (self)
    Property = objc_getProperty(self, v4, 16, 1);
  else
    Property = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(Property, "server"));
  if (self)
    v8 = objc_getProperty(self, v6, 16, 1);
  else
    v8 = 0;
  objc_msgSend(v7, "requestInstallForSession:withParentSession:exclusive:", v8, 0, 1);

}

- (BOOL)handleSleep
{
  const char *v3;
  id Property;
  const char *v5;
  id v6;
  SEL v7;
  id v8;
  const char *v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NESMFilterSessionStateRunning;
  -[NESMFilterSessionState handleSleep](&v12, "handleSleep");
  if (self)
  {
    Property = objc_getProperty(self, v3, 16, 1);
    if (Property)
      Property = objc_getProperty(Property, v5, 400, 1);
    v6 = Property;
    sub_100017240(v6);

    v8 = objc_getProperty(self, v7, 16, 1);
    if (v8)
      v8 = objc_getProperty(v8, v9, 408, 1);
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;
  sub_100017240(v10);

  return 1;
}

- (void)handleWakeup
{
  const char *v3;
  id Property;
  const char *v5;
  id v6;
  SEL v7;
  id v8;
  const char *v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NESMFilterSessionStateRunning;
  -[NESMFilterSessionState handleWakeup](&v11, "handleWakeup");
  if (self)
  {
    Property = objc_getProperty(self, v3, 16, 1);
    if (Property)
      Property = objc_getProperty(Property, v5, 400, 1);
    v6 = Property;
    sub_100017504(v6);

    v8 = objc_getProperty(self, v7, 16, 1);
    if (v8)
      v8 = objc_getProperty(v8, v9, 408, 1);
  }
  else
  {
    v8 = 0;
  }
  v10 = v8;
  sub_100017504(v10);

}

- (void)handleUpdateConfiguration
{
  const char *v3;
  id Property;
  const char *v5;
  id v6;
  SEL v7;
  id v8;
  void *v9;
  SEL v10;
  id v11;
  const char *v12;
  id v13;
  SEL v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NESMFilterSessionStateRunning;
  -[NESMFilterSessionState handleUpdateConfiguration](&v18, "handleUpdateConfiguration");
  if (self)
  {
    Property = objc_getProperty(self, v3, 16, 1);
    if (Property)
      Property = objc_getProperty(Property, v5, 400, 1);
    v6 = Property;
    v8 = objc_msgSend(objc_getProperty(self, v7, 16, 1), "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    sub_1000171EC(v6, v9);

    v11 = objc_getProperty(self, v10, 16, 1);
    if (v11)
      v11 = objc_getProperty(v11, v12, 408, 1);
    v13 = v11;
    v15 = objc_getProperty(self, v14, 16, 1);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "configuration"));
    sub_1000171EC(0, v17);

    v13 = 0;
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "configuration"));
  sub_1000171EC(v13, v16);

}

@end
