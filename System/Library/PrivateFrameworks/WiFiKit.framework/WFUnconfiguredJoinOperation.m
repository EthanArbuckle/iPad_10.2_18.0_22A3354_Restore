@implementation WFUnconfiguredJoinOperation

- (WFUnconfiguredJoinOperation)initWithParameters:(id)a3 rootViewController:(id)a4
{
  id v7;
  id v8;
  WFUnconfiguredJoinOperation *v9;
  WFUnconfiguredJoinOperation *v10;
  uint64_t v11;
  AirPortAssistantController *airportController;
  AirPortAssistantController *v13;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t v17[16];
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFUnconfiguredJoinOperation;
  v9 = -[WFUnconfiguredJoinOperation init](&v18, sel_init);
  v10 = v9;
  if (!v8 || !v7 || !v9)
  {
LABEL_12:

    v10 = 0;
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v9->_parameters, a3);
  objc_storeStrong((id *)&v10->_rootViewController, a4);
  objc_msgSend(MEMORY[0x24BE03950], "assistantUIViewControllerWithParameters:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  airportController = v10->_airportController;
  v10->_airportController = (AirPortAssistantController *)v11;

  v13 = v10->_airportController;
  if (!v13)
  {
    WFLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_219FC8000, v15, v16, "Unable to create AirPortAssistantController", v17, 2u);
    }

    goto LABEL_12;
  }
  -[AirPortAssistantController setDelegate:](v13, "setDelegate:", v10);
LABEL_6:

  return v10;
}

- (void)start
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WFUnconfiguredJoinOperation;
  -[WFOperation start](&v12, sel_start);
  v3 = objc_alloc(MEMORY[0x24BDF6BF8]);
  -[WFUnconfiguredJoinOperation airportController](self, "airportController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithRootViewController:", v5);
  -[WFUnconfiguredJoinOperation setNavigationController:](self, "setNavigationController:", v6);

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 2 * (objc_msgSend(v7, "userInterfaceIdiom") == 1);
  -[WFUnconfiguredJoinOperation navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setModalPresentationStyle:", v8);

  -[WFUnconfiguredJoinOperation rootViewController](self, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFUnconfiguredJoinOperation navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)finish
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFUnconfiguredJoinOperation;
  -[WFOperation finish](&v4, sel_finish);
  -[WFUnconfiguredJoinOperation navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)airPortAssistantComplete:(id)a3 result:(int)a4 context:(id)a5 animated:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  if (a4 == -6723)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "associationErrorWithReason:", 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOperation setError:](self, "setError:", v13);
LABEL_10:

    goto LABEL_11;
  }
  if (!a4)
  {
    objc_msgSend(v9, "configuredSSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      WFLogForCategory(0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v13)
      {
        v15 = v13;
        if (os_log_type_enabled(v15, v14))
        {
          objc_msgSend(v9, "configuredSSID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412290;
          v18 = v16;
          _os_log_impl(&dword_219FC8000, v15, v14, "Successfully configured SSID %@", (uint8_t *)&v17, 0xCu);

        }
      }
      goto LABEL_10;
    }
  }
LABEL_11:
  -[WFUnconfiguredJoinOperation finish](self, "finish");

}

- (AirPortAssistantController)airportController
{
  return self->_airportController;
}

- (void)setAirportController:(id)a3
{
  objc_storeStrong((id *)&self->_airportController, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_rootViewController, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_airportController, 0);
}

@end
