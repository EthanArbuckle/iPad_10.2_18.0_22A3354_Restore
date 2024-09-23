@implementation PKAppleBalanceSetupController

- (PKAppleBalanceSetupController)initWithProduct:(id)a3 setupContext:(int64_t)a4
{
  id v6;
  PKAppleBalanceSetupController *v7;
  PKAppleBalanceSetupController *v8;
  uint64_t v9;
  PKAppleBalanceCredential *credential;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAppleBalanceSetupController;
  v7 = -[PKAppleBalanceSetupController init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_setupContext = a4;
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66A70]), "initWithProduct:eligibilitySource:", v6, 1);
    credential = v8->_credential;
    v8->_credential = (PKAppleBalanceCredential *)v9;

  }
  return v8;
}

- (PKAppleBalanceSetupController)initWithSetupContext:(int64_t)a3 uiOnly:(BOOL)a4
{
  PKAppleBalanceSetupController *v6;
  PKAppleBalanceSetupController *v7;
  uint64_t v8;
  PKAppleBalanceCredential *credential;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAppleBalanceSetupController;
  v6 = -[PKAppleBalanceSetupController init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_setupContext = a3;
    v6->_uiOnly = a4;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66A70]), "initWithProduct:eligibilitySource:", 0, 1);
    credential = v7->_credential;
    v7->_credential = (PKAppleBalanceCredential *)v8;

  }
  return v7;
}

- (int64_t)setupContext
{
  return self->_setupContext;
}

- (PKAppleBalanceCredential)credential
{
  return self->_credential;
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)uiOnly
{
  return self->_uiOnly;
}

- (void)setUiOnly:(BOOL)a3
{
  self->_uiOnly = a3;
}

- (PKAppleBalanceDirectTopUpConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
