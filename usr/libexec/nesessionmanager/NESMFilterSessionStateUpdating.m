@implementation NESMFilterSessionStateUpdating

- (NESMFilterSessionStateUpdating)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateUpdating;
  return -[NESMFilterSessionState initWithType:andTimeout:](&v3, "initWithType:andTimeout:", 5, 300);
}

- (void)enterWithSession:(id)a3
{
  const char *v4;
  _BYTE *Property;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NESMFilterSessionStateUpdating;
  -[NESMFilterSessionState enterWithSession:](&v8, "enterWithSession:", a3);
  if (self)
  {
    Property = objc_getProperty(self, v4, 16, 1);
    if (Property)
    {
      v6 = Property;
      sub_10006FF24(Property, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "server"));
      objc_msgSend(v7, "requestUninstallForSession:", v6);

    }
  }
}

- (void)handleStop
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  id Property;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v3 = ne_log_obj(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
      Property = objc_getProperty(self, v5, 16, 1);
    else
      Property = 0;
    v7 = (objc_class *)objc_opt_class(self);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412546;
    v11 = Property;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ ignoring stop message in state %@", (uint8_t *)&v10, 0x16u);

  }
}

@end
