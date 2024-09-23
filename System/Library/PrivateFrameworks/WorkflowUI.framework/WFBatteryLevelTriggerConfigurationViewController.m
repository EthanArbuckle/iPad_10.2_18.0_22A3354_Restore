@implementation WFBatteryLevelTriggerConfigurationViewController

- (WFBatteryLevelTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFBatteryLevelTriggerConfigurationViewController *v8;
  WFBatteryLevelTriggerConfigurationViewController *v9;
  WFBatteryLevelTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFBatteryLevelTriggerConfigurationViewController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFBatteryLevelTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFBatteryLevelTriggerConfigurationViewController;
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
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
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
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("triggerLevel");
  v12[0] = CFSTR("identifier");
  v12[1] = CFSTR("cellIdentifier");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = CFSTR("numberRows");
  v13[1] = v3;
  v13[2] = &unk_24E631278;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v11[0] = CFSTR("triggerParameters");
  v10[0] = CFSTR("identifier");
  v10[1] = CFSTR("cellIdentifier");
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = CFSTR("numberRows");
  v11[1] = v6;
  v11[2] = &unk_24E631290;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  int v7;
  void *v8;
  int64_t v9;

  -[WFBatteryLevelTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("triggerParameters"));

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numberRows"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);
  }

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
  int v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;

  v6 = a4;
  v7 = a3;
  -[WFBatteryLevelTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("triggerDescription"));

  if (!v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("triggerLevel"));

    if (v14)
    {
      v15 = v10;
      objc_msgSend(v15, "setDelegate:", self);
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "configureWithInitialValue:maximumValue:minimumValue:stepValue:", (double)(unint64_t)objc_msgSend(v16, "level"), 100.0, 0.0, 5.0);

      goto LABEL_19;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("triggerParameters"));

    if (!v18)
      goto LABEL_19;
    objc_msgSend(v10, "setAccessoryType:", 0);
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFBatteryLevelTriggerConfigurationViewController localizedTextForCellAtIndexPath:value:](self, "localizedTextForCellAtIndexPath:value:", v6, (double)(unint64_t)objc_msgSend(v19, "level"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v20);

    v22 = objc_msgSend(v6, "row");
    if (v22 == 2)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "selection");

      if (v26 == 2)
        objc_msgSend(v10, "setAccessoryType:", 3);
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "level");

      if (v28)
        goto LABEL_14;
    }
    else
    {
      if (v22 != 1)
      {
        if (!v22)
        {
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "selection");

          if (!v24)
            objc_msgSend(v10, "setAccessoryType:", 3);
        }
LABEL_14:
        -[WFBatteryLevelTriggerConfigurationViewController enableRowVisibilityFor:](self, "enableRowVisibilityFor:", v10);
        goto LABEL_19;
      }
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "selection");

      if (v30 == 1)
        objc_msgSend(v10, "setAccessoryType:", 3);
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "level");

      if (v32 <= 0x63)
        goto LABEL_14;
    }
    -[WFBatteryLevelTriggerConfigurationViewController disableRowVisibilityFor:](self, "disableRowVisibilityFor:", v10);
    goto LABEL_19;
  }
  objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
  objc_msgSend(v10, "setSelectionStyle:", 0);
