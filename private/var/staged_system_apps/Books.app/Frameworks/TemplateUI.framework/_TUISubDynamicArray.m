@implementation _TUISubDynamicArray

- (id)_rootDataProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayInstance array](self->_instance, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_rootDataProvider"));

  return v3;
}

- (_TUISubDynamicArray)initWithArray:(id)a3 start:(int64_t)a4 end:(int64_t)a5
{
  id v8;
  _TUISubDynamicArray *v9;
  uint64_t v10;
  _TUIDynamicArrayInstance *instance;
  uint64_t v12;
  _TUIDynamicArrayInstance *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_TUISubDynamicArray;
  v9 = -[TUIDynamicArray init](&v16, "init");
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instanceForObserver:", v9));
    instance = v9->_instance;
    v9->_instance = (_TUIDynamicArrayInstance *)v10;

    v9->_start = a4;
    v9->_end = a5;
    v12 = TUIIndexMapperComputeCount(-[_TUIDynamicArrayInstance count](v9->_instance, "count"), v9->_start, v9->_end);
    v13 = v9->_instance;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayInstance generation](v13, "generation"));
    -[TUIDynamicArray _updateProvider:count:generation:](v9, "_updateProvider:count:generation:", v13, v12, v14);

  }
  return v9;
}

- (unint64_t)_countForGeneration:(id)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TUISubDynamicArray;
  v4 = -[TUIDynamicArray _countForGeneration:](&v6, "_countForGeneration:", a3);
  return TUIIndexMapperComputeCount((unint64_t)v4, self->_start, self->_end);
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayInstance _dequeueUpdateGroup](self->_instance, "_dequeueUpdateGroup", a3, a4));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trimWithStart:end:", self->_start, self->_end));

  v6 = v7;
  if (v7)
  {
    -[TUIDynamicArray _enqueueUpdate:](self, "_enqueueUpdate:", v7);
    v6 = v7;
  }

}

- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5
{
  id v8;
  id v9;
  _TUISubDynamicArrayInstance *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[_TUIDynamicArrayInstance initWithArray:generation:count:observer:]([_TUISubDynamicArrayInstance alloc], "initWithArray:generation:count:observer:", self, v9, a4, v8);

  -[_TUISubDynamicArrayInstance setStart:](v10, "setStart:", self->_start);
  -[_TUISubDynamicArrayInstance setEnd:](v10, "setEnd:", self->_end);
  return v10;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (int64_t)start
{
  return self->_start;
}

- (int64_t)end
{
  return self->_end;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
