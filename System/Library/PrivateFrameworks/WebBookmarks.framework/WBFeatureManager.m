@implementation WBFeatureManager

+ (WBFeatureManager)sharedFeatureManager
{
  if (sharedFeatureManager_onceToken != -1)
    dispatch_once(&sharedFeatureManager_onceToken, &__block_literal_global_20);
  return (WBFeatureManager *)(id)sharedFeatureManager_sharedFeatureManager;
}

void __40__WBFeatureManager_sharedFeatureManager__block_invoke()
{
  WBFeatureManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBFeatureManager);
  v1 = (void *)sharedFeatureManager_sharedFeatureManager;
  sharedFeatureManager_sharedFeatureManager = (uint64_t)v0;

}

- (WBFeatureManager)init
{
  WBFeatureManager *v2;
  uint64_t v3;
  CFIndex AppIntegerValue;
  WBFeatureManager *v5;
  Boolean keyExistsAndHasValidFormat;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBFeatureManager;
  v2 = -[WBFeatureManager init](&v8, sel_init);
  if (v2)
  {
    if (processAccessLevel_onceToken != -1)
      dispatch_once(&processAccessLevel_onceToken, &__block_literal_global_23_0);
    if ((processAccessLevel_accessLevel & 1) != 0)
    {
      v3 = 2;
    }
    else if (objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent"))
    {
      keyExistsAndHasValidFormat = 0;
      AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("SafariDebugOverrideLaunchMode"), (CFStringRef)*MEMORY[0x24BDBD568], &keyExistsAndHasValidFormat);
      if (keyExistsAndHasValidFormat)
        v3 = AppIntegerValue;
      else
        v3 = 0;
    }
    else
    {
      v3 = 0;
    }
    v2->_accessLevel = v3;
    -[WBFeatureManager _updateToAccessLevel:](v2, "_updateToAccessLevel:");
    v5 = v2;
  }

  return v2;
}

- (void)_updateToAccessLevel:(int64_t)a3
{
  *(_WORD *)&self->_offlineReadingListAvailable = 1;
  if (a3 == 1)
  {
    self->_offlineReadingListAvailable = 0;
  }
  else if (a3 == 2)
  {
    self->_favoritesFolderSelectionShouldSync = 1;
  }
}

- (int64_t)accessLevel
{
  return self->_accessLevel;
}

- (BOOL)isOfflineReadingListAvailable
{
  return self->_offlineReadingListAvailable;
}

- (BOOL)favoritesFolderSelectionShouldSync
{
  return self->_favoritesFolderSelectionShouldSync;
}

@end
