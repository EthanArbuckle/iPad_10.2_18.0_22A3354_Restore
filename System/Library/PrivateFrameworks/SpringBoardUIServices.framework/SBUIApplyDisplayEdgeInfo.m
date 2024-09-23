@implementation SBUIApplyDisplayEdgeInfo

void ___SBUIApplyDisplayEdgeInfo_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v0 = getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr;
  v14 = getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr;
  if (!getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr)
  {
    v1 = (void *)SpringBoardHomeLibrary();
    v0 = dlsym(v1, "SBHScreenTypeForCurrentDevice");
    v12[3] = (uint64_t)v0;
    getSBHScreenTypeForCurrentDeviceSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v11, 8);
  if (!v0)
    ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_1();
  v3 = ((uint64_t (*)(uint64_t))v0)(v2);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v4 = getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr;
  v14 = getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr;
  if (!getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr)
  {
    v5 = (void *)SpringBoardHomeLibrary();
    v4 = dlsym(v5, "SBHDisplayCornerRadiusForScreenType");
    v12[3] = (uint64_t)v4;
    getSBHDisplayCornerRadiusForScreenTypeSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v11, 8);
  if (!v4)
    ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_2();
  v6 = ((double (*)(uint64_t))v4)(v3);
  objc_msgSend(MEMORY[0x1E0DC5B80], "sbh_displayEdgeInfoForScreenType:", v3, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_SBUIApplyDisplayEdgeInfo_displayEdgeInfo;
  _SBUIApplyDisplayEdgeInfo_displayEdgeInfo = v7;

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01730]), "initWithCornerRadius:", v6);
  v10 = (void *)_SBUIApplyDisplayEdgeInfo_cornerRadiusConfiguration;
  _SBUIApplyDisplayEdgeInfo_cornerRadiusConfiguration = v9;

}

void ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SBHScreenType getSBHScreenTypeForCurrentDevice(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUIContinuityHostProxySceneExtension.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

void ___SBUIApplyDisplayEdgeInfo_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGFloat getSBHDisplayCornerRadiusForScreenType(SBHScreenType)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SBUIContinuityHostProxySceneExtension.m"), 31, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
