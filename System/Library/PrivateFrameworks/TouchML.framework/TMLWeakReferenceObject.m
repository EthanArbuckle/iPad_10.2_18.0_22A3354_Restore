@implementation TMLWeakReferenceObject

- (TMLWeakReferenceObject)initWithObject:(id)a3
{
  id v4;
  TMLWeakReferenceObject *v5;
  TMLWeakReferenceObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TMLWeakReferenceObject;
  v5 = -[TMLWeakReferenceObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_object, v4);

  return v6;
}

+ (id)weakReferenceWithObject:(id)a3
{
  id v3;
  TMLWeakReferenceObject *v4;
  const char *v5;
  double v6;
  void *v7;

  v3 = a3;
  v4 = [TMLWeakReferenceObject alloc];
  v7 = (void *)objc_msgSend_initWithObject_(v4, v5, v6, v3);

  return v7;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained(&self->_object);
}

- (unint64_t)hash
{
  id WeakRetained;
  const char *v3;
  double v4;
  unint64_t v5;

  WeakRetained = objc_loadWeakRetained(&self->_object);
  v5 = objc_msgSend_hash(WeakRetained, v3, v4);

  return v5;
}

- (id)description
{
  id WeakRetained;
  const char *v3;
  double v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained(&self->_object);
  objc_msgSend_description(WeakRetained, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id WeakRetained;
  const char *v6;
  double v7;
  char isEqual;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_object);
  if ((objc_msgSend_isEqual_(WeakRetained, v6, v7, v4) & 1) != 0)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_object(v4, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(WeakRetained, v12, v13, v11);

    }
    else
    {
      isEqual = 0;
    }
  }

  return isEqual;
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
