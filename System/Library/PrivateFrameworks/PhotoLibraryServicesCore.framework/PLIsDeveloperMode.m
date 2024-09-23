@implementation PLIsDeveloperMode

void __PLIsDeveloperMode_block_invoke()
{
  uint64_t (*v0)(void);
  void *v1;
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (uint64_t (*)(void))getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  v7 = getAMFIIsDeveloperModeEnabledSymbolLoc_ptr;
  if (!getAMFIIsDeveloperModeEnabledSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAMFIIsDeveloperModeEnabledSymbolLoc_block_invoke;
    v3[3] = &unk_1E376CAD8;
    v3[4] = &v4;
    __getAMFIIsDeveloperModeEnabledSymbolLoc_block_invoke(v3);
    v0 = (uint64_t (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    PLIsDeveloperMode_isDeveloperMode = v0();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL PLAMFIIsDeveloperModeEnabled(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PLHelper.m"), 45, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

@end
