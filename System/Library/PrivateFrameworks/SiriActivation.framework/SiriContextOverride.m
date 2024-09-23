@implementation SiriContextOverride

- (void)overrideHasUnlockedSinceBoot:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setUnlockedSinceBoot:](self, "setUnlockedSinceBoot:", v4);

}

- (void)overrideDeviceIsBlocked:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setDeviceIsBlocked:](self, "setDeviceIsBlocked:", v4);

}

- (void)overrideDeviceIsPasscodeLocked:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setDeviceIsPasscodeLocked:](self, "setDeviceIsPasscodeLocked:", v4);

}

- (void)overridePocketStateShouldPreventVoiceTrigger:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setPocketStateShouldPreventVoiceTrigger:](self, "setPocketStateShouldPreventVoiceTrigger:", v4);

}

- (void)overrideIsPad:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setPad:](self, "setPad:", v4);

}

- (void)overrideSmartCoverClosed:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSmartCoverClosed:](self, "setSmartCoverClosed:", v4);

}

- (void)overrideAccessibilityShortcutEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setAccessibilityShortcutEnabled:](self, "setAccessibilityShortcutEnabled:", v4);

}

- (void)overrideCarDNDActive:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setCarDNDActive:](self, "setCarDNDActive:", v4);

}

- (void)overrideConnectedToTrustedCarPlay:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setConnectedToTrustedCarPlay:](self, "setConnectedToTrustedCarPlay:", v4);

}

- (void)overrideConnectedToCarPlay:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setConnectedToCarPlay:](self, "setConnectedToCarPlay:", v4);

}

- (void)overrideSiriIsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSiriIsEnabled:](self, "setSiriIsEnabled:", v4);

}

- (void)overrideSiriIsRestricted:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSiriIsRestricted:](self, "setSiriIsRestricted:", v4);

}

- (void)overrideSiriIsSupported:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSiriIsSupported:](self, "setSiriIsSupported:", v4);

}

- (id)currentSpokenLanguageCodeForSystemState:(id)a3
{
  SiriContextOverride *v4;
  void *v5;
  SiriContextOverride *v6;
  void *v7;

  v4 = (SiriContextOverride *)a3;
  -[SiriContextOverride currentSpokenLanguageCode](self, "currentSpokenLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = self;
  else
    v6 = v4;
  -[SiriContextOverride currentSpokenLanguageCode](v6, "currentSpokenLanguageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasUnlockedSinceBootForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride unlockedSinceBoot](self, "unlockedSinceBoot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride unlockedSinceBoot](self, "unlockedSinceBoot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "hasUnlockedSinceBoot");
  }

  return v7;
}

- (BOOL)deviceIsBlockedForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride deviceIsBlocked](self, "deviceIsBlocked");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride deviceIsBlocked](self, "deviceIsBlocked");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "deviceIsBlocked");
  }

  return v7;
}

- (BOOL)deviceIsPasscodeLockedForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride deviceIsPasscodeLocked](self, "deviceIsPasscodeLocked");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride deviceIsPasscodeLocked](self, "deviceIsPasscodeLocked");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "deviceIsPasscodeLocked");
  }

  return v7;
}

- (BOOL)pocketStateShouldPreventVoiceTriggerForSystemState:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  -[SiriContextOverride pocketStateShouldPreventVoiceTrigger](self, "pocketStateShouldPreventVoiceTrigger", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SiriContextOverride pocketStateShouldPreventVoiceTrigger](self, "pocketStateShouldPreventVoiceTrigger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    +[SASSiriPocketStateManager sharedManager](SASSiriPocketStateManager, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "pocketStateShouldPreventVoiceTrigger");
  }
  v7 = v6;

  return v7;
}

- (BOOL)isPadForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride pad](self, "pad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride pad](self, "pad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "isPad");
  }

  return v7;
}

- (BOOL)smartCoverClosedForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride smartCoverClosed](self, "smartCoverClosed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride smartCoverClosed](self, "smartCoverClosed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "smartCoverClosed");
  }

  return v7;
}

- (BOOL)accessibilityShortcutEnabledForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride accessibilityShortcutEnabled](self, "accessibilityShortcutEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride accessibilityShortcutEnabled](self, "accessibilityShortcutEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "accessibilityShortcutEnabled");
  }

  return v7;
}

- (BOOL)carDNDActiveForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride carDNDActive](self, "carDNDActive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride carDNDActive](self, "carDNDActive");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "carDNDActive");
  }

  return v7;
}

- (BOOL)isConnectedToCarPlayForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride connectedToCarPlay](self, "connectedToCarPlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride connectedToCarPlay](self, "connectedToCarPlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "isConnectedToCarPlay");
  }

  return v7;
}

- (BOOL)isConnectedToTrustedCarPlayForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride connectedToTrustedCarPlay](self, "connectedToTrustedCarPlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride connectedToTrustedCarPlay](self, "connectedToTrustedCarPlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "isConnectedToTrustedCarPlay");
  }

  return v7;
}

- (BOOL)siriIsEnabledForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride siriIsEnabled](self, "siriIsEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride siriIsEnabled](self, "siriIsEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "siriIsEnabled");
  }

  return v7;
}

- (BOOL)siriIsRestrictedForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride siriIsRestricted](self, "siriIsRestricted");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride siriIsRestricted](self, "siriIsRestricted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "siriIsRestricted");
  }

  return v7;
}

