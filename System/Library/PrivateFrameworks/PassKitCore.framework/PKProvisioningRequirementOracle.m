@implementation PKProvisioningRequirementOracle

- (PKProvisioningRequirementOracle)init
{
  PKProvisioningRequirementOracle *v2;
  _PKProvisioningRequirementOracle *v3;
  _PKProvisioningRequirementOracle *underlying;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKProvisioningRequirementOracle;
  v2 = -[PKProvisioningRequirementOracle init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_PKProvisioningRequirementOracle);
    underlying = v2->_underlying;
    v2->_underlying = v3;

  }
  return v2;
}

- (id)requirementsForAddSecureElementPassConfiguration:(id)a3
{
  return -[_PKProvisioningRequirementOracle requirementsForAddSecureElementPassConfiguration:](self->_underlying, "requirementsForAddSecureElementPassConfiguration:", a3);
}

- (id)recoverableRequirements
{
  return -[_PKProvisioningRequirementOracle recoverableRequirementsContainer](self->_underlying, "recoverableRequirementsContainer");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
