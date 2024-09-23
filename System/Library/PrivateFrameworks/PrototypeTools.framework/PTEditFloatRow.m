@implementation PTEditFloatRow

- (id)precision:(unint64_t)a3
{
  -[PTEditFloatRow setPrecision:](self, "setPrecision:", a3);
  return self;
}

- (id)between:(double)a3 and:(double)a4
{
  -[PTEditFloatRow setMinValue:](self, "setMinValue:", a3);
  -[PTEditFloatRow setMaxValue:](self, "setMaxValue:", a4);
  return self;
}

- (PTEditFloatRow)init
{
  PTEditFloatRow *v2;
  PTEditFloatRow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTEditFloatRow;
  v2 = -[PTRow init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PTEditFloatRow setPrecision:](v2, "setPrecision:", 2);
    -[PTEditFloatRow setMinValue:](v3, "setMinValue:", 2.22507386e-308);
    -[PTEditFloatRow setMaxValue:](v3, "setMaxValue:", 1.79769313e308);
  }
  return v3;
}

- (id)_validatedValue:(id)a3
{
  double maxValue;
  double minValue;
  float v5;
  double v6;

  maxValue = self->_maxValue;
  minValue = self->_minValue;
  objc_msgSend(a3, "floatValue");
  v6 = v5;
  if (minValue >= v6)
    v6 = minValue;
  if (maxValue < v6)
    v6 = maxValue;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
}

- (BOOL)isEqual:(id)a3
{
  PTEditFloatRow *v4;
  BOOL v5;
  objc_super v7;

  v4 = (PTEditFloatRow *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTEditFloatRow;
    v5 = -[PTRow isEqual:](&v7, sel_isEqual_, v4)
      && self->_precision == v4->_precision
      && PTEqualFloats(self->_minValue, v4->_minValue)
      && PTEqualFloats(self->_maxValue, v4->_maxValue);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v10[2] = __22__PTEditFloatRow_hash__block_invoke;
  v10[3] = &unk_1E7058178;
  v10[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v10, 0);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_precision);
  v6 = (id)objc_msgSend(v3, "appendDouble:", self->_minValue);
  v7 = (id)objc_msgSend(v3, "appendDouble:", self->_maxValue);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

id __22__PTEditFloatRow_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTEditFloatRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTEditFloatRow;
  v4 = -[PTRow copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPrecision:", self->_precision);
  objc_msgSend(v4, "setMinValue:", self->_minValue);
  objc_msgSend(v4, "setMaxValue:", self->_maxValue);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTEditFloatRow;
  v4 = a3;
  -[PTRow encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_precision, CFSTR("precision"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minValue"), self->_minValue);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxValue"), self->_maxValue);

}

- (PTEditFloatRow)initWithCoder:(id)a3
{
  id v4;
  PTEditFloatRow *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTEditFloatRow;
  v5 = -[PTRow initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_precision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("precision"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minValue"));
    v5->_minValue = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxValue"));
    v5->_maxValue = v7;
  }

  return v5;
}

- (unint64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(unint64_t)a3
{
  self->_precision = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

@end
