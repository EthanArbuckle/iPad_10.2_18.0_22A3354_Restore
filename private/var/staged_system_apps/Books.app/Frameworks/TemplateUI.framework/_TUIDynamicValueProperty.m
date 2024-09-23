@implementation _TUIDynamicValueProperty

- (_TUIDynamicValueProperty)initWithValue:(id)a3 property:(id)a4
{
  id v7;
  id v8;
  _TUIDynamicValueProperty *v9;
  _TUIDynamicValueProperty *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicValueProperty;
  v9 = -[TUIDynamicValue initWithValue:](&v12, "initWithValue:", 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a4);
    objc_storeStrong((id *)&v10->_upstreamValue, a3);
  }

  return v10;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4;
  _TUIDynamicValuePropertyInstance *v5;

  v4 = a3;
  v5 = -[_TUIDynamicValuePropertyInstance initWithDynamicValue:observer:]([_TUIDynamicValuePropertyInstance alloc], "initWithDynamicValue:observer:", self, v4);

  return v5;
}

- (NSString)property
{
  return self->_property;
}

- (TUIDynamicValue)upstreamValue
{
  return self->_upstreamValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstreamValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end
