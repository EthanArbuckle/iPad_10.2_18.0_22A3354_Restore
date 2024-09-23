@implementation KTOperationDependencies

- (Class)pcsOperationsClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (void)setPcsOperationsClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTAccountDependency)accountOperations
{
  return (KTAccountDependency *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (KTLockStateTracker)lockStateTracker
{
  return (KTLockStateTracker *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLockStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (KTReachabilityTracker)reachabilityTracker
{
  return (KTReachabilityTracker *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReachabilityTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTNetworkTimeoutBucketProtocol)networkTimeout
{
  return (KTNetworkTimeoutBucketProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkTimeout:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (KTCloudKitAccountStateTrackingProvider)cloudKitAccountTracker
{
  return (KTCloudKitAccountStateTrackingProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCloudKitAccountTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (KTIDSOperations)idsOperations
{
  return (KTIDSOperations *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (KTIDSAccountTracker)idsAccountTracker
{
  return (KTIDSAccountTracker *)objc_getProperty(self, a2, 64, 1);
}

- (void)setIdsAccountTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (KTOctagonOperations)octagonOperations
{
  return (KTOctagonOperations *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOctagonOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (KTLogClientProtocol)logClient
{
  return (KTLogClientProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (KTIDMSOperationProtocol)idmsOperations
{
  return (KTIDMSOperationProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setIdmsOperations:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (KTSMDataStore)smDataStore
{
  return (KTSMDataStore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSmDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (KTContextStoreProtocol)contextStore
{
  return (KTContextStoreProtocol *)objc_getProperty(self, a2, 120, 1);
}

- (void)setContextStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (KTAccountKeyServerProtocol)accountKeyService
{
  return (KTAccountKeyServerProtocol *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAccountKeyService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 136, 1);
}

- (void)setKvs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (KTPublicKeyStoreProtocol)publicKeyStore
{
  return (KTPublicKeyStoreProtocol *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPublicKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTAccountStateHolderProtocol)accountStateHolder
{
  return (KTAccountStateHolderProtocol *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAccountStateHolder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (KTBAAOperationProtocol)certFetcher
{
  return (KTBAAOperationProtocol *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCertFetcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (KTStateFlagHandler)flagHandler
{
  return (KTStateFlagHandler *)objc_loadWeakRetained((id *)&self->_flagHandler);
}

- (void)setFlagHandler:(id)a3
{
  objc_storeWeak((id *)&self->_flagHandler, a3);
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setStaticKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (CKDatabase)ckdatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCkdatabase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCloudRecords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (KTFetchCloudStorageProtocol)fetchCloudStorage
{
  return (KTFetchCloudStorageProtocol *)objc_getProperty(self, a2, 200, 1);
}

- (void)setFetchCloudStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (KTDeviceInformationProtocol)deviceInformation
{
  return (KTDeviceInformationProtocol *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDeviceInformation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 216, 1);
}

- (void)setFollowup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (KTSystemStateProtocol)stateMonitor
{
  return (KTSystemStateProtocol *)objc_getProperty(self, a2, 224, 1);
}

- (void)setStateMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (TransparencyIDSConfigBagProtocol)idsConfigBag
{
  return (TransparencyIDSConfigBagProtocol *)objc_getProperty(self, a2, 232, 1);
}

- (void)setIdsConfigBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (DewConfigurationObjectiveCProtocol)dew
{
  return (DewConfigurationObjectiveCProtocol *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDew:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dew, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_idsConfigBag, 0);
  objc_storeStrong((id *)&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_followup, 0);
  objc_storeStrong((id *)&self->_deviceInformation, 0);
  objc_storeStrong((id *)&self->_fetchCloudStorage, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_ckdatabase, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_destroyWeak((id *)&self->_flagHandler);
  objc_storeStrong((id *)&self->_certFetcher, 0);
  objc_storeStrong((id *)&self->_accountStateHolder, 0);
  objc_storeStrong((id *)&self->_publicKeyStore, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
  objc_storeStrong((id *)&self->_accountKeyService, 0);
  objc_storeStrong((id *)&self->_contextStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_smDataStore, 0);
  objc_storeStrong((id *)&self->_idmsOperations, 0);
  objc_storeStrong((id *)&self->_logClient, 0);
  objc_storeStrong((id *)&self->_octagonOperations, 0);
  objc_storeStrong((id *)&self->_idsAccountTracker, 0);
  objc_storeStrong((id *)&self->_idsOperations, 0);
  objc_storeStrong((id *)&self->_cloudKitAccountTracker, 0);
  objc_storeStrong((id *)&self->_networkTimeout, 0);
  objc_storeStrong((id *)&self->_reachabilityTracker, 0);
  objc_storeStrong((id *)&self->_lockStateTracker, 0);
  objc_storeStrong((id *)&self->_accountOperations, 0);
  objc_storeStrong((id *)&self->_pcsOperationsClass, 0);
}

@end
