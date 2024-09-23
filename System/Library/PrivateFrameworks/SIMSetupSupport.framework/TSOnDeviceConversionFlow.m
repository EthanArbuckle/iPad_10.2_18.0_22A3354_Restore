@implementation TSOnDeviceConversionFlow

- (TSOnDeviceConversionFlow)initWithPhoneNumber:(id)a3 carrierName:(id)a4
{
  id v7;
  id v8;
  TSOnDeviceConversionFlow *v9;
  TSOnDeviceConversionFlow *v10;
  uint64_t v11;
  UIBarButtonItem *cancelButton;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSOnDeviceConversionFlow;
  v9 = -[TSSIMSetupFlow init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_phoneNumber, a3);
    objc_storeStrong((id *)&v10->_carrierName, a4);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v10, sel_userDidTapCancel);
    cancelButton = v10->_cancelButton;
    v10->_cancelButton = (UIBarButtonItem *)v11;

  }
  return v10;
}

- (id)firstViewController
{
  TSSinglePlanTransferViewController *v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSSinglePlanTransferViewController initWithLocalPhysical:carrierName:]([TSSinglePlanTransferViewController alloc], "initWithLocalPhysical:carrierName:", self->_phoneNumber, self->_carrierName);
  -[TSSinglePlanTransferViewController setDelegate:](v3, "setDelegate:", self);
  _TSLogDomain();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = objc_opt_class();
    v8 = 2080;
    v9 = "-[TSOnDeviceConversionFlow firstViewController]";
    _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v6, 0x16u);
  }

  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v3);
  return v3;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  if (a3)
  {
    v5 = a3;
    -[TSOnDeviceConversionFlow firstViewController](self, "firstViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  char isKindOfClass;
  TSSubFlowViewController *v6;
  void *v7;
  void *v8;
  TSSubFlowViewController *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  v6 = [TSSubFlowViewController alloc];
  v11[0] = CFSTR("FlowTypeKey");
  v11[1] = CFSTR("SkipActivatingPane");
  v12[0] = &unk_24DF23878;
  v12[1] = MEMORY[0x24BDBD1C8];
  v11[2] = CFSTR("DelayStartActivatingTimer");
  v12[2] = &unk_24DF23890;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TSSubFlowViewController initWithOptions:navigationController:](v6, "initWithOptions:navigationController:", v7, v8);

  return v9;
}

- (void)setDefaultNavigationItems:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = +[TSUtilities isPad](TSUtilities, "isPad");
  objc_msgSend(v4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "setRightBarButtonItem:", self->_cancelButton);
  }
  else
  {
    objc_msgSend(v6, "setHidesBackButton:animated:", 1, 0);

    objc_msgSend(v4, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", self->_cancelButton);
  }

  objc_msgSend(v4, "navigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
