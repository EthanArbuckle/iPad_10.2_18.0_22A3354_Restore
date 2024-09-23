@implementation WFUserFocusActivityTriggerConfigurationViewController

- (WFUserFocusActivityTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFUserFocusActivityTriggerConfigurationViewController *v8;
  WFUserFocusActivityTriggerConfigurationViewController *v9;
  WFUserFocusActivityTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFUserFocusActivityTriggerConfigurationViewController.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFUserFocusActivityTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFUserFocusActivityTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v13, sel_initWithTrigger_mode_, v7, a4);
  v9 = v8;
  if (v8)
    v10 = v8;

  return v9;
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
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("identifier");
  v8 = CFSTR("cellIdentifier");
  v9[0] = CFSTR("triggerParameters");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1, v7, v8, v9[0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFUserFocusActivityTriggerConfigurationViewController;
  -[WFUserFocusActivityTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

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
  void *v7;
  char v8;
  int64_t v9;

  -[WFUserFocusActivityTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", CFSTR("triggerDescription")))
  {

  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", CFSTR("triggerParameters"));

    if ((v8 & 1) == 0)
    {
      v9 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);
      goto LABEL_6;
    }
  }
  v9 = 1;
LABEL_6:

  return v9;
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
  void *v13;
  id v14;
  void *v15;
  void *v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;

  v6 = a4;
  v7 = a3;
  -[WFUserFocusActivityTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSelectionStyle:", 0);
  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  if (v12)
  {
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTrigger:", v13);
  }
  else
  {
    v14 = v10;
    v40 = v8;
    v41 = v6;
    v39 = v9;
    v34 = v10;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v36 = v15;

    v16 = (void *)MEMORY[0x24BEC3D40];
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activityGlyphName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enteringSymbolForSymbolName:", v18);
    v37 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BEC3D40];
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activityGlyphName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "exitingSymbolForSymbolName:", v21);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEC14E0], "triggerConfigurationSymbolNamed:renderingMode:", v37, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC14E0], "triggerConfigurationSymbolNamed:renderingMode:", v38, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "onLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "displayGlyphTintColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "offLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "displayGlyphTintColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "configureWithLeftGlyph:leftTitle:leftTintColor:rightGlyph:rightTitle:rightTintColor:", v42, v23, v25, v22, v27, v29);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setLeftViewSelected:", objc_msgSend(v30, "onEnable"));

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setRightViewSelected:", objc_msgSend(v31, "onDisable"));

    v13 = (void *)v37;
    objc_msgSend(v36, "setDelegate:", self);

    v8 = v40;
    v6 = v41;
    v9 = v39;
    v10 = v34;
  }

  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[WFUserFocusActivityTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v5, v6);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFUserFocusActivityTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cell:(id)a3 didSelectOptionWithLeftViewSelected:(BOOL)a4 rightViewSelected:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  -[WFTriggerConfigurationViewController trigger](self, "trigger", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOnEnable:", v6);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOnDisable:", v5);

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

@end
