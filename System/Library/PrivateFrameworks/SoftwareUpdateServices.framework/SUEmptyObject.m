@implementation SUEmptyObject

- (SUEmptyObject)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUEmptyObject;
  return -[SUEmptyObject init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
