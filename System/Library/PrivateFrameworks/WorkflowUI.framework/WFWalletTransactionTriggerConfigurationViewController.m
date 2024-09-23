@implementation WFWalletTransactionTriggerConfigurationViewController

- (WFWalletTransactionTriggerConfigurationViewController)initWithTrigger:(id)a3 mode:(unint64_t)a4
{
  id v7;
  WFWalletTransactionTriggerConfigurationViewController *v8;
  WFWalletTransactionTriggerConfigurationViewController *v9;
  NSArray *passes;
  NSArray *v11;
  NSArray *remotePasses;
  NSMutableDictionary *v13;
  NSMutableDictionary *localPassesToRemotePassesUniqueIdentifierMapping;
  NSMutableDictionary *v15;
  NSMutableDictionary *passIcons;
  NSMutableDictionary *v17;
  NSMutableDictionary *merchantIcons;
  WFWalletTransactionTriggerConfigurationViewController *v19;
  void *v21;
  objc_super v22;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWalletTransactionTriggerConfigurationViewController.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[trigger isKindOfClass:[WFWalletTransactionTrigger class]]"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFWalletTransactionTriggerConfigurationViewController;
  v8 = -[WFTriggerConfigurationViewController initWithTrigger:mode:](&v22, sel_initWithTrigger_mode_, v7, a4);
  v9 = v8;
  if (v8)
  {
    passes = v8->_passes;
    v11 = (NSArray *)MEMORY[0x24BDBD1A8];
    v8->_passes = (NSArray *)MEMORY[0x24BDBD1A8];

    remotePasses = v9->_remotePasses;
    v9->_remotePasses = v11;

    v9->_detailSelection = 0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    localPassesToRemotePassesUniqueIdentifierMapping = v9->_localPassesToRemotePassesUniqueIdentifierMapping;
    v9->_localPassesToRemotePassesUniqueIdentifierMapping = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    passIcons = v9->_passIcons;
    v9->_passIcons = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    merchantIcons = v9->_merchantIcons;
    v9->_merchantIcons = v17;

    v19 = v9;
  }

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
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  const __CFString *v27;
  const __CFString *v28;
  _QWORD v29[2];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[5];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFWalletTransactionTriggerConfigurationViewController passes](self, "passes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v35[0] = CFSTR("triggerPassParameters");
    v34[0] = CFSTR("identifier");
    v34[1] = CFSTR("sectionTitle");
    WFLocalizedString(CFSTR("CARD"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v6;
    v34[2] = CFSTR("cellIdentifier");
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[WFWalletTransactionTriggerConfigurationViewController remotePasses](self, "remotePasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v33[0] = CFSTR("triggerRemotePassParameters");
    v32[0] = CFSTR("identifier");
    v32[1] = CFSTR("sectionTitle");
    WFLocalizedString(CFSTR("OTHER CARDS ON YOUR WATCH"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v12;
    v32[2] = CFSTR("cellIdentifier");
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  if (-[WFWalletTransactionTriggerConfigurationViewController paymentPassesSelected](self, "paymentPassesSelected"))
  {
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedMerchants");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (!v18)
    {
      v31[0] = CFSTR("triggerTransactionMerchantType");
      v30[0] = CFSTR("identifier");
      v30[1] = CFSTR("sectionTitle");
      WFLocalizedString(CFSTR("CATEGORY"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v19;
      v30[2] = CFSTR("cellIdentifier");
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = CFSTR("items");
      v31[2] = v21;
      v31[3] = &unk_24E6318F8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v22);

    }
    v28 = CFSTR("cellIdentifier");
    v29[0] = CFSTR("merchants");
    v27 = CFSTR("identifier");
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v27, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v25, v27, v28, v29[0]);

  }
  return v3;
}

- (BOOL)paymentPassesSelected
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  WFWalletTransactionTriggerConfigurationViewController *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[WFWalletTransactionTriggerConfigurationViewController passes](self, "passes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self;
  -[WFWalletTransactionTriggerConfigurationViewController remotePasses](self, "remotePasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (objc_msgSend(v10, "cardType") == 1)
          {
            -[WFTriggerConfigurationViewController trigger](v17, "trigger");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "selectedPassUniqueIDs");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "uniqueID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "containsObject:", v13);

            if ((v14 & 1) != 0)
            {

              v15 = 1;
              goto LABEL_15;
            }
          }
        }
        else
        {

          v10 = 0;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (id)allPassIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WFWalletTransactionTriggerConfigurationViewController passes](self, "passes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_16654);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletTransactionTriggerConfigurationViewController remotePasses](self, "remotePasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "if_compactMap:", &__block_literal_global_187);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletTransactionTriggerConfigurationViewController localPassesToRemotePassesUniqueIdentifierMapping](self, "localPassesToRemotePassesUniqueIdentifierMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFWalletTransactionTriggerConfigurationViewController;
  -[WFTriggerConfigurationViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", v4, v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFWalletTransactionTriggerConfigurationViewController;
  -[WFWalletTransactionTriggerConfigurationViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEstimatedRowHeight:", 100.0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_24E604C20;
  v5[4] = self;
  -[WFWalletTransactionTriggerConfigurationViewController _fetchPassesWithCompletion:](self, "_fetchPassesWithCompletion:", v5);
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
  void *v12;
  int v13;
  void *v14;

  -[WFWalletTransactionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("merchants"));

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("triggerPassParameters"));

    if (v10)
    {
      -[WFWalletTransactionTriggerConfigurationViewController passes](self, "passes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("triggerTransactionMerchantType"));

      if (!v13)
      {
        v8 = -[WFTriggerConfigurationViewController numberOfRowsInSectionWithInfo:](self, "numberOfRowsInSectionWithInfo:", v5);
        goto LABEL_9;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("items"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = v11;
    v8 = objc_msgSend(v11, "count");

  }
LABEL_9:

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
  void *v15;
  void *v16;
  WFWalletTransactionTriggerConfigurationViewController *v17;
  void *v18;
  void *v19;
  WFWalletTransactionTriggerConfigurationViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v67;
  WFWalletTransactionTriggerConfigurationViewController *v68;
  void *v69;

  v6 = a4;
  v7 = a3;
  -[WFWalletTransactionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cellIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessoryType:", 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", CFSTR("triggerPassParameters"));

  if (v12)
  {
    v69 = v9;
    v13 = v10;
    -[WFWalletTransactionTriggerConfigurationViewController passes](self, "passes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v6;
    objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFWalletTransactionTriggerConfigurationViewController passIconForPaymentPass:preferredIconSize:](self, "passIconForPaymentPass:preferredIconSize:", v15, 45.0, 32.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:width:height:", v16, 45.0, 32.0);
    objc_msgSend(v13, "setImageTopPadding:bottomPadding:", 10.0, 10.0);
    objc_msgSend(v15, "localizedDescription");
    v17 = self;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    v20 = v17;
    -[WFTriggerConfigurationViewController trigger](v17, "trigger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "selectedPassUniqueIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v22, "containsObject:", v23);

    if (!(_DWORD)v17)
    {
LABEL_4:

      self = v20;
      v6 = v67;
LABEL_5:
      v9 = v69;
LABEL_20:

      goto LABEL_21;
    }
LABEL_3:
    objc_msgSend(v13, "setAccessoryType:", 3);
    goto LABEL_4;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqual:", CFSTR("merchants"));

  if (v25)
  {
    v26 = v10;
    WFLocalizedString(CFSTR("Filter Merchants"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v27);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "selectedMerchants");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "selectedMerchants");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count");

      if (v34 == 1)
      {
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "selectedMerchants");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "displayName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "detailTextLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setText:", v37);

      }
      else
      {
        v61 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Any of %lu Merchants"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFTriggerConfigurationViewController trigger](self, "trigger");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "selectedMerchants");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "localizedStringWithFormat:", v15, objc_msgSend(v62, "count"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "detailTextLabel");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setText:", v63);

      }
    }
    else
    {
      WFLocalizedString(CFSTR("Choose"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "detailTextLabel");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setText:", v15);
    }

    goto LABEL_20;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqual:", CFSTR("triggerRemotePassParameters"));

  if (v40)
  {
    v69 = v9;
    v13 = v10;
    -[WFWalletTransactionTriggerConfigurationViewController remotePasses](self, "remotePasses");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v6;
    objc_msgSend(v41, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFWalletTransactionTriggerConfigurationViewController passIconForPaymentPass:preferredIconSize:](self, "passIconForPaymentPass:preferredIconSize:", v15, 42.0, 30.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setImage:width:height:", v16, 42.0, 30.0);
    objc_msgSend(v13, "setImageTopPadding:bottomPadding:", 10.0, 10.0);
    objc_msgSend(v15, "localizedDescription");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "label");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setText:", v42);

    v20 = self;
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "selectedPassUniqueIDs");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uniqueID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "containsObject:", v46);

    if (!v47)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("triggerTransactionMerchantType"));

  if (v49)
  {
    v69 = v9;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("items"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "unsignedIntegerValue");

    v53 = v10;
    PKLocalizedStringFromMerchantCategory();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "label");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setText:", v54);

    -[WFWalletTransactionTriggerConfigurationViewController merchantIconForMerchantType:](self, "merchantIconForMerchantType:", v52);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setImage:width:height:", v15, 45.0, 45.0);
    objc_msgSend(v53, "setImageTopPadding:bottomPadding:", 10.0, 10.0);
    objc_msgSend(v53, "setCornerRadius:", 6.0);
    v68 = self;
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "selectedMerchantTypes");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("items"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v57, "containsObject:", v59);

    if (v60)
      objc_msgSend(v53, "setAccessoryType:", 3);
    self = v68;
    goto LABEL_5;
  }
LABEL_21:
  -[WFTriggerConfigurationViewController configureAdditionalCellsIfNeeded:indexPath:sectionInfo:](self, "configureAdditionalCellsIfNeeded:indexPath:sectionInfo:", v10, v6, v8);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return v65;
}

- (id)tableViewHeaderString
{
  return WFLocalizedString(CFSTR("When I tap"));
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFWalletTransactionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", a4);
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
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  WFWalletMerchantSelectionTableViewController *v19;
  void *v20;
  void *v21;
  void *v22;
  WFWalletMerchantSelectionTableViewController *v23;
  void *v24;
  void *v25;
  WFWalletMerchantSelectionTableViewController *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  WFWalletMerchantSelectionTableViewController *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  WFWalletMerchantSelectionTableViewController *v61;
  void *v62;
  int v63;
  const char *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[WFWalletTransactionTriggerConfigurationViewController infoForSection:](self, "infoForSection:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("triggerPassParameters"));

  if (v9)
  {
    getWFTriggersLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v63 = 136315394;
      v64 = "-[WFWalletTransactionTriggerConfigurationViewController tableView:didSelectRowAtIndexPath:]";
      v65 = 2114;
      v66 = v7;
      _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEBUG, "%s didselect section: %{public}@", (uint8_t *)&v63, 0x16u);
    }

    -[WFWalletTransactionTriggerConfigurationViewController passes](self, "passes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectedPassUniqueIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if (v16)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "selectedPassUniqueIDs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (WFWalletMerchantSelectionTableViewController *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(v12, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWalletMerchantSelectionTableViewController removeObject:](v19, "removeObject:", v20);

      -[WFWalletTransactionTriggerConfigurationViewController localPassesToRemotePassesUniqueIdentifierMapping](self, "localPassesToRemotePassesUniqueIdentifierMapping");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uniqueID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v22);
      v23 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();

      if (v23)
        -[WFWalletMerchantSelectionTableViewController removeObject:](v19, "removeObject:", v23);
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = v19;
LABEL_17:
      objc_msgSend(v24, "setSelectedPassUniqueIDs:", v26);
LABEL_24:

      goto LABEL_25;
    }
    v37 = (void *)MEMORY[0x24BDBCEF0];
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "selectedPassUniqueIDs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setWithArray:", v39);
    v19 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "uniqueID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWalletMerchantSelectionTableViewController addObject:](v19, "addObject:", v40);

    -[WFWalletTransactionTriggerConfigurationViewController localPassesToRemotePassesUniqueIdentifierMapping](self, "localPassesToRemotePassesUniqueIdentifierMapping");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "objectForKeyedSubscript:", v42);
    v23 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();

    if (v23)
      -[WFWalletMerchantSelectionTableViewController addObject:](v19, "addObject:", v23);
    -[WFWalletMerchantSelectionTableViewController allObjects](v19, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSelectedPassUniqueIDs:", v25);
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqual:", CFSTR("triggerRemotePassParameters"));

  if (v28)
  {
    -[WFWalletTransactionTriggerConfigurationViewController remotePasses](self, "remotePasses");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "selectedPassUniqueIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "containsObject:", v32);

    if (v33)
    {
      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "selectedPassUniqueIDs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (WFWalletMerchantSelectionTableViewController *)objc_msgSend(v35, "mutableCopy");

      objc_msgSend(v12, "uniqueID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWalletMerchantSelectionTableViewController removeObject:](v19, "removeObject:", v36);

      -[WFTriggerConfigurationViewController trigger](self, "trigger");
      v23 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();
      -[WFWalletMerchantSelectionTableViewController setSelectedPassUniqueIDs:](v23, "setSelectedPassUniqueIDs:", v19);
LABEL_25:

      goto LABEL_26;
    }
    v51 = (void *)MEMORY[0x24BDBCEF0];
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "selectedPassUniqueIDs");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setWithArray:", v53);
    v19 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "uniqueID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWalletMerchantSelectionTableViewController addObject:](v19, "addObject:", v54);

    -[WFWalletMerchantSelectionTableViewController allObjects](v19, "allObjects");
    v23 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = v23;
    goto LABEL_17;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isEqual:", CFSTR("merchants"));

  if (v45)
  {
    -[WFWalletTransactionTriggerConfigurationViewController passes](self, "passes");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "if_flatMap:", &__block_literal_global_214);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = [WFWalletMerchantSelectionTableViewController alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "selectedMerchants");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFWalletMerchantSelectionTableViewController initWithTransactionIdentifiers:selectedMerchants:](v47, "initWithTransactionIdentifiers:selectedMerchants:", v48, v50);

    -[WFWalletMerchantSelectionTableViewController setDelegate:](v19, "setDelegate:", self);
    -[WFWalletTransactionTriggerConfigurationViewController presentNavControllerWithRootViewController:](self, "presentNavControllerWithRootViewController:", v19);
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("identifier"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("triggerTransactionMerchantType"));

  if (v56)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("items"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "selectedMerchantTypes");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "containsObject:", v12);

    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v19 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();
    -[WFWalletMerchantSelectionTableViewController selectedMerchantTypes](v19, "selectedMerchantTypes");
    v61 = (WFWalletMerchantSelectionTableViewController *)objc_claimAutoreleasedReturnValue();
    v23 = v61;
    if (v60)
      -[WFWalletMerchantSelectionTableViewController if_arrayByRemovingObject:](v61, "if_arrayByRemovingObject:", v12);
    else
      -[WFWalletMerchantSelectionTableViewController arrayByAddingObject:](v61, "arrayByAddingObject:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTriggerConfigurationViewController trigger](self, "trigger");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setSelectedMerchantTypes:", v25);
    goto LABEL_23;
  }
LABEL_27:
  -[WFTriggerConfigurationViewController didSelectRowAtIndexPath:withSectionInfo:](self, "didSelectRowAtIndexPath:withSectionInfo:", v6, v7);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "reloadData");

  -[WFTriggerConfigurationViewController updateNextButtonEnabledState](self, "updateNextButtonEnabledState");
}

