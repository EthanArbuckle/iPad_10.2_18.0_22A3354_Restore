@implementation STListViewController

- (STListViewController)init
{
  STListViewController *v3;
  uint64_t v4;
  NSMutableDictionary *cellHeightBySpecifierIdentifier;
  STListViewController *v6;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)STListViewController;
    v3 = -[STListViewController init](&v8, sel_init);
    if (v3)
    {
      v4 = objc_opt_new();
      cellHeightBySpecifierIdentifier = v3->_cellHeightBySpecifierIdentifier;
      v3->_cellHeightBySpecifierIdentifier = (NSMutableDictionary *)v4;

    }
    self = v3;
    v6 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[STListViewController init].cold.1();
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[STListViewController specifierProviders](self, "specifierProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[STListViewController removeObserversForSpecifierProvider:](self, "removeObserversForSpecifierProvider:", v8);
        objc_msgSend(v8, "invalidate");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)STListViewController;
  -[STListViewController dealloc](&v9, sel_dealloc);
}

- (void)setSpecifierProviders:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSArray *v10;
  NSArray *specifierProviders;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[STListViewController addObserversForSpecifierProvider:](self, "addObserversForSpecifierProvider:", v9);
        objc_msgSend(v9, "setDelegate:", self);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  v10 = (NSArray *)objc_msgSend(v4, "copy");
  specifierProviders = self->_specifierProviders;
  self->_specifierProviders = v10;

}

- (id)visibleSpecifierProviders
{
  void *v2;
  void *v3;
  void *v4;

  -[STListViewController specifierProviders](self, "specifierProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("isHidden"), MEMORY[0x24BDBD1C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[STListViewController specifierProviders](self, "specifierProviders", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isHidden") & 1) == 0)
          {
            objc_msgSend(v11, "groupSpecifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

            objc_msgSend(v11, "specifiers");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)addObserversForSpecifierProvider:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("isHidden"), 0, "STListViewControllerObservationContext");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("specifiers"), 3, "STListViewControllerObservationContext");

}

- (void)removeObserversForSpecifierProvider:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("specifiers"), "STListViewControllerObservationContext");
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("isHidden"), "STListViewControllerObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[6];
  _QWORD v46[4];
  id v47;
  STListViewController *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  objc_super v61;
  _BYTE v62[128];
  _QWORD v63[4];

  v63[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a6 == "STListViewControllerObservationContext")
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("isHidden")))
    {
      v14 = v12;
      objc_msgSend(v14, "groupSpecifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "specifiers");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "isHidden") & 1) != 0)
      {
        -[STListViewController beginUpdates](self, "beginUpdates");
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v51 != v21)
                objc_enumerationMutation(v19);
              -[STListViewController removeSpecifier:animated:](self, "removeSpecifier:animated:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i), 1);
            }
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          }
          while (v20);
        }

        -[STListViewController endUpdates](self, "endUpdates");
      }
      else
      {
        -[STListViewController specifierProviders](self, "specifierProviders");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "indexOfObject:", v14);
        v32 = v31;
        v55 = 0;
        v56 = &v55;
        v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__3;
        v59 = __Block_byref_object_dispose__3;
        v60 = 0;
        if (!v31)
          goto LABEL_27;
        if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STListViewController.m"), 115, CFSTR("Unknown specifierProvider: %@ is not in: %@"), v14, v30);

        }
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 0, v32);
        v54[0] = MEMORY[0x24BDAC760];
        v54[1] = 3221225472;
        v54[2] = __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v54[3] = &unk_24DB87500;
        v54[4] = &v55;
        objc_msgSend(v30, "enumerateObjectsAtIndexes:options:usingBlock:", v33, 2, v54);

        v34 = v56[5];
        if (v34)
          -[STListViewController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v18, v34, 1);
        else
LABEL_27:
          -[STListViewController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v18, 0, 1);
        _Block_object_dispose(&v55, 8);

      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("specifiers")))
    {
      v23 = v12;
      if ((objc_msgSend(v23, "isHidden") & 1) == 0)
      {
        if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]))
        {
          objc_msgSend(v23, "specifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "groupSpecifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[STListViewController indexOfSpecifier:](self, "indexOfSpecifier:", v25);

          objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E68]);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "unsignedIntegerValue");

          objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E60]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          switch(v28)
          {
            case 4:
              objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[STListViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v36, v37, 1);

              break;
            case 3:
              if (v26 == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "groupSpecifier");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[STListViewController specifiers](self, "specifiers");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STListViewController.m"), 173, CFSTR("Unknown removed provider: %@ whose group specifier: %@ is not in: %@"), v23, v42, v40);

              }
              -[STListViewController beginUpdates](self, "beginUpdates");
              v45[0] = MEMORY[0x24BDAC760];
              v45[1] = 3221225472;
              v45[2] = __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
              v45[3] = &unk_24DB87550;
              v45[4] = self;
              v45[5] = v26 + 1;
              objc_msgSend(v29, "enumerateRangesWithOptions:usingBlock:", 2, v45);
              -[STListViewController endUpdates](self, "endUpdates");
              break;
            case 2:
              if (v26 == 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "groupSpecifier");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[STListViewController specifiers](self, "specifiers");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STListViewController.m"), 160, CFSTR("Unknown added provider: %@ whose group specifier: %@ is not in: %@"), v23, v41, v39);

              }
              -[STListViewController beginUpdates](self, "beginUpdates");
              v46[0] = MEMORY[0x24BDAC760];
              v46[1] = 3221225472;
              v46[2] = __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
              v46[3] = &unk_24DB87528;
              v47 = v24;
              v48 = self;
              v49 = v26 + 1;
              objc_msgSend(v29, "enumerateRangesUsingBlock:", v46);
              -[STListViewController endUpdates](self, "endUpdates");

              break;
          }

        }
        else
        {
          v35 = -[STListViewController specifiers](self, "specifiers");
        }
      }

    }
  }
  else
  {
    v61.receiver = self;
    v61.super_class = (Class)STListViewController;
    -[STListViewController observeValueForKeyPath:ofObject:change:context:](&v61, sel_observeValueForKeyPath_ofObject_change_context_, v11, v12, v13, a6);
  }

}

