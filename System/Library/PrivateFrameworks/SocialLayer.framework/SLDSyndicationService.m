@implementation SLDSyndicationService

+ (id)remoteObjectProtocol
{
  return &unk_1EE39CEB8;
}

+ (id)sharedService
{
  if (sharedService_onceToken_9 != -1)
    dispatch_once(&sharedService_onceToken_9, &__block_literal_global_20);
  return (id)sharedService_sService_9;
}

void __38__SLDSyndicationService_sharedService__block_invoke()
{
  SLDSyndicationService *v0;
  void *v1;

  v0 = objc_alloc_init(SLDSyndicationService);
  v1 = (void *)sharedService_sService_9;
  sharedService_sService_9 = (uint64_t)v0;

}

- (void)removeMessageGUIDFromSyndication:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t);
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void (*IMSPIRemoveMessageGUIDFromSyndicationSymbolLoc);
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  SLDaemonLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)&v12[4] = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
    *(_WORD *)&v12[12] = 2112;
    *(_QWORD *)&v12[14] = v5;
    _os_log_impl(&dword_199EFF000, v7, OS_LOG_TYPE_DEFAULT, "%s messageGUID: %@", v12, 0x16u);
  }

  if (!objc_msgSend(v5, "length"))
  {
    SLDaemonLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SLDSyndicationService removeMessageGUIDFromSyndication:reply:].cold.1((uint64_t)v5, v9);
    goto LABEL_16;
  }
  if (!IMCoreLibraryCore_frameworkLibrary_2)
  {
    *(_OWORD *)v12 = xmmword_1E37960B0;
    *(_QWORD *)&v12[16] = 0;
    IMCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!IMCoreLibraryCore_frameworkLibrary_2 || !getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc())
  {
    SLDaemonLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SLDSyndicationService removeMessageGUIDFromSyndication:reply:].cold.2(v9);
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  SLDaemonLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)&v12[4] = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
    *(_WORD *)&v12[12] = 2112;
    *(_QWORD *)&v12[14] = v5;
    _os_log_impl(&dword_199EFF000, v8, OS_LOG_TYPE_INFO, "%s: Calling remove message guid: %@", v12, 0x16u);
  }

  v9 = v5;
  IMSPIRemoveMessageGUIDFromSyndicationSymbolLoc = (void (*))getIMSPIRemoveMessageGUIDFromSyndicationSymbolLoc();
  if (!IMSPIRemoveMessageGUIDFromSyndicationSymbolLoc)
    SLDCreateGroupPhotoImageWithGroupID_cold_1();
  IMSPIRemoveMessageGUIDFromSyndicationSymbolLoc(v9);
  v11 = 1;
LABEL_17:

  v6[2](v6, v11);
}

- (void)removeMessageGUIDFromSyndication:(uint64_t)a1 reply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_199EFF000, a2, OS_LOG_TYPE_ERROR, "%s: invalid messageGUID passed in: %@", (uint8_t *)&v2, 0x16u);
}

- (void)removeMessageGUIDFromSyndication:(os_log_t)log reply:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SLDSyndicationService removeMessageGUIDFromSyndication:reply:]";
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "%s: IMSPIRemoveMessageGUIDFromSyndication is unavailable.", (uint8_t *)&v1, 0xCu);
}

@end
