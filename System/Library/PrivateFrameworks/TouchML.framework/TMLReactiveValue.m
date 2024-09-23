@implementation TMLReactiveValue

- (TMLReactiveValue)initWithBindings:(id)a3 valueType:(unint64_t)a4
{
  id v7;
  TMLReactiveValue *v8;
  TMLReactiveValue *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TMLReactiveValue;
  v8 = -[TMLReactiveValue init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bindings, a3);
    v9->_valueType = a4;
  }

  return v9;
}

- (int64_t)bindingOrder
{
  return 0;
}

- (id)value
{
  return 0;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)assignToTarget:(id)a3 withKeyPath:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  double v19;
  NSArray *bindings;
  const char *v21;
  id object;
  _QWORD v23[5];

  object = a3;
  v6 = a4;
  objc_msgSend_unassign(self, v7, v8);
  if (objc_msgSend_count(self->_bindings, v9, v10))
  {
    objc_getAssociatedObject(object, "pbccppmsc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDBCED8]);
      v11 = (void *)objc_msgSend_initWithCapacity_(v12, v13, v14, 4);
      objc_setAssociatedObject(object, "pbccppmsc", v11, (void *)1);
    }
    objc_storeStrong((id *)&self->_keyPath, a4);
    v16 = objc_opt_class();
    if (qword_255B51BB8 != -1)
      dispatch_once(&qword_255B51BB8, &unk_24F5010F8);
    if ((objc_msgSend_containsObject_((void *)qword_255B51BB0, v15, v17, v16, object) & 1) != 0)
      self->_targetUnsafe = object;
    else
      objc_storeWeak(&self->_targetWeak, object);
    objc_msgSend_setObject_forKey_(v11, v18, v19, self, v6);
    bindings = self->_bindings;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_22AD4BBA0;
    v23[3] = &unk_24F4FE358;
    v23[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(bindings, v21, COERCE_DOUBLE(3221225472), v23);

  }
}

- (void)unassign
{
  id *p_targetWeak;
  id WeakRetained;
  void *v5;
  const char *v6;
  double v7;
  NSArray *bindings;
  const char *v9;
  NSString *keyPath;
  id v11;
  _QWORD v12[5];

  p_targetWeak = &self->_targetWeak;
  WeakRetained = objc_loadWeakRetained(&self->_targetWeak);
  if (WeakRetained || (WeakRetained = self->_targetUnsafe) != 0)
  {
    v11 = WeakRetained;
    if (self->_keyPath)
    {
      objc_getAssociatedObject(WeakRetained, "pbccppmsc");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeObjectForKey_(v5, v6, v7, self->_keyPath, v11);
      bindings = self->_bindings;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = sub_22AD4BCCC;
      v12[3] = &unk_24F4FE358;
      v12[4] = self;
      objc_msgSend_enumerateObjectsUsingBlock_(bindings, v9, COERCE_DOUBLE(3221225472), v12);

    }
  }
  else
  {
    v11 = 0;
  }
  objc_storeWeak(p_targetWeak, 0);
  keyPath = self->_keyPath;
  self->_targetUnsafe = 0;
  self->_keyPath = 0;

}

+ (id)valueForTarget:(id)a3 withKeyPath:(id)a4
{
  id v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;

  v5 = a4;
  objc_getAssociatedObject(a3, "pbccppmsc");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v7, v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)removeReactiveValuesForTarget:(id)a3
{
  objc_setAssociatedObject(a3, "pbccppmsc", 0, (void *)1);
}

- (void)bindingValueChanged:(id)a3
{
  id WeakRetained;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  id v10;

  WeakRetained = objc_loadWeakRetained(&self->_targetWeak);
  if (WeakRetained || (WeakRetained = self->_targetUnsafe) != 0)
  {
    v10 = WeakRetained;
    objc_msgSend_value(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend_setValue_forKeyPath_(v10, v8, v9, v7, self->_keyPath);

  }
}

- (NSArray)bindings
{
  return self->_bindings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak(&self->_targetWeak);
  objc_storeStrong((id *)&self->_bindings, 0);
}

@end
