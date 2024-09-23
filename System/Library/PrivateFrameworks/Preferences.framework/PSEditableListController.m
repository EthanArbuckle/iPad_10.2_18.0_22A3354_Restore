@implementation PSEditableListController

- (PSEditableListController)init
{
  PSEditableListController *v2;
  id v3;
  void *v4;
  uint64_t v5;
  UIBarButtonItem *editBarButtonItem;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PSEditableListController;
  v2 = -[PSListController init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CEA380]);
    PS_LocalizedString(CFSTR("EDIT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, v2, sel_editDoneTapped);
    editBarButtonItem = v2->_editBarButtonItem;
    v2->_editBarButtonItem = (UIBarButtonItem *)v5;

    -[PSEditableListController navigationItem](v2, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditableListController editBarButtonItem](v2, "editBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItems:", v9);

  }
  return v2;
}

- (void)setEditingButtonHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  NSArray *previousRightBarButtonItems;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v4 = a4;
  v5 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[PSEditableListController setEditable:](self, "setEditable:", 0);
    if (self->_editingDisabled != v5)
    {
      self->_editingDisabled = v5;
      -[PSEditableListController navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItems:animated:", self->_previousRightBarButtonItems, v4);

      previousRightBarButtonItems = self->_previousRightBarButtonItems;
      self->_previousRightBarButtonItems = 0;

    }
  }
  else if (self->_editingDisabled)
  {
    self->_editingDisabled = 0;
    -[PSEditableListController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rightBarButtonItems");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_previousRightBarButtonItems;
    self->_previousRightBarButtonItems = v10;

    -[PSEditableListController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSEditableListController editBarButtonItem](self, "editBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItems:animated:", v14, v4);

  }
}

- (void)setEditButtonEnabled:(BOOL)a3
{
  -[UIBarButtonItem setEnabled:](self->_editBarButtonItem, "setEnabled:", a3);
}

- (void)editDoneTapped
{
  -[PSEditableListController setEditable:](self, "setEditable:", !self->_editable);
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)_setEditable:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  __CFString *v7;
  void *v8;

  v4 = a4;
  self->_editable = a3;
  -[PSEditableListController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesBackButton:animated:", self->_editable, v4);

  if (self->_editable)
    v7 = CFSTR("DONE");
  else
    v7 = CFSTR("EDIT");
  PS_LocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](self->_editBarButtonItem, "setTitle:", v8);

  -[UIBarButtonItem setStyle:](self->_editBarButtonItem, "setStyle:", 2 * self->_editable);
  -[UITableView setEditing:animated:](self->super._table, "setEditing:animated:", self->_editable, v4);
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3)
    -[PSEditableListController _setEditable:animated:](self, "_setEditable:animated:");
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v5 = a4;
  v6 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v5);
  if (self->_editable)
  {
    v7 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->super._specifiers, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "propertyForKey:", CFSTR("cellObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isUserInteractionEnabled");

    if (v10)
      v7 = v5;
    else
      v7 = 0;
  }
  v11 = v7;

  return v11;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  _QWORD *v4;
  uint64_t v5;
  int64_t v7;

  -[NSArray objectAtIndex:](self->super._specifiers, "objectAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v5 = v4[7];
  v7 = v5 == 1 || (unint64_t)(v5 - 3) < 2;

  return v7;
}

- (BOOL)performDeletionActionForSpecifier:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;
  id v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", CFSTR("deletionAction"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (NSSelectorFromString(v4))
  {
    objc_msgSend(v3, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)SFPerformSelector();

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)suspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSEditableListController;
  -[PSViewController suspend](&v3, sel_suspend);
  -[PSEditableListController _setEditable:animated:](self, "_setEditable:animated:", 0, 0);
}

- (void)didLock
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSEditableListController;
  -[PSViewController didLock](&v3, sel_didLock);
  -[PSEditableListController _setEditable:animated:](self, "_setEditable:animated:", 0, 0);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  void *v7;

  -[PSListController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[PSEditableListController performDeletionActionForSpecifier:](self, "performDeletionActionForSpecifier:", v6);
    -[PSListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v7, 1);
    v6 = v7;
  }

}

- (UIBarButtonItem)editBarButtonItem
{
  return self->_editBarButtonItem;
}

- (NSArray)previousRightBarButtonItems
{
  return self->_previousRightBarButtonItems;
}

- (void)setPreviousRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_previousRightBarButtonItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_editBarButtonItem, 0);
}

@end
