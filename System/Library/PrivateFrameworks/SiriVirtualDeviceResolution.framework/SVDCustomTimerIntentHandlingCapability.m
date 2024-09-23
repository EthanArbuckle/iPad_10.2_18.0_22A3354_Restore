@implementation SVDCustomTimerIntentHandlingCapability

- (SVDCustomTimerIntentHandlingCapability)initWithStatus:(int64_t)a3
{
  SVDCustomTimerIntentHandlingCapability *v4;
  _TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability *v5;
  _TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability *backing;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SVDCustomTimerIntentHandlingCapability;
  v4 = -[SVDCustomTimerIntentHandlingCapability init](&v8, sel_init);
  if (v4)
  {
    v5 = -[CustomTimerIntentHandlingCapability initWithStatus:]([_TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability alloc], "initWithStatus:", a3);
    backing = v4->_backing;
    v4->_backing = v5;

  }
  return v4;
}

- (int64_t)supportsCustomTimerIntentHandling
{
  return -[CustomTimerIntentHandlingCapability supportsCustomTimerIntentHandling](self->_backing, "supportsCustomTimerIntentHandling");
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDCustomTimerIntentHandlingCapability"));
}

- (SVDCustomTimerIntentHandlingCapability)initWithCoder:(id)a3
{
  id v4;
  SVDCustomTimerIntentHandlingCapability *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDCustomTimerIntentHandlingCapability;
  v5 = -[SVDCustomTimerIntentHandlingCapability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDCustomTimerIntentHandlingCapability"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability *)v6;

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

  +[CustomTimerIntentHandlingCapability capabilityDescriptionMatchingSupportStatus:](_TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability, "capabilityDescriptionMatchingSupportStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
