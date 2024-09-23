@implementation WeakLoader

- (WeakLoader)initWithLoader:(id)a3
{
  id v4;
  WeakLoader *v5;
  WeakLoader *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WeakLoader;
  v5 = -[WeakLoader init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_weakLoader, v4);

  return v6;
}

- (SFResourceLoader)strongloader
{
  return (SFResourceLoader *)objc_loadWeakRetained((id *)&self->_weakLoader);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakLoader);
}

@end
