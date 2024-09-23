@implementation VFXCoreEntityHandle

- (void)didSetEntityObject
{
  ((void (*)(VFXEntityObject *, char *))MEMORY[0x1E0DE7D20])(self->_entityObject, sel_setBeamed);
}

- (VFXCoreEntityHandle)initWithEntityObject:(id)a3
{
  VFXCoreEntityHandle *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)VFXCoreEntityHandle;
  v4 = -[VFXCoreEntityHandle init](&v21, sel_init);
  if (v4)
  {
    v4->_entityObject = (VFXEntityObject *)a3;
    v8 = (NSString *)(id)objc_msgSend_tag(a3, v5, v6, v7);
    v4->_tag = v8;
    v9 = sub_1B18F48C4(v8);
    v4->_handle = (__CFXCoreEntityHandle *)v9;
    if (v9)
      sub_1B193E768(v9, v4, v11, v12, v13, v14, v15, v16);
    objc_msgSend__syncObjCModel(v4, v10, v11, v12);
    objc_msgSend_didSetEntityObject(v4, v17, v18, v19);
  }
  return v4;
}

+ (VFXCoreEntityHandle)handleWithEntityObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)objc_opt_class());
  return (VFXCoreEntityHandle *)objc_msgSend_initWithEntityObject_(v4, v5, (uint64_t)a3, v6);
}

- (VFXCoreEntityHandle)initWithTag:(id)a3
{
  VFXCoreEntityHandle *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VFXCoreEntityHandle;
  v4 = -[VFXCoreEntityHandle init](&v14, sel_init);
  if (v4)
  {
    v5 = (NSString *)a3;
    v4->_tag = v5;
    v6 = sub_1B18F48C4(v5);
    v4->_handle = (__CFXCoreEntityHandle *)v6;
    if (v6)
      sub_1B193E768(v6, v4, v7, v8, v9, v10, v11, v12);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXCoreEntityHandle *handle;
  __CFXCoreEntityHandle *v10;
  const char *v11;
  objc_super v12;
  _QWORD v13[5];

  handle = self->_handle;
  if (handle)
  {
    sub_1B193E768((uint64_t)handle, 0, v2, v3, v4, v5, v6, v7);
    v10 = self->_handle;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B19B0AC8;
    v13[3] = &unk_1E63D4AB0;
    v13[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v13);
  }

  v12.receiver = self;
  v12.super_class = (Class)VFXCoreEntityHandle;
  -[VFXCoreEntityHandle dealloc](&v12, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p>"), v7, v5, self);
}

- (void)_syncObjCModel
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSMutableDictionary *bindings;
  uint64_t v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];

  self->_bindings = 0;
  v6 = objc_msgSend_bindings(self->_entityObject, v3, v4, v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v12 = objc_msgSend_count(v7, v9, v10, v11);
    self->_bindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v8, v13, v12, v14);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v15, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v7);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          bindings = self->_bindings;
          v25 = objc_msgSend_bindingName(v23, v17, v18, v19);
          objc_msgSend_setValue_forKey_(bindings, v26, (uint64_t)v23, v25);
        }
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v17, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v20);
    }
  }
}

- (void)setTag:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];

  if ((objc_msgSend_isEqual_(a3, a2, (uint64_t)self->_tag, v3) & 1) == 0)
  {

    self->_tag = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B19B0CFC;
    v14[3] = &unk_1E63D5378;
    v14[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (NSString)tag
{
  return self->_tag;
}

- (void)resolveTag:(id)a3 remap:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  const char *v11;
  uint64_t v12;
  VFXEntityObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  VFXEntityObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;

  if (!self->_entityObject)
  {
    v7 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)self->_tag, (uint64_t)a4);
    v10 = self->_tag;
    if (v7)
    {
      objc_msgSend_setTag_(self, v8, v7, v9);
      v13 = (VFXEntityObject *)(id)objc_msgSend_fetchEntityObjectWithTag_(a3, v11, (uint64_t)self->_tag, v12);
      self->_entityObject = v13;
      if (!v13)
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to find tag %@"), v14, v15, v16, v17, v18, v19, (uint64_t)self->_tag);
    }
    else
    {
      v20 = (VFXEntityObject *)(id)objc_msgSend_fetchEntityObjectWithTag_(a3, v8, (uint64_t)self->_tag, v9);
      self->_entityObject = v20;
      if (v20)
      {
        v28 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v21, v22, v23);
        v32 = objc_msgSend_UUIDString(v28, v29, v30, v31);
        objc_msgSend_setTag_(self, v33, v32, v34);
        objc_msgSend_setTag_(self->_entityObject, v35, (uint64_t)self->_tag, v36);
      }
      else
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to resolve entity with tag %@"), v22, v23, v24, v25, v26, v27, (uint64_t)self->_tag);
      }
      objc_msgSend_setObject_forKey_(a4, v37, (uint64_t)self->_tag, (uint64_t)v10);
    }

    objc_msgSend__syncObjCModel(self, v38, v39, v40);
    objc_msgSend_didSetEntityObject(self, v41, v42, v43);
  }
}

