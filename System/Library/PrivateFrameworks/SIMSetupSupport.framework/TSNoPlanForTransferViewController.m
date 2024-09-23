@implementation TSNoPlanForTransferViewController

- (TSNoPlanForTransferViewController)initWithCarrier:(id)a3 phoneNumber:(id)a4 transferCapability:(unint64_t)a5 showOtherOptions:(BOOL)a6 entryPoint:(unint64_t)a7 sourceDeviceName:(id)a8 isTransferNotSupportedFromiPhone:(BOOL)a9 isTransferBackPlan:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  TSNoPlanForTransferViewController *v23;
  TSNoPlanForTransferViewController *v24;
  objc_super v26;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("YOUR_CARRIER"), &stru_24DEF4290, CFSTR("Localizable"));
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[TSNoPlanForTransferViewController getTitleAndDetailsForTransferCapability:carrier:phoneNumber:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:](TSNoPlanForTransferViewController, "getTitleAndDetailsForTransferCapability:carrier:phoneNumber:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:", a5, v16, v17, v18, a9, a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("title"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("details"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)TSNoPlanForTransferViewController;
  v23 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v26, sel_initWithTitle_detailText_symbolName_, v21, v22, CFSTR("antenna.radiowaves.left.and.right"));
  v24 = v23;
  if (v23)
  {
    -[TSNoPlanForTransferViewController setEntryPoint:](v23, "setEntryPoint:", a7);
    v24->_showOtherOptions = a6;
  }

  return v24;
}

+ (id)getTitleAndDetailsForTransferCapability:(unint64_t)a3 carrier:(id)a4 phoneNumber:(id)a5 sourceDeviceName:(id)a6 isTransferNotSupportedFromiPhone:(BOOL)a7 isTransferBackPlan:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];
  _QWORD v53[3];

  v8 = a8;
  v9 = a7;
  v53[2] = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = 0x24BDD1000uLL;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("YOUR_CARRIER"), &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TRANSFER_INELIGIBLE_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0xAuLL:
    case 0xCuLL:
      _TSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[TSNoPlanForTransferViewController getTitleAndDetailsForTransferCapability:carrier:phoneNumber:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:].cold.1(a3, v20);

      if (v8)
      {
        v21 = +[TSUtilities isPad](TSUtilities, "isPad");
        if (v14 && !v21 && objc_msgSend(v14, "length"))
        {
          v22 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TRANSFER_BACK_PLAN_NOT_FOUND_DETAIL_%@%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", v24, v14, v13);
LABEL_14:
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
        v25 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v26;
        v27 = CFSTR("TRANSFER_BACK_PLAN_NOT_FOUND_DETAIL_%@");
      }
      else
      {
        v25 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v26;
        v27 = CFSTR("TRANSFER_INELIGIBLE_PLAN_DETAIL_%@");
      }
      objc_msgSend(v26, "localizedStringForKey:value:table:", v27, &stru_24DEF4290, CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", v24, v13, v51);
      goto LABEL_14;
    case 9uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v38;
      v39 = CFSTR("SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL");
      goto LABEL_23;
    case 0xBuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v38;
      v39 = CFSTR("SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL_ACTIVATION_POLICY_MISMATCH_CARRIER_UNLOCK");
LABEL_23:
      objc_msgSend(v38, "localizedStringForKey:value:table:", v39, &stru_24DEF4290, CFSTR("Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
    case 0xDuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("TRANSFER_UPDATE_REQUIRED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v41 = v15;
      v42 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("TRANSFER_TARGET_UPDATE_REQUIRED_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)v42;
      v15 = v41;
      v16 = 0x24BDD1000;
      goto LABEL_16;
    case 0xEuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("TRANSFER_UPDATE_REQUIRED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v45 = objc_claimAutoreleasedReturnValue();

      if (v15 && objc_msgSend(v15, "length"))
      {
        v46 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v48 = v15;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", v49, v48);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v48;
        v16 = 0x24BDD1000;

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v19 = (void *)v45;
      goto LABEL_16;
    default:
      v28 = 0;
LABEL_16:
      if (v9 && +[TSUtilities isPad](TSUtilities, "isPad"))
      {
        objc_msgSend(*(id *)(v16 + 1160), "bundleForClass:", objc_opt_class());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("TRANSFER_FROM_IPHONE_NOT_SUPPORTED"), &stru_24DEF4290, CFSTR("Localizable"));
        v30 = v13;
        v31 = v14;
        v32 = v15;
        v33 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v16 + 1160), "bundleForClass:", objc_opt_class());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("PRX_TRANSFER_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
        v35 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v33;
        v15 = v32;
        v14 = v31;
        v13 = v30;
        v28 = (void *)v35;
      }
      v52[0] = CFSTR("title");
      v52[1] = CFSTR("details");
      v53[0] = v19;
      v53[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      return v36;
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
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
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSNoPlanForTransferViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v15, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSNoPlanForTransferViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  if (self->_showOtherOptions)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__scanButtonTapped, 64);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_24DEF4290, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v8, 0);

    -[TSNoPlanForTransferViewController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addButton:", v6);

  }
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__cancelButtonTapped, 64);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v12, 0);

    -[TSNoPlanForTransferViewController buttonTray](self, "buttonTray");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addButton:", v10);

    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidesBackButton:animated:", 0, 0);

  }
  else
  {
    -[TSNoPlanForTransferViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDefaultNavigationItems:", self);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSNoPlanForTransferViewController;
  -[TSNoPlanForTransferViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)_cancelButtonTapped
{
  id v3;

  -[TSNoPlanForTransferViewController setEntryPoint:](self, "setEntryPoint:", 2);
  -[TSNoPlanForTransferViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidTapCancel");

}

- (void)_scanButtonTapped
{
  id v3;

  -[TSNoPlanForTransferViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartWith:", self);

}

- (BOOL)isStartOverRequiredOnBackButtonTapped
{
  return 1;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(unint64_t)a3
{
  self->_entryPoint = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)getTitleAndDetailsForTransferCapability:(uint64_t)a1 carrier:(NSObject *)a2 phoneNumber:sourceDeviceName:isTransferNotSupportedFromiPhone:isTransferBackPlan:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 134218242;
  v3 = a1;
  v4 = 2080;
  v5 = "+[TSNoPlanForTransferViewController getTitleAndDetailsForTransferCapability:carrier:phoneNumber:sourceDeviceName:"
       "isTransferNotSupportedFromiPhone:isTransferBackPlan:]";
  _os_log_error_impl(&dword_21B647000, a2, OS_LOG_TYPE_ERROR, "[E]unexpected transfer capability : %lu @%s", (uint8_t *)&v2, 0x16u);
}

@end
