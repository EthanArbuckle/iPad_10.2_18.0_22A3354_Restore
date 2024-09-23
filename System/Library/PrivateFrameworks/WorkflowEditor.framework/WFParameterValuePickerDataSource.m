@implementation WFParameterValuePickerDataSource

- (UILocalizedIndexedCollation)localizedCollation
{
  UILocalizedIndexedCollation *localizedCollation;
  UILocalizedIndexedCollation *v4;
  UILocalizedIndexedCollation *v5;

  localizedCollation = self->_localizedCollation;
  if (!localizedCollation)
  {
    objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
    v4 = (UILocalizedIndexedCollation *)objc_claimAutoreleasedReturnValue();
    v5 = self->_localizedCollation;
    self->_localizedCollation = v4;

    localizedCollation = self->_localizedCollation;
  }
  return localizedCollation;
}

- (id)displayVariables
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  -[WFParameterValuePickerDataSource allowedVariableTypes](self, "allowedVariableTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    return 0;
  }
  -[WFParameterValuePickerDataSource variableProvider](self, "variableProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  v5 = (void *)objc_opt_new();
  -[WFParameterValuePickerDataSource allowedVariableTypes](self, "allowedVariableTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BEC4750];
  if ((objc_msgSend(v6, "containsObject:", *MEMORY[0x24BEC4750]) & 1) != 0)
  {
    -[WFParameterValuePickerDataSource variableProvider](self, "variableProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hasAvailableActionOutputVariables") & 1) != 0)
    {
      -[WFParameterValuePickerDataSource variableUIDelegate](self, "variableUIDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v5, "addObject:", v7);
      goto LABEL_11;
    }

  }
LABEL_11:
  -[WFParameterValuePickerDataSource allowedVariableTypes](self, "allowedVariableTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", *MEMORY[0x24BEC4758]);

  if (v12)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", v13);

  }
  -[WFParameterValuePickerDataSource allowedVariableTypes](self, "allowedVariableTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsObject:", *MEMORY[0x24BEC4760]);

  if (v15)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", v16);

  }
  -[WFParameterValuePickerDataSource allowedVariableTypes](self, "allowedVariableTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", *MEMORY[0x24BEC4768]);

  if (v18)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", v19);

  }
  -[WFParameterValuePickerDataSource allowedVariableTypes](self, "allowedVariableTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", *MEMORY[0x24BEC4770]);

  if (v21)
  {
    v22 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", v22);

  }
  -[WFParameterValuePickerDataSource allowedVariableTypes](self, "allowedVariableTypes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", *MEMORY[0x24BEC4780]);

  if (v24)
  {
    -[WFParameterValuePickerDataSource variableProvider](self, "variableProvider");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "availableVariableNames");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __52__WFParameterValuePickerDataSource_displayVariables__block_invoke;
    v28[3] = &unk_24EE24D90;
    v28[4] = self;
    objc_msgSend(v26, "if_map:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v27);

  }
  return v5;
}

- (id)displayVariablesWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[WFParameterValuePickerDataSource displayVariables](self, "displayVariables");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __62__WFParameterValuePickerDataSource_displayVariablesWithTitle___block_invoke;
    v9[3] = &unk_24EE25048;
    v10 = v4;
    objc_msgSend(v6, "if_objectsPassingTest:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (unint64_t)itemsCount
{
  void *v2;
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFParameterValuePickerDataSource;
  -[UITableViewDiffableDataSource snapshot](&v5, sel_snapshot);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfItems");

  return v3;
}

- (unint64_t)sectionsCount
{
  void *v2;
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFParameterValuePickerDataSource;
  -[UITableViewDiffableDataSource snapshot](&v5, sel_snapshot);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (WFParameterValuePickerDataSource)initWithParameter:(id)a3 tableView:(id)a4 cellProvider:(id)a5
{
  id v9;
  WFParameterValuePickerDataSource *v10;
  WFParameterValuePickerDataSource *v11;
  WFParameterValuePickerDataSource *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFParameterValuePickerDataSource;
  v10 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](&v14, sel_initWithTableView_cellProvider_, a4, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameter, a3);
    v12 = v11;
  }

  return v11;
}

