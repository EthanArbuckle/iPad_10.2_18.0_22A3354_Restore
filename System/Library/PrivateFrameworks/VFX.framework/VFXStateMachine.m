@implementation VFXStateMachine

- (VFXStateMachine)initWithStateManager:(id)a3
{
  VFXStateMachine *v4;
  VFXStateMachine *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXStateMachine;
  v4 = -[VFXStateMachine init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_manager, a3);
    v5->_transitions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXStateMachine;
  -[VFXStateMachine dealloc](&v3, sel_dealloc);
}

- (void)switchToState:(id)a3
{
  id WeakRetained;
  const char *v6;
  void *v7;
  NSMutableArray *transitions;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    transitions = self->_transitions;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v6, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v9)
    {
      v13 = v9;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(transitions);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = objc_msgSend_sourceState(v16, v10, v11, v12);
          if (v17 == objc_msgSend_activeState(v7, v18, v19, v20)
            && (id)objc_msgSend_targetState(v16, v10, v11, v12) == a3)
          {
            objc_msgSend_setActiveState_(v7, v10, (uint64_t)a3, v12);
            goto LABEL_13;
          }
        }
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v10, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

- (void)addTransition:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  v6 = objc_msgSend_sourceState(a3, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_targetState(a3, v7, v8, v9);
  objc_msgSend_removeTransitionFrom_to_(self, v11, v6, v10);
  objc_msgSend_addObject_(self->_transitions, v12, (uint64_t)a3, v13);
}

- (void)removeTransitionFrom:(id)a3 to:(id)a4
{
  NSMutableArray *transitions;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
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
  transitions = self->_transitions;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, a2, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(transitions);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((id)objc_msgSend_sourceState(v15, v9, v10, v11) == a3
          && (id)objc_msgSend_targetState(v15, v9, v10, v11) == a4)
        {
          objc_msgSend_removeObject_(self->_transitions, v9, (uint64_t)v15, v11);
          return;
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v9, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v12)
        continue;
      break;
    }
  }
}

- (id)transitionsFrom:(id)a3
{
  id v5;
  NSMutableArray *transitions;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  transitions = self->_transitions;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v7, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(transitions);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((id)objc_msgSend_sourceState(v15, v9, v10, v11) == a3)
          objc_msgSend_addObject_(v5, v9, (uint64_t)v15, v11);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v9, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v12);
  }
  return v5;
}

- (VFXStateMachine)initWithCoder:(id)a3
{
  VFXStateMachine *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXStateMachine;
  v4 = -[VFXStateMachine init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("transitions"));
    v4->_transitions = (NSMutableArray *)objc_msgSend_mutableCopy(v7, v8, v9, v10);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_transitions, (uint64_t)CFSTR("transitions"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXStateManager)manager
{
  return (VFXStateManager *)objc_loadWeak((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (NSArray)transitions
{
  return &self->_transitions->super;
}

- (void)setTransitions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
