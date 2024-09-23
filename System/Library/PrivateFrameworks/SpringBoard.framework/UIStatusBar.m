@implementation UIStatusBar

void __85__UIStatusBar_Base_Snapshots__sb_setSnapshotOverridesWithTimeEnabled_overriddenDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter;
  sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter = (uint64_t)v0;

  v2 = (void *)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter, "setDateStyle:", 0);
  objc_msgSend((id)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter, "setTimeStyle:", 1);
  v4 = (void *)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("America/Los_Angeles"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

@end
