@implementation _TUIMappedDynamicArray

- (id)_rootDataProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayInstance array](self->_instance, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_rootDataProvider"));

  return v3;
}

- (_TUIMappedDynamicArray)initWithArray:(id)a3 mapper:(id)a4
{
  id v6;
  id v7;
  _TUIMappedDynamicArray *v8;
  _TUIMappedDynamicArray *v9;
  uint64_t v10;
  _TUIDynamicArrayInstance *instance;
  _TUIDynamicArrayInstance *v12;
  id v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_TUIMappedDynamicArray;
  v8 = -[TUIDynamicArray init](&v16, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapper, a4);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceForObserver:", v9));
    instance = v9->_instance;
    v9->_instance = (_TUIDynamicArrayInstance *)v10;

    v12 = v9->_instance;
    v13 = -[_TUIDynamicArrayInstance count](v12, "count");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayInstance generation](v9->_instance, "generation"));
    -[TUIDynamicArray _updateProvider:count:generation:](v9, "_updateProvider:count:generation:", v12, v13, v14);

  }
  return v9;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[_TUIDynamicArrayInstance _dequeueUpdateGroup](self->_instance, "_dequeueUpdateGroup", a3, a4));
  -[TUIDynamicArray _enqueueUpdate:](self, "_enqueueUpdate:", v5);

}

- (id)newInstanceWithGeneration:(id)a3 count:(unint64_t)a4 observer:(id)a5
{
  id v8;
  id v9;
  _TUIMappedDynamicArrayInstance *v10;

  v8 = a5;
  v9 = a3;
  v10 = -[_TUIDynamicArrayInstance initWithArray:generation:count:observer:]([_TUIMappedDynamicArrayInstance alloc], "initWithArray:generation:count:observer:", self, v9, a4, v8);

  -[_TUIMappedDynamicArrayInstance setDataMapper:](v10, "setDataMapper:", self->_mapper);
  return v10;
}

- (_TUIDynamicArrayInstance)instance
{
  return self->_instance;
}

- (TUIDynamicArrayDataMapping)mapper
{
  return self->_mapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapper, 0);
  objc_storeStrong((id *)&self->_instance, 0);
}

@end
