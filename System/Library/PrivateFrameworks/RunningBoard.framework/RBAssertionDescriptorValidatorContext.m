@implementation RBAssertionDescriptorValidatorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_acquisitionContext, 0);
  objc_storeStrong((id *)&self->_targetState, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_targetIdentity, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_originatorState, 0);
  objc_storeStrong((id *)&self->_assertionDescriptor, 0);
  objc_storeStrong((id *)&self->_assertionDescriptionValidator, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_originatorProperties, 0);
  objc_storeStrong((id *)&self->_originatorProcess, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_targetProperties, 0);
  objc_storeStrong((id *)&self->_targetProcess, 0);
}

- (RBEntitlementPossessing)originatorEntitlements
{
  RBIgnoreAllEntitlementsManager *v3;
  RBEntitlementPossessing *originatorEntitlements;
  RBEntitlementPossessing *v5;
  RBEntitlementPossessing *v6;

  if (-[RBAssertionDescriptorValidatorContext ignoreRestrictions](self, "ignoreRestrictions"))
  {
    v3 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
  }
  else
  {
    originatorEntitlements = self->_originatorEntitlements;
    if (!originatorEntitlements)
    {
      -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:", self->_originatorProcess);
      v5 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      v6 = self->_originatorEntitlements;
      self->_originatorEntitlements = v5;

      originatorEntitlements = self->_originatorEntitlements;
    }
    v3 = originatorEntitlements;
  }
  return (RBEntitlementPossessing *)v3;
}

- (BOOL)ignoreRestrictions
{
  return self->_ignoreRestrictions != 0;
}

- (BOOL)targetIsSystem
{
  return self->_targetIsSystem;
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)pushIgnoreRestrictions
{
  ++self->_ignoreRestrictions;
}

- (void)popIgnoreRestrictions
{
  --self->_ignoreRestrictions;
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (RBEntitlementPossessing)targetEntitlements
{
  RBIgnoreAllEntitlementsManager *v3;
  RBProcess *targetProcess;
  RBIgnoreAllEntitlementsManager *v5;
  RBEntitlementPossessing *targetEntitlements;

  if (-[RBAssertionDescriptorValidatorContext ignoreRestrictions](self, "ignoreRestrictions"))
  {
    v3 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
  }
  else
  {
    if (!self->_targetEntitlements)
    {
      targetProcess = self->_targetProcess;
      if ((!targetProcess || -[RBProcess isTerminating](targetProcess, "isTerminating"))
        && -[RBAssertionAcquisitionContext allowAbstractTarget](self->_acquisitionContext, "allowAbstractTarget"))
      {
        v5 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
      }
      else
      {
        -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:", self->_targetProcess);
        v5 = (RBIgnoreAllEntitlementsManager *)objc_claimAutoreleasedReturnValue();
      }
      targetEntitlements = self->_targetEntitlements;
      self->_targetEntitlements = (RBEntitlementPossessing *)v5;

    }
    v3 = self->_targetEntitlements;
  }
  return (RBEntitlementPossessing *)v3;
}

- (RBBundleProperties)targetProperties
{
  RBSProcessIdentity *targetIdentity;
  RBBundleProperties *v4;
  RBBundleProperties *targetProperties;

  if (!self->_targetProperties)
  {
    targetIdentity = self->_targetIdentity;
    if (targetIdentity)
    {
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:](self->_bundlePropertiesManager, "propertiesForIdentity:identifier:", targetIdentity, self->_targetIdentifier);
      v4 = (RBBundleProperties *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = objc_alloc_init(RBBundleProperties);
    }
    targetProperties = self->_targetProperties;
    self->_targetProperties = v4;

  }
  return self->_targetProperties;
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (void)setAssertionDescriptionValidator:(id)a3
{
  objc_storeStrong((id *)&self->_assertionDescriptionValidator, a3);
}

- (RBEntitlementManaging)entitlementManager
{
  RBIgnoreAllEntitlementsManager *v3;

  if (-[RBAssertionDescriptorValidatorContext ignoreRestrictions](self, "ignoreRestrictions"))
    v3 = objc_alloc_init(RBIgnoreAllEntitlementsManager);
  else
    v3 = self->_entitlementManager;
  return (RBEntitlementManaging *)v3;
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (RBSAssertionDescriptor)assertionDescriptor
{
  return self->_assertionDescriptor;
}

+ (id)context
{
  return objc_alloc_init(RBAssertionDescriptorValidatorContext);
}

- (void)setTargetState:(id)a3
{
  objc_storeStrong((id *)&self->_targetState, a3);
}

- (void)setTargetProcess:(id)a3
{
  objc_storeStrong((id *)&self->_targetProcess, a3);
}

- (void)setTargetIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_targetIdentity, a3);
}

- (void)setTargetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_targetIdentifier, a3);
}

