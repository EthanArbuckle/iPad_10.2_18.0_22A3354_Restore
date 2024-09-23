@implementation SVDAlarmTimerIntentsHandlingCapability

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SVDAlarmTimerIntentsHandlingCapability)initWithStatus:(int64_t)a3
{
  SVDAlarmTimerIntentsHandlingCapability *v4;
  _TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability *v5;
  _TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability *backing;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SVDAlarmTimerIntentsHandlingCapability;
  v4 = -[SVDAlarmTimerIntentsHandlingCapability init](&v8, sel_init);
  if (v4)
  {
    v5 = -[AlarmTimerIntentsHandlingCapability initWithStatus:]([_TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability alloc], "initWithStatus:", a3);
    backing = v4->_backing;
    v4->_backing = v5;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

- (int64_t)supportsAlarmTimerIntentsHandling
{
  return -[AlarmTimerIntentsHandlingCapability supportsAlarmTimerIntentsHandling](self->_backing, "supportsAlarmTimerIntentsHandling");
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDAlarmTimerIntentsHandlingCapabilityBacking"));
}

- (SVDAlarmTimerIntentsHandlingCapability)initWithCoder:(id)a3
{
  id v4;
  SVDAlarmTimerIntentsHandlingCapability *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDAlarmTimerIntentsHandlingCapability;
  v5 = -[SVDAlarmTimerIntentsHandlingCapability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDAlarmTimerIntentsHandlingCapabilityBacking"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability *)v6;

  }
  return v5;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  void *v3;
  SVDCapabilityDescription *v4;

  +[AlarmTimerIntentsHandlingCapability capabilityDescriptionMatchingSupportStatus:](_TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability, "capabilityDescriptionMatchingSupportStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v3);

  return v4;
}

@end
