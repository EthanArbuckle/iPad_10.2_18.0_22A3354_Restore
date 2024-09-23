@implementation SVDSpeakerCapability

- (SVDSpeakerCapability)initWithStatus:(int64_t)a3 qualityScore:(int64_t)a4
{
  SVDSpeakerCapability *v6;
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *v7;
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *backing;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SVDSpeakerCapability;
  v6 = -[SVDSpeakerCapability init](&v10, sel_init);
  if (v6)
  {
    v7 = -[SpeakerCapability initWithStatus:qualityScore:]([_TtC27SiriVirtualDeviceResolution17SpeakerCapability alloc], "initWithStatus:qualityScore:", a3, a4);
    backing = v6->_backing;
    v6->_backing = v7;

  }
  return v6;
}

- (int64_t)supportStatus
{
  return -[SpeakerCapability supportStatus](self->_backing, "supportStatus");
}

- (int64_t)qualityScore
{
  return -[SpeakerCapability qualityScore](self->_backing, "qualityScore");
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDSpeakerCapabilityBackingKey"));
}

- (SVDSpeakerCapability)initWithCoder:(id)a3
{
  id v4;
  SVDSpeakerCapability *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution17SpeakerCapability *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDSpeakerCapability;
  v5 = -[SVDSpeakerCapability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDSpeakerCapabilityBackingKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution17SpeakerCapability *)v6;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backing, 0);
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVDMutableSpeakerCapability *);
  _SVDMutableSpeakerCapability *v4;
  SVDSpeakerCapability *v5;

  v3 = (void (**)(id, _SVDMutableSpeakerCapability *))a3;
  v4 = objc_alloc_init(_SVDMutableSpeakerCapability);
  if (v3)
    v3[2](v3, v4);
  v5 = -[SVDSpeakerCapability initWithStatus:qualityScore:]([SVDSpeakerCapability alloc], "initWithStatus:qualityScore:", -[_SVDMutableSpeakerCapability status](v4, "status"), -[_SVDMutableSpeakerCapability qualityScore](v4, "qualityScore"));

  return v5;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  void *v3;
  SVDCapabilityDescription *v4;

  +[SpeakerCapability capabilityDescriptionMatchingSupportStatus:](_TtC27SiriVirtualDeviceResolution17SpeakerCapability, "capabilityDescriptionMatchingSupportStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v3);

  return v4;
}

+ (id)capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:(int64_t)a3 upperBound:(int64_t)a4
{
  void *v4;
  SVDCapabilityDescription *v5;

  +[SpeakerCapability capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:upperBound:](_TtC27SiriVirtualDeviceResolution17SpeakerCapability, "capabilityDescriptionMatchingQualityScoreRangeWithLowerBound:upperBound:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
