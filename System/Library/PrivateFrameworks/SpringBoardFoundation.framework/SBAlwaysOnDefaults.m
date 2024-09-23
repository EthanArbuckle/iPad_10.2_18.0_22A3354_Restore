@implementation SBAlwaysOnDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableAlwaysOn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBEnableAlwaysOn"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableTapToInteract");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBAlwaysOnTapToInteract"), MEMORY[0x1E0C9AAA0], 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableSwipeToUnlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBAlwaysOnSwipeToUnlock"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forceAndromedaSupport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBForceAndromedaSupport"), v6, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "useAlwaysOnBrightnessCurve");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBUseAlwaysOnBrightnessCurve"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "useDebugColors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("SBAndromedaDebugColors"), v6, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enforceOverallAPLLimit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("SBEnforceOverallAPLLimit"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "maximumRenderInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("SBAndromedaMaximumFlipbookDuration"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showWallpaperInAlwaysOn");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("SBShowWallpaperInAlwaysOn"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "showNotificationsInAlwaysOn");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("SBShowNotificationsInAlwaysOn"), v4, 1);

}

@end
