@implementation RBAttributeContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedEndowments, 0);
  objc_storeStrong((id *)&self->_entitlementManager, 0);
  objc_storeStrong((id *)&self->_bundlePropertiesManager, 0);
  objc_storeStrong((id *)&self->_domainAttributeManager, 0);
  objc_storeStrong((id *)&self->_availableInheritances, 0);
  objc_storeStrong((id *)&self->_initialProcessState, 0);
  objc_storeStrong((id *)&self->_targetIdentity, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_assertionID, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_originatorEntitlements, 0);
  objc_storeStrong((id *)&self->_originatorProperties, 0);
  objc_storeStrong((id *)&self->_originatorProcess, 0);
  objc_storeStrong((id *)&self->_targetEntitlements, 0);
  objc_storeStrong((id *)&self->_targetProperties, 0);
  objc_storeStrong((id *)&self->_targetProcess, 0);
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return self->_domainAttributeManager;
}

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (void)setSavedEndowments:(id)a3
{
  objc_storeStrong((id *)&self->_savedEndowments, a3);
}

- (void)setAvailableInheritances:(id)a3
{
  objc_storeStrong((id *)&self->_availableInheritances, a3);
}

- (RBBundleProperties)targetProperties
{
  RBSProcessIdentity *targetIdentity;
  RBBundlePropertiesManaging *bundlePropertiesManager;
  void *v5;
  RBBundleProperties *v6;
  RBBundleProperties *targetProperties;
  RBBundleProperties *v8;

  if (!self->_targetProperties)
  {
    targetIdentity = self->_targetIdentity;
    if (targetIdentity)
    {
      bundlePropertiesManager = self->_bundlePropertiesManager;
      -[RBProcess identifier](self->_targetProcess, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:](bundlePropertiesManager, "propertiesForIdentity:identifier:", targetIdentity, v5);
      v6 = (RBBundleProperties *)objc_claimAutoreleasedReturnValue();
      targetProperties = self->_targetProperties;
      self->_targetProperties = v6;

    }
    else
    {
      v8 = objc_alloc_init(RBBundleProperties);
      v5 = self->_targetProperties;
      self->_targetProperties = v8;
    }

  }
  return self->_targetProperties;
}

- (void)setDomainAttributeManager:(id)a3
{
  objc_storeStrong((id *)&self->_domainAttributeManager, a3);
}

- (void)setEntitlementManager:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementManager, a3);
}

- (void)setBundlePropertiesManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePropertiesManager, a3);
}

- (void)setInitialProcessState:(id)a3
{
  objc_storeStrong((id *)&self->_initialProcessState, a3);
}

