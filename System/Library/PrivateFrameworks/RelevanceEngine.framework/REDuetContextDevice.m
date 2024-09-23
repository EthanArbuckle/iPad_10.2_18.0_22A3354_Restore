@implementation REDuetContextDevice

- (REDuetContextDevice)initWithUUID:(id)a3 type:(unint64_t)a4
{
  id v7;
  REDuetContextDevice *v8;
  REDuetContextDevice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REDuetContextDevice;
  v8 = -[REDuetContextDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_deviceType = a4;
  }

  return v9;
}

+ (id)localDevice
{
  if (localDevice_onceToken != -1)
    dispatch_once(&localDevice_onceToken, &__block_literal_global_100);
  return (id)localDevice_LocalDevice;
}

void __34__REDuetContextDevice_localDevice__block_invoke()
{
  REDuetContextDevice *v0;
  void *v1;

  v0 = -[REDuetContextDevice initWithUUID:type:]([REDuetContextDevice alloc], "initWithUUID:type:", 0, 2);
  v1 = (void *)localDevice_LocalDevice;
  localDevice_LocalDevice = (uint64_t)v0;

}

+ (id)companionDevice
{
  void *v2;
  REDuetContextDevice *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("69F29713-2C08-51C0-9C58-DA6DB6AFBD28"));
  v3 = -[REDuetContextDevice initWithUUID:type:]([REDuetContextDevice alloc], "initWithUUID:type:", v2, 0xFFFFLL);

  return v3;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  REDuetContextDevice *v4;
  NSUUID *identifier;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;

  v4 = (REDuetContextDevice *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      v7 = identifier;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSUUID isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
