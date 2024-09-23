@implementation _REDoubleFeatureValue

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_value);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)featureValueWithDouble:(double)a3
{
  void *v4;
  _REDoubleFeatureValue *v5;

  if (featureValueWithDouble__onceToken != -1)
    dispatch_once(&featureValueWithDouble__onceToken, &__block_literal_global_169);
  if (fabs(a3) >= *(double *)&REFloatingPointTaggedPointerPrecision)
  {
    if (fabs(a3 + -1.0) >= *(double *)&REFloatingPointTaggedPointerPrecision)
    {
      v5 = -[_REDoubleFeatureValue initWithValue:]([_REDoubleFeatureValue alloc], "initWithValue:", a3);
      return v5;
    }
    v4 = (void *)featureValueWithDouble__OneValue;
  }
  else
  {
    v4 = (void *)featureValueWithDouble__ZeroValue;
  }
  v5 = v4;
  return v5;
}

- (_REDoubleFeatureValue)initWithValue:(double)a3
{
  _REDoubleFeatureValue *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REDoubleFeatureValue;
  result = -[_REDoubleFeatureValue init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (unint64_t)type
{
  return 2;
}

- (double)doubleValue
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  _REDoubleFeatureValue *v4;
  BOOL v5;

  v4 = (_REDoubleFeatureValue *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && vabdd_f64(self->_value, v4->_value) < *(double *)&REFloatingPointTaggedPointerPrecision;
  }

  return v5;
}

- (unint64_t)_integralFeatureValue
{
  return *(_QWORD *)&self->_value;
}

@end
