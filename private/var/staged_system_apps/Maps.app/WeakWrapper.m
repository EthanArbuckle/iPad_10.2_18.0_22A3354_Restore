@implementation WeakWrapper

- (WeakWrapper)initWithWeakObject:(id)a3
{
  id v4;
  WeakWrapper *v5;
  WeakWrapper *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WeakWrapper;
  v5 = -[WeakWrapper init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_weakObject, v4);

  return v6;
}

- (id)weakObject
{
  return objc_loadWeakRetained(&self->_weakObject);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakObject);
}

@end
