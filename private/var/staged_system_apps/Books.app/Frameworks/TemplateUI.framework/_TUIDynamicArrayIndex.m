@implementation _TUIDynamicArrayIndex

- (_TUIDynamicArrayIndex)initWithArray:(id)a3 index:(int64_t)a4
{
  id v6;
  _TUIDynamicArrayIndex *v7;
  _TUIDynamicArrayIndex *v8;
  uint64_t v9;
  TUIDynamicArray *subarray;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TUIDynamicArrayIndex;
  v7 = -[TUIDynamicValue initWithValue:](&v12, "initWithValue:", 0);
  v8 = v7;
  if (v7)
  {
    v7->_index = a4;
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tui_subarrayWithStart:end:", a4, a4));
    subarray = v8->_subarray;
    v8->_subarray = (TUIDynamicArray *)v9;

  }
  return v8;
}

- (id)newInstanceWithObserver:(id)a3
{
  id v4;
  _TUIDynamicArrayIndexInstance *v5;

  v4 = a3;
  v5 = -[_TUIDynamicArrayIndexInstance initWithDynamicValue:observer:]([_TUIDynamicArrayIndexInstance alloc], "initWithDynamicValue:observer:", self, v4);

  return v5;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (TUIDynamicArray)subarray
{
  return self->_subarray;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subarray, 0);
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
