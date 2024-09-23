@implementation SBSoundDefaults

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ringerMuted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBRingerMuted"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "calendarAlarmPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("calendar-alarm"), CFSTR("/Applications/MobileCal.app/alarm.aiff"), 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vibrateWhenSilent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C9AAB0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("silent-vibrate"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "vibrateWhenRinging");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("ring-vibrate"), v7, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "playSoundOnDeviceWake");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("SBPlaySoundOnDeviceWake"), v4, 1);

}

@end
