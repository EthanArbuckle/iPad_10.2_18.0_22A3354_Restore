@implementation _REStringFeatureValue

- (unint64_t)hash
{
  return -[NSString hash](self->_value, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

- (id)stringValue
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  _REStringFeatureValue *v4;
  NSString *value;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;

  v4 = (_REStringFeatureValue *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      value = self->_value;
      v6 = v4->_value;
      v7 = value;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSString isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)featureValueWithString:(id)a3
{
  id v3;
  _REStringFeatureValue *v4;

  v3 = a3;
  v4 = -[_REStringFeatureValue initWithValue:]([_REStringFeatureValue alloc], "initWithValue:", v3);

  return v4;
}

- (_REStringFeatureValue)initWithValue:(id)a3
{
  id v4;
  _REStringFeatureValue *v5;
  uint64_t v6;
  NSString *value;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_REStringFeatureValue;
  v5 = -[_REStringFeatureValue init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    value = v5->_value;
    v5->_value = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)type
{
  return 3;
}

- (unint64_t)_integralFeatureValue
{
  return REHashString(self->_value);
}

@end