- (void)_fetchPassesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a3;
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passesOfType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstanceWithRemoteLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteSecureElementPasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWalletTransactionTriggerConfigurationViewController filterDuplicatePassesFromLocalPasses:watchPasses:](self, "filterDuplicatePassesFromLocalPasses:watchPasses:", v5, v7);
  if (v8)
    v8[2](v8, 1);

}

- (void)filterDuplicatePassesFromLocalPasses:(id)a3 watchPasses:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
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
  void *v35;
  NSArray *v36;
  NSArray *passes;
  NSArray *v38;
  NSArray *remotePasses;
  void *v40;
  WFWalletTransactionTriggerConfigurationViewController *v41;
  void *v42;
  id v43;
  id v44;
  id obj;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v40 = (void *)objc_msgSend(v6, "mutableCopy");
  v46 = (void *)objc_msgSend(v7, "mutableCopy");
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v10)
  {
    v11 = v10;
    v47 = 0;
    v12 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v14, "uniqueID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        if (objc_msgSend(v14, "passType") == 1)
        {
          v16 = v14;
          if (objc_msgSend((id)objc_opt_class(), "passIsAppleAccess:", v16))
          {
            objc_msgSend(v16, "uniqueID");
            v17 = objc_claimAutoreleasedReturnValue();

            v47 = (void *)v17;
          }
          objc_msgSend(v16, "primaryAccountIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v18);
          objc_msgSend(v16, "pairedTerminalIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v16, v19);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v11);
  }
  else
  {
    v47 = 0;
  }
  v42 = v8;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v44 = v7;
  v20 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v49;
    v41 = self;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v49 != v22)
          objc_enumerationMutation(v44);
        v24 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v24, "uniqueID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v25) & 1) != 0)
          goto LABEL_36;
        if (v47 && objc_msgSend((id)objc_opt_class(), "passIsAppleAccess:", v24))
        {
          objc_msgSend(v24, "uniqueID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWalletTransactionTriggerConfigurationViewController localPassesToRemotePassesUniqueIdentifierMapping](self, "localPassesToRemotePassesUniqueIdentifierMapping");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v47);
LABEL_35:

LABEL_36:
          objc_msgSend(v46, "removeObject:", v24);
          goto LABEL_37;
        }
        if (!objc_msgSend(v24, "activationState") || objc_msgSend(v24, "activationState") == 2)
        {
          if (objc_msgSend(v24, "isCarKeyPass")
            && (objc_msgSend(v24, "pairedTerminalIdentifier"),
                v28 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v43, "objectForKey:", v28),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                v29,
                v28,
                v29))
          {
            objc_msgSend(v24, "pairedTerminalIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v43;
          }
          else
          {
            objc_msgSend(v24, "primaryAccountIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKey:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v33)
              goto LABEL_37;
            objc_msgSend(v24, "primaryAccountIdentifier");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v42;
          }
          objc_msgSend(v31, "objectForKeyedSubscript:", v30);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "uniqueID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFWalletTransactionTriggerConfigurationViewController localPassesToRemotePassesUniqueIdentifierMapping](self, "localPassesToRemotePassesUniqueIdentifierMapping");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "uniqueID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v27, v35);

          self = v41;
          goto LABEL_35;
        }
LABEL_37:

      }
      v21 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v21);
  }

  objc_msgSend(v40, "sortedArrayUsingComparator:", &__block_literal_global_218);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  passes = self->_passes;
  self->_passes = v36;

  objc_msgSend(v46, "sortedArrayUsingComparator:", &__block_literal_global_219);
  v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
  remotePasses = self->_remotePasses;
  self->_remotePasses = v38;

}