- (id)parameterStateAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  -[WFParameterValuePickerDataSource collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v5 >= v8)
  {
    -[WFParameterValuePickerDataSource displayVariables](self, "displayVariables");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "row");

    objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFParameterValuePickerDataSource parameter](self, "parameter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_msgSend(v14, "stateClass");

    v11 = objc_msgSend([v15 alloc], "initWithVariable:", v10);
    goto LABEL_5;
  }
  -[WFParameterValuePickerDataSource collection](self, "collection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wf_itemAtIndexPath:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "value");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v16 = (void *)v11;

    v10 = v16;
  }
  return v10;
}

- (id)snapshotForCollection:(id)a3 filterVariableTitle:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  WFParameterValuePickerDataSource *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BEBD348];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v8, "sections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke;
  v20 = &unk_24EE24A78;
  v11 = v9;
  v21 = v11;
  v22 = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v17);

  -[WFParameterValuePickerDataSource displayVariablesWithTitle:](self, "displayVariablesWithTitle:", v7, v17, v18, v19, v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "variableSectionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendSectionsWithIdentifiers:", v14);

    objc_msgSend(v11, "appendItemsWithIdentifiers:", v12);
  }
  v15 = v11;

  return v15;
}

- (void)applyCollection:(id)a3 animatingDifferences:(BOOL)a4 filterVariableTitle:(id)a5
{
  -[WFParameterValuePickerDataSource applyCollection:animatingDifferences:filterVariableTitle:completion:](self, "applyCollection:animatingDifferences:filterVariableTitle:completion:", a3, a4, a5, 0);
}

- (void)applyCollection:(id)a3 animatingDifferences:(BOOL)a4 filterVariableTitle:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[5];

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  if (objc_msgSend(v12, "usesIndexedCollation"))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __104__WFParameterValuePickerDataSource_applyCollection_animatingDifferences_filterVariableTitle_completion___block_invoke;
    v20[3] = &unk_24EE24AA0;
    v20[4] = self;
    objc_msgSend(v12, "wf_mapItems:", v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFParameterValuePickerDataSource localizedCollation](self, "localizedCollation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wf_localizedIndexedCollationCollectionWithCollation:collationStringSelector:", v14, sel_readableTitle);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "wf_mapItems:", &__block_literal_global_175);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParameterValuePickerDataSource setCollection:](self, "setCollection:", v16);

  }
  else
  {
    -[WFParameterValuePickerDataSource setCollection:](self, "setCollection:", v12);

  }
  -[WFParameterValuePickerDataSource collection](self, "collection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterValuePickerDataSource snapshotForCollection:filterVariableTitle:](self, "snapshotForCollection:filterVariableTitle:", v17, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19.receiver = self;
  v19.super_class = (Class)WFParameterValuePickerDataSource;
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](&v19, sel_applySnapshot_animatingDifferences_completion_, v18, v7, v10);

}

