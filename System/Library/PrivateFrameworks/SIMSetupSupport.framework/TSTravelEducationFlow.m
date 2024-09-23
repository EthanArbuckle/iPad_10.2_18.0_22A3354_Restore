@implementation TSTravelEducationFlow

- (TSTravelEducationFlow)initWithOptions:(id)a3
{
  NSDictionary *v4;
  TSTravelEducationFlow *v5;
  NSDictionary *options;
  objc_super v8;

  v4 = (NSDictionary *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TSTravelEducationFlow;
  v5 = -[TSSIMSetupFlow init](&v8, sel_init);
  options = v5->_options;
  v5->_options = v4;

  return v5;
}

- (BOOL)isBootstrapAssertionRequired
{
  return 0;
}

- (id)firstViewController
{
  NSObject *v2;

  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[TSTravelEducationFlow firstViewController].cold.1(v2);

  return 0;
}

- (void)firstViewController:(id)a3
{
  void (**v4)(id, TSTravelEducationIntroViewController *);
  void *v5;
  uint64_t v6;
  TSTravelEducationIntroViewController *v7;
  NSObject *v8;
  NSDictionary *options;
  int v10;
  NSDictionary *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, TSTravelEducationIntroViewController *))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "getSupportedFlowTypes");

    if (v6)
    {
      v7 = -[TSTravelEducationIntroViewController initWithOptions:]([TSTravelEducationIntroViewController alloc], "initWithOptions:", self->_options);
      _TSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        options = self->_options;
        v10 = 138412546;
        v11 = options;
        v12 = 2080;
        v13 = "-[TSTravelEducationFlow firstViewController:]";
        _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "options: %@ @%s", (uint8_t *)&v10, 0x16u);
      }

      -[TSTravelEducationIntroViewController setDelegate:](v7, "setDelegate:", self);
      -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v7);
      v4[2](v4, v7);

    }
    else
    {
      v4[2](v4, 0);
    }
  }

}

- (id)nextViewControllerFrom:(id)a3
{
  id v3;
  id v4;
  __objc2_class **v5;
  TSSubFlowViewController *v6;
  TSSubFlowViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if ((objc_msgSend(v4, "isRoamingTapped") & 1) != 0)
    {
      v5 = off_24DEF22B8;
    }
    else if ((objc_msgSend(v4, "isExistingPlanTapped") & 1) != 0)
    {
      v5 = off_24DEF22A0;
    }
    else
    {
      if (!objc_msgSend(v4, "isPurchaseLocalPlanTapped"))
      {
        v6 = 0;
        goto LABEL_13;
      }
      v5 = off_24DEF2080;
    }
    v6 = (TSSubFlowViewController *)objc_alloc_init(*v5);
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "selectedCarrierItem");
    v6 = (TSSubFlowViewController *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [TSSubFlowViewController alloc];
      v14[0] = &unk_24DF23830;
      v13[0] = CFSTR("FlowTypeKey");
      v13[1] = CFSTR("Plan");
      objc_msgSend(v4, "selectedCarrierItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "plan");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2] = CFSTR("HostViewController");
      v14[1] = v9;
      v14[2] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[TSSubFlowViewController initWithOptions:navigationController:](v7, "initWithOptions:navigationController:", v10, v11);

    }
    goto LABEL_13;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

- (BOOL)returnHome
{
  return self->_returnHome;
}

- (void)setReturnHome:(BOOL)a3
{
  self->_returnHome = a3;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)firstViewController
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSTravelEducationFlow firstViewController]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E](UIViewController *)firstViewController is deprecated, please use (void)firstViewController:(void (^)(UIViewController *))completion @%s", (uint8_t *)&v1, 0xCu);
}

@end
