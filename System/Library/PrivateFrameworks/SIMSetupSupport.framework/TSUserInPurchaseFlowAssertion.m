@implementation TSUserInPurchaseFlowAssertion

+ (id)sharedInstance
{
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, &__block_literal_global_8);
  return (id)sharedInstance_instance;
}

void __47__TSUserInPurchaseFlowAssertion_sharedInstance__block_invoke()
{
  TSUserInPurchaseFlowAssertion *v0;
  void *v1;

  v0 = objc_alloc_init(TSUserInPurchaseFlowAssertion);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (TSUserInPurchaseFlowAssertion)init
{
  TSUserInPurchaseFlowAssertion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUserInPurchaseFlowAssertion;
  result = -[TSUserInPurchaseFlowAssertion init](&v3, sel_init);
  if (result)
    result->_assertionCounter = 0;
  return result;
}

- (void)assertUserInPurchaseFlowStartOver:(BOOL)a3 caller:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  int assertionCounter;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
    v7 = 1;
  else
    v7 = self->_assertionCounter + 1;
  self->_assertionCounter = v7;
  _TSLogDomain();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    assertionCounter = self->_assertionCounter;
    v11[0] = 67109634;
    v11[1] = assertionCounter;
    v12 = 2112;
    v13 = v6;
    v14 = 2080;
    v15 = "-[TSUserInPurchaseFlowAssertion assertUserInPurchaseFlowStartOver:caller:]";
    _os_log_impl(&dword_21B647000, v8, OS_LOG_TYPE_DEFAULT, "_assertionCounter: %d, caller:%@ @%s", (uint8_t *)v11, 0x1Cu);
  }

  if (self->_assertionCounter >= 1)
  {
    objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setUserInPurchaseFlow:", 1);

  }
}

- (void)deassertUserInPurchaseFlowWithForce:(BOOL)a3 caller:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int assertionCounter;
  int v9;
  int v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  id v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    assertionCounter = self->_assertionCounter;
    v12[0] = 67109634;
    v12[1] = assertionCounter;
    v13 = 2112;
    v14 = v6;
    v15 = 2080;
    v16 = "-[TSUserInPurchaseFlowAssertion deassertUserInPurchaseFlowWithForce:caller:]";
    _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "_assertionCounter: %d, caller:%@ @%s", (uint8_t *)v12, 0x1Cu);
  }

  v9 = self->_assertionCounter;
  if (v9)
  {
    v10 = v9 - 1;
    self->_assertionCounter = v10;
    if (!v10 || v4)
    {
      objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setUserInPurchaseFlow:", 0);

    }
  }

}

@end
