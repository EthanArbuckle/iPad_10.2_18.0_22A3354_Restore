@implementation KTIDMSDevice

- (id)initWithAKRemoteDevice:(id)a3
{
  id v4;
  KTIDMSDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  KTIDMSDevice *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KTIDMSDevice;
  v5 = -[KTIDMSDevice init](&v15, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "machineId"));
    -[KTIDMSDevice setDeviceID:](v5, "setDeviceID:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    -[KTIDMSDevice setName:](v5, "setName:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    -[KTIDMSDevice setModel:](v5, "setModel:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "operatingSystemVersion"));
    -[KTIDMSDevice setOsVersion:](v5, "setOsVersion:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buildNumber"));
    -[KTIDMSDevice setBuild:](v5, "setBuild:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    -[KTIDMSDevice setSerial:](v5, "setSerial:", v11);

    if ((objc_opt_respondsToSelector(v4, "pushToken") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pushToken"));
      -[KTIDMSDevice setPushToken:](v5, "setPushToken:", v12);

    }
    v13 = v5;
  }

  return v5;
}

@end
