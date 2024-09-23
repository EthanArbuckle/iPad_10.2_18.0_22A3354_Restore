@implementation PLAssetsdCrashRecoveryClientAuthorization

- (BOOL)photoKitEntitledFor:(id)a3
{
  return 1;
}

- (BOOL)isCameraClient
{
  return 0;
}

- (PLAssetsdCrashRecoveryClientAuthorization)init
{
  PLAssetsdCrashRecoveryClientAuthorization *v2;
  PLAssetsdCrashRecoveryClientAuthorization *v3;
  void *v4;
  uint64_t v5;
  NSString *trustedCallerBundleID;
  LSBundleRecord *trustedCallerContainingBundleRecord;
  void *v8;
  uint64_t v9;
  NSString *trustedCallerDisplayName;
  uint64_t v11;
  PLCaptureSessionState *captureSessionState;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLAssetsdCrashRecoveryClientAuthorization;
  v2 = -[PLAssetsdCrashRecoveryClientAuthorization init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_clientIsSandboxed = 1;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    trustedCallerBundleID = v3->_trustedCallerBundleID;
    v3->_trustedCallerBundleID = (NSString *)v5;

    trustedCallerContainingBundleRecord = v3->_trustedCallerContainingBundleRecord;
    v3->_trustedCallerContainingBundleRecord = 0;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    trustedCallerDisplayName = v3->_trustedCallerDisplayName;
    v3->_trustedCallerDisplayName = (NSString *)v9;

    v3->_clientProcessIdentifier = getpid();
    *(_WORD *)&v3->_directDatabaseAccessAuthorized = 257;
    v3->_limitedLibraryMode = 0;
    v3->_clientIsSandboxed = 1;
    v3->_managedSpotlightIndexReadWriteEntitled = 0;
    objc_msgSend(MEMORY[0x1E0D73198], "none");
    v11 = objc_claimAutoreleasedReturnValue();
    captureSessionState = v3->_captureSessionState;
    v3->_captureSessionState = (PLCaptureSessionState *)v11;

  }
  return v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_clientAuditToken, 32, 1, 0);
  return result;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (NSString)trustedCallerBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (LSBundleRecord)trustedCallerContainingBundleRecord
{
  return (LSBundleRecord *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)fetchFilterIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)trustedCallerDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)trustedCallerPhotoLibraryUsageDescription
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)photoKitEntitled
{
  return self->_photoKitEntitled;
}

- (BOOL)directDatabaseAccessAuthorized
{
  return self->_directDatabaseAccessAuthorized;
}

- (BOOL)directDatabaseWriteAuthorized
{
  return self->_directDatabaseWriteAuthorized;
}

- (BOOL)cloudInternalEntitled
{
  return self->_cloudInternalEntitled;
}

- (BOOL)analyticsCacheReadEntitled
{
  return self->_analyticsCacheReadEntitled;
}

- (BOOL)analyticsCacheWriteEntitled
{
  return self->_analyticsCacheWriteEntitled;
}

- (BOOL)smartSharingCacheReadEntitled
{
  return self->_smartSharingCacheReadEntitled;
}

- (BOOL)smartSharingCacheWriteEntitled
{
  return self->_smartSharingCacheWriteEntitled;
}

- (BOOL)limitedLibraryMode
{
  return self->_limitedLibraryMode;
}

- (BOOL)isClientLimitedLibraryCapable
{
  return self->_clientLimitedLibraryCapable;
}

- (BOOL)clientIsSandboxed
{
  return self->_clientIsSandboxed;
}

- (BOOL)photosDataVaultEntitled
{
  return self->_photosDataVaultEntitled;
}

- (BOOL)internalDataReadWriteAuthorized
{
  return self->_internalDataReadWriteAuthorized;
}

- (BOOL)isClientAuthorizedForTCCServicePhotos
{
  return self->_clientAuthorizedForTCCServicePhotos;
}

- (BOOL)isClientAuthorizedForTCCServicePhotosAdd
{
  return self->_clientAuthorizedForTCCServicePhotosAdd;
}

- (BOOL)coreSceneUnderstandingTaxonomyReadAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyReadAuthorized;
}

- (BOOL)coreSceneUnderstandingTaxonomyWriteAuthorized
{
  return self->_coreSceneUnderstandingTaxonomyWriteAuthorized;
}

- (PLCaptureSessionState)captureSessionState
{
  return (PLCaptureSessionState *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)managedSpotlightIndexReadWriteEntitled
{
  return self->_managedSpotlightIndexReadWriteEntitled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureSessionState, 0);
  objc_storeStrong((id *)&self->_trustedCallerPhotoLibraryUsageDescription, 0);
  objc_storeStrong((id *)&self->_trustedCallerDisplayName, 0);
  objc_storeStrong((id *)&self->_fetchFilterIdentifier, 0);
  objc_storeStrong((id *)&self->_trustedCallerContainingBundleRecord, 0);
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
}

@end
