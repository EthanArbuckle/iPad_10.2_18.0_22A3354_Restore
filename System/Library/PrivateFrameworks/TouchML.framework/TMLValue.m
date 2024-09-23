@implementation TMLValue

- (TMLValue)initWithValue:(id)a3 valueType:(unint64_t)a4
{
  id v7;
  TMLValue *v8;
  TMLValue *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TMLValue;
  v8 = -[TMLValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_valueType = a4;
  }

  return v9;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