LABEL_19:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFBatteryLevelTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v13, 1);
  -[WFBatteryLevelTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v13, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("triggerParameters"));

  if (v8)
  {
    v9 = objc_msgSend(v13, "row");
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelection:", v9);

    -[WFTriggerConfigurationViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(v13, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadSections:withRowAnimation:", v12, 100);

  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v13, v6);
  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");

}

- (void)sliderValueChangedToValue:(double)a3
{
  unint64_t v5;
  void *v6;

  v5 = (unint64_t)a3;
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLevel:", v5);

  -[WFBatteryLevelTriggerConfigurationViewController updateCellLabelsWithValue:](self, "updateCellLabelsWithValue:", a3);
}

- (NSNumber)parameterSectionIndex
{
  NSNumber *parameterSectionIndex;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  parameterSectionIndex = self->_parameterSectionIndex;
  if (!parameterSectionIndex)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[WFTriggerConfigurationViewController sections](self, "sections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_6335));
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_parameterSectionIndex;
    self->_parameterSectionIndex = v6;

    parameterSectionIndex = self->_parameterSectionIndex;
  }
  return parameterSectionIndex;
}

- (void)updateCellLabelsWithValue:(double)a3
{
  void *v5;
  void *v6;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v5 = (void *)MEMORY[0x24BDD15D8];
  -[WFBatteryLevelTriggerConfigurationViewController parameterSectionIndex](self, "parameterSectionIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForRow:inSection:", 0, objc_msgSend(v6, "integerValue"));
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD15D8];
  -[WFBatteryLevelTriggerConfigurationViewController parameterSectionIndex](self, "parameterSectionIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForRow:inSection:", 1, objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD15D8];
  -[WFBatteryLevelTriggerConfigurationViewController parameterSectionIndex](self, "parameterSectionIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForRow:inSection:", 2, objc_msgSend(v11, "integerValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cellForRowAtIndexPath:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellForRowAtIndexPath:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cellForRowAtIndexPath:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFBatteryLevelTriggerConfigurationViewController localizedTextForCellAtIndexPath:value:](self, "localizedTextForCellAtIndexPath:value:", v25, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v19);

  -[WFBatteryLevelTriggerConfigurationViewController localizedTextForCellAtIndexPath:value:](self, "localizedTextForCellAtIndexPath:value:", v9, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v21);

  -[WFBatteryLevelTriggerConfigurationViewController localizedTextForCellAtIndexPath:value:](self, "localizedTextForCellAtIndexPath:value:", v12, a3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  -[WFBatteryLevelTriggerConfigurationViewController enableRowVisibilityFor:](self, "enableRowVisibilityFor:", v16);
  -[WFBatteryLevelTriggerConfigurationViewController enableRowVisibilityFor:](self, "enableRowVisibilityFor:", v18);
  if (a3 >= 100.0)
    -[WFBatteryLevelTriggerConfigurationViewController disableRowVisibilityFor:](self, "disableRowVisibilityFor:", v16);
  if (a3 <= 0.0)
    -[WFBatteryLevelTriggerConfigurationViewController disableRowVisibilityFor:](self, "disableRowVisibilityFor:", v18);

}

- (void)disableRowVisibilityFor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  objc_msgSend(v9, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  objc_msgSend(v9, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  if (objc_msgSend(v9, "accessoryType") == 3)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAccessoryType:", 3);
    objc_msgSend(v9, "setAccessoryType:", 0);

  }
}

- (void)enableRowVisibilityFor:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  objc_msgSend(v3, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  objc_msgSend(v3, "detailTextLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEnabled:", 1);
}

- (id)localizedTextForCellAtIndexPath:(id)a3 value:(double)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD16F0];
  v7 = a4 / 100.0;
  *(float *)&v7 = a4 / 100.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringFromNumber:numberStyle:", v8, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "row"))
  {
    if (objc_msgSend(v5, "row") == 1)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = CFSTR("Rises Above %@");
    }
    else
    {
      if (objc_msgSend(v5, "row") != 2)
      {
        v13 = 0;
        goto LABEL_8;
      }
      v10 = (void *)MEMORY[0x24BDD17C8];
      v11 = CFSTR("Falls Below %@");
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = CFSTR("Equals %@");
  }
  WFLocalizedString(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSectionIndex, 0);
}

uint64_t __73__WFBatteryLevelTriggerConfigurationViewController_parameterSectionIndex__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFString *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("identifier"));
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("triggerParameters"))
  {
    v4 = 1;
  }
  else if (v2)
  {
    v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("triggerParameters"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
