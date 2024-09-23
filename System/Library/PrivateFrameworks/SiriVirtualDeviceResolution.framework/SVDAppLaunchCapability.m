@implementation SVDAppLaunchCapability

- (SVDAppLaunchCapability)initWithStatus:(int64_t)a3
{
  SVDAppLaunchCapability *v4;
  _TtC27SiriVirtualDeviceResolution19AppLaunchCapability *v5;
  _TtC27SiriVirtualDeviceResolution19AppLaunchCapability *backing;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SVDAppLaunchCapability;
  v4 = -[SVDAppLaunchCapability init](&v8, sel_init);
  if (v4)
  {
    v5 = -[AppLaunchCapability initWithStatus:]([_TtC27SiriVirtualDeviceResolution19AppLaunchCapability alloc], "initWithStatus:", a3);
    backing = v4->_backing;
    v4->_backing = v5;

  }
  return v4;
}

- (int64_t)supportsAppLaunch
{
  return -[AppLaunchCapability supportsAppLaunch](self->_backing, "supportsAppLaunch");
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDAppLaunchCapabilityBacking"));
}

- (SVDAppLaunchCapability)initWithCoder:(id)a3
{
  id v4;
  SVDAppLaunchCapability *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution19AppLaunchCapability *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDAppLaunchCapability;
  v5 = -[SVDAppLaunchCapability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDAppLaunchCapabilityBacking"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution19AppLaunchCapability *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  void *v3;
  SVDCapabilityDescription *v4;

  +[AppLaunchCapability capabilityDescriptionMatchingSupportStatus:](_TtC27SiriVirtualDeviceResolution19AppLaunchCapability, "capabilityDescriptionMatchingSupportStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
