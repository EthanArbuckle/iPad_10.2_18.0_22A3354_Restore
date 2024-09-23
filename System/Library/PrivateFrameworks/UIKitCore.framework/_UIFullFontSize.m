@implementation _UIFullFontSize

+ (id)defaultValue
{
  _UIFullFontSize *v2;

  v2 = [_UIFullFontSize alloc];
  objc_msgSend(off_1E167A828, "defaultFontSize");
  return -[_UIFullFontSize initWithValue:isDefault:](v2, "initWithValue:isDefault:", 1);
}

+ (id)valued:(double)a3
{
  return -[_UIFullFontSize initWithValue:isDefault:]([_UIFullFontSize alloc], "initWithValue:isDefault:", 0, a3);
}

- (_UIFullFontSize)initWithValue:(double)a3 isDefault:(BOOL)a4
{
  _UIFullFontSize *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIFullFontSize;
  result = -[_UIFullFontSize init](&v7, sel_init);
  if (result)
  {
    result->_value = a3;
    result->_isDefault = a4;
    result->_needsEvaluation = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_isDefault)
      v6 = *((_BYTE *)v5 + 16) != 0;
    else
      v6 = !*((_BYTE *)v5 + 16)
        && !self->_needsEvaluation
        && !*((_BYTE *)v5 + 17)
        && vabdd_f64(self->_value, *((double *)v5 + 1)) < 0.00000011920929;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)valueWithEvaluationIfNeeded:(id)a3
{
  id v4;
  void *v5;
  double value;

  v4 = a3;
  v5 = v4;
  if (self->_isDefault && self->_needsEvaluation)
  {
    self->_needsEvaluation = 0;
    self->_value = (*((double (**)(id))v4 + 2))(v4);
  }
  value = self->_value;

  return value;
}

- (BOOL)setNeedsEvaluation
{
  _BOOL4 isDefault;

  isDefault = self->_isDefault;
  if (self->_isDefault)
    self->_needsEvaluation = 1;
  return isDefault;
}

- (BOOL)needsEvaluation
{
  return self->_isDefault && self->_needsEvaluation;
}

- (id)overrideUnlessDefault:(double)value
{
  _UIFullFontSize *v5;
  _UIFullFontSize *v6;

  v5 = [_UIFullFontSize alloc];
  if (self->_isDefault)
    value = self->_value;
  v6 = -[_UIFullFontSize initWithValue:isDefault:](v5, "initWithValue:isDefault:", self->_isDefault, value);
  if (self->_isDefault)
    v6->_needsEvaluation = self->_needsEvaluation;
  return v6;
}

@end
