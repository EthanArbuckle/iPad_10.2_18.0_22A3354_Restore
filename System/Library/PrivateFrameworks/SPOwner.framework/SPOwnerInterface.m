@implementation SPOwnerInterface

- (id)beaconSharingSession
{
  return objc_alloc_init(SPBeaconSharingManager);
}

+ (id)cbPeripheralManagementSession
{
  if (cbPeripheralManagementSession_onceToken != -1)
    dispatch_once(&cbPeripheralManagementSession_onceToken, &__block_literal_global_12);
  return (id)cbPeripheralManagementSession_sharedInstance;
}

void __49__SPOwnerInterface_cbPeripheralManagementSession__block_invoke()
{
  SPCBPeripheralManager *v0;
  void *v1;

  v0 = objc_alloc_init(SPCBPeripheralManager);
  v1 = (void *)cbPeripheralManagementSession_sharedInstance;
  cbPeripheralManagementSession_sharedInstance = (uint64_t)v0;

}

- (id)ownerSession
{
  return objc_alloc_init(SPOwnerSession);
}

- (id)privateOwnerSession
{
  return objc_alloc_init(SPOwnerSession);
}

- (id)persistentConnectionSession
{
  return objc_alloc_init(SPOwnerSession);
}

- (id)privateFirmwareUpdateSession
{
  return objc_alloc_init(SPFirmwareUpdateSession);
}

- (id)firmwareUpdateSession
{
  return objc_alloc_init(SPFirmwareUpdateSession);
}

- (id)tagSeparationSession
{
  return objc_alloc_init(SPOwnerSession);
}

- (id)separationMonitoringSession
{
  return objc_alloc_init(SPOwnerSession);
}

- (id)trackingAvoidanceService
{
  return objc_alloc_init(SPOwnerSession);
}

- (id)settingsConfiguration
{
  return (id)objc_opt_new();
}

- (id)fmipRegisterInfo
{
  return (id)objc_opt_new();
}

- (id)maintenanceConnectionSession
{
  return objc_alloc_init(SPOwnerSession);
}

- (id)beaconSharingSessionWithToolingSupport
{
  return objc_alloc_init(SPBeaconSharingManager);
}

@end
