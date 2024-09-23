@implementation TMLRuntimeObject

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  const char *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v4 = a3;
  objc_getAssociatedObject(self, &unk_22AD83A60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v11)
      v12 = 0;
    else
      v12 = v9;
    v13 = v12;

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)TMLRuntimeObject;
    -[TMLRuntimeObject valueForKey:](&v15, sel_valueForKey_, v4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  void *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  char isEqual;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  objc_super v26;

  v6 = a4;
  objc_msgSend_unwrap_(TMLJSNil, v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(self, &unk_22AD83A60);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, v12, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (!v9)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_objectForKeyedSubscript_(v10, v13, v15, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v9, v17, v18, v16);

    if ((isEqual & 1) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v20, v21, v6);
      objc_msgSend_setObject_forKeyedSubscript_(v10, v22, v23, v9, v6);
      objc_msgSend_didChangeValueForKey_(self, v24, v25, v6);
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)TMLRuntimeObject;
    -[TMLRuntimeObject setValue:forKey:](&v26, sel_setValue_forKey_, v9, v6);
  }

}

- (void)registerTMLProperty:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  id v13;

  v4 = a3;
  objc_getAssociatedObject(self, &unk_22AD83A60);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCED8]);
    v13 = (id)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    objc_setAssociatedObject(self, &unk_22AD83A60, v13, (void *)1);
  }
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v13, v11, v12, v10, v4);

}

- (BOOL)tmlHasPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  id v11;

  v4 = a3;
  objc_getAssociatedObject(self, &unk_22AD83A60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    v11 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v9, v10, v4, self, 0);

  return 1;
}

@end
