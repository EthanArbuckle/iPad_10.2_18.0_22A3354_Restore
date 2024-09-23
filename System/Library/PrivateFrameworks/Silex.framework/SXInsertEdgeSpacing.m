@implementation SXInsertEdgeSpacing

- (_QWORD)initWithTop:(uint64_t)a3 bottom:(uint64_t)a4
{
  objc_super v9;

  if (result)
  {
    v9.receiver = result;
    v9.super_class = (Class)SXInsertEdgeSpacing;
    result = objc_msgSendSuper2(&v9, sel_init);
    if (result)
    {
      result[1] = a2;
      result[2] = a3;
      result[5] = a4;
      result[6] = a5;
    }
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
