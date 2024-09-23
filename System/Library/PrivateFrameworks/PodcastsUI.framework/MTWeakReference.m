@implementation MTWeakReference

- (MTWeakReference)initWithObject:(id)a3
{
  id v4;
  MTWeakReference *v5;
  MTWeakReference *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTWeakReference;
  v5 = -[MTWeakReference init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MTWeakReference setObject:](v5, "setObject:", v4);

  return v6;
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
