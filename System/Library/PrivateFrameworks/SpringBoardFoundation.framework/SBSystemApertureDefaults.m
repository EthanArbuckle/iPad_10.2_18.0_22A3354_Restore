@implementation SBSystemApertureDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressDynamicIslandCompletely");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBSuppressDynamicIslandCompletely"), MEMORY[0x1E0C9AAA0], 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysShowSystemApertureOnClonedDisplays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBAlwaysShowSystemApertureOnClonedDisplays"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysShowSystemApertureInSnapshots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBAlwaysShowSystemApertureInSnapshots"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysRenderSystemApertureFillOnGPU");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBAlwaysRenderSystemApertureFillOnGPU"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "neverRenderSystemApertureFillOnGPU");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBNeverRenderSystemApertureFillOnGPU"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableSystemApertureStateCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBEnableSystemApertureStateCollection"), MEMORY[0x1E0C9AAB0], 4);

  -[SBSystemApertureDefaults _addStateCaptureHandlers](self, "_addStateCaptureHandlers");
}

- (void)_addStateCaptureHandlers
{
  id v2;
  id v3;
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C80D38];
  objc_copyWeak(&v4, &location);
  v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

__CFString *__52__SBSystemApertureDefaults__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E2010FC0;
  }

  return v3;
}

@end