void __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v6 = objc_msgSend(v11, "isHidden");
  v7 = v11;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(v11, "specifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(v11, "groupSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v10);
    if (!v9)

    *a4 = 1;
    v7 = v11;
  }

}

void __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "insertContiguousSpecifiers:atIndex:animated:", v5, *(_QWORD *)(a1 + 48) + a2, 1);

}

void __71__STListViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", *(_QWORD *)(a1 + 40) + a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "specifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "removeContiguousSpecifiers:animated:", v5, 1);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STListViewController;
  -[STListViewController tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setParentViewController:", self);
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  CGRect v21;

  v7 = a4;
  -[STListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v7, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  objc_msgSend(v8, "numberWithDouble:", CGRectGetHeight(v21));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[STListViewController cellHeightBySpecifierIdentifier](self, "cellHeightBySpecifierIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)STListViewController;
  -[STListViewController tableView:estimatedHeightForRowAtIndexPath:](&v17, sel_tableView_estimatedHeightForRowAtIndexPath_, a3, v6);
  v8 = v7;
  v9 = *MEMORY[0x24BEBE770];
  if (v7 == *MEMORY[0x24BEBE770])
  {
    -[STListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      -[STListViewController cellHeightBySpecifierIdentifier](self, "cellHeightBySpecifierIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "doubleValue");
        v9 = v15;
      }

    }
    v8 = v9;
  }

  return v8;
}

- (void)specifierProvider:(id)a3 showController:(id)a4 animated:(BOOL)a5
{
  -[STListViewController showController:animate:](self, "showController:animate:", a4, a5);
}

- (void)specifierProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5
{
  -[STListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, 0);
}

- (void)specifierProvider:(id)a3 dismissViewControllerAnimated:(BOOL)a4
{
  -[STListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a4, 0);
}

- (void)specifierProvider:(id)a3 reloadSpecifier:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];

  v5 = a5;
  v20 = a4;
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = ceil(v9);
  v12 = ceil(v11);

  -[STListViewController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v20, v5);
  objc_msgSend(v7, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "systemLayoutSizeFittingSize:", v10, *(double *)(MEMORY[0x24BEBE588] + 8));
  v15 = ceil(v14);

  if (v7)
    v16 = v12 == v15;
  else
    v16 = 1;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STListViewController cellHeightBySpecifierIdentifier](self, "cellHeightBySpecifierIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

    if (v5)
    {
      -[STListViewController beginUpdates](self, "beginUpdates");
      -[STListViewController endUpdates](self, "endUpdates");
    }
    else
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __67__STListViewController_specifierProvider_reloadSpecifier_animated___block_invoke;
      v21[3] = &unk_24DB86440;
      v21[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v21);
    }
  }

}

uint64_t __67__STListViewController_specifierProvider_reloadSpecifier_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginUpdates");
  return objc_msgSend(*(id *)(a1 + 32), "endUpdates");
}

- (void)specifierProvider:(id)a3 reloadSectionHeaderFootersWithAnimation:(int64_t)a4
{
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = 0;
  objc_msgSend(a3, "groupSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STListViewController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v11, 0, v6);

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD15E0]);
    v9 = (void *)objc_msgSend(v8, "initWithIndex:", v11);
    -[STListViewController table](self, "table");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_reloadSectionHeaderFooters:withRowAnimation:", v9, a4);

  }
}

- (void)specifierProvider:(id)a3 showConfirmationViewForSpecifier:(id)a4
{
  -[STListViewController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", a4);
}

- (void)specifierProvider:(id)a3 popToViewControllerAnimated:(BOOL)a4
{
  -[UIViewController popViewControllerAnimated:](self, "popViewControllerAnimated:", a4);
}

- (void)specifierProvider:(id)a3 presentViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[STListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, a5, a6);
}

- (void)specifierProvider:(id)a3 lazyLoadBundle:(id)a4
{
  -[STListViewController lazyLoadBundle:](self, "lazyLoadBundle:", a4);
}

- (void)specifierProvider:(id)a3 showPINSheet:(id)a4
{
  -[STListViewController showPINSheet:](self, "showPINSheet:", a4);
}

- (NSArray)specifierProviders
{
  return self->_specifierProviders;
}

- (NSMutableDictionary)cellHeightBySpecifierIdentifier
{
  return self->_cellHeightBySpecifierIdentifier;
}

- (void)setCellHeightBySpecifierIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cellHeightBySpecifierIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellHeightBySpecifierIdentifier, 0);
  objc_storeStrong((id *)&self->_specifierProviders, 0);
}

- (void)init
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "You shouldn't instantiate this STListViewController from a background thread", v0, 2u);
}

@end
