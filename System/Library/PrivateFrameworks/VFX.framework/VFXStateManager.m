@implementation VFXStateManager

- (VFXStateManager)init
{
  VFXStateManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VFXStateManager;
  v2 = -[VFXStateManager init](&v4, sel_init);
  if (v2)
    v2->_states = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXStateManager;
  -[VFXStateManager dealloc](&v3, sel_dealloc);
}

- (void)setWorld:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (id)world
{
  return self->_world;
}

- (NSArray)states
{
  return &self->_states->super;
}

- (void)addState:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  objc_msgSend_setStateManager_(a3, a2, (uint64_t)self, v3);
  objc_msgSend_addObject_(self->_states, v6, (uint64_t)a3, v7);
}

- (void)removeState:(id)a3
{
  uint64_t v3;

  objc_msgSend_removeObject_(self->_states, a2, (uint64_t)a3, v3);
}

- (id)stateWithName:(id)a3
{
  NSMutableArray *states;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  states = self->_states;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(states, a2, (uint64_t)&v17, (uint64_t)v21, 16);
  if (!v5)
    return 0;
  v9 = v5;
  v10 = *(_QWORD *)v18;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v10)
      objc_enumerationMutation(states);
    v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
    v13 = (void *)objc_msgSend_name(v12, v6, v7, v8);
    if ((objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3, v15) & 1) != 0)
      return v12;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(states, v6, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v9)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)addReverseItem:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;

  if (!objc_msgSend_itemMatching_(self->_reverseActiveState, a2, (uint64_t)a3, v3))
    objc_msgSend_addStateItem_(self->_reverseActiveState, v6, (uint64_t)a3, v7);
}

- (void)removeReverseItem:(id)a3
{
  ((void (*)(VFXState *, char *, id))MEMORY[0x1E0DE7D20])(self->_reverseActiveState, sel_removeStateItem_, a3);
}

- (void)setActiveState:(id)a3
{
  uint64_t v3;
  VFXState *activeState;
  VFXState *reverseActiveState;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  activeState = self->_activeState;
  if (activeState != a3)
  {
    reverseActiveState = self->_reverseActiveState;
    if (reverseActiveState)
    {
      objc_msgSend_apply(reverseActiveState, a2, (uint64_t)a3, v3);

      self->_reverseActiveState = 0;
      activeState = self->_activeState;
    }

    self->_activeState = (VFXState *)a3;
    self->_reverseActiveState = (VFXState *)(id)objc_msgSend_makeReverseStates(a3, v8, v9, v10);
    objc_msgSend_apply(self->_activeState, v11, v12, v13);
  }
}

- (VFXState)activeState
{
  return self->_activeState;
}

- (VFXStateManager)initWithCoder:(id)a3
{
  VFXStateManager *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VFXStateManager;
  v4 = -[VFXStateManager init](&v24, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("states"));
    v11 = (NSMutableArray *)objc_msgSend_mutableCopy(v7, v8, v9, v10);
    v4->_states = v11;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v20, (uint64_t)v25, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v11);
          objc_msgSend_setStateManager_(*(void **)(*((_QWORD *)&v20 + 1) + 8 * v18++), v14, (uint64_t)v4, v15);
        }
        while (v16 != v18);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v20, (uint64_t)v25, 16);
      }
      while (v16);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_states, (uint64_t)CFSTR("states"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
