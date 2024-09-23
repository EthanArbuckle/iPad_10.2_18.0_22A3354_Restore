@implementation TMLJSONObserverInfo

- (TMLJSONObserverInfo)initWithObserver:(id)a3 keyPath:(id)a4 callback:(id)a5
{
  id v8;
  id v9;
  id v10;
  TMLJSONObserverInfo *v11;
  TMLJSONObserverInfo *v12;
  uint64_t v13;
  id callback;
  const char *v15;
  double v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TMLJSONObserverInfo;
  v11 = -[TMLJSONObserverInfo init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_keyPath, a4);
    v12->_targetUnsafe = v8;
    objc_storeWeak(&v12->_target, v8);
    v13 = MEMORY[0x22E2E7E44](v10);
    callback = v12->_callback;
    v12->_callback = (id)v13;

    v12->_hash = objc_msgSend_hash(v8, v15, v16);
  }

  return v12;
}

- (void)notify:(id)a3
{
  void (**callback)(id, id, NSString *, id);
  id *p_target;
  id v6;
  id WeakRetained;

  callback = (void (**)(id, id, NSString *, id))self->_callback;
  p_target = &self->_target;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(p_target);
  callback[2](callback, WeakRetained, self->_keyPath, v6);

}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  double v13;
  BOOL v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend_targetUnsafe(v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetUnsafe(self, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v12)
    {
      objc_msgSend_keyPath(v5, v11, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_keyPath(self, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15 == v18;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)targetUnsafe
{
  return self->_targetUnsafe;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
