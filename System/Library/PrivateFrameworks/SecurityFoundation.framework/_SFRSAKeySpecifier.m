@implementation _SFRSAKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFRSAKeySpecifier)initWithBitSize:(int64_t)a3
{
  _SFRSAKeySpecifier *v4;
  SFRSAKeySpecifier_Ivars *v5;
  id rsaKeySpecifierInternal;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFRSAKeySpecifier;
  v4 = -[_SFRSAKeySpecifier init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SFRSAKeySpecifier_Ivars);
    rsaKeySpecifierInternal = v4->_rsaKeySpecifierInternal;
    v4->_rsaKeySpecifierInternal = v5;

    *((_QWORD *)v4->_rsaKeySpecifierInternal + 1) = a3;
  }
  return v4;
}

- (_SFRSAKeySpecifier)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFRSAKeySpecifier;
  return -[_SFRSAKeySpecifier init](&v4, sel_init, a3);
}

- (int64_t)bitSize
{
  return *((_QWORD *)self->_rsaKeySpecifierInternal + 1);
}

- (void)setBitSize:(int64_t)a3
{
  *((_QWORD *)self->_rsaKeySpecifierInternal + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rsaKeySpecifierInternal, 0);
}

@end
