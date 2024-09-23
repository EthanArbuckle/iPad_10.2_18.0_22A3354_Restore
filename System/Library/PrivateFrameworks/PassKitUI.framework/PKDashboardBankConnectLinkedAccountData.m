@implementation PKDashboardBankConnectLinkedAccountData

- (id)accountID
{
  void *v2;
  void *v3;
  void *v4;

  -[PKDashboardBankConnectLinkedAccountData account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullyQualifiedAccountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (FKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (FKInstitution)institution
{
  return self->_institution;
}

- (void)setInstitution:(id)a3
{
  objc_storeStrong((id *)&self->_institution, a3);
}

- (unint64_t)consentStatus
{
  return self->_consentStatus;
}

- (void)setConsentStatus:(unint64_t)a3
{
  self->_consentStatus = a3;
}

- (FKBackgroundRefreshConfirmationPromptToken)backgroundRefreshConfirmationToken
{
  return self->_backgroundRefreshConfirmationToken;
}

- (void)setBackgroundRefreshConfirmationToken:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundRefreshConfirmationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundRefreshConfirmationToken, 0);
  objc_storeStrong((id *)&self->_institution, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
