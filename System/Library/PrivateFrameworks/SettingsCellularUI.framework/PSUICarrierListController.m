@implementation PSUICarrierListController

- (PSUICarrierListController)init
{
  PSUICarrierListController *v2;
  uint64_t v3;
  UIBarButtonItem *cancelButton;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSUICarrierListController;
  v2 = -[PSUICarrierListController init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v2, sel_dismiss);
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_cellularPlanChanged_, CFSTR("PSUICellularPlanChanged"), 0);

    -[PSUICarrierListController setModalInPresentation:](v2, "setModalInPresentation:", 1);
    v2->_showCarrierItemGroup = 1;
    v2->_showAddOnPlanGroup = 1;
  }
  return v2;
}

- (PSUICarrierListController)initWithOptions:(BOOL)a3 showCarrierItemGroup:(BOOL)a4
{
  PSUICarrierListController *result;

  result = -[PSUICarrierListController init](self, "init");
  if (result)
  {
    result->_showAddOnPlanGroup = a3;
    result->_showCarrierItemGroup = a4;
  }
  return result;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSUICarrierListController;
  -[PSUICarrierListController loadView](&v3, sel_loadView);
  -[PSUICarrierListController addCancelButton](self, "addCancelButton");
}

- (void)dismiss
{
  -[PSUICarrierListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cellularPlanChanged:(id)a3
{
  id v4;
  PSUICarrierItemGroup *carrierItemGroup;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  carrierItemGroup = self->_carrierItemGroup;
  if (carrierItemGroup && -[PSUICarrierItemGroup isFlowRunning](carrierItemGroup, "isFlowRunning"))
  {
    -[PSUICarrierListController getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "flow is still running", buf, 2u);
    }

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__PSUICarrierListController_cellularPlanChanged___block_invoke;
    block[3] = &unk_24D501660;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

uint64_t __49__PSUICarrierListController_cellularPlanChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)addCancelButton
{
  void *v3;
  int v4;
  void *v5;
  UIBarButtonItem *cancelButton;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isiPad");

  -[PSUICarrierListController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cancelButton = self->_cancelButton;
  v7 = v5;
  if (v4)
    objc_msgSend(v5, "setRightBarButtonItem:animated:", cancelButton, 1);
  else
    objc_msgSend(v5, "setLeftBarButtonItem:animated:", cancelButton, 1);

}

- (id)specifiers
{
  id v3;
  PSSpecifier *v4;
  PSSpecifier *addOnGroupSpecifier;
  void *v6;
  void *v7;
  void *v8;
  PSSpecifier *v9;
  PSSpecifier *carrierItemGroupSpecifier;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_showAddOnPlanGroup)
  {
    -[PSUICarrierListController addOnGroupSpecifier](self, "addOnGroupSpecifier");
    v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    addOnGroupSpecifier = self->_addOnGroupSpecifier;
    self->_addOnGroupSpecifier = v4;

    -[PSUICarrierListController createAddCellularPlanSpecifierIfNeeded:](self, "createAddCellularPlanSpecifierIfNeeded:", self->_addOnGroupSpecifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierListController setAddOnPlanGroup:](self, "setAddOnPlanGroup:", v6);

    -[PSUICarrierListController addOnPlanGroup](self, "addOnPlanGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v3, "addObject:", self->_addOnGroupSpecifier);
      objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v8, self->_addOnGroupSpecifier);
    }

  }
  if (self->_showCarrierItemGroup)
  {
    -[PSUICarrierListController carrierItemGroupSpecifier](self, "carrierItemGroupSpecifier");
    v9 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    carrierItemGroupSpecifier = self->_carrierItemGroupSpecifier;
    self->_carrierItemGroupSpecifier = v9;

    objc_msgSend(v3, "addObject:", self->_carrierItemGroupSpecifier);
    -[PSUICarrierListController createCarrierItemGroupIfNeeded:](self, "createCarrierItemGroupIfNeeded:", self->_carrierItemGroupSpecifier);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierListController setCarrierItemGroup:](self, "setCarrierItemGroup:", v11);

    -[PSUICarrierListController carrierItemGroup](self, "carrierItemGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "specifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v13, self->_carrierItemGroupSpecifier);

  }
  v14 = (int)*MEMORY[0x24BE756E0];
  v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v14);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v14) = (Class)v3;
  v16 = v3;

  v17 = *(id *)((char *)&self->super.super.super.super.super.isa + v14);
  return v17;
}

- (id)carrierItemGroupSpecifier
{
  PSSpecifier *carrierItemGroupSpecifier;

  carrierItemGroupSpecifier = self->_carrierItemGroupSpecifier;
  if (carrierItemGroupSpecifier)
    return carrierItemGroupSpecifier;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADD_NEW_NETWORK_GROUP"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addOnGroupSpecifier
{
  PSSpecifier *addOnGroupSpecifier;

  addOnGroupSpecifier = self->_addOnGroupSpecifier;
  if (addOnGroupSpecifier)
    return addOnGroupSpecifier;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADD_ON_PLAN_GROUP"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createCarrierItemGroupIfNeeded:(id)a3
{
  PSUICarrierItemGroup *carrierItemGroup;
  PSUICarrierItemGroup *v4;
  id v6;

  carrierItemGroup = self->_carrierItemGroup;
  if (carrierItemGroup)
  {
    v4 = carrierItemGroup;
  }
  else
  {
    v6 = a3;
    v4 = -[PSUICarrierItemGroup initWithListController:groupSpecifier:showCarrierItems:]([PSUICarrierItemGroup alloc], "initWithListController:groupSpecifier:showCarrierItems:", self, v6, self->_showCarrierItemGroup);

  }
  return v4;
}

- (id)createAddCellularPlanSpecifierIfNeeded:(id)a3
{
  PSUIAddOnPlanGroup *addOnPlanGroup;
  PSUIAddOnPlanGroup *v4;
  id v6;

  addOnPlanGroup = self->_addOnPlanGroup;
  if (addOnPlanGroup)
  {
    v4 = addOnPlanGroup;
  }
  else
  {
    v6 = a3;
    v4 = -[PSUIAddOnPlanGroup initWithListController:groupSpecifier:]([PSUIAddOnPlanGroup alloc], "initWithListController:groupSpecifier:", self, v6);

  }
  return v4;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierListController"));
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (PSUICarrierItemGroup)carrierItemGroup
{
  return self->_carrierItemGroup;
}

- (void)setCarrierItemGroup:(id)a3
{
  objc_storeStrong((id *)&self->_carrierItemGroup, a3);
}

- (PSUIAddOnPlanGroup)addOnPlanGroup
{
  return self->_addOnPlanGroup;
}

- (void)setAddOnPlanGroup:(id)a3
{
  objc_storeStrong((id *)&self->_addOnPlanGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addOnPlanGroup, 0);
  objc_storeStrong((id *)&self->_carrierItemGroup, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_addOnGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_carrierItemGroupSpecifier, 0);
}

@end
