@implementation KTIDMSDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[KTIDMSDevice deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTIDMSDevice deviceID](self, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v5, CFSTR("deviceID"));

  }
  -[KTIDMSDevice name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTIDMSDevice name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v7, CFSTR("name"));

  }
  -[KTIDMSDevice model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[KTIDMSDevice model](self, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v9, CFSTR("model"));

  }
  -[KTIDMSDevice name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[KTIDMSDevice pushToken](self, "pushToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v11, CFSTR("pushToken"));

  }
  -[KTIDMSDevice osVersion](self, "osVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[KTIDMSDevice osVersion](self, "osVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v13, CFSTR("osVersion"));

  }
  -[KTIDMSDevice build](self, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[KTIDMSDevice build](self, "build");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v15, CFSTR("build"));

  }
  -[KTIDMSDevice serial](self, "serial");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[KTIDMSDevice serial](self, "serial");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "encodeObject:forKey:", v17, CFSTR("serial"));

  }
}

- (KTIDMSDevice)initWithCoder:(id)a3
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
  v5 = -[KTIDMSDevice init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDMSDevice setDeviceID:](v5, "setDeviceID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDMSDevice setName:](v5, "setName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDMSDevice setModel:](v5, "setModel:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushToken"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDMSDevice setPushToken:](v5, "setPushToken:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("osVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDMSDevice setOsVersion:](v5, "setOsVersion:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDMSDevice setBuild:](v5, "setBuild:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serial"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTIDMSDevice setSerial:](v5, "setSerial:", v12);

    v13 = v5;
  }

  return v5;
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)pushToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBuild:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)serial
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSerial:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serial, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
