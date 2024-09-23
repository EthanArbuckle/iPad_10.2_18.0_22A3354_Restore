@implementation SVDVoiceTriggerCapability

- (SVDVoiceTriggerCapability)initWithStatus:(int64_t)a3
{
  SVDVoiceTriggerCapability *v4;
  _TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability *v5;
  _TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability *backing;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SVDVoiceTriggerCapability;
  v4 = -[SVDVoiceTriggerCapability init](&v8, sel_init);
  if (v4)
  {
    v5 = -[VoiceTriggerCapability initWithStatus:]([_TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability alloc], "initWithStatus:", a3);
    backing = v4->_backing;
    v4->_backing = v5;

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

- (int64_t)supportsVoiceTrigger
{
  return -[VoiceTriggerCapability supportsVoiceTrigger](self->_backing, "supportsVoiceTrigger");
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDVoiceTriggerCapabilityBacking"));
}

- (SVDVoiceTriggerCapability)initWithCoder:(id)a3
{
  id v4;
  SVDVoiceTriggerCapability *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDVoiceTriggerCapability;
  v5 = -[SVDVoiceTriggerCapability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDVoiceTriggerCapabilityBacking"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability *)v6;

  }
  return v5;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  void *v3;
  SVDCapabilityDescription *v4;

  +[VoiceTriggerCapability capabilityDescriptionMatchingSupportStatus:](_TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability, "capabilityDescriptionMatchingSupportStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v3);

  return v4;
}

@end
