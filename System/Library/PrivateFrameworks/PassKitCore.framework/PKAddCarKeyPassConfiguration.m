@implementation PKAddCarKeyPassConfiguration

- (PKAddCarKeyPassConfiguration)init
{
  PKAddCarKeyPassConfiguration *v2;
  PKAddCarKeyPassConfiguration *v3;
  NSString *password;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAddCarKeyPassConfiguration;
  v2 = -[PKAddSecureElementPassConfiguration initWithType:](&v6, sel_initWithType_, 1);
  v3 = v2;
  if (v2)
  {
    password = v2->_password;
    v2->_password = (NSString *)&stru_1E2ADF4C0;

  }
  return v3;
}

- (id)vehicleInitiatedPairingLaunchURL
{
  void *v3;
  void *v4;

  -[PKAddSecureElementPassConfiguration issuerIdentifier](self, "issuerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKVehicleInitiatedPairingLaunchURL(v3, self->_supportedRadioTechnologies, self->_provisioningTemplateIdentifier, self->_referralSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAddCarKeyPassConfiguration;
  v4 = a3;
  -[PKAddSecureElementPassConfiguration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_password, CFSTR("password"), v6.receiver, v6.super_class);
  PKSubcredentialPairingReferralSourceToString(self->_referralSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("referralSource"));

  objc_msgSend(v4, "encodeInteger:forKey:", self->_supportedRadioTechnologies, CFSTR("supportedRadioTechnologies"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_provisioningTemplateIdentifier, CFSTR("provisioningTemplateIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_manufacturerIdentifier, CFSTR("manufacturerIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pairedReaderIdentifier, CFSTR("pairedReaderIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_productPlanIdentifier, CFSTR("productPlanIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleName, CFSTR("vehicleName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_ownerKeyPairingAvailable, CFSTR("ownerKeyPairingAvailable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_proofOfOwnershipPresent, CFSTR("proofOfOwnershipPresent"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_onlineServicesActivated, CFSTR("onlineServicesActivated"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_passwordEnteredManually, CFSTR("passwordEnteredManually"));

}

- (PKAddCarKeyPassConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAddCarKeyPassConfiguration *v5;
  uint64_t v6;
  NSString *password;
  void *v8;
  uint64_t v9;
  NSString *provisioningTemplateIdentifier;
  uint64_t v11;
  NSString *manufacturerIdentifier;
  uint64_t v13;
  NSString *pairedReaderIdentifier;
  uint64_t v15;
  NSString *productPlanIdentifier;
  uint64_t v17;
  NSString *vehicleName;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAddCarKeyPassConfiguration;
  v5 = -[PKAddSecureElementPassConfiguration initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
    v6 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referralSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_referralSource = PKSubcredentialPairingReferralSourceFromString(v8);

    v5->_supportedRadioTechnologies = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedRadioTechnologies"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provisioningTemplateIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    provisioningTemplateIdentifier = v5->_provisioningTemplateIdentifier;
    v5->_provisioningTemplateIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manufacturerIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    manufacturerIdentifier = v5->_manufacturerIdentifier;
    v5->_manufacturerIdentifier = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairedReaderIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    pairedReaderIdentifier = v5->_pairedReaderIdentifier;
    v5->_pairedReaderIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productPlanIdentifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    productPlanIdentifier = v5->_productPlanIdentifier;
    v5->_productPlanIdentifier = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleName"));
    v17 = objc_claimAutoreleasedReturnValue();
    vehicleName = v5->_vehicleName;
    v5->_vehicleName = (NSString *)v17;

    v5->_ownerKeyPairingAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ownerKeyPairingAvailable"));
    v5->_proofOfOwnershipPresent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("proofOfOwnershipPresent"));
    v5->_onlineServicesActivated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlineServicesActivated"));
    v5->_passwordEnteredManually = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("passwordEnteredManually"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("manufacturerIdentifier: '%@'; "), self->_manufacturerIdentifier);
  -[PKAddSecureElementPassConfiguration issuerIdentifier](self, "issuerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("issuerIdentifier: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("provisioningTemplateIdentifier: '%@'; "),
    self->_provisioningTemplateIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("pairedReaderIdentifier: '%@'; "), self->_pairedReaderIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("productPlanIdentifier: '%@'; "), self->_productPlanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("vehicleName: '%@'; "), self->_vehicleName);
  if (-[NSString length](self->_password, "length"))
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasPassword: '%@'; "), v5);
  if (self->_passwordEnteredManually)
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("passwordEnteredManually: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(NSString *)password
{
  objc_setProperty_nonatomic_copy(self, a2, password, 56);
}

- (PKRadioTechnology)supportedRadioTechnologies
{
  return self->_supportedRadioTechnologies;
}

- (void)setSupportedRadioTechnologies:(PKRadioTechnology)supportedRadioTechnologies
{
  self->_supportedRadioTechnologies = supportedRadioTechnologies;
}

- (NSString)manufacturerIdentifier
{
  return self->_manufacturerIdentifier;
}

- (void)setManufacturerIdentifier:(NSString *)manufacturerIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, manufacturerIdentifier, 72);
}

- (NSString)provisioningTemplateIdentifier
{
  return self->_provisioningTemplateIdentifier;
}

- (void)setProvisioningTemplateIdentifier:(NSString *)provisioningTemplateIdentifier
{
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, provisioningTemplateIdentifier);
}

- (unint64_t)referralSource
{
  return self->_referralSource;
}

- (void)setReferralSource:(unint64_t)a3
{
  self->_referralSource = a3;
}

- (NSString)pairedReaderIdentifier
{
  return self->_pairedReaderIdentifier;
}

- (void)setPairedReaderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)productPlanIdentifier
{
  return self->_productPlanIdentifier;
}

- (void)setProductPlanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)ownerKeyPairingAvailable
{
  return self->_ownerKeyPairingAvailable;
}

- (void)setOwnerKeyPairingAvailable:(BOOL)a3
{
  self->_ownerKeyPairingAvailable = a3;
}

- (BOOL)proofOfOwnershipPresent
{
  return self->_proofOfOwnershipPresent;
}

- (void)setProofOfOwnershipPresent:(BOOL)a3
{
  self->_proofOfOwnershipPresent = a3;
}

- (BOOL)onlineServicesActivated
{
  return self->_onlineServicesActivated;
}

- (void)setOnlineServicesActivated:(BOOL)a3
{
  self->_onlineServicesActivated = a3;
}

- (BOOL)passwordEnteredManually
{
  return self->_passwordEnteredManually;
}

- (void)setPasswordEnteredManually:(BOOL)a3
{
  self->_passwordEnteredManually = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_productPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_provisioningTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_manufacturerIdentifier, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
