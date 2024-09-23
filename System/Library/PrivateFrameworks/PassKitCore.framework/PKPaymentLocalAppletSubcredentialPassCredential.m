@implementation PKPaymentLocalAppletSubcredentialPassCredential

- (PKPaymentLocalAppletSubcredentialPassCredential)initWithPaymentPass:(id)a3 credentialToShare:(id)a4
{
  id v7;
  id v8;
  PKPaymentLocalAppletSubcredentialPassCredential *v9;
  PKPaymentLocalAppletSubcredentialPassCredential *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = -[PKPaymentCredential init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paymentPass, a3);
    objc_storeStrong((id *)&v10->_credentialToShare, a4);
    objc_msgSend(v7, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentCredential setLongDescription:](v10, "setLongDescription:", v11);

  }
  return v10;
}

- (PKAddCarKeyPassConfiguration)configuration
{
  PKAddCarKeyPassConfiguration *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(PKAddCarKeyPassConfiguration);
  -[PKAddCarKeyPassConfiguration setSupportedRadioTechnologies:](v3, "setSupportedRadioTechnologies:", -[PKAppletSubcredential supportedRadioTechnologies](self->_credentialToShare, "supportedRadioTechnologies"));
  -[PKAppletSubcredential manufacturerIdentifier](self->_credentialToShare, "manufacturerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAppletSubcredential brandIdentifier](self->_credentialToShare, "brandIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  -[PKAddSecureElementPassConfiguration setIssuerIdentifier:](v3, "setIssuerIdentifier:", v7);

  -[PKAddCarKeyPassConfiguration setManufacturerIdentifier:](v3, "setManufacturerIdentifier:", v4);
  return v3;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (PKAppletSubcredential)credentialToShare
{
  return self->_credentialToShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialToShare, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
}

@end
