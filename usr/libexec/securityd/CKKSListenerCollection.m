@implementation CKKSListenerCollection

- (CKKSListenerCollection)initWithName:(id)a3
{
  id v5;
  CKKSListenerCollection *v6;
  CKKSListenerCollection *v7;
  uint64_t v8;
  NSMapTable *listeners;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKKSListenerCollection;
  v6 = -[CKKSListenerCollection init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    listeners = v7->_listeners;
    v7->_listeners = (NSMapTable *)v8;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CKKSListenerCollection(%@): %@>"), v4, v7));

  objc_sync_exit(v3);
  return v8;
}

- (void)registerListener:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));

  v7 = 0;
  for (i = 0; ; i = (void *)v9)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));

    if (!v9)
      break;
    v7 |= v9 == (_QWORD)v18;
  }
  if (!((v18 == 0) | v7 & 1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection name](self, "name"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v10, v18));

    v12 = objc_retainAutorelease(v11);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create(v13, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
    objc_msgSend(v17, "setObject:forKey:", v18, v16);

  }
  objc_sync_exit(v4);

}

- (void)iterateListeners:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *i;
  NSObject *v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyEnumerator"));

  for (i = 0; ; i = v8)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject", obj));

    if (!v8)
      break;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSListenerCollection listeners](self, "listeners"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    if (v10)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10011DBF0;
      block[3] = &unk_1002EA830;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      dispatch_async(v8, block);

      objc_destroyWeak(&v14);
    }
    objc_destroyWeak(&location);

  }
  objc_sync_exit(obj);

}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMapTable)listeners
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListeners:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
