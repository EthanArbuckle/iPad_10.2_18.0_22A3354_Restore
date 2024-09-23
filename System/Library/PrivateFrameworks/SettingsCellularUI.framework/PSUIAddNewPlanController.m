@implementation PSUIAddNewPlanController

- (PSUIAddNewPlanController)init
{
  PSUIAddNewPlanController *v2;
  uint64_t v3;
  UIBarButtonItem *cancelButton;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSUIAddNewPlanController;
  v2 = -[PSUIAddNewPlanController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v2, sel_dismiss);
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_cellularPlanChanged_, CFSTR("PSUICellularPlanChanged"), 0);

    -[PSUIAddNewPlanController setModalInPresentation:](v2, "setModalInPresentation:", 1);
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "planItems");

  }
  return v2;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSUIAddNewPlanController;
  -[PSUIAddNewPlanController viewDidLoad](&v3, sel_viewDidLoad);
  -[PSUIAddNewPlanController addCancelButton](self, "addCancelButton");
}

- (void)dismiss
{
  -[PSUIAddNewPlanController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cellularPlanChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PSUIAddNewPlanController_cellularPlanChanged___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__PSUIAddNewPlanController_cellularPlanChanged___block_invoke(uint64_t a1)
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

  -[PSUIAddNewPlanController navigationItem](self, "navigationItem");
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
  PSSpecifier *pendingInstallGroupSpecifier;
  void *v6;
  void *v7;
  void *v8;
  PSSpecifier *v9;
  PSSpecifier *transferablePlanGroupSpecifier;
  void *v11;
  void *v12;
  void *v13;
  PSSpecifier *v14;
  PSSpecifier *addOnGroupSpecifier;
  void *v16;
  void *v17;
  void *v18;
  PSSpecifier *v19;
  PSSpecifier *carrierItemGroupSpecifier;
  void *v21;
  void *v22;
  void *v23;
  PSSpecifier *v24;
  PSSpecifier *QRCodeGroupSpecifier;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[PSUIAddNewPlanController shouldShowPendingInstallPlan](self, "shouldShowPendingInstallPlan"))
  {
    -[PSUIAddNewPlanController pendingInstallGroupSpecifier](self, "pendingInstallGroupSpecifier");
    v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    pendingInstallGroupSpecifier = self->_pendingInstallGroupSpecifier;
    self->_pendingInstallGroupSpecifier = v4;

    -[PSUIAddNewPlanController createPendingInstallGroupIfNeeded:](self, "createPendingInstallGroupIfNeeded:", self->_pendingInstallGroupSpecifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIAddNewPlanController setPendingInstallGroup:](self, "setPendingInstallGroup:", v6);

    objc_msgSend(v3, "addObject:", self->_pendingInstallGroupSpecifier);
    -[PSUIAddNewPlanController pendingInstallGroup](self, "pendingInstallGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "specifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  -[PSUIAddNewPlanController transferablePlanGroupSpecifier](self, "transferablePlanGroupSpecifier");
  v9 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  transferablePlanGroupSpecifier = self->_transferablePlanGroupSpecifier;
  self->_transferablePlanGroupSpecifier = v9;

  -[PSUIAddNewPlanController createTransferablePlanGroupIfNeeded:](self, "createTransferablePlanGroupIfNeeded:", self->_transferablePlanGroupSpecifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAddNewPlanController setTransferablePlanGroup:](self, "setTransferablePlanGroup:", v11);

  objc_msgSend(v3, "addObject:", self->_transferablePlanGroupSpecifier);
  -[PSUIAddNewPlanController transferablePlanGroup](self, "transferablePlanGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "specifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  -[PSUIAddNewPlanController addOnGroupSpecifier](self, "addOnGroupSpecifier");
  v14 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  addOnGroupSpecifier = self->_addOnGroupSpecifier;
  self->_addOnGroupSpecifier = v14;

  -[PSUIAddNewPlanController createAddOnGroupIfNeeded:](self, "createAddOnGroupIfNeeded:", self->_addOnGroupSpecifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAddNewPlanController setAddOnPlanGroup:](self, "setAddOnPlanGroup:", v16);

  -[PSUIAddNewPlanController addOnPlanGroup](self, "addOnPlanGroup");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "specifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "count"))
    objc_msgSend(v3, "addObject:", self->_addOnGroupSpecifier);
  objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v18, self->_addOnGroupSpecifier);
  -[PSUIAddNewPlanController carrierItemGroupSpecifier](self, "carrierItemGroupSpecifier");
  v19 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  carrierItemGroupSpecifier = self->_carrierItemGroupSpecifier;
  self->_carrierItemGroupSpecifier = v19;

  -[PSUIAddNewPlanController createCarrierItemGroupIfNeeded:](self, "createCarrierItemGroupIfNeeded:", self->_carrierItemGroupSpecifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAddNewPlanController setCarrierItemGroup:](self, "setCarrierItemGroup:", v21);

  -[PSUIAddNewPlanController carrierItemGroup](self, "carrierItemGroup");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "specifiers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "count"))
    objc_msgSend(v3, "addObject:", self->_carrierItemGroupSpecifier);
  objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v23, self->_carrierItemGroupSpecifier);
  -[PSUIAddNewPlanController QRCodeGroupSpecifier](self, "QRCodeGroupSpecifier");
  v24 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  QRCodeGroupSpecifier = self->_QRCodeGroupSpecifier;
  self->_QRCodeGroupSpecifier = v24;

  -[PSUIAddNewPlanController createQRCodeGroupIfNeeded:](self, "createQRCodeGroupIfNeeded:", self->_QRCodeGroupSpecifier);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUIAddNewPlanController setQRCodeGroup:](self, "setQRCodeGroup:", v26);

  objc_msgSend(v3, "addObject:", self->_QRCodeGroupSpecifier);
  -[PSUIAddNewPlanController QRCodeGroup](self, "QRCodeGroup");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "specifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v28);

  v29 = (int)*MEMORY[0x24BE756E0];
  v30 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v29) = (Class)v3;
  v31 = v3;

  v32 = *(id *)((char *)&self->super.super.super.super.super.isa + v29);
  return v32;
}

