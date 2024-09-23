@implementation WFWorkoutTriggerConfigurationViewController

- (WFWorkoutTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFWorkoutTriggerConfigurationViewController *v8;
  WFWorkoutTriggerConfigurationViewController *v9;
  WFWorkoutTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWorkoutTriggerConfigurationViewController.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFWorkoutTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFWorkoutTriggerConfigurationViewController;
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)customSections
{
  objc_class *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("identifier");
  v12[1] = CFSTR("cellIdentifier");
  v13[0] = CFSTR("workoutType");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v10[1] = CFSTR("cellIdentifier");
  v11[0] = CFSTR("workoutParameter");
  v10[0] = CFSTR("identifier");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateUI
{
  id v2;

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFWorkoutTriggerConfigurationViewController;
  -[WFWorkoutTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
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
  int64_t v6;

  -[WFWorkoutTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);

  return v6;
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
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
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
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;

  v6 = a4;
  v7 = a3;
  -[WFWorkoutTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    goto LABEL_20;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", CFSTR("workoutType"));

  v15 = v10;
  v16 = v15;
  if (v14)
  {
    WFLocalizedString(CFSTR("Workout Type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "selection");

    if (v20 == 1)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "selectedWorkoutTypes");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "selectedWorkoutTypes");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");

        if (v38 == 1)
        {
          v39 = objc_alloc(MEMORY[0x24BEC41F8]);
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "selectedWorkoutTypes");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "firstObject");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v9;
          v43 = (void *)objc_msgSend(v39, "initWithActivityType:", objc_msgSend(v41, "unsignedIntegerValue"));
          objc_msgSend(v43, "name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v42;
        }
        else
        {
          v48 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("Any of %lu types"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "selectedWorkoutTypes");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "localizedStringWithFormat:", v49, objc_msgSend(v51, "count"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_19;
      }
      v21 = CFSTR("Choose");
    }
    else
    {
      if (v20)
      {
        v44 = 0;
LABEL_19:
        objc_msgSend(v16, "detailTextLabel");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setText:", v44);

        goto LABEL_20;
      }
      v21 = CFSTR("Any Workout");
    }
    WFLocalizedString(v21);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v58 = v9;
  v55 = v6;
  v53 = v10;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v16;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v59 = v22;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "onIcon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "onLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "onIconTintColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "offIcon");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "offLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "offIconTintColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "configureWithLeftGlyph:leftTitle:leftTintColor:rightGlyph:rightTitle:rightTintColor:", v23, v24, v25, v26, v28, v30);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setLeftViewSelected:", objc_msgSend(v31, "onStart"));

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setRightViewSelected:", objc_msgSend(v32, "onEnd"));

  objc_msgSend(v59, "setDelegate:", self);
  v9 = v58;
  v6 = v55;
  v10 = v53;
LABEL_20:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  return v46;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFWorkoutTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  WFTriggerTableViewController *v14;
  void *v15;
  WFTriggerTableViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFWorkoutTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("workoutType"));

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEC41F8], "allTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __81__WFWorkoutTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v20[3] = &unk_24E603118;
    v20[4] = self;
    objc_msgSend(v10, "if_map:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "selection") == 0;

    v14 = [WFTriggerTableViewController alloc];
    WFLocalizedString(CFSTR("Any Workout"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[WFTriggerTableViewController initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:](v14, "initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:", v11, v13, v15, 0);

    WFLocalizedString(CFSTR("Choose Workouts"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTableViewController setTitle:](v16, "setTitle:", v17);

    -[WFTriggerTableViewController setDelegate:](v16, "setDelegate:", self);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v16);
    -[WFWorkoutTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, 0);

  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
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
  objc_msgSend(v8, "setOnStart:", v6);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOnEnd:", v5);

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v14 = a5;
  v8 = a3;
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    objc_msgSend(v9, "setSelection:", 0);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectedWorkoutTypes:", MEMORY[0x24BDBD1A8]);
  }
  else
  {
    objc_msgSend(v9, "setSelection:", 1);

    objc_msgSend(v14, "if_map:", &__block_literal_global);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelectedWorkoutTypes:", v11);

  }
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __117__WFWorkoutTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

WFSelectableListOption *__81__WFWorkoutTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFSelectableListOption *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  WFSelectableListOption *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = [WFSelectableListOption alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = objc_msgSend(v3, "activityType");

  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFSelectableListOption initWithDisplayTitle:value:](v4, "initWithDisplayTitle:value:", v5, v8);

  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedWorkoutTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSelectableListOption value](v9, "value");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSelectableListOption setSelected:](v9, "setSelected:", objc_msgSend(v11, "containsObject:", v12));

  return v9;
}

@end
