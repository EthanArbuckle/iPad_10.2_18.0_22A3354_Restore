@implementation WFTimeOfDayTriggerConfigurationViewController

- (WFTimeOfDayTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFTimeOfDayTriggerConfigurationViewController *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  WFTimeOfDayTriggerConfigurationViewController *v12;
  void *v14;
  objc_super v15;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTimeOfDayTriggerConfigurationViewController.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFTimeOfDayTrigger class]]"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFTimeOfDayTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v15, sel_initWithTrigger_mode_, v7, a4);
  if (v8)
  {
    if (objc_msgSend(v7, "mode"))
    {
      v9 = 2;
    }
    else
    {
      objc_msgSend(v7, "daysOfWeek");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11 == 7)
      {
        v8->_timeOfDayInterval = 0;
LABEL_10:
        v12 = v8;
        goto LABEL_11;
      }
      v9 = 1;
    }
    v8->_timeOfDayInterval = v9;
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

- (id)tableViewCellClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)customSections
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v30[0] = CFSTR("timeSection");
  v29[0] = CFSTR("identifier");
  v29[1] = CFSTR("cellIdentifier");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v6;
  v28[0] = CFSTR("repeatSection");
  v27[0] = CFSTR("identifier");
  v27[1] = CFSTR("sectionTitle");
  WFLocalizedString(CFSTR("Repeat"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  v27[2] = CFSTR("cellIdentifier");
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFTimeOfDayTriggerConfigurationViewController timeOfDayInterval](self, "timeOfDayInterval") == 1)
  {
    v25[1] = CFSTR("cellIdentifier");
    v26[0] = CFSTR("weekSection");
    v25[0] = CFSTR("identifier");
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);
LABEL_5:

    return v12;
  }
  if (-[WFTimeOfDayTriggerConfigurationViewController timeOfDayInterval](self, "timeOfDayInterval") == 2)
  {
    v22 = CFSTR("calendarSection");
    v19 = CFSTR("identifier");
    v20 = CFSTR("sectionTitle");
    WFLocalizedString(CFSTR("Starting"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    v21 = CFSTR("cellIdentifier");
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v19, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v17, v19, v20, v21, v22, v23);

    goto LABEL_5;
  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTimeOfDayTriggerConfigurationViewController;
  -[WFTimeOfDayTriggerConfigurationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_dismissKeyboard);
  objc_msgSend(v5, "setCancelsTouchesInView:", 0);
  -[WFTimeOfDayTriggerConfigurationViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

}

- (BOOL)showingPicker
{
  void *v2;
  BOOL v3;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "event") == 2;

  return v3;
}

- (id)infoForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WFTriggerConfigurationViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFTriggerConfigurationViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  char v16;

  -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("triggerDescription"));

  if ((v7 & 1) != 0)
  {
LABEL_2:
    v8 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("timeSection"));

  if (!v10)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", CFSTR("repeatSection"));

    if ((v12 & 1) != 0)
    {
      v8 = 3;
      goto LABEL_12;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("weekSection"));

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", CFSTR("calendarSection"));

      if ((v16 & 1) == 0)
      {
        v8 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);
        goto LABEL_12;
      }
    }
    goto LABEL_2;
  }
  if (-[WFTimeOfDayTriggerConfigurationViewController showingPicker](self, "showingPicker"))
    v8 = 4;
  else
    v8 = 3;
LABEL_12:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  id v64;

  v6 = a3;
  v7 = a4;
  -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    objc_msgSend(v10, "setSelectionStyle:", 0);
