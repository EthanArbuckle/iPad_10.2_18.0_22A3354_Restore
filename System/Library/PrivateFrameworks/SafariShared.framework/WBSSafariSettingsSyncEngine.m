@implementation WBSSafariSettingsSyncEngine

- (void)registerDiagnosticWithPayloadProvider:(id)a3
{
  WBSDiagnosticStateCollector *v4;
  WBSDiagnosticStateCollector *stateCollector;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D89BD8], "registeredStateCollectorWithLogLabel:payloadProvider:", CFSTR("Safari Start Page State"));
  v4 = (WBSDiagnosticStateCollector *)objc_claimAutoreleasedReturnValue();
  stateCollector = self->_stateCollector;
  self->_stateCollector = v4;

}

- (WBSSafariSettingsSyncEngine)init
{
  WBSSafariSettingsSyncEngine *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *internalQueue;
  void *v5;
  WBSSafariSettingsSyncEngine *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSSafariSettingsSyncEngine;
  v2 = -[WBSSafariSettingsSyncEngine init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.WBSSafariSettingsSyncEngine.internalQueue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchCloudSettingsChangesImmediately");

    v6 = v2;
  }

  return v2;
}

- (void)saveSettingWithDictionaryRepresentation:(id)a3 successCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__WBSSafariSettingsSyncEngine_saveSettingWithDictionaryRepresentation_successCompletionHandler___block_invoke;
  v11[3] = &unk_1E4B2A250;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, v11);

}

void __96__WBSSafariSettingsSyncEngine_saveSettingWithDictionaryRepresentation_successCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveCloudSettingWithDictionaryRepresentation:successCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)deleteBackgroundImageFromCloudKitWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__WBSSafariSettingsSyncEngine_deleteBackgroundImageFromCloudKitWithCompletionHandler___block_invoke;
  block[3] = &unk_1E4B2B038;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

void __86__WBSSafariSettingsSyncEngine_deleteBackgroundImageFromCloudKitWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteBackgroundImageFromCloudKitWithCompletionHandler:", *(_QWORD *)(a1 + 32));

}

- (void)scheduleCloudBackgroundImageSaveWithURL:(id)a3 isLightAppearance:(BOOL)a4 successCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *internalQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__WBSSafariSettingsSyncEngine_scheduleCloudBackgroundImageSaveWithURL_isLightAppearance_successCompletionHandler___block_invoke;
  block[3] = &unk_1E4B3F480;
  v16 = a4;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalQueue, block);

}

void __114__WBSSafariSettingsSyncEngine_scheduleCloudBackgroundImageSaveWithURL_isLightAppearance_successCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleCloudBackgroundImageSaveWithURL:isLightAppearance:successCompletionHandler:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)triggerImmediateBackgroundImageSaveIfApplicable
{
  dispatch_async((dispatch_queue_t)self->_internalQueue, &__block_literal_global_90);
}

void __78__WBSSafariSettingsSyncEngine_triggerImmediateBackgroundImageSaveIfApplicable__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "triggerImmediateBackgroundImageSaveIfApplicable");

}

- (BOOL)syncEnabled
{
  return 0;
}

- (void)syncSettingsDownWithCompletion:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSSafariSettingsSyncEngine_syncSettingsDownWithCompletion___block_invoke;
  block[3] = &unk_1E4B2B038;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

void __62__WBSSafariSettingsSyncEngine_syncSettingsDownWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDownSafariSettingsSyncWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)syncSettingsUpWithCompletion:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSSafariSettingsSyncEngine_syncSettingsUpWithCompletion___block_invoke;
  block[3] = &unk_1E4B2B038;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

void __60__WBSSafariSettingsSyncEngine_syncSettingsUpWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncUpSafariSettingsSyncWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)registerDiagnosticInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__WBSSafariSettingsSyncEngine_registerDiagnosticInfo___block_invoke;
  v6[3] = &unk_1E4B3F4C8;
  v7 = v4;
  v5 = v4;
  -[WBSSafariSettingsSyncEngine registerDiagnosticWithPayloadProvider:](self, "registerDiagnosticWithPayloadProvider:", v6);

}

id __54__WBSSafariSettingsSyncEngine_registerDiagnosticInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)syncPerSiteSettingsDownWithCompletion:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WBSSafariSettingsSyncEngine_syncPerSiteSettingsDownWithCompletion___block_invoke;
  block[3] = &unk_1E4B2B038;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

void __69__WBSSafariSettingsSyncEngine_syncPerSiteSettingsDownWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDownSafariPerSiteSettingsSyncWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void)syncPerSiteSettingsUpWithCompletion:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSSafariSettingsSyncEngine_syncPerSiteSettingsUpWithCompletion___block_invoke;
  block[3] = &unk_1E4B2B038;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, block);

}

void __67__WBSSafariSettingsSyncEngine_syncPerSiteSettingsUpWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncUpSafariPerSiteSettingsSyncWithCompletion:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
