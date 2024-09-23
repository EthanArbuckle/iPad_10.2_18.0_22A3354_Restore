@implementation PKAccountEnhancedMerchantBehavior

- (PKAccountEnhancedMerchantBehavior)init
{
  return -[PKAccountEnhancedMerchantBehavior initWithMinRefreshPeriod:](self, "initWithMinRefreshPeriod:", 0);
}

- (PKAccountEnhancedMerchantBehavior)initWithMinRefreshPeriod:(id)a3
{
  id v4;
  PKAccountEnhancedMerchantBehavior *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAccountEnhancedMerchantBehavior;
  v5 = -[PKAccountEnhancedMerchantBehavior init](&v8, sel_init);
  if (v5)
  {
    if (v4)
      objc_msgSend(v4, "doubleValue");
    else
      v6 = 0x4092C00000000000;
    *(_QWORD *)&v5->_minRefreshPeriod = v6;
    *(_OWORD *)&v5->_shortMinRefreshPeriod = xmmword_190453D10;
  }

  return v5;
}

- (PKAccountEnhancedMerchantBehavior)initWithDictionary:(id)a3
{
  void *v4;
  PKAccountEnhancedMerchantBehavior *v5;

  objc_msgSend(a3, "PKNumberForKey:", CFSTR("minRefreshPeriod"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PKAccountEnhancedMerchantBehavior initWithMinRefreshPeriod:](self, "initWithMinRefreshPeriod:", v4);

  return v5;
}

- (double)cooldownPeriodForLevel:(unint64_t)a3
{
  double result;
  uint64_t v4;

  result = 0.0;
  v4 = 16;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      return *(double *)((char *)&self->super.isa + v4);
    case 3uLL:
      v4 = 24;
      return *(double *)((char *)&self->super.isa + v4);
    default:
      v4 = 8;
      return *(double *)((char *)&self->super.isa + v4);
  }
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("minRefreshPeriod: '%f'; "), *(_QWORD *)&self->_minRefreshPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("shortMinRefreshPeriod: '%f'; "), *(_QWORD *)&self->_shortMinRefreshPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR("longRefreshPeriod: '%f'; "), *(_QWORD *)&self->_longMinRefreshPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountEnhancedMerchantBehavior *v4;
  PKAccountEnhancedMerchantBehavior *v5;
  BOOL v6;

  v4 = (PKAccountEnhancedMerchantBehavior *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountEnhancedMerchantBehavior isEqualToAccountEnhancedMerchantBehavior:](self, "isEqualToAccountEnhancedMerchantBehavior:", v5);

  return v6;
}

- (BOOL)isEqualToAccountEnhancedMerchantBehavior:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = v4
    && self->_minRefreshPeriod == v4[1]
    && self->_shortMinRefreshPeriod == v4[2]
    && self->_longMinRefreshPeriod == v4[3];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = (unint64_t)self->_shortMinRefreshPeriod
     - (unint64_t)self->_minRefreshPeriod
     + 32 * (unint64_t)self->_minRefreshPeriod;
  return (unint64_t)self->_longMinRefreshPeriod - v2 + 32 * v2 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountEnhancedMerchantBehavior)initWithCoder:(id)a3
{
  id v4;
  PKAccountEnhancedMerchantBehavior *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKAccountEnhancedMerchantBehavior;
  v5 = -[PKAccountEnhancedMerchantBehavior init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minRefreshPeriod"));
    v5->_minRefreshPeriod = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("shortMinRefreshPeriod"));
    v5->_shortMinRefreshPeriod = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("longMinRefreshPeriod"));
    v5->_longMinRefreshPeriod = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double minRefreshPeriod;
  id v5;

  minRefreshPeriod = self->_minRefreshPeriod;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("minRefreshPeriod"), minRefreshPeriod);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("shortMinRefreshPeriod"), self->_shortMinRefreshPeriod);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("longMinRefreshPeriod"), self->_longMinRefreshPeriod);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_minRefreshPeriod;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_shortMinRefreshPeriod;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_longMinRefreshPeriod;
  return result;
}

- (double)minRefreshPeriod
{
  return self->_minRefreshPeriod;
}

- (void)setMinRefreshPeriod:(double)a3
{
  self->_minRefreshPeriod = a3;
}

- (double)shortMinRefreshPeriod
{
  return self->_shortMinRefreshPeriod;
}

- (void)setShortMinRefreshPeriod:(double)a3
{
  self->_shortMinRefreshPeriod = a3;
}

- (double)longMinRefreshPeriod
{
  return self->_longMinRefreshPeriod;
}

- (void)setLongMinRefreshPeriod:(double)a3
{
  self->_longMinRefreshPeriod = a3;
}

@end
