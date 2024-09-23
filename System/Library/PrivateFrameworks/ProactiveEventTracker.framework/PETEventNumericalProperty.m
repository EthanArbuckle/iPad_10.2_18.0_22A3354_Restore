@implementation PETEventNumericalProperty

- (BOOL)isValidValue:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t v6;
  NSUInteger location;
  NSUInteger v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_clampValues)
    {
      v5 = 1;
    }
    else
    {
      v6 = objc_msgSend(v4, "unsignedIntegerValue");
      location = self->_validRange.location;
      v9 = v6 >= location;
      v8 = v6 - location;
      v9 = !v9 || v8 >= self->_validRange.length;
      v5 = !v9;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_loggingKeyStringRepresentationForValue:(id)a3
{
  id v4;
  unint64_t v5;
  char *v6;
  BOOL v7;
  void *v8;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PETEventNumericalProperty isValidValue:](self, "isValidValue:", v4))
  {
    v10 = 0;
    v5 = -[PETEventNumericalProperty _unsignedIntegerValueForNumericValue:](self, "_unsignedIntegerValueForNumericValue:", v4);
    v6 = &v10;
    do
    {
      *--v6 = (v5 % 0xA) | 0x30;
      v7 = v5 > 9;
      v5 /= 0xAuLL;
    }
    while (v7);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6, &v10 - v6, 1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_unsignedIntegerValueForNumericValue:(id)a3
{
  _NSRange *p_validRange;
  NSUInteger location;
  unint64_t v5;
  unint64_t v6;

  if (!self->_clampValues)
    return objc_msgSend(a3, "unsignedIntegerValue");
  p_validRange = &self->_validRange;
  location = self->_validRange.location;
  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  v6 = p_validRange->location + p_validRange->length - 1;
  if (v5 < v6)
    v6 = v5;
  if (location <= v6)
    return v6;
  else
    return location;
}

- (PETEventNumericalProperty)initWithName:(id)a3 range:(_NSRange)a4 clampValues:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  PETEventNumericalProperty *result;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)PETEventNumericalProperty;
  result = -[PETEventProperty initWithName:](&v9, sel_initWithName_, a3);
  if (result)
  {
    result->_validRange.location = location;
    result->_validRange.length = length;
    result->_clampValues = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PETEventProperty name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_validRange);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Numerical: Name=%@ Range=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_NSRange)validRange
{
  _NSRange *p_validRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_validRange = &self->_validRange;
  location = self->_validRange.location;
  length = p_validRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)cardinality
{
  return self->_validRange.length;
}

- (id)longestValueString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_validRange.location + self->_validRange.length - 1);
}

@end
