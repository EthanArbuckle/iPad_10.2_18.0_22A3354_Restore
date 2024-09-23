@implementation JSALocalStorage

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E034;
  block[3] = &unk_9E1B8;
  block[4] = a1;
  if (qword_B9F70 != -1)
    dispatch_once(&qword_B9F70, block);
  return (id)qword_B9F78;
}

- (JSALocalStorage)init
{
  JSALocalStorage *v2;
  id v3;
  void *v4;
  void *v5;
  NSUserDefaults *v6;
  NSUserDefaults *scriptingUserDefaults;
  id v8;
  NSObject *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *values;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)JSALocalStorage;
  v2 = -[JSALocalStorage init](&v21, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)NSUserDefaults);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerURL"));
    v6 = (NSUserDefaults *)objc_msgSend(v3, "_initWithSuiteName:container:", CFSTR("com.apple.iBooks.JSALocalStorage"), v5);
    scriptingUserDefaults = v2->_scriptingUserDefaults;
    v2->_scriptingUserDefaults = v6;

    if (v2->_scriptingUserDefaults)
    {
      sub_E1EC((uint64_t)v2);
    }
    else
    {
      v8 = JSALog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        sub_71C58(v9);

    }
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    values = v2->_values;
    v2->_values = v10;

    v13 = objc_opt_class(NSDictionary, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v2->_scriptingUserDefaults, "objectForKey:", CFSTR("ScriptingLocalStorage")));
    v15 = BUDynamicCast(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)v16;
    v18 = &__NSDictionary0__struct;
    if (v16)
      v18 = (void *)v16;
    v19 = v18;

    sub_E378((uint64_t)v2, v19);
    -[NSUserDefaults addObserver:forKeyPath:options:context:](v2->_scriptingUserDefaults, "addObserver:forKeyPath:options:context:", v2, CFSTR("ScriptingLocalStorage"), 1, off_B7710);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSUserDefaults removeObserver:forKeyPath:context:](self->_scriptingUserDefaults, "removeObserver:forKeyPath:context:", self, CFSTR("ScriptingLocalStorage"), off_B7710);
  v3.receiver = self;
  v3.super_class = (Class)JSALocalStorage;
  -[JSALocalStorage dealloc](&v3, "dealloc");
}

- (unint64_t)length
{
  os_unfair_lock_s *p_accessLock;
  id v4;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v4 = -[NSMutableDictionary count](self->_values, "count");
  os_unfair_lock_unlock(p_accessLock);
  return (unint64_t)v4;
}

- (id)getItem:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_accessLock = &self->_accessLock;
    v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v5));

    os_unfair_lock_unlock(p_accessLock);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setItem:(id)a3 value:(id)a4
{
  os_unfair_lock_s *p_accessLock;
  id v7;
  id v8;

  if (a3)
  {
    if (a4)
    {
      p_accessLock = &self->_accessLock;
      v7 = a4;
      v8 = a3;
      os_unfair_lock_lock(p_accessLock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v7, v8);

      os_unfair_lock_unlock(p_accessLock);
      sub_E560((uint64_t)self);
    }
  }
}

- (void)removeItem:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  if (a3)
  {
    p_accessLock = &self->_accessLock;
    v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    -[NSMutableDictionary removeObjectForKey:](self->_values, "removeObjectForKey:", v5);

    os_unfair_lock_unlock(p_accessLock);
    sub_E560((uint64_t)self);
  }
}

- (void)clear
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[NSMutableDictionary removeAllObjects](self->_values, "removeAllObjects");
  os_unfair_lock_unlock(p_accessLock);
  sub_E560((uint64_t)self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void (**v14)(_QWORD);
  objc_super v15;
  _QWORD block[4];
  void (**v17)(_QWORD);
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_B7710 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_E81C;
    v18[3] = &unk_9E350;
    v19 = v12;
    objc_copyWeak(&v20, &location);
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_E8C4;
        block[3] = &unk_9DCD0;
        v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)JSALocalStorage;
    -[JSALocalStorage observeValueForKeyPath:ofObject:change:context:](&v15, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (NSUserDefaults)scriptingUserDefaults
{
  return self->_scriptingUserDefaults;
}

- (void)setScriptingUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_scriptingUserDefaults, a3);
}

- (NSMutableDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_scriptingUserDefaults, 0);
}

@end
