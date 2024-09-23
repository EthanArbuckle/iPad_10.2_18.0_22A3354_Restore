@implementation RCSSavedRecordingServiceConnection

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_132);
  return (id)clientInterface_interface;
}

+ (id)newConnection
{
  RCSSavedRecordingServiceConnection *v3;
  void *v4;

  v3 = -[RCSSavedRecordingServiceConnection initWithMachServiceName:options:]([RCSSavedRecordingServiceConnection alloc], "initWithMachServiceName:options:", CFSTR("com.apple.voicememod.xpc"), 0);
  objc_msgSend(a1, "serviceInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCSSavedRecordingServiceConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v4);

  return v3;
}

+ (id)serviceInterface
{
  if (serviceInterface_onceToken != -1)
    dispatch_once(&serviceInterface_onceToken, &__block_literal_global_13);
  return (id)serviceInterface_interface;
}

void __54__RCSSavedRecordingServiceConnection_serviceInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char **v28;
  char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  _QWORD v47[5];

  v47[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF50A8C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceInterface_interface;
  serviceInterface_interface = v0;

  v2 = sel_prepareToCaptureToCompositionAVURL_accessRequestHandler_;
  v47[0] = sel_prepareToPreviewCompositionAVURL_accessRequestHandler_;
  v47[1] = sel_prepareToExportCompositionAVURL_accessRequestHandler_;
  v47[2] = sel_prepareToTrimCompositionAVURL_accessRequestHandler_;
  v47[3] = 0;
  v45 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v46 = (id)objc_msgSend(v45, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromSet:", v46);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setByAddingObjectsFromSet:", v46);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  v26 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (sel_prepareToCaptureToCompositionAVURL_accessRequestHandler_)
  {
    v28 = (char **)v47;
    do
    {
      objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v23, v2, 0, 0);
      objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v15, v2, 0, 1);
      objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, v2, 1, 1);
      v29 = *v28++;
      v2 = v29;
    }
    while (v29);
  }
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_endAccessSessionWithToken_completionBlock_, 0, 0);
  v30 = (void *)serviceInterface_interface;
  objc_msgSend(v27, "setByAddingObjectsFromSet:", v15);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_endAccessSessionWithToken_completionBlock_, 0, 1);

  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_openAudioFile_settings_metadata_accessRequestHandler_, 0, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_openAudioFile_settings_metadata_accessRequestHandler_, 1, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_openAudioFile_settings_metadata_accessRequestHandler_, 2, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_openAudioFile_settings_metadata_accessRequestHandler_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_openAudioFile_settings_metadata_accessRequestHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_closeAudioFile_completionBlock_, 0, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_closeAudioFile_completionBlock_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_writeAudioFile_buffer_completionBlock_, 0, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_writeAudioFile_buffer_completionBlock_, 1, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_writeAudioFile_buffer_completionBlock_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_disableOrphanedFragmentCleanupForCompositionAVURL_completionBlock_, 0, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_enableOrphanedFragmentCleanupForCompositionAVURL_, 0, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_fetchCompositionAVURLsBeingExported_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_fetchCompositionAVURLsBeingModified_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel__fetchAllAccessTokens_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_, 0, 0);
  v32 = (void *)serviceInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_, 1, 0);

  v34 = (void *)serviceInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_, 2, 0);

  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_, 3, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_importRecordingWithSourceAudioURL_name_date_userInfo_importCompletionBlock_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_enableCloudRecordingsWithCompletionBlock_, 0, 1);
  v36 = (void *)serviceInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v37, sel_importRecordingsFromCloud_, 0, 1);

  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_importRecordingsFromCloud_, 1, 1);
  v38 = (void *)serviceInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_exportRecordingsToCloud_, 0, 1);

  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_exportRecordingsToCloud_, 1, 1);
  v40 = (void *)serviceInterface_interface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_expungeRecordingsFromCloud_, 0, 1);

  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_expungeRecordingsFromCloud_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_reloadExistingSearchMetadataWithCompletionBlock_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_clearAndReloadSearchMetadataWithCompletionBlock_, 0, 1);
  v42 = (void *)MEMORY[0x1E0C99E60];
  v43 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_, 0, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_, 1, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_, 2, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_updateSearchMetadataWithRecordingURIsToInsert_recordingURIsToUpdate_recordingURIsToDelete_completionBlock_, 0, 1);

}

void __53__RCSSavedRecordingServiceConnection_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF50A3A8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface_interface;
  clientInterface_interface = v0;

}

@end
