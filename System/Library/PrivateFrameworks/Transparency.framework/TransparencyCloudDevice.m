@implementation TransparencyCloudDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TransparencyCloudDevice loggableData](self, "loggableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("loggableData"));

  -[TransparencyCloudDevice state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("state"));

  -[TransparencyCloudDevice serialNumber](self, "serialNumber");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sn"));

}

- (TransparencyCloudDevice)initWithCoder:(id)a3
{
  id v4;
  TransparencyCloudDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  TransparencyCloudDevice *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TransparencyCloudDevice;
  v5 = -[TransparencyCloudDevice init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loggableData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyCloudDevice setLoggableData:](v5, "setLoggableData:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyCloudDevice setState:](v5, "setState:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sn"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TransparencyCloudDevice setSerialNumber:](v5, "setSerialNumber:", v8);

    v9 = v5;
  }

  return v5;
}

- (KTLoggableData)loggableData
{
  return (KTLoggableData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoggableData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_loggableData, 0);
}

@end
