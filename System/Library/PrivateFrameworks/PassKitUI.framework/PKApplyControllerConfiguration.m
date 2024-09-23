@implementation PKApplyControllerConfiguration

- (PKApplyControllerConfiguration)initWithSetupDelegate:(id)a3 context:(int64_t)a4 provisioningController:(id)a5
{
  id v8;
  id v9;
  PKApplyControllerConfiguration *v10;
  PKApplyControllerConfiguration *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyControllerConfiguration;
  v10 = -[PKApplyControllerConfiguration init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_setupDelegate, v8);
    v11->_context = a4;
    objc_storeStrong((id *)&v11->_provisioningController, a5);
  }

  return v11;
}

- (unint64_t)feature
{
  PKFeatureApplication *featureApplication;

  featureApplication = self->_featureApplication;
  if (featureApplication)
    return -[PKFeatureApplication feature](featureApplication, "feature");
  else
    return self->_feature;
}

- (int64_t)applicationType
{
  PKFeatureApplication *featureApplication;

  featureApplication = self->_featureApplication;
  if (featureApplication)
    return -[PKFeatureApplication applicationType](featureApplication, "applicationType");
  else
    return self->_applicationType;
}

- (unint64_t)featureProduct
{
  PKFeatureApplication *featureApplication;

  featureApplication = self->_featureApplication;
  if (featureApplication)
    return -[PKFeatureApplication featureProduct](featureApplication, "featureProduct");
  else
    return self->_featureProduct;
}

- (NSString)referenceIdentifier
{
  void *v3;
  NSString *v4;

  -[PKFeatureApplication referenceIdentifier](self->_featureApplication, "referenceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKFeatureApplication referenceIdentifier](self->_featureApplication, "referenceIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_referenceIdentifier;
  }
  return v4;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (void)setFeatureProduct:(unint64_t)a3
{
  self->_featureProduct = a3;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_updateUserInfoSubType = a3;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_verificationType = a3;
}

- (PKFeatureApplication)featureApplication
{
  return self->_featureApplication;
}

- (void)setFeatureApplication:(id)a3
{
  objc_storeStrong((id *)&self->_featureApplication, a3);
}

- (void)setReferenceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_referenceIdentifier, a3);
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSource, a3);
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  return (PKPaymentSetupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_featureApplication, 0);
}

@end
