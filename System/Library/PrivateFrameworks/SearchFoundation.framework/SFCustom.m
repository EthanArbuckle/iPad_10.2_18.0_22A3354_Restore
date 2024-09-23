@implementation SFCustom

- (SFCustom)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCustom;
  return -[SFCustom init](&v3, sel_init);
}

- (SFCustom)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFCustom;
  return -[SFCustom init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
