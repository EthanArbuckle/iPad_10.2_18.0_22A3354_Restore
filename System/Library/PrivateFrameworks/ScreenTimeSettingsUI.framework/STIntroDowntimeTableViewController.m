@implementation STIntroDowntimeTableViewController

- (STIntroDowntimeTableViewController)initWithStyle:(int64_t)a3
{
  STIntroDowntimeTableViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STIntroDowntimeTableViewController;
  v3 = -[STIntroDowntimeTableViewController initWithStyle:](&v5, sel_initWithStyle_, a3);
  -[STIntroDowntimeTableViewController _stIntroDowntimeTableViewControllerCommonInit](v3, "_stIntroDowntimeTableViewControllerCommonInit");
  return v3;
}

- (STIntroDowntimeTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  STIntroDowntimeTableViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STIntroDowntimeTableViewController;
  v4 = -[STIntroDowntimeTableViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  -[STIntroDowntimeTableViewController _stIntroDowntimeTableViewControllerCommonInit](v4, "_stIntroDowntimeTableViewControllerCommonInit");
  return v4;
}

- (STIntroDowntimeTableViewController)initWithCoder:(id)a3
{
  STIntroDowntimeTableViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STIntroDowntimeTableViewController;
  v3 = -[STIntroDowntimeTableViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STIntroDowntimeTableViewController _stIntroDowntimeTableViewControllerCommonInit](v3, "_stIntroDowntimeTableViewControllerCommonInit");
  return v3;
}

- (void)_stIntroDowntimeTableViewControllerCommonInit
{
  STDeviceBedtime *v3;
  STDeviceBedtime *bedtime;
  NSDateFormatter *v5;
  NSDateFormatter *downtimeFormatter;

  v3 = (STDeviceBedtime *)objc_opt_new();
  bedtime = self->_bedtime;
  self->_bedtime = v3;

  -[STDeviceBedtime setAskForMoreTime:](self->_bedtime, "setAskForMoreTime:", 1);
  v5 = (NSDateFormatter *)objc_opt_new();
  downtimeFormatter = self->_downtimeFormatter;
  self->_downtimeFormatter = v5;

  -[NSDateFormatter setDateStyle:](self->_downtimeFormatter, "setDateStyle:", 0);
  -[NSDateFormatter setTimeStyle:](self->_downtimeFormatter, "setTimeStyle:", 1);
  -[NSDateFormatter setFormattingContext:](self->_downtimeFormatter, "setFormattingContext:", 3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility", a3, a4))
    return 3;
  else
    return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v8, "row");
  if (v9 != -[STIntroDowntimeTableViewController _tableRowForStartLabelRow](self, "_tableRowForStartLabelRow"))
  {
    if (v9 == -[STIntroDowntimeTableViewController _tableRowForEndLabelRow](self, "_tableRowForEndLabelRow"))
    {
      if (-[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility") == 2)
        v16 = CFSTR("End Editing");
      else
        v16 = CFSTR("End Not Editing");
      objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v16, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[STIntroDowntimeTableViewController bedtime](self, "bedtime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "simpleSchedule");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "endTime");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (v9 != -[STIntroDowntimeTableViewController _tableRowForDatePicker](self, "_tableRowForDatePicker"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STIntroDowntimeTableViewController.m"), 112, CFSTR("Unhandled Downtime row %ld"), v9);

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, 0);
      goto LABEL_12;
    }
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Date Picker"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "subviews");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = -[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility");
    if (v26 == 2)
    {
      objc_msgSend(v25, "calendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[STIntroDowntimeTableViewController bedtime](self, "bedtime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "simpleSchedule");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "endTime");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v26 != 1)
      {
LABEL_20:

        goto LABEL_12;
      }
      objc_msgSend(v25, "calendar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[STIntroDowntimeTableViewController bedtime](self, "bedtime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "simpleSchedule");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "startTime");
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v30;
    objc_msgSend(v27, "dateFromComponents:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDate:animated:", v33, 0);

    goto LABEL_20;
  }
  if (-[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility") == 1)
    v10 = CFSTR("Start Editing");
  else
    v10 = CFSTR("Start Not Editing");
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroDowntimeTableViewController bedtime](self, "bedtime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "simpleSchedule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startTime");
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v17 = (void *)v15;
  objc_msgSend(v12, "dateFromComponents:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[STIntroDowntimeTableViewController downtimeFormatter](self, "downtimeFormatter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringFromDate:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "detailTextLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v20);

LABEL_12:
  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  v7 = objc_msgSend(a4, "row");
  if (v7 == -[STIntroDowntimeTableViewController _tableRowForStartLabelRow](self, "_tableRowForStartLabelRow"))
  {
    v8 = 1;
  }
  else
  {
    if (v7 != -[STIntroDowntimeTableViewController _tableRowForEndLabelRow](self, "_tableRowForEndLabelRow"))
      goto LABEL_9;
    v8 = 2;
  }
  if (-[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility") == v8)
    v9 = 0;
  else
    v9 = v8;
  -[STIntroDowntimeTableViewController setDatePickerVisibility:](self, "setDatePickerVisibility:", v9);
LABEL_9:
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndex:", 0);
  objc_msgSend(v6, "reloadSections:withRowAnimation:", v10, 100);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  int64_t v6;
  double result;

  v5 = objc_msgSend(a4, "row", a3);
  v6 = -[STIntroDowntimeTableViewController _tableRowForDatePicker](self, "_tableRowForDatePicker");
  result = *MEMORY[0x24BEBE770];
  if (v5 != v6)
    return 61.0;
  return result;
}

- (int64_t)_tableRowForStartLabelRow
{
  return 0;
}

- (int64_t)_tableRowForEndLabelRow
{
  int64_t v3;

  v3 = -[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility");
  switch(v3)
  {
    case 2:
      return 1;
    case 1:
      return -[STIntroDowntimeTableViewController _tableRowForDatePicker](self, "_tableRowForDatePicker") + 1;
    case 0:
      return 1;
  }
  return 0;
}

- (int64_t)_tableRowForDatePicker
{
  int64_t v3;
  int64_t v5;

  v3 = -[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility");
  if (v3 == 2)
  {
    v5 = -[STIntroDowntimeTableViewController _tableRowForEndLabelRow](self, "_tableRowForEndLabelRow");
    return v5 + 1;
  }
  if (v3 == 1)
  {
    v5 = -[STIntroDowntimeTableViewController _tableRowForStartLabelRow](self, "_tableRowForStartLabelRow");
    return v5 + 1;
  }
  if (v3)
    return 0;
  else
    return -1;
}

- (void)_datePickerChanged:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[STIntroDowntimeTableViewController datePickerVisibility](self, "datePickerVisibility");
  if (v5 == 2)
  {
    objc_msgSend(v4, "calendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "components:fromDate:", 96, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[STIntroDowntimeTableViewController bedtime](self, "bedtime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "simpleSchedule");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEndTime:", v8);

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", -[STIntroDowntimeTableViewController _tableRowForEndLabelRow](self, "_tableRowForEndLabelRow"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STIntroDowntimeTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    v13 = (void *)MEMORY[0x24BDBCE30];
    v14 = &v20;
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    objc_msgSend(v4, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 96, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[STIntroDowntimeTableViewController bedtime](self, "bedtime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "simpleSchedule");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartTime:", v8);

    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", -[STIntroDowntimeTableViewController _tableRowForStartLabelRow](self, "_tableRowForStartLabelRow"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STIntroDowntimeTableViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v13 = (void *)MEMORY[0x24BDBCE30];
    v14 = (void **)v21;
LABEL_5:
    objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v19, 100);

  }
}

- (STDeviceBedtime)bedtime
{
  return (STDeviceBedtime *)objc_getProperty(self, a2, 1016, 1);
}

- (int64_t)datePickerVisibility
{
  return self->_datePickerVisibility;
}

- (void)setDatePickerVisibility:(int64_t)a3
{
  self->_datePickerVisibility = a3;
}

- (NSDateFormatter)downtimeFormatter
{
  return (NSDateFormatter *)objc_getProperty(self, a2, 1032, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downtimeFormatter, 0);
  objc_storeStrong((id *)&self->_bedtime, 0);
}

@end
