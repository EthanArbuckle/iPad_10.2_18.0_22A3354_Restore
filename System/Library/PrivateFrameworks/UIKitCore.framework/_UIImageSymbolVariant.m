@implementation _UIImageSymbolVariant

+ (_UIImageSymbolVariant)variantWithFillVariant:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_opt_new();
  v4[1] = a3;
  return (_UIImageSymbolVariant *)v4;
}

+ (id)filledVariant
{
  return (id)objc_msgSend(a1, "variantWithFillVariant:", 1);
}

+ (id)unfilledVariant
{
  return (id)objc_msgSend(a1, "variantWithFillVariant:", 2);
}

- (BOOL)isUnspecified
{
  return -[_UIImageSymbolVariant fillVariant](self, "fillVariant") == 0;
}

- (BOOL)isEqual:(id)a3
{
  _UIImageSymbolVariant *v4;
  void *v5;
  char isKindOfClass;
  BOOL v7;

  v4 = (_UIImageSymbolVariant *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = (isKindOfClass & 1) != 0 && self->_fillVariant == v4->_fillVariant;
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_fillVariant;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  objc_opt_class();
  result = (id)objc_opt_new();
  *((_QWORD *)result + 1) = self->_fillVariant;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_fillVariant, CFSTR("fillVariant"));
}

- (_UIImageSymbolVariant)initWithCoder:(id)a3
{
  id v4;
  _UIImageSymbolVariant *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageSymbolVariant;
  v5 = -[_UIImageSymbolVariant init](&v7, sel_init);
  if (v5)
    v5->_fillVariant = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fillVariant"));

  return v5;
}

- (int64_t)fillVariant
{
  return self->_fillVariant;
}

- (void)setFillVariant:(int64_t)a3
{
  self->_fillVariant = a3;
}

@end
