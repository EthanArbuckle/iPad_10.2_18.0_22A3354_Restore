@implementation _TVProxyWeakContainer

+ (id)weakContainerWithObject:(id)a3
{
  id v3;
  _TVProxyWeakContainer *v4;

  v3 = a3;
  v4 = objc_alloc_init(_TVProxyWeakContainer);
  -[_TVProxyWeakContainer setObject:](v4, "setObject:", v3);

  return v4;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
