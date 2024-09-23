@implementation SCLTimeIntervalTableViewCell

- (SCLTimeIntervalTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SCLTimeIntervalTableViewCell *v7;
  SCLSingleGroupTableView *v8;
  void *v9;
  uint64_t v10;
  UITableView *tableView;
  id v12;
  UITableView *v13;
  uint64_t v14;
  UITableViewDiffableDataSource *dataSource;
  UITableViewDiffableDataSource *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id location;
  objc_super v43;
  _QWORD v44[6];

  v44[4] = *MEMORY[0x24BDAC8D0];
  v43.receiver = self;
  v43.super_class = (Class)SCLTimeIntervalTableViewCell;
  v38 = a4;
  v39 = a5;
  v7 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v43, sel_initWithStyle_reuseIdentifier_specifier_, a3, v38);
  if (v7)
  {
    v8 = [SCLSingleGroupTableView alloc];
    -[SCLTimeIntervalTableViewCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = -[SCLSingleGroupTableView initWithFrame:](v8, "initWithFrame:");
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v10;

    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](v7->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITableView setDelegate:](v7->_tableView, "setDelegate:", v7);
    objc_initWeak(&location, v7);
    v12 = objc_alloc(MEMORY[0x24BDF6E70]);
    v13 = v7->_tableView;
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __72__SCLTimeIntervalTableViewCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
    v40[3] = &unk_24E711FB8;
    objc_copyWeak(&v41, &location);
    v14 = objc_msgSend(v12, "initWithTableView:cellProvider:", v13, v40);
    dataSource = v7->_dataSource;
    v7->_dataSource = (UITableViewDiffableDataSource *)v14;

    -[UITableViewDiffableDataSource setDefaultRowAnimation:](v7->_dataSource, "setDefaultRowAnimation:", 0);
    -[UITableView setDataSource:](v7->_tableView, "setDataSource:", v7->_dataSource);
    v16 = v7->_dataSource;
    -[SCLTimeIntervalTableViewCell snapshotForPickerState:](v7, "snapshotForPickerState:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](v16, "applySnapshot:animatingDifferences:", v17, 0);

    -[SCLTimeIntervalTableViewCell contentView](v7, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v7->_tableView);

    v29 = (void *)MEMORY[0x24BDD1628];
    -[SCLTimeIntervalTableViewCell contentView](v7, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView topAnchor](v7->_tableView, "topAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v34;
    -[SCLTimeIntervalTableViewCell contentView](v7, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView bottomAnchor](v7->_tableView, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v30;
    -[SCLTimeIntervalTableViewCell contentView](v7, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView leadingAnchor](v7->_tableView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v22;
    -[SCLTimeIntervalTableViewCell contentView](v7, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView trailingAnchor](v7->_tableView, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v27);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v7;
}

id __72__SCLTimeIntervalTableViewCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "tableView:cellForRowAtIndexPath:itemIdentifier:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[SCLTimeIntervalTableViewCell setReloadingAnimated:](self, "setReloadingAnimated:", v4);
  v7.receiver = self;
  v7.super_class = (Class)SCLTimeIntervalTableViewCell;
  -[PSTableCell reloadWithSpecifier:animated:](&v7, sel_reloadWithSpecifier_animated_, v6, v4);

  -[SCLTimeIntervalTableViewCell setReloadingAnimated:](self, "setReloadingAnimated:", 0);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLTimeIntervalTableViewCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, a3);
  -[SCLTimeIntervalTableViewCell snapshotForPickerState:](self, "snapshotForPickerState:", -[SCLTimeIntervalTableViewCell pickerState](self, "pickerState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadItemsWithIdentifiers:", &unk_24E716CC0);
  -[SCLTimeIntervalTableViewCell dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applySnapshot:animatingDifferences:", v4, -[SCLTimeIntervalTableViewCell isReloadingAnimated](self, "isReloadingAnimated"));

}

- (id)timeInterval
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)constraintInterval
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SCLTimeIntervalTableViewCellConstrainingInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)pickerState
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SCLTimeIntervalTableViewCellPickerState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)dateConverter
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SCLTimeIntervalTableViewCellDateConverter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  UITableViewDiffableDataSource *dataSource;
  id v8;
  void *v9;
  uint64_t v10;
  SCLTimePickerTableViewCell *v11;
  void *v12;
  void *v13;

  dataSource = self->_dataSource;
  v8 = a3;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](dataSource, "itemIdentifierForIndexPath:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  if ((v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("DatePicker"));
    v11 = (SCLTimePickerTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v11 = -[SCLTimePickerTableViewCell initWithStyle:reuseIdentifier:]([SCLTimePickerTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("DatePicker"));
      -[SCLTimeIntervalTableViewCell dateConverter](self, "dateConverter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "calendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLTimePickerTableViewCell setCalendar:](v11, "setCalendar:", v13);

      -[SCLTimePickerTableViewCell setDelegate:](v11, "setDelegate:", self);
    }
    -[SCLTimeIntervalTableViewCell configureTimePickerCell:forRow:](self, "configureTimePickerCell:forRow:", v11, v10);
  }
  else
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("kReuseIdentifier"));
    v11 = (SCLTimePickerTableViewCell *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      v11 = (SCLTimePickerTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kReuseIdentifier"));
    -[SCLTimeIntervalTableViewCell configureTimeCell:forRow:](self, "configureTimeCell:forRow:", v11, v10);
  }
  return v11;
}

