@implementation TMLBinding

- (TMLBinding)initWithTarget:(id)a3 keyPath:(id)a4 valueType:(unint64_t)a5
{
  id v9;
  id v10;
  TMLBinding *v11;
  TMLBinding *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  NSString *keyPath;
  id v17;
  const char *v18;
  double v19;
  uint64_t v20;
  NSMutableArray *binders;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TMLBinding;
  v11 = -[TMLBinding init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_target, a3);
    v15 = objc_msgSend_copy(v10, v13, v14);
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v15;

    v17 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v20 = objc_msgSend_initWithCapacity_(v17, v18, v19, 4);
    binders = v12->_binders;
    v12->_binders = (NSMutableArray *)v20;

    if (a5)
    {
      v12->_valueType = a5;
    }
    else
    {
      objc_msgSend_propertyWithKeyPath_forObject_(TMLRuntime, v22, v23, v10, v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_valueType = objc_msgSend_type(v24, v25, v26);

    }
  }

  return v12;
}

- (void)dealloc
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  id target;
  NSString *keyPath;
  objc_super v9;

  if (self->_bindCount)
    objc_msgSend_unobserveTarget(self, a2, v2);
  objc_getAssociatedObject(self->_target, "bccppmsc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v4, v5, v6, self->_keyPath);
  target = self->_target;
  self->_target = 0;

  keyPath = self->_keyPath;
  self->_keyPath = 0;

  v9.receiver = self;
  v9.super_class = (Class)TMLBinding;
  -[TMLBinding dealloc](&v9, sel_dealloc);
}

- (void)bind:(id)a3
{
  char *v4;
  double v5;
  char v6;
  double v7;
  int *p_bindCount;
  unsigned int v9;
  TMLWeakReferenceObject *v10;
  const char *v11;
  double v12;
  void *v13;
  NSMutableArray *binders;
  const char *v15;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  const char *v23;

  v4 = (char *)a3;
  if (v4)
  {
    v23 = v4;
    v6 = objc_msgSend_containsObject_(self->_binders, v4, v5, v4);
    v4 = (char *)v23;
    if ((v6 & 1) == 0)
    {
      p_bindCount = &self->_bindCount;
      do
        v9 = __ldaxr((unsigned int *)p_bindCount);
      while (__stlxr(v9 + 1, (unsigned int *)p_bindCount));
      if (!v9)
        objc_msgSend_observeTarget(self, v23, v7);
      v10 = [TMLWeakReferenceObject alloc];
      v13 = (void *)objc_msgSend_initWithObject_(v10, v11, v12, v23);
      binders = self->_binders;
      v17 = objc_msgSend_count(binders, v15, v16);
      v20 = objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(binders, v18, v19, v13, 0, v17, 1536, &unk_24F501138);
      objc_msgSend_insertObject_atIndex_(self->_binders, v21, v22, v13, v20);

      v4 = (char *)v23;
    }
  }

}

- (void)unbind:(id)a3
{
  char *v4;
  double v5;
  int v6;
  double v7;
  double v8;
  int *p_bindCount;
  unsigned int v10;
  unsigned int v11;
  const char *v12;

  v4 = (char *)a3;
  if (v4)
  {
    v12 = v4;
    v6 = objc_msgSend_containsObject_(self->_binders, v4, v5, v4);
    v4 = (char *)v12;
    if (v6)
    {
      objc_msgSend_removeObject_(self->_binders, v12, v7, v12);
      p_bindCount = &self->_bindCount;
      do
      {
        v10 = __ldaxr((unsigned int *)p_bindCount);
        v11 = v10 - 1;
      }
      while (__stlxr(v11, (unsigned int *)p_bindCount));
      v4 = (char *)v12;
      if (!v11)
      {
        objc_msgSend_unobserveTarget(self, v12, v8);
        v4 = (char *)v12;
      }
    }
  }

}

