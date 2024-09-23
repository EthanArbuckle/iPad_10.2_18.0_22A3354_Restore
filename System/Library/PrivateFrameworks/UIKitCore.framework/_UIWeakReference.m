@implementation _UIWeakReference

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

+ (id)weakReferenceWrappingObject:(id)a3
{
  id v3;
  _UIWeakReference *v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[_UIWeakReference initWithObject:]([_UIWeakReference alloc], "initWithObject:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (_UIWeakReference)initWithObject:(id)a3
{
  id v4;
  _UIWeakReference *v5;
  _UIWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWeakReference;
  v5 = -[_UIWeakReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_object, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIWeakReference *v4;
  id WeakRetained;
  _UIWeakReference *v6;

  v4 = [_UIWeakReference alloc];
  WeakRetained = objc_loadWeakRetained(&self->_object);
  v6 = -[_UIWeakReference initWithObject:](v4, "initWithObject:", WeakRetained);

  return v6;
}

- (void)setObject:(id)a3
{
  objc_storeWeak(&self->_object, a3);
}

@end
