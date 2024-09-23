@implementation SearchUIContactButtonItem

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  objc_super v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v18.receiver = self,
        v18.super_class = (Class)SearchUIContactButtonItem,
        -[SearchUIButtonItem isEqual:](&v18, sel_isEqual_, v4)))
  {
    v5 = v4;
    -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "quickActionsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 == v9)
    {
      v15 = 1;
    }
    else
    {
      -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contact");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "quickActionsController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contact");
      v12 = v7;
      v13 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v10, "isEqual:", v14);

      v6 = v13;
      v7 = v12;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  objc_super v8;
  objc_super v9;

  -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)SearchUIContactButtonItem;
    v5 = -[SearchUIButtonItem hash](&v9, sel_hash);
    v6 = objc_msgSend(v4, "hash") ^ v5;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIContactButtonItem;
    v6 = -[SearchUIButtonItem hash](&v8, sel_hash);
  }

  return v6;
}

- (BOOL)hasState
{
  return 0;
}

- (void)buttonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactButtonItem actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeTapBehaviorWithoutDisambiguationForActionType:", v4);

  -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactButtonItem actionType](self, "actionType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItem setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", objc_msgSend(v5, "hasDefaultActionForActionType:", v6) ^ 1);

  -[SearchUIButtonItem delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stateDidChangeForButtonItem:", self);

}

- (void)quickActionsControllerDidUpdateActionModels
{
  void *v3;
  void *v4;
  id v5;

  -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactButtonItem actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIButtonItem setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", objc_msgSend(v3, "hasDefaultActionForActionType:", v4) ^ 1);

  -[SearchUIButtonItem delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateDidChangeForButtonItem:", self);

}

- (id)previewMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIContactButtonItem actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationMenuForActionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", &stru_1EA1FB118, 0, 0, 1, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)command
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[SearchUIContactButtonItem actionType](self, "actionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96658]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96620]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C965F8]) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0C96618]);
  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setContactActionType:", v4);
  -[SearchUIContactButtonItem quickActionsController](self, "quickActionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDidDisplayHandleOptions:", objc_msgSend(v6, "hasDefaultActionForActionType:", v3) ^ 1);

  return v5;
}

- (CNContactQuickActionsController)quickActionsController
{
  return self->_quickActionsController;
}

- (void)setQuickActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionsController, a3);
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionType:(id)a3
{
  objc_storeStrong((id *)&self->_actionType, a3);
}

- (NSMutableArray)menuElements
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMenuElements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuElements, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_quickActionsController, 0);
}

@end
