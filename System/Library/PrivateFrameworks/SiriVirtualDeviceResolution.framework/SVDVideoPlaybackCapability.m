@implementation SVDVideoPlaybackCapability

- (SVDVideoPlaybackCapability)initWithStatus:(int64_t)a3
{
  SVDVideoPlaybackCapability *v4;
  _TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability *v5;
  _TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability *backing;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SVDVideoPlaybackCapability;
  v4 = -[SVDVideoPlaybackCapability init](&v8, sel_init);
  if (v4)
  {
    v5 = -[VideoPlaybackCapability initWithStatus:]([_TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability alloc], "initWithStatus:", a3);
    backing = v4->_backing;
    v4->_backing = v5;

  }
  return v4;
}

- (int64_t)supportsVideoPlayback
{
  return -[VideoPlaybackCapability supportsVideoPlayback](self->_backing, "supportsVideoPlayback");
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_backing, CFSTR("SVDVideoPlaybackCapabilityBacking"));
}

- (SVDVideoPlaybackCapability)initWithCoder:(id)a3
{
  id v4;
  SVDVideoPlaybackCapability *v5;
  uint64_t v6;
  _TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability *backing;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDVideoPlaybackCapability;
  v5 = -[SVDVideoPlaybackCapability init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVDVideoPlaybackCapabilityBacking"));
    v6 = objc_claimAutoreleasedReturnValue();
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability *)v6;

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

  +[VideoPlaybackCapability capabilityDescriptionMatchingSupportStatus:](_TtC27SiriVirtualDeviceResolution23VideoPlaybackCapability, "capabilityDescriptionMatchingSupportStatus:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVDCapabilityDescription initWithBacking:]([SVDCapabilityDescription alloc], "initWithBacking:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
