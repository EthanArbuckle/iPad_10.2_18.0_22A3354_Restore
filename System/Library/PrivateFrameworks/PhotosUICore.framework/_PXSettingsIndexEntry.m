@implementation _PXSettingsIndexEntry

- (_PXSettingsIndexEntry)initWithRowAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v7;
  id v8;
  _PXSettingsIndexEntry *v9;
  _PXSettingsIndexEntry *v10;
  void *v11;
  uint64_t v12;
  NSString *sectionTitle;
  uint64_t v14;
  NSString *rowTitle;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_PXSettingsIndexEntry;
  v9 = -[_PXSettingsIndexEntry init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_indexPath, a3);
    objc_msgSend(v8, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView:titleForHeaderInSection:", v8, objc_msgSend(v7, "section"));
    v12 = objc_claimAutoreleasedReturnValue();
    sectionTitle = v10->_sectionTitle;
    v10->_sectionTitle = (NSString *)v12;

    objc_msgSend((id)objc_opt_class(), "_titleForRowAtIndexPath:inTableView:", v7, v8);
    v14 = objc_claimAutoreleasedReturnValue();
    rowTitle = v10->_rowTitle;
    v10->_rowTitle = (NSString *)v14;

  }
  return v10;
}

- (NSString)subtitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXSettingsIndexEntry parentEntry](self, "parentEntry");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v5, "sectionTitle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "rowTitle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) %@"), v6, v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = v7;
      }
      v9 = v8;
      objc_msgSend(v3, "insertObject:atIndex:", v8, 0);
      objc_msgSend(v5, "parentEntry");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
    while (v10);
  }
  -[_PXSettingsIndexEntry sectionTitle](self, "sectionTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" → "));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)matchesSearchString:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_PXSettingsIndexEntry rowTitle](self, "rowTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "localizedStandardContainsString:", v4);

  return v6;
}

- (void)revealInSettingsController:(id)a3 withCompletionHandler:(id)a4
{
  -[_PXSettingsIndexEntry _revealInSettingsController:drillIn:withCompletionHandler:](self, "_revealInSettingsController:drillIn:withCompletionHandler:", a3, 0, a4);
}

- (void)_revealInSettingsController:(id)a3 drillIn:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[_PXSettingsIndexEntry parentEntry](self, "parentEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83___PXSettingsIndexEntry__revealInSettingsController_drillIn_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E511E828;
    v12[4] = self;
    v13 = v8;
    v15 = v6;
    v14 = v9;
    objc_msgSend(v10, "_revealInSettingsController:drillIn:withCompletionHandler:", v13, 1, v12);

  }
  else
  {
    v11 = (id)objc_msgSend(v8, "popToRootViewControllerAnimated:", 0);
    -[_PXSettingsIndexEntry _revealInTopOfSettingsController:drillIn:withCompletionHandler:](self, "_revealInTopOfSettingsController:drillIn:withCompletionHandler:", v8, v6, v9);
  }

}

- (void)_revealInTopOfSettingsController:(id)a3 drillIn:(BOOL)a4 withCompletionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id *v20;
  void *v21;
  dispatch_time_t v22;
  _QWORD block[4];
  id v24;
  _QWORD v25[4];
  void (**v26)(id, _QWORD);
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v8, "topViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXSettingsIndexEntry indexPath](self, "indexPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "section");
  if (v13 > objc_msgSend(v10, "numberOfSectionsInTableView:", v11))
    goto LABEL_7;
  v14 = objc_msgSend(v12, "row");
  if (v14 > objc_msgSend(v10, "tableView:numberOfRowsInSection:", v11, objc_msgSend(v12, "section")))
    goto LABEL_7;
  objc_msgSend(v11, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 2, 0);
  objc_msgSend((id)objc_opt_class(), "_titleForRowAtIndexPath:inTableView:", v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXSettingsIndexEntry rowTitle](self, "rowTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (!v17)
  {
    -[_PXSettingsIndexEntry rowTitle](self, "rowTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Settings search warning: title doesn't match anymore for %@: '%@' vs '%@'"), v12, v15, v21);

LABEL_7:
    v9[2](v9, 0);
    goto LABEL_8;
  }
  objc_msgSend((id)objc_opt_class(), "_cellForRowAtIndexPath:inTableView:", v12, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v19 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke;
    v27[3] = &unk_1E51457C8;
    v20 = &v28;
    v28 = v11;
    v29 = v12;
    v30 = v10;
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_2;
    v25[3] = &unk_1E5148A40;
    v26 = v9;
    objc_msgSend(v8, "px_performWithoutAnimations:completionHandler:", v27, v25);

  }
  else
  {
    v9[2](v9, 1);
    v22 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __88___PXSettingsIndexEntry__revealInTopOfSettingsController_drillIn_withCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5149198;
    v20 = &v24;
    v24 = v18;
    dispatch_after(v22, MEMORY[0x1E0C80D38], block);
  }

LABEL_8:
}

- (_PXSettingsIndexEntry)parentEntry
{
  return (_PXSettingsIndexEntry *)objc_loadWeakRetained((id *)&self->_parentEntry);
}

- (void)setParentEntry:(id)a3
{
  objc_storeWeak((id *)&self->_parentEntry, a3);
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (NSString)rowTitle
{
  return self->_rowTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowTitle, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_parentEntry);
}

+ (id)_cellForRowAtIndexPath:(id)a3 inTableView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 0, 0);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tableView:cellForRowAtIndexPath:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)_titleForRowAtIndexPath:(id)a3 inTableView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_cellForRowAtIndexPath:inTableView:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