LABEL_3:
    v13 = v10;
    goto LABEL_4;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqual:", CFSTR("timeSection"));

  if (v17)
  {
    -[WFTimeOfDayTriggerConfigurationViewController titleForIndexPath:](self, "titleForIndexPath:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    -[WFTimeOfDayTriggerConfigurationViewController subtitleForIndexPath:](self, "subtitleForIndexPath:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "detailTextLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "event");
    v24 = objc_msgSend(v7, "row");

    if (v23 == v24)
      objc_msgSend(v10, "setAccessoryType:", 3);
    if (objc_msgSend(v7, "row") != 3)
      goto LABEL_3;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v26, v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "datePicker");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDatePickerMode:", 0);

    objc_msgSend(v13, "datePicker");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addTarget:action:forControlEvents:", self, sel_timePickerUpdated_, 4096);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "time");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = v6;
    if (v30)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_opt_new();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "time");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "nextDateAfterDate:matchingComponents:options:", v61, v31, 5120);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "datePicker");
      v33 = v9;
      v34 = v30;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setDate:", v32);

      v30 = v34;
      v9 = v33;

      v36 = v60;
      v37 = (void *)v61;

    }
    else
    {
      v36 = (void *)objc_opt_new();
      objc_msgSend(v13, "datePicker");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setDate:", v36);
    }

    goto LABEL_31;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isEqual:", CFSTR("repeatSection"));

  if (v39)
  {
    -[WFTimeOfDayTriggerConfigurationViewController titleForIndexPath:](self, "titleForIndexPath:", v7);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setText:", v40);

    -[WFTimeOfDayTriggerConfigurationViewController subtitleForIndexPath:](self, "subtitleForIndexPath:", v7);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "detailTextLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v42);

    if (!objc_msgSend(v7, "row")
      && !-[WFTimeOfDayTriggerConfigurationViewController timeOfDayInterval](self, "timeOfDayInterval")
      || objc_msgSend(v7, "row") == 1
      && -[WFTimeOfDayTriggerConfigurationViewController timeOfDayInterval](self, "timeOfDayInterval") == 1
      || objc_msgSend(v7, "row") == 2
      && -[WFTimeOfDayTriggerConfigurationViewController timeOfDayInterval](self, "timeOfDayInterval") == 2)
    {
      objc_msgSend(v10, "setAccessoryType:", 3);
    }
    goto LABEL_3;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqual:", CFSTR("weekSection"));

  if (!v45)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqual:", CFSTR("calendarSection"));

    if (!v48)
      goto LABEL_3;
    v13 = v10;
    v64 = v6;
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v13;
      else
        v49 = 0;
    }
    else
    {
      v49 = 0;
    }
    v52 = v49;

    objc_msgSend(v52, "datePicker");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setDatePickerMode:", 1);

    v54 = (void *)MEMORY[0x24BEC40E8];
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeOfDayTriggerConfigurationViewController currentSunriseTime](self, "currentSunriseTime");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeOfDayTriggerConfigurationViewController currentSunsetTime](self, "currentSunsetTime");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "nextFireDateFromNowWithTrigger:currentSunriseTime:currentSunsetTime:", v63, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "datePicker");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setDate:", v57);

    objc_msgSend(v52, "datePicker");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addTarget:action:forControlEvents:", self, sel_timePickerUpdated_, 4096);

    objc_msgSend(v52, "setSelectionStyle:", 0);
LABEL_31:
    v6 = v64;
    goto LABEL_4;
  }
  v13 = v10;
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v46 = v13;
    else
      v46 = 0;
  }
  else
  {
    v46 = 0;
  }
  v50 = v46;

  -[WFTimeOfDayTriggerConfigurationViewController dateComponentsFromTriggerDays](self, "dateComponentsFromTriggerDays");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setSelectedRecurrences:", v51);

  objc_msgSend(v50, "setDelegate:", self);
LABEL_4:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v13, v7, v8, v60);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)titleForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  __CFString **v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a3;
  -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("timeSection"));

  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("repeatSection"));

    if (v11)
    {
      v8 = objc_msgSend(v4, "row");
      if (v8 < 3)
      {
        v9 = &off_24E604FB8;
        goto LABEL_7;
      }
    }
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend(v4, "row");
  if (v8 >= 3)
    goto LABEL_8;
  v9 = &off_24E604FA0;
