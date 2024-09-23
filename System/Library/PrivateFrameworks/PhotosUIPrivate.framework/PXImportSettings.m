@implementation PXImportSettings

void __48__PXImportSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PUImportSettingsHistoryDebugViewController *v3;

  v2 = a2;
  v3 = objc_alloc_init(PUImportSettingsHistoryDebugViewController);
  objc_msgSend(v2, "pushViewController:animated:", v3, 1);

}

@end
