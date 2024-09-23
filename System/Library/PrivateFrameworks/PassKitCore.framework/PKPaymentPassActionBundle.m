@implementation PKPaymentPassActionBundle

- (id)actionsMatchingTypes:(id)a3
{
  void *v4;
  NSArray *actions;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  actions = self->_actions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PKPaymentPassActionBundle_actionsMatchingTypes___block_invoke;
  v9[3] = &unk_1E2AD3DB8;
  v10 = v4;
  v6 = v4;
  -[NSArray pk_objectsPassingTest:](actions, "pk_objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __50__PKPaymentPassActionBundle_actionsMatchingTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);

  return v4;
}

- (void)setOrAddActions:(id)a3
{
  NSArray *actions;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v9 = a3;
  actions = self->_actions;
  if (actions)
  {
    v5 = (NSArray *)-[NSArray mutableCopy](actions, "mutableCopy");
    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v9);
    v6 = (NSArray *)-[NSArray copy](v5, "copy");
    v7 = self->_actions;
    self->_actions = v6;

  }
  else
  {
    v8 = (NSArray *)v9;
    v5 = self->_actions;
    self->_actions = v8;
  }

}

- (void)setOrAddActionGroups:(id)a3
{
  NSArray *actionGroups;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v9 = a3;
  actionGroups = self->_actionGroups;
  if (actionGroups)
  {
    v5 = (NSArray *)-[NSArray mutableCopy](actionGroups, "mutableCopy");
    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v9);
    v6 = (NSArray *)-[NSArray copy](v5, "copy");
    v7 = self->_actionGroups;
    self->_actionGroups = v6;

  }
  else
  {
    v8 = (NSArray *)v9;
    v5 = self->_actionGroups;
    self->_actionGroups = v8;
  }

}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSArray)actionGroups
{
  return self->_actionGroups;
}

- (void)setActionGroups:(id)a3
{
  objc_storeStrong((id *)&self->_actionGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionGroups, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
