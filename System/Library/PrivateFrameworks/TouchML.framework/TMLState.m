@implementation TMLState

- (TMLState)init
{
  TMLState *v2;
  id v3;
  const char *v4;
  double v5;
  uint64_t v6;
  NSMutableDictionary *properties;
  id v8;
  const char *v9;
  double v10;
  uint64_t v11;
  NSMutableOrderedSet *propertyKeys;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TMLState;
  v2 = -[TMLState init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCED8]);
    v6 = objc_msgSend_initWithCapacity_(v3, v4, v5, 8);
    properties = v2->_properties;
    v2->_properties = (NSMutableDictionary *)v6;

    v8 = objc_alloc(MEMORY[0x24BDBCEE0]);
    v11 = objc_msgSend_initWithCapacity_(v8, v9, v10, 8);
    propertyKeys = v2->_propertyKeys;
    v2->_propertyKeys = (NSMutableOrderedSet *)v11;

  }
  return v2;
}

- (TMLState)initWithStateName:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  TMLState *v8;
  double v9;
  uint64_t v10;
  NSString *tmlStateName;

  v4 = a3;
  v8 = (TMLState *)objc_msgSend_init(self, v5, v6);
  if (v8)
  {
    v10 = objc_msgSend_copy(v4, v7, v9);
    tmlStateName = v8->_tmlStateName;
    v8->_tmlStateName = (NSString *)v10;

  }
  return v8;
}

+ (Class)registerState:(id)a3 forClass:(Class)a4
{
  void *v5;
  void *v6;
  const char *v7;
  double v8;
  id v9;
  const char *v10;
  double v11;
  const char *v12;
  objc_class *Class;

  v5 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v7, v8, CFSTR("%@_State"), v6);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend_UTF8String(v9, v10, v11);

  Class = objc_getClass(v12);
  if (!Class)
  {
    Class = objc_allocateClassPair((Class)a1, v12, 0);
    objc_registerClassPair(Class);
  }
  return Class;
}

+ (id)stateForClass:(Class)a3 stateName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  objc_class *Class;
  objc_class *Superclass;
  BOOL v16;
  id v17;
  const char *v18;
  double v19;
  void *v20;

  v5 = a4;
  if (a3)
  {
    do
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromClass(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v6, v8, v9, CFSTR("%@_State"), v7);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);

      Class = objc_getClass(v13);
      Superclass = class_getSuperclass(a3);
      a3 = Superclass;
      if (Class)
        v16 = 1;
      else
        v16 = Superclass == 0;
    }
    while (!v16);
  }
  else
  {
    Class = 0;
  }
  v17 = [Class alloc];
  v20 = (void *)objc_msgSend_initWithStateName_(v17, v18, v19, v5);

  return v20;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  NSString *v14;
  NSString *tmlStateName;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  NSString *v20;
  void *v21;
  const char *v22;
  double v23;
  id v24;
  double v25;
  const char *v26;
  const char *v27;
  double v28;
  char *v29;

  v29 = (char *)a3;
  v6 = a4;
  if (objc_msgSend_isEqualToString_(v6, v7, v8, CFSTR("tmlState")))
  {
    if (!self->_tmlStateName)
    {
      objc_msgSend_description(v29, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSString *)objc_msgSend_copy(v11, v12, v13);
      tmlStateName = self->_tmlStateName;
      self->_tmlStateName = v14;
LABEL_7:

    }
  }
  else if (objc_msgSend_isEqualToString_(v6, v9, v10, CFSTR("tmlExtends")))
  {
    if (!self->_tmlStateExtends)
    {
      objc_msgSend_description(v29, v16, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (NSString *)objc_msgSend_copy(v11, v18, v19);
      tmlStateName = self->_tmlStateExtends;
      self->_tmlStateExtends = v20;
      goto LABEL_7;
    }
  }
  else
  {
    objc_msgSend_tmlParent(self, v16, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v22, v23, v6, v21, 1);

    v26 = v29;
    if (!v29)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], 0, v25);
      v26 = (const char *)objc_claimAutoreleasedReturnValue();
    }
    v29 = (char *)v26;
    objc_msgSend_setObject_forKey_(self->_properties, v26, v25, v26, v6);
    objc_msgSend_addObject_(self->_propertyKeys, v27, v28, v6);
  }

}

