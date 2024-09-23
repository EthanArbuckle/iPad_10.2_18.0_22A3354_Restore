@implementation WFLocationTriggerConfigurationViewController

- (WFLocationTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v6;
  WFLocationTriggerConfigurationViewController *v7;
  WFLocationTriggerConfigurationViewController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationTriggerConfigurationViewController;
  v7 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v10, sel_initWithTrigger_mode_, v6, a4);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7->_isArrive = 1;
    v8 = v7;
  }

  return v7;
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
  v13[0] = CFSTR("chooseLocation");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v10[1] = CFSTR("cellIdentifier");
  v11[0] = CFSTR("chooseTime");
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

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLocationTriggerConfigurationViewController;
  -[WFLocationTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[WFLocationTriggerConfigurationViewController checkLocationAuthorization](self, "checkLocationAuthorization");
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)checkLocationAuthorization
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/ShortcutsLocation.bundle"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFLocationTriggerConfigurationViewController setIsLocationBasedAlertsEnabled:](self, "setIsLocationBasedAlertsEnabled:", objc_msgSend(MEMORY[0x24BDBFA88], "authorizationStatusForBundle:", v3) == 3);

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

  -[WFLocationTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("chooseTime"));

  if ((v7 & 1) != 0)
    v8 = 2;
  else
    v8 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFLocationTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  -[WFLocationTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("chooseLocation"));

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setHorizontalPadding:", 0.0);
    -[WFLocationTriggerConfigurationViewController textForSummaryFooterView](self, "textForSummaryFooterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)textForSummaryFooterView
{
  __CFString *v2;

  if (-[WFLocationTriggerConfigurationViewController isLocationBasedAlertsEnabled](self, "isLocationBasedAlertsEnabled"))
  {
    v2 = CFSTR("This automation is controlled by the location of this device.");
  }
  else
  {
    v2 = CFSTR("Location-based automations will not run until you enable Alerts & Shortcuts Automations in Settings > Privacy & Security > Location Services > System Services.");
  }
  WFLocalizedString(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
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
  int v24;
  void *v25;
  uint64_t v26;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v6 = a4;
  v7 = a3;
  -[WFLocationTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("chooseLocation"));

  if (v12)
  {
    v10 = v10;
    WFLocalizedString(CFSTR("Location"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "region");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "region");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "detailTextLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v21);

    }
    else
    {
      WFLocalizedString(CFSTR("Choose"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "detailTextLabel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v18);
    }

    goto LABEL_16;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("chooseTime"));

  if (!v24)
    goto LABEL_16;
  if (objc_msgSend(v6, "row"))
  {
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "startTime");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = (void *)v26;
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "endTime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
LABEL_10:
        WFLocalizedString(CFSTR("Time Range"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setText:", v37);

LABEL_15:
        goto LABEL_16;
      }
      -[WFLocationTriggerConfigurationViewController dateFormatter](self, "dateFormatter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, CFSTR("subtitleCell"));

      WFLocalizedString(CFSTR("Time Range"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "textLabel");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", v30);

      v47 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("%@ to %@"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "startTime");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringFromDate:", v49);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "endTime");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringFromDate:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringWithFormat:", v48, v46, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "detailTextLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setText:", v35);

      v10 = v51;
      objc_msgSend(v51, "setAccessoryType:", 3);
    }

    goto LABEL_10;
  }
  WFLocalizedString(CFSTR("Any Time"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setText:", v39);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "startTime");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {

    goto LABEL_15;
  }
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "endTime");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    objc_msgSend(v10, "setAccessoryType:", 3);
LABEL_16:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  WFTimeRangePickerViewController *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  WFTimeRangePickerViewController *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFLocationTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[WFLocationTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    v54 = 2114;
    v55 = v7;
    _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("chooseLocation"));

  if (v10)
  {
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "region");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x24BDBFA80]);
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "region");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "center");
      v17 = v16;
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "region");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "center");
      v20 = (void *)objc_msgSend(v13, "initWithLatitude:longitude:", v17);

      v21 = (void *)MEMORY[0x24BDBFAC8];
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "region");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "placemarkWithLocation:name:postalAddress:", v20, v24, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_alloc(MEMORY[0x24BDBFAC8]);
      objc_msgSend(v51, "addressDictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "region");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v25, "initWithLocation:addressDictionary:region:areasOfInterest:", v20, v26, v28, 0);

      v30 = objc_alloc(MEMORY[0x24BEC3E90]);
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "region");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v30, "initWithLocationName:placemark:", v33, v29);

      v35 = (WFTimeRangePickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2F00]), "initWithPickerType:value:", 1, v34);
    }
    else
    {
      v35 = (WFTimeRangePickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2F00]), "initWithPickerType:value:", 1, 0);
    }
    -[WFTimeRangePickerViewController setAllowsPickingCurrentLocation:](v35, "setAllowsPickingCurrentLocation:", 1);
    -[WFTimeRangePickerViewController setResolvesCurrentLocationToPlacemark:](v35, "setResolvesCurrentLocationToPlacemark:", 1);
    -[WFTimeRangePickerViewController setDelegate:](v35, "setDelegate:", self);
    -[WFTimeRangePickerViewController setRegionCondition:](v35, "setRegionCondition:", -[WFLocationTriggerConfigurationViewController isArrive](self, "isArrive") ^ 1);
    goto LABEL_17;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isEqual:", CFSTR("chooseTime"));

  if (v37)
  {
    v38 = objc_msgSend(v6, "row");
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v38)
    {
      objc_msgSend(v39, "setStartTime:", 0);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v35 = (WFTimeRangePickerViewController *)objc_claimAutoreleasedReturnValue();
      -[WFTimeRangePickerViewController setEndTime:](v35, "setEndTime:", 0);
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v39, "startTime");
    v41 = objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      v42 = (void *)v41;
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "endTime");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        v45 = [WFTimeRangePickerViewController alloc];
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "startTime");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "endTime");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = -[WFTimeRangePickerViewController initWithStartTime:endTime:](v45, "initWithStartTime:endTime:", v47, v49);