- (id)passIconForPaymentPass:(id)a3 preferredIconSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[WFWalletTransactionTriggerConfigurationViewController passIcons](self, "passIcons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE6EB68], "constraintsWithAspectFitToSize:", width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frontFaceImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resizedImageWithConstraints:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PassKitUILibrary();
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithPKImage:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWalletTransactionTriggerConfigurationViewController passIcons](self, "passIcons");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v15);

  }
  return v10;
}

- (id)merchantIconForMerchantType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id result;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  -[WFWalletTransactionTriggerConfigurationViewController merchantIcons](self, "merchantIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return v7;
  if (a3 - 1 >= 7)
    v8 = 0;
  else
    v8 = a3;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v12 = getPKIconForMerchantCategorySymbolLoc_ptr;
  v22 = getPKIconForMerchantCategorySymbolLoc_ptr;
  if (!getPKIconForMerchantCategorySymbolLoc_ptr)
  {
    v13 = PassKitUILibrary();
    v12 = dlsym(v13, "PKIconForMerchantCategory");
    v20[3] = (uint64_t)v12;
    getPKIconForMerchantCategorySymbolLoc_ptr = v12;
  }
  _Block_object_dispose(&v19, 8);
  if (v12)
  {
    ((void (*)(unint64_t, _QWORD, _QWORD, double, double, double))v12)(v8, 0, 0, 45.0, 45.0, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFWalletTransactionTriggerConfigurationViewController merchantIcons](self, "merchantIcons");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, v15);

    return v7;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "UIImage *WFPKIconForMerchantCategory(PKMerchantCategory, CGSize, CGFloat, BOOL, BOOL)");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("WFWalletTransactionTriggerConfigurationViewController.m"), 37, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)presentNavControllerWithRootViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD7A0];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithRootViewController:", v5);

  -[WFWalletTransactionTriggerConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
}

