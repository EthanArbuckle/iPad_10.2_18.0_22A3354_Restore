@implementation STSegmentedControlGroupSpecifierProvider

- (STSegmentedControlGroupSpecifierProvider)init
{
  STSegmentedControlGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STSegmentedControlGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v9, sel_init);
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v5);

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75AA0]);

  objc_msgSend(v3, "setTarget:", v2);
  objc_msgSend(v3, "setButtonAction:", sel__selectedSegmentIndexChanged_);
  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v3);

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedDay"), "KVOContextSegmentedControlGroupSpecifierProvider");
  v6.receiver = self;
  v6.super_class = (Class)STSegmentedControlGroupSpecifierProvider;
  -[STUsageGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedDay"), 5, "KVOContextSegmentedControlGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a5;
  if (a6 == "KVOContextSegmentedControlGroupSpecifierProvider")
  {
    v12 = a3;
    -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedDay"));
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STSegmentedControlGroupSpecifierProvider _selectedDayDidChange:](self, "_selectedDayDidChange:", v14);

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STSegmentedControlGroupSpecifierProvider;
    v11 = a3;
    -[STSegmentedControlGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)_selectedDayDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[STGroupSpecifierProvider groupSpecifier](self, "groupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75AB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "unsignedIntegerValue") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "segmentedControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "segmentedControl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(v6, "setSelectedSegmentIndex:", v8);

}

- (void)_selectedSegmentIndexChanged:(id)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = objc_msgSend(a3, "selectedSegmentIndex");
  if (v5 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STSegmentedControlGroupSpecifierProvider.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(selectedSegmentIndex == STUsageReportTypeDay) || (selectedSegmentIndex == STUsageReportTypeWeek)"));

  }
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "usageDetailsCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v10, "setSelectedDay:", 0x7FFFFFFFFFFFFFFFLL);
    goto LABEL_7;
  }
  v8 = v10;
  if (v5 == 1)
  {
    objc_msgSend(v10, "selectToday");
LABEL_7:
    v8 = v10;
  }

}

@end
