@implementation VFXOrderedDictionary

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXOrderedDictionary;
  -[VFXOrderedDictionary dealloc](&v3, sel_dealloc);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  const char *v7;
  uint64_t v8;
  NSMutableArray *keys;
  const char *v10;

  objc_msgSend_removeObjectForKey_(self, a2, (uint64_t)a4, (uint64_t)a4);
  if (a3)
  {
    keys = self->_keys;
    if (!keys)
    {
      self->_keys = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      self->_keyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      keys = self->_keys;
    }
    objc_msgSend_addObject_(keys, v7, (uint64_t)a4, v8);
    objc_msgSend_setObject_forKey_(self->_keyValues, v10, (uint64_t)a3, (uint64_t)a4);
  }
}

- (id)objectForKey:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectForKey_(self->_keyValues, a2, (uint64_t)a3, v3);
}

- (id)objectAtIndex:(int64_t)a3
{
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_objectAtIndex_(self->_keys, a2, a3, v3);
  return (id)objc_msgSend_objectForKey_(self, v6, v5, v7);
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;

  if (objc_msgSend_objectForKey_(self->_keyValues, a2, (uint64_t)a3, v3))
  {
    if (objc_msgSend_count(self->_keys, v6, v7, v8) == 1)
    {
      objc_msgSend_removeAllObjects(self, v9, v10, v11);
    }
    else
    {
      objc_msgSend_removeObject_(self->_keys, v9, (uint64_t)a3, v11);
      objc_msgSend_removeObjectForKey_(self->_keyValues, v12, (uint64_t)a3, v13);
    }
  }
}

- (void)removeAllObjects
{

  self->_keys = 0;
  self->_keyValues = 0;
}

- (id)allKeys
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_copy(self->_keys, a2, v2, v3);
}

- (void)applyFunction:(void *)a3 withContext:(void *)a4
{
  NSMutableArray *keys;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  keys = self->_keys;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, a2, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(keys);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v15 = objc_msgSend_objectForKey_(self->_keyValues, v9, v14, v10);
        ((void (*)(uint64_t, uint64_t, void *))a3)(v14, v15, a4);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v9, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v11);
  }
}

- (void)applyBlock:(id)a3
{
  NSMutableArray *keys;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  keys = self->_keys;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, a2, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(keys);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v13 = objc_msgSend_objectForKey_(self->_keyValues, v7, v12, v8);
        (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v12, v13);
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v7, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v9);
  }
}

- (unint64_t)count
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_keys, a2, v2, v3);
}

- (id)allValues
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_allValues(self->_keyValues, a2, v2, v3);
}

- (id)dictionary
{
  return self->_keyValues;
}

- (id)keys
{
  return self->_keys;
}

- (void)_setupFrom:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = (void *)objc_msgSend_dictionary(a3, a2, (uint64_t)a3, v3);
  self->_keyValues = (NSMutableDictionary *)objc_msgSend_mutableCopy(v6, v7, v8, v9);
  v13 = (void *)objc_msgSend_keys(a3, v10, v11, v12);
  self->_keys = (NSMutableArray *)objc_msgSend_mutableCopy(v13, v14, v15, v16);
}

- (id)copy
{
  id v3;
  const char *v4;
  uint64_t v5;

  v3 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend__setupFrom_(v3, v4, (uint64_t)self, v5);
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *keys;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8 = (void *)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p\n{\n"), v7, v5, self);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  keys = self->_keys;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v10, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v11)
  {
    v14 = v11;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(keys);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = objc_msgSend_objectForKeyedSubscript_(self->_keyValues, v12, v17, v13);
        objc_msgSend_appendFormat_(v8, v19, (uint64_t)CFSTR("    \"%@\" = \"%@\"\n"), v20, v17, v18);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(keys, v12, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }
  objc_msgSend_appendString_(v8, v12, (uint64_t)CFSTR("}>"), v13);
  return v8;
}

@end
