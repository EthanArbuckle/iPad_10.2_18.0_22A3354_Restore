@implementation WFSoundRecognitionTriggerConfigurationViewController

- (WFSoundRecognitionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFSoundRecognitionTriggerConfigurationViewController *v8;
  WFSoundRecognitionTriggerConfigurationViewController *v9;
  WFSoundRecognitionTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSoundRecognitionTriggerConfigurationViewController.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFSoundRecognitionTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFSoundRecognitionTriggerConfigurationViewController;
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
  void *v5;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("identifier");
  v8 = CFSTR("cellIdentifier");
  v9[0] = CFSTR("chooseSound");
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

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  id v7;

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", v4, v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleDidBecomeActive, *MEMORY[0x24BEBDF88], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;

  -[WFTriggerConfigurationViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)handleDidBecomeActive
{
  id v2;

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

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

  -[WFSoundRecognitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  unint64_t v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void (**v37)(_QWORD);
  void *v38;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD aBlock[4];
  id v44;

  v6 = a3;
  v7 = a4;
  -[WFSoundRecognitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v7, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  v13 = 0x24BEC3000;
  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    objc_msgSend(v10, "setSelectionStyle:", 0);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", CFSTR("chooseSound"));

    if (v15)
    {
      v16 = v10;
      WFLocalizedString(CFSTR("Sound"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setText:", v17);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "soundDetectionTypes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "soundDetectionTypes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24 == 1)
        {
          v25 = (void *)MEMORY[0x24BEC3A18];
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "soundDetectionTypes");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "anyObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "localizedNameForSoundDetectionType:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v41;
        }
        else
        {
          v42 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedPluralString(CFSTR("Any of %d Sounds"));
          v40 = objc_claimAutoreleasedReturnValue();
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "soundDetectionTypes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringWithFormat:", v40, objc_msgSend(v31, "count"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = (void *)v40;
        }

      }
      else
      {
        WFLocalizedString(CFSTR("Choose"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "detailTextLabel");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setText:", v28);

      v13 = 0x24BEC3000uLL;
    }
  }
  v33 = objc_msgSend(*(id *)(v13 + 2584), "soundDetectionEnabled");
  objc_msgSend(v10, "setUserInteractionEnabled:", v33);
  objc_msgSend(v10, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setEnabled:", v33);

  objc_msgSend(v10, "detailTextLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setEnabled:", v33);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__WFSoundRecognitionTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke;
  aBlock[3] = &unk_24E604D88;
  v36 = v10;
  v44 = v36;
  v37 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v36, v7, v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2](v37);

  return v38;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFSoundRecognitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  -[WFSoundRecognitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("chooseSound"));

  if (v9)
  {
    -[WFSoundRecognitionTriggerConfigurationViewController footerLinkViewForTableView:](self, "footerLinkViewForTableView:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)footerLinkViewForTableView:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BEC3A18], "soundDetectionEnabled") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dequeueReusableHeaderFooterViewWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=ACCESSIBILITY&path=SOUND_RECOGNITION_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      WFLocalizedString(CFSTR("You can enable Sound Recognition in the Settings app."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Open Settings…"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rangeOfString:", v11);
      objc_msgSend(v8, "setText:URL:linkRange:", v12, v9, v13, v14);
      objc_msgSend(v8, "setDelegate:", self);
      v5 = v8;

    }
    else
    {
      getWFTriggersLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v18 = "-[WFSoundRecognitionTriggerConfigurationViewController footerLinkViewForTableView:]";
        _os_log_impl(&dword_22007E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to get Sound Recognition setting url", buf, 0xCu);
      }

      v5 = 0;
    }

  }
  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  WFTriggerTableViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFSoundRecognitionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("chooseSound"));

  if (v9)
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFSoundRecognitionTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      v19 = 2114;
      v20 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
    }

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __90__WFSoundRecognitionTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_24E6035D0;
    v16[4] = self;
    objc_msgSend(MEMORY[0x24BEC3A18], "mapLocalizedSupportedSoundDetectionTypesUsingBlock:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFTriggerTableViewController initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:]([WFTriggerTableViewController alloc], "initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:", v11, 0, 0, 0);
    -[WFTriggerTableViewController setDelegate:](v12, "setDelegate:", self);
    WFLocalizedString(CFSTR("Choose Sound"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerTableViewController setTitle:](v12, "setTitle:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v12);
    -[WFSoundRecognitionTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

}

- (BOOL)shouldEnableNextButton
{
  void *v2;
  char v3;

  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasValidConfiguration"))
    v3 = objc_msgSend(MEMORY[0x24BEC3A18], "soundDetectionEnabled");
  else
    v3 = 0;

  return v3;
}

- (void)triggerTableViewController:(id)a3 didFinishWithAnySelected:(BOOL)a4 orSelectedOptions:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = a3;
  objc_msgSend(a5, "if_map:", &__block_literal_global_3085);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSoundDetectionTypes:", v10);

  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)footerLinkView:(id)a3 didTapURL:(id)a4
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE193A0];
  v5 = a4;
  objc_msgSend(v4, "sharedContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:", v5);

}

uint64_t __126__WFSoundRecognitionTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

WFSelectableListOption *__90__WFSoundRecognitionTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  WFSelectableListOption *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a2;
  v7 = -[WFSelectableListOption initWithDisplayTitle:value:]([WFSelectableListOption alloc], "initWithDisplayTitle:value:", v6, v5);

  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "soundDetectionTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v5);

  -[WFSelectableListOption setSelected:](v7, "setSelected:", v10);
  return v7;
}

uint64_t __88__WFSoundRecognitionTriggerConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BEC3A18], "soundDetectionEnabled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setAccessoryType:", 0);
  return result;
}

@end
