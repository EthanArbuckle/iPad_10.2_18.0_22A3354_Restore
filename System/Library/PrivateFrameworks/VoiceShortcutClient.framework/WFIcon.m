@implementation WFIcon

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFIcon;
  return -[WFIcon init](&v3, sel_init);
}

- (BOOL)hasClearBackground
{
  return 0;
}

- (BOOL)hasTransparentBackground
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
