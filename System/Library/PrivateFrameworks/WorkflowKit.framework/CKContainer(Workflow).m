@implementation CKContainer(Workflow)

+ (id)wf_shortcutsContainer
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "systemShortcutsUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "BOOLForKey:", CFSTR("WFCloudKitDevEnvironment")))
    v1 = 2;
  else
    v1 = 1;

  v2 = objc_alloc(MEMORY[0x1E0C94C40]);
  v3 = (void *)objc_msgSend(v2, "initWithContainerIdentifier:environment:", *MEMORY[0x1E0D142F0], v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:", v3);
  objc_msgSend(v4, "wf_setShortcutsAppAttribution");

  return v4;
}

- (void)wf_setShortcutsAppAttribution
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *MEMORY[0x1E0DC7FD8];
  objc_msgSend(a1, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationBundleIdentifierOverrideForTCC:", v2);

  objc_msgSend(a1, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setApplicationBundleIdentifierOverrideForContainerAccess:", v2);

  objc_msgSend(a1, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v2);

  objc_msgSend(a1, "options");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationBundleIdentifierOverrideForPushTopicGeneration:", v2);

}

@end
