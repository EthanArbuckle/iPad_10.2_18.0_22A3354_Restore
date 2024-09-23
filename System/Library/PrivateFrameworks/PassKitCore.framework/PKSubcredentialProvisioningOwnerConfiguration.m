@implementation PKSubcredentialProvisioningOwnerConfiguration

- (PKSubcredentialProvisioningOwnerConfiguration)initWithSession:(id)a3 pairingPassword:(id)a4 keyName:(id)a5 issuerIdentifier:(id)a6 manufacturerIdentifier:(id)a7 webService:(id)a8 registrationMetadata:(id)a9 radioTechnologies:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  PKSubcredentialProvisioningOwnerConfiguration *v19;
  PKSubcredentialProvisioningOwnerConfiguration *v20;
  id v22;
  id v23;

  v16 = a3;
  v23 = a4;
  v22 = a5;
  v17 = a6;
  v18 = a7;
  v19 = -[PKSubcredentialProvisioningLocalDeviceConfiguration initWithWebService:registrationMetadata:configurationType:](self, "initWithWebService:registrationMetadata:configurationType:", a8, a9, 0);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_session, v16);
    objc_storeStrong((id *)&v20->_pairingPassword, a4);
    objc_storeStrong((id *)&v20->_keyName, a5);
    objc_storeStrong((id *)&v20->_issuerIdentifier, a6);
    objc_storeStrong((id *)&v20->_manufacturerIdentifier, a7);
    v20->_radioTechnologies = a10;
  }

  return v20;
}

- (id)transitionTable
{
  return objc_alloc_init(PKSubcredentialProvisioningOwnerPairingTransitionTable);
}

- (int64_t)startingState
{
  return 2;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *keyName;
  NSString *issuerIdentifier;
  NSString *manufacturerIdentifier;
  NSString *pairingPassword;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  keyName = self->_keyName;
  issuerIdentifier = self->_issuerIdentifier;
  manufacturerIdentifier = self->_manufacturerIdentifier;
  pairingPassword = self->_pairingPassword;
  PKRadioTechnologyToString(self->_radioTechnologies);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; keyName: %@; issuerIdentifier: %@; manufacturerIdentifier: %@; pairingPassword: %@; radioTechnologies: %@ >"),
    v4,
    self,
    keyName,
    issuerIdentifier,
    manufacturerIdentifier,
    pairingPassword,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PKAppletSubcredentialPairingSession)session
{
  return (PKAppletSubcredentialPairingSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (NSString)pairingPassword
{
  return self->_pairingPassword;
}

- (NSString)keyName
{
  return self->_keyName;
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (unint64_t)radioTechnologies
{
  return self->_radioTechnologies;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_pairingPassword, 0);
  objc_destroyWeak((id *)&self->_session);
}

@end
