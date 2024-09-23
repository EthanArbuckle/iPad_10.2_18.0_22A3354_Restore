@implementation VUIDevice

+ (BOOL)isPhone
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 0;
}

+ (BOOL)isPad
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 1;
}

+ (BOOL)isTV
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 2;
}

+ (BOOL)isMac
{
  return objc_msgSend(a1, "userInterfaceIdiom") == 5;
}

+ (int64_t)userInterfaceIdiom
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3;
}

+ (BOOL)isVision
{
  return 0;
}

+ (NSString)systemVersion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)model
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

void __17__VUIDevice_guid__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[VUIMobileGestaltLookup stringValueForKey:](VUIMobileGestaltLookup, "stringValueForKey:", CFSTR("UniqueDeviceID"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)guid_vuiGuid;
  guid_vuiGuid = v0;

}

+ (NSString)guid
{
  if (guid_sOnceToken != -1)
    dispatch_once(&guid_sOnceToken, &__block_literal_global_6);
  return (NSString *)(id)guid_vuiGuid;
}

+ (NSString)name
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)systemName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)supportsDeepColor
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_supportsDeepColor");

  return v3;
}

+ (BOOL)supportsStageManager
{
  if (supportsStageManager_onceToken != -1)
    dispatch_once(&supportsStageManager_onceToken, &__block_literal_global_15);
  return supportsStageManager_supportsStageManager;
}

uint64_t __33__VUIDevice_supportsStageManager__block_invoke()
{
  uint64_t result;

  if ((MGGetBoolAnswer() & 1) != 0)
    result = 1;
  else
    result = MGGetBoolAnswer();
  supportsStageManager_supportsStageManager = result;
  return result;
}

+ (void)enablePortraitLock:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _orientationBeforePortraitLock = objc_msgSend(v3, "orientation");

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOrientation:", 1);

  }
  else if (_orientationBeforePortraitLock)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOrientation:", _orientationBeforePortraitLock);

    _orientationBeforePortraitLock = 0;
  }
}

@end
