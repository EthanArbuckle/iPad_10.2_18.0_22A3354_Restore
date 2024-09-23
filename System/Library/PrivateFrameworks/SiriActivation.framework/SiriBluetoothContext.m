@implementation SiriBluetoothContext

- (SiriBluetoothContext)initWithBluetoothDevice:(id)a3
{
  id v4;
  SiriBluetoothContext *v5;
  uint64_t v6;
  NSNumber *isTemporaryDevice;
  uint64_t v8;
  NSNumber *isEyesFree;
  uint64_t v10;
  NSString *address;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SiriBluetoothContext;
  v5 = -[SiriBluetoothContext init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "device");
    BTDeviceIsTemporaryPaired();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)v6;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "ac_isEyesFree"));
    v8 = objc_claimAutoreleasedReturnValue();
    isEyesFree = v5->_isEyesFree;
    v5->_isEyesFree = (NSNumber *)v8;

    objc_msgSend(v4, "address");
    v10 = objc_claimAutoreleasedReturnValue();
    address = v5->_address;
    v5->_address = (NSString *)v10;

  }
  return v5;
}

- (BOOL)isTemporaryDevice
{
  return -[NSNumber BOOLValue](self->_isTemporaryDevice, "BOOLValue");
}

- (BOOL)isEyesFree
{
  return -[NSNumber BOOLValue](self->_isEyesFree, "BOOLValue");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SiriContext contextOverride](self, "contextOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SiriBluetoothContext contextOverride:%@ isTemporaryDevice:%@ isEyesFree:%@ address:%@>"), v4, self->_isTemporaryDevice, self->_isEyesFree, self->_address);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriBluetoothContext)initWithCoder:(id)a3
{
  id v4;
  SiriBluetoothContext *v5;
  uint64_t v6;
  NSNumber *isTemporaryDevice;
  uint64_t v8;
  NSNumber *isEyesFree;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriBluetoothContext;
  v5 = -[SiriContext initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isTemporaryDevice"));
    v6 = objc_claimAutoreleasedReturnValue();
    isTemporaryDevice = v5->_isTemporaryDevice;
    v5->_isTemporaryDevice = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isEyesFree"));
    v8 = objc_claimAutoreleasedReturnValue();
    isEyesFree = v5->_isEyesFree;
    v5->_isEyesFree = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = &stru_1E91FDE50;
    objc_storeStrong((id *)&v5->_address, v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriBluetoothContext;
  v4 = a3;
  -[SiriContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_isTemporaryDevice, CFSTR("isTemporaryDevice"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_isEyesFree, CFSTR("isEyesFree"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_address, CFSTR("address"));

}

- (NSString)address
{
  return self->_address;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_isEyesFree, 0);
  objc_storeStrong((id *)&self->_isTemporaryDevice, 0);
}

@end
