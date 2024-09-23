@implementation SXAutoPlacementMargin

- (SXAutoPlacementMargin)initWithTop:(_SXConvertibleValue)a3 bottom:(_SXConvertibleValue)a4
{
  unint64_t unit;
  double value;
  unint64_t v6;
  double v7;
  SXAutoPlacementMargin *result;
  objc_super v9;

  unit = a4.unit;
  value = a4.value;
  v6 = a3.unit;
  v7 = a3.value;
  v9.receiver = self;
  v9.super_class = (Class)SXAutoPlacementMargin;
  result = -[SXAutoPlacementMargin init](&v9, sel_init);
  if (result)
  {
    result->_top.value = v7;
    result->_top.unit = v6;
    result->_bottom.value = value;
    result->_bottom.unit = unit;
  }
  return result;
}

- (_SXConvertibleValue)top
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_top.unit;
  value = self->_top.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (_SXConvertibleValue)right
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_right.unit;
  value = self->_right.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (_SXConvertibleValue)bottom
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_bottom.unit;
  value = self->_bottom.value;
  result.unit = unit;
  result.value = value;
  return result;
}

- (_SXConvertibleValue)left
{
  unint64_t unit;
  double value;
  _SXConvertibleValue result;

  unit = self->_left.unit;
  value = self->_left.value;
  result.unit = unit;
  result.value = value;
  return result;
}

@end
