@implementation SFMoveToAppShareSheet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMoveToAppShareSheet)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[SFXPCInvocation init](&v3, sel_init);
}

- (SFMoveToAppShareSheet)initWithCoder:(id)a3
{
  id v3;
  SFMoveToAppShareSheet *v4;

  v3 = a3;
  v4 = (SFMoveToAppShareSheet *)sub_1A2A00984(v3);

  return v4;
}

@end
