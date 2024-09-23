@implementation STShowMoreUsageGroupSpecifierProvider

- (STShowMoreUsageGroupSpecifierProvider)init
{
  STShowMoreUsageGroupSpecifierProvider *v2;
  STShowMoreUsageGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PSSpecifier *showMoreSpecifier;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STShowMoreUsageGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfItemsToShow = 5;
    v2->_totalNumberOfItemsToShow = 5;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ShowMoreButton"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, v3, 0, 0, 0, 13, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    showMoreSpecifier = v3->_showMoreSpecifier;
    v3->_showMoreSpecifier = (PSSpecifier *)v6;

    -[PSSpecifier setButtonAction:](v3->_showMoreSpecifier, "setButtonAction:", sel_showMoreItems_);
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blankSpaceImageWithSize:", 29.0, 29.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSpecifier setObject:forKeyedSubscript:](v3->_showMoreSpecifier, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75AC8]);
  }
  return v3;
}

- (void)setSummarySpecifier:(id)a3
{
  PSSpecifier *v5;
  id *p_summarySpecifier;
  PSSpecifier *summarySpecifier;
  char v8;
  void *v9;
  void *v10;
  PSSpecifier *v11;

  v5 = (PSSpecifier *)a3;
  p_summarySpecifier = (id *)&self->_summarySpecifier;
  summarySpecifier = self->_summarySpecifier;
  if (summarySpecifier != v5)
  {
    v11 = v5;
    v8 = -[PSSpecifier isEqualToSpecifier:](summarySpecifier, "isEqualToSpecifier:", v5);
    v5 = v11;
    if ((v8 & 1) == 0)
    {
      -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (*p_summarySpecifier)
      {
        if (v11)
          objc_msgSend(v9, "setObject:atIndexedSubscript:", v11, 0);
        else
          objc_msgSend(v9, "removeObjectAtIndex:");
      }
      else
      {
        objc_msgSend(v9, "insertObject:atIndex:", v11, 0);
      }
      objc_storeStrong(p_summarySpecifier, a3);

      v5 = v11;
    }
  }

}

- (void)setUsageItems:(id)a3
{
  NSArray *v5;
  NSArray *usageItems;
  BOOL v7;
  NSArray *v8;

  v5 = (NSArray *)a3;
  usageItems = self->_usageItems;
  if (usageItems != v5)
  {
    v8 = v5;
    v7 = -[NSArray isEqualToArray:](usageItems, "isEqualToArray:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_usageItems, a3);
      -[STShowMoreUsageGroupSpecifierProvider refreshUsageSpecifiersWithUpdates:](self, "refreshUsageSpecifiersWithUpdates:", 1);
      v5 = v8;
    }
  }

}

- (void)setNumberOfItemsToShow:(unint64_t)a3
{
  self->_numberOfItemsToShow = a3;
  self->_totalNumberOfItemsToShow = a3;
}

- (void)refreshUsageSpecifiersWithUpdates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  STShowMoreUsageGroupSpecifierProvider *v19;
  id v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v3 = a3;
  -[STShowMoreUsageGroupSpecifierProvider usageItems](self, "usageItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STShowMoreUsageGroupSpecifierProvider totalNumberOfItemsToShow](self, "totalNumberOfItemsToShow");
  -[STShowMoreUsageGroupSpecifierProvider summarySpecifier](self, "summarySpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_opt_new();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (v3)
    -[STGroupSpecifierProvider beginUpdates](self, "beginUpdates");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __75__STShowMoreUsageGroupSpecifierProvider_refreshUsageSpecifiersWithUpdates___block_invoke;
  v17[3] = &unk_24DB87D10;
  v21 = &v25;
  v22 = v6;
  v24 = v7 != 0;
  v23 = v9;
  v11 = v8;
  v18 = v11;
  v19 = self;
  v12 = v10;
  v20 = v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
  v13 = objc_msgSend(v5, "count");
  if (v6 >= v13)
    v14 = v13;
  else
    v14 = v6;
  if (v7)
    v15 = v14 + 1;
  else
    v15 = v14;
  if (v9 <= v15)
  {
    -[STShowMoreUsageGroupSpecifierProvider showMoreSpecifier](self, "showMoreSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v26 + 24) && (objc_msgSend(v11, "containsObject:", v16) & 1) == 0)
      objc_msgSend(v12, "addObject:", v16);
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v11, "addObjectsFromArray:", v12);
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", v15, v9 - v15);
    objc_msgSend(v11, "removeObjectsAtIndexes:", v16);
  }

  if (v3)
    -[STGroupSpecifierProvider endUpdates](self, "endUpdates");

  _Block_object_dispose(&v25, 8);
}

void __75__STShowMoreUsageGroupSpecifierProvider_refreshUsageSpecifiersWithUpdates___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v7 = a2;
  v8 = v7;
  if (*(_QWORD *)(a1 + 64) - 1 == a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    *a4 = 1;
  }
  else
  {
    v9 = *(unsigned __int8 *)(a1 + 80) + a3;
    v14 = v7;
    if (v9 >= *(_QWORD *)(a1 + 72))
    {
      v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "newSpecifierWithUsageItem:", v7);
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "cellType");
      v12 = *(void **)(a1 + 40);
      if (v11 == 13)
      {
        v13 = objc_msgSend(v12, "newSpecifierWithUsageItem:", v14);

        objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v13, v9);
        v10 = (void *)v13;
      }
      else
      {
        objc_msgSend(v12, "updateSpecifier:usageItem:", v10, v14);
        objc_msgSend(*(id *)(a1 + 40), "reloadSpecifier:animated:", v10, 1);
      }
    }

    v8 = v14;
  }

}

- (id)newSpecifierWithUsageItem:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STShowMoreUsageGroupSpecifierProvider.m"), 142, CFSTR("Subclasses must override."));

  return (id)objc_opt_new();
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STShowMoreUsageGroupSpecifierProvider.m"), 147, CFSTR("Subclasses must override."));

}

- (void)showMoreItems:(id)a3
{
  -[STShowMoreUsageGroupSpecifierProvider setTotalNumberOfItemsToShow:](self, "setTotalNumberOfItemsToShow:", -[STShowMoreUsageGroupSpecifierProvider totalNumberOfItemsToShow](self, "totalNumberOfItemsToShow")+ -[STShowMoreUsageGroupSpecifierProvider numberOfItemsToShow](self, "numberOfItemsToShow", a3));
  -[STShowMoreUsageGroupSpecifierProvider refreshUsageSpecifiersWithUpdates:](self, "refreshUsageSpecifiersWithUpdates:", 1);
}

- (PSSpecifier)summarySpecifier
{
  return self->_summarySpecifier;
}

- (NSArray)usageItems
{
  return self->_usageItems;
}

- (unint64_t)numberOfItemsToShow
{
  return self->_numberOfItemsToShow;
}

- (PSSpecifier)showMoreSpecifier
{
  return self->_showMoreSpecifier;
}

- (unint64_t)totalNumberOfItemsToShow
{
  return self->_totalNumberOfItemsToShow;
}

- (void)setTotalNumberOfItemsToShow:(unint64_t)a3
{
  self->_totalNumberOfItemsToShow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showMoreSpecifier, 0);
  objc_storeStrong((id *)&self->_usageItems, 0);
  objc_storeStrong((id *)&self->_summarySpecifier, 0);
}

@end
