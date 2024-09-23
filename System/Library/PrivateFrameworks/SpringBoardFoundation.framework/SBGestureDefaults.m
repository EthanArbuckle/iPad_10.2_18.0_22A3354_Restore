@implementation SBGestureDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "multitaskingGesturesRequireEducation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBGestureRequiresEducation-Multitasking"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGesturesAllowed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBUseSystemGestures"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "productivityGesturesRequireEducation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("SBGestureRequiresEducation-Productivity"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "productivityGesturesAllowed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("SBProductivityGesturesAllowed"), v6, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "systemGestureLoggingOptions");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBSystemGestureLogging"), 0, 1);

}

@end