- (BOOL)siriIsSupportedForSystemState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SiriContextOverride siriIsSupported](self, "siriIsSupported");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SiriContextOverride siriIsSupported](self, "siriIsSupported");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = objc_msgSend(v4, "siriIsSupported");
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriContextOverride)initWithCoder:(id)a3
{
  id v4;
  SiriContextOverride *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SiriContextOverride;
  v5 = -[SiriContextOverride init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentSpokenLanguageCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setCurrentSpokenLanguageCode:](v5, "setCurrentSpokenLanguageCode:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unlockedSinceBoot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setUnlockedSinceBoot:](v5, "setUnlockedSinceBoot:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIsBlocked"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setDeviceIsBlocked:](v5, "setDeviceIsBlocked:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIsPasscodeLocked"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setDeviceIsPasscodeLocked:](v5, "setDeviceIsPasscodeLocked:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pocketStateShouldPreventVoiceTrigger"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setPocketStateShouldPreventVoiceTrigger:](v5, "setPocketStateShouldPreventVoiceTrigger:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pad"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setPad:](v5, "setPad:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smartCoverClosed"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setSmartCoverClosed:](v5, "setSmartCoverClosed:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityShortcutEnabled"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setAccessibilityShortcutEnabled:](v5, "setAccessibilityShortcutEnabled:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("carDNDActive"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setCarDNDActive:](v5, "setCarDNDActive:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedToCarPlay"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setConnectedToCarPlay:](v5, "setConnectedToCarPlay:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedToTrustedCarPlay"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setConnectedToTrustedCarPlay:](v5, "setConnectedToTrustedCarPlay:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriIsEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setSiriIsEnabled:](v5, "setSiriIsEnabled:", v17);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriIsRestricted"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setSiriIsRestricted:](v5, "setSiriIsRestricted:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriIsSupported"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriContextOverride setSiriIsSupported:](v5, "setSiriIsSupported:", v19);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  -[SiriContextOverride currentSpokenLanguageCode](self, "currentSpokenLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("currentSpokenLanguageCode"));

  -[SiriContextOverride unlockedSinceBoot](self, "unlockedSinceBoot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("unlockedSinceBoot"));

  -[SiriContextOverride deviceIsBlocked](self, "deviceIsBlocked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("deviceIsBlocked"));

  -[SiriContextOverride deviceIsPasscodeLocked](self, "deviceIsPasscodeLocked");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("deviceIsPasscodeLocked"));

  -[SiriContextOverride pocketStateShouldPreventVoiceTrigger](self, "pocketStateShouldPreventVoiceTrigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("pocketStateShouldPreventVoiceTrigger"));

  -[SiriContextOverride pad](self, "pad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("pad"));

  -[SiriContextOverride smartCoverClosed](self, "smartCoverClosed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("smartCoverClosed"));

  -[SiriContextOverride accessibilityShortcutEnabled](self, "accessibilityShortcutEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("accessibilityShortcutEnabled"));

  -[SiriContextOverride carDNDActive](self, "carDNDActive");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("carDNDActive"));

  -[SiriContextOverride connectedToCarPlay](self, "connectedToCarPlay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("connectedToCarPlay"));

  -[SiriContextOverride connectedToTrustedCarPlay](self, "connectedToTrustedCarPlay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("connectedToTrustedCarPlay"));

  -[SiriContextOverride siriIsEnabled](self, "siriIsEnabled");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("siriIsEnabled"));

  -[SiriContextOverride siriIsRestricted](self, "siriIsRestricted");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("siriIsRestricted"));

  -[SiriContextOverride siriIsSupported](self, "siriIsSupported");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("siriIsSupported"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SiriContextOverride *v4;
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
  void *v16;
  void *v17;
  void *v18;

  v4 = objc_alloc_init(SiriContextOverride);
  -[SiriContextOverride currentSpokenLanguageCode](self, "currentSpokenLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setCurrentSpokenLanguageCode:](v4, "setCurrentSpokenLanguageCode:", v5);

  -[SiriContextOverride unlockedSinceBoot](self, "unlockedSinceBoot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setUnlockedSinceBoot:](v4, "setUnlockedSinceBoot:", v6);

  -[SiriContextOverride deviceIsBlocked](self, "deviceIsBlocked");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setDeviceIsBlocked:](v4, "setDeviceIsBlocked:", v7);

  -[SiriContextOverride deviceIsPasscodeLocked](self, "deviceIsPasscodeLocked");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setDeviceIsPasscodeLocked:](v4, "setDeviceIsPasscodeLocked:", v8);

  -[SiriContextOverride pocketStateShouldPreventVoiceTrigger](self, "pocketStateShouldPreventVoiceTrigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setPocketStateShouldPreventVoiceTrigger:](v4, "setPocketStateShouldPreventVoiceTrigger:", v9);

  -[SiriContextOverride pad](self, "pad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setPad:](v4, "setPad:", v10);

  -[SiriContextOverride smartCoverClosed](self, "smartCoverClosed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSmartCoverClosed:](v4, "setSmartCoverClosed:", v11);

  -[SiriContextOverride accessibilityShortcutEnabled](self, "accessibilityShortcutEnabled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setAccessibilityShortcutEnabled:](v4, "setAccessibilityShortcutEnabled:", v12);

  -[SiriContextOverride carDNDActive](self, "carDNDActive");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setCarDNDActive:](v4, "setCarDNDActive:", v13);

  -[SiriContextOverride connectedToCarPlay](self, "connectedToCarPlay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setConnectedToCarPlay:](v4, "setConnectedToCarPlay:", v14);

  -[SiriContextOverride connectedToTrustedCarPlay](self, "connectedToTrustedCarPlay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setConnectedToTrustedCarPlay:](v4, "setConnectedToTrustedCarPlay:", v15);

  -[SiriContextOverride siriIsEnabled](self, "siriIsEnabled");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSiriIsEnabled:](v4, "setSiriIsEnabled:", v16);

  -[SiriContextOverride siriIsRestricted](self, "siriIsRestricted");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSiriIsRestricted:](v4, "setSiriIsRestricted:", v17);

  -[SiriContextOverride siriIsSupported](self, "siriIsSupported");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriContextOverride setSiriIsSupported:](v4, "setSiriIsSupported:", v18);

  return v4;
}

- (NSString)currentSpokenLanguageCode
{
  return self->_currentSpokenLanguageCode;
}

- (void)setCurrentSpokenLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpokenLanguageCode, a3);
}

- (NSNumber)unlockedSinceBoot
{
  return self->_unlockedSinceBoot;
}

- (void)setUnlockedSinceBoot:(id)a3
{
  objc_storeStrong((id *)&self->_unlockedSinceBoot, a3);
}

- (NSNumber)deviceIsBlocked
{
  return self->_deviceIsBlocked;
}

- (void)setDeviceIsBlocked:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIsBlocked, a3);
}

- (NSNumber)deviceIsPasscodeLocked
{
  return self->_deviceIsPasscodeLocked;
}

- (void)setDeviceIsPasscodeLocked:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIsPasscodeLocked, a3);
}

- (NSNumber)pocketStateShouldPreventVoiceTrigger
{
  return self->_pocketStateShouldPreventVoiceTrigger;
}

- (void)setPocketStateShouldPreventVoiceTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_pocketStateShouldPreventVoiceTrigger, a3);
}

- (NSNumber)pad
{
  return self->_pad;
}

- (void)setPad:(id)a3
{
  objc_storeStrong((id *)&self->_pad, a3);
}

- (NSNumber)smartCoverClosed
{
  return self->_smartCoverClosed;
}

- (void)setSmartCoverClosed:(id)a3
{
  objc_storeStrong((id *)&self->_smartCoverClosed, a3);
}

- (NSNumber)accessibilityShortcutEnabled
{
  return self->_accessibilityShortcutEnabled;
}

- (void)setAccessibilityShortcutEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityShortcutEnabled, a3);
}