- (void)walletMerchantViewController:(id)a3 didFinishWithMerchants:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  objc_msgSend(a4, "if_map:", &__block_literal_global_225);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTriggerConfigurationViewController trigger](self, "trigger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedMerchants:", v7);

  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  -[WFTriggerConfigurationViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (NSArray)passes
{
  return self->_passes;
}

- (NSArray)remotePasses
{
  return self->_remotePasses;
}

- (NSMutableDictionary)localPassesToRemotePassesUniqueIdentifierMapping
{
  return self->_localPassesToRemotePassesUniqueIdentifierMapping;
}

- (unint64_t)detailSelection
{
  return self->_detailSelection;
}

- (NSMutableDictionary)passIcons
{
  return self->_passIcons;
}

- (NSMutableDictionary)merchantIcons
{
  return self->_merchantIcons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIcons, 0);
  objc_storeStrong((id *)&self->_passIcons, 0);
  objc_storeStrong((id *)&self->_localPassesToRemotePassesUniqueIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_remotePasses, 0);
  objc_storeStrong((id *)&self->_passes, 0);
}

id __109__WFWalletTransactionTriggerConfigurationViewController_walletMerchantViewController_didFinishWithMerchants___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = (objc_class *)MEMORY[0x24BE19670];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logoImageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "category");

  if ((unint64_t)(v8 - 1) >= 7)
    v9 = 0;
  else
    v9 = v8;
  v10 = (void *)objc_msgSend(v4, "initWithDisplayName:uniqueIdentifier:logoURL:merchantType:", v5, v6, v7, v9);

  return v10;
}

uint64_t __106__WFWalletTransactionTriggerConfigurationViewController_filterDuplicatePassesFromLocalPasses_watchPasses___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

uint64_t __106__WFWalletTransactionTriggerConfigurationViewController_filterDuplicatePassesFromLocalPasses_watchPasses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

id __91__WFWalletTransactionTriggerConfigurationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "deviceTransactionSourceIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[5];

  if (!objc_msgSend(*(id *)(a1 + 32), "mode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "allPassIdentifiers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "trigger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSelectedPassUniqueIDs:", v2);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_24E604D88;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __72__WFWalletTransactionTriggerConfigurationViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  return objc_msgSend(*(id *)(a1 + 32), "updateNextButtonEnabledState");
}

uint64_t __75__WFWalletTransactionTriggerConfigurationViewController_allPassIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

uint64_t __75__WFWalletTransactionTriggerConfigurationViewController_allPassIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueID");
}

+ (BOOL)passIsAppleAccess:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  char v15;
  BOOL v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(a3, "devicePaymentApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v8, "automaticSelectionCriteria");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "type");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = PKEqualObjects();

              if ((v15 & 1) != 0)
              {

                v16 = 1;
                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v18;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v16 = 0;
    }
    while (v5);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

@end
