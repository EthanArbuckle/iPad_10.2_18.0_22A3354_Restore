@implementation VFXState

- (VFXState)init
{
  VFXState *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VFXState;
  v2 = -[VFXState init](&v11, sel_init);
  if (v2)
  {
    v2->_stateItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v3, v4, v5);
    v2->_identifier = (NSString *)(id)objc_msgSend_UUIDString(v6, v7, v8, v9);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXState;
  -[VFXState dealloc](&v3, sel_dealloc);
}

- (void)setStateManager:(id)a3
{
  self->_stateManager = (VFXStateManager *)a3;
}

- (id)stateManager
{
  return self->_stateManager;
}

- (void)setBaseState:(id)a3
{
  VFXState *baseState;

  baseState = self->_baseState;
  if (baseState != a3)
  {

    self->_baseState = (VFXState *)a3;
  }
}

- (VFXState)baseState
{
  return self->_baseState;
}

- (id)itemMatching:(id)a3
{
  NSMutableArray *stateItems;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  stateItems = self->_stateItems;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, a2, (uint64_t)&v13, (uint64_t)v17, 16);
  if (!v5)
    return 0;
  v8 = v5;
  v9 = *(_QWORD *)v14;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(stateItems);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if ((objc_msgSend_replaces_(a3, v6, (uint64_t)v11, v7) & 1) != 0)
      return v11;
    if (v8 == ++v10)
    {
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v6, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v8)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addStateItem:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_setState_(a3, a2, (uint64_t)self, v3);
  objc_msgSend_addObject_(self->_stateItems, v6, (uint64_t)a3, v7);
}

- (void)removeStateItem:(id)a3
{
  uint64_t v3;

  objc_msgSend_removeObject_(self->_stateItems, a2, (uint64_t)a3, v3);
}

- (void)apply
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *stateItems;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_baseState(self, a2, v2, v3))
  {
    v8 = (void *)objc_msgSend_baseState(self, v5, v6, v7);
    objc_msgSend_apply(v8, v9, v10, v11);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  stateItems = self->_stateItems;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v13)
  {
    v17 = v13;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(stateItems);
        objc_msgSend_apply(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v19++), v14, v15, v16);
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v14, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v17);
  }
}

- (void)setName:(id)a3
{

  self->_name = (NSString *)a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)stateItems
{
  return &self->_stateItems->super;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSMutableArray *stateItems;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("State %@: {\n"), v2, self->_name);
  if (objc_msgSend_baseState(self, v5, v6, v7))
  {
    v11 = (void *)objc_msgSend_baseState(self, v8, v9, v10);
    v15 = objc_msgSend_description(v11, v12, v13, v14);
    v4 = (void *)objc_msgSend_stringByAppendingString_(v4, v16, v15, v17);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  stateItems = self->_stateItems;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v8, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v19)
  {
    v23 = v19;
    v24 = *(_QWORD *)v31;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(stateItems);
        v26 = objc_msgSend_description(*(void **)(*((_QWORD *)&v30 + 1) + 8 * v25), v20, v21, v22);
        v4 = (void *)objc_msgSend_stringByAppendingString_(v4, v27, v26, v28);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v20, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v23);
  }
  return (id)objc_msgSend_stringByAppendingString_(v4, v20, (uint64_t)CFSTR("}\n"), v22);
}

- (id)makeReverseStates
{
  VFXState *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ReverseItem;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *ReverseStates;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(VFXState);
  objc_msgSend_setStateManager_(v3, v4, (uint64_t)self->_stateManager, v5);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = (void *)objc_msgSend_reverseObjectEnumerator(self->_stateItems, v6, v7, v8, 0);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v35;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v9);
        ReverseItem = objc_msgSend_makeReverseItem(*(void **)(*((_QWORD *)&v34 + 1) + 8 * v17), v12, v13, v14);
        objc_msgSend_addStateItem_(v3, v19, ReverseItem, v20);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v15);
  }
  if (objc_msgSend_baseState(self, v12, v13, v14))
  {
    v24 = (void *)objc_msgSend_baseState(self, v21, v22, v23);
    ReverseStates = (void *)objc_msgSend_makeReverseStates(v24, v25, v26, v27);
    objc_msgSend_setStateManager_(ReverseStates, v29, (uint64_t)self->_stateManager, v30);
    objc_msgSend_setBaseState_(ReverseStates, v31, (uint64_t)v3, v32);

    v3 = ReverseStates;
  }
  return v3;
}

- (VFXState)initWithCoder:(id)a3
{
  VFXState *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *stateItems;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)VFXState;
  v4 = -[VFXState init](&v37, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_baseState = (VFXState *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("baseState"));
    v7 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, (uint64_t)CFSTR("name"));
    v9 = objc_opt_class();
    v11 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v10, v9, (uint64_t)CFSTR("stateItems"));
    v4->_stateItems = (NSMutableArray *)objc_msgSend_mutableCopy(v11, v12, v13, v14);
    v15 = objc_opt_class();
    v17 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("identifier"));
    v4->_identifier = v17;
    if (!v17)
    {
      v21 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v18, v19, v20);
      v4->_identifier = (NSString *)(id)objc_msgSend_UUIDString(v21, v22, v23, v24);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    stateItems = v4->_stateItems;
    v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v18, (uint64_t)&v33, (uint64_t)v38, 16);
    if (v26)
    {
      v29 = v26;
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(stateItems);
          objc_msgSend_setState_(*(void **)(*((_QWORD *)&v33 + 1) + 8 * i), v27, (uint64_t)v4, v28);
        }
        v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v27, (uint64_t)&v33, (uint64_t)v38, 16);
      }
      while (v29);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  NSString *name;
  VFXState *baseState;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_stateItems, (uint64_t)CFSTR("stateItems"));
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)name, (uint64_t)CFSTR("name"));
  baseState = self->_baseState;
  if (baseState)
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)baseState, (uint64_t)CFSTR("baseState"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_identifier, (uint64_t)CFSTR("identifier"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
