@implementation TMLJSONObjectDerived

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  double v3;

  return objc_msgSend_isEqualToString_(a3, a2, v3, CFSTR("SCHEMA")) ^ 1;
}

- (TMLJSONObjectDerived)initWithParent:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;
  TMLJSONObjectDerived *v8;
  TMLJSONObjectDerived *v9;
  const char *v10;
  double v11;
  uint64_t v12;
  NSString *keyPath;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TMLJSONObjectDerived;
  v8 = -[TMLJSONObject initWithSchema:json:](&v15, sel_initWithSchema_json_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parent, v6);
    objc_msgSend_stringByAppendingString_(v7, v10, v11, CFSTR("."));
    v12 = objc_claimAutoreleasedReturnValue();
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v12;

  }
  return v9;
}

- (id)rawJSON
{
  TMLJSONObject **p_parent;
  id WeakRetained;
  NSString *keyPath;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;

  p_parent = &self->_parent;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  keyPath = self->_keyPath;
  v8 = objc_msgSend_length(keyPath, v6, v7);
  objc_msgSend_substringToIndex_(keyPath, v9, v10, v8 - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend_rawJSON(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_rawValueForKeyPath_dictionary_(WeakRetained, v16, v17, v11, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

- (id)valueForKey:(id)a3
{
  TMLJSONObject **p_parent;
  id v5;
  id WeakRetained;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  p_parent = &self->_parent;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend_stringByAppendingString_(self->_keyPath, v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_valueForKeyPath_(WeakRetained, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)valueForKeyPath:(id)a3
{
  TMLJSONObject **p_parent;
  id v5;
  id WeakRetained;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;

  p_parent = &self->_parent;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend_stringByAppendingString_(self->_keyPath, v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_valueForKeyPath_(WeakRetained, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)tmlAddObserver:(id)a3 forKeyPath:(id)a4 callback:(id)a5
{
  TMLJSONObject **p_parent;
  id v9;
  id v10;
  id v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  id WeakRetained;

  p_parent = &self->_parent;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend_stringByAppendingString_(self->_keyPath, v12, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_tmlAddObserver_forKeyPath_callback_(WeakRetained, v15, v16, v11, v14, v9);
}

- (void)tmlRemoveObserver:(id)a3 forKeyPath:(id)a4
{
  TMLJSONObject **p_parent;
  id v7;
  id v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  id WeakRetained;

  p_parent = &self->_parent;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_parent);
  objc_msgSend_stringByAppendingString_(self->_keyPath, v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_tmlRemoveObserver_forKeyPath_(WeakRetained, v12, v13, v8, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