- (id)pendingInstallGroupSpecifier
{
  PSSpecifier *pendingInstallGroupSpecifier;

  pendingInstallGroupSpecifier = self->_pendingInstallGroupSpecifier;
  if (pendingInstallGroupSpecifier)
    return pendingInstallGroupSpecifier;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("PENDING_INSTALL_GROUP"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transferablePlanGroupSpecifier
{
  PSSpecifier *transferablePlanGroupSpecifier;

  transferablePlanGroupSpecifier = self->_transferablePlanGroupSpecifier;
  if (transferablePlanGroupSpecifier)
    return transferablePlanGroupSpecifier;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("TRANSFER_PLAN_GROUP"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)carrierItemGroupSpecifier
{
  PSSpecifier *carrierItemGroupSpecifier;

  carrierItemGroupSpecifier = self->_carrierItemGroupSpecifier;
  if (carrierItemGroupSpecifier)
    return carrierItemGroupSpecifier;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CARRIER_ITEM_GROUP"));
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

- (id)QRCodeGroupSpecifier
{
  PSSpecifier *QRCodeGroupSpecifier;

  QRCodeGroupSpecifier = self->_QRCodeGroupSpecifier;
  if (QRCodeGroupSpecifier)
    return QRCodeGroupSpecifier;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("QR_CODE_GROUP"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createPendingInstallGroupIfNeeded:(id)a3
{
  PSUIPendingInstallPlanGroup *pendingInstallGroup;
  PSUIPendingInstallPlanGroup *v4;
  id v6;

  pendingInstallGroup = self->_pendingInstallGroup;
  if (pendingInstallGroup)
  {
    v4 = pendingInstallGroup;
  }
  else
  {
    v6 = a3;
    v4 = -[PSUIPendingInstallPlanGroup initWithListController:groupSpecifier:]([PSUIPendingInstallPlanGroup alloc], "initWithListController:groupSpecifier:", self, v6);

  }
  return v4;
}

- (id)createTransferablePlanGroupIfNeeded:(id)a3
{
  PSUIPlanPendingTransferListGroup *transferablePlanGroup;
  PSUIPlanPendingTransferListGroup *v4;
  id v6;

  transferablePlanGroup = self->_transferablePlanGroup;
  if (transferablePlanGroup)
  {
    v4 = transferablePlanGroup;
  }
  else
  {
    v6 = a3;
    v4 = -[PSUIPlanPendingTransferListGroup initWithListController:groupSpecifier:]([PSUIPlanPendingTransferListGroup alloc], "initWithListController:groupSpecifier:", self, v6);

  }
  return v4;
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
    v4 = -[PSUICarrierItemGroup initWithListController:groupSpecifier:showCarrierItems:]([PSUICarrierItemGroup alloc], "initWithListController:groupSpecifier:showCarrierItems:", self, v6, 0);

  }
  return v4;
}

- (id)createAddOnGroupIfNeeded:(id)a3
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
    v4 = -[PSUIAddOnPlanGroup initWithListController:groupSpecifier:showAddOnPlans:]([PSUIAddOnPlanGroup alloc], "initWithListController:groupSpecifier:showAddOnPlans:", self, v6, 0);

  }
  return v4;
}

- (id)createQRCodeGroupIfNeeded:(id)a3
{
  PSUIQRCodeGroup *QRCodeGroup;
  PSUIQRCodeGroup *v4;
  id v6;

  QRCodeGroup = self->_QRCodeGroup;
  if (QRCodeGroup)
  {
    v4 = QRCodeGroup;
  }
  else
  {
    v6 = a3;
    v4 = -[PSUIQRCodeGroup initWithListController:groupSpecifier:]([PSUIQRCodeGroup alloc], "initWithListController:groupSpecifier:", self, v6);

  }
  return v4;
}

- (BOOL)shouldShowPendingInstallPlan
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isiPad"))
  {
    +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "planItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pendingInstallPlans");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "plans");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") != 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("AddNewPlanController"));
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (PSUIPendingInstallPlanGroup)pendingInstallGroup
{
  return self->_pendingInstallGroup;
}

- (void)setPendingInstallGroup:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInstallGroup, a3);
}

- (PSUIPlanPendingTransferListGroup)transferablePlanGroup
{
  return self->_transferablePlanGroup;
}

- (void)setTransferablePlanGroup:(id)a3
{
  objc_storeStrong((id *)&self->_transferablePlanGroup, a3);
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

- (PSUIQRCodeGroup)QRCodeGroup
{
  return self->_QRCodeGroup;
}

- (void)setQRCodeGroup:(id)a3
{
  objc_storeStrong((id *)&self->_QRCodeGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QRCodeGroup, 0);
  objc_storeStrong((id *)&self->_addOnPlanGroup, 0);
  objc_storeStrong((id *)&self->_carrierItemGroup, 0);
  objc_storeStrong((id *)&self->_transferablePlanGroup, 0);
  objc_storeStrong((id *)&self->_pendingInstallGroup, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_QRCodeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_addOnGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_carrierItemGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_transferablePlanGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingInstallGroupSpecifier, 0);
}

@end
