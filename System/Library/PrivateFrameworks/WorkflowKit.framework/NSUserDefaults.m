@implementation NSUserDefaults

void __48__NSUserDefaults_Workflow__workflowUserDefaults__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v1 = objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x1E0D14350]);
  v2 = (void *)workflowUserDefaults_workflowUserDefaults;
  workflowUserDefaults_workflowUserDefaults = v1;

  v3 = (void *)workflowUserDefaults_workflowUserDefaults;
  v7[0] = CFSTR("WFEmailAutomationEnabled");
  v7[1] = CFSTR("WFMessagesAutomationEnabled");
  v8[0] = MEMORY[0x1E0C9AAB0];
  v8[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v4);

  if ((objc_msgSend((id)workflowUserDefaults_workflowUserDefaults, "BOOLForKey:", CFSTR("WFActionDefaultFavoritesAddedKey")) & 1) == 0)
  {
    objc_msgSend((id)workflowUserDefaults_workflowUserDefaults, "setBool:forKey:", 1, CFSTR("WFActionDefaultFavoritesAddedKey"));
    objc_msgSend((id)workflowUserDefaults_workflowUserDefaults, "arrayForKey:", CFSTR("WFActionFavorites"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5 || !objc_msgSend(v5, "count"))
      objc_msgSend((id)workflowUserDefaults_workflowUserDefaults, "setValue:forKey:", &unk_1E7B8D340, CFSTR("WFActionFavorites"));

  }
}

void __55__NSUserDefaults_Workflow__systemShortcutsUserDefaults__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v1 = objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x1E0DC8010]);
  v2 = (void *)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  systemShortcutsUserDefaults_systemShortcutsUserDefaults = v1;

  v3 = (void *)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  v5[0] = CFSTR("WFSiriShortcutsMultipageDisambiguationEnabled");
  v5[1] = CFSTR("IntentsHandledBySiriOverride");
  v6[0] = MEMORY[0x1E0C9AAB0];
  v6[1] = &unk_1E7B8D358;
  v5[2] = CFSTR("WFBannersEnabled");
  v5[3] = CFSTR("WFShortcutsToastedBannerAutoCollapseDuration");
  v6[2] = MEMORY[0x1E0C9AAB0];
  v6[3] = &unk_1E7B8AF60;
  v5[4] = CFSTR("UIKitDrawer");
  v6[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v4);

}

void __53__NSUserDefaults_Workflow__siriAssistantUserDefaults__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.assistant"));
  v1 = (void *)siriAssistantUserDefaults_siriAssistantUserDefaults;
  siriAssistantUserDefaults_siriAssistantUserDefaults = v0;

}

void __49__NSUserDefaults_Sync__syncShortcutsUserDefaults__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v1 = objc_msgSend(v0, "initWithSuiteName:", *MEMORY[0x1E0DC8010]);
  v2 = (void *)syncShortcutsUserDefaults_syncShortcutsUserDefaults;
  syncShortcutsUserDefaults_syncShortcutsUserDefaults = v1;

  v3 = (void *)syncShortcutsUserDefaults_syncShortcutsUserDefaults;
  v5[0] = CFSTR("WFShortcutsShouldSyncCoherence");
  v5[1] = CFSTR("WFSyncEventLoggingEnabled");
  v6[0] = MEMORY[0x1E0C9AAA0];
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[2] = CFSTR("WFCloudKitLibraryFetched");
  v5[3] = CFSTR("WFSyncUnavailableMessageDismissedByUser");
  v6[2] = MEMORY[0x1E0C9AAA0];
  v6[3] = MEMORY[0x1E0C9AAA0];
  v5[4] = CFSTR("WFSyncUnavailableMessageCount");
  v6[4] = &unk_1E7B8BD28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerDefaults:", v4);

}

@end
