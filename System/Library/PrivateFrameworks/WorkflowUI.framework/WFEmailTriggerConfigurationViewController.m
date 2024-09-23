@implementation WFEmailTriggerConfigurationViewController

- (WFEmailTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFEmailTriggerConfigurationViewController *v8;
  NSArray *v9;
  NSArray *allAccounts;
  WFEmailTriggerConfigurationViewController *v11;
  void *v13;
  objc_super v14;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFEmailTriggerConfigurationViewController.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFEmailTrigger class]]"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFEmailTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v14, sel_initWithTrigger_mode_, v7, a4);
  if (v8)
  {
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    allAccounts = v8->_allAccounts;
    v8->_allAccounts = v9;

    -[WFEmailTriggerConfigurationViewController setUpAccounts](v8, "setUpAccounts");
    v11 = v8;
  }

  return v8;
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
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v23[0] = CFSTR("identifier");
  v23[1] = CFSTR("cellIdentifier");
  v24[0] = CFSTR("senderSection");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  v21[1] = CFSTR("cellIdentifier");
  v22[0] = CFSTR("subjectContainsSection");
  v21[0] = CFSTR("identifier");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v6;
  v20[0] = CFSTR("accountSection");
  v19[0] = CFSTR("identifier");
  v19[1] = CFSTR("sectionTitle");
  WFLocalizedString(CFSTR("Additional filters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  v19[2] = CFSTR("cellIdentifier");
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v10;
  v17[1] = CFSTR("cellIdentifier");
  v18[0] = CFSTR("recipientSection");
  v17[0] = CFSTR("identifier");
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)supportedAccountTypeIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB4030];
  v7[0] = *MEMORY[0x24BDB3FD8];
  v7[1] = v2;
  v3 = *MEMORY[0x24BDB4160];
  v7[2] = *MEMORY[0x24BDB4068];
  v7[3] = v3;
  v4 = *MEMORY[0x24BDB4078];
  v7[4] = *MEMORY[0x24BDB3FD0];
  v7[5] = v4;
  v5 = *MEMORY[0x24BDB40F8];
  v7[6] = *MEMORY[0x24BDB4088];
  v7[7] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setUpAccounts
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDB4398]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFEmailTriggerConfigurationViewController supportedAccountTypeIdentifiers](self, "supportedAccountTypeIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "accountTypeWithAccountTypeIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFEmailTriggerConfigurationViewController allAccounts](self, "allAccounts");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "accountsWithAccountType:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFEmailTriggerConfigurationViewController setAllAccounts:](self, "setAllAccounts:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

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
  v5.super_class = (Class)WFEmailTriggerConfigurationViewController;
  -[WFEmailTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
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

  -[WFEmailTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v6 = a4;
  v7 = a3;
  -[WFEmailTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerDescriptionSection"));

  if (!v12)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("senderSection"));

    if (v14)
    {
      v15 = v10;
      WFLocalizedString(CFSTR("Sender"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v16);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "selectedSenders");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "selectedSenders");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
        v23 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v54 = (void *)v23;
        objc_msgSend(v15, "detailTextLabel");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setText:", v54);

        goto LABEL_20;
      }
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqual:", CFSTR("subjectContainsSection"));

      if (!v25)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqual:", CFSTR("accountSection"));

        if (v33)
        {
          v15 = v10;
          WFLocalizedString(CFSTR("Account"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "textLabel");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setText:", v34);

          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "selectedAccountIdentifiers");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "count");

          if (!v38)
          {
            v31 = CFSTR("Any Account");
            goto LABEL_10;
          }
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "selectedAccountIdentifiers");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "count");

          if (v41 == 1)
          {
            -[WFTriggerConfigurationViewController trigger](self, "trigger");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "selectedAccountIdentifiers");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectAtIndex:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[WFEmailTriggerConfigurationViewController accountFromAccountIdentifier:](self, "accountFromAccountIdentifier:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "accountDescription");
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_19;
          }
          v58 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedPluralString(CFSTR("Any of %lu Accounts"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "selectedAccountIdentifiers");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "localizedStringWithFormat:", v21, objc_msgSend(v64, "count"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "detailTextLabel");
          v60 = v15;
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setText:", v59);

          v15 = v60;
        }
        else
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isEqual:", CFSTR("recipientSection"));

          if (!v45)
            goto LABEL_21;
          v15 = v10;
          WFLocalizedString(CFSTR("Recipient"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "textLabel");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setText:", v46);

          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "selectedRecipients");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");

          if (!v50)
          {
            v31 = CFSTR("Any Recipient");
            goto LABEL_10;
          }
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "selectedRecipients");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "count");

          if (v53 == 1)
          {
            -[WFTriggerConfigurationViewController trigger](self, "trigger");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "selectedRecipients");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", 0);
            v23 = objc_claimAutoreleasedReturnValue();
            goto LABEL_19;
          }
          v62 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedPluralString(CFSTR("Any of %lu Recipients"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTriggerConfigurationViewController trigger](self, "trigger");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "selectedRecipients");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "localizedStringWithFormat:", v21, objc_msgSend(v64, "count"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "detailTextLabel");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setText:", v59);

        }
        goto LABEL_20;
      }
      v15 = v10;
      WFLocalizedString(CFSTR("Subject Contains"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLabel");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v26);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "selectedSubject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v30 = (void *)MEMORY[0x24BDD17C8];
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "selectedSubject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v22);
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    v31 = CFSTR("Choose");
LABEL_10:
    WFLocalizedString(v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "detailTextLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setText:", v21);
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(v10, "setSelectionStyle:", 0);
  objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
LABEL_21:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFEmailTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  WFTriggerTableViewController *v23;
  void *v24;
  WFTriggerTableViewController *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFEmailTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[WFEmailTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    v36 = 2114;
    v37 = v7;
    _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", buf, 0x16u);
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", CFSTR("senderSection"));

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BEC2F38]);
    WFLocalizedString(CFSTR("Choose Contacts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

    WFLocalizedString(CFSTR("From:"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFieldLabel:", v13);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24E631128);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSupportedPersonProperties:", v14);

    objc_msgSend(v11, "setDelegate:", self);
    -[WFEmailTriggerConfigurationViewController setSenderFieldViewController:](self, "setSenderFieldViewController:", v11);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", CFSTR("subjectContainsSection"));

    if (v16)
    {
      -[WFEmailTriggerConfigurationViewController showSubjectContainsAlert](self, "showSubjectContainsAlert");
      goto LABEL_13;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", CFSTR("accountSection"));

    if (v18)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "selectedAccountIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count") == 0;

      -[WFEmailTriggerConfigurationViewController allAccounts](self, "allAccounts");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __79__WFEmailTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v33[3] = &unk_24E603338;
      v33[4] = self;
      objc_msgSend(v22, "if_map:", v33);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v23 = [WFTriggerTableViewController alloc];
      WFLocalizedString(CFSTR("Any Account"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[WFTriggerTableViewController initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:](v23, "initWithOptions:anySelected:nameOfAnyOption:mainSectionTitle:", v11, v21, v24, 0);

      -[WFTriggerTableViewController setDelegate:](v25, "setDelegate:", self);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v25);
      -[WFEmailTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v26, 1, 0);

      goto LABEL_6;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqual:", CFSTR("recipientSection"));

    if (!v28)
      goto LABEL_13;
    v11 = objc_alloc_init(MEMORY[0x24BEC2F38]);
    WFLocalizedString(CFSTR("Choose Contacts"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v29);

    WFLocalizedString(CFSTR("To:"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFieldLabel:", v30);

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24E631128);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSupportedPersonProperties:", v31);

    objc_msgSend(v11, "setDelegate:", self);
    -[WFEmailTriggerConfigurationViewController setRecipientFieldViewController:](self, "setRecipientFieldViewController:", v11);
  }
  -[WFEmailTriggerConfigurationViewController presentNavControllerWithRootViewController:](self, "presentNavControllerWithRootViewController:", v11);
LABEL_6:

LABEL_13:
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  -[WFEmailTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)showSubjectContainsAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  WFEmailTriggerConfigurationViewController *v19;

  v3 = (void *)MEMORY[0x24BEBD3B0];
  WFLocalizedString(CFSTR("Subject Contains"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Only run this automation when the email subject line contains the following:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  WFLocalizedString(CFSTR("Done"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke;
  v17[3] = &unk_24E6044F8;
  v18 = v6;
  v19 = self;
  v10 = v6;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  WFLocalizedString(CFSTR("Cancel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_2;
  v16[3] = &unk_24E6044D0;
  v16[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v11);
  objc_msgSend(v10, "addAction:", v14);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_3;
  v15[3] = &unk_24E603B98;
  v15[4] = self;
  objc_msgSend(v10, "addTextFieldWithConfigurationHandler:", v15);
  -[WFEmailTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v14 = v6;
  if (!a4)
  {
    objc_msgSend(v6, "commitRemainingText");
    objc_msgSend(v14, "entries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "if_compactMap:", &__block_literal_global_1476);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFEmailTriggerConfigurationViewController recipientFieldViewController](self, "recipientFieldViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v14)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectedRecipients:", v8);
    }
    else
    {
      -[WFEmailTriggerConfigurationViewController senderFieldViewController](self, "senderFieldViewController");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v11 = v14;
      if (v10 != v14)
      {
LABEL_8:
        objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
        -[WFTriggerConfigurationViewController tableView](self, "tableView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "reloadData");

        -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
        goto LABEL_9;
      }
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSelectedSenders:", v8);
    }

    v11 = v14;
    goto LABEL_8;
  }
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_9:

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
  void *v14;
  id v15;

  v5 = a4;
  v15 = a5;
  v8 = a3;
  if (v5)
  {
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSelectedAccountIdentifiers:", 0);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelectedAccountDescriptions:", 0);
  }
  else
  {
    objc_msgSend(v15, "if_map:", &__block_literal_global_208);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSelectedAccountIdentifiers:", v11);

    objc_msgSend(v15, "if_map:", &__block_literal_global_209);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectedAccountDescriptions:", v10);

  }
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)triggerTableViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)accountFromAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFEmailTriggerConfigurationViewController allAccounts](self, "allAccounts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSArray)allAccounts
{
  return self->_allAccounts;
}

- (void)setAllAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_allAccounts, a3);
}

- (BOOL)showingAccounts
{
  return self->_showingAccounts;
}

- (void)setShowingAccounts:(BOOL)a3
{
  self->_showingAccounts = a3;
}

- (BOOL)showingRecipients
{
  return self->_showingRecipients;
}

- (void)setShowingRecipients:(BOOL)a3
{
  self->_showingRecipients = a3;
}

- (UIViewController)senderFieldViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_senderFieldViewController);
}

- (void)setSenderFieldViewController:(id)a3
{
  objc_storeWeak((id *)&self->_senderFieldViewController, a3);
}

- (UIViewController)recipientFieldViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_recipientFieldViewController);
}

- (void)setRecipientFieldViewController:(id)a3
{
  objc_storeWeak((id *)&self->_recipientFieldViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recipientFieldViewController);
  objc_destroyWeak((id *)&self->_senderFieldViewController);
  objc_storeStrong((id *)&self->_allAccounts, 0);
}

uint64_t __115__WFEmailTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayTitle");
}

uint64_t __115__WFEmailTriggerConfigurationViewController_triggerTableViewController_didFinishWithAnySelected_orSelectedOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "value");
}

id __88__WFEmailTriggerConfigurationViewController_recipientViewControllerDidFinish_cancelled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "contact");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "emailAddresses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "emailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "textFields");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    v4 = v7;
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 40), "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedSubject:", v4);

  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  objc_msgSend(*(id *)(a1 + 40), "updateNextButtonEnabledState");
}

uint64_t __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateNextButtonEnabledState");
}

void __69__WFEmailTriggerConfigurationViewController_showSubjectContainsAlert__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setAutocapitalizationType:", 0);
  objc_msgSend(v3, "setClearButtonMode:", 3);
  objc_msgSend(v3, "setReturnKeyType:", 9);
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedSubject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  WFLocalizedStringWithKey(CFSTR("Anything prompt"), CFSTR("Anything"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholder:", v6);

}

WFSelectableListOption *__79__WFEmailTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  WFSelectableListOption *v4;
  void *v5;
  void *v6;
  WFSelectableListOption *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = [WFSelectableListOption alloc];
  objc_msgSend(v3, "accountDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFSelectableListOption initWithDisplayTitle:value:](v4, "initWithDisplayTitle:value:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedAccountIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFSelectableListOption setSelected:](v7, "setSelected:", objc_msgSend(v9, "containsObject:", v10));
  return v7;
}

@end
