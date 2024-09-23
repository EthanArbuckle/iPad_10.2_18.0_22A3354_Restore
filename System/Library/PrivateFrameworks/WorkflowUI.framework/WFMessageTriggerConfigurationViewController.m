@implementation WFMessageTriggerConfigurationViewController

- (WFMessageTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFMessageTriggerConfigurationViewController *v8;
  WFMessageTriggerConfigurationViewController *v9;
  WFMessageTriggerConfigurationViewController *v10;
  void *v12;
  objc_super v13;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFMessageTriggerConfigurationViewController.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFMessageTrigger class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFMessageTriggerConfigurationViewController;
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
  v13[0] = CFSTR("senderSection");
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v10[1] = CFSTR("cellIdentifier");
  v11[0] = CFSTR("messageContains");
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
  v5.super_class = (Class)WFMessageTriggerConfigurationViewController;
  -[WFMessageTriggerConfigurationViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
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

  -[WFMessageTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;

  v6 = a4;
  v7 = a3;
  -[WFMessageTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
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
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("senderSection"));

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

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "selectedSenders");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v20 == 1)
      {
        objc_msgSend(v22, "objectAtIndex:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE193D0], "contactWithCNContact:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "triggerDisplayName");
        v26 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v34 = (void *)v26;
        objc_msgSend(v15, "detailTextLabel");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setText:", v34);

LABEL_13:
        goto LABEL_14;
      }
      v36 = objc_msgSend(v22, "count");

      if (v36 >= 2)
      {
        v37 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Any of %lu Senders"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "selectedSenders");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringWithFormat:", v24, objc_msgSend(v42, "count"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "detailTextLabel");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setText:", v38);

        goto LABEL_13;
      }
    }
    else
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("messageContains"));

      if (!v28)
        goto LABEL_14;
      v15 = v10;
      WFLocalizedString(CFSTR("Message Contains"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setText:", v29);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "selectedContents");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = (void *)MEMORY[0x24BDD17C8];
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "selectedContents");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@"), v25);
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    WFLocalizedString(CFSTR("Choose"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "detailTextLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setText:", v24);
    goto LABEL_13;
  }
  objc_msgSend(v10, "setSelectionStyle:", 0);
  objc_msgSend(v10, "setTriggerTypeClass:", objc_opt_class());
LABEL_14:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFMessageTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFMessageTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getWFTriggersLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315394;
    v22 = "-[WFMessageTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v21, 0x16u);
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

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24E6312A8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSupportedPersonProperties:", v14);

    objc_msgSend(v11, "setDelegate:", self);
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "selectedSenders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "if_map:", &__block_literal_global_156);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEntries:", v17);

    -[WFMessageTriggerConfigurationViewController presentNavControllerWithRootViewController:](self, "presentNavControllerWithRootViewController:", v11);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", CFSTR("messageContains"));

    if (v19)
      -[WFMessageTriggerConfigurationViewController showMessageContainsAlert](self, "showMessageContainsAlert");
  }
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)recipientViewControllerDidFinish:(id)a3 cancelled:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
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
  WFMessageTriggerConfigurationViewController *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!a4)
  {
    v42 = self;
    objc_msgSend(v6, "commitRemainingText");
    v41 = v7;
    objc_msgSend(v7, "entries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v11 = v8;
    v44 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (!v44)
      goto LABEL_20;
    v12 = *(_QWORD *)v46;
    v43 = *(_QWORD *)v46;
    while (1)
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v11);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v14, "contact");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "contact");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v17);

          WFMessageTriggerConfigurationSenderStringsFromContact(v16);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObjectsFromArray:", v18);
        }
        else
        {
          objc_msgSend(v14, "phoneNumber");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = v11;
            v21 = v10;
            v22 = v9;
            objc_msgSend(v14, "phoneNumber");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "formattedPhoneNumber");
            v23 = objc_claimAutoreleasedReturnValue();
            if (!v23)
            {
              v10 = v21;
              v11 = v20;
              v12 = v43;
              goto LABEL_17;
            }
            v24 = (void *)v23;
            objc_msgSend(v14, "phoneNumber");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "normalizedPhoneNumber");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v22;
            v10 = v21;
            v11 = v20;
            v12 = v43;
            if (!v26)
              goto LABEL_18;
            v18 = objc_alloc_init(MEMORY[0x24BDBAD50]);
            objc_msgSend(v14, "phoneNumber");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "formattedPhoneNumber");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setGivenName:", v28);

            objc_msgSend(v9, "addObject:", v18);
            objc_msgSend(v14, "phoneNumber");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "normalizedPhoneNumber");
            v30 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v14, "emailAddress");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
              goto LABEL_18;
            v18 = objc_alloc_init(MEMORY[0x24BDBAD50]);
            objc_msgSend(v14, "emailAddress");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "address");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setGivenName:", v33);

            objc_msgSend(v9, "addObject:", v18);
            objc_msgSend(v14, "emailAddress");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "address");
            v30 = objc_claimAutoreleasedReturnValue();
          }
          v34 = (void *)v30;
          objc_msgSend(v10, "addObject:", v30);

        }
LABEL_17:

LABEL_18:
      }
      v44 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (!v44)
      {
LABEL_20:

        objc_msgSend(v9, "allObjects");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v11;
        self = v42;
        -[WFTriggerConfigurationViewController trigger](v42, "trigger");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setSelectedSenders:", v35);

        objc_msgSend(v10, "allObjects");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTriggerConfigurationViewController trigger](v42, "trigger");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setSelectedSendersStrings:", v38);

        v7 = v41;
        break;
      }
    }
  }
  objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (id)displayForSelectedContacts:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v10, "givenName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "familyName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@,"), v12, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  -[WFMessageTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)showMessageContainsAlert
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
  WFMessageTriggerConfigurationViewController *v19;

  v3 = (void *)MEMORY[0x24BEBD3B0];
  WFLocalizedString(CFSTR("Message Contains"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Only run this automation when a message contains the following:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BEBD3A8];
  WFLocalizedString(CFSTR("Done"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke;
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
  v16[2] = __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_2;
  v16[3] = &unk_24E6044D0;
  v16[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v11);
  objc_msgSend(v10, "addAction:", v14);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_3;
  v15[3] = &unk_24E603B98;
  v15[4] = self;
  objc_msgSend(v10, "addTextFieldWithConfigurationHandler:", v15);
  -[WFMessageTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

void __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke(uint64_t a1)
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
  objc_msgSend(v5, "setSelectedContents:", v4);

  objc_msgSend(*(id *)(a1 + 40), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  objc_msgSend(*(id *)(a1 + 40), "updateNextButtonEnabledState");
}

uint64_t __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedContents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "trigger");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "selectedContents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedContents:", v6);

  if (v5)
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateNextButtonEnabledState");
}

void __71__WFMessageTriggerConfigurationViewController_showMessageContainsAlert__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v4, "selectedContents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  WFLocalizedStringWithKey(CFSTR("Anything prompt"), CFSTR("Anything"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlaceholder:", v6);

}

id __81__WFMessageTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BE19418];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(MEMORY[0x24BE193D0], "contactWithCNContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithContact:", v5);
  return v6;
}

@end
