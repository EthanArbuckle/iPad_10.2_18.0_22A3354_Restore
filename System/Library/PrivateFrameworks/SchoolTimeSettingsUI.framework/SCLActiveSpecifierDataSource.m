@implementation SCLActiveSpecifierDataSource

- (SCLActiveSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4
{
  return -[SCLActiveSpecifierDataSource initWithListController:viewModel:options:](self, "initWithListController:viewModel:options:", a3, a4, 0);
}

- (SCLActiveSpecifierDataSource)initWithListController:(id)a3 viewModel:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  SCLActiveSpecifierDataSource *v9;
  SCLScheduleFormatter *v10;
  SCLScheduleFormatter *formatter;
  void *v12;
  void *v13;
  void *v14;
  PSSpecifier *scheduleSpecifier;
  id v16;
  objc_super v18;

  v5 = a5;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SCLActiveSpecifierDataSource;
  v9 = -[SCLSpecifierDataSource initWithListController:viewModel:](&v18, sel_initWithListController_viewModel_, a3, v8);
  if (v9)
  {
    v10 = (SCLScheduleFormatter *)objc_alloc_init(MEMORY[0x24BE841E0]);
    formatter = v9->_formatter;
    v9->_formatter = v10;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLActiveSpecifierDataSource setBundle:](v9, "setBundle:", v12);
    -[SCLActiveSpecifierDataSource setTable:](v9, "setTable:", CFSTR("SchoolTimeSettings"));
    objc_msgSend(MEMORY[0x24BE75598], "loadSpecifiersFromPlist:inBundle:target:stringsTable:", CFSTR("SCLActiveSettings"), v12, v9, CFSTR("SchoolTimeSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLActiveSpecifierDataSource setPermanentSpecifiers:](v9, "setPermanentSpecifiers:", v13);
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24E712518, v9, 0, sel_valueForScheduleSpecifier_, 0, 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", CFSTR("ACTIVE_SCHEDULE_SUMMARY"), *MEMORY[0x24BE75AC0]);
    if ((v5 & 2) == 0)
    {
      objc_msgSend(v14, "setControllerLoadAction:", sel_showEditorForSpecifier_);
      objc_msgSend(v14, "setProperty:forKey:", &unk_24E716C28, *MEMORY[0x24BE75850]);
    }
    objc_msgSend(v14, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    if ((v5 & 1) != 0)
      -[SCLActiveSpecifierDataSource removeFooterText](v9, "removeFooterText");
    scheduleSpecifier = v9->_scheduleSpecifier;
    v9->_scheduleSpecifier = (PSSpecifier *)v14;
    v16 = v14;

    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v9, CFSTR("enabled"), 5, kActiveContext);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v9, CFSTR("scheduleType"), 5, kScheduleTypeContext_0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v9, CFSTR("customSchedule"), 1, kScheduleTypeContext_0);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v9, CFSTR("timeIntervals"), 1, kScheduleTypeContext_0);

  }
  return v9;
}

- (void)removeFooterText
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
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
  -[SCLActiveSpecifierDataSource permanentSpecifiers](self, "permanentSpecifiers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = *MEMORY[0x24BE75A68];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v8, "propertyForKey:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v8, "removePropertyForKey:", v6);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("enabled"), kActiveContext);

  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("scheduleType"), kScheduleTypeContext_0);

  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("customSchedule"), kScheduleTypeContext_0);

  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("timeIntervals"), kScheduleTypeContext_0);

  v7.receiver = self;
  v7.super_class = (Class)SCLActiveSpecifierDataSource;
  -[SCLSpecifierDataSource dealloc](&v7, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)kActiveContext == a6)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    -[SCLActiveSpecifierDataSource permanentSpecifiers](self, "permanentSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[SCLActiveSpecifierDataSource scheduleSpecifier](self, "scheduleSpecifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "arrayByAddingObject:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[SCLSpecifierDataSource setSpecifiers:](self, "setSpecifiers:", v18);
      goto LABEL_9;
    }
    -[SCLSpecifierDataSource setSpecifiers:](self, "setSpecifiers:", v16);
LABEL_8:

    goto LABEL_9;
  }
  if ((void *)kScheduleTypeContext_0 == a6)
  {
    -[SCLActiveSpecifierDataSource scheduleSpecifier](self, "scheduleSpecifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLActiveSpecifierDataSource scheduleSpecifier](self, "scheduleSpecifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLActiveSpecifierDataSource scheduleSummaryForSpecifier:](self, "scheduleSummaryForSpecifier:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setName:", v21);

    -[SCLSpecifierDataSource listController](self, "listController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLActiveSpecifierDataSource scheduleSpecifier](self, "scheduleSpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "reloadSpecifier:animated:", v22, 1);

    goto LABEL_8;
  }
  v23.receiver = self;
  v23.super_class = (Class)SCLActiveSpecifierDataSource;
  -[SCLSpecifierDataSource observeValueForKeyPath:ofObject:change:context:](&v23, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_9:

}

- (id)valueForScheduleSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BE841F0];
  -[SCLSpecifierDataSource viewModel](self, "viewModel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleSettingsWithViewModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLActiveSpecifierDataSource formatter](self, "formatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromSchedule:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)isSchoolTimeActive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SCLSpecifierDataSource viewModel](self, "viewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setSchoolTimeActive:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  id v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

}

- (id)scheduleSummaryForSpecifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_SUMMARY_CELL_TITLE"), &stru_24E712518, CFSTR("SchoolTimeSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)showEditorForSpecifier:(id)a3
{
  SCLDaySettingsSpecifierSource *v4;
  void *v5;
  SCLDaySettingsSpecifierSource *v6;
  void *v7;
  void *v8;
  void *v9;
  SCLListViewController *v10;

  v10 = objc_alloc_init(SCLListViewController);
  -[SCLListViewController setWantsEditingMode:](v10, "setWantsEditingMode:", 1);
  v4 = [SCLDaySettingsSpecifierSource alloc];
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLDaySettingsSpecifierSource initWithListController:viewModel:](v4, "initWithListController:viewModel:", v10, v5);

  -[SCLSpecifierDataSource setActive:](v6, "setActive:", 1);
  -[SCLListViewController setSpecifierSource:](v10, "setSpecifierSource:", v6);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SCHEDULE_EDITOR_TITLE"), &stru_24E712518, CFSTR("SchoolTimeSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLListViewController setTitle:](v10, "setTitle:", v8);

  -[SCLSpecifierDataSource listController](self, "listController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showController:animate:", v10, 1);

}

- (SCLScheduleFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_formatter, a3);
}

- (NSArray)permanentSpecifiers
{
  return self->_permanentSpecifiers;
}

- (void)setPermanentSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_permanentSpecifiers, a3);
}

- (PSSpecifier)scheduleSpecifier
{
  return self->_scheduleSpecifier;
}

- (void)setScheduleSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleSpecifier, a3);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (NSString)table
{
  return self->_table;
}

- (void)setTable:(id)a3
{
  objc_storeStrong((id *)&self->_table, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_scheduleSpecifier, 0);
  objc_storeStrong((id *)&self->_permanentSpecifiers, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
