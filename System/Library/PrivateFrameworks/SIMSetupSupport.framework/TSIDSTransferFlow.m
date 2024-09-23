@implementation TSIDSTransferFlow

- (TSIDSTransferFlow)init
{
  TSIDSTransferFlow *v2;
  id v3;
  uint64_t v4;
  CoreTelephonyClient *client;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSIDSTransferFlow;
  v2 = -[TSSIMSetupFlow init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    v4 = objc_msgSend(v3, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
  }
  v7.receiver = v2;
  v7.super_class = (Class)TSIDSTransferFlow;
  return -[TSSIMSetupFlow init](&v7, sel_init);
}

- (id)firstViewController
{
  TSIDSSimTransferringViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TSIDSSimTransferringViewController *v8;
  NSTimer *v9;
  NSTimer *transferringWatchDogTimer;

  v3 = [TSIDSSimTransferringViewController alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PRXCARD_TRANSFERRING_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PRXCARD_TRANSFERRING_SUBTITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TSIDSSimTransferringViewController initWithTitle:subtitle:](v3, "initWithTitle:subtitle:", v5, v7);

  -[TSIDSSimTransferringViewController setDelegate:](v8, "setDelegate:", self);
  -[TSSIMSetupFlow setTopViewController:](self, "setTopViewController:", v8);
  if (!self->_transferringWatchDogTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_handleTransferringWatchdogExpiry, 0, 0, 120.0);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    transferringWatchDogTimer = self->_transferringWatchDogTimer;
    self->_transferringWatchDogTimer = v9;

  }
  return v8;
}

- (void)firstViewController:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[TSIDSTransferFlow firstViewController](self, "firstViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (id)nextViewControllerFrom:(id)a3
{
  id v4;
  void *v5;
  TSPRXSIMTransferCompleteViewController *v6;
  TSPRXSIMTransferCompleteViewController *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v4, "isSecureIntentFailed") & 1) != 0)
      goto LABEL_7;
LABEL_8:
    v6 = objc_alloc_init(TSPRXSIMTransferCompleteViewController);
    goto LABEL_9;
  }
  if (-[TSIDSTransferFlow isWebsheetFlow](self, "isWebsheetFlow"))
    goto LABEL_8;
  -[TSIDSTransferFlow secureIntentProxCard](self, "secureIntentProxCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TSIDSTransferFlow secureIntentProxCard](self, "secureIntentProxCard");
    v6 = (TSPRXSIMTransferCompleteViewController *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v7 = v6;
    goto LABEL_10;
  }
LABEL_7:
  v7 = 0;
LABEL_10:

  return v7;
}

- (void)handleTransferringWatchdogExpiry
{
  NSObject *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[TSIDSTransferFlow handleTransferringWatchdogExpiry]";
    _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "handle 2 min transferring watchdog timer expired @%s", (uint8_t *)&v7, 0xCu);
  }

  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v6);

  }
}

- (void)launchSecureIntentUI:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, uint64_t);
  TSSecureIntentGestureViewController *v13;
  NSObject *v14;
  id v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v7 = a5;
  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (+[TSUtilities isSecureIntentUIRequired:](TSUtilities, "isSecureIntentUIRequired:", v10))
  {
    v13 = -[TSSecureIntentGestureViewController initWithExternalizedContext:descriptor:isLocalConvertFlow:]([TSSecureIntentGestureViewController alloc], "initWithExternalizedContext:descriptor:isLocalConvertFlow:", v10, v11, v7);
    -[TSIDSTransferFlow setSecureIntentProxCard:](self, "setSecureIntentProxCard:", v13);

  }
  else
  {
    _TSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[TSIDSTransferFlow launchSecureIntentUI:descriptor:isLocalConvertFlow:completion:]";
      _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "secure intent gesture is not required. skip @%s", (uint8_t *)&v17, 0xCu);
    }

    v15 = (id)-[CoreTelephonyClient updateSecureIntentData:](self->_client, "updateSecureIntentData:", v10);
  }
  -[TSSIMSetupFlow topViewController](self, "topViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v16);

  v12[2](v12, 1);
}

- (void)transferEventUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v4;
    v16 = 2080;
    v17 = "-[TSIDSTransferFlow transferEventUpdate:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(v4, "objectForKey:", CFSTR("kTransferWebsheet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TSIDSTransferFlow setIsWebsheetFlow:](self, "setIsWebsheetFlow:", 1);
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v7);

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("kTransferInformationSent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CoreTelephonyClient setDelegate:](self->_client, "setDelegate:", 0);
    -[TSSIMSetupFlow topViewController](self, "topViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      -[TSSIMSetupFlow topViewController](self, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v11);

    }
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("UpdateProxCardVisibility"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v12, "BOOLValue"))
      {
        _TSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[TSIDSTransferFlow transferEventUpdate:].cold.1(v13);
      }
      else
      {
        -[TSSIMSetupFlow topViewController](self, "topViewController");
        v13 = objc_claimAutoreleasedReturnValue();
        -[TSSIMSetupFlow viewControllerDidComplete:](self, "viewControllerDidComplete:", v13);
      }

    }
  }

}

- (PRXCardContentProviding)secureIntentProxCard
{
  return (PRXCardContentProviding *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSecureIntentProxCard:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (BOOL)isWebsheetFlow
{
  return self->_isWebsheetFlow;
}

- (void)setIsWebsheetFlow:(BOOL)a3
{
  self->_isWebsheetFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_secureIntentProxCard, 0);
  objc_storeStrong((id *)&self->_transferringWatchDogTimer, 0);
}

- (void)transferEventUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSIDSTransferFlow transferEventUpdate:]";
  _os_log_error_impl(&dword_21B647000, log, OS_LOG_TYPE_ERROR, "[E]Unexpected transferEventUpdate for resuming prox card @%s", (uint8_t *)&v1, 0xCu);
}

@end