- (__CFXCoreEntityHandle)handle
{
  return self->_handle;
}

- (VFXEntityObject)entityObject
{
  return self->_entityObject;
}

- (void)__CFObject
{
  return (void *)((uint64_t (*)(VFXCoreEntityHandle *, char *))MEMORY[0x1E0DE7D20])(self, sel_handle);
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (_QWORD *)objc_msgSend___CFObject(self, a2, v2, v3);
  return (__CFXWorld *)sub_1B17C6244(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  uint64_t v2;
  uint64_t v3;
  id result;

  result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return sub_1B193E758((id *)result);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXCoreEntityHandle *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;

  if (!self->_entityObject)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_entityObject");
  v9 = [VFXCoreEntityHandle alloc];
  v13 = (id)objc_msgSend_copy(self->_entityObject, v10, v11, v12);
  return (id)objc_msgSend_initWithEntityObject_(v9, v14, (uint64_t)v13, v15);
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (NSArray)bindings
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *result;

  objc_msgSend__syncObjCModel(self, a2, v2, v3);
  result = (NSArray *)objc_msgSend_allValues(self->_bindings, v5, v6, v7);
  if (!result)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  return result;
}

- (id)bindingValueForKey:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = (void *)objc_msgSend_valueForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!v4)
    return 0;
  v8 = v4;
  v9 = objc_msgSend_type(v4, v5, v6, v7);
  v17 = sub_1B18F4A18(v9, v10, v11, v12, v13, v14, v15, v16);
  if (!(_DWORD)v17)
    return 0;
  v21 = (const char *)v17;
  v22 = (void *)objc_msgSend_rawValue(v8, v18, v19, v20);
  return VFXValueFromDataAndType(v22, v21, v23, v24);
}

- (BOOL)setBindingValue:(id)a3 forKey:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  _QWORD v41[7];

  v7 = (void *)objc_msgSend_valueForKey_(self->_bindings, a2, (uint64_t)a4, (uint64_t)a4);
  v11 = objc_msgSend_type(v7, v8, v9, v10);
  v24 = sub_1B18F4A18(v11, v12, v13, v14, v15, v16, v17, v18);
  if ((_DWORD)v24)
  {
    v25 = sub_1B18832A0(a3, v24, 0, v19, v20, v21, v22, v23);
    objc_msgSend_setRawValue_(v7, v26, v25, v27);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = sub_1B19B9D68(a3, v24, v28, v29, v30, v31, v32, v33);
      v38 = objc_msgSend_worldRef(self, v35, v36, v37);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = sub_1B19B109C;
      v41[3] = &unk_1E63D7EA8;
      v41[4] = self;
      v41[5] = a4;
      v41[6] = v34;
      objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v39, v38, (uint64_t)self, a4, v41);
    }
  }
  return (_DWORD)v24 != 0;
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v3;
  VFXEntityObject *entityObject;
  uint64_t v6;

  entityObject = self->_entityObject;
  v6 = objc_msgSend_world(self, a2, (uint64_t)a3, v3);
  return (id)MEMORY[0x1E0DE7D20](entityObject, sel__valueForKeyPath_world_, a3, v6);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((objc_msgSend__setValue_forKeyPath_(self->_entityObject, a2, (uint64_t)a3, (uint64_t)a4) & 1) == 0)
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: invalid keyPath %@"), v5, v6, v7, v8, v9, v10, (uint64_t)a4);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_tag, (uint64_t)CFSTR("tag"));
}

- (VFXCoreEntityHandle)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXCoreEntityHandle *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSString *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)VFXCoreEntityHandle;
  v7 = -[VFXCoreEntityHandle init](&v25, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v11 = objc_opt_class();
    v13 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, (uint64_t)CFSTR("tag"));
    v7->_tag = v13;
    v14 = sub_1B18F48C4(v13);
    v7->_handle = (__CFXCoreEntityHandle *)v14;
    if (v14)
      sub_1B193E768(v14, v7, v16, v17, v18, v19, v20, v21);
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    objc_msgSend_setImmediateMode_(VFXTransaction, v22, v8, v23);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)wasAddedToWorld:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  if (self->_entityObject)
  {
    v5 = (void *)objc_msgSend_scene(a3, a2, (uint64_t)a3, v3);
    objc_msgSend_addEntityObject_(v5, v6, (uint64_t)self->_entityObject, v7);
  }
}

- (void)willBeRemovedFromWorld:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend_scene(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x1E0DE7D20](v5, sel_removeEntityObject_, self->_entityObject, v6);
}

@end