- (id)valueForKeyPath:(id)a3
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
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v7 = (id)objc_msgSend_ensurePropertyWithKeyPath_forObject_writable_(TMLRuntime, v5, v6, v4, self, 0);
  objc_msgSend_objectForKey_(self->_properties, v8, v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_null(MEMORY[0x24BDBCEF8], v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v13)
    v14 = 0;
  else
    v14 = v10;
  v15 = v14;

  return v15;
}

- (void)applyToObject:(id)a3 fromState:(id)a4
{
  double v4;

  objc_msgSend_applyToObject_ignorePropertyKeys_(self, a2, v4, a3, 0);
}

- (void)applyToObject:(id)a3 ignorePropertyKeys:(id)a4
{
  id v6;
  id WeakRetained;
  const char *v8;
  double v9;
  void *v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  NSMutableOrderedSet *v15;
  double v16;
  NSMutableOrderedSet *v17;
  const char *v18;
  double v19;
  id v20;
  const char *v21;
  double v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v6 = a3;
  v23 = a4;
  if (self->_tmlStateExtends)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_baseState);

    if (!WeakRetained)
    {
      objc_msgSend_tmlStateForName_(v6, v8, v9, self->_tmlStateExtends);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_baseState, v10);

    }
    v11 = objc_loadWeakRetained((id *)&self->_baseState);
    objc_msgSend_applyToObject_ignorePropertyKeys_(v11, v12, v13, self, self->_propertyKeys);

  }
  v15 = self->_propertyKeys;
  if (v23)
  {
    v17 = (NSMutableOrderedSet *)objc_msgSend_mutableCopy(v15, v14, v16);

    objc_msgSend_minusOrderedSet_(v17, v18, v19, v23);
    v15 = v17;
  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_22AD1EE6C;
  v24[3] = &unk_24F4FD428;
  v24[4] = self;
  v25 = v6;
  v20 = v6;
  objc_msgSend_enumerateObjectsUsingBlock_(v15, v21, v22, v24);

}

- (id)tmlIdentifier
{
  double v2;
  void *v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;

  objc_msgSend_tmlParent(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tmlIdentifier(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, v9, CFSTR("%@_State_%@"), v7, self->_tmlStateName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)enterStateFromState:(id)a3
{
  id v4;
  id WeakRetained;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_baseState);
  objc_msgSend_enterStateFromState_(WeakRetained, v6, v7, v4);

  if (v4)
  {
    v13[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, v9, v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emitTMLSignal_withArguments_(self, v11, v12, CFSTR("enterState"), v10);

  }
  else
  {
    objc_msgSend_emitTMLSignal_withArguments_(self, v8, v9, CFSTR("enterState"), 0);
  }

}

- (void)leaveStateToState:(id)a3
{
  id v4;
  id WeakRetained;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_baseState);
  objc_msgSend_leaveStateToState_(WeakRetained, v6, v7, v4);

  if (v4)
  {
    v13[0] = v4;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, v9, v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emitTMLSignal_withArguments_(self, v11, v12, CFSTR("leaveState"), v10);

  }
  else
  {
    objc_msgSend_emitTMLSignal_withArguments_(self, v8, v9, CFSTR("leaveState"), 0);
  }

}

- (NSString)tmlStateName
{
  return self->_tmlStateName;
}

- (NSString)tmlStateExtends
{
  return self->_tmlStateExtends;
}

- (NSOrderedSet)propertyKeys
{
  return &self->_propertyKeys->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_baseState);
  objc_storeStrong((id *)&self->_tmlStateExtends, 0);
  objc_storeStrong((id *)&self->_tmlStateName, 0);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
