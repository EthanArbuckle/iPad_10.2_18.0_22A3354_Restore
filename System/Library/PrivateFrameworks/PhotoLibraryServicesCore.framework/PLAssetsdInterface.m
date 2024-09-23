@implementation PLAssetsdInterface

+ (NSXPCInterface)assetsdInterface
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38DAC0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v14, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_bindToPhotoLibraryURL_sandboxExtension_clientOptions_withReply_, 2, 0);
  objc_msgSend(a1, "_addLibraryInterfaces:", v3);
  objc_msgSend(a1, "_addPhotoKitInterface:", v3);
  objc_msgSend(a1, "_addPhotoKitAddInterface:", v3);
  objc_msgSend(a1, "_addResourceAvailabilityInterface:", v3);
  objc_msgSend(a1, "_addResourceInterfaces:", v3);
  objc_msgSend(a1, "_addCloudInterfaces:", v3);
  objc_msgSend(a1, "_addMigrationInterface:", v3);
  objc_msgSend(a1, "_addSyncInterface:", v3);
  objc_msgSend(a1, "_addNotificationInterface:", v3);
  objc_msgSend(a1, "_addDemoInterface:", v3);
  objc_msgSend(a1, "_addDiagnosticsInterface:", v3);
  objc_msgSend(a1, "_addDebugInterface:", v3);

  return (NSXPCInterface *)v3;
}

+ (void)_addSyncInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38F478);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getSyncServiceWithReply_, 0, 1);

}

+ (void)_addResourceAvailabilityInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38E870);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getResourceAvailabilityServiceWithReply_, 0, 1);

}

+ (void)_addPhotoKitInterface:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38E778);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getUUIDsForAssetObjectURIs_filterPredicate_reply_, 0, 0);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getUUIDsForAssetObjectURIs_filterPredicate_reply_, 1, 0);
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getUUIDsForAssetObjectURIs_filterPredicate_reply_, 0, 1);
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v14, sel_getPhotoKitServiceWithReply_, 0, 1);

}

+ (void)_addResourceInterfaces:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v28 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38EAB0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v26, v14, v15, v16, v17, v18, v19, v20, v21, v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_, 0, 0);
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_, 1, 1);
  objc_msgSend(v29, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_consolidateAssets_reply_, 0, 1);
  objc_msgSend(v28, "setInterface:forSelector:argumentIndex:ofReply:", v29, sel_getResourceServiceWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE389138);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_, 0, 0);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_saveAssetWithDataAndPorts_imageSurface_previewImageSurface_reply_, 1, 1);
  objc_msgSend(v28, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_getResourceWriteOnlyServiceWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38EBB8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_batchSaveAssetJobs_reply_, 0, 1);
  objc_msgSend(v28, "setInterface:forSelector:argumentIndex:ofReply:", v25, sel_getResourceInternalServiceWithReply_, 0, 1);

}

+ (void)_addPhotoKitAddInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38E810);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getPhotoKitAddServiceWithReply_, 0, 1);

}

+ (void)_addNotificationInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38F650);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getNotificationServiceWithReply_, 0, 1);

}

+ (void)_addMigrationInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38F398);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getMigrationServiceWithReply_, 0, 1);

}

+ (void)_addLibraryInterfaces:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38DDE8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v17, sel_getLibraryServiceWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38E260);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getLibraryInternalServiceWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38E428);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, NSClassFromString((NSString *)CFSTR("PLPhotoLibraryIdentifier")), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_createManagedPhotoLibraryWithOptions_sandboxExtension_reply_, 0, 0);
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_findPhotoLibraryIdentifiersMatchingSearchCriteria_reply_, 0, 1);
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_getLibraryManagementServiceWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38E4F0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_getSystemLibraryURLReadOnlyServiceWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38E5C0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_getPrivacySupportServiceWithReply_, 0, 1);

}

+ (void)_addDiagnosticsInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38F800);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getDiagnosticsServiceWithReply_, 0, 1);

}

+ (void)_addDemoInterface:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38F730);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getDemoServiceWithReply_, 0, 1);

}

+ (void)_addDebugInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v15, v14, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38FE78);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_getDebugServiceWithReply_, 0, 1);

  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_debugSidecarURLsWithObjectURI_reply_, 1, 1);
}

+ (void)_addCloudInterfaces:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB3B50];
  v4 = a3;
  objc_msgSend(v3, "interfaceWithProtocol:", &unk_1EE38ED00);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v6, sel_getCloudServiceWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38F2C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_getCloudInternalServiceWithReply_, 0, 1);

}

@end
