@implementation SCLCustomDayEditorSource

- (SCLCustomDayEditorSource)initWithListController:(id)a3 viewModel:(id)a4 day:(int64_t)a5 title:(id)a6
{
  id v9;
  id v10;
  id v11;
  SCLCustomDayEditorSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SCLTimeIntervalDataSource *v18;
  SCLTimeIntervalDataSource *timeSource;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[2];
  SCLTimeIntervalDataSource *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SCLCustomDayEditorSource;
  v12 = -[SCLSpecifierDataSource initWithListController:viewModel:](&v23, sel_initWithListController_viewModel_, v9, v10);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CUSTOM_DAY_ENABLED_GROUP"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v12, sel_setEnabled_specifier_, sel_enabledForSpecifier_, 0, 6, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setProperty:forKey:", CFSTR("CUSTOM_DAY_ENABLED_CELL"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v10, "timeIntervals");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "count"))
    {
      +[SCLTimeIntervalModel defaultTimeInterval](SCLTimeIntervalModel, "defaultTimeInterval");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
    v18 = -[SCLTimeIntervalDataSource initWithListController:timeIntervals:]([SCLTimeIntervalDataSource alloc], "initWithListController:timeIntervals:", v9, v15);
    timeSource = v12->_timeSource;
    v12->_timeSource = v18;

    -[SCLTimeIntervalDataSource setDelegate:](v12->_timeSource, "setDelegate:", v12);
    -[SCLSpecifierDataSource setActive:](v12->_timeSource, "setActive:", objc_msgSend(v10, "isEnabled"));
    v25 = v12->_timeSource;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSpecifierDataSource setChildDataSources:](v12, "setChildDataSources:", v20);

    v24[0] = v13;
    v24[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSpecifierDataSource setSpecifiers:](v12, "setSpecifiers:", v21);

  }
  return v12;
}

- (id)enabledForSpecifier:(id)a3
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

- (void)setEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  -[SCLCustomDayEditorSource timeSource](self, "timeSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", v5);

}

- (void)timeIntervalDataSource:(id)a3 didUpdateTimeIntervals:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SCLSpecifierDataSource viewModel](self, "viewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeIntervals:", v5);

}

- (int64_t)day
{
  return self->_day;
}

- (SCLTimeIntervalDataSource)timeSource
{
  return self->_timeSource;
}

- (void)setTimeSource:(id)a3
{
  objc_storeStrong((id *)&self->_timeSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSource, 0);
}

@end
