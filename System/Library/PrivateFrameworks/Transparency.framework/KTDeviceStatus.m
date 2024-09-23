@implementation KTDeviceStatus

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
  id v12;

  v12 = a3;
  -[KTDeviceStatus idms](self, "idms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTDeviceStatus idms](self, "idms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("idms"));

  }
  -[KTDeviceStatus loggableData](self, "loggableData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTDeviceStatus loggableData](self, "loggableData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("loggableData"));

  }
  -[KTDeviceStatus loggableDataError](self, "loggableDataError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDE84F8];
    -[KTDeviceStatus loggableDataError](self, "loggableDataError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cleanseErrorForXPC:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("loggableDataError"));

  }
}

- (KTDeviceStatus)initWithCoder:(id)a3
{
  id v4;
  KTDeviceStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  KTDeviceStatus *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KTDeviceStatus;
  v5 = -[KTDeviceStatus init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idms"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTDeviceStatus setIdms:](v5, "setIdms:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loggableData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTDeviceStatus setLoggableData:](v5, "setLoggableData:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loggableDataError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTDeviceStatus setLoggableDataError:](v5, "setLoggableDataError:", v8);

    v9 = v5;
  }

  return v5;
}

- (KTIDMSDevice)idms
{
  return (KTIDMSDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdms:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTLoggableData)loggableData
{
  return (KTLoggableData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLoggableData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSError)loggableDataError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoggableDataError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableDataError, 0);
  objc_storeStrong((id *)&self->_loggableData, 0);
  objc_storeStrong((id *)&self->_idms, 0);
}

@end
