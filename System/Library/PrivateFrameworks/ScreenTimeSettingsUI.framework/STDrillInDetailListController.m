@implementation STDrillInDetailListController

- (STDrillInDetailListController)initWithUsageItem:(id)a3 coordinator:(id)a4
{
  id v7;
  id v8;
  STDrillInDetailListController *v9;
  STDrillInDetailListController *v10;
  STDrillInUsageGroupSpecifierProvider *v11;
  STDrillInUsageGroupSpecifierProvider *screenTimeGroupSpecifierProvider;
  void *v13;
  STDrillInItemInfoGroupSpecifierProvider *v14;
  STDrillInItemInfoGroupSpecifierProvider *drillInItemInfoGroupSpecifierProvider;
  void *v16;
  STCategoryDetailsGroupSpecifierProvider *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  STAllowanceProgressGroupSpecifierProvider *v27;
  id v28;
  uint64_t v29;
  STAllowanceProgressGroupSpecifierProvider *allowanceProgressGroupSpecifierProvider;
  void *v31;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)STDrillInDetailListController;
  v9 = -[STPINListViewController initWithRootViewModelCoordinator:](&v33, sel_initWithRootViewModelCoordinator_, v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_usageItem, a3);
    v11 = -[STDrillInUsageGroupSpecifierProvider initWithUsageItem:coordinator:]([STDrillInUsageGroupSpecifierProvider alloc], "initWithUsageItem:coordinator:", v7, v8);
    screenTimeGroupSpecifierProvider = v10->_screenTimeGroupSpecifierProvider;
    v10->_screenTimeGroupSpecifierProvider = v11;

    objc_msgSend(v7, "budgetItemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v7, "itemType"))
    {
      case 2:
      case 6:
        v14 = -[STDrillInItemInfoGroupSpecifierProvider initWithUsageItem:]([STDrillInItemInfoGroupSpecifierProvider alloc], "initWithUsageItem:", v7);
        drillInItemInfoGroupSpecifierProvider = v10->_drillInItemInfoGroupSpecifierProvider;
        v10->_drillInItemInfoGroupSpecifierProvider = v14;

        goto LABEL_4;
      case 3:
        v17 = -[STCategoryDetailsGroupSpecifierProvider initWithCategoryUsageItem:coordinator:]([STCategoryDetailsGroupSpecifierProvider alloc], "initWithCategoryUsageItem:coordinator:", v7, v8);
        v18 = 1432;
        goto LABEL_7;
      case 4:
        v17 = -[STDrillInItemInfoGroupSpecifierProvider initWithUsageItem:]([STDrillInItemInfoGroupSpecifierProvider alloc], "initWithUsageItem:", v7);
        v18 = 1424;
LABEL_7:
        v16 = *(Class *)((char *)&v10->super.super.super.super.super.super.super.isa + v18);
        *(Class *)((char *)&v10->super.super.super.super.super.super.super.isa + v18) = (Class)v17;
        goto LABEL_8;
      case 5:
LABEL_4:
        objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObserver:selector:bundleIdentifier:", v10, sel__didFetchAppInfo_, v13);
LABEL_8:

        break;
      default:
        break;
    }
    objc_msgSend(MEMORY[0x24BE15820], "systemUnblockableBundleIdentifiersForDeviceFamily:", 102);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = (id)objc_opt_new();
    v22 = v21;

    v23 = objc_msgSend(v22, "containsObject:", v13);
    objc_msgSend(v7, "categoryIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", v13, 0);
    v26 = v25;
    if (v24)
      objc_msgSend(v25, "addObject:", v24);
    v27 = [STAllowanceProgressGroupSpecifierProvider alloc];
    if (v23)
      v28 = 0;
    else
      v28 = v7;
    v29 = -[STAllowanceProgressGroupSpecifierProvider initWithBudgetedIdentifiers:usageItem:](v27, "initWithBudgetedIdentifiers:usageItem:", v26, v28);
    allowanceProgressGroupSpecifierProvider = v10->_allowanceProgressGroupSpecifierProvider;
    v10->_allowanceProgressGroupSpecifierProvider = (STAllowanceProgressGroupSpecifierProvider *)v29;

    -[STAllowanceProgressGroupSpecifierProvider setCoordinator:](v10->_allowanceProgressGroupSpecifierProvider, "setCoordinator:", v8);
    objc_msgSend(v7, "displayName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDrillInDetailListController setTitle:](v10, "setTitle:", v31);

  }
  return v10;
}

- (BOOL)canBeShownFromSuspendedState
{
  void *v2;
  char v3;

  -[STPINListViewController coordinator](self, "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeEnabled") ^ 1;

  return v3;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[16];

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[STDrillInDetailListController screenTimeGroupSpecifierProvider](self, "screenTimeGroupSpecifierProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithObjects:", v4, 0);

  -[STDrillInDetailListController drillInItemInfoGroupSpecifierProvider](self, "drillInItemInfoGroupSpecifierProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[STDrillInDetailListController categoryDetailsGroupSpecifierProvider](self, "categoryDetailsGroupSpecifierProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  -[STDrillInDetailListController allowanceProgressGroupSpecifierProvider](self, "allowanceProgressGroupSpecifierProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  -[STListViewController setSpecifierProviders:](self, "setSpecifierProviders:", v5);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STDrillInDetailListController.viewDidLoad", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)STDrillInDetailListController;
  -[STDrillInDetailListController viewDidLoad](&v9, sel_viewDidLoad);

}

- (void)_didFetchAppInfo:(id)a3
{
  void *v4;
  id v5;

  -[STDrillInDetailListController usageItem](self, "usageItem", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInDetailListController setTitle:](self, "setTitle:", v4);

}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  -[STListViewController specifierProviders](self, "specifierProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInDetailListController drillInItemInfoGroupSpecifierProvider](self, "drillInItemInfoGroupSpecifierProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "indexOfObject:", v8);

  if (v9 == a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBB4B8], "textAttachmentWithImage:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "textLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x24BDD1688]);
      objc_msgSend(v13, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithString:", v15);

      objc_msgSend(v16, "insertAttributedString:atIndex:", v12, 0);
      objc_msgSend(v13, "setAttributedText:", v16);

    }
  }

}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (STDrillInUsageGroupSpecifierProvider)screenTimeGroupSpecifierProvider
{
  return self->_screenTimeGroupSpecifierProvider;
}

- (STDrillInItemInfoGroupSpecifierProvider)drillInItemInfoGroupSpecifierProvider
{
  return self->_drillInItemInfoGroupSpecifierProvider;
}

- (STCategoryDetailsGroupSpecifierProvider)categoryDetailsGroupSpecifierProvider
{
  return self->_categoryDetailsGroupSpecifierProvider;
}

- (STAllowanceProgressGroupSpecifierProvider)allowanceProgressGroupSpecifierProvider
{
  return self->_allowanceProgressGroupSpecifierProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowanceProgressGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_categoryDetailsGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_drillInItemInfoGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_screenTimeGroupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_usageItem, 0);
}

@end
