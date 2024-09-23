@implementation RCWeakReferenceWrapper

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakReference);
}

+ (id)withReference:(id)a3
{
  id v3;
  RCWeakReferenceWrapper *v4;

  v3 = a3;
  v4 = objc_alloc_init(RCWeakReferenceWrapper);
  -[RCWeakReferenceWrapper setWeakReference:](v4, "setWeakReference:", v3);

  return v4;
}

- (void)setWeakReference:(id)a3
{
  objc_storeWeak(&self->_weakReference, a3);
}

- (id)weakReference
{
  return objc_loadWeakRetained(&self->_weakReference);
}

@end
