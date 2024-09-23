@implementation STHistoricalUsageViewController

+ (id)historicalUsageViewControllerOfType:(unint64_t)a3 graphHeight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = (void *)MEMORY[0x24BEBD9A0];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storyboardWithName:bundle:", CFSTR("HistoricalUsage"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "instantiateInitialViewController");
  v9 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v9 + 992) = a3;
  *(double *)(v9 + 1000) = a4;

  return (id)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[STUsageDetailsViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.selectedWeekUsageReport"), "KVOContextHistoricalUsageViewController");
  -[STUsageDetailsViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.selectedDayUsageReport"), "KVOContextHistoricalUsageViewController");
  -[STUsageDetailsViewModelCoordinator removeObserver:forKeyPath:context:](self->_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.selectedCoreDuetIdentifier"), "KVOContextHistoricalUsageViewController");
  -[STUsageGraphViewController removeObserver:forKeyPath:context:](self->_selectedWeekGraphViewController, "removeObserver:forKeyPath:context:", self, CFSTR("selectedBarView"), "KVOContextHistoricalUsageViewController");
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalUsageViewController;
  -[STHistoricalUsageViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STHistoricalUsageViewController;
  -[STHistoricalUsageViewController viewDidLoad](&v10, sel_viewDidLoad);
  v3 = -[STHistoricalUsageViewController type](self, "type");
  -[STHistoricalUsageViewController titleView](self, "titleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsageItemType:", v3);

  -[STHistoricalUsageViewController coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "selectedWeekUsageReport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STHistoricalUsageViewController _selectedWeekUsageReportDidChange:](self, "_selectedWeekUsageReportDidChange:", v7);

    objc_msgSend(v6, "selectedDayUsageReport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STHistoricalUsageViewController _selectedDayUsageReportDidChangeFrom:to:](self, "_selectedDayUsageReportDidChangeFrom:to:", 0, v8);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STHistoricalUsageViewController.viewDidLoad", v9, 2u);
  }

}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("WeekGraph")))
  {
    objc_msgSend(v7, "destinationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataSource:", self);
    objc_msgSend(v6, "setDelegate:", self);
    -[STHistoricalUsageViewController setWeekGraphPageViewController:](self, "setWeekGraphPageViewController:", v6);
LABEL_5:

    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("DayGraph")))
  {
    objc_msgSend(v7, "destinationViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataSource:", self);
    objc_msgSend(v6, "setDelegate:", self);
    -[STHistoricalUsageViewController setDayGraphPageViewController:](self, "setDayGraphPageViewController:", v6);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setCoordinator:(id)a3
{
  STUsageDetailsViewModelCoordinator *v5;
  STUsageDetailsViewModelCoordinator **p_coordinator;
  STUsageDetailsViewModelCoordinator *coordinator;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  STUsageDetailsViewModelCoordinator *v13;

  v5 = (STUsageDetailsViewModelCoordinator *)a3;
  p_coordinator = &self->_coordinator;
  coordinator = self->_coordinator;
  if (coordinator != v5)
  {
    v13 = v5;
    v8 = -[STUsageDetailsViewModelCoordinator isEqual:](coordinator, "isEqual:", v5);
    v5 = v13;
    if ((v8 & 1) == 0)
    {
      -[STUsageDetailsViewModelCoordinator removeObserver:forKeyPath:context:](*p_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.selectedWeekUsageReport"), "KVOContextHistoricalUsageViewController");
      -[STUsageDetailsViewModelCoordinator removeObserver:forKeyPath:context:](*p_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.selectedDayUsageReport"), "KVOContextHistoricalUsageViewController");
      -[STUsageDetailsViewModelCoordinator removeObserver:forKeyPath:context:](*p_coordinator, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.selectedCoreDuetIdentifier"), "KVOContextHistoricalUsageViewController");
      -[STUsageDetailsViewModelCoordinator viewModel](*p_coordinator, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedDayUsageReport");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&self->_coordinator, a3);
      -[STUsageDetailsViewModelCoordinator viewModel](v13, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "selectedDayUsageReport");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[STUsageDetailsViewModelCoordinator addObserver:forKeyPath:options:context:](v13, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.selectedWeekUsageReport"), 5, "KVOContextHistoricalUsageViewController");
      -[STHistoricalUsageViewController _selectedDayUsageReportDidChangeFrom:to:](self, "_selectedDayUsageReportDidChangeFrom:to:", v10, v12);
      -[STUsageDetailsViewModelCoordinator addObserver:forKeyPath:options:context:](v13, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.selectedDayUsageReport"), 3, "KVOContextHistoricalUsageViewController");
      -[STUsageDetailsViewModelCoordinator addObserver:forKeyPath:options:context:](v13, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.selectedCoreDuetIdentifier"), 3, "KVOContextHistoricalUsageViewController");

      v5 = v13;
    }
  }

}

- (void)setSelectedWeekGraphViewController:(id)a3
{
  STUsageGraphViewController *v4;
  STUsageGraphViewController *selectedWeekGraphViewController;
  STUsageGraphViewController *v6;

  v4 = (STUsageGraphViewController *)a3;
  -[STUsageGraphViewController removeObserver:forKeyPath:context:](self->_selectedWeekGraphViewController, "removeObserver:forKeyPath:context:", self, CFSTR("selectedBarView"), "KVOContextHistoricalUsageViewController");
  selectedWeekGraphViewController = self->_selectedWeekGraphViewController;
  self->_selectedWeekGraphViewController = v4;
  v6 = v4;

  -[STUsageGraphViewController addObserver:forKeyPath:options:context:](v6, "addObserver:forKeyPath:options:context:", self, CFSTR("selectedBarView"), 3, "KVOContextHistoricalUsageViewController");
}

- (void)setMaximumYAxisLabelWidth:(double)a3
{
  void *v5;
  id v6;

  self->_maximumYAxisLabelWidth = a3;
  -[STHistoricalUsageViewController selectedWeekGraphViewController](self, "selectedWeekGraphViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setYAxisLabelSectionWidth:", a3);

  -[STHistoricalUsageViewController selectedDayGraphViewController](self, "selectedDayGraphViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setYAxisLabelSectionWidth:", a3);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextHistoricalUsageViewController")
  {
    -[STHistoricalUsageViewController coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.selectedCoreDuetIdentifier")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v14)
      {

        v12 = 0;
      }
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v15)
      {

        v13 = 0;
      }
      if (v12 != v13 && (objc_msgSend(v12, "isEqual:", v13) & 1) == 0)
      {
        -[STHistoricalUsageViewController setSelectedWeekGraphViewController:](self, "setSelectedWeekGraphViewController:", 0);
        -[STHistoricalUsageViewController setSelectedDayGraphViewController:](self, "setSelectedDayGraphViewController:", 0);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v23 = v12;
          v24 = 2114;
          v25 = v13;
          _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STHistoricalUsageViewController selectedCoreDuetIdentifier change %{public}@ %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      -[STHistoricalUsageViewController coordinator](self, "coordinator");

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.selectedWeekUsageReport")))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v16)
        {

          v12 = 0;
        }
        -[STHistoricalUsageViewController _selectedWeekUsageReportDidChange:](self, "_selectedWeekUsageReportDidChange:", v12);
        goto LABEL_29;
      }
      -[STHistoricalUsageViewController coordinator](self, "coordinator");

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("viewModel.selectedDayUsageReport")))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v17)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v18)
        {

          v13 = 0;
        }
        -[STHistoricalUsageViewController _selectedDayUsageReportDidChangeFrom:to:](self, "_selectedDayUsageReportDidChangeFrom:to:", v12, v13);
      }
      else
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("selectedBarView")))
          goto LABEL_30;
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v19)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13 == v20)
        {

          v13 = 0;
        }
        -[STHistoricalUsageViewController _selectedBarViewDidChangeFrom:to:](self, "_selectedBarViewDidChangeFrom:to:", v12, v13);
      }
    }

