@implementation SVDBooleanCapabilityPrimitive

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SVDBooleanCapabilityPrimitive *v5;

  v4 = a3;
  v5 = self;
  sub_1C2ED4E88(v4);

}

- (SVDBooleanCapabilityPrimitive)initWithCoder:(id)a3
{
  return (SVDBooleanCapabilityPrimitive *)sub_1C2ED4F30(a3);
}

- (SVDBooleanCapabilityPrimitive)init
{
  sub_1C2ED4FF8();
}

@end
