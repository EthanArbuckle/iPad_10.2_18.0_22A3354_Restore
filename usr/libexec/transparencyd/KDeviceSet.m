@implementation KDeviceSet

- (KDeviceSet)init
{
  KDeviceSet *v2;
  void *v3;
  KDeviceSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KDeviceSet;
  v2 = -[KDeviceSet init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[KDeviceSet setDevices:](v2, "setDevices:", v3);

    v4 = v2;
  }

  return v2;
}

- (id)addDevice:(id)a3 registationData:(id)a4 app:(id)a5
{
  id v8;
  id v9;
  id v10;
  KDevice *v11;
  void *v12;
  KDevice *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[KDevice initWithPushToken:registrationData:]([KDevice alloc], "initWithPushToken:registrationData:", v10, v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](self, "devices"));
  v13 = (KDevice *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "member:", v11));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[KDeviceSet devices](self, "devices"));
    objc_msgSend(v14, "addObject:", v11);

    v13 = v11;
  }
  -[KDevice addApplication:](v13, "addApplication:", v8);

  return v13;
}

- (NSMutableSet)devices
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
