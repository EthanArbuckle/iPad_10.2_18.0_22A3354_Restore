@implementation PKPendingPassUpgrade

- (PKPendingPassUpgrade)initWithRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  PKPendingPassUpgrade *v9;
  PKPendingPassUpgrade *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *completionHandlers;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPendingPassUpgrade init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_upgradeRequest, a3);
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v12 = _Block_copy(v8);
    v13 = objc_msgSend(v11, "initWithObjects:", v12, 0);
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = (NSMutableArray *)v13;

    v10->_requiresAppletUpgrade = 1;
  }

  return v10;
}

- (void)setAppletDidUpgrade:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_appletDidUpgrade)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Applet did upgrade invoked twice?", v5, 2u);
    }

  }
  self->_appletDidUpgrade = 1;
}

- (void)setUpgradedPass:(id)a3
{
  PKPaymentPass *v4;
  PKPaymentPass *upgradedPass;
  NSObject *v6;
  uint8_t v7[16];

  v4 = (PKPaymentPass *)a3;
  upgradedPass = self->_upgradedPass;
  if (upgradedPass)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Pass did upgrade invoked twice?", v7, 2u);
    }

    upgradedPass = self->_upgradedPass;
  }
  self->_upgradedPass = v4;

}

- (BOOL)upgradeIsComplete
{
  if (!self->_webRequestFinished || self->_upgradePassURL && !self->_upgradedPass)
    return 0;
  if (self->_requiresAppletUpgrade)
    return self->_appletDidUpgrade;
  return 1;
}

- (PKPassUpgradeRequest)upgradeRequest
{
  return self->_upgradeRequest;
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (BOOL)webRequestFinished
{
  return self->_webRequestFinished;
}

- (void)setWebRequestFinished:(BOOL)a3
{
  self->_webRequestFinished = a3;
}

- (BOOL)requiresAppletUpgrade
{
  return self->_requiresAppletUpgrade;
}

- (void)setRequiresAppletUpgrade:(BOOL)a3
{
  self->_requiresAppletUpgrade = a3;
}

- (BOOL)appletDidUpgrade
{
  return self->_appletDidUpgrade;
}

- (PKPaymentPass)upgradedPass
{
  return self->_upgradedPass;
}

- (NSURL)upgradePassURL
{
  return self->_upgradePassURL;
}

- (void)setUpgradePassURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)passUpgradeInProgress
{
  return self->_passUpgradeInProgress;
}

- (void)setPassUpgradeInProgress:(BOOL)a3
{
  self->_passUpgradeInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upgradePassURL, 0);
  objc_storeStrong((id *)&self->_upgradedPass, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_upgradeRequest, 0);
}

@end
