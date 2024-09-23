@implementation ContinuousNumericCapabilityPrimitive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive *v5;

  v4 = a3;
  v5 = self;
  sub_1C2ED514C(v4);

}

- (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive)initWithCoder:(id)a3
{
  return (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive *)sub_1C2ED51FC(a3);
}

- (_TtC27SiriVirtualDeviceResolution36ContinuousNumericCapabilityPrimitive)init
{
  sub_1C2ED52BC();
}

@end