- (void)configureTimePickerCell:(id)a3 forRow:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  -[SCLTimeIntervalTableViewCell dateConverter](self, "dateConverter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLTimeIntervalTableViewCell timeInterval](self, "timeInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "canonicalDateIntervalForTimeInterval:", v8);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[SCLTimeIntervalTableViewCell constraintInterval](self, "constraintInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 3)
  {
    objc_msgSend(v21, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SCLTimeIntervalTableViewCell dateConverter](self, "dateConverter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "calendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingUnit:value:toDate:options:", 64, 1, v17, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[SCLTimeIntervalTableViewCell dateConverter](self, "dateConverter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "canonicalDateIntervalForTimeInterval:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
LABEL_8:
    v14 = 0;
    v13 = 0;
    goto LABEL_9;
  }
  if (a4 != 1)
  {
    v14 = 0;
    v13 = 0;
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v21, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_8;
  -[SCLTimeIntervalTableViewCell dateConverter](self, "dateConverter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "canonicalDateIntervalForTimeInterval:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v13, v14);
  objc_msgSend(v6, "setConstraintInterval:", v20);

  objc_msgSend(v6, "setSelectedDate:", v10);
}

- (void)configureTimeCell:(id)a3 forRow:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REPEATED_SCHEDULE_TO_TIME_TITLE"), &stru_24E712518, CFSTR("SchoolTimeSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimeIntervalTableViewCell scheduleTimeFormatter](self, "scheduleTimeFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimeIntervalTableViewCell timeInterval](self, "timeInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForObjectValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 2;
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REPEATED_SCHEDULE_FROM_TIME_TITLE"), &stru_24E712518, CFSTR("SchoolTimeSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimeIntervalTableViewCell scheduleTimeFormatter](self, "scheduleTimeFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLTimeIntervalTableViewCell timeInterval](self, "timeInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForObjectValue:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
  }

  v14 = -[SCLTimeIntervalTableViewCell pickerState](self, "pickerState");
  objc_msgSend(v19, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v8);

  objc_msgSend(v19, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v12);

  if (v14 == v13)
    objc_msgSend(MEMORY[0x24BDF6950], "systemOrangeColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

}

- (id)snapshotForPickerState:(unint64_t)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDF6720]);
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_24E716CD8);
  if (a3 <= 2)
    objc_msgSend(v4, "appendItemsWithIdentifiers:", qword_24E711FD8[a3]);
  return v4;
}

- (id)scheduleTimeFormatter
{
  void *v2;
  void *v3;

  -[PSTableCell specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyForKey:", CFSTR("SCLTimeIntervalTableViewCellScheduleTimeFormatter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[UITableViewDiffableDataSource itemIdentifierForIndexPath:](self->_dataSource, "itemIdentifierForIndexPath:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v13, "unsignedIntegerValue");
  if (-[SCLTimeIntervalTableViewCell pickerState](self, "pickerState") == 2 && v7 == 2)
  {
    v8 = 0;
  }
  else
  {
    v9 = -[SCLTimeIntervalTableViewCell pickerState](self, "pickerState") == 1;
    if (v7 == 2)
      v10 = 2;
    else
      v10 = v7 == 0;
    if (v9 && v7 == 0)
      v8 = 0;
    else
      v8 = v10;
  }
  -[PSTableCell specifier](self, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SCLTimeIntervalTableViewCellPickerStateHandler"));
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v12)
    ((void (**)(_QWORD, SCLTimeIntervalTableViewCell *, uint64_t))v12)[2](v12, self, v8);

}

- (void)timePickerCell:(id)a3 didUpdateDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  id v25;

  v6 = a4;
  v7 = a3;
  -[SCLTimeIntervalTableViewCell tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForCell:", v7);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  -[SCLTimeIntervalTableViewCell dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemIdentifierForIndexPath:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  -[SCLTimeIntervalTableViewCell dateConverter](self, "dateConverter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheduleTimeWithDate:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLTimeIntervalTableViewCell timeInterval](self, "timeInterval");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == 3)
  {
    v20 = objc_alloc(MEMORY[0x24BE84218]);
    objc_msgSend(v14, "startTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    v18 = v16;
    v19 = v13;
  }
  else
  {
    if (v11 != 1)
      goto LABEL_6;
    v15 = objc_alloc(MEMORY[0x24BE84218]);
    objc_msgSend(v14, "endTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v15;
    v18 = v13;
    v19 = v16;
  }
  v21 = objc_msgSend(v17, "initWithStartTime:endTime:", v18, v19);

  v14 = (void *)v21;
LABEL_6:
  -[PSTableCell specifier](self, "specifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hasValidSetter");

  if (v23)
  {
    -[PSTableCell specifier](self, "specifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "performSetterWithValue:", v14);

  }
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UITableViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (BOOL)isReloadingAnimated
{
  return self->_reloadingAnimated;
}

- (void)setReloadingAnimated:(BOOL)a3
{
  self->_reloadingAnimated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