- (void)setAssertion:(id)a3
{
  RBSAssertionIdentifier *v5;
  RBSAssertionIdentifier *assertionID;
  RBConcreteTargeting *target;
  RBConcreteTargeting *v8;
  RBConcreteTargeting *v9;
  char v10;
  RBConcreteTargeting *v11;
  RBConcreteTargeting *v12;
  RBProcess *v13;
  RBProcess *targetProcess;
  RBSProcessIdentity *v15;
  RBSProcessIdentity *targetIdentity;
  RBBundleProperties *targetProperties;
  void *originatorProcess;
  void *v19;
  void *v20;
  char v21;
  RBProcess *v22;
  RBProcess *v23;
  RBBundleProperties *originatorProperties;
  id v25;

  v25 = a3;
  objc_storeStrong((id *)&self->_assertion, a3);
  objc_msgSend(v25, "identifier");
  v5 = (RBSAssertionIdentifier *)objc_claimAutoreleasedReturnValue();
  assertionID = self->_assertionID;
  self->_assertionID = v5;

  target = self->_target;
  objc_msgSend(v25, "target");
  v8 = (RBConcreteTargeting *)objc_claimAutoreleasedReturnValue();
  if (target == v8)
    goto LABEL_8;
  v9 = v8;
  if (!target || !v8)
  {

    goto LABEL_7;
  }
  v10 = -[RBConcreteTargeting isEqual:](target, "isEqual:", v8);

  if ((v10 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(v25, "target");
    v11 = (RBConcreteTargeting *)objc_claimAutoreleasedReturnValue();
    v12 = self->_target;
    self->_target = v11;

    -[RBConcreteTargeting process](self->_target, "process");
    v13 = (RBProcess *)objc_claimAutoreleasedReturnValue();
    targetProcess = self->_targetProcess;
    self->_targetProcess = v13;

    -[RBConcreteTargeting identity](self->_target, "identity");
    v15 = (RBSProcessIdentity *)objc_claimAutoreleasedReturnValue();
    targetIdentity = self->_targetIdentity;
    self->_targetIdentity = v15;

    self->_targetIsSystem = -[RBConcreteTargeting isSystem](self->_target, "isSystem");
    targetProperties = self->_targetProperties;
    self->_targetProperties = 0;

    target = self->_targetEntitlements;
    self->_targetEntitlements = 0;
LABEL_8:

  }
  originatorProcess = self->_originatorProcess;
  objc_msgSend(v25, "originator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (originatorProcess != v19)
  {
    v20 = v19;
    if (originatorProcess && v19)
    {
      v21 = objc_msgSend(originatorProcess, "isEqual:", v19);

      if ((v21 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
    objc_msgSend(v25, "originator");
    v22 = (RBProcess *)objc_claimAutoreleasedReturnValue();
    v23 = self->_originatorProcess;
    self->_originatorProcess = v22;

    originatorProperties = self->_originatorProperties;
    self->_originatorProperties = 0;

    originatorProcess = self->_originatorEntitlements;
    self->_originatorEntitlements = 0;
  }

LABEL_17:
}

- (RBInheritanceCollection)availableInheritances
{
  return self->_availableInheritances;
}

- (RBSystemState)systemState
{
  return self->_systemState;
}

- (BOOL)isActiveDueToInheritedEndowment
{
  return self->_activeDueToInheritedEndowmentCount != 0;
}

- (RBProcessState)initialProcessState
{
  return self->_initialProcessState;
}

- (RBSProcessIdentity)targetIdentity
{
  return self->_targetIdentity;
}

- (void)pushActiveDueToInheritedEndowment
{
  ++self->_activeDueToInheritedEndowmentCount;
}

- (void)popActiveDueToInheritedEndowment
{
  --self->_activeDueToInheritedEndowmentCount;
}

- (RBConcreteTargeting)target
{
  return self->_target;
}

- (RBSAssertionIdentifier)assertionID
{
  return self->_assertionID;
}

- (RBAssertion)assertion
{
  return self->_assertion;
}

- (RBProcess)targetProcess
{
  return self->_targetProcess;
}

- (RBEntitlementPossessing)targetEntitlements
{
  RBEntitlementPossessing *v3;
  void *targetEntitlements;
  RBEntitlements *v5;
  RBEntitlementPossessing *v6;
  RBEntitlementPossessing *v7;

  if (!self->_targetEntitlements)
  {
    if (self->_targetProcess)
    {
      -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:");
      v3 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      targetEntitlements = self->_targetEntitlements;
      self->_targetEntitlements = v3;
    }
    else
    {
      v5 = [RBEntitlements alloc];
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      targetEntitlements = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[RBEntitlements _initWithEntitlements:](v5, "_initWithEntitlements:", targetEntitlements);
      v7 = self->_targetEntitlements;
      self->_targetEntitlements = v6;

    }
  }
  return self->_targetEntitlements;
}

- (RBBundleProperties)originatorProperties
{
  void *v3;
  RBBundlePropertiesManaging *bundlePropertiesManager;
  void *v5;
  void *v6;
  RBBundleProperties *v7;
  RBBundleProperties *originatorProperties;
  RBBundleProperties *v9;

  if (!self->_originatorProperties)
  {
    -[RBProcess identity](self->_originatorProcess, "identity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      bundlePropertiesManager = self->_bundlePropertiesManager;
      -[RBProcess identity](self->_originatorProcess, "identity");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBProcess identifier](self->_originatorProcess, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:](bundlePropertiesManager, "propertiesForIdentity:identifier:", v5, v6);
      v7 = (RBBundleProperties *)objc_claimAutoreleasedReturnValue();
      originatorProperties = self->_originatorProperties;
      self->_originatorProperties = v7;

    }
    else
    {
      v9 = objc_alloc_init(RBBundleProperties);
      v5 = self->_originatorProperties;
      self->_originatorProperties = v9;
    }

  }
  return self->_originatorProperties;
}

- (RBEntitlementPossessing)originatorEntitlements
{
  RBEntitlementPossessing *v3;
  void *originatorEntitlements;
  RBEntitlements *v5;
  RBEntitlementPossessing *v6;
  RBEntitlementPossessing *v7;

  if (!self->_originatorEntitlements)
  {
    if (self->_originatorProcess)
    {
      -[RBEntitlementManaging entitlementsForProcess:](self->_entitlementManager, "entitlementsForProcess:");
      v3 = (RBEntitlementPossessing *)objc_claimAutoreleasedReturnValue();
      originatorEntitlements = self->_originatorEntitlements;
      self->_originatorEntitlements = v3;
    }
    else
    {
      v5 = [RBEntitlements alloc];
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      originatorEntitlements = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[RBEntitlements _initWithEntitlements:](v5, "_initWithEntitlements:", originatorEntitlements);
      v7 = self->_originatorEntitlements;
      self->_originatorEntitlements = v6;

    }
  }
  return self->_originatorEntitlements;
}

- (RBProcess)originatorProcess
{
  return self->_originatorProcess;
}

- (BOOL)targetIsSystem
{
  return self->_targetIsSystem;
}

- (RBBundlePropertiesManaging)bundlePropertiesManager
{
  return self->_bundlePropertiesManager;
}

- (RBEntitlementManaging)entitlementManager
{
  return self->_entitlementManager;
}

- (NSDictionary)savedEndowments
{
  return self->_savedEndowments;
}

@end
