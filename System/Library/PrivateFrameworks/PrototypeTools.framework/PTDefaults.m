@implementation PTDefaults

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_7);
  return (id)sharedInstance___instance;
}

void __28__PTDefaults_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BSAbstractDefaultDomain _initWithDomain:]([PTDefaults alloc], "_initWithDomain:", CFSTR("com.apple.PrototypeTools"));
  v1 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;

}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "prototypeSettingsEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("PrototypeSettingsEnabled"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "activePrototypingEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("ActivePrototypingEnabled"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "remotePrototypingEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("RemotePrototypingEnabled"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "volumeUpShowsUI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("VolumeUpShowsUI"), MEMORY[0x1E0C9AAB0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "volumeDownShowsUI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v8, CFSTR("VolumeDownShowsUI"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ringerSwitchShowsUI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v9, CFSTR("RingerSwitchShowsUI"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v10, CFSTR("TestRecipeIdentifier"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v11, CFSTR("TestRecipeDescription"), 0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsVolumeUp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v12, CFSTR("TestRecipeEatsVolumeUp"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsVolumeDown");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v13, CFSTR("TestRecipeEatsVolumeDown"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsRingerSwitch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v14, CFSTR("TestRecipeEatsRingerSwitch"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldClearSettingsArchivesForMigration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v15, CFSTR("ClearSettingsArchivesForMigration"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldClearPrototypeCachesForMigration");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v16, CFSTR("ClearPrototypeCachesForMigration"), v4, 1);

}

- (BOOL)canEditShowsUIForEvent:(int64_t)a3
{
  return !-[PTDefaults activeTestRecipeEatsEvent:](self, "activeTestRecipeEatsEvent:", a3);
}

- (BOOL)displayedShowsUIValueForEvent:(int64_t)a3
{
  _BOOL4 v5;

  v5 = -[PTDefaults _eventShowsUI:](self, "_eventShowsUI:");
  if (v5)
    LOBYTE(v5) = !-[PTDefaults activeTestRecipeEatsEvent:](self, "activeTestRecipeEatsEvent:", a3);
  return v5;
}

- (void)setShowsUI:(BOOL)a3 forEvent:(int64_t)a4
{
  switch(a4)
  {
    case 3:
      -[PTDefaults setRingerSwitchShowsUI:](self, "setRingerSwitchShowsUI:", a3);
      break;
    case 2:
      -[PTDefaults setVolumeDownShowsUI:](self, "setVolumeDownShowsUI:", a3);
      break;
    case 1:
      -[PTDefaults setVolumeUpShowsUI:](self, "setVolumeUpShowsUI:", a3);
      break;
  }
}

- (id)observeShowUISwitchDefaultsOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PTDefaults _eventDefaults](self, "_eventDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain observeDefaults:onQueue:withBlock:](self, "observeDefaults:onQueue:withBlock:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)testRecipeIsActive
{
  void *v3;
  BOOL v4;

  if (!-[PTDefaults activePrototypingEnabled](self, "activePrototypingEnabled"))
    return 0;
  -[PTDefaults testRecipeIdentifier](self, "testRecipeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)activeTestRecipeIdentifier
{
  void *v3;

  if (-[PTDefaults testRecipeIsActive](self, "testRecipeIsActive"))
  {
    -[PTDefaults testRecipeIdentifier](self, "testRecipeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)activeTestRecipeDescription
{
  void *v3;

  if (-[PTDefaults testRecipeIsActive](self, "testRecipeIsActive"))
  {
    -[PTDefaults testRecipeDescription](self, "testRecipeDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)activeTestRecipeEatsEvent:(int64_t)a3
{
  if (!-[PTDefaults testRecipeIsActive](self, "testRecipeIsActive"))
    return 0;
  if (a3 == 3)
    return -[PTDefaults testRecipeEatsRingerSwitch](self, "testRecipeEatsRingerSwitch");
  if (a3 != 2)
  {
    if (a3 == 1)
      return -[PTDefaults testRecipeEatsVolumeUp](self, "testRecipeEatsVolumeUp");
    return 0;
  }
  return -[PTDefaults testRecipeEatsVolumeDown](self, "testRecipeEatsVolumeDown");
}

- (id)activeTestRecipeEventDescription
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PTDefaults_activeTestRecipeEventDescription__block_invoke;
  v7[3] = &unk_1E7058488;
  v7[4] = self;
  v8 = v3;
  v4 = v3;
  PTPrototypingEnumerateHardwareEventsWithBlock(v7);
  PTPrototypingEventsDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __46__PTDefaults_activeTestRecipeEventDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "activeTestRecipeEatsEvent:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  return result;
}

- (void)deactivateTestRecipe
{
  -[PTDefaults setTestRecipeIdentifier:](self, "setTestRecipeIdentifier:", 0);
  -[PTDefaults setTestRecipeDescription:](self, "setTestRecipeDescription:", 0);
  -[PTDefaults setTestRecipeEatsVolumeUp:](self, "setTestRecipeEatsVolumeUp:", 0);
  -[PTDefaults setTestRecipeEatsVolumeDown:](self, "setTestRecipeEatsVolumeDown:", 0);
  -[PTDefaults setTestRecipeEatsRingerSwitch:](self, "setTestRecipeEatsRingerSwitch:", 0);
}

- (id)observeTestRecipeDefaultsOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PTDefaults _testRecipeDefaults](self, "_testRecipeDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain observeDefaults:onQueue:withBlock:](self, "observeDefaults:onQueue:withBlock:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)prototypingServerWantsEvent:(int64_t)a3
{
  return -[PTDefaults _eventShowsUI:](self, "_eventShowsUI:")
      || -[PTDefaults activeTestRecipeEatsEvent:](self, "activeTestRecipeEatsEvent:", a3);
}

- (id)observeEventDefaultsOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[PTDefaults _eventDefaults](self, "_eventDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain observeDefaults:onQueue:withBlock:](self, "observeDefaults:onQueue:withBlock:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_eventShowsUI:(int64_t)a3
{
  if (!-[PTDefaults activePrototypingEnabled](self, "activePrototypingEnabled"))
    return 0;
  if (a3 == 3)
    return -[PTDefaults ringerSwitchShowsUI](self, "ringerSwitchShowsUI");
  if (a3 != 2)
  {
    if (a3 == 1)
      return -[PTDefaults volumeUpShowsUI](self, "volumeUpShowsUI");
    return 0;
  }
  return -[PTDefaults volumeDownShowsUI](self, "volumeDownShowsUI");
}

- (id)_eventDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[10];

  v13[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "activePrototypingEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "remotePrototypingEnabled", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "volumeUpShowsUI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "volumeDownShowsUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ringerSwitchShowsUI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsVolumeUp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsVolumeDown");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsRingerSwitch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_testRecipeDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "activePrototypingEnabled");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "remotePrototypingEnabled", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsVolumeUp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsVolumeDown");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testRecipeEatsRingerSwitch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
