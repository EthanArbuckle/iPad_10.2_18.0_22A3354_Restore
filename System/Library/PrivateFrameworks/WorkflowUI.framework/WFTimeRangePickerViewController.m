@implementation WFTimeRangePickerViewController

- (WFTimeRangePickerViewController)init
{
  return -[WFTimeRangePickerViewController initWithStartTime:endTime:](self, "initWithStartTime:endTime:", 0, 0);
}

- (WFTimeRangePickerViewController)initWithStartTime:(id)a3 endTime:(id)a4
{
  id v7;
  id v8;
  WFTimeRangePickerViewController *v9;
  WFTimeRangePickerViewController *v10;
  void **p_startTime;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void **p_endTime;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *sections;
  WFTimeRangePickerViewController *v29;
  objc_super v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFTimeRangePickerViewController;
  v9 = -[WFTimeRangePickerViewController initWithStyle:](&v31, sel_initWithStyle_, 2);
  v10 = v9;
  if (v9)
  {
    p_startTime = (void **)&v9->_startTime;
    objc_storeStrong((id *)&v9->_startTime, a3);
    if (!*p_startTime)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "components:fromDate:", 96, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setHour:", 9);
      objc_msgSend(v14, "setMinute:", 0);
      objc_msgSend(v12, "dateFromComponents:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *p_startTime;
      *p_startTime = (void *)v15;

    }
    p_endTime = (void **)&v10->_endTime;
    objc_storeStrong((id *)&v10->_endTime, a4);
    if (!v10->_endTime)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "components:fromDate:", 96, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setHour:", 17);
      objc_msgSend(v20, "setMinute:", 0);
      objc_msgSend(v18, "dateFromComponents:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *p_endTime;
      *p_endTime = (void *)v21;

    }
    v34[0] = CFSTR("identifier");
    v34[1] = CFSTR("sectionTitle");
    v35[0] = CFSTR("start");
    WFLocalizedString(CFSTR("Start"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v24;
    v32[1] = CFSTR("sectionTitle");
    v33[0] = CFSTR("end");
    v32[0] = CFSTR("identifier");
    WFLocalizedString(CFSTR("End"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
    v27 = objc_claimAutoreleasedReturnValue();
    sections = v10->_sections;
    v10->_sections = (NSArray *)v27;

    v29 = v10;
  }

  return v10;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFTimeRangePickerViewController;
  -[WFTimeRangePickerViewController loadView](&v11, sel_loadView);
  -[WFTimeRangePickerViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  objc_msgSend(v3, "setLeftBarButtonItem:", v4);

  -[WFTimeRangePickerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

  -[WFTimeRangePickerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", v8, v10);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;

  -[WFTimeRangePickerViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFTimeRangePickerViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char **v16;
  void *v17;
  int v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  -[WFTimeRangePickerViewController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v13, "isEqual:", CFSTR("start"));

  if ((_DWORD)v7)
  {
    -[WFTimeRangePickerViewController startTime](self, "startTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "datePicker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDate:", v14);
    v16 = &selRef_startTimeChanged_;
LABEL_5:

    objc_msgSend(v12, "datePicker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addTarget:action:forControlEvents:", self, *v16, 4096);

    goto LABEL_6;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", CFSTR("end"));

  if (v18)
  {
    -[WFTimeRangePickerViewController endTime](self, "endTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "datePicker");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDate:", v14);
    v16 = &selRef_endTimeChanged_;
    goto LABEL_5;
  }
LABEL_6:

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[WFTimeRangePickerViewController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)startTimeChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTimeRangePickerViewController setStartTime:](self, "setStartTime:", v4);

}

- (void)endTimeChanged:(id)a3
{
  id v4;

  objc_msgSend(a3, "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTimeRangePickerViewController setEndTime:](self, "setEndTime:", v4);

}

- (void)cancel:(id)a3
{
  id v4;

  -[WFTimeRangePickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeRangePickerViewControllerDidCancel:", self);

}

- (void)done:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[WFTimeRangePickerViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTimeRangePickerViewController startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTimeRangePickerViewController endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeRangePickerViewController:didPickStartTime:endTime:", self, v4, v5);

}

- (WFTimeRangePickerViewControllerDelegate)delegate
{
  return (WFTimeRangePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
