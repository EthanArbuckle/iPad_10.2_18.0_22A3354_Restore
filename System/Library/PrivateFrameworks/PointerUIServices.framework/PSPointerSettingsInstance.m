@implementation PSPointerSettingsInstance

void ___PSPointerSettingsInstance_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PSPointerSettingsDomain rootSettings](PSPointerSettingsDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PSPointerSettingsInstance___psPointerSettings;
  _PSPointerSettingsInstance___psPointerSettings = v0;

}

@end
