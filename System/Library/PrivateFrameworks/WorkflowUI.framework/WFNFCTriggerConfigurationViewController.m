@implementation WFNFCTriggerConfigurationViewController

- (WFNFCTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFNFCTriggerConfigurationViewController *v8;
  WFNFCTriggerConfigurationViewController *v9;
  WFNFCTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFNFCTriggerConfigurationViewController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFNFCTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFNFCTriggerConfigurationViewController;
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
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("cellIdentifier");
  v8[0] = CFSTR("triggerParameters");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  return v2;
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
  v5.super_class = (Class)WFNFCTriggerConfigurationViewController;
  -[WFNFCTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
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

  -[WFNFCTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  v7 = a3;
  -[WFNFCTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescription"));

  if (v12)
  {
    objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
    objc_msgSend(v10, "setSelectionStyle:", 0);
    objc_msgSend(v10, "setAccessoryType:", 0);
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("triggerParameters"));

    if (v14)
    {
      WFLocalizedString(CFSTR("NFC Tag"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setText:", v15);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "tagIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "detailTextLabel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setText:", v20);

      }
      else
      {
        WFLocalizedString(CFSTR("Scan"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "detailTextLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setText:", v19);
      }

    }
  }
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFNFCTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  _QWORD v10[5];

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFNFCTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("triggerParameters"));

  if (v9)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v10[3] = &unk_24E6031A8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x24BE6B5A0], "sharedHardwareManager:", v10);
  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);

}

- (void)readerSession:(id)a3 didDetectTags:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  WFNFCTriggerConfigurationViewController *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v16 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]";
    v17 = 2114;
    v18 = v6;
    v19 = 2050;
    v20 = objc_msgSend(v7, "count");
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_DEBUG, "%s session (%{public}@) detected %{public}lu tags: %@", buf, 0x2Au);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WFNFCTriggerConfigurationViewController_readerSession_didDetectTags___block_invoke;
  block[3] = &unk_24E604ED0;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)readerSessionDidEndUnexpectedly:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[WFNFCTriggerConfigurationViewController readerSessionDidEndUnexpectedly:]";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_ERROR, "%s session (%{public}@) ended unexpectedly", (uint8_t *)&v5, 0x16u);
  }

}

- (void)showNameStep
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  WFNFCTriggerConfigurationViewController *v18;

  v3 = (void *)MEMORY[0x24BEBD3B0];
  WFLocalizedString(CFSTR("Name This Tag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  WFLocalizedString(CFSTR("OK"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke;
  v16[3] = &unk_24E6044F8;
  v17 = v5;
  v18 = self;
  v9 = v5;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setEnabled:", 0);
  objc_msgSend(v9, "addAction:", v10);
  v11 = (void *)MEMORY[0x24BEBD3A8];
  WFLocalizedString(CFSTR("Cancel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_2;
  v15[3] = &unk_24E6044D0;
  v15[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v13);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_3;
  v14[3] = &unk_24E603B98;
  v14[4] = self;
  objc_msgSend(v9, "addTextFieldWithConfigurationHandler:", v14);
  -[WFNFCTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)alertTextFieldDidChange:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WFNFCTriggerConfigurationViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length") != 0;
      objc_msgSend(v4, "actions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setEnabled:", v6);

    }
  }

}

uint64_t __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "textFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "trigger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTagIdentifier:", 0);

    objc_msgSend(*(id *)(a1 + 40), "trigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", 0);
  }

  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

  return objc_msgSend(*(id *)(a1 + 40), "updateNextButtonEnabledState");
}

uint64_t __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTagIdentifier:", 0);

  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", 0);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateNextButtonEnabledState");
}

void __55__WFNFCTriggerConfigurationViewController_showNameStep__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setAutocapitalizationType:", 1);
  objc_msgSend(v4, "setClearButtonMode:", 3);
  objc_msgSend(v4, "setReturnKeyType:", 9);
  WFLocalizedString(CFSTR("Name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v3);

  objc_msgSend(v4, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_alertTextFieldDidChange_, 0x20000);
}

void __71__WFNFCTriggerConfigurationViewController_readerSession_didDetectTags___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "tagID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_hexStringFromData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uppercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v12 = 136315394;
        v13 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]_block_invoke";
        v14 = 2112;
        v15 = v7;
        _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_INFO, "%s Got NFC tagIdentifier: (%@)", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(a1[6], "trigger");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTagIdentifier:", v7);

      objc_msgSend(a1[6], "showNameStep");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315394;
        v13 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]_block_invoke";
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_ERROR, "%s No tagID from tag (%@)", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(a1[6], "updateNextButtonEnabledState");
    }
    objc_msgSend(a1[5], "endSession");

  }
  else
  {
    getWFTriggersLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[WFNFCTriggerConfigurationViewController readerSession:didDetectTags:]_block_invoke";
      _os_log_impl(&dword_22007E000, v11, OS_LOG_TYPE_ERROR, "%s No tags detected", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(a1[5], "endSession");
    objc_msgSend(a1[6], "updateNextButtonEnabledState");
  }

}

id __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v3[3] = &unk_24E603180;
  v3[4] = *(_QWORD *)(a1 + 32);
  return (id)objc_msgSend(a2, "startReaderSessionWithActionSheetUI:", v3);
}

void __77__WFNFCTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WFLocalizedString(CFSTR("Hold your device near the NFC tag."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v5, "updateUIAlertMessage:", v7);

    objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "startPolling");
  }
  else
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[WFNFCTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]_block_invoke_2";
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_22007E000, v9, OS_LOG_TYPE_ERROR, "%s Could not start reader session with error: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

@end
