@implementation PSListItemsController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSListItemsController;
  -[PSListController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didEnterBackground, *MEMORY[0x1E0CEB288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_willEnterForeground, *MEMORY[0x1E0CEB350], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id retainedTarget;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSListItemsController;
  -[PSListController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[PSListController setSpecifier:](self, "setSpecifier:", self->super.super._specifier);
  -[PSListItemsController scrollToSelectedCell](self, "scrollToSelectedCell");
  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("deferItemSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deferItemSelection = objc_msgSend(v4, "BOOLValue");

  if (self->_deferItemSelection)
  {
    -[PSSpecifier target](self->super.super._specifier, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    retainedTarget = self->_retainedTarget;
    self->_retainedTarget = v5;

  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("PSListItemsControllerSpecifierKey"));

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSListItemsController;
  -[PSListController dealloc](&v4, sel_dealloc);
}

- (void)scrollToSelectedCell
{
  id v3;

  if (self->_rowToSelect != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PSListController indexPathForIndex:](self, "indexPathForIndex:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[UITableView scrollToRowAtIndexPath:atScrollPosition:animated:](self->super._table, "scrollToRowAtIndexPath:atScrollPosition:animated:", v3, 2, 0);

  }
}

- (void)setRowToSelect
{
  _BOOL4 v3;
  PSSpecifier *specifier;
  void *v5;
  void *v6;
  id v7;

  self->_rowToSelect = 0x7FFFFFFFFFFFFFFFLL;
  v3 = -[PSSpecifier hasValidGetter](self->super.super._specifier, "hasValidGetter");
  specifier = self->super.super._specifier;
  if (v3)
    -[PSSpecifier performGetter](specifier, "performGetter");
  else
    -[PSSpecifier propertyForKey:](specifier, "propertyForKey:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListItemsController identifierForValue:](self, "identifierForValue:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PSListController specifierForID:](self, "specifierForID:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    self->_rowToSelect = -[PSListController indexOfSpecifier:](self, "indexOfSpecifier:", v6);

}

- (void)setValueForSpecifier:(id)a3 defaultValue:(id)a4
{
  id v6;
  void *v7;
  PSSpecifier *specifier;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[PSSpecifier hasValidSetter](self->super.super._specifier, "hasValidSetter"))
  {
    objc_msgSend(v10, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    specifier = self->super.super._specifier;
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier performSetterWithValue:](specifier, "performSetterWithValue:", v9);

    }
    else
    {
      -[PSSpecifier performSetterWithValue:](specifier, "performSetterWithValue:", v6);
    }

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  PSSpecifier *lastSelectedSpecifier;
  void *v6;
  PSSpecifier *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  PSSpecifier *v16;
  id retainedTarget;
  objc_super v18;

  v3 = a3;
  lastSelectedSpecifier = self->_lastSelectedSpecifier;
  if (lastSelectedSpecifier)
  {
    if (self->_deferItemSelection)
    {
      -[PSSpecifier propertyForKey:](lastSelectedSpecifier, "propertyForKey:", CFSTR("cellObject"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = self->_lastSelectedSpecifier;
      objc_msgSend(v6, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListItemsController setValueForSpecifier:defaultValue:](self, "setValueForSpecifier:defaultValue:", v7, v8);

    }
    -[PSListItemsController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSListController specifier](self, "specifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_respondsToSelector();
    v14 = v10;
    if ((v13 & 1) != 0 || (v15 = objc_opt_respondsToSelector(), v14 = v12, (v15 & 1) != 0))
      objc_msgSend(v14, "reloadSpecifier:", self->super.super._specifier);
    v16 = self->_lastSelectedSpecifier;
    self->_lastSelectedSpecifier = 0;

  }
  if (self->_deferItemSelection)
  {
    retainedTarget = self->_retainedTarget;
    self->_retainedTarget = 0;

  }
  v18.receiver = self;
  v18.super_class = (Class)PSListItemsController;
  -[PSListController viewWillDisappear:](&v18, sel_viewWillDisappear_, v3);
}

- (void)saveChangesIfNeeded
{
  PSSpecifier *lastSelectedSpecifier;
  PSSpecifier *v4;
  void *v5;
  PSSpecifier *v6;
  id v7;

  if (self->_deferItemSelection)
  {
    lastSelectedSpecifier = self->_lastSelectedSpecifier;
    if (lastSelectedSpecifier)
    {
      -[PSSpecifier propertyForKey:](lastSelectedSpecifier, "propertyForKey:", CFSTR("cellObject"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v4 = self->_lastSelectedSpecifier;
      objc_msgSend(v7, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListItemsController setValueForSpecifier:defaultValue:](self, "setValueForSpecifier:defaultValue:", v4, v5);

      v6 = self->_lastSelectedSpecifier;
      self->_lastSelectedSpecifier = 0;

    }
  }
}

- (void)prepareSpecifiersMetadata
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSListItemsController;
  -[PSListController prepareSpecifiersMetadata](&v3, sel_prepareSpecifiersMetadata);
  -[PSListItemsController setRowToSelect](self, "setRowToSelect");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  int64_t rowToSelect;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  v8 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v6);
  v13.receiver = self;
  v13.super_class = (Class)PSListItemsController;
  -[PSListController tableView:cellForRowAtIndexPath:](&v13, sel_tableView_cellForRowAtIndexPath_, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = self->_restrictionList;
  v10 = objc_msgSend(v9, "tag");
  if (!(_DWORD)v6)
  {
    if (v10 != 3)
      return v9;
    rowToSelect = self->_rowToSelect;
LABEL_7:
    objc_msgSend(v9, "setChecked:", v8 == rowToSelect);
    return v9;
  }
  if (v10 == 3)
  {
    rowToSelect = self->_rowToSelect;
    if (v8 > rowToSelect)
      goto LABEL_7;
  }
  return v9;
}

- (void)listItemSelected:(id)a3
{
  int64_t v4;
  int64_t v5;
  UITableView *table;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    if (self->_rowToSelect != 0x7FFFFFFFFFFFFFFFLL)
    {
      table = self->super._table;
      -[PSListController indexPathForIndex:](self, "indexPathForIndex:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableView cellForRowAtIndexPath:](table, "cellForRowAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setChecked:", 0);
    }
    -[UITableView cellForRowAtIndexPath:](self->super._table, "cellForRowAtIndexPath:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->super._specifiers, "objectAtIndex:", v5);
    v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setChecked:", 1);
    self->_rowToSelect = v5;
    if (self->_lastSelectedSpecifier != v10)
      objc_storeStrong((id *)&self->_lastSelectedSpecifier, v10);
    if (!self->_deferItemSelection)
    {
      objc_msgSend(v9, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSListItemsController setValueForSpecifier:defaultValue:](self, "setValueForSpecifier:defaultValue:", v10, v11);

    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[PSListItemsController listItemSelected:](self, "listItemSelected:", v6);
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)_addStaticText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("staticTextMessage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v7, "setProperty:forKey:", v4, CFSTR("footerText"));
  else
    objc_msgSend(v7, "removePropertyForKey:", CFSTR("footerText"));
  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("staticHeaderText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v5;
  else
    v6 = 0;
  objc_msgSend(v7, "setName:", v6);

}

- (id)itemsFromParent
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;

  -[PSSpecifier values](self->super.super._specifier, "values");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v21, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("LIST_ITEMS_GROUP_SPECIFIER"));
  v5 = objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v4, "addObject:", v5);
  v18 = (void *)v5;
  -[PSListItemsController _addStaticText:](self, "_addStaticText:", v5);
  v19 = v3;
  if (v3)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v21, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier titleDictionary](self->super.super._specifier, "titleDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, 0);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v9, 0);
      -[PSSpecifier target](self->super.super._specifier, "target");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, v12, 0, 0, 0, 3, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSListItemsController identifierForValue:](self, "identifierForValue:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIdentifier:", v14);

      objc_msgSend(v13, "setValues:titles:", v10, v11);
      -[PSListController specifier](self, "specifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PSListItemsValuesAreAppIDsKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v13, "setProperty:forKey:", v7, CFSTR("appIDForLazyIcon"));
        objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
      }
      objc_msgSend(v20, "addObject:", v13);

      ++v6;
    }
    while (v19 != v6);
  }

  return v20;
}

- (id)itemsFromDataSource
{
  uint64_t v3;
  NSString *v4;
  uint64_t v5;
  NSString *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  NSString *v27;
  NSString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;

  v3 = 984;
  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("valuesDataSource"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("titlesDataSource"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v12 = 0;
  }
  else
  {
    v28 = v4;
    NSSelectorFromString(v4);
    -[PSSpecifier target](self->super.super._specifier, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SFPerformSelector();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v6;
    NSSelectorFromString(v6);
    -[PSSpecifier target](self->super.super._specifier, "target");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SFPerformSelector();
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v9;
    v11 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithID:](PSSpecifier, "groupSpecifierWithID:", CFSTR("LIST_ITEMS_GROUP_SPECIFIER"));
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);
    v26 = (void *)v13;
    -[PSListItemsController _addStaticText:](self, "_addStaticText:", v13);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v11);
    v31 = v11;
    if (v11)
    {
      v14 = 0;
      v30 = v12;
      do
      {
        objc_msgSend(v33, "objectAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndex:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v15, 0);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v16, 0);
        v19 = v3;
        WeakRetained = objc_loadWeakRetained(*(id **)((char *)&self->super.super.super.super.super.isa + v3) + 1);
        +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, WeakRetained, 0, 0, 0, 3, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        -[PSListItemsController identifierForValue:](self, "identifierForValue:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setIdentifier:", v22);

        objc_msgSend(v21, "setValues:titles:", v17, v18);
        -[PSListController specifier](self, "specifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PSListItemsValuesAreAppIDsKey"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v21, "setProperty:forKey:", v15, CFSTR("appIDForLazyIcon"));
          objc_msgSend(v21, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("useLazyIcons"));
        }
        v12 = v30;
        objc_msgSend(v30, "addObject:", v21);
        if (v16 && v15)
          objc_msgSend(v29, "setObject:forKey:", v16, v15);

        ++v14;
        v3 = v19;
      }
      while (v31 != v14);
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "setTitleDictionary:", v29);

    v6 = v27;
    v4 = v28;
  }

  return v12;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *specifiers;

  if (!self->super._specifiers)
  {
    -[PSSpecifier values](self->super.super._specifier, "values");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3
      && (v4 = (void *)v3,
          -[PSSpecifier titleDictionary](self->super.super._specifier, "titleDictionary"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v4,
          v5))
    {
      -[PSListItemsController itemsFromParent](self, "itemsFromParent");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PSListItemsController itemsFromDataSource](self, "itemsFromDataSource");
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    specifiers = self->super._specifiers;
    self->super._specifiers = v6;

  }
  return self->super._specifiers;
}

- (id)identifierForValue:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "stringValue");
    else
      objc_msgSend(v3, "description");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)isRestrictionList
{
  return self->_restrictionList;
}

- (void)setIsRestrictionList:(BOOL)a3
{
  self->_restrictionList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retainedTarget, 0);
  objc_storeStrong((id *)&self->_lastSelectedSpecifier, 0);
}

@end
