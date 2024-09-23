@implementation SBCameraHardwareButtonDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shutterButtonLongPressTimeout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBCameraShutterButtonLongPressTimeout"), &unk_1E203B9C8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shutterButtonLongPressCancellationTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("SBCameraShutterButtonLongPressCancellationTimeout"), &unk_1E203B9D8, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shutterButtonShouldUsePocketDetection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBCameraShutterButtonShouldUsePocketDetection"), MEMORY[0x1E0C9AAA0], 1);

}

@end
