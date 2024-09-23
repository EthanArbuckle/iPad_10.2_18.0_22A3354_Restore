@implementation FMFRemoveDeviceCommand

- (FMFRemoveDeviceCommand)initWithClientSession:(id)a3 device:(id)a4
{
  id v6;
  FMFRemoveDeviceCommand *v7;
  FMFRemoveDeviceCommand *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFRemoveDeviceCommand;
  v7 = -[FMFBaseCmd initWithClientSession:](&v10, "initWithClientSession:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    -[FMFRemoveDeviceCommand setActiveDevice:](v7, "setActiveDevice:", v6);
  }
  else
  {
    -[FMFBaseCmd initFailed](v7, "initFailed");

    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return CFSTR("removeDevice");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMFRemoveDeviceCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v8, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveDeviceCommand activeDevice](self, "activeDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceId"));
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("deviceId"));

  return v4;
}

- (id)debugDescription
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFRemoveDeviceCommand activeDevice](self, "activeDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: activeDevice: %@"), self, v3));

  return v4;
}

- (BOOL)isUserAction
{
  return 1;
}

- (FMFDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDevice, 0);
}

@end