LABEL_7:
  WFLocalizedString(v9[v8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

- (id)subtitleForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("timeSection"));

  if (!v7 || (unint64_t)objc_msgSend(v4, "row") > 1)
    goto LABEL_5;
  v8 = objc_msgSend(v4, "row");
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != objc_msgSend(v9, "event"))
  {
    v12 = 0;
LABEL_9:

    goto LABEL_6;
  }
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "timeOffset");

  if (v11 != 7)
  {
    v14 = (void *)MEMORY[0x24BEC40E0];
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v9, "event");
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedSunriseSunsetDescriptionForTriggerEvent:timeOffset:", v15, objc_msgSend(v16, "timeOffset"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
LABEL_5:
  v12 = 0;
LABEL_6:

  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  unint64_t v6;
  void *v7;

  v6 = -[WFTimeOfDayTriggerConfigurationViewController timeOfDayInterval](self, "timeOfDayInterval", a3);
  v7 = 0;
  if (a4 == 3 && v6 == 2)
  {
    -[WFTimeOfDayTriggerConfigurationViewController calendarFooterText](self, "calendarFooterText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v28, 1);
  -[WFTimeOfDayTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v28, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("timeSection"));

  if (!v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("repeatSection"));

    if (!v11)
      goto LABEL_18;
    if (objc_msgSend(v28, "row"))
    {
      if (objc_msgSend(v28, "row") == 1)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setMode:", 0);

        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setDayOfMonth:", 0);

        -[WFTimeOfDayTriggerConfigurationViewController allDaysOfWeek](self, "allDaysOfWeek");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDaysOfWeek:", v14);
        v16 = 1;
      }
      else
      {
        if (objc_msgSend(v28, "row") != 2)
        {
LABEL_17:
          -[WFTriggerConfigurationViewController tableView](self, "tableView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "reloadData");

          goto LABEL_18;
        }
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setMode:", 1);

        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDaysOfWeek:", MEMORY[0x24BDBD1A8]);

        -[WFTimeOfDayTriggerConfigurationViewController currentDayOfMonth](self, "currentDayOfMonth");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setDayOfMonth:", v14);
        v16 = 2;
      }
    }
    else
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setMode:", 0);

      -[WFTimeOfDayTriggerConfigurationViewController allDaysOfWeek](self, "allDaysOfWeek");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDaysOfWeek:", v14);
      v16 = 0;
    }

    -[WFTimeOfDayTriggerConfigurationViewController setTimeOfDayInterval:](self, "setTimeOfDayInterval:", v16);
    goto LABEL_17;
  }
  if ((unint64_t)objc_msgSend(v28, "row") <= 2)
  {
    v9 = objc_msgSend(v28, "row");
    if (v9 < 2)
    {
      -[WFTimeOfDayTriggerConfigurationViewController presentOffsetPickerViewControllerForEvent:](self, "presentOffsetPickerViewControllerForEvent:", v9);
      goto LABEL_18;
    }
    if (v9 == 2)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "event");

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEvent:", 2);

      if (v18 != 2)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "time");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
        {
          v22 = (void *)objc_opt_new();
          -[WFTimeOfDayTriggerConfigurationViewController updateTriggerTimeFromDate:](self, "updateTriggerTimeFromDate:", v22);

        }
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v28, v6);
  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "reloadData");

}

- (void)presentOffsetPickerViewControllerForEvent:(unint64_t)a3
{
  WFTimeOffsetPickerViewController *v5;
  void *v6;
  void *v7;
  WFTimeOffsetPickerViewController *v8;

  v5 = [WFTimeOffsetPickerViewController alloc];
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFTimeOffsetPickerViewController initWithTimeTriggerEvent:timeOffset:](v5, "initWithTimeTriggerEvent:timeOffset:", a3, objc_msgSend(v6, "timeOffset"));

  -[WFTimeOffsetPickerViewController setDelegate:](v8, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  -[WFTimeOfDayTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)updateTriggerTimeFromDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDBCE48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 96, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTime:", v8);

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)updateTriggerCalendarDayFromDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDBCE48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 16, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "day"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDayOfMonth:", v7);

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)timePickerUpdated:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "datePickerMode"))
  {
    if (objc_msgSend(v6, "datePickerMode") == 1)
    {
      objc_msgSend(v6, "date");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTimeOfDayTriggerConfigurationViewController updateTriggerCalendarDayFromDate:](self, "updateTriggerCalendarDayFromDate:", v4);

      -[WFTimeOfDayTriggerConfigurationViewController updateCalendarFooterText](self, "updateCalendarFooterText");
    }
  }
  else
  {
    objc_msgSend(v6, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeOfDayTriggerConfigurationViewController updateTriggerTimeFromDate:](self, "updateTriggerTimeFromDate:", v5);

    -[WFTimeOfDayTriggerConfigurationViewController updateCalendarDayIfNeeded](self, "updateCalendarDayIfNeeded");
  }
  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");

}

