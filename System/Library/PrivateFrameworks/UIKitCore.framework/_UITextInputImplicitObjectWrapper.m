@implementation _UITextInputImplicitObjectWrapper

+ (id)wrapperForObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setWeakObject:", v4);

  return v5;
}

- (void)setWeakObject:(id)a3
{
  objc_storeWeak(&self->_weakObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakObject);
}

- (id)weakObject
{
  return objc_loadWeakRetained(&self->_weakObject);
}

@end
