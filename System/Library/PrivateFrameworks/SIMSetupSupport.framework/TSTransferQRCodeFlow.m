@implementation TSTransferQRCodeFlow

- (TSTransferQRCodeFlow)initWithIccid:(id)a3
{
  id v5;
  TSTransferQRCodeFlow *v6;
  TSTransferQRCodeFlow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSTransferQRCodeFlow;
  v6 = -[TSSIMSetupFlow init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_iccid, a3);

  return v7;
}

- (void)firstViewController:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSString *v15;
  NSString *carrierName;
  void *v17;
  void *v18;
  NSString *iccid;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "planItems");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v11, "iccid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", self->_iccid);

            if (v13)
            {
              objc_msgSend(v11, "carrierName");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              carrierName = self->_carrierName;
              self->_carrierName = v15;

              goto LABEL_16;
            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v8)
            continue;
          break;
        }
      }
LABEL_16:

      v17 = (void *)MEMORY[0x220765A70](v4);
      objc_initWeak((id *)buf, self);
      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      iccid = self->_iccid;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __44__TSTransferQRCodeFlow_firstViewController___block_invoke;
      v21[3] = &unk_24DEF36D0;
      objc_copyWeak(&v23, (id *)buf);
      v20 = v17;
      v21[4] = self;
      v22 = v20;
      objc_msgSend(v18, "getPlanTransferCredentials:completion:", iccid, v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      _TSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[TSTransferQRCodeFlow firstViewController:]";
        _os_log_impl(&dword_21B647000, v14, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/MagnoliaOverQRCode is disabled @%s", buf, 0xCu);
      }

      v4[2](v4, 0);
    }
  }

}

void __44__TSTransferQRCodeFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  TSTransferQRCodeViewController *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_10;
  }
  if (!objc_msgSend(v3, "length"))
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_2(v7, v15, v16, v17, v18, v19, v20, v21);
LABEL_10:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  v5 = -[TSTransferQRCodeViewController initWithTransferCredentials:carrierName:]([TSTransferQRCodeViewController alloc], "initWithTransferCredentials:carrierName:", v3, WeakRetained[12]);
  objc_msgSend(*(id *)(a1 + 32), "setTopViewController:", v5);
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 138412546;
    v23 = objc_opt_class();
    v24 = 2080;
    v25 = "-[TSTransferQRCodeFlow firstViewController:]_block_invoke";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v22, 0x16u);
  }

  -[TSTransferQRCodeViewController setDelegate:](v5, "setDelegate:", WeakRetained);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
}

void __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
}

void __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]no credentials @%s", a5, a6, a7, a8, 2u);
}

@end
