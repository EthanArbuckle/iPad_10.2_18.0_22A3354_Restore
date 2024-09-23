@implementation OTOperationDependencies

- (id)initForContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 stateHolder:(id)a6 flagHandler:(id)a7 sosAdapter:(id)a8 octagonAdapter:(id)a9 accountsAdapter:(id)a10 authKitAdapter:(id)a11 personaAdapter:(id)a12 deviceInfoAdapter:(id)a13 ckksAccountSync:(id)a14 lockStateTracker:(id)a15 cuttlefishXPCWrapper:(id)a16 escrowRequestClass:(Class)a17 notifierClass:(Class)a18 flowID:(id)a19 deviceSessionID:(id)a20 permittedToSendMetrics:(BOOL)a21 reachabilityTracker:(id)a22
{
  id v27;
  id v28;
  id v29;
  OTOperationDependencies *v30;
  OTOperationDependencies *v31;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v47 = a4;
  v46 = a5;
  v45 = a6;
  v44 = a7;
  v43 = a8;
  v42 = a9;
  v41 = a10;
  v40 = a11;
  v39 = a12;
  v38 = a13;
  v27 = a14;
  v28 = a15;
  v29 = a16;
  v37 = a19;
  v36 = a20;
  v35 = a22;
  v49.receiver = self;
  v49.super_class = (Class)OTOperationDependencies;
  v30 = -[OTOperationDependencies init](&v49, "init");
  v31 = v30;
  if (v30)
  {
    objc_storeStrong((id *)&v30->_containerName, a3);
    objc_storeStrong((id *)&v31->_contextID, a4);
    objc_storeStrong((id *)&v31->_activeAccount, a5);
    objc_storeStrong((id *)&v31->_stateHolder, a6);
    objc_storeStrong((id *)&v31->_flagHandler, a7);
    objc_storeStrong((id *)&v31->_sosAdapter, a8);
    objc_storeStrong((id *)&v31->_octagonAdapter, a9);
    objc_storeStrong((id *)&v31->_accountsAdapter, a10);
    objc_storeStrong((id *)&v31->_authKitAdapter, a11);
    objc_storeStrong((id *)&v31->_personaAdapter, a12);
    objc_storeStrong((id *)&v31->_deviceInformationAdapter, a13);
    objc_storeWeak((id *)&v31->_ckks, v27);
    objc_storeStrong((id *)&v31->_lockStateTracker, a15);
    objc_storeStrong((id *)&v31->_cuttlefishXPCWrapper, a16);
    objc_storeStrong((id *)&v31->_escrowRequestClass, a17);
    objc_storeStrong((id *)&v31->_notifierClass, a18);
    objc_storeStrong((id *)&v31->_flowID, a19);
    objc_storeStrong((id *)&v31->_deviceSessionID, a20);
    v31->_permittedToSendMetrics = a21;
    objc_storeStrong((id *)&v31->_reachabilityTracker, a22);
  }

  return v31;
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContextID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OTCuttlefishAccountStateHolder)stateHolder
{
  return (OTCuttlefishAccountStateHolder *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStateHolder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OctagonStateFlagHandler)flagHandler
{
  return (OctagonStateFlagHandler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFlagHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSosAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CKKSPeerProvider)octagonAdapter
{
  return (CKKSPeerProvider *)objc_getProperty(self, a2, 64, 1);
}

- (void)setOctagonAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccountsAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAuthKitAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPersonaAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OTDeviceInformationAdapter)deviceInformationAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceInformationAdapter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 104, 1);
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_loadWeakRetained((id *)&self->_ckks);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 120, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 136, 1);
}

- (void)setEscrowRequestClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 144, 1);
}

- (void)setNotifierClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)flowID
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFlowID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)deviceSessionID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeviceSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)permittedToSendMetrics
{
  return self->_permittedToSendMetrics;
}

- (void)setPermittedToSendMetrics:(BOOL)a3
{
  self->_permittedToSendMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_notifierClass, 0);
  objc_storeStrong((id *)&self->_escrowRequestClass, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_destroyWeak((id *)&self->_ckks);
  objc_storeStrong((id *)&self->_cuttlefishXPCWrapper, 0);
  objc_storeStrong((id *)&self->_deviceInformationAdapter, 0);
  objc_storeStrong((id *)&self->_personaAdapter, 0);
  objc_storeStrong((id *)&self->_authKitAdapter, 0);
  objc_storeStrong((id *)&self->_accountsAdapter, 0);
  objc_storeStrong((id *)&self->_octagonAdapter, 0);
  objc_storeStrong((id *)&self->_sosAdapter, 0);
  objc_storeStrong((id *)&self->_flagHandler, 0);
  objc_storeStrong((id *)&self->_stateHolder, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end
