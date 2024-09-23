@implementation LSGetResumableActivitiesAdministrativeProtocolInterface

void ___LSGetResumableActivitiesAdministrativeProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE66B30);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_LSGetResumableActivitiesAdministrativeProtocolInterface_result;
  _LSGetResumableActivitiesAdministrativeProtocolInterface_result = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  getSFPeerDeviceClass_0();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  getSFPeerDeviceClass_0();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_doCopyAllUUIDsOfType_withCompletionHandler_, 0, 1);
  objc_msgSend((id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_doCopyEnabledUUIDsWithCompletionHandler_, 0, 1);
  objc_msgSend((id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_doGetPairedDevices_completionHandler_, 0, 1);
  objc_msgSend((id)_LSGetResumableActivitiesAdministrativeProtocolInterface_result, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_doGetPairedDevices_completionHandler_, 1, 1);

}

@end