- (void)setTarget:(id)a3
{
  id v5;
  char v6;

  objc_storeStrong((id *)&self->_target, a3);
  v5 = a3;
  v6 = objc_msgSend(v5, "isSystem");

  self->_targetIsSystem = v6;
}

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (void)setSavedEndowments:(id)a3
{
  objc_storeStrong((id *)&self->_savedEndowments, a3);
}

- (void)setOriginatorState:(id)a3
{
  objc_storeStrong((id *)&self->_originatorState, a3);
}

- (void)setOriginatorProcess:(id)a3
{
  objc_storeStrong((id *)&self->_originatorProcess, a3);
}

- (void)setEntitlementManager:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementManager, a3);
}

- (void)setDomainAttributeManager:(id)a3
{
  objc_storeStrong((id *)&self->_domainAttributeManager, a3);
}

- (void)setBundlePropertiesManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePropertiesManager, a3);
}

- (void)setAssertionDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_assertionDescriptor, a3);
}

- (void)setAcquisitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_acquisitionContext, a3);
}

- (RBAssertionAcquisitionContext)acquisitionContext
{
  return self->_acquisitionContext;
}

- (RBProcess)targetProcess
{
  return self->_targetProcess;
}

- (RBProcess)originatorProcess
{
  return self->_originatorProcess;
}

- (void)setTargetProperties:(id)a3
{
  objc_storeStrong((id *)&self->_targetProperties, a3);
}

- (RBSProcessIdentity)originatorIdentity
{
  return -[RBProcess identity](self->_originatorProcess, "identity");
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBAssertionDescriptorValidatorContext *v4;

  v4 = -[RBAssertionDescriptorValidatorContext init](+[RBAssertionDescriptorValidatorContext allocWithZone:](RBAssertionDescriptorValidatorContext, "allocWithZone:", a3), "init");
  -[RBAssertionDescriptorValidatorContext setAssertionDescriptionValidator:](v4, "setAssertionDescriptionValidator:", self->_assertionDescriptionValidator);
  -[RBAssertionDescriptorValidatorContext setAssertionDescriptor:](v4, "setAssertionDescriptor:", self->_assertionDescriptor);
  -[RBAssertionDescriptorValidatorContext setOriginatorProcess:](v4, "setOriginatorProcess:", self->_originatorProcess);
  -[RBAssertionDescriptorValidatorContext setOriginatorState:](v4, "setOriginatorState:", self->_originatorState);
  -[RBAssertionDescriptorValidatorContext setTarget:](v4, "setTarget:", self->_target);
  -[RBAssertionDescriptorValidatorContext setTargetProcess:](v4, "setTargetProcess:", self->_targetProcess);
  -[RBAssertionDescriptorValidatorContext setTargetIdentity:](v4, "setTargetIdentity:", self->_targetIdentity);
  -[RBAssertionDescriptorValidatorContext setTargetIdentifier:](v4, "setTargetIdentifier:", self->_targetIdentifier);
  -[RBAssertionDescriptorValidatorContext setTargetState:](v4, "setTargetState:", self->_targetState);
  -[RBAssertionDescriptorValidatorContext setBundlePropertiesManager:](v4, "setBundlePropertiesManager:", self->_bundlePropertiesManager);
  -[RBAssertionDescriptorValidatorContext setDomainAttributeManager:](v4, "setDomainAttributeManager:", self->_domainAttributeManager);
  -[RBAssertionDescriptorValidatorContext setEntitlementManager:](v4, "setEntitlementManager:", self->_entitlementManager);
  v4->_ignoreRestrictions = self->_ignoreRestrictions;
  objc_storeStrong((id *)&v4->_acquisitionContext, self->_acquisitionContext);
  return v4;
}

- (void)setTargetEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_targetEntitlements, a3);
}

- (RBBundleProperties)originatorProperties
{
  return self->_originatorProperties;
}

- (void)setOriginatorEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_originatorEntitlements, a3);
}

- (RBAssertionDescriptorValidator)assertionDescriptionValidator
{
  return self->_assertionDescriptionValidator;
}

- (RBProcessState)originatorState
{
  return self->_originatorState;
}

- (RBSProcessIdentity)targetIdentity
{
  return self->_targetIdentity;
}

- (RBSProcessIdentifier)targetIdentifier
{
  return self->_targetIdentifier;
}

- (RBProcessState)targetState
{
  return self->_targetState;
}

- (NSDictionary)savedEndowments
{
  return self->_savedEndowments;
}

@end