- (void)applyEmptyCollectionAnimatingDifferences:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  objc_super v8;

  v4 = a3;
  v6 = a4;
  -[WFParameterValuePickerDataSource setCollection:](self, "setCollection:", 0);
  v7 = objc_alloc_init(MEMORY[0x24BEBD348]);
  v8.receiver = self;
  v8.super_class = (Class)WFParameterValuePickerDataSource;
  -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](&v8, sel_applySnapshot_animatingDifferences_completion_, v7, v4, v6);

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  -[WFParameterValuePickerDataSource collection](self, "collection", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > a4)
  {
    -[WFParameterValuePickerDataSource collection](self, "collection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v11, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
        objc_msgSend(v11, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

        return v15;
      }
    }
    else
    {

    }
    v15 = 0;
    goto LABEL_8;
  }
  v15 = 0;
  return v15;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[WFParameterValuePickerDataSource collection](self, "collection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "usesIndexedCollation"))
  {
    -[WFParameterValuePickerDataSource localizedCollation](self, "localizedCollation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionIndexTitles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  void *v7;
  int v8;
  void *v9;

  -[WFParameterValuePickerDataSource collection](self, "collection", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "usesIndexedCollation");

  if (v8)
  {
    -[WFParameterValuePickerDataSource localizedCollation](self, "localizedCollation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    a5 = objc_msgSend(v9, "sectionForSectionIndexTitleAtIndex:", a5);

  }
  return a5;
}

- (INObjectCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (WFVariableProvider)variableProvider
{
  return (WFVariableProvider *)objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (void)setVariableProvider:(id)a3
{
  objc_storeWeak((id *)&self->_variableProvider, a3);
}

- (WFVariableUIDelegate)variableUIDelegate
{
  return (WFVariableUIDelegate *)objc_loadWeakRetained((id *)&self->_variableUIDelegate);
}

- (void)setVariableUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_variableUIDelegate, a3);
}

- (NSSet)allowedVariableTypes
{
  return self->_allowedVariableTypes;
}

- (void)setAllowedVariableTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_allowedVariableTypes, 0);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_localizedCollation, 0);
}

WFParameterValueWrapper *__104__WFParameterValuePickerDataSource_applyCollection_animatingDifferences_filterVariableTitle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFParameterValueWrapper *v4;
  void *v5;
  WFParameterValueWrapper *v6;

  v3 = a2;
  v4 = [WFParameterValueWrapper alloc];
  objc_msgSend(*(id *)(a1 + 32), "parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFParameterValueWrapper initWithValue:parameter:](v4, "initWithValue:parameter:", v3, v5);

  return v6;
}

uint64_t __104__WFParameterValuePickerDataSource_applyCollection_animatingDifferences_filterVariableTitle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

void __78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v20[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendSectionsWithIdentifiers:", v6);

  objc_msgSend(v3, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v3, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  objc_msgSend(v3, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 != v13)
  {
    objc_msgSend(v3, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke_2;
    v19[3] = &unk_24EE24A50;
    v19[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v14, "if_map:", v19);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = (void *)MEMORY[0x24BDBD1A8];
    if (v15)
      v17 = (void *)v15;
    v18 = v17;

    v7 = v18;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, v4);

}

WFParameterValueWrapper *__78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  WFParameterValueWrapper *v4;
  void *v5;
  WFParameterValueWrapper *v6;

  v3 = a2;
  v4 = [WFParameterValueWrapper alloc];
  objc_msgSend(*(id *)(a1 + 32), "parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFParameterValueWrapper initWithValue:parameter:](v4, "initWithValue:parameter:", v3, v5);

  return v6;
}

uint64_t __62__WFParameterValuePickerDataSource_displayVariablesWithTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
  }
  else
  {

    if (objc_msgSend(v3, "isEqual:", *MEMORY[0x24BEC4750]))
    {
      WFLocalizedString(CFSTR("Select Magic Variable"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 0;
    }
    else
    {
      v5 = 0;
      v4 = 0;
    }
  }
  v6 = objc_msgSend(v4, "localizedStandardContainsString:", *(_QWORD *)(a1 + 32));

  return v6;
}

id __52__WFParameterValuePickerDataSource_displayVariables__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BEC4140];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "variableProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:variableProvider:aggrandizements:", v4, v6, 0);

  return v7;
}

+ (id)variableSectionIdentifier
{
  if (variableSectionIdentifier_onceToken != -1)
    dispatch_once(&variableSectionIdentifier_onceToken, &__block_literal_global_236);
  return (id)variableSectionIdentifier_variableSectionIdentifier;
}

void __61__WFParameterValuePickerDataSource_variableSectionIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)variableSectionIdentifier_variableSectionIdentifier;
  variableSectionIdentifier_variableSectionIdentifier = v0;

}

@end
