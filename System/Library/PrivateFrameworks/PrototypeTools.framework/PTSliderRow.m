@implementation PTSliderRow

- (PTSliderRow)init
{
  PTSliderRow *v2;
  PTSliderRow *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTSliderRow;
  v2 = -[PTRow init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PTSliderRow setMinValue:](v2, "setMinValue:", 0.0);
    -[PTSliderRow setMaxValue:](v3, "setMaxValue:", 1.0);
  }
  return v3;
}

- (id)minValue:(double)a3 maxValue:(double)a4
{
  -[PTSliderRow setMinValue:](self, "setMinValue:", a3);
  -[PTSliderRow setMaxValue:](self, "setMaxValue:", a4);
  return self;
}

- (id)valueStringFormatter:(id)a3
{
  -[PTSliderRow setValueStringFormatter:](self, "setValueStringFormatter:", a3);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  PTSliderRow *v4;
  BOOL v5;
  objc_super v7;

  v4 = (PTSliderRow *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTSliderRow;
    v5 = -[PTRow isEqual:](&v7, sel_isEqual_, v4)
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
  unint64_t v7;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = 3221225472;
  v9[2] = __19__PTSliderRow_hash__block_invoke;
  v9[3] = &unk_1E7058178;
  v9[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v9, 0);
  v5 = (id)objc_msgSend(v3, "appendDouble:", self->_minValue);
  v6 = (id)objc_msgSend(v3, "appendDouble:", self->_maxValue);
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

id __19__PTSliderRow_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTSliderRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTSliderRow;
  v4 = -[PTRow copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setMinValue:", self->_minValue);
  objc_msgSend(v4, "setMaxValue:", self->_maxValue);
  objc_msgSend(v4, "setValueStringFormatter:", self->_valueStringFormatter);
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
  v5.super_class = (Class)PTSliderRow;
  v4 = a3;
  -[PTRow encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minValue"), self->_minValue, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxValue"), self->_maxValue);

}

- (PTSliderRow)initWithCoder:(id)a3
{
  id v4;
  PTSliderRow *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PTSliderRow;
  v5 = -[PTRow initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minValue"));
    v5->_minValue = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxValue"));
    v5->_maxValue = v7;
  }

  return v5;
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

- (id)valueStringFormatter
{
  return self->_valueStringFormatter;
}

- (void)setValueStringFormatter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueStringFormatter, 0);
}

@end
