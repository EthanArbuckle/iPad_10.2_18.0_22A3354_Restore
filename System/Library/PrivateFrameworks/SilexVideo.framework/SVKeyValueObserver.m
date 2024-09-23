@implementation SVKeyValueObserver

- (SVKeyValueObserver)initWithKeyPath:(id)a3 ofObject:(id)a4 withOptions:(unint64_t)a5 change:(id)a6
{
  id v10;
  id v11;
  id v12;
  SVKeyValueObserver *v13;
  uint64_t v14;
  NSString *keyPath;
  uint64_t v16;
  id change;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SVKeyValueObserver;
  v13 = -[SVKeyValueObserver init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    keyPath = v13->_keyPath;
    v13->_keyPath = (NSString *)v14;

    objc_storeWeak((id *)&v13->_object, v11);
    v13->_options = a5;
    v16 = objc_msgSend(v12, "copy");
    change = v13->_change;
    v13->_change = (id)v16;

    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v13, v10, a5, SVKeyValueObserverContext);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SVKeyValueObserver object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVKeyValueObserver keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)SVKeyValueObserver;
  -[SVKeyValueObserver dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;

  v8 = a5;
  if ((void *)SVKeyValueObserverContext == a6)
  {
    v11 = v8;
    -[SVKeyValueObserver change](self, "change");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v11;
    if (v9)
    {
      -[SVKeyValueObserver change](self, "change");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, SVKeyValueObserver *, id))v10)[2](v10, self, v11);

      v8 = v11;
    }
  }

}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSObject)object
{
  return objc_loadWeakRetained((id *)&self->_object);
}

- (unint64_t)options
{
  return self->_options;
}

- (id)change
{
  return self->_change;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_change, 0);
  objc_destroyWeak((id *)&self->_object);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
