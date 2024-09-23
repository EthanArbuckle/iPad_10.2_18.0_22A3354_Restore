@implementation NSPersistentStoreDescription(Workflow)

+ (id)wf_shortcutsConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "wf_shortcutsDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wf_configurationInDirectory:filename:", v2, CFSTR("Shortcuts.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wf_configurationInDirectory:()Workflow filename:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPersistentStoreDescription+Workflow.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directoryURL.fileURL"));

  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSPersistentStoreDescription+Workflow.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename.length"));

  }
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend([a1 alloc], "initWithURL:", v9);

  return v10;
}

+ (id)wf_voiceShortcutsDirectoryURL
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "wf_realLibraryDirectoryURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("VoiceShortcuts"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)wf_legacyVoiceShortcutsConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "wf_voiceShortcutsDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wf_configurationInDirectory:filename:", v2, CFSTR("VoiceShortcuts.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wf_inMemoryConfiguration
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wf_shortcutsConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setType:", *MEMORY[0x1E0C979E8]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/dev/null"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setURL:", v2);

  return v1;
}

@end
