@implementation FMFSaveMeCommand

- (FMFSaveMeCommand)initWithDeviceId:(id)a3
{
  id v4;
  FMFSaveMeCommand *v5;
  FMFSaveMeCommand *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFSaveMeCommand;
  v5 = -[FMFBaseCmd initWithClientSession:](&v8, "initWithClientSession:", 0);
  v6 = v5;
  if (v5)
    -[FMFSaveMeCommand setDeviceId:](v5, "setDeviceId:", v4);

  return v6;
}

- (id)pathSuffix
{
  return CFSTR("saveme/savePrefs");
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMFSaveMeCommand;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v9, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFSaveMeCommand deviceId](self, "deviceId"));
  if (v5)
    v6 = objc_claimAutoreleasedReturnValue(-[FMFSaveMeCommand deviceId](self, "deviceId"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v7 = (void *)v6;
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("meDeviceId"));

  return v4;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
}

@end