- (void)updateCalendarDayIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (-[WFTimeOfDayTriggerConfigurationViewController timeOfDayInterval](self, "timeOfDayInterval") == 2)
  {
    -[WFTriggerConfigurationViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v5;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v14;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = v6;

    v8 = (void *)MEMORY[0x24BEC40E8];
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeOfDayTriggerConfigurationViewController currentSunriseTime](self, "currentSunriseTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTimeOfDayTriggerConfigurationViewController currentSunsetTime](self, "currentSunsetTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextFireDateFromNowWithTrigger:currentSunriseTime:currentSunsetTime:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "datePicker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setDate:", v12);
  }
}

- (void)updateCalendarFooterText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WFTimeOfDayTriggerConfigurationViewController calendarFooterText](self, "calendarFooterText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "footerViewForSection:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

}

- (id)calendarFooterText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BEC40E8];
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTimeOfDayTriggerConfigurationViewController currentSunriseTime](self, "currentSunriseTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTimeOfDayTriggerConfigurationViewController currentSunsetTime](self, "currentSunsetTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextFireDateFromNowWithTrigger:currentSunriseTime:currentSunsetTime:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:", 16, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v10, "setNumberStyle:", WFLocalizedNumberFormatStyle());
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "day"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringFromNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("This automation will repeat on the %@ of every month."));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)timeOffsetPickerViewController:(id)a3 didSelectOffset:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[WFTimeOfDayTriggerConfigurationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  v7 = objc_msgSend(v6, "event");

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEvent:", v7);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeOffset:", a4);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTime:", 0);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)timeOffsetPickerViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)allDaysOfWeek
{
  return &unk_24E6318E0;
}

- (id)currentDayOfMonth
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 16, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "day"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dismissKeyboard
{
  id v2;

  -[WFTimeOfDayTriggerConfigurationViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (void)dayOfWeekPickerCell:(id)a3 didChangeSelectedRecurrences:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a4, "if_map:", &__block_literal_global_14969);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDaysOfWeek:", v9);

}

- (id)dateComponentsFromTriggerDays
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daysOfWeek");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __78__WFTimeOfDayTriggerConfigurationViewController_dateComponentsFromTriggerDays__block_invoke;
  v8[3] = &unk_24E604638;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

- (_CDUserContext)userContext
{
  _CDUserContext *userContext;
  _CDUserContext *v4;
  _CDUserContext *v5;

  userContext = self->_userContext;
  if (!userContext)
  {
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v4 = (_CDUserContext *)objc_claimAutoreleasedReturnValue();
    v5 = self->_userContext;
    self->_userContext = v4;

    userContext = self->_userContext;
  }
  return userContext;
}

- (id)currentSunriseTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFTimeOfDayTriggerConfigurationViewController userContext](self, "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForSunriseSunsetDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "currentSunriseKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)currentSunsetTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFTimeOfDayTriggerConfigurationViewController userContext](self, "userContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForSunriseSunsetDataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "currentSunsetKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)timeOfDayInterval
{
  return self->_timeOfDayInterval;
}

- (void)setTimeOfDayInterval:(unint64_t)a3
{
  self->_timeOfDayInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userContext, 0);
}

void __78__WFTimeOfDayTriggerConfigurationViewController_dateComponentsFromTriggerDays__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BDBCE68];
  v4 = a2;
  v6 = objc_alloc_init(v3);
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v6, "setWeekday:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

uint64_t __98__WFTimeOfDayTriggerConfigurationViewController_dayOfWeekPickerCell_didChangeSelectedRecurrences___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "weekday"));
}

@end
