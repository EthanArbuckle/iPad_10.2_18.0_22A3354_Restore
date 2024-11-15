@implementation _SBWindowReference

- (unint64_t)pointer
{
  return (unint64_t)self->_object;
}

- (id)object
{
  return self->_object;
}

+ (id)referenceForObject:(id)a3
{
  id v3;
  _SBWindowReference *v4;

  v3 = a3;
  v4 = -[_SBWindowReference initWithObject:]([_SBWindowReference alloc], "initWithObject:", v3);

  return v4;
}

- (_SBWindowReference)initWithObject:(id)a3
{
  _SBWindowReference *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBWindowReference;
  result = -[_SBWindowReference init](&v5, sel_init);
  if (result)
    result->_object = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _SBWindowReference *v4;
  BOOL v5;

  v4 = (_SBWindowReference *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_object == v4->_object;
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(self->_object, "description");
}

@end