- (void)observeTarget
{
  double v2;
  double v4;
  id target;
  NSString *keyPath;
  const char *v7;
  double v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (objc_msgSend_conformsToProtocol_(self->_target, a2, v2, &unk_255B56438))
  {
    self->_didAttachToTargetViaTMLObservable = 1;
    objc_initWeak(&location, self);
    target = self->_target;
    keyPath = self->_keyPath;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_22AD4C348;
    v9[3] = &unk_24F501160;
    objc_copyWeak(&v10, &location);
    objc_msgSend_tmlAddObserver_forKeyPath_callback_(target, v7, v8, self, keyPath, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    self->_didAttachToTargetViaTMLObservable = 0;
    MEMORY[0x24BEDD108](self->_target, sel_addObserver_forKeyPath_options_context_, v4);
  }
}

- (void)unobserveTarget
{
  double v2;
  _BOOL4 didAttachToTargetViaTMLObservable;
  id target;

  didAttachToTargetViaTMLObservable = self->_didAttachToTargetViaTMLObservable;
  target = self->_target;
  if (didAttachToTargetViaTMLObservable)
  {
    objc_msgSend_tmlRemoveObserver_forKeyPath_(target, a2, v2, self, self->_keyPath);
    self->_didAttachToTargetViaTMLObservable = 0;
  }
  else
  {
    ((void (*)(id, char *))MEMORY[0x24BEDD108])(target, sel_removeObserver_forKeyPath_context_);
  }
}

+ (id)bindingForTarget:(id)a3 withKeyPath:(id)a4
{
  return (id)((uint64_t (*)(id, char *))MEMORY[0x24BEDD108])(a1, sel_bindingForTarget_withKeyPath_valueType_);
}

+ (id)bindingForTarget:(id)a3 withKeyPath:(id)a4 valueType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  TMLBinding *v16;
  const char *v17;
  double v18;
  id v19;
  const char *v20;
  double v21;
  TMLWeakReferenceObject *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_getAssociatedObject(v7, "bccppmsc");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v9, v10, v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_object(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = [TMLBinding alloc];
      v15 = (void *)objc_msgSend_initWithTarget_keyPath_valueType_(v16, v17, v18, v7, v8, a5);
      if (!v9)
      {
        v19 = objc_alloc(MEMORY[0x24BDBCED8]);
        v9 = (void *)objc_msgSend_initWithCapacity_(v19, v20, v21, 4);
        objc_setAssociatedObject(v7, "bccppmsc", v9, (void *)1);
      }
      v22 = [TMLWeakReferenceObject alloc];
      v25 = (void *)objc_msgSend_initWithObject_(v22, v23, v24, v15);
      objc_msgSend_setObject_forKeyedSubscript_(v9, v26, v27, v25, v8);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)tmlObserveValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  id v15;
  double v16;
  id value;
  int *p_flags;
  unsigned __int8 v19;
  NSMutableArray *binders;
  const char *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  id target;
  NSString *keyPath;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  _QWORD v42[5];
  _QWORD v43[2];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend_objectForKeyedSubscript_(v11, v12, v13, *MEMORY[0x24BDD0E70]);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  value = self->_value;
  if (value != v15 && (objc_msgSend_isEqual_(value, v14, v16, v15) & 1) == 0)
  {
    p_flags = &self->_flags;
    do
      v19 = __ldaxr((unsigned __int8 *)p_flags);
    while (__stlxr(v19 | 0x40, (unsigned __int8 *)p_flags));
    if ((v19 & 0x40) != 0)
    {
      v23 = (void *)MEMORY[0x24BDBCE88];
      v24 = (void *)MEMORY[0x24BDD17C8];
      v25 = (void *)objc_opt_class();
      objc_msgSend_description(v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v24, v29, v30, CFSTR("Inconsistent binding cycle detected for %@:%@"), v28, self->_keyPath);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      target = self->_target;
      v43[0] = CFSTR("target");
      v43[1] = CFSTR("keyPath");
      keyPath = self->_keyPath;
      v44[0] = target;
      v44[1] = keyPath;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v34, v35, v44, v43, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v23, v37, v38, CFSTR("TMLRuntimeException"), v31, v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_raiseException_(TMLExceptionHandler, v40, v41, v39);

    }
    else
    {
      objc_storeStrong(&self->_value, v15);
      binders = self->_binders;
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = sub_22AD4C828;
      v42[3] = &unk_24F4FD120;
      v42[4] = self;
      objc_msgSend_enumerateObjectsUsingBlock_(binders, v21, COERCE_DOUBLE(3221225472), v42);
      do
        v22 = __ldxr((unsigned __int8 *)p_flags);
      while (__stxr(v22 & 0xBF, (unsigned __int8 *)p_flags));
    }
  }

}

- (id)value
{
  double v2;
  id value;
  id v5;
  id v6;
  id v7;

  value = self->_value;
  objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (value == v5)
    v6 = 0;
  else
    v6 = self->_value;
  v7 = v6;

  return v7;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (id)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_binders, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
