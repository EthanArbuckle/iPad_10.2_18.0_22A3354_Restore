@implementation SVDSeymourRoutingCapability

- (SVDSeymourRoutingCapability)initWithStatus:(int64_t)a3
{
  SVDSeymourRoutingCapability *v4;
  _TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability *v5;
  _TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability *backing;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SVDSeymourRoutingCapability;
  v4 = -[SVDSeymourRoutingCapability init](&v8, sel_init);
  if (v4)
  {
    v5 = -[SeymourRoutingCapability initWithStatus:]([_TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability alloc], "initWithStatus:", a3);
    backing = v4->_backing;
    v4->_backing = v5;

  }
  return v4;
}

- (int64_t)supportsSeymourRouting
{
  return -[SeymourRoutingCapability supportsSeymourRouting](self->_backing, "supportsSeymourRouting");
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDSeymourRoutingCapabilityBacking"));
}

- (SVDSeymourRoutingCapability)initWithCoder:(id)a3
{
  id v4;
  SVDSeymourRoutingCapability *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDSeymourRoutingCapability;
  v5 = -[SVDSeymourRoutingCapability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDSeymourRoutingCapabilityBacking"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability *)v6;

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

  +[SeymourRoutingCapability capabilityDescriptionMatchingSupportStatus:](_TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability, "capabilityDescriptionMatchingSupportStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
