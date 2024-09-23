@implementation _TUIDynamicArrayEmpty

- (_TUIDynamicArrayEmpty)initWithArray:(id)a3
{
  id v5;
  _TUIDynamicArrayEmpty *v6;
  _TUIDynamicArrayEmpty *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIDynamicArrayEmpty;
  v6 = -[TUIDynamicValue initWithValue:](&v9, "initWithValue:", 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_array, a3);

  return v7;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4;
  _TUIDynamicArrayEmptyInstance *v5;

  v4 = a3;
  v5 = -[_TUIDynamicArrayEmptyInstance initWithDynamicValue:observer:]([_TUIDynamicArrayEmptyInstance alloc], "initWithDynamicValue:observer:", self, v4);

  return v5;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (TUIDynamicArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