- (NSNumber)carDNDActive
{
  return self->_carDNDActive;
}

- (void)setCarDNDActive:(id)a3
{
  objc_storeStrong((id *)&self->_carDNDActive, a3);
}

- (NSNumber)connectedToCarPlay
{
  return self->_connectedToCarPlay;
}

- (void)setConnectedToCarPlay:(id)a3
{
  objc_storeStrong((id *)&self->_connectedToCarPlay, a3);
}

- (NSNumber)connectedToTrustedCarPlay
{
  return self->_connectedToTrustedCarPlay;
}

- (void)setConnectedToTrustedCarPlay:(id)a3
{
  objc_storeStrong((id *)&self->_connectedToTrustedCarPlay, a3);
}

- (NSNumber)siriIsEnabled
{
  return self->_siriIsEnabled;
}

- (void)setSiriIsEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_siriIsEnabled, a3);
}

- (NSNumber)siriIsRestricted
{
  return self->_siriIsRestricted;
}

- (void)setSiriIsRestricted:(id)a3
{
  objc_storeStrong((id *)&self->_siriIsRestricted, a3);
}

- (NSNumber)siriIsSupported
{
  return self->_siriIsSupported;
}

- (void)setSiriIsSupported:(id)a3
{
  objc_storeStrong((id *)&self->_siriIsSupported, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIsSupported, 0);
  objc_storeStrong((id *)&self->_siriIsRestricted, 0);
  objc_storeStrong((id *)&self->_siriIsEnabled, 0);
  objc_storeStrong((id *)&self->_connectedToTrustedCarPlay, 0);
  objc_storeStrong((id *)&self->_connectedToCarPlay, 0);
  objc_storeStrong((id *)&self->_carDNDActive, 0);
  objc_storeStrong((id *)&self->_accessibilityShortcutEnabled, 0);
  objc_storeStrong((id *)&self->_smartCoverClosed, 0);
  objc_storeStrong((id *)&self->_pad, 0);
  objc_storeStrong((id *)&self->_pocketStateShouldPreventVoiceTrigger, 0);
  objc_storeStrong((id *)&self->_deviceIsPasscodeLocked, 0);
  objc_storeStrong((id *)&self->_deviceIsBlocked, 0);
  objc_storeStrong((id *)&self->_unlockedSinceBoot, 0);
  objc_storeStrong((id *)&self->_currentSpokenLanguageCode, 0);
}

@end
