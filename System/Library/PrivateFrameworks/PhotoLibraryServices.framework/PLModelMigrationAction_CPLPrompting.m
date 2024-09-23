@implementation PLModelMigrationAction_CPLPrompting

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;

  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLModelMigrationActionCore startingSchemaVersion](self, "startingSchemaVersion") - 11000;
  v8 = (void *)objc_opt_class();
  v9 = v8;
  if (v7 > 0x2D)
  {
    -[PLModelMigrationActionCore pathManager](self, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shouldRepromptUserIfNeededWithPathManager:", v10);

  }
  else
  {
    objc_msgSend(v8, "_setLastWelcomedDBVersion");
  }
  objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "completedUnitCount") + 1);
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = 0;

  return 1;
}

+ (void)shouldRepromptUserIfNeededWithPathManager:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint8_t v8[16];

  v4 = a3;
  if (objc_msgSend(v4, "isSystemPhotoLibraryPathManager"))
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Resetting iCPL prompt if needed", v8, 2u);
    }

    objc_msgSend(v4, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v6);

    if ((v7 & 1) != 0)
      objc_msgSend(a1, "_setLastWelcomedDBVersion");
    else
      objc_msgSend(a1, "_resetICPLPrompt");
  }

}

+ (void)_setLastWelcomedDBVersion
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 12200);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("iCloudPhotoLibraryLastResetWelcomePromptDBVersion"), v2, CFSTR("com.apple.mobileslideshow"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
}

+ (void)_resetICPLPrompt
{
  void *v3;
  const void *v4;

  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("iCloudPhotoLibraryLastResetWelcomePromptDBVersion"), CFSTR("com.apple.mobileslideshow"));
  if (v3)
  {
    v4 = v3;
    if ((int)objc_msgSend(v3, "intValue") <= 12199)
    {
      CFPreferencesSetAppValue(CFSTR("iCloudPhotoLibraryHasBeenWelcomedAccountIdentifiers"), 0, CFSTR("com.apple.mobileslideshow"));
      CFPreferencesSetAppValue(CFSTR("iCloudPhotoLibraryHasBeenEnabledAccountIdentifiers"), 0, CFSTR("com.apple.mobileslideshow"));
    }
    CFRelease(v4);
  }
  else
  {
    CFPreferencesSetAppValue(CFSTR("iCloudPhotoLibraryHasBeenWelcomedAccountIdentifiers"), 0, CFSTR("com.apple.mobileslideshow"));
    CFPreferencesSetAppValue(CFSTR("iCloudPhotoLibraryHasBeenEnabledAccountIdentifiers"), 0, CFSTR("com.apple.mobileslideshow"));
  }
  objc_msgSend(a1, "_setLastWelcomedDBVersion");
}

@end
