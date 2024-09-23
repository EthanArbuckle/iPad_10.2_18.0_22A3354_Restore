@implementation _SFECKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFECKeySpecifier)initWithCurve:(int64_t)a3
{
  _SFECKeySpecifier *v4;
  SFECKeySpecifier_Ivars *v5;
  id ecKeySpecifierInternal;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFECKeySpecifier;
  v4 = -[_SFECKeySpecifier init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SFECKeySpecifier_Ivars);
    ecKeySpecifierInternal = v4->_ecKeySpecifierInternal;
    v4->_ecKeySpecifierInternal = v5;

    *((_QWORD *)v4->_ecKeySpecifierInternal + 1) = a3;
  }
  return v4;
}

- (_SFECKeySpecifier)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFECKeySpecifier;
  return -[_SFECKeySpecifier init](&v4, sel_init, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCurve:", *((_QWORD *)self->_ecKeySpecifierInternal + 1));
}

- (id)description
{
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (*((_QWORD *)self->_ecKeySpecifierInternal + 1) >= 8uLL)
    v2 = 0;
  else
    v2 = CFSTR("nistp521-compressed");
  v7.receiver = self;
  v7.super_class = (Class)_SFECKeySpecifier;
  -[_SFECKeySpecifier description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" curve: %@"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)curve
{
  return *((_QWORD *)self->_ecKeySpecifierInternal + 1);
}

- (void)setCurve:(int64_t)a3
{
  *((_QWORD *)self->_ecKeySpecifierInternal + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ecKeySpecifierInternal, 0);
}

@end
