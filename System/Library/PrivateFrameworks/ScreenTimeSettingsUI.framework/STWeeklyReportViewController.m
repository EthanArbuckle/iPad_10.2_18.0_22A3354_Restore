@implementation STWeeklyReportViewController

- (STWeeklyReportViewController)initWithData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  STWeeklyReportViewController *v9;
  id v11;

  v4 = (void *)MEMORY[0x24BDD1620];
  v5 = a3;
  v11 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (v7)
  {
    +[STUILog usage](STUILog, "usage");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[STWeeklyReportViewController initWithData:].cold.1((uint64_t)v7, v8);

  }
  if (v6)
  {
    self = -[STWeeklyReportViewController initWithUsageReport:](self, "initWithUsageReport:", v6);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (STWeeklyReportViewController)initWithUsageReport:(id)a3
{
  id v5;
  STWeeklyReportViewController *v6;
  STWeeklyReportViewController *v7;
  STUsageReport **p_report;
  void *v9;
  STDailyAverageSummaryTableViewCell *v10;
  STWeeklyReportAppUsageTableViewCell *v11;
  STNotificationsPickupSummaryTableViewCell *v12;
  uint64_t v13;
  NSArray *tableViewCells;
  void *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STWeeklyReportViewController;
  v6 = -[STWeeklyReportViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    p_report = &v6->_report;
    objc_storeStrong((id *)&v6->_report, a3);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v10 = -[STDailyAverageSummaryTableViewCell initWithUsageReport:]([STDailyAverageSummaryTableViewCell alloc], "initWithUsageReport:", *p_report);
    objc_msgSend(v9, "addObject:", v10);
    v11 = -[STWeeklyReportAppUsageTableViewCell initWithUsageReport:]([STWeeklyReportAppUsageTableViewCell alloc], "initWithUsageReport:", *p_report);
    objc_msgSend(v9, "addObject:", v11);
    v12 = -[STNotificationsPickupSummaryTableViewCell initWithUsageReport:]([STNotificationsPickupSummaryTableViewCell alloc], "initWithUsageReport:", *p_report);
    objc_msgSend(v9, "addObject:", v12);
    v13 = objc_msgSend(v9, "copy");
    tableViewCells = v7->_tableViewCells;
    v7->_tableViewCells = (NSArray *)v13;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel__heightDidChange_, 0x24DB8E9F0, v10);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STWeeklyReportViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), CFSTR("KVOContextWeeklyReportViewController"));

  v4.receiver = self;
  v4.super_class = (Class)STWeeklyReportViewController;
  -[STWeeklyReportViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STWeeklyReportViewController;
  -[STWeeklyReportViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[STWeeklyReportViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x24BEBE770]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 75.0);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("CELL"));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("contentSize"), 3, CFSTR("KVOContextWeeklyReportViewController"));
  -[STWeeklyReportViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  objc_msgSend(v5, "constraintEqualToConstant:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setActive:", 1);
  -[STWeeklyReportViewController setHeightConstraint:](self, "setHeightConstraint:", v7);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWeeklyReportViewController.viewDidLoad", v8, 2u);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v10 = a5;
  if (a6 == CFSTR("KVOContextWeeklyReportViewController"))
  {
    v12 = a3;
    -[STWeeklyReportViewController tableView](self, "tableView");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("contentSize"));
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
      objc_msgSend(v14, "CGSizeValue");
      v17 = v16;
      -[STWeeklyReportViewController heightConstraint](self, "heightConstraint");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setConstant:", v17);

    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)STWeeklyReportViewController;
    v11 = a3;
    -[STWeeklyReportViewController observeValueForKeyPath:ofObject:change:context:](&v19, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  int64_t v7;
  void *v9;

  -[STWeeklyReportViewController tableViewCells](self, "tableViewCells", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STWeeklyReportViewController.m"), 111, CFSTR("number of rows overflowed %lu"), v7);

  }
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = objc_msgSend(a4, "row", a3);
  v6 = v5 & ~(v5 >> 63);
  -[STWeeklyReportViewController tableViewCells](self, "tableViewCells");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 >= objc_msgSend(v7, "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setParentViewController:", self);
  }
  else if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  objc_msgSend(a4, "setSeparatorInset:", a3, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
}

- (void)_heightDidChange:(id)a3
{
  id v3;

  -[STWeeklyReportViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (STUsageReport)report
{
  return self->_report;
}

- (NSArray)tableViewCells
{
  return self->_tableViewCells;
}

- (void)setTableViewCells:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCells, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewCells, 0);
  objc_storeStrong((id *)&self->_report, 0);
}

- (void)initWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_219AB4000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving %@", (uint8_t *)&v2, 0xCu);
}

@end
