@implementation SHSSoundsPrefController

- (id)canChangeRingtoneWithButtons:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "canChangeRingtoneWithButtons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSSoundsPrefController;
  -[SHSSoundsPrefController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canChangeRingtoneWithButtons");

  if (-[SHSSoundsPrefController _isVolumeSliderVisible](self, "_isVolumeSliderVisible"))
    -[SHSSoundsPrefController willShowSlider](self, "willShowSlider");
  -[SHSSoundsPrefController updateVolume](self, "updateVolume");
  if (!_os_feature_enabled_impl()
    || PSGetCapabilityBoolAnswer() && (_os_feature_enabled_impl() & 1) == 0)
  {
    -[SHSSoundsPrefController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("HEADPHONE_LEVEL_LIMIT_SETTING"), 1);
  }
}

- (void)willShowSlider
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SHSSoundsPrefController willShowSlider]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSSoundsPrefController setVolumeHUDsuppression:](self, "setVolumeHUDsuppression:", objc_msgSend(v4, "canChangeRingtoneWithButtons"));

}

- (id)specifiers
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  __CFString *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v77;
  void *v78;
  uint64_t v79;
  objc_super v80;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v3)
    return v3;
  v79 = (int)*MEMORY[0x24BE756E0];
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v80.receiver = self;
  v80.super_class = (Class)SHSSoundsPrefController;
  -[SHSSoundsPrefController loadSpecifiersFromPlistName:target:](&v80, sel_loadSpecifiersFromPlistName_target_, CFSTR("Sounds"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sf_inRetailKioskMode");

  v9 = (void *)objc_opt_new();
  if ((v8 & 1) == 0)
  {
    if ((PSGetCapabilityBoolAnswer() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x24BE75590];
      SHS_LocalizedStringForSounds(CFSTR("SILENT_MODE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, 0, 0, 0, 0, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *MEMORY[0x24BE75AC0];
      objc_msgSend(v12, "setProperty:forKey:", CFSTR("SILENT_MODE_GROUP"), *MEMORY[0x24BE75AC0]);
      v14 = (void *)MEMORY[0x24BE75590];
      SHS_LocalizedStringForSounds(CFSTR("SILENT_MODE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, sel_setSilentModeEnabled_specifier_, sel_silentModeEnabled_, 0, 6, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setProperty:forKey:", CFSTR("SILENT_MODE"), v13);
      -[SHSSoundsPrefController silentModeEnabled:](self, "silentModeEnabled:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSSoundsPrefController getSilentModeIconWithSwitch:](self, "getSilentModeIconWithSwitch:", objc_msgSend(v17, "BOOLValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setProperty:forKey:", v18, *MEMORY[0x24BE75AC8]);
      objc_msgSend(v9, "addObject:", v12);
      objc_msgSend(v9, "addObject:", v16);

    }
    if ((PSGetCapabilityBoolAnswer() & 1) == 0 && (PSGetCapabilityBoolAnswer() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BE75590];
      SHS_LocalizedStringForSounds(CFSTR("SHOW_IN_STATUS_BAR"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, sel_setShowInStatusBarEnabled_specifier_, sel_showInStatusBarEnabled_, 0, 6, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
      objc_msgSend(v22, "setProperty:forKey:", CFSTR("com.apple.springboard"), *MEMORY[0x24BE759E8]);
      objc_msgSend(v22, "setProperty:forKey:", CFSTR("SBShowRingerState"), *MEMORY[0x24BE75B50]);
      objc_msgSend(v9, "addObject:", v19);
      objc_msgSend(v9, "addObject:", v22);

    }
  }
  if (objc_msgSend(v9, "count"))
  {
    v23 = objc_msgSend(v9, "count");
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObjects:atIndexes:", v9, v24);

  }
  objc_msgSend(v6, "specifierForID:", CFSTR("Silent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v25);

  objc_msgSend(v6, "specifierForID:", CFSTR("VIBRATE_WITH_RINGTONE"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v26);

  objc_msgSend(v6, "specifierForID:", CFSTR("VIBRATE_WHEN_SILENT"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v27);

  objc_msgSend(v6, "specifierForID:", CFSTR("RING_SILENT_FOOTER_GROUP"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v28);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v6, "specifierForID:", CFSTR("HAPTICS"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "indexOfObject:", v29) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v29, "setButtonAction:", sel_presentHapticsController_);
      objc_msgSend(v29, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    }

  }
  objc_msgSend(v6, "specifierForID:", CFSTR("Voicemail"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSSoundsPrefController set_voiceMailSpecifier:](self, "set_voiceMailSpecifier:", v30);

  -[SHSSoundsPrefController _voiceMailSpecifier](self, "_voiceMailSpecifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSSoundsPrefController set_voiceMailSpecifierIndex:](self, "set_voiceMailSpecifierIndex:", objc_msgSend(v6, "indexOfObject:", v31));

  -[SHSSoundsPrefController _cachedShouldHideValue](self, "_cachedShouldHideValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
    -[SHSSoundsPrefController refreshShouldHideAllVoicemailUI](self, "refreshShouldHideAllVoicemailUI");
  v77 = v8;
  -[SHSSoundsPrefController _cachedShouldHideValue](self, "_cachedShouldHideValue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "BOOLValue");

  if (v34)
  {
    -[SHSSoundsPrefController _voiceMailSpecifier](self, "_voiceMailSpecifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v35);

  }
  v36 = -[SHSSoundsPrefController _deviceType](self, "_deviceType");
  objc_msgSend(v6, "specifierForID:", CFSTR("RING_VOLUME_SLIDER"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 17.0);
  v38 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("speaker.fill"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "imageWithTintColor:renderingMode:", v40, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setProperty:forKey:", v41, *MEMORY[0x24BE75C90]);

  v78 = (void *)v38;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("speaker.wave.3.fill"), v38);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "imageWithTintColor:renderingMode:", v43, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setProperty:forKey:", v44, *MEMORY[0x24BE75CA0]);

  if ((v36 - 1) <= 1)
  {
    objc_msgSend(v6, "specifierForID:", CFSTR("RINGER_AND_ALERT_GROUP"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v77)
    {
      objc_msgSend(v45, "setProperty:forKey:", &stru_24F198178, *MEMORY[0x24BE75A68]);
    }
    else
    {
      -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "canChangeRingtoneWithButtons");

      if (v48)
        v49 = CFSTR("RING_VOL_CAN_BE_ADJUSTED");
      else
        v49 = CFSTR("RING_VOL_CANNOT_BE_ADJUSTED");
      SHS_LocalizedStringForSounds(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setProperty:forKey:", v50, *MEMORY[0x24BE75A68]);

    }
    v51 = objc_msgSend(v6, "indexOfObject:", v46);
    if (v36 == 1 && v46 && (v52 = v51, v51 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(v6, "removeObject:", v37);
      objc_msgSend(v6, "insertObject:atIndex:", v37, v52 + 1);
    }
    else if (v36 != 1)
    {
LABEL_35:

      goto LABEL_36;
    }
    if (_os_feature_enabled_impl()
      && +[SHSDualSIMToneHelper shouldShowSIMBasedToneCustomizationForAlertType:](SHSDualSIMToneHelper, "shouldShowSIMBasedToneCustomizationForAlertType:", 1))
    {
      objc_msgSend(v6, "specifierForID:", CFSTR("Ringtone"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
        objc_msgSend(v53, "setDetailControllerClass:", objc_opt_class());

    }
    goto LABEL_35;
  }
LABEL_36:
  objc_msgSend(v6, "specifierForID:", CFSTR("SOUND_SWITCHES"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if ((PSGetCapabilityBoolAnswer() & 1) != 0 || (PSGetCapabilityBoolAnswer() & 1) == 0)
  {
    if (v54)
    {
      SHS_LocalizedStringForSounds(CFSTR("SOUND_ONLY_SWITCHES_HEADER"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setName:", v56);

      SHS_LocalizedStringForSounds(CFSTR("SOUND_ONLY_SWITCHES_FOOTER"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setProperty:forKey:", v57, *MEMORY[0x24BE75A68]);

    }
    objc_msgSend(v6, "specifierForID:", CFSTR("RING_VOLUME_SLIDER"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setProperty:forKey:", v58, *MEMORY[0x24BE759B0]);

  }
  else
  {
    if (!v54)
      goto LABEL_44;
    SHS_LocalizedStringForSounds(CFSTR("SOUND_SWITCHES_HEADER"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setName:", v55);
  }

LABEL_44:
  if (PSGetCapabilityBoolAnswer())
  {
    if ((PSGetCapabilityBoolAnswer() & 1) == 0)
    {
      SHS_LocalizedStringForSounds(CFSTR("SOUNDS_AND_HAPTICS"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSSoundsPrefController setTitle:](self, "setTitle:", v59);

      v60 = objc_msgSend(v6, "indexOfSpecifierWithID:", CFSTR("LOCK_SOUND_SWITCH"));
      if (v60 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v61 = v60;
        objc_msgSend(v6, "specifierForID:", CFSTR("SOUND_SWITCHES"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          SHS_LocalizedStringForSounds(CFSTR("SOUND_SWITCHES_HEADER"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setName:", v63);

          SHS_LocalizedStringForSounds(CFSTR("SYSTEM_HAPTICS_FOOTER"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setProperty:forKey:", v64, *MEMORY[0x24BE75A68]);

        }
        v65 = (void *)MEMORY[0x24BE75590];
        SHS_LocalizedStringForSounds(CFSTR("SYSTEM_HAPTICS"));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v66, self, sel_setSystemHapticsEnabled_specifier_, sel_systemHapticsEnabled_, 0, 6, 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759E0]);
        objc_msgSend(v67, "setProperty:forKey:", CFSTR("com.apple.preferences.sounds"), *MEMORY[0x24BE759E8]);
        objc_msgSend(v67, "setProperty:forKey:", CFSTR("effects-haptic"), *MEMORY[0x24BE75B50]);
        objc_msgSend(v6, "insertObject:atIndex:", v67, v61 + 1);

      }
    }
  }
  if (_os_feature_enabled_impl()
    && (!PSGetCapabilityBoolAnswer() || _os_feature_enabled_impl()))
  {
    objc_msgSend(v6, "specifierForID:", CFSTR("HEADPHONE_LEVEL_LIMIT_SETTING"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_HEARING_PROTECTION"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setName:", v69);

  }
  if (-[SHSSoundsPrefController _isKeyHapticsSupported](self, "_isKeyHapticsSupported"))
  {
    objc_msgSend(v6, "specifierForID:", CFSTR("KEYBOARD_SOUND_SWITCH"));
    v70 = objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      v71 = (void *)v70;
      v72 = objc_msgSend(v6, "indexOfObject:", v70);
      -[SHSSoundsPrefController _keyboardFeedbackSpecifier](self, "_keyboardFeedbackSpecifier");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v72, v73);
    }
  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BE3F4F8], "profileManagementSpecifier");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v74);

  }
  v75 = *(Class *)((char *)&self->super.super.super.super.super.isa + v79);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v79) = (Class)v6;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v79);
  return v3;
}

- (SHSRingerControl)_ringerControl
{
  return self->__ringerControl;
}

- (NSNumber)_cachedShouldHideValue
{
  return self->__cachedShouldHideValue;
}

- (void)set_voiceMailSpecifierIndex:(int64_t)a3
{
  self->__voiceMailSpecifierIndex = a3;
}

- (void)set_voiceMailSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__voiceMailSpecifier, a3);
}

- (void)refreshShouldHideAllVoicemailUI
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SHSSoundsPrefController refreshShouldHideAllVoicemailUI]";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_228D17000, a2, OS_LOG_TYPE_ERROR, "%s: Error retrieving subscription info: %{public}@.", (uint8_t *)&v2, 0x16u);
}

- (PSSpecifier)_voiceMailSpecifier
{
  return self->__voiceMailSpecifier;
}

- (int)_deviceType
{
  int result;
  void *v3;
  void *v4;
  int v5;

  result = _deviceType___deviceType;
  if (!_deviceType___deviceType)
  {
    v3 = (void *)MGCopyAnswer();
    objc_msgSend(v3, "lowercaseString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("iphone")) & 1) != 0)
    {
      v5 = 1;
    }
    else if (PSGetCapabilityBoolAnswer())
    {
      v5 = 2;
    }
    else
    {
      v5 = 3;
    }
    _deviceType___deviceType = v5;

    return _deviceType___deviceType;
  }
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  double v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)SHSSoundsPrefController;
  -[SHSSoundsPrefController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  SHSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SHSSoundsPrefController viewWillDisappear:]";
    _os_log_impl(&dword_228D17000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0.5;
  objc_msgSend(v5, "stopRingtoneWithFadeOut:", v6);

  -[SHSSoundsPrefController willHideSlider](self, "willHideSlider");
}

- (SHSAudioPlayback)_audioPlayback
{
  return self->__audioPlayback;
}

+ (id)BOOLeanCapabilitiesToTest
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("any-telephony");
  v3[1] = CFSTR("ipad");
  v3[2] = CFSTR("ringer-switch");
  v3[3] = CFSTR("gqDnklGQnpv5ilgh5uHckw");
  v3[4] = CFSTR("AirDropCapability");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SHSSoundsPrefController)init
{
  SHSSoundsPrefController *v2;
  SHSRingerControl *v3;
  SHSRingerControl *ringerControl;
  void *v5;
  SHSAudioPlayback *v6;
  SHSAudioPlayback *audioPlayback;
  CoreTelephonyClient *v8;
  CoreTelephonyClient *client;
  void *v10;
  void *v11;
  ADASManager *v12;
  ADASManager *audioSettingsManager;
  id v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SHSSoundsPrefController;
  v2 = -[SHSSoundsPrefController init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SHSRingerControl);
    ringerControl = v2->__ringerControl;
    v2->__ringerControl = v3;

    -[SHSSoundsPrefController _ringerControl](v2, "_ringerControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v2);

    v6 = objc_alloc_init(SHSAudioPlayback);
    audioPlayback = v2->__audioPlayback;
    v2->__audioPlayback = v6;

    v2->_hasTelephony = PSGetCapabilityBoolAnswer();
    v8 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x24BDC2810]);
    client = v2->__client;
    v2->__client = v8;

    -[CoreTelephonyClient setDelegate:](v2->__client, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_didBackground, *MEMORY[0x24BEBDF98], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_willForeground, *MEMORY[0x24BEBE008], 0);

    -[SHSSoundsPrefController setUpSilentModeNotifications](v2, "setUpSilentModeNotifications");
    v12 = (ADASManager *)objc_alloc_init(MEMORY[0x24BE0A230]);
    audioSettingsManager = v2->_audioSettingsManager;
    v2->_audioSettingsManager = v12;

    v14 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v14, "setNumberStyle:", 1);
    objc_msgSend(v14, "setMaximumFractionDigits:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromNumber:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNotANumberSymbol:", v16);

    -[SHSSoundsPrefController setNumberFormatter:](v2, "setNumberFormatter:", v14);
  }
  return v2;
}

- (void)willHideSlider
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SHSSoundsPrefController willHideSlider]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[SHSSoundsPrefController setVolumeHUDsuppression:](self, "setVolumeHUDsuppression:", 0);
  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppWantsVolumeChangeEvents:", 0);

}

- (void)setVolumeHUDsuppression:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_volumeHUDsuppressed);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315650;
    v15 = "-[SHSSoundsPrefController setVolumeHUDsuppression:]";
    v16 = 2114;
    v17 = v6;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s: current: '%{public}@', proposed: '%{public}@'.", (uint8_t *)&v14, 0x20u);

  }
  if (self->_volumeHUDsuppressed != v3)
  {
    self->_volumeHUDsuppressed = v3;
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windows");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v3 ^ 1;
    objc_msgSend(v11, "_setSystemVolumeHUDEnabled:", v12);
    if (PSGetCapabilityBoolAnswer())
    {
      objc_msgSend(v11, "_setSystemVolumeHUDEnabled:forAudioCategory:", v12, CFSTR("RingtonePreview"));
      v13 = CFSTR("Ringtone");
    }
    else
    {
      v13 = CFSTR("Audio/Video");
    }
    objc_msgSend(v11, "_setSystemVolumeHUDEnabled:forAudioCategory:", v12, v13);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SHSSoundsPrefController;
  v6 = a4;
  -[SHSSoundsPrefController tableView:cellForRowAtIndexPath:](&v32, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SHSSoundsPrefController indexForIndexPath:](self, "indexForIndexPath:", v6, v32.receiver, v32.super_class);

  -[SHSSoundsPrefController specifierAtIndex:](self, "specifierAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("RING_VOLUME_SLIDER"));

  if (v11)
  {
    objc_msgSend(v7, "control");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_minValueView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v15);

    objc_msgSend(v12, "_maxValueView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "textColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v18);

    -[SHSSoundsPrefController willShowSlider](self, "willShowSlider");
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v9, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("SILENT_MODE"));

  if (v20)
  {
    objc_msgSend(v7, "control");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.996078431, 0.274509804, 0.156862745, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOnTintColor:", v21);

    -[SHSSoundsPrefController getSilentModeIconWithSwitch:](self, "getSilentModeIconWithSwitch:", objc_msgSend(v12, "isOn"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProperty:forKey:", v22, *MEMORY[0x24BE75AC8]);
    -[SHSSoundsPrefController specifiers](self, "specifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "specifierForID:", CFSTR("SILENT_MODE_GROUP"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSSoundsPrefController getSilentModeFooterWithSwitch:](self, "getSilentModeFooterWithSwitch:", objc_msgSend(v12, "isOn"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v25, *MEMORY[0x24BE75A68]);

    goto LABEL_7;
  }
  objc_msgSend(v9, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("FIXED_POSITION_VOLUME"));

  if (v27)
  {
    objc_msgSend(v7, "control");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSSoundsPrefController specifiers](self, "specifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "specifierForID:", CFSTR("FIXED_POSITION_VOLUME_CONTROLS"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSSoundsPrefController getFixedVolumeControlsFooterWithSwitch:](self, "getFixedVolumeControlsFooterWithSwitch:", objc_msgSend(v12, "isOn"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProperty:forKey:", v30, *MEMORY[0x24BE75A68]);

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v11, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("RING_VOLUME_SLIDER"));

    if (v10)
      -[SHSSoundsPrefController willHideSlider](self, "willHideSlider");

    v7 = v11;
  }

}

- (void)updateVoiceMailVisibility
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  -[SHSSoundsPrefController _cachedShouldHideValue](self, "_cachedShouldHideValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[SHSSoundsPrefController refreshShouldHideAllVoicemailUI](self, "refreshShouldHideAllVoicemailUI");
  -[SHSSoundsPrefController _cachedShouldHideValue](self, "_cachedShouldHideValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[SHSSoundsPrefController _voiceMailSpecifier](self, "_voiceMailSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SHSSoundsPrefController containsSpecifier:](self, "containsSpecifier:", v6);

  if (v7 && v5)
  {
    -[SHSSoundsPrefController _voiceMailSpecifier](self, "_voiceMailSpecifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SHSSoundsPrefController removeSpecifier:](self, "removeSpecifier:");
  }
  else
  {
    if (((v7 | v5) & 1) != 0)
      return;
    -[SHSSoundsPrefController _voiceMailSpecifier](self, "_voiceMailSpecifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[SHSSoundsPrefController insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", v8, -[SHSSoundsPrefController _voiceMailSpecifierIndex](self, "_voiceMailSpecifierIndex"));
  }

}

- (void)setUpSilentModeNotifications
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_228D17000, a2, OS_LOG_TYPE_ERROR, "Failed to subscribe for notifications from AVSystemController with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)serverDiedNotificationHandler:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SHSSoundsPrefController serverDiedNotificationHandler:]";
    _os_log_impl(&dword_228D17000, v4, OS_LOG_TYPE_DEFAULT, "%s: audiomxd died. Re-subscribing notifications.", (uint8_t *)&v5, 0xCu);
  }

  -[SHSSoundsPrefController unregisterSilentModeNotifications](self, "unregisterSilentModeNotifications");
  -[SHSSoundsPrefController setUpSilentModeNotifications](self, "setUpSilentModeNotifications");
}

- (void)handleSilentModeNotification:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE64918]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  SHSLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    v8 = CFSTR("OFF");
    if (v7)
      v8 = CFSTR("ON");
    *(_DWORD *)buf = 136315394;
    v11 = "-[SHSSoundsPrefController handleSilentModeNotification:]";
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_228D17000, v6, OS_LOG_TYPE_DEFAULT, "%s: Silent mode is %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SHSSoundsPrefController_handleSilentModeNotification___block_invoke;
  block[3] = &unk_24F1978D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __56__SHSSoundsPrefController_handleSilentModeNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("SILENT_MODE_GROUP"), 1);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("SILENT_MODE"), 1);
}

- (void)unregisterSilentModeNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE64910], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE64908], 0);

}

- (void)setSilentModeEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SHSSoundsPrefController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke;
  block[3] = &unk_24F1979E8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD block[4];
  int8x16_t v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE64988], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSilentMode:untilTime:reason:clientType:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue"), 0, CFSTR("User toggled in Sound and Haptics in Settings"), 7);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke_2;
  block[3] = &unk_24F1979E8;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__SHSSoundsPrefController_setSilentModeEnabled_specifier___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1[4], "getSilentModeIconWithSwitch:", objc_msgSend(a1[5], "BOOLValue"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "setProperty:forKey:", v5, *MEMORY[0x24BE75AC8]);
  objc_msgSend(a1[4], "specifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifierForID:", CFSTR("SILENT_MODE_GROUP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "getSilentModeFooterWithSwitch:", objc_msgSend(a1[5], "BOOLValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75A68]);

  objc_msgSend(a1[4], "reloadSpecifierID:animated:", CFSTR("SILENT_MODE_GROUP"), 1);
  objc_msgSend(a1[4], "reloadSpecifierID:animated:", CFSTR("SILENT_MODE"), 1);

}

- (id)silentModeEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE64988], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "getSilentMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setShowInStatusBarEnabled:(id)a3 specifier:(id)a4
{
  id v4;

  -[SHSSoundsPrefController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", a3, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x24BDD13F0], 0);

}

- (void)presentHapticsController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  +[SHSViewControllerFactory createHapticsOptionsViewController:delegate:](_TtC24SoundsAndHapticsSettings24SHSViewControllerFactory, "createHapticsOptionsViewController:delegate:", -[SHSSoundsPrefController getSelectedHapticsOption](self, "getSelectedHapticsOption"), self);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTitle:", v5);
  -[SHSSoundsPrefController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

}

- (id)getSilentModeIconWithSwitch:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.996078431, 0.274509804, 0.156862745, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("bell.slash.fill");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("bell.fill");
  }
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getSilentModeFooterWithSwitch:(BOOL)a3
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("SILENT_MODE_ON_FOOTER");
  else
    v3 = CFSTR("SILENT_MODE_OFF_FOOTER");
  SHS_LocalizedStringForSounds(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getFixedVolumeControlsFooterWithSwitch:(BOOL)a3
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("FIXED_POSITION_VOLUME_ON_FOOTER");
  else
    v3 = CFSTR("FIXED_POSITION_VOLUME_OFF_FOOTER");
  SHS_LocalizedStringForSounds(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setFixedVolumeControls:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  -[SHSSoundsPrefController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", v6, a4);
  -[SHSSoundsPrefController specifiers](self, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierForID:", CFSTR("FIXED_POSITION_VOLUME_CONTROLS"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "BOOLValue");
  -[SHSSoundsPrefController getFixedVolumeControlsFooterWithSwitch:](self, "getFixedVolumeControlsFooterWithSwitch:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);

  -[SHSSoundsPrefController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("FIXED_POSITION_VOLUME_CONTROLS"), 1);
}

- (void)setSystemHapticsEnabled:(id)a3 specifier:(id)a4
{
  id v4;

  -[SHSSoundsPrefController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", a3, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x24BDD13F0], 0);

}

- (void)didLock
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SHSSoundsPrefController didLock]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s: Requesting ringtone playback to end.", (uint8_t *)&v5, 0xCu);
  }

  -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playRingtoneWithIdentifier:loop:", 0, 0);

}

- (void)updateVolume
{
  id v2;

  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reload");

}

- (void)endInterruption
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SHSSoundsPrefController endInterruption]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s: Requesting ringtone playback to end.", (uint8_t *)&v5, 0xCu);
  }

  -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playRingtoneWithIdentifier:loop:", 0, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHSSoundsPrefController;
  -[SHSSoundsPrefController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD19B8], "shs_rootPaneComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Sounds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSSoundsPrefController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.sound"), v4, MEMORY[0x24BDBD1A8], v5);

}

- (void)willResignActive
{
  NSObject *v3;
  void *v4;
  char v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SHSSoundsPrefController willResignActive]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSuspendedUnderLock");

  if ((v5 & 1) == 0)
    -[SHSSoundsPrefController endInterruption](self, "endInterruption");
  -[SHSSoundsPrefController willHideSlider](self, "willHideSlider");
}

- (void)willBecomeActive
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SHSSoundsPrefController willBecomeActive]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canChangeRingtoneWithButtons");

  -[SHSSoundsPrefController updateVolume](self, "updateVolume");
  if (-[SHSSoundsPrefController _isVolumeSliderVisible](self, "_isVolumeSliderVisible"))
    -[SHSSoundsPrefController willShowSlider](self, "willShowSlider");
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  SHSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SHSSoundsPrefController showController:animate:]";
    _os_log_impl(&dword_228D17000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playRingtoneWithIdentifier:loop:", 0, 0);

  v9.receiver = self;
  v9.super_class = (Class)SHSSoundsPrefController;
  -[SHSSoundsPrefController showController:animate:](&v9, sel_showController_animate_, v6, v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SHSSoundsPrefController endInterruption](self, "endInterruption");
  v4.receiver = self;
  v4.super_class = (Class)SHSSoundsPrefController;
  -[SHSSoundsPrefController dealloc](&v4, sel_dealloc);
}

