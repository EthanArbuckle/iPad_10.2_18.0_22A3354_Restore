@implementation TSUserResponseFlow

- (TSUserResponseFlow)initWithConfirmationCodeRequired:(BOOL)a3
{
  TSUserResponseFlow *v4;
  uint64_t v5;
  UIBarButtonItem *cancelButton;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSUserResponseFlow;
  v4 = -[TSSIMSetupFlow init](&v8, sel_init);
  v4->_confirmationCodeRequired = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v4, sel_userDidTapCancel);
  cancelButton = v4->_cancelButton;
  v4->_cancelButton = (UIBarButtonItem *)v5;

  v4->_userConsentType = 0;
  return v4;
}

- (id)firstViewController
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  TSUserConsentViewController *v9;
  TSUserConsentViewController *v10;
  NSObject *v11;
  char *v12;
  char *v13;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "planItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "calculateInstallConsentTextTypeFor:", v4);

  switch(v6)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      if (!self->_confirmationCodeRequired)
      {
        _TSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315138;
          v16 = "-[TSUserResponseFlow firstViewController]";
          _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Invalid consent - General install @%s", (uint8_t *)&v15, 0xCu);
        }
        v8 = 4;
        goto LABEL_12;
      }
      break;
    case 1:
      _TSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[TSUserResponseFlow firstViewController]";
        _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "disable not allowed @%s", (uint8_t *)&v15, 0xCu);
      }
      v8 = 3;
      goto LABEL_12;
    case 2:
      _TSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315138;
        v16 = "-[TSUserResponseFlow firstViewController]";
        _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "delete not allowed @%s", (uint8_t *)&v15, 0xCu);
      }
      v8 = 2;
LABEL_12:

      self->_userConsentType = v8;
      break;
    default:
      break;
  }
  if (self->_confirmationCodeRequired)
    v9 = -[TSCellularPlanConfirmationCodeViewController initAsMidOperationWithCarrierName:]([TSCellularPlanConfirmationCodeViewController alloc], "initAsMidOperationWithCarrierName:", 0);
  else
    v9 = -[TSUserConsentViewController initWithConsentType:name:]([TSUserConsentViewController alloc], "initWithConsentType:name:", self->_userConsentType, 0);
  v10 = v9;
  -[TSUserConsentViewController setDelegate:](v9, "setDelegate:", self);
  _TSLogDomain();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (char *)objc_opt_class();
    v15 = 138412546;
    v16 = v12;
    v17 = 2080;
    v18 = "-[TSUserResponseFlow firstViewController]";
    v13 = v12;
    _os_log_impl(&dword_21B647000, v11, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v15, 0x16u);

  }
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v10);

  return v10;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[TSUserResponseFlow firstViewController](self, "firstViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  char isKindOfClass;
  TSUserConsentViewController *v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 && self->_userConsentType)
    v6 = -[TSUserConsentViewController initWithConsentType:name:]([TSUserConsentViewController alloc], "initWithConsentType:name:", self->_userConsentType, 0);
  else
    v6 = 0;
  return v6;
}

- (void)viewControllerDidComplete:(id)a3
{
  id v4;
  NSString *v5;
  NSString *confirmationCode;
  void *v7;
  void *v8;
  NSString *v9;
  uint64_t v10;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "confirmationCode");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    confirmationCode = self->_confirmationCode;
    self->_confirmationCode = v5;

    if (!self->_userConsentType)
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = self->_confirmationCode;
      v10 = 1;
LABEL_6:
      objc_msgSend(v7, "sendUserResponse:confirmationCode:", v10, v9);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v4, "userConsentResponse");
      v9 = self->_confirmationCode;
      v7 = v8;
      goto LABEL_6;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TSUserResponseFlow;
  -[TSSIMSetupFlow viewControllerDidComplete:](&v11, sel_viewControllerDidComplete_, v4);

}

- (void)setDefaultNavigationItems:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    objc_msgSend(v5, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", self->_cancelButton);

  }
}

- (unint64_t)userConsentType
{
  return self->_userConsentType;
}

- (void)setUserConsentType:(unint64_t)a3
{
  self->_userConsentType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
}

@end
