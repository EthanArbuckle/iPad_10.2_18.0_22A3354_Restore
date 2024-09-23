@implementation TRIAllocationStatusEntitlementSet

- (TRIAllocationStatusEntitlementSet)initWithAllowedDeploymentEnvironments:(id)a3
{
  id v5;
  TRIAllocationStatusEntitlementSet *v6;
  TRIAllocationStatusEntitlementSet *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIAllocationStatusEntitlementSet;
  v6 = -[TRIAllocationStatusEntitlementSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_allowedDeploymentEnvironments, a3);

  return v7;
}

- (id)allowedDeploymentEnvironments
{
  return self->_allowedDeploymentEnvironments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedDeploymentEnvironments, 0);
}

@end
