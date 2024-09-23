@implementation SVDDeviceResolutionXPCInterface

+ (id)serviceName
{
  return CFSTR("com.apple.siri.device_resolution");
}

+ (id)entitlement
{
  return CFSTR("com.apple.siri.device_resolution");
}

+ (id)xpcInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7DC908);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAllReachableDevicesWithCompletion_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getSourceDeviceForContextWithIdentifiers_completion_, 0, 0);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_getSourceDeviceForContextWithIdentifiers_completion_, 0, 1);

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getDevicesMatchingCapabilityDescriptions_completion_, 0, 0);

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, v18, v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_getDevicesMatchingCapabilityDescriptions_completion_, 0, 1);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_, 0, 0);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_, 1, 0);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_getContextAndProximitySnapshotForCurrentRequestForDeviceUnits_serviceContexts_completion_, 0, 1);

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v34, sel_logCrossDeviceCommandEnded_action_contextProximityPairs_, 2, 0);

  v35 = (void *)MEMORY[0x1E0C99E60];
  v36 = objc_opt_class();
  v37 = objc_opt_class();
  objc_msgSend(v35, "setWithObjects:", v36, v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_logCrossDeviceCommandEnded_action_homeKitTarget_contextProximityPairs_, 3, 0);

  v39 = (void *)MEMORY[0x1E0C99E60];
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_logCrossDeviceCommandEnded_action_actionResult_homeKitTarget_contextProximityPairs_, 4, 0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_pairedCompanionDeviceWithCompletion_, 0, 1);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_meDeviceWithCompletion_, 0, 1);

  return v2;
}

@end