LABEL_29:
    goto LABEL_30;
  }
  v21.receiver = self;
  v21.super_class = (Class)STHistoricalUsageViewController;
  -[STHistoricalUsageViewController observeValueForKeyPath:ofObject:change:context:](&v21, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_30:

}

- (void)_selectedWeekUsageReportDidChange:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  _DWORD v18[4];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[STHistoricalUsageViewController isViewLoaded](self, "isViewLoaded");
  if (v4 && v5)
  {
    -[STHistoricalUsageViewController selectedWeekGraphViewController](self, "selectedWeekGraphViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "week");
    else
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    -[STHistoricalUsageViewController coordinator](self, "coordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "selectedDay") == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[STHistoricalUsageViewController titleView](self, "titleView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUsageReport:", v4);

    }
    v12 = objc_msgSend(v10, "selectedWeek");
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 != v12)
    {
      v15 = v12 > v8;
      -[STHistoricalUsageViewController _weekGraphViewControllerForWeek:usageReport:](self, "_weekGraphViewControllerForWeek:usageReport:", v12, v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[STHistoricalUsageViewController setSelectedWeekGraphViewController:](self, "setSelectedWeekGraphViewController:", v14);
      -[STHistoricalUsageViewController weekGraphPageViewController](self, "weekGraphPageViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setViewControllers:direction:animated:completion:", v17, v15, v8 != 0x7FFFFFFFFFFFFFFFLL, 0);

      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 67109120;
        v18[1] = v8 == 0x7FFFFFFFFFFFFFFFLL;
        _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STHistoricalUsageViewController _selectedWeekUsageReportDidChange setViewControllers, isInitialLoad : %d", (uint8_t *)v18, 8u);
      }
    }
    else
    {
      -[STHistoricalUsageViewController _dataSetFromUsageReport:](self, "_dataSetFromUsageReport:", v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDataSet:animated:", v13, 1);

      v14 = v7;
    }
    objc_msgSend(v14, "setSelectedWeekday:", objc_msgSend(v10, "selectedDay"));

  }
}

