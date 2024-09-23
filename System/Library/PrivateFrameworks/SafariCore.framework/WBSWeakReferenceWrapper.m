@implementation WBSWeakReferenceWrapper

+ (id)wrapperWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:", v4);

  return v5;
}

- (WBSWeakReferenceWrapper)initWithObject:(id)a3
{
  id v4;
  WBSWeakReferenceWrapper *v5;
  WBSWeakReferenceWrapper *v6;
  WBSWeakReferenceWrapper *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSWeakReferenceWrapper;
  v5 = -[WBSWeakReferenceWrapper init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_object, v4);
    v7 = v6;
  }

  return v6;
}

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

@end
