@implementation _SFKeySpecifier

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keySpecifierInternal, 0);
}

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFKeySpecifier)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFKeySpecifier;
  return -[_SFKeySpecifier init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

@end
