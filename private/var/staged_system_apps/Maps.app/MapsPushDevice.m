@implementation MapsPushDevice

- (MapsPushDevice)initWithIDSDevice:(id)a3
{
  id v5;
  MapsPushDevice *v6;
  MapsPushDevice *v7;
  MapsPushDevice *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsPushDevice;
  v6 = -[MapsPushDevice init](&v10, "init");
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = v7;
  }

  return v8;
}

- (NSString)model
{
  return (NSString *)-[IDSDevice modelIdentifier](self->_device, "modelIdentifier");
}

- (NSString)uniqueID
{
  return (NSString *)-[IDSDevice uniqueID](self->_device, "uniqueID");
}

- (NSString)colorName
{
  return (NSString *)-[IDSDevice deviceColor](self->_device, "deviceColor");
}

- (NSString)enclosureColorName
{
  return (NSString *)-[IDSDevice enclosureColor](self->_device, "enclosureColor");
}

- (NSString)name
{
  return (NSString *)-[IDSDevice name](self->_device, "name");
}

- (BOOL)isFake
{
  return 0;
}

- (IDSDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pushToken, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