- (void)setSoundEffects:(id)a3 specifier:(id)a4
{
  int v4;
  const void *v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = objc_msgSend(a3, "intValue");
  if (v4 == 3)
  {
    v6 = (const void *)*MEMORY[0x24BDBD270];
    v5 = (const void *)*MEMORY[0x24BDBD270];
  }
  else
  {
    v5 = (const void *)*MEMORY[0x24BDBD268];
    if (v4 == 2)
    {
      v6 = (const void *)*MEMORY[0x24BDBD270];
    }
    else
    {
      v6 = (const void *)*MEMORY[0x24BDBD268];
      if (v4 == 1)
        v5 = (const void *)*MEMORY[0x24BDBD270];
    }
  }
  v7 = (const __CFString *)*MEMORY[0x24BDBD590];
  v8 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue(CFSTR("sound-effects-speaker"), v5, CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSetValue(CFSTR("sound-effects-headphones"), v6, CFSTR("com.apple.springboard"), v7, v8);
  CFPreferencesSynchronize(CFSTR("com.apple.springboard"), v7, v8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.sound-effects-speaker.changed"), 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.sound-effects-headphones.changed"), 0, 0, 1u);
}

- (id)soundEffects:(id)a3
{
  int AppBooleanValue;
  int v4;
  int v5;
  uint64_t v6;
  BOOL v7;
  Boolean keyExistsAndHasValidFormat[2];

  *(_WORD *)keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("sound-effects-speaker"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat[1]);
  v4 = CFPreferencesGetAppBooleanValue(CFSTR("sound-effects-headphones"), CFSTR("com.apple.springboard"), keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat[1])
  {
    CFPreferencesSetValue(CFSTR("sound-effects-speaker"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    AppBooleanValue = 1;
  }
  v5 = keyExistsAndHasValidFormat[0];
  if (!keyExistsAndHasValidFormat[0])
  {
    CFPreferencesSetValue(CFSTR("sound-effects-headphones"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    v5 = keyExistsAndHasValidFormat[0];
    v4 = 1;
  }
  if (!keyExistsAndHasValidFormat[1] || !v5)
    CFPreferencesSynchronize(CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (AppBooleanValue | v4)
  {
    if (!AppBooleanValue || v4)
    {
      if (AppBooleanValue || !v4)
      {
        if (v4)
          v7 = AppBooleanValue == 0;
        else
          v7 = 1;
        if (v7)
          v6 = 0;
        else
          v6 = 3;
      }
      else
      {
        v6 = 2;
      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startRingtonePreview
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  SHSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[SHSSoundsPrefController startRingtonePreview]";
    _os_log_impl(&dword_228D17000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BEDCDF0];
  -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", v5, sel_stopPlayback, 0);

  if (self->_hasTelephony)
  {
    -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isPlayingRingtone");

    if ((v7 & 1) == 0)
    {
      SHSLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromTLAlertType();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315394;
        v15 = "-[SHSSoundsPrefController startRingtonePreview]";
        v16 = 2114;
        v17 = v9;
        _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, "%s: Requesting playback of current ringtone for alert type '%{public}@'.", (uint8_t *)&v14, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentToneIdentifierForAlertType:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "playRingtoneWithIdentifier:loop:", v11, 1);

    }
  }
  -[SHSSoundsPrefController _audioPlayback](self, "_audioPlayback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performSelector:withObject:afterDelay:", sel_stopPlayback, 0, 2.0);

}

- (id)volume:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volume");
  objc_msgSend(v3, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setVolume:(id)a3 specifier:(id)a4
{
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  int v10;
  int v11;
  void *v12;
  double v13;
  id v14;

  v14 = a3;
  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volume");
  v7 = v6;
  objc_msgSend(v14, "floatValue");
  v9 = v8;

  if (v7 != v9)
  {
    objc_msgSend(v14, "floatValue");
    v11 = v10;
    -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = v11;
    objc_msgSend(v12, "setVolume:", v13);

    -[SHSSoundsPrefController startRingtonePreview](self, "startRingtonePreview");
  }

}

- (id)detailTextForToneWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("alertType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = TLAlertTypeFromString();

  if (-[SHSSoundsPrefController _deviceType](self, "_deviceType") != 1
    || !_os_feature_enabled_impl()
    || !+[SHSDualSIMToneHelper shouldShowSIMBasedToneCustomizationForAlertType:](SHSDualSIMToneHelper, "shouldShowSIMBasedToneCustomizationForAlertType:", v6))
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("accountIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentToneIdentifierForAlertType:topic:", v6, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((PSGetCapabilityBoolAnswer() & 1) == 0 && PSGetCapabilityBoolAnswer())
    {
      objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentVibrationIdentifierForAlertType:topic:", v6, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEB8DD0])
        && !objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEB8DD8]))
      {
        SHS_LocalizedStringForSounds(CFSTR("VIBRATE_ONLY"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          goto LABEL_11;
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nameForToneIdentifier:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
    goto LABEL_12;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (void)setPlayKeyboardSound:(id)a3 specifier:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  -[SHSSoundsPrefController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", a3, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD13F0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", v4, v5);

}

- (void)setPlayLockSound:(id)a3 specifier:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;

  -[SHSSoundsPrefController setPreferenceValue:specifier:](self, "setPreferenceValue:specifier:", a3, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD13F0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", v4, v5);

}

- (void)setCanChangeRingtoneWithButtons:(id)a3 specifier:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[SHSSoundsPrefController _ringerControl](self, "_ringerControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCanChangeRingtoneWithButtons:", v5);

  -[SHSSoundsPrefController setVolumeHUDsuppression:](self, "setVolumeHUDsuppression:", v5);
  -[SHSSoundsPrefController reloadSpecifiers](self, "reloadSpecifiers");
}

- (id)getHeadphoneLevelLimitSetting
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (_os_feature_enabled_impl()
    && (!PSGetCapabilityBoolAnswer() || (_os_feature_enabled_impl() & 1) != 0))
  {
    v3 = 0;
  }
  else
  {
    -[SHSSoundsPrefController audioSettingsManager](self, "audioSettingsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getPreferenceFor:", *MEMORY[0x24BE0A210]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      -[SHSSoundsPrefController audioSettingsManager](self, "audioSettingsManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getPreferenceFor:", *MEMORY[0x24BE0A218]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BDD17C8];
      SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_LIMIT_SET_LEVEL"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSSoundsPrefController numberFormatter](self, "numberFormatter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromNumber:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v12);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      SHS_LocalizedStringForSounds(CFSTR("HEADPHONE_LEVEL_LIMIT_SET_OFF"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (BOOL)_isVolumeSliderVisible
{
  void *v2;
  BOOL v3;

  -[SHSSoundsPrefController _volumeSliderCell](self, "_volumeSliderCell");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_volumeSliderCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SHSSoundsPrefController specifierForID:](self, "specifierForID:", CFSTR("RING_VOLUME_SLIDER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSSoundsPrefController indexPathForSpecifier:](self, "indexPathForSpecifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSSoundsPrefController table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)ringerControlDidObserveEffectiveSystemVolumeChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SHSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
    _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[SHSSoundsPrefController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (-[SHSSoundsPrefController _isVolumeSliderVisible](self, "_isVolumeSliderVisible"))
      {
        -[SHSSoundsPrefController _volumeSliderCell](self, "_volumeSliderCell");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "control");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isTracking");

        if (!v10)
        {
          -[SHSSoundsPrefController startRingtonePreview](self, "startRingtonePreview");
          goto LABEL_16;
        }
        SHSLogForCategory(0);
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        *(_DWORD *)buf = 136315138;
        v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
        v12 = "%s: Volume slider is active and in use, ignoring.";
        goto LABEL_14;
      }
      SHSLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
        v12 = "%s: Volume slider not on screen, ignoring.";
        goto LABEL_14;
      }
    }
    else
    {
      SHSLogForCategory(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v16 = "-[SHSSoundsPrefController ringerControlDidObserveEffectiveSystemVolumeChange:]";
        v12 = "%s: View is not on screen, ignoring.";
LABEL_14:
        _os_log_impl(&dword_228D17000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__SHSSoundsPrefController_ringerControlDidObserveEffectiveSystemVolumeChange___block_invoke;
  v13[3] = &unk_24F197A10;
  v13[4] = self;
  v14 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

LABEL_16:
}

uint64_t __78__SHSSoundsPrefController_ringerControlDidObserveEffectiveSystemVolumeChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ringerControlDidObserveEffectiveSystemVolumeChange:", *(_QWORD *)(a1 + 40));
}

- (void)ringerControl:(id)a3 volumeValueDidChange:(float)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  void *v10;
  _QWORD block[5];
  id v12;
  float v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    SHSLogForCategory(1uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[SHSSoundsPrefController ringerControl:volumeValueDidChange:]";
      _os_log_impl(&dword_228D17000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    if (-[SHSSoundsPrefController _isVolumeSliderVisible](self, "_isVolumeSliderVisible"))
    {
      -[SHSSoundsPrefController _volumeSliderCell](self, "_volumeSliderCell");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v9 = a4;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:", v10);

    }
    else
    {
      -[SHSSoundsPrefController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("RING_VOLUME_SLIDER"));
    }
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SHSSoundsPrefController_ringerControl_volumeValueDidChange___block_invoke;
    block[3] = &unk_24F197A38;
    block[4] = self;
    v12 = v6;
    v13 = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __62__SHSSoundsPrefController_ringerControl_volumeValueDidChange___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "ringerControl:volumeValueDidChange:", *(_QWORD *)(a1 + 40), a2);
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[SHSSoundsPrefController set_cachedShouldHideValue:](self, "set_cachedShouldHideValue:", 0);
    -[SHSSoundsPrefController updateVoiceMailVisibility](self, "updateVoiceMailVisibility");
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __47__SHSSoundsPrefController_carrierBundleChange___block_invoke;
    v5[3] = &unk_24F197A10;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __47__SHSSoundsPrefController_carrierBundleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleChange:", *(_QWORD *)(a1 + 40));
}

- (void)hapticsOptionsDidChange:(int64_t)a3
{
  _BOOL4 v4;
  BOOL v5;
  uint64_t v6;
  _BOOL8 v7;

  v4 = (unint64_t)a3 < 3;
  v5 = (a3 & 1) == 0;
  v6 = v4 & (3u >> (a3 & 7));
  v7 = v5 && v4;
  -[SHSSoundsPrefController setSilentModeOn:](self, "setSilentModeOn:", v6);
  -[SHSSoundsPrefController setSilentModeOff:](self, "setSilentModeOff:", v7);
  -[SHSSoundsPrefController reloadSpecifierID:animated:](self, "reloadSpecifierID:animated:", CFSTR("HAPTICS"), 1);
}

- (void)setSilentModeOff:(BOOL)a3
{
  _BOOL8 v3;
  CFPropertyListRef *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  v5 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v5 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  v6 = (const __CFString *)*MEMORY[0x24BDBD590];
  v7 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue(CFSTR("ring-vibrate"), *v5, CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(CFSTR("com.apple.springboard"), v6, v7);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.ring-vibrate.changed"), 0, 0, 1u);
  +[SHSAnalytics trackingVibrateOnRingValueChanged:age:](SHSAnalytics, "trackingVibrateOnRingValueChanged:age:", v3, -[SHSSoundsPrefController ageOfToggleForSilentModeOn:](self, "ageOfToggleForSilentModeOn:", 0));
}

- (void)setSilentModeOn:(BOOL)a3
{
  _BOOL8 v3;
  CFPropertyListRef *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = a3;
  v5 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a3)
    v5 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  v6 = (const __CFString *)*MEMORY[0x24BDBD590];
  v7 = (const __CFString *)*MEMORY[0x24BDBD570];
  CFPreferencesSetValue(CFSTR("silent-vibrate"), *v5, CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  CFPreferencesSynchronize(CFSTR("com.apple.springboard"), v6, v7);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.silent-vibrate.changed"), 0, 0, 1u);
  +[SHSAnalytics trackingVibrateOnSilentValueChanged:age:](SHSAnalytics, "trackingVibrateOnSilentValueChanged:age:", v3, -[SHSSoundsPrefController ageOfToggleForSilentModeOn:](self, "ageOfToggleForSilentModeOn:", 1));
}

- (id)getSelectedHapticsOptionTitleWithSpecifier:(id)a3
{
  unint64_t v3;
  __CFString *v4;

  v3 = -[SHSSoundsPrefController getSelectedHapticsOption](self, "getSelectedHapticsOption", a3);
  if (v3 > 2)
    v4 = CFSTR("NEVER_PLAY");
  else
    v4 = off_24F197A58[v3];
  SHS_LocalizedStringForSounds(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)getSelectedHapticsOption
{
  int AppBooleanValue;
  int v3;
  int v4;
  int64_t v6;
  Boolean keyExistsAndHasValidFormat[2];

  *(_WORD *)keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("silent-vibrate"), CFSTR("com.apple.springboard"), &keyExistsAndHasValidFormat[1]);
  v3 = CFPreferencesGetAppBooleanValue(CFSTR("ring-vibrate"), CFSTR("com.apple.springboard"), keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat[1])
  {
    CFPreferencesSetValue(CFSTR("silent-vibrate"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    AppBooleanValue = 1;
  }
  v4 = keyExistsAndHasValidFormat[0];
  if (!keyExistsAndHasValidFormat[0])
  {
    CFPreferencesSetValue(CFSTR("ring-vibrate"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    v4 = keyExistsAndHasValidFormat[0];
    v3 = 1;
  }
  if (keyExistsAndHasValidFormat[1] && v4)
  {
    if (!AppBooleanValue)
      goto LABEL_12;
  }
  else
  {
    CFPreferencesSynchronize(CFSTR("com.apple.springboard"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    if (!AppBooleanValue)
      goto LABEL_12;
  }
  if (v3)
    return 0;
LABEL_12:
  v6 = 2;
  if (!v3)
    v6 = 3;
  if (AppBooleanValue)
    return 1;
  else
    return v6;
}

- (BOOL)_isKeyHapticsSupported
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_feedbackSupportLevel");

  if (v3 == 2)
    return _os_feature_enabled_impl();
  else
    return 0;
}

- (id)_keyboardFeedbackSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  SHS_LocalizedStringForSounds(CFSTR("KEYBOARD_FEEDBACK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, sel__keyboardClicksTitle_, objc_opt_class(), 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIdentifier:", CFSTR("KEYBOARD_FEEDBACK"));
  return v5;
}

- (id)_keyboardClicksTitle:(id)a3
{
  return +[SHSKeyboardClicksControllerViewController combinedDescription](SHSKeyboardClicksControllerViewController, "combinedDescription", a3);
}

- (unint64_t)ageOfToggleForSilentModeOn:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v6 = CFSTR("AgeOfVibrateWhenRing");
  else
    v6 = CFSTR("AgeOfVibrateWhenSilent");
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDBCE48]);
    v9 = (void *)objc_msgSend(v8, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v7, v5, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "day") + 1;

  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

  v12 = 0;
  v13 = 8u;
  v14 = 365;
  while (v11 >= *(_QWORD *)((char *)&unk_228D33920 + v13))
  {
    v13 += 8;
    v12 += 0x100000000;
    if (v13 == 56)
      goto LABEL_12;
  }
  v14 = *(_QWORD *)((char *)&unk_228D33920 + (v12 >> 29));
LABEL_12:

  return v14;
}

- (ADASManager)audioSettingsManager
{
  return self->_audioSettingsManager;
}

- (void)setAudioSettingsManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioSettingsManager, a3);
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_numberFormatter, a3);
}

- (void)set_audioPlayback:(id)a3
{
  objc_storeStrong((id *)&self->__audioPlayback, a3);
}

- (void)set_volumeSliderVisible:(BOOL)a3
{
  self->__volumeSliderVisible = a3;
}

- (void)set_ringerControl:(id)a3
{
  objc_storeStrong((id *)&self->__ringerControl, a3);
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
  objc_storeStrong((id *)&self->__client, a3);
}

- (PSSpecifier)_audioGroupSpecifier
{
  return self->__audioGroupSpecifier;
}

- (void)set_audioGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__audioGroupSpecifier, a3);
}

- (PSSpecifier)_headphoneLevelLimitingSpecifier
{
  return self->__headphoneLevelLimitingSpecifier;
}

- (void)set_headphoneLevelLimitingSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->__headphoneLevelLimitingSpecifier, a3);
}

- (int64_t)_voiceMailSpecifierIndex
{
  return self->__voiceMailSpecifierIndex;
}

- (void)set_cachedShouldHideValue:(id)a3
{
  objc_storeStrong((id *)&self->__cachedShouldHideValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cachedShouldHideValue, 0);
  objc_storeStrong((id *)&self->__headphoneLevelLimitingSpecifier, 0);
  objc_storeStrong((id *)&self->__audioGroupSpecifier, 0);
  objc_storeStrong((id *)&self->__voiceMailSpecifier, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->__ringerControl, 0);
  objc_storeStrong((id *)&self->__audioPlayback, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_audioSettingsManager, 0);
}

@end
