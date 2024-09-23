@implementation TRINamespaceOptionalParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceAttributionIdentifier, 0);
  objc_storeStrong((id *)&self->_upgradeNCVs, 0);
  objc_storeStrong((id *)&self->_appContainer, 0);
  objc_storeStrong((id *)&self->_factorsURL, 0);
}

- (void)setUpgradeNCVs:(id)a3
{
  objc_class *v4;
  id v5;
  NSSet *v6;
  NSSet *upgradeNCVs;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0C99E60];
    v5 = a3;
    v6 = (NSSet *)objc_msgSend([v4 alloc], "initWithSet:copyItems:", v5, 1);

    upgradeNCVs = self->_upgradeNCVs;
    self->_upgradeNCVs = v6;

  }
}

- (void)setResourceAttributionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setFactorsURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCloudKitContainerId:(int)a3
{
  self->_cloudKitContainerId = a3;
}

- (void)setAppContainer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TRINamespaceOptionalParams)init
{
  TRINamespaceOptionalParams *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRINamespaceOptionalParams;
  result = -[TRINamespaceOptionalParams init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_expensiveNetworkingAllowed = 0;
    *(_QWORD *)&result->_cloudKitContainerId = 0x300000001;
    result->_availableToRootUser = 0;
  }
  return result;
}

- (NSSet)upgradeNCVs
{
  return self->_upgradeNCVs;
}

- (NSString)resourceAttributionIdentifier
{
  return self->_resourceAttributionIdentifier;
}

- (int)purgeabilityLevel
{
  return self->_purgeabilityLevel;
}

- (NSURL)factorsURL
{
  return self->_factorsURL;
}

- (BOOL)expensiveNetworkingAllowed
{
  return self->_expensiveNetworkingAllowed;
}

- (BOOL)enableFetchDuringSetupAssistant
{
  return self->_enableFetchDuringSetupAssistant;
}

- (int)cloudKitContainerId
{
  return self->_cloudKitContainerId;
}

- (BOOL)availableToRootUser
{
  return self->_availableToRootUser;
}

- (TRIAppContainer)appContainer
{
  return self->_appContainer;
}

- (void)setPurgeabilityLevel:(int)a3
{
  self->_purgeabilityLevel = a3;
}

- (void)setExpensiveNetworkingAllowed:(BOOL)a3
{
  self->_expensiveNetworkingAllowed = a3;
}

- (void)setEnableFetchDuringSetupAssistant:(BOOL)a3
{
  self->_enableFetchDuringSetupAssistant = a3;
}

- (void)setAvailableToRootUser:(BOOL)a3
{
  self->_availableToRootUser = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFactorsURL:", self->_factorsURL);
  objc_msgSend(v4, "setAppContainer:", self->_appContainer);
  objc_msgSend(v4, "setUpgradeNCVs:", self->_upgradeNCVs);
  objc_msgSend(v4, "setCloudKitContainerId:", self->_cloudKitContainerId);
  objc_msgSend(v4, "setResourceAttributionIdentifier:", self->_resourceAttributionIdentifier);
  objc_msgSend(v4, "setExpensiveNetworkingAllowed:", self->_expensiveNetworkingAllowed);
  objc_msgSend(v4, "setEnableFetchDuringSetupAssistant:", self->_enableFetchDuringSetupAssistant);
  objc_msgSend(v4, "setPurgeabilityLevel:", self->_purgeabilityLevel);
  objc_msgSend(v4, "setAvailableToRootUser:", self->_availableToRootUser);
  return v4;
}

@end
