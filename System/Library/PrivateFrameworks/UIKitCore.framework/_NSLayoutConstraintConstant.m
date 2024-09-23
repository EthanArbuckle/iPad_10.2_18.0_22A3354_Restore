@implementation _NSLayoutConstraintConstant

+ (_NSLayoutConstraintConstant)constantWithSymbolicValue:(id)a3 numericValue:(double)a4
{
  return (_NSLayoutConstraintConstant *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSymbolicValue:numericValue:", a3, a4);
}

- (_NSLayoutConstraintConstant)initWithSymbolicValue:(id)a3 numericValue:(double)a4
{
  _NSLayoutConstraintConstant *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_NSLayoutConstraintConstant;
  v6 = -[_NSLayoutConstraintConstant init](&v8, sel_init);
  if (v6)
  {
    v6->_symbolicValue = (NSString *)objc_msgSend(a3, "copy");
    v6->_numericValue = a4;
  }
  return v6;
}

- (_NSLayoutConstraintConstant)initWithCoder:(id)a3
{
  _NSLayoutConstraintConstant *v4;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NSLayoutConstraintConstant;
  v4 = -[_NSLayoutConstraintConstant init](&v7, sel_init);
  if (v4)
  {
    v4->_symbolicValue = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("UISymbolicConstant")), "copy");
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("UINumericConstant"));
    v4->_numericValue = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_symbolicValue, CFSTR("UISymbolicConstant"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("UINumericConstant"), self->_numericValue);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSLayoutConstraintConstant;
  -[_NSLayoutConstraintConstant dealloc](&v3, sel_dealloc);
}

- (NSString)symbolicValue
{
  return self->_symbolicValue;
}

- (double)numericValue
{
  return self->_numericValue;
}

@end
