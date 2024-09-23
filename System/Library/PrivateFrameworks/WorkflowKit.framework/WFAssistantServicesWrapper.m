@implementation WFAssistantServicesWrapper

+ (BOOL)deviceSupportsSystemAssistantExperience
{
  uint64_t (*v2)(void);
  BOOL result;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (uint64_t (*)(void))getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  v10 = getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr;
  if (!getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke;
    v6[3] = &unk_1E7AF9520;
    v6[4] = &v7;
    __getAFDeviceSupportsSystemAssistantExperienceSymbolLoc_block_invoke(v6);
    v2 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return v2();
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL soft_AFDeviceSupportsSystemAssistantExperience(void)");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAssistantServicesWrapper.m"), 14, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

@end
