@implementation TRAPreferencesTreeNode

- (id)settingsUpdater
{
  return self->_participant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

- (TRAParticipant)participant
{
  return self->_participant;
}

uint64_t __35__TRAPreferencesTreeNode_addChild___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "order");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "order");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (double)order
{
  return self->_order;
}

- (void)setOrder:(double)a3
{
  self->_order = a3;
}

- (TRAPreferencesTreeNode)initWithParticipant:(id)a3
{
  id v5;
  TRAPreferencesTreeNode *v6;
  uint64_t v7;
  NSString *uniqueIdentifier;
  uint64_t v9;
  NSString *role;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TRAPreferencesTreeNode;
  v6 = -[TRAPreferencesTreeNode init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v7;

    objc_storeStrong((id *)&v6->_participant, a3);
    objc_msgSend(v5, "role");
    v9 = objc_claimAutoreleasedReturnValue();
    role = v6->_role;
    v6->_role = (NSString *)v9;

  }
  return v6;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)addChild:(id)a3
{
  id v5;
  NSArray *v6;
  NSArray *children;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAPreferencesTree.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("child"));

    v5 = 0;
  }
  objc_msgSend(v5, "setParent:", self);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_children);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObject:](v6, "addObject:", v9);
  -[NSArray sortUsingComparator:](v6, "sortUsingComparator:", &__block_literal_global_0);
  children = self->_children;
  self->_children = v6;

}

- (NSArray)children
{
  return self->_children;
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (TRAPreferencesTreeNode)parent
{
  return (TRAPreferencesTreeNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setDebugLastSettingsWereValidated:(BOOL)a3
{
  -[TRAParticipant set_debugDelegateDidValidateLastSettings:](self->_participant, "set_debugDelegateDidValidateLastSettings:", a3);
}

- (void)setDebugLastOrientationSettingsValidationFailureReason:(id)a3
{
  -[TRAParticipant set_debugLastOrientationValidationFailureReason:](self->_participant, "set_debugLastOrientationValidationFailureReason:", a3);
}

- (void)setChildren:(id)a3
{
  id v5;
  NSArray *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *children;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAPreferencesTree.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("children"));

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_children);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "setParent:", self);
        -[NSArray addObject:](v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[NSArray sortUsingComparator:](v6, "sortUsingComparator:", &__block_literal_global_10);
  children = self->_children;
  self->_children = v6;

}

uint64_t __38__TRAPreferencesTreeNode_setChildren___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "order");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "order");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (BOOL)debugLastSettingsWereValidated
{
  return -[TRAParticipant _debugDelegateDidValidateLastSettings](self->_participant, "_debugDelegateDidValidateLastSettings");
}

- (NSString)debugLastOrientationSettingsValidationFailureReason
{
  return -[TRAParticipant _debugLastOrientationValidationFailureReason](self->_participant, "_debugLastOrientationValidationFailureReason");
}

- (id)_participant
{
  return self->_participant;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAPreferencesTreeNode succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAPreferencesTreeNode descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)role
{
  return self->_role;
}

@end