- (void)_selectedDayUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[STHistoricalUsageViewController isViewLoaded](self, "isViewLoaded")
    && (objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    -[STHistoricalUsageViewController selectedDayGraphViewController](self, "selectedDayGraphViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_14:
      -[STHistoricalUsageViewController dayGraphContainerView](self, "dayGraphContainerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setHidden:", v7 == 0);

      -[STHistoricalUsageViewController setCurrentViewMode:](self, "setCurrentViewMode:", v7 != 0);
      -[STHistoricalUsageViewController setSelectedDayGraphViewController:](self, "setSelectedDayGraphViewController:", v8);

      goto LABEL_15;
    }
    -[STHistoricalUsageViewController titleView](self, "titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUsageReport:", v7);

    -[STHistoricalUsageViewController coordinator](self, "coordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "selectedDay");
    v13 = objc_msgSend(v11, "selectedWeek");
    if (v8)
    {
      v14 = objc_msgSend(v8, "day");
      v15 = objc_msgSend(v8, "week");
      if (v15 == v13)
      {
        objc_msgSend(v8, "setWeek:", v13);
        objc_msgSend(v8, "setDay:", v12);
        -[STHistoricalUsageViewController _dataSetFromUsageReport:](self, "_dataSetFromUsageReport:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setDataSet:animated:", v16, 1);
        -[STHistoricalUsageViewController maximumYAxisLabelWidth](self, "maximumYAxisLabelWidth");
        v18 = v17;
        objc_msgSend(v8, "maximumYAxisLabelWidth");
        if (v18 >= v19)
          v19 = v18;
        -[STHistoricalUsageViewController setMaximumYAxisLabelWidth:](self, "setMaximumYAxisLabelWidth:", v19);

        if (v14 == v12)
          goto LABEL_13;
        v20 = 0;
        v21 = v13;
      }
      else
      {
        v21 = v15;
        -[STHistoricalUsageViewController _dayGraphViewControllerForDay:week:usageReport:](self, "_dayGraphViewControllerForDay:week:usageReport:", v12, v13, v7);
        v22 = objc_claimAutoreleasedReturnValue();

        v20 = 1;
        v8 = (void *)v22;
      }
    }
    else
    {
      -[STHistoricalUsageViewController _dayGraphViewControllerForDay:week:usageReport:](self, "_dayGraphViewControllerForDay:week:usageReport:", v12, v13, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      v20 = 1;
    }
    v23 = v13 > v21;
    -[STHistoricalUsageViewController dayGraphPageViewController](self, "dayGraphPageViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setViewControllers:direction:animated:completion:", v25, v23, v20, 0);

LABEL_13:
    -[STHistoricalUsageViewController selectedWeekGraphViewController](self, "selectedWeekGraphViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSelectedWeekday:", v12);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)_selectedBarViewDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v14 != v6 && (objc_msgSend(v14, "isEqual:", v6) & 1) == 0)
  {
    -[STHistoricalUsageViewController coordinator](self, "coordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataPoint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "component:fromDate:", 512, v11);
      objc_msgSend(v8, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSelectedDay:", v12);

    }
    else
    {
      objc_msgSend(v7, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSelectedDay:", 0x7FFFFFFFFFFFFFFFLL);
    }

  }
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalUsageViewController.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[viewController isKindOfClass:[STUsageGraphViewController class]]"));

  }
  -[STHistoricalUsageViewController _nextGraphViewControllerForPageViewController:currentGraphViewController:direction:](self, "_nextGraphViewControllerForPageViewController:currentGraphViewController:direction:", v7, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalUsageViewController.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[viewController isKindOfClass:[STUsageGraphViewController class]]"));

  }
  -[STHistoricalUsageViewController _nextGraphViewControllerForPageViewController:currentGraphViewController:direction:](self, "_nextGraphViewControllerForPageViewController:currentGraphViewController:direction:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_nextGraphViewControllerForPageViewController:(id)a3 currentGraphViewController:(id)a4 direction:(int64_t)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;

  v7 = a3;
  -[STHistoricalUsageViewController weekGraphPageViewController](self, "weekGraphPageViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    -[STHistoricalUsageViewController selectedWeekGraphViewController](self, "selectedWeekGraphViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "week");

    if (a5 == 1)
      v12 = v11 + 1;
    else
      v12 = 0;
    if (a5)
      v13 = v12;
    else
      v13 = v11 - 1;
    -[STHistoricalUsageViewController coordinator](self, "coordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "weekUsageReports");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 >= objc_msgSend(v16, "count"))
    {
      v18 = 0;
LABEL_39:

      goto LABEL_40;
    }
    objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STHistoricalUsageViewController _weekGraphViewControllerForWeek:usageReport:](self, "_weekGraphViewControllerForWeek:usageReport:", v13, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

    goto LABEL_39;
  }
  -[STHistoricalUsageViewController dayGraphPageViewController](self, "dayGraphPageViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v7, "isEqual:", v19);

  if (v20)
  {
    -[STHistoricalUsageViewController selectedDayGraphViewController](self, "selectedDayGraphViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v16, "week");
    v22 = objc_msgSend(v16, "day");
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v17, "maximumRangeOfUnit:", 512);
    v25 = v24 + v23 - 1;
    v26 = objc_msgSend(v17, "firstWeekday");
    v27 = v26 - 1;
    if (v26 == v23)
      v27 = v25;
    if (v22 == v25)
      v28 = v23;
    else
      v28 = v22 + 1;
    v29 = v21 - (v22 == v27);
    v30 = v22 - 1;
    if (v22 == v23)
      v30 = v25;
    if (v22 == v26)
      v31 = v21 + 1;
    else
      v31 = v21;
    if (a5 != 1)
    {
      v30 = 0;
      v31 = 0;
    }
    if (a5)
      v32 = v30;
    else
      v32 = v28;
    if (a5)
      v33 = v31;
    else
      v33 = v29;
    -[STHistoricalUsageViewController coordinator](self, "coordinator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "viewModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "weekUsageReports");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v33 >= v37)
    {
      v18 = 0;
    }
    else
    {
      objc_msgSend(v35, "dayUsageReportByWeekdays");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v32);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        -[STHistoricalUsageViewController _dayGraphViewControllerForDay:week:usageReport:](self, "_dayGraphViewControllerForDay:week:usageReport:", v32, v33, v40);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }

    }
    goto LABEL_38;
  }
  v18 = 0;
LABEL_40:

  return v18;
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");

  if (v9 != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalUsageViewController.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(pendingViewControllers.count == 1) && [pendingGraphViewController isKindOfClass:[STUsageGraphViewController class]]"));

  }
  -[STHistoricalUsageViewController weekGraphPageViewController](self, "weekGraphPageViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v15, "isEqual:", v10);

  if (v11)
  {
    -[STHistoricalUsageViewController setSelectedWeekGraphViewController:](self, "setSelectedWeekGraphViewController:", v8);
  }
  else
  {
    -[STHistoricalUsageViewController dayGraphPageViewController](self, "dayGraphPageViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "isEqual:", v12);

    if (v13)
      -[STHistoricalUsageViewController setSelectedDayGraphViewController:](self, "setSelectedDayGraphViewController:", v8);
  }

}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;

  v6 = a6;
  v23 = a3;
  v10 = a5;
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "count");

  if (v12 != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalUsageViewController.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(previousViewControllers.count == 1) && [previousGraphViewController isKindOfClass:[STUsageGraphViewController class]]"));

  }
  -[STHistoricalUsageViewController weekGraphPageViewController](self, "weekGraphPageViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v23, "isEqual:", v13);

  if (v14)
  {
    if (!v6)
    {
      -[STHistoricalUsageViewController setSelectedWeekGraphViewController:](self, "setSelectedWeekGraphViewController:", v11);
      goto LABEL_12;
    }
    -[STHistoricalUsageViewController selectedWeekGraphViewController](self, "selectedWeekGraphViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "week");
    -[STHistoricalUsageViewController coordinator](self, "coordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSelectedWeek:", v16);

    goto LABEL_9;
  }
  -[STHistoricalUsageViewController dayGraphPageViewController](self, "dayGraphPageViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v23, "isEqual:", v19);

  if (v20)
  {
    if (!v6)
    {
      -[STHistoricalUsageViewController setSelectedDayGraphViewController:](self, "setSelectedDayGraphViewController:", v11);
      goto LABEL_12;
    }
    -[STHistoricalUsageViewController selectedDayGraphViewController](self, "selectedDayGraphViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[STHistoricalUsageViewController coordinator](self, "coordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "viewModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSelectedWeek:selectedDay:", objc_msgSend(v15, "week"), objc_msgSend(v15, "day"));

LABEL_9:
  }
LABEL_12:

}

- (id)_weekGraphViewControllerForWeek:(unint64_t)a3 usageReport:(id)a4
{
  id v6;
  STUsageGraphViewController *v7;
  STUsageGraphViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v6 = a4;
  v7 = [STUsageGraphViewController alloc];
  -[STHistoricalUsageViewController graphHeight](self, "graphHeight");
  v8 = -[STUsageGraphViewController initWithTitleView:graphHeight:includePaddle:useVibrancy:](v7, "initWithTitleView:graphHeight:includePaddle:useVibrancy:", 0, 0, 0);
  -[STUsageGraphViewController setWeek:](v8, "setWeek:", a3);
  -[STHistoricalUsageViewController _dataSetFromUsageReport:](self, "_dataSetFromUsageReport:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUsageGraphViewController setDataSet:animated:](v8, "setDataSet:animated:", v9, 0);
  -[STHistoricalUsageViewController coordinator](self, "coordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController setSelectedWeekday:](v8, "setSelectedWeekday:", objc_msgSend(v11, "selectedDay"));

  -[STHistoricalUsageViewController weekGraphContainerHeightConstraint](self, "weekGraphContainerHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[STUsageGraphViewController view](v8, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
    v15 = v14;

    -[STHistoricalUsageViewController weekGraphContainerView](self, "weekGraphContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setActive:", 1);
    -[STHistoricalUsageViewController setWeekGraphContainerHeightConstraint:](self, "setWeekGraphContainerHeightConstraint:", v12);
  }
  -[STHistoricalUsageViewController maximumYAxisLabelWidth](self, "maximumYAxisLabelWidth");
  v19 = v18;
  -[STUsageGraphViewController maximumYAxisLabelWidth](v8, "maximumYAxisLabelWidth");
  if (v19 < v20)
    v19 = v20;
  -[STHistoricalUsageViewController setMaximumYAxisLabelWidth:](self, "setMaximumYAxisLabelWidth:", v19);
  -[STUsageGraphViewController setYAxisLabelSectionWidth:](v8, "setYAxisLabelSectionWidth:", v19);

  return v8;
}

- (id)_dayGraphViewControllerForDay:(unint64_t)a3 week:(unint64_t)a4 usageReport:(id)a5
{
  id v8;
  STUsageGraphViewController *v9;
  STUsageGraphViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v8 = a5;
  v9 = [STUsageGraphViewController alloc];
  -[STHistoricalUsageViewController graphHeight](self, "graphHeight");
  v10 = -[STUsageGraphViewController initWithTitleView:graphHeight:includePaddle:useVibrancy:](v9, "initWithTitleView:graphHeight:includePaddle:useVibrancy:", 0, 0, 0);
  -[STUsageGraphViewController setWeek:](v10, "setWeek:", a4);
  -[STUsageGraphViewController setDay:](v10, "setDay:", a3);
  -[STHistoricalUsageViewController _dataSetFromUsageReport:](self, "_dataSetFromUsageReport:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUsageGraphViewController setDataSet:animated:](v10, "setDataSet:animated:", v11, 0);
  -[STHistoricalUsageViewController dayGraphContainerHeightConstraint](self, "dayGraphContainerHeightConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[STUsageGraphViewController view](v10, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
    v15 = v14;

    -[STHistoricalUsageViewController dayGraphContainerView](self, "dayGraphContainerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setActive:", 1);
    -[STHistoricalUsageViewController setDayGraphContainerHeightConstraint:](self, "setDayGraphContainerHeightConstraint:", v12);
  }
  -[STHistoricalUsageViewController maximumYAxisLabelWidth](self, "maximumYAxisLabelWidth");
  v19 = v18;
  -[STUsageGraphViewController maximumYAxisLabelWidth](v10, "maximumYAxisLabelWidth");
  if (v19 < v20)
    v19 = v20;
  -[STHistoricalUsageViewController setMaximumYAxisLabelWidth:](self, "setMaximumYAxisLabelWidth:", v19);
  -[STUsageGraphViewController setYAxisLabelSectionWidth:](v10, "setYAxisLabelSectionWidth:", v19);

  return v10;
}

- (id)_dataSetFromUsageReport:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = -[STHistoricalUsageViewController type](self, "type");
  switch(v6)
  {
    case 1uLL:
      objc_msgSend(v5, "categoryUsageDataSet");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      v7 = v6;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalUsageViewController.m"), 468, CFSTR("Unexpected type: %lu"), v7);

      goto LABEL_3;
    case 5uLL:
      objc_msgSend(v5, "notificationsDataSet");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 6uLL:
      objc_msgSend(v5, "pickupsDataSet");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v10;
      break;
    default:
LABEL_3:
      v9 = 0;
      break;
  }

  return v9;
}

- (STUsageDetailsViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (STUsageSummaryTitleView)titleView
{
  return (STUsageSummaryTitleView *)objc_getProperty(self, a2, 976, 1);
}

- (void)setTitleView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 976);
}

- (int64_t)currentViewMode
{
  return self->_currentViewMode;
}

- (void)setCurrentViewMode:(int64_t)a3
{
  self->_currentViewMode = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)graphHeight
{
  return self->_graphHeight;
}

- (STUsageGraphViewController)selectedWeekGraphViewController
{
  return self->_selectedWeekGraphViewController;
}

- (STUsageGraphViewController)selectedDayGraphViewController
{
  return (STUsageGraphViewController *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setSelectedDayGraphViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (UIPageViewController)weekGraphPageViewController
{
  return (UIPageViewController *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setWeekGraphPageViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UIPageViewController)dayGraphPageViewController
{
  return (UIPageViewController *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setDayGraphPageViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (UIView)weekGraphContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setWeekGraphContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (UIView)dayGraphContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setDayGraphContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (NSLayoutConstraint)weekGraphContainerHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setWeekGraphContainerHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1056);
}

- (NSLayoutConstraint)dayGraphContainerHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setDayGraphContainerHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (double)maximumYAxisLabelWidth
{
  return self->_maximumYAxisLabelWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayGraphContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_weekGraphContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_dayGraphContainerView, 0);
  objc_storeStrong((id *)&self->_weekGraphContainerView, 0);
  objc_storeStrong((id *)&self->_dayGraphPageViewController, 0);
  objc_storeStrong((id *)&self->_weekGraphPageViewController, 0);
  objc_storeStrong((id *)&self->_selectedDayGraphViewController, 0);
  objc_storeStrong((id *)&self->_selectedWeekGraphViewController, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
