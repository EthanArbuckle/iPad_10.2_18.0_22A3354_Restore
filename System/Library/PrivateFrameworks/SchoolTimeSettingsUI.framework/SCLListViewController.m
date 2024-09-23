@implementation SCLListViewController

- (SCLListViewController)init
{
  SCLListViewController *v2;
  SCLListViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCLListViewController;
  v2 = -[SCLListViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SCLListViewController addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("specifierSource.allSpecifiers"), 3, kAllSpecifiersContext);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SCLListViewController removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("specifierSource.allSpecifiers"), kAllSpecifiersContext);
  v3.receiver = self;
  v3.super_class = (Class)SCLListViewController;
  -[SCLListViewController dealloc](&v3, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[SCLListViewController specifierSource](self, "specifierSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      -[SCLListViewController loadSpecifierSource](self, "loadSpecifierSource");
    -[SCLListViewController specifierSource](self, "specifierSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "allSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {

      v7 = (void *)MEMORY[0x24BDBD1A8];
    }
    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v7;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCLListViewController;
  -[SCLListViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SCLListViewController reevaluateEditingMode](self, "reevaluateEditingMode");
}

- (void)setWantsEditingMode:(BOOL)a3
{
  if (self->_wantsEditingMode != a3)
  {
    self->_wantsEditingMode = a3;
    -[SCLListViewController reevaluateEditingMode](self, "reevaluateEditingMode");
  }
}

- (void)reevaluateEditingMode
{
  void *v3;
  id v4;

  if (-[SCLListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[SCLListViewController table](self, "table");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEditing:", -[SCLListViewController wantsEditingMode](self, "wantsEditingMode"));

    -[SCLListViewController table](self, "table");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsSelectionDuringEditing:", -[SCLListViewController wantsEditingMode](self, "wantsEditingMode"));

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a5;
  v11 = v10;
  if ((void *)kAllSpecifiersContext == a6)
  {
    v12 = *MEMORY[0x24BDD0E80];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v14)
    {
      v15 = *MEMORY[0x24BDD0E70];
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 != v17)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLListViewController beginUpdates](self, "beginUpdates");
        -[SCLListViewController pendingUpdateStartSpecifiers](self, "pendingUpdateStartSpecifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          -[SCLListViewController setPendingUpdateStartSpecifiers:](self, "setPendingUpdateStartSpecifiers:", v18);
        -[SCLListViewController setPendingUpdateEndSpecifiers:](self, "setPendingUpdateEndSpecifiers:", v19);
        -[SCLListViewController endUpdates](self, "endUpdates");

      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)SCLListViewController;
    -[SCLListViewController observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCLListViewController;
  v6 = a4;
  v7 = a3;
  -[SCLListViewController tableView:didSelectRowAtIndexPath:](&v10, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  -[SCLListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v10.receiver, v10.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLListViewController specifierSource](self, "specifierSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tableView:didSelectRowAtIndexPath:specifier:", v7, v6, v8);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[SCLListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SCLListControllerEditingEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[SCLListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SCLListControllerCellEditingStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  -[SCLListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SCLListControllerTrailingSwipeActionsConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return a4;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v5;
  id v6;

  -[SCLListViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", a5, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SCLListControllerCellEditingStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue") == 2 && objc_msgSend(v6, "buttonAction"))
    objc_msgSend(v6, "performButtonAction");

}

- (void)beginUpdates
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCLListViewController;
  -[SCLListViewController beginUpdates](&v3, sel_beginUpdates);
  -[SCLListViewController setUpdateCount:](self, "setUpdateCount:", -[SCLListViewController updateCount](self, "updateCount") + 1);
}

- (void)endUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  SCLListViewController *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  SCLListViewController *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  -[SCLListViewController setUpdateCount:](self, "setUpdateCount:", -[SCLListViewController updateCount](self, "updateCount") - 1);
  if (!-[SCLListViewController updateCount](self, "updateCount"))
  {
    -[SCLListViewController pendingUpdateStartSpecifiers](self, "pendingUpdateStartSpecifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLListViewController pendingUpdateEndSpecifiers](self, "pendingUpdateEndSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLListViewController setPendingUpdateStartSpecifiers:](self, "setPendingUpdateStartSpecifiers:", 0);
    -[SCLListViewController setPendingUpdateEndSpecifiers:](self, "setPendingUpdateEndSpecifiers:", 0);
    if (v3 && v4)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "minusSet:", v6);

      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "minusSet:", v8);

      objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x24BDAC760];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __35__SCLListViewController_endUpdates__block_invoke;
      v22[3] = &unk_24E712388;
      v23 = v5;
      v24 = v9;
      v11 = v9;
      v12 = v5;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v22);
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __35__SCLListViewController_endUpdates__block_invoke_2;
      v19[3] = &unk_24E7123B0;
      v20 = v3;
      v21 = self;
      objc_msgSend(v11, "enumerateRangesUsingBlock:", v19);
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __35__SCLListViewController_endUpdates__block_invoke_3;
      v15[3] = &unk_24E7123D8;
      v16 = v7;
      v17 = self;
      v18 = v4;
      v13 = v7;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v15);

    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SCLListViewController;
  -[SCLListViewController endUpdates](&v14, sel_endUpdates);
}

uint64_t __35__SCLListViewController_endUpdates__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  return result;
}

void __35__SCLListViewController_endUpdates__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "removeContiguousSpecifiers:animated:", v4, 1);

}

void __35__SCLListViewController_endUpdates__block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    v5 = a1[5];
    if (a3)
    {
      objc_msgSend(a1[6], "objectAtIndexedSubscript:", a3 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertSpecifier:afterSpecifier:", v7, v6);

    }
    else
    {
      objc_msgSend(a1[5], "insertSpecifier:atIndex:", v7, 0);
    }
  }

}

- (SCLSpecifierDataSource)specifierSource
{
  return self->_specifierSource;
}

- (void)setSpecifierSource:(id)a3
{
  objc_storeStrong((id *)&self->_specifierSource, a3);
}

- (BOOL)wantsEditingMode
{
  return self->_wantsEditingMode;
}

- (int64_t)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(int64_t)a3
{
  self->_updateCount = a3;
}

- (NSArray)pendingUpdateStartSpecifiers
{
  return self->_pendingUpdateStartSpecifiers;
}

- (void)setPendingUpdateStartSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1400);
}

- (NSArray)pendingUpdateEndSpecifiers
{
  return self->_pendingUpdateEndSpecifiers;
}

- (void)setPendingUpdateEndSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdateEndSpecifiers, 0);
  objc_storeStrong((id *)&self->_pendingUpdateStartSpecifiers, 0);
  objc_storeStrong((id *)&self->_specifierSource, 0);
}

@end
