@implementation RPStatusDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPStatusDevice)initWithDevice:(id)a3
{
  id v5;
  RPStatusDevice *v6;
  RPStatusDevice *v7;
  RPStatusDevice *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPStatusDevice;
  v6 = -[RPStatusDevice init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = v7;
  }

  return v7;
}

- (id)getIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[RPEndpoint idsDeviceIdentifier](self->_device, "idsDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[RPEndpoint identifier](self->_device, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (RPStatusDevice)initWithCoder:(id)a3
{
  RPStatusDevice *v3;
  RPStatusDevice *v4;
  RPStatusDevice *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPStatusDevice;
  v3 = -[RPStatusDevice init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (NSMutableDictionary)statusInfoMap
{
  return self->_statusInfoMap;
}

- (void)setStatusInfoMap:(id)a3
{
  objc_storeStrong((id *)&self->_statusInfoMap, a3);
}

- (NSMutableDictionary)statusStateMap
{
  return self->_statusStateMap;
}

- (void)setStatusStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_statusStateMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusStateMap, 0);
  objc_storeStrong((id *)&self->_statusInfoMap, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
