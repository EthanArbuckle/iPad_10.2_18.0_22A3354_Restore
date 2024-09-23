@implementation ICSMatterhornUpsellHook

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("action:matterhornUpsell"), "isEqualToString:", v3);

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE04C48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(CFSTR("action:matterhornUpsell"), "isEqualToString:", v4);

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  LogSubsystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_24B4C1000, v12, OS_LOG_TYPE_DEFAULT, "matterhorn upsell with element %@ and objectmodel %@", (uint8_t *)&v13, 0x16u);
  }

  -[ICSMatterhornUpsellHook _matterhornUpsell:](self, "_matterhornUpsell:", v11);
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "matterhorn upsell with objectModel %@", (uint8_t *)&v9, 0xCu);
  }

  -[ICSMatterhornUpsellHook _matterhornUpsell:](self, "_matterhornUpsell:", v7);
}

- (void)_matterhornUpsell:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC7480]), "initWithJourneyId:", CFSTR("settingsHideMyEmail"));
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICSMatterhornUpsellHook _matterhornUpsell:].cold.1((uint64_t)v5, v6);

  if (v5)
  {
    v7 = objc_msgSend(v4, "copy");
    v8 = (void *)_hookCompletion;
    _hookCompletion = v7;

    objc_msgSend(v5, "setDelegate:", self);
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_24B4C1000, v9, OS_LOG_TYPE_DEFAULT, "starting matterhorn journey", v10, 2u);
    }

    objc_msgSend(v5, "beginJourney");
  }

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICSMatterhornUpsellHook upgradeFlowManagerDidCancel:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = _hookCompletion;
  if (_hookCompletion)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE04820], -1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

  }
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICSMatterhornUpsellHook upgradeFlowManagerDidComplete:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  if (_hookCompletion)
    (*(void (**)(void))(_hookCompletion + 16))();
}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_matterhornUpsell:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_DEBUG, "flowManager %@", (uint8_t *)&v2, 0xCu);
}

- (void)upgradeFlowManagerDidCancel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24B4C1000, a1, a3, "matterhorn upgrade flow cancel", a5, a6, a7, a8, 0);
}

- (void)upgradeFlowManagerDidComplete:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_24B4C1000, a1, a3, "matterhorn upgrade flow complete", a5, a6, a7, a8, 0);
}

@end
