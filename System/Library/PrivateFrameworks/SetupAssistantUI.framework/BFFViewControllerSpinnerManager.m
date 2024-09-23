@implementation BFFViewControllerSpinnerManager

+ (void)configureWithNavigationController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    +[BFFViewControllerSpinnerManagerObjc configureWithNavigationController:](BFFViewControllerSpinnerManagerObjc, "configureWithNavigationController:", v3);
  }
  else
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[BFFViewControllerSpinnerManager configureWithNavigationController:].cold.1(v6);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__BFFViewControllerSpinnerManager_configureWithNavigationController___block_invoke;
    block[3] = &unk_24D2341B8;
    v8 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __69__BFFViewControllerSpinnerManager_configureWithNavigationController___block_invoke(uint64_t a1)
{
  return +[BFFViewControllerSpinnerManagerObjc configureWithNavigationController:](BFFViewControllerSpinnerManagerObjc, "configureWithNavigationController:", *(_QWORD *)(a1 + 32));
}

+ (void)startAnimatingSpinnerFor:(id)a3 identifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    if (v5)
    {
      +[BFFViewControllerSpinnerManagerObjc startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManagerObjc, "startAnimatingSpinnerFor:identifier:", v5, v6);
    }
    else
    {
      _BYLoggingFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:].cold.1((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);

    }
  }
  else
  {
    _BYLoggingFacility();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:identifier:].cold.2((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__BFFViewControllerSpinnerManager_startAnimatingSpinnerFor_identifier___block_invoke;
    v23[3] = &unk_24D2341E0;
    v24 = v5;
    v25 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v23);

  }
}

uint64_t __71__BFFViewControllerSpinnerManager_startAnimatingSpinnerFor_identifier___block_invoke(uint64_t a1)
{
  return +[BFFViewControllerSpinnerManagerObjc startAnimatingSpinnerFor:identifier:](BFFViewControllerSpinnerManagerObjc, "startAnimatingSpinnerFor:identifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)stopAnimatingSpinnerFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[4];
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    +[BFFViewControllerSpinnerManagerObjc stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManagerObjc, "stopAnimatingSpinnerFor:", v3);
  }
  else
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:].cold.1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__BFFViewControllerSpinnerManager_stopAnimatingSpinnerFor___block_invoke;
    block[3] = &unk_24D2341B8;
    v14 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __59__BFFViewControllerSpinnerManager_stopAnimatingSpinnerFor___block_invoke(uint64_t a1)
{
  return +[BFFViewControllerSpinnerManagerObjc stopAnimatingSpinnerFor:](BFFViewControllerSpinnerManagerObjc, "stopAnimatingSpinnerFor:", *(_QWORD *)(a1 + 32));
}

+ (void)configureWithNavigationController:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214875000, log, OS_LOG_TYPE_FAULT, "BFFViewControllerSpinnerManager.configureWithNavigationController needs to be called on the main thread.", v1, 2u);
}

+ (void)startAnimatingSpinnerFor:(uint64_t)a3 identifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214875000, a2, a3, "startAnimatingSpinnerFor called with nil view controller for identifier: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)startAnimatingSpinnerFor:(uint64_t)a3 identifier:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214875000, a2, a3, "startAnimatingSpinnerFor called off the main thread, offender %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)stopAnimatingSpinnerFor:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214875000, a2, a3, "stopAnimatingSpinnerFor called off the main thread, offender %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
