@implementation BYDevice

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_5);
  return (id)currentDevice_sharedDevice;
}

void __25__BYDevice_currentDevice__block_invoke()
{
  BYDevice *v0;
  void *v1;

  v0 = objc_alloc_init(BYDevice);
  v1 = (void *)currentDevice_sharedDevice;
  currentDevice_sharedDevice = (uint64_t)v0;

}

- (BYDevice)init
{
  BYDevice *v2;
  const __CFString *v3;
  __CFString *v4;
  int v5;
  BOOL v6;
  uint64_t v7;
  uint64_t (*v8)(void);
  char v9;
  uint64_t v10;
  NSString *productType;
  int64_t type;
  char v13;
  uint64_t v14;
  NSString *serialNumber;
  objc_super v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  void *(*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)BYDevice;
  v2 = -[BYDevice init](&v17, sel_init);
  if (v2)
  {
    v3 = (const __CFString *)MGGetStringAnswer();
    v4 = (__CFString *)v3;
    if (v3)
    {
      v2->_type = CFStringCompare(v3, CFSTR("iPad"), 0) == kCFCompareEqualTo;
      objc_storeStrong((id *)&v2->_deviceClass, v4);
      CFRelease(v4);
    }
    v5 = MGGetSInt32Answer();
    if (-[BYDevice type](v2, "type"))
    {
      v6 = v5 == 11 || v5 == 14;
      v7 = 4;
      if (!v6)
        v7 = 0;
      goto LABEL_10;
    }
    v7 = 0;
    if (v5 <= 17)
    {
      if (v5 == 5)
      {
        v7 = 2;
        goto LABEL_10;
      }
      if (v5 == 9)
      {
        v7 = 1;
        goto LABEL_10;
      }
      if (v5 != 15)
      {
LABEL_10:
        v2->_size = v7;
        v2->_mainScreenClass = v5;
        v2->_hasHomeButton = MGGetSInt32Answer() != 2;
        if (!SpringBoardServicesLibraryCore_frameworkLibrary)
        {
          v22 = xmmword_1E4E26D20;
          v23 = 0;
          SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
        }
        if (SpringBoardServicesLibraryCore_frameworkLibrary)
        {
          v18 = 0;
          v19 = &v18;
          v20 = 0x2020000000;
          v8 = (uint64_t (*)(void))getSBSIsSystemApertureAvailableSymbolLoc_ptr;
          v21 = getSBSIsSystemApertureAvailableSymbolLoc_ptr;
          if (!getSBSIsSystemApertureAvailableSymbolLoc_ptr)
          {
            *(_QWORD *)&v22 = MEMORY[0x1E0C809B0];
            *((_QWORD *)&v22 + 1) = 3221225472;
            v23 = __getSBSIsSystemApertureAvailableSymbolLoc_block_invoke;
            v24 = &unk_1E4E26900;
            v25 = &v18;
            __getSBSIsSystemApertureAvailableSymbolLoc_block_invoke((uint64_t)&v22);
            v8 = (uint64_t (*)(void))v19[3];
          }
          _Block_object_dispose(&v18, 8);
          if (!v8)
          {
            +[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
            __break(1u);
          }
          v9 = v8();
        }
        else
        {
          v9 = 0;
        }
        v2->_hasDynamicIsland = v9;
        v10 = MGCopyAnswer();
        productType = v2->_productType;
        v2->_productType = (NSString *)v10;

        type = v2->_type;
        if (type == 1)
        {
          v13 = 0;
        }
        else
        {
          if (type)
          {
LABEL_28:
            v2->_hasCameraButton = MGGetBoolAnswer();
            v2->_isPowerButtonOppositeVolumeButtons = MGGetBoolAnswer();
            v14 = MGCopyAnswer();
            serialNumber = v2->_serialNumber;
            v2->_serialNumber = (NSString *)v14;

            return v2;
          }
          v13 = MGGetBoolAnswer();
        }
        v2->_hasActionButton = v13;
        goto LABEL_28;
      }
    }
    else
    {
      if (v5 <= 29)
      {
        if (v5 != 18)
        {
          if (v5 == 19)
            v7 = 5;
          goto LABEL_10;
        }
LABEL_36:
        v7 = 6;
        goto LABEL_10;
      }
      if (v5 != 30)
      {
        if (v5 != 31)
          goto LABEL_10;
        goto LABEL_36;
      }
    }
    v7 = 3;
    goto LABEL_10;
  }
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)size
{
  return self->_size;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (BOOL)hasActionButton
{
  return self->_hasActionButton;
}

- (BOOL)hasCameraButton
{
  return self->_hasCameraButton;
}

- (BOOL)isPowerButtonOppositeVolumeButtons
{
  return self->_isPowerButtonOppositeVolumeButtons;
}

- (BOOL)hasDynamicIsland
{
  return self->_hasDynamicIsland;
}

- (int)mainScreenClass
{
  return self->_mainScreenClass;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end
