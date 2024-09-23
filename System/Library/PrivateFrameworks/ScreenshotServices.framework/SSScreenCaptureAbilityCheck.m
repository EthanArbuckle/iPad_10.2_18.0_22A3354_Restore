@implementation SSScreenCaptureAbilityCheck

+ (id)abilityCheck
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  char v6;
  int (*v7)(void);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unsigned int (*v12)(void);
  _Unwind_Exception *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setIsAbleToTakeScreenshots:", 1);
  objc_msgSend(v2, "setReasonForNotBeingAbleToTakeScreenshots:", 0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getMCProfileConnectionClass_softClass;
  v23 = (void *)getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getMCProfileConnectionClass_block_invoke;
    v18 = &unk_24D06B990;
    v19 = &v20;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v15);
    v3 = (void *)v21[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v4, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScreenShotAllowed");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v2, "setIsAbleToTakeScreenshots:", 0);
    objc_msgSend(v2, "setReasonForNotBeingAbleToTakeScreenshots:", CFSTR("Disallowed from ManagedConfiguration"));
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v7 = (int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v23 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v18 = &unk_24D06B990;
    v19 = &v20;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)&v15);
    v7 = (int (*)(void))v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v7)
  {
    -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.2();
    goto LABEL_23;
  }
  if (v7() <= 0)
  {
    objc_msgSend(v2, "setIsAbleToTakeScreenshots:", 0);
    objc_msgSend(v2, "setReasonForNotBeingAbleToTakeScreenshots:", CFSTR("Device has not done first unlock"));
  }
  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isSharedIPad"))
  {
    objc_msgSend(getUMUserManagerClass(), "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isLoginUser");

    if (v11)
    {
      objc_msgSend(v2, "setIsAbleToTakeScreenshots:", 0);
      objc_msgSend(v2, "setReasonForNotBeingAbleToTakeScreenshots:", CFSTR("Device is at the login window"));
    }
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v12 = (unsigned int (*)(void))getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  v23 = getBYSetupAssistantNeedsToRunSymbolLoc_ptr;
  if (!getBYSetupAssistantNeedsToRunSymbolLoc_ptr)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke;
    v18 = &unk_24D06B990;
    v19 = &v20;
    __getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke((uint64_t)&v15);
    v12 = (unsigned int (*)(void))v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v12)
  {
LABEL_23:
    v14 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.2();
    _Block_object_dispose(&v20, 8);
    _Unwind_Resume(v14);
  }
  if (v12())
  {
    objc_msgSend(v2, "setIsAbleToTakeScreenshots:", 0);
    objc_msgSend(v2, "setReasonForNotBeingAbleToTakeScreenshots:", CFSTR("Device has not gone through Buddy"));
  }
  if (MGGetBoolAnswer() && _SSShouldIgnoreAbilityCheck())
  {
    objc_msgSend(v2, "setIsAbleToTakeScreenshots:", 1);
    objc_msgSend(v2, "setReasonForNotBeingAbleToTakeScreenshots:", 0);
  }

  return v2;
}

- (BOOL)isAbleToTakeScreenshots
{
  return self->_isAbleToTakeScreenshots;
}

- (void)setIsAbleToTakeScreenshots:(BOOL)a3
{
  self->_isAbleToTakeScreenshots = a3;
}

- (NSString)reasonForNotBeingAbleToTakeScreenshots
{
  return self->_reasonForNotBeingAbleToTakeScreenshots;
}

- (void)setReasonForNotBeingAbleToTakeScreenshots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonForNotBeingAbleToTakeScreenshots, 0);
}

@end
