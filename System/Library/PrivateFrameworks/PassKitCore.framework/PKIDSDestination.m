@implementation PKIDSDestination

- (PKIDSDestination)initWithDeviceIdentifier:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  PKIDSDestination *v8;
  uint64_t v9;
  NSString *deviceIdentifier;
  uint64_t v11;
  NSString *name;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKIDSDestination;
  v8 = -[PKIDSDestination init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_deviceIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v11;

  }
  return v8;
}

+ (id)destinationWithDeviceIdentifier:(id)a3 name:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDeviceIdentifier:name:", v6, v5);

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: name: %@; deviceIdentifier: %@>"),
    v5,
    self,
    self->_name,
    self->_deviceIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
