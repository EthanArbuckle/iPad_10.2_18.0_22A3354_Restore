@implementation SBSwitcherModifierStackSnapshot

- (SBSwitcherModifierStackSnapshot)initWithRootModifier:(id)a3
{
  id v5;
  SBSwitcherModifierStackSnapshot *v6;
  void *v7;
  uint64_t v8;
  NSString *modifierName;
  void *v10;
  uint64_t v11;
  NSString *modifierDescription;
  SBSwitcherModifierQuerySnapshot *v13;
  SBSwitcherModifierQuerySnapshot *querySnapshot;
  void *v15;
  uint64_t v16;
  NSArray *childSnapshots;
  void *v19;
  objc_super v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSwitcherModifierTimelineEntry.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rootModifier"));

  }
  v20.receiver = self;
  v20.super_class = (Class)SBSwitcherModifierStackSnapshot;
  v6 = -[SBSwitcherModifierStackSnapshot init](&v20, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    modifierName = v6->_modifierName;
    v6->_modifierName = (NSString *)v8;

    objc_msgSend(v5, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    modifierDescription = v6->_modifierDescription;
    v6->_modifierDescription = (NSString *)v11;

    v13 = -[SBSwitcherModifierQuerySnapshot initWithModifier:]([SBSwitcherModifierQuerySnapshot alloc], "initWithModifier:", v5);
    querySnapshot = v6->_querySnapshot;
    v6->_querySnapshot = v13;

    objc_msgSend(v5, "debugPotentialChildModifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_map:", &__block_literal_global_367);
    v16 = objc_claimAutoreleasedReturnValue();
    childSnapshots = v6->_childSnapshots;
    v6->_childSnapshots = (NSArray *)v16;

  }
  return v6;
}

SBSwitcherModifierStackSnapshot *__56__SBSwitcherModifierStackSnapshot_initWithRootModifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SBSwitcherModifierStackSnapshot *v3;

  v2 = a2;
  v3 = -[SBSwitcherModifierStackSnapshot initWithRootModifier:]([SBSwitcherModifierStackSnapshot alloc], "initWithRootModifier:", v2);

  return v3;
}

- (void)enumerateModifierSnapshots:(id)a3
{
  char v3;

  v3 = 0;
  -[SBSwitcherModifierStackSnapshot _enumerateModifierSnapshots:stop:](self, "_enumerateModifierSnapshots:stop:", a3, &v3);
}

- (void)_enumerateModifierSnapshots:(id)a3 stop:(BOOL *)a4
{
  id v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!*a4)
  {
    (*((void (**)(id, SBSwitcherModifierStackSnapshot *, BOOL *))v6 + 2))(v6, self, a4);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_childSnapshots;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_enumerateModifierSnapshots:stop:", v7, a4, (_QWORD)v13);
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (unint64_t)countOfAllChildSnapshots
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SBSwitcherModifierStackSnapshot_countOfAllChildSnapshots__block_invoke;
  v4[3] = &unk_1E8EBE898;
  v4[4] = &v5;
  -[SBSwitcherModifierStackSnapshot enumerateModifierSnapshots:](self, "enumerateModifierSnapshots:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__SBSwitcherModifierStackSnapshot_countOfAllChildSnapshots__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (NSString)modifierName
{
  return self->_modifierName;
}

- (NSString)modifierDescription
{
  return self->_modifierDescription;
}

- (SBSwitcherModifierQuerySnapshot)querySnapshot
{
  return self->_querySnapshot;
}

- (NSArray)childSnapshots
{
  return self->_childSnapshots;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childSnapshots, 0);
  objc_storeStrong((id *)&self->_querySnapshot, 0);
  objc_storeStrong((id *)&self->_modifierDescription, 0);
  objc_storeStrong((id *)&self->_modifierName, 0);
}

@end