LABEL_16:
        -[WFTimeRangePickerViewController setDelegate:](v35, "setDelegate:", self);
LABEL_17:
        -[WFLocationTriggerConfigurationViewController presentNavigationControllerWithRootViewController:](self, "presentNavigationControllerWithRootViewController:", v35);
        goto LABEL_18;
      }
    }
    else
    {

    }
    v35 = objc_alloc_init(WFTimeRangePickerViewController);
    goto LABEL_16;
  }
LABEL_19:
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)presentNavigationControllerWithRootViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);
  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  if ((v4 & 1) != 0)
    objc_msgSend(v6, "setModalPresentationStyle:", 0);
  -[WFLocationTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  void *v5;
  NSDateFormatter *v6;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setTimeZone:](v4, "setTimeZone:", v5);

    -[NSDateFormatter setDateStyle:](v4, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](v4, "setTimeStyle:", 1);
    v6 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  _BOOL8 v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[WFLocationTriggerConfigurationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(v5, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v17 = 136315906;
      v18 = "WFEnforceClass";
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = (id)objc_opt_class();
      v23 = 2114;
      v24 = v8;
      v12 = v22;
      _os_log_impl(&dword_22007E000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v17, 0x2Au);

    }
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  v13 = -[WFLocationTriggerConfigurationViewController isArrive](self, "isArrive");
  v14 = v13 ^ 1;
  objc_msgSend(v10, "setNotifyOnEntry:", v13);
  objc_msgSend(v10, "setNotifyOnExit:", v14);
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRegion:", v10);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)locationPickerDidCancel:(id)a3
{
  id v4;

  -[WFLocationTriggerConfigurationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)timeRangePickerViewController:(id)a3 didPickStartTime:(id)a4 endTime:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  -[WFLocationTriggerConfigurationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStartTime:", v8);

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEndTime:", v7);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)timeRangePickerViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)isLocationBasedAlertsEnabled
{
  return self->_isLocationBasedAlertsEnabled;
}

- (void)setIsLocationBasedAlertsEnabled:(BOOL)a3
{
  self->_isLocationBasedAlertsEnabled = a3;
}

- (BOOL)isArrive
{
  return self->_isArrive;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
