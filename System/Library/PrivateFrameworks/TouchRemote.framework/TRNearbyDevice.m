@implementation TRNearbyDevice

- (TRNearbyDevice)init
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("-init is not a valid initializer for the class %@"), v4);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (TRNearbyDevice)initWithRepresentedDevice:(id)a3 supportedService:(unint64_t)a4
{
  id v7;
  TRNearbyDevice *v8;
  TRNearbyDevice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TRNearbyDevice;
  v8 = -[TRNearbyDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_representedDevice, a3);
    v9->_supportedService = a4;
  }

  return v9;
}

- (NSUUID)identifier
{
  void *v2;
  void *v3;

  -[TRNearbyDevice representedDevice](self, "representedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[TRNearbyDevice identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> Identifier: (%@)"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)supportedService
{
  return self->_supportedService;
}

- (void)setSupportedService:(unint64_t)a3
{
  self->_supportedService = a3;
}

- (SFDevice)representedDevice
{
  return self->_representedDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_representedDevice, 0);
}

@end
