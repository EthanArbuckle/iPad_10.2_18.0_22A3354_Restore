@implementation VOSSettingsHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_10);
  return (id)sharedInstance__Shared;
}

void __35__VOSSettingsHelper_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VOSSettingsHelper _init]([VOSSettingsHelper alloc], "_init");
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (id)_init
{
  VOSSettingsHelper *v2;
  VOSSettingsHelper *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VOSSettingsHelper;
  v2 = -[VOSSettingsHelper init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VOSSettingsHelper _enabledVoices](v2, "_enabledVoices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VOSSettingsHelper setEnabledVoices:](v3, "setEnabledVoices:", v4);

    -[VOSSettingsHelper setSliderMaxValue:](v3, "setSliderMaxValue:", 1.0);
    -[VOSSettingsHelper setSliderMinValue:](v3, "setSliderMinValue:", 0.0);
  }
  return v3;
}

- (id)_enabledVoices
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dialectForSystemLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specificLanguageID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceOverDefaultVoiceSelections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "voiceId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "speechVoiceIdentifierForLanguage:sourceKey:exists:", v5, *MEMORY[0x24BE003A8], 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v10);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "voiceOverVoiceRotors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v2;
}

- (BOOL)isSlideToTypeEnabled
{
  int AppBooleanValue;
  BOOL v3;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("KeyboardContinuousPathEnabled"), CFSTR("com.apple.keyboard.ContinuousPath"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 0;
  else
    v3 = 0;
  return !v3;
}

- (void)setSlideToTypeEnabled:(BOOL)a3
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetValue(CFSTR("KeyboardContinuousPathEnabled"), v3, CFSTR("com.apple.keyboard.ContinuousPath"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("AppleKeyboardsContinuousPathSettingsChangedNotification"), 0, 0, 1u);
}

- (BOOL)itemIsSupportedForPlatform:(id)a3
{
  return 1;
}

- (id)userSettingsItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceOverQuickSettingsItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "axMapObjectsUsingBlock:", &__block_literal_global_187_2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSSettingsItem allSettingsItems](VOSSettingsItem, "allSettingsItems");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSSettingsItem settingsIDtoItemMap:](VOSSettingsItem, "settingsIDtoItemMap:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Item"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[VOSSettingsHelper itemIsSupportedForPlatform:](self, "itemIsSupportedForPlatform:", v12))
        {
          if (v12)
          {
            v41[0] = v12;
            v40[0] = CFSTR("Item");
            v40[1] = CFSTR("Included");
            objc_msgSend(v10, "objectForKeyedSubscript:");
            v13 = objc_claimAutoreleasedReturnValue();
            v41[1] = v13;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v14);

          }
          else
          {
            VOTLogCommon();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v11;
              _os_log_impl(&dword_211371000, v13, OS_LOG_TYPE_DEFAULT, "Persistent QuickSettings identifier not found '%@'. skipping", buf, 0xCu);
            }
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    }
    while (v7);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v25;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        if (-[VOSSettingsHelper itemIsSupportedForPlatform:](self, "itemIsSupportedForPlatform:", v20))
        {
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v26, "containsObject:", v21);

          if ((v22 & 1) == 0)
          {
            v37[0] = CFSTR("Item");
            v37[1] = CFSTR("Included");
            v38[0] = v20;
            v38[1] = &unk_24CBBC7B0;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v23);

          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v17);
  }

  return v28;
}

uint64_t __38__VOSSettingsHelper_userSettingsItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("Item"));
}

- (void)saveUserSettingsItems:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v20[0] = CFSTR("Included");
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Included"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = CFSTR("Item");
        v21[0] = v10;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Item"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVoiceOverQuickSettingsItems:", v4);

}

- (void)setNextValueForItem:(id)a3 inDirection:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  double v14;
  id v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  id v35;

  v35 = a3;
  v6 = objc_msgSend(v35, "itemType");
  if (!v6)
  {
    v24 = (void *)MEMORY[0x24BDD16E0];
    -[VOSSettingsHelper valueForSettingsItem:](self, "valueForSettingsItem:", v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithInt:", objc_msgSend(v8, "BOOLValue") ^ 1);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  if (v6 == 1)
  {
    -[VOSSettingsHelper valueForSettingsItem:](self, "valueForSettingsItem:", v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    +[VOSSettingsItem SpeakingRate](VOSSettingsItem, "SpeakingRate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15 == v35;

    +[VOSSettingsItem BrailleAutoAdvanceDuration](VOSSettingsItem, "BrailleAutoAdvanceDuration");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 == v35)
    {
      +[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scaledValue:withItem:", v19, v35);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v14 = v21;

    }
    v22 = dbl_2113A7550[v16];
    +[VOSSettingsItem Volume](VOSSettingsItem, "Volume");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (v23 == v35)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "voiceOverMediaDuckingMode");

      if (v27)
      {
        -[VOSSettingsHelper setSliderMaxValue:](self, "setSliderMaxValue:", 1.99000001);
        v22 = 0.05;
      }
    }
    else
    {

    }
    if (a4)
    {
      v7 = v35;
      if (a4 != 1)
        goto LABEL_28;
      -[VOSSettingsHelper sliderMaxValue](self, "sliderMaxValue", v35);
      v7 = v35;
      if (v14 >= v28)
        goto LABEL_28;
      v29 = (void *)MEMORY[0x24BDD16E0];
      v30 = v14 + v22;
      -[VOSSettingsHelper sliderMaxValue](self, "sliderMaxValue", v35);
      if (v30 < v31)
        v31 = v30;
    }
    else
    {
      -[VOSSettingsHelper sliderMinValue](self, "sliderMinValue");
      v7 = v35;
      if (v14 <= v33)
        goto LABEL_28;
      v29 = (void *)MEMORY[0x24BDD16E0];
      v34 = v14 - v22;
      -[VOSSettingsHelper sliderMinValue](self, "sliderMinValue", v35);
      if (v34 >= v31)
        v31 = v34;
    }
    objc_msgSend(v29, "numberWithDouble:", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VOSSettingsHelper setValue:forSettingsItem:](self, "setValue:forSettingsItem:", v8, v35);
    goto LABEL_27;
  }
  v7 = v35;
  if (v6 == 2)
  {
    -[VOSSettingsHelper possibleValuesForSettingsItem:](self, "possibleValuesForSettingsItem:", v35);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VOSSettingsHelper valueForSettingsItem:](self, "valueForSettingsItem:", v35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:", v9);

    if (a4)
    {
      if (a4 != 1)
      {
LABEL_27:

        v7 = v35;
        goto LABEL_28;
      }
      if (v10 + 1 < (unint64_t)objc_msgSend(v8, "count"))
        v11 = v10 + 1;
      else
        v11 = 0;
    }
    else
    {
      if (v10 <= 0)
        v10 = objc_msgSend(v8, "count");
      v11 = v10 - 1;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_26:
    v32 = (void *)v25;
    -[VOSSettingsHelper setValue:forSettingsItem:](self, "setValue:forSettingsItem:", v25, v35);

    goto LABEL_27;
  }
LABEL_28:

}

- (id)valueForSettingsItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  NSObject *v80;
  void *v81;
  int v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[VOSSettingsItem Sounds](VOSSettingsItem, "Sounds");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverSoundEffectsEnabled");
    goto LABEL_38;
  }
  +[VOSSettingsItem AudioDucking](VOSSettingsItem, "AudioDucking");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v36 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v34, "voiceOverMediaDuckingMode");
LABEL_31:
    objc_msgSend(v36, "numberWithLong:", v37);
    v38 = (id)objc_claimAutoreleasedReturnValue();
LABEL_39:
    v40 = v38;
LABEL_40:

    goto LABEL_41;
  }
  +[VOSSettingsItem Pitch](VOSSettingsItem, "Pitch");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverPitchChangeEnabled");
    goto LABEL_38;
  }
  +[VOSSettingsItem Volume](VOSSettingsItem, "Volume");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    v39 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "voiceOverVolume");
LABEL_34:
    objc_msgSend(v39, "numberWithFloat:");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[VOSSettingsItem SendToHDMI](VOSSettingsItem, "SendToHDMI");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverAudioFollowsHDMIAudio");
    goto LABEL_38;
  }
  +[VOSSettingsItem SoundCurtain](VOSSettingsItem, "SoundCurtain");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverSoundCurtain");
    goto LABEL_38;
  }
  +[VOSSettingsItem SpeakNotifications](VOSSettingsItem, "SpeakNotifications");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverSpeakNotificationsEnabled");
    goto LABEL_38;
  }
  +[VOSSettingsItem SpeakingRate](VOSSettingsItem, "SpeakingRate");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    v39 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "voiceOverEffectiveSpeakingRate");
    goto LABEL_34;
  }
  +[VOSSettingsItem Voice](VOSSettingsItem, "Voice");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "voiceOverCurrentRotorVoiceIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      -[VOSSettingsHelper enabledVoices](self, "enabledVoices");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "indexOfObjectPassingTest:", &__block_literal_global_196_1);

      if (v45 == 0x7FFFFFFFFFFFFFFFLL)
        v46 = 0;
      else
        v46 = v45;
    }
    else
    {
      v46 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v46);
    v50 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  +[VOSSettingsItem Hints](VOSSettingsItem, "Hints");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverHintsEnabled");
    goto LABEL_38;
  }
  +[VOSSettingsItem ScreenRecognition](VOSSettingsItem, "ScreenRecognition");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v4)
  {
    v47 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingsData");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "frontmostAppIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "numberWithInt:", objc_msgSend(v34, "automaticAccessibilityModeForBundleIdentifier:", v49) == 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_49:
    goto LABEL_40;
  }
  +[VOSSettingsItem LiveRegions](VOSSettingsItem, "LiveRegions");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingsData");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "frontmostAppIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      objc_msgSend(v51, "liveRegionStatusForWebOrApp:", v53);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "settingsData");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "webAreaURL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "liveRegionStatusForWebOrApp:", v66);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v67 = (void *)MEMORY[0x24BDD16E0];
    if (v34)
      v68 = objc_msgSend(v34, "BOOLValue");
    else
      v68 = 1;
    objc_msgSend(v67, "numberWithInt:", v68);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[VOSSettingsItem ImageDescriptions](VOSSettingsItem, "ImageDescriptions");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "imageCaptioningDisabledApps");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingsData");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "frontmostAppIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v55, "containsObject:", v57);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v58 ^ 1u);
    v50 = objc_claimAutoreleasedReturnValue();
LABEL_52:
    v40 = (void *)v50;
    goto LABEL_41;
  }
  +[VOSSettingsItem DirectTouch](VOSSettingsItem, "DirectTouch");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "voiceOverDirectTouchEnabledApps");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingsData");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "frontmostAppIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v64);
    v50 = objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  +[VOSSettingsItem RotorActionConfirmation](VOSSettingsItem, "RotorActionConfirmation");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverSpeakActionConfirmation");
    goto LABEL_38;
  }
  +[VOSSettingsItem BrailleAlerts](VOSSettingsItem, "BrailleAlerts");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverBrailleAlertsEnabled");
    goto LABEL_38;
  }
  +[VOSSettingsItem BrailleFormatting](VOSSettingsItem, "BrailleFormatting");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverBrailleFormattingEnabled");
    goto LABEL_38;
  }
  +[VOSSettingsItem Activities](VOSSettingsItem, "Activities");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "voiceOverSelectedActivity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v38 = v34;
      goto LABEL_39;
    }
    goto LABEL_69;
  }
  +[VOSSettingsItem Punctuation](VOSSettingsItem, "Punctuation");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "voiceOverPunctuationGroup");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(MEMORY[0x24BDFF778], "sharedDatabase");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "punctuationGroupForUUID:", v34);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
LABEL_69:
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[VOSSettingsItem NavigationStyle](VOSSettingsItem, "NavigationStyle");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24 == v4)
  {
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v34, "voiceOverNavigationStyle");
LABEL_75:
    objc_msgSend(v71, "numberWithInteger:", v72);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[VOSSettingsItem NavigateImages](VOSSettingsItem, "NavigateImages");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25 == v4)
  {
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v34, "voiceOverNavigateImagesOption");
    goto LABEL_75;
  }
  +[VOSSettingsItem GestureDirection](VOSSettingsItem, "GestureDirection");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26 == v4)
  {
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v34, "voiceOverNavigationDirectionMode");
    goto LABEL_75;
  }
  +[VOSSettingsItem PhoneticFeedback](VOSSettingsItem, "PhoneticFeedback");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v27 == v4)
  {
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v34, "voiceOverPhoneticsFeedback");
    goto LABEL_75;
  }
  +[VOSSettingsItem MediaDescriptions](VOSSettingsItem, "MediaDescriptions");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  if (v28 == v4)
  {
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v34, "voiceOverDescribedMedia");
    goto LABEL_75;
  }
  +[VOSSettingsItem CaptionPanel](VOSSettingsItem, "CaptionPanel");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (v29 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "enableVoiceOverCaptions");
    goto LABEL_38;
  }
  +[VOSSettingsItem LargeCursor](VOSSettingsItem, "LargeCursor");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (v30 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverLargeCursorEnabled");
    goto LABEL_38;
  }
  objc_msgSend(v4, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("ScreenCurtain"));

  if (v32)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "voiceOverScreenCurtainEnabled");
LABEL_38:
    objc_msgSend(v33, "numberWithBool:", v35);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[VOSSettingsItem TypingStyle](VOSSettingsItem, "TypingStyle");
  v73 = (id)objc_claimAutoreleasedReturnValue();

  if (v73 == v4)
  {
    v36 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v34, "voiceOverTypingMode");
    goto LABEL_31;
  }
  +[VOSSettingsItem SoftwareTypingFeedback](VOSSettingsItem, "SoftwareTypingFeedback");
  v74 = (id)objc_claimAutoreleasedReturnValue();

  if (v74 == v4)
  {
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v34, "voiceOverSoftwareTypingFeedback");
    goto LABEL_75;
  }
  +[VOSSettingsItem HardwareTypingFeedback](VOSSettingsItem, "HardwareTypingFeedback");
  v75 = (id)objc_claimAutoreleasedReturnValue();

  if (v75 == v4)
  {
    v71 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v34, "voiceOverHardwareTypingFeedback");
    goto LABEL_75;
  }
  +[VOSSettingsItem SlideToType](VOSSettingsItem, "SlideToType");
  v76 = (id)objc_claimAutoreleasedReturnValue();

  if (v76 == v4)
  {
    v33 = (void *)MEMORY[0x24BDD16E0];
    +[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isSlideToTypeEnabled");
    goto LABEL_38;
  }
  +[VOSSettingsItem BrailleAutoAdvanceDuration](VOSSettingsItem, "BrailleAutoAdvanceDuration");
  v77 = (id)objc_claimAutoreleasedReturnValue();

  if (v77 == v4)
  {
    v81 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "voiceOverBrailleAutoAdvanceDuration");
    objc_msgSend(v81, "numberWithDouble:");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[VOSSettingsItem BrailleInput](VOSSettingsItem, "BrailleInput");
  v78 = (id)objc_claimAutoreleasedReturnValue();

  if (v78 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "voiceOverTouchBrailleDisplayInputTableIdentifier");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  +[VOSSettingsItem BrailleOutput](VOSSettingsItem, "BrailleOutput");
  v79 = (id)objc_claimAutoreleasedReturnValue();

  if (v79 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "voiceOverTouchBrailleDisplayOutputTableIdentifier");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  VOTLogCommon();
  v80 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    v82 = 138412290;
    v83 = v4;
    _os_log_impl(&dword_211371000, v80, OS_LOG_TYPE_DEFAULT, "Unhandled pref getter for item: %@", (uint8_t *)&v82, 0xCu);
  }

  v40 = 0;
LABEL_41:

  return v40;
}

uint64_t __42__VOSSettingsHelper_valueForSettingsItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x24BE006C0];
  v3 = a2;
  objc_msgSend(v2, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceOverCurrentRotorVoiceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (void)setValue:(id)a3 forSettingsItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  int v42;
  NSObject *v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  double v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  _BOOL8 v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  int v93;
  void *v94;
  int v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  double v108;
  float v109;
  double v110;
  void *v111;
  void *v112;
  const __CFString *v113;
  id v114;
  uint8_t buf[4];
  id v116;
  uint64_t v117;

  v117 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[VOSSettingsItem Sounds](VOSSettingsItem, "Sounds");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v38 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverSoundEffectsEnabled:", v38);
    goto LABEL_37;
  }
  +[VOSSettingsItem AudioDucking](VOSSettingsItem, "AudioDucking");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    v39 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverMediaDuckingMode:", v39);
    goto LABEL_37;
  }
  +[VOSSettingsItem Pitch](VOSSettingsItem, "Pitch");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
  {
    v40 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverPitchChangeEnabled:", v40);
    goto LABEL_37;
  }
  +[VOSSettingsItem Volume](VOSSettingsItem, "Volume");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v7)
  {
    objc_msgSend(v6, "floatValue");
    v42 = v41;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v43 = objc_claimAutoreleasedReturnValue();
    LODWORD(v44) = v42;
    -[NSObject setVoiceOverVolume:](v43, "setVoiceOverVolume:", v44);
    goto LABEL_33;
  }
  +[VOSSettingsItem SendToHDMI](VOSSettingsItem, "SendToHDMI");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v7)
  {
    v45 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverAudioFollowsHDMIAudio:", v45);
    goto LABEL_37;
  }
  +[VOSSettingsItem SoundCurtain](VOSSettingsItem, "SoundCurtain");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v7)
  {
    v46 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverSoundCurtain:", v46);
    goto LABEL_37;
  }
  +[VOSSettingsItem SpeakNotifications](VOSSettingsItem, "SpeakNotifications");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v7)
  {
    v47 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverSpeakNotificationsEnabled:", v47);
    goto LABEL_37;
  }
  +[VOSSettingsItem SpeakingRate](VOSSettingsItem, "SpeakingRate");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v7)
  {
    objc_msgSend(v6, "floatValue");
    v51 = v50;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v43 = objc_claimAutoreleasedReturnValue();
    LODWORD(v52) = v51;
    -[NSObject setVoiceOverEffectiveSpeakingRate:](v43, "setVoiceOverEffectiveSpeakingRate:", v52);
    goto LABEL_33;
  }
  +[VOSSettingsItem Voice](VOSSettingsItem, "Voice");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v7)
  {
    if (!objc_msgSend(v6, "integerValue"))
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v43 = objc_claimAutoreleasedReturnValue();
      -[NSObject setVoiceOverCurrentRotorVoiceIdentifier:](v43, "setVoiceOverCurrentRotorVoiceIdentifier:", &stru_24CBADC48);
      goto LABEL_33;
    }
    -[NSArray objectAtIndexedSubscript:](self->_enabledVoices, "objectAtIndexedSubscript:", objc_msgSend(v6, "integerValue"));
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setVoiceOverCurrentRotorVoiceIdentifier:", v43);
    goto LABEL_42;
  }
  +[VOSSettingsItem Hints](VOSSettingsItem, "Hints");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17 == v7)
  {
    v54 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverHintsEnabled:", v54);
    goto LABEL_37;
  }
  +[VOSSettingsItem RotorActionConfirmation](VOSSettingsItem, "RotorActionConfirmation");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v7)
  {
    v55 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverSpeakActionConfirmation:", v55);
    goto LABEL_37;
  }
  +[VOSSettingsItem BrailleAlerts](VOSSettingsItem, "BrailleAlerts");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 == v7)
  {
    v56 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverBrailleAlertsEnabled:", v56);
    goto LABEL_37;
  }
  +[VOSSettingsItem BrailleFormatting](VOSSettingsItem, "BrailleFormatting");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v7)
  {
    v57 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverBrailleFormattingEnabled:", v57);
    goto LABEL_37;
  }
  +[VOSSettingsItem ImageDescriptions](VOSSettingsItem, "ImageDescriptions");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 == v7)
  {
    v58 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(v7, "settingsData");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "frontmostAppIdentifier");
    v43 = objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "imageCaptioningDisabledApps");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = (void *)objc_msgSend(v61, "mutableCopy");

      if (!v62)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v58)
      {
        objc_msgSend(v62, "removeObject:", v43);
      }
      else if ((objc_msgSend(v62, "containsObject:", v43) & 1) == 0)
      {
        objc_msgSend(v62, "addObject:", v43);
      }
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setImageCaptioningDisabledApps:", v62);

    }
    goto LABEL_33;
  }
  +[VOSSettingsItem DirectTouch](VOSSettingsItem, "DirectTouch");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 == v7)
  {
    objc_msgSend(v7, "settingsData");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "frontmostAppIdentifier");
    v43 = objc_claimAutoreleasedReturnValue();

    if (!v43)
      goto LABEL_33;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "voiceOverDirectTouchEnabledApps");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v65, "mutableCopy");

    objc_msgSend(v53, "objectForKey:", v43);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = objc_msgSend(v66, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v65 ^ 1);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v67, v43);

    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setVoiceOverDirectTouchEnabledApps:", v53);

    goto LABEL_42;
  }
  +[VOSSettingsItem LiveRegions](VOSSettingsItem, "LiveRegions");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 == v7)
  {
    objc_msgSend(v7, "settingsData");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "frontmostAppIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v70)
    {
      v43 = v70;
    }
    else
    {
      objc_msgSend(v7, "settingsData");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "webAreaURL");
      v43 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "liveRegionStatusForWebOrApp:", v43);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
      v83 = objc_msgSend(v53, "BOOLValue") ^ 1;
    else
      v83 = 0;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v83);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setLiveRegionStatusForWebOrApp:status:", v43, v85);

LABEL_42:
    goto LABEL_33;
  }
  +[VOSSettingsItem ScreenRecognition](VOSSettingsItem, "ScreenRecognition");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24 == v7)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settingsData");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "frontmostAppIdentifier");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v73, "automaticAccessibilityModeForBundleIdentifier:", v75);

    v77 = v76 != 1;
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settingsData");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "frontmostAppIdentifier");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setAutomaticAccessibilityMode:forBundleIdentifier:", v77, v79);

    goto LABEL_37;
  }
  +[VOSSettingsItem NavigationStyle](VOSSettingsItem, "NavigationStyle");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  if (v25 == v7)
  {
    v80 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverNavigationStyle:", v80);
    goto LABEL_37;
  }
  +[VOSSettingsItem NavigateImages](VOSSettingsItem, "NavigateImages");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26 == v7)
  {
    v86 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverNavigateImagesOption:", v86);
    goto LABEL_37;
  }
  +[VOSSettingsItem GestureDirection](VOSSettingsItem, "GestureDirection");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  if (v27 == v7)
  {
    v87 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverNavigationDirectionMode:", v87);
    goto LABEL_37;
  }
  +[VOSSettingsItem PhoneticFeedback](VOSSettingsItem, "PhoneticFeedback");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  if (v28 == v7)
  {
    v88 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverPhoneticsFeedback:", v88);
    goto LABEL_37;
  }
  +[VOSSettingsItem MediaDescriptions](VOSSettingsItem, "MediaDescriptions");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  if (v29 == v7)
  {
    v89 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverDescribedMedia:", v89);
    goto LABEL_37;
  }
  +[VOSSettingsItem CaptionPanel](VOSSettingsItem, "CaptionPanel");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  if (v30 == v7)
  {
    v90 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setEnableVoiceOverCaptions:", v90);
    goto LABEL_37;
  }
  +[VOSSettingsItem LargeCursor](VOSSettingsItem, "LargeCursor");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  if (v31 == v7)
  {
    v91 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverLargeCursorEnabled:", v91);
    goto LABEL_37;
  }
  +[VOSSettingsItem Activities](VOSSettingsItem, "Activities");
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (v32 == v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v6, "isEqual:", v92);

    if (v93)
    {

      v6 = 0;
    }
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v43 = objc_claimAutoreleasedReturnValue();
    -[NSObject setVoiceOverSelectedActivity:](v43, "setVoiceOverSelectedActivity:", v6);
    goto LABEL_33;
  }
  +[VOSSettingsItem Punctuation](VOSSettingsItem, "Punctuation");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  if (v33 == v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v6, "isEqual:", v94);

    if (v95)
    {

      v6 = 0;
    }
    objc_msgSend(v6, "uuid");
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setVoiceOverPunctuationGroup:", v43);
    goto LABEL_42;
  }
  objc_msgSend(v7, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("ScreenCurtain"));

  if (v35)
  {
    v36 = objc_msgSend(v6, "BOOLValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverScreenCurtainEnabled:", v36);
LABEL_37:

    goto LABEL_38;
  }
  +[VOSSettingsItem TypingStyle](VOSSettingsItem, "TypingStyle");
  v96 = (id)objc_claimAutoreleasedReturnValue();

  if (v96 == v7)
  {
    v103 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverTypingMode:", v103);
    goto LABEL_37;
  }
  +[VOSSettingsItem SoftwareTypingFeedback](VOSSettingsItem, "SoftwareTypingFeedback");
  v97 = (id)objc_claimAutoreleasedReturnValue();

  if (v97 == v7)
  {
    v104 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverSoftwareTypingFeedback:", v104);
    goto LABEL_37;
  }
  +[VOSSettingsItem HardwareTypingFeedback](VOSSettingsItem, "HardwareTypingFeedback");
  v98 = (id)objc_claimAutoreleasedReturnValue();

  if (v98 == v7)
  {
    v105 = objc_msgSend(v6, "integerValue");
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setVoiceOverHardwareTypingFeedback:", v105);
    goto LABEL_37;
  }
  +[VOSSettingsItem SlideToType](VOSSettingsItem, "SlideToType");
  v99 = (id)objc_claimAutoreleasedReturnValue();

  if (v99 == v7)
  {
    v106 = objc_msgSend(v6, "BOOLValue");
    +[VOSSettingsHelper sharedInstance](VOSSettingsHelper, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSlideToTypeEnabled:", v106);
    goto LABEL_37;
  }
  +[VOSSettingsItem BrailleAutoAdvanceDuration](VOSSettingsItem, "BrailleAutoAdvanceDuration");
  v100 = (id)objc_claimAutoreleasedReturnValue();

  if (v100 != v7)
  {
    +[VOSSettingsItem BrailleInput](VOSSettingsItem, "BrailleInput");
    v101 = (id)objc_claimAutoreleasedReturnValue();

    if (v101 == v7)
    {
      objc_msgSend(v6, "stringValue");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "setVoiceOverTouchBrailleDisplayInputTableIdentifier:", v111);
    }
    else
    {
      +[VOSSettingsItem BrailleOutput](VOSSettingsItem, "BrailleOutput");
      v102 = (id)objc_claimAutoreleasedReturnValue();

      if (v102 != v7)
      {
        VOTLogCommon();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v116 = v7;
          _os_log_impl(&dword_211371000, v43, OS_LOG_TYPE_DEFAULT, "Unhandled pref setter for item: %@", buf, 0xCu);
        }
        goto LABEL_33;
      }
      objc_msgSend(v6, "stringValue");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "setVoiceOverTouchBrailleDisplayOutputTableIdentifier:", v111);
    }

    -[VOSSettingsHelper _turnOffBrailleIOSyncIfNeeded](self, "_turnOffBrailleIOSyncIfNeeded");
    goto LABEL_38;
  }
  v107 = *MEMORY[0x24BE008E8];
  v108 = *MEMORY[0x24BE008E0] - *MEMORY[0x24BE008E8];
  objc_msgSend(v6, "floatValue");
  v110 = v107 + v108 * v109;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v43 = objc_claimAutoreleasedReturnValue();
  -[NSObject setVoiceOverBrailleAutoAdvanceDuration:](v43, "setVoiceOverBrailleAutoAdvanceDuration:", v110);
LABEL_33:

LABEL_38:
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = CFSTR("SettingsItem");
  v114 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "postNotificationName:object:userInfo:", CFSTR("VOSDidUpdateValueForSettingsItemNotification"), self, v49);

}

- (void)_turnOffBrailleIOSyncIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voiceOverTouchBrailleDisplayInputTableIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceOverTouchBrailleDisplayOutputTableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVoiceOverTouchBrailleDisplaySyncInputOutputTables:", 0);

  }
}

- (id)nameForItem:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v3 = a3;
  +[VOSSettingsItem PhoneticFeedback](VOSSettingsItem, "PhoneticFeedback");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    v31 = CFSTR("PHONETICS_TITLE");
    goto LABEL_43;
  }
  +[VOSSettingsItem MediaDescriptions](VOSSettingsItem, "MediaDescriptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v3)
  {
    v31 = CFSTR("MEDIA_DESC_TITLE");
    goto LABEL_43;
  }
  +[VOSSettingsItem Pitch](VOSSettingsItem, "Pitch");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v3)
  {
    v31 = CFSTR("PITCH_CHANGES_TITLE");
    goto LABEL_43;
  }
  +[VOSSettingsItem RotorActionConfirmation](VOSSettingsItem, "RotorActionConfirmation");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v3)
  {
    v31 = CFSTR("ACTION_CONFIRMATION_EXTENDED");
    goto LABEL_43;
  }
  +[VOSSettingsItem NavigateImages](VOSSettingsItem, "NavigateImages");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v3)
  {
    v31 = CFSTR("NAVIGATE_IMAGES_TITLE");
    goto LABEL_43;
  }
  +[VOSSettingsItem GestureDirection](VOSSettingsItem, "GestureDirection");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 != v3)
  {
    +[VOSSettingsItem Activities](VOSSettingsItem, "Activities");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v3)
    {
      v31 = CFSTR("ACTIVITIES");
      goto LABEL_43;
    }
    +[VOSSettingsItem Punctuation](VOSSettingsItem, "Punctuation");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v3)
    {
      v31 = CFSTR("PUNCTUATION");
      goto LABEL_43;
    }
    +[VOSSettingsItem SoftwareTypingFeedback](VOSSettingsItem, "SoftwareTypingFeedback");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v3)
    {
      v31 = CFSTR("SOFTWARE_TYPING_FEEDBACK");
      goto LABEL_43;
    }
    +[VOSSettingsItem HardwareTypingFeedback](VOSSettingsItem, "HardwareTypingFeedback");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v3)
    {
      v31 = CFSTR("HARDWARE_TYPING_FEEDBACK");
      goto LABEL_43;
    }
    +[VOSSettingsItem SendToHDMI](VOSSettingsItem, "SendToHDMI");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v3)
    {
      v31 = CFSTR("ROUTE_TO_HDMI");
      goto LABEL_43;
    }
    +[VOSSettingsItem SoundCurtain](VOSSettingsItem, "SoundCurtain");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v3)
    {
      v31 = CFSTR("SOUND_CURTAIN");
      goto LABEL_43;
    }
    +[VOSSettingsItem CaptionPanel](VOSSettingsItem, "CaptionPanel");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 == v3)
    {
      v31 = CFSTR("CAPTION_PANEL");
      goto LABEL_43;
    }
    +[VOSSettingsItem LargeCursor](VOSSettingsItem, "LargeCursor");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 == v3)
    {
      v31 = CFSTR("CURSOR_STYLE");
      goto LABEL_43;
    }
    +[VOSSettingsItem SpeakNotifications](VOSSettingsItem, "SpeakNotifications");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18 == v3)
    {
      v31 = CFSTR("ALWAYS_SPEAK_NOTIFICATIONS");
      goto LABEL_43;
    }
    +[VOSSettingsItem BrailleAlerts](VOSSettingsItem, "BrailleAlerts");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 == v3)
    {
      v35 = CFSTR("BRAILLE_DISPLAY_TIMEOUT");
    }
    else
    {
      +[VOSSettingsItem BrailleFormatting](VOSSettingsItem, "BrailleFormatting");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (v20 != v3)
      {
        +[VOSSettingsItem ScreenRecognition](VOSSettingsItem, "ScreenRecognition");
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (v21 == v3)
        {
          objc_msgSend(v3, "settingsData");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "frontmostAppIdentifier");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            v38 = (void *)MEMORY[0x24BDD17C8];
            v39 = CFSTR("VO_SCREEN_RECOGNITION_WITH_APP");
LABEL_59:
            AXVoiceOverSettingsLocalizedStringForKey(v39);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "settingsData");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "frontmostAppIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            AXAppNameForBundleId();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", v43, v50);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_60;
          }
          v31 = CFSTR("VO_SCREEN_RECOGNITION");
        }
        else
        {
          +[VOSSettingsItem LiveRegions](VOSSettingsItem, "LiveRegions");
          v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22 == v3)
          {
            objc_msgSend(v3, "settingsData");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "webAreaURL");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              v42 = (void *)MEMORY[0x24BDD17C8];
              AXVoiceOverSettingsLocalizedStringForKey(CFSTR("VO_LIVE_REGION_WITH_APP"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "settingsData");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "webAreaURL");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "stringWithFormat:", v43, v45);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_60:

              goto LABEL_45;
            }
            objc_msgSend(v3, "settingsData");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "frontmostAppIdentifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            if (v49)
            {
              v38 = (void *)MEMORY[0x24BDD17C8];
              v39 = CFSTR("VO_LIVE_REGION_WITH_APP");
              goto LABEL_59;
            }
            v31 = CFSTR("VO_LIVE_REGION_WITH_APP");
          }
          else
          {
            +[VOSSettingsItem ImageDescriptions](VOSSettingsItem, "ImageDescriptions");
            v23 = (id)objc_claimAutoreleasedReturnValue();

            if (v23 != v3)
            {
              +[VOSSettingsItem BrailleAutoAdvanceDuration](VOSSettingsItem, "BrailleAutoAdvanceDuration");
              v24 = (id)objc_claimAutoreleasedReturnValue();

              if (v24 == v3)
              {
                v31 = CFSTR("BRAILLE_AUTO_ADVANCE_DURATION");
              }
              else
              {
                +[VOSSettingsItem DirectTouch](VOSSettingsItem, "DirectTouch");
                v25 = (id)objc_claimAutoreleasedReturnValue();

                if (v25 == v3)
                {
                  v31 = CFSTR("DIRECT_TOUCH");
                }
                else
                {
                  +[VOSSettingsItem Voice](VOSSettingsItem, "Voice");
                  v26 = (id)objc_claimAutoreleasedReturnValue();

                  if (v26 == v3)
                  {
                    v31 = CFSTR("QUICK_SETTINGS_ITEM_VO_VOICE");
                  }
                  else
                  {
                    +[VOSSettingsItem BrailleInput](VOSSettingsItem, "BrailleInput");
                    v27 = (id)objc_claimAutoreleasedReturnValue();

                    if (v27 == v3)
                    {
                      v31 = CFSTR("BRAILLE_INPUT");
                    }
                    else
                    {
                      +[VOSSettingsItem BrailleOutput](VOSSettingsItem, "BrailleOutput");
                      v28 = (id)objc_claimAutoreleasedReturnValue();

                      if (v28 == v3)
                      {
                        v31 = CFSTR("BRAILLE_OUTPUT");
                      }
                      else
                      {
                        objc_msgSend(v3, "identifier");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("ScreenCurtain"));

                        if (!v30)
                        {
                          objc_msgSend(v3, "localizedName");
                          v32 = objc_claimAutoreleasedReturnValue();
                          goto LABEL_44;
                        }
                        v31 = CFSTR("SCREEN_CURTAIN");
                      }
                    }
                  }
                }
              }
              goto LABEL_43;
            }
            objc_msgSend(v3, "settingsData");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "frontmostAppIdentifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (v47)
            {
              v38 = (void *)MEMORY[0x24BDD17C8];
              v39 = CFSTR("VO_IMAGE_DESCRIPTIONS_WITH_APP");
              goto LABEL_59;
            }
            v31 = CFSTR("VO_IMAGE_DESCRIPTIONS");
          }
        }
LABEL_43:
        AXVoiceOverSettingsLocalizedStringForKey(v31);
        v32 = objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
      v35 = CFSTR("BRAILLE_TEXT_FORMATTING");
    }
    soft_AXUILocalizedStringForKey(v35);
    v32 = objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  AXVoiceOverRotorLocString();
  v32 = objc_claimAutoreleasedReturnValue();
LABEL_44:
  v33 = (void *)v32;
LABEL_45:

  return v33;
}

- (id)identifierForItem:(id)a3
{
  return (id)objc_msgSend(a3, "identifier");
}

- (id)possibleValuesForSettingsItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t i;
  void *v35;
  void *v36;
  int v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  void *v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[VOSSettingsItem NavigationStyle](VOSSettingsItem, "NavigationStyle");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v21 = &unk_24CBBC6F0;
    goto LABEL_20;
  }
  +[VOSSettingsItem TypingStyle](VOSSettingsItem, "TypingStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    v21 = &unk_24CBBC708;
    goto LABEL_20;
  }
  +[VOSSettingsItem SoftwareTypingFeedback](VOSSettingsItem, "SoftwareTypingFeedback");
  v7 = objc_claimAutoreleasedReturnValue();
  if ((id)v7 == v4)
  {

    goto LABEL_19;
  }
  v8 = (void *)v7;
  +[VOSSettingsItem HardwareTypingFeedback](VOSSettingsItem, "HardwareTypingFeedback");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
LABEL_19:
    v21 = &unk_24CBBC720;
    goto LABEL_20;
  }
  +[VOSSettingsItem PhoneticFeedback](VOSSettingsItem, "PhoneticFeedback");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    v21 = &unk_24CBBC738;
    goto LABEL_20;
  }
  +[VOSSettingsItem MediaDescriptions](VOSSettingsItem, "MediaDescriptions");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    v21 = &unk_24CBBC750;
    goto LABEL_20;
  }
  +[VOSSettingsItem NavigateImages](VOSSettingsItem, "NavigateImages");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    v21 = &unk_24CBBC768;
    goto LABEL_20;
  }
  +[VOSSettingsItem GestureDirection](VOSSettingsItem, "GestureDirection");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v4)
  {
    v21 = &unk_24CBBC780;
    goto LABEL_20;
  }
  +[VOSSettingsItem AudioDucking](VOSSettingsItem, "AudioDucking");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v4)
  {
    v21 = &unk_24CBBC798;
    goto LABEL_20;
  }
  +[VOSSettingsItem Activities](VOSSettingsItem, "Activities");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "voiceOverActivities");
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_28:
    v27 = (void *)v26;
    objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  +[VOSSettingsItem Punctuation](VOSSettingsItem, "Punctuation");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFF778], "sharedDatabase");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "punctuationGroups");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  +[VOSSettingsItem BrailleInput](VOSSettingsItem, "BrailleInput");
  v17 = objc_claimAutoreleasedReturnValue();
  if ((id)v17 == v4)
  {

  }
  else
  {
    v18 = (void *)v17;
    +[VOSSettingsItem BrailleOutput](VOSSettingsItem, "BrailleOutput");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19 != v4)
    {
      +[VOSSettingsItem Voice](VOSSettingsItem, "Voice");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (v20 == v4)
      {
        v21 = (void *)objc_opt_new();
        -[VOSSettingsHelper enabledVoices](self, "enabledVoices");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "count");

        if (v48)
        {
          v49 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v50);

            ++v49;
            -[VOSSettingsHelper enabledVoices](self, "enabledVoices");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "count");

          }
          while (v52 > v49);
        }
      }
      else
      {
        v21 = (void *)MEMORY[0x24BDBD1A8];
      }
      goto LABEL_20;
    }
  }
  v53 = v4;
  v28 = (void *)_AXSVoiceOverTouchCopyBrailleLanguageRotorItems();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v28, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v56;
    v33 = CFSTR("Enabled");
    v54 = v21;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v56 != v32)
          objc_enumerationMutation(v29);
        v35 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v35, "objectForKeyedSubscript:", v33, v53);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "BOOLValue");

        if (v37)
        {
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("RotorItem"));
          v38 = (id)objc_claimAutoreleasedReturnValue();
          if (!v38)
          {
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("LanguageDefaults"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "userLocale");
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v41, "localeIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectForKeyedSubscript:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              v38 = v43;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BE0FC68], "defaultTableForLocale:", v41);
              v44 = v33;
              v45 = v29;
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "identifier");
              v38 = (id)objc_claimAutoreleasedReturnValue();

              v29 = v45;
              v33 = v44;
              v21 = v54;
            }

          }
          objc_msgSend(v21, "addObject:", v38);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v31);
  }

  v4 = v53;
LABEL_20:

  return v21;
}

- (BOOL)isItemSupported:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;

  v4 = a3;
  +[VOSSettingsItem ImageDescriptions](VOSSettingsItem, "ImageDescriptions");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "voiceOverImageCaptionsEnabled"))
    {
LABEL_10:
      v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "physicalMemory") <= 0x773593FF)
      v9 = 0;
    else
      v9 = AXRuntimeCheck_HasANE();

    goto LABEL_15;
  }
  +[VOSSettingsItem ScreenRecognition](VOSSettingsItem, "ScreenRecognition");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "automaticAccessibilityEnabled"))
      goto LABEL_10;
    goto LABEL_7;
  }
  +[VOSSettingsItem LiveRegions](VOSSettingsItem, "LiveRegions");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v9 = 1;
    goto LABEL_16;
  }
  +[VOSSettingsItem GestureDirection](VOSSettingsItem, "GestureDirection");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "anyUserPreferredLangaugeIsRTL");
    goto LABEL_15;
  }
  v9 = -[VOSSettingsHelper itemIsSupportedForPlatform:](self, "itemIsSupportedForPlatform:", v4);
LABEL_16:

  return v9;
}

- (id)_formatterForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v28;

  v4 = a3;
  +[VOSSettingsItem Volume](VOSSettingsItem, "Volume");
  v5 = objc_claimAutoreleasedReturnValue();
  if ((id)v5 == v4)
  {

    goto LABEL_20;
  }
  v6 = (void *)v5;
  +[VOSSettingsItem SpeakingRate](VOSSettingsItem, "SpeakingRate");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
LABEL_20:
    +[VOSSettingsHelper percentageFormatter](VOSSettingsHelper, "percentageFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_21:
    v25 = (void *)v26;
    goto LABEL_22;
  }
  +[VOSSettingsItem NavigationStyle](VOSSettingsItem, "NavigationStyle");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    +[VOSSettingsHelper navigationStyleFormatter](VOSSettingsHelper, "navigationStyleFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem PhoneticFeedback](VOSSettingsItem, "PhoneticFeedback");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4)
  {
    +[VOSSettingsHelper phoneticFeedbackFormatter](VOSSettingsHelper, "phoneticFeedbackFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem MediaDescriptions](VOSSettingsItem, "MediaDescriptions");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
    +[VOSSettingsHelper mediaDescriptionsFormatter](VOSSettingsHelper, "mediaDescriptionsFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem NavigateImages](VOSSettingsItem, "NavigateImages");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    +[VOSSettingsHelper navigateImagesFormatter](VOSSettingsHelper, "navigateImagesFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem GestureDirection](VOSSettingsItem, "GestureDirection");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    +[VOSSettingsHelper gestureDirectionFormatter](VOSSettingsHelper, "gestureDirectionFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem Activities](VOSSettingsItem, "Activities");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v4)
  {
    +[VOSSettingsHelper activitiesFormatter](VOSSettingsHelper, "activitiesFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem Punctuation](VOSSettingsItem, "Punctuation");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v4)
  {
    +[VOSSettingsHelper punctuationFormatter](VOSSettingsHelper, "punctuationFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem TypingStyle](VOSSettingsItem, "TypingStyle");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v4)
  {
    +[VOSSettingsHelper typingStyleFormatter](VOSSettingsHelper, "typingStyleFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem SoftwareTypingFeedback](VOSSettingsItem, "SoftwareTypingFeedback");
  v16 = objc_claimAutoreleasedReturnValue();
  if ((id)v16 == v4)
  {

    goto LABEL_32;
  }
  v17 = (void *)v16;
  +[VOSSettingsItem HardwareTypingFeedback](VOSSettingsItem, "HardwareTypingFeedback");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18 == v4)
  {
LABEL_32:
    +[VOSSettingsHelper typingFeedbackFormatter](VOSSettingsHelper, "typingFeedbackFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem BrailleAutoAdvanceDuration](VOSSettingsItem, "BrailleAutoAdvanceDuration");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (v19 == v4)
  {
    +[VOSSettingsHelper durationFormatter](VOSSettingsHelper, "durationFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem Voice](VOSSettingsItem, "Voice");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20 == v4)
  {
    -[VOSSettingsHelper enabledVoices](self, "enabledVoices");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[VOSSettingsHelper voiceFormatterForEnabledVoiceCodes:](VOSSettingsHelper, "voiceFormatterForEnabledVoiceCodes:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  +[VOSSettingsItem BrailleInput](VOSSettingsItem, "BrailleInput");
  v21 = objc_claimAutoreleasedReturnValue();
  if ((id)v21 == v4)
  {

    goto LABEL_36;
  }
  v22 = (void *)v21;
  +[VOSSettingsItem BrailleOutput](VOSSettingsItem, "BrailleOutput");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23 == v4)
  {
LABEL_36:
    +[VOSSettingsHelper brailleTableFormatter](VOSSettingsHelper, "brailleTableFormatter");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  +[VOSSettingsItem AudioDucking](VOSSettingsItem, "AudioDucking");
  v24 = (id)objc_claimAutoreleasedReturnValue();

  if (v24 == v4)
  {
    +[VOSSettingsHelper audioDuckingMode](VOSSettingsHelper, "audioDuckingMode");
    v26 = objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  v25 = 0;
LABEL_22:

  return v25;
}

- (id)formattedValue:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[VOSSettingsHelper _formatterForItem:](self, "_formatterForItem:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "itemType"))
      {
        VOTLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v14 = 138412546;
          v15 = v6;
          v16 = 2112;
          v17 = v7;
          _os_log_impl(&dword_211371000, v12, OS_LOG_TYPE_DEFAULT, "Error. no formatter provided to format value: '%@'. item: %@", (uint8_t *)&v14, 0x16u);
        }

      }
      objc_msgSend(v6, "description");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)scaledValue:(id)a3 withItem:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  +[VOSSettingsItem BrailleAutoAdvanceDuration](VOSSettingsItem, "BrailleAutoAdvanceDuration");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v9, "numberWithDouble:", (v10 - *MEMORY[0x24BE008E8]) / (*MEMORY[0x24BE008E0] - *MEMORY[0x24BE008E8]));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v11 = v8;

  return v11;
}

+ (id)percentageFormatter
{
  if (percentageFormatter_onceToken != -1)
    dispatch_once(&percentageFormatter_onceToken, &__block_literal_global_290_0);
  return _Block_copy((const void *)percentageFormatter_formatter);
}

void __40__VOSSettingsHelper_percentageFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)percentageFormatter_formatter;
  percentageFormatter_formatter = (uint64_t)&__block_literal_global_292_0;

}

uint64_t __40__VOSSettingsHelper_percentageFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "floatValue");
  return AXFormatFloatWithPercentage();
}

+ (id)durationFormatter
{
  if (durationFormatter_onceToken != -1)
    dispatch_once(&durationFormatter_onceToken, &__block_literal_global_293_0);
  return _Block_copy((const void *)durationFormatter_formatter);
}

void __38__VOSSettingsHelper_durationFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)durationFormatter_formatter;
  durationFormatter_formatter = (uint64_t)&__block_literal_global_294_0;

}

id __38__VOSSettingsHelper_durationFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  float v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v2 = a2;
  objc_msgSend(v2, "floatValue");
  v4 = v3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v5 = getAXLocalizedTimeSummarySymbolLoc_ptr;
  v13 = getAXLocalizedTimeSummarySymbolLoc_ptr;
  if (!getAXLocalizedTimeSummarySymbolLoc_ptr)
  {
    v6 = (void *)AccessibilityUIUtilitiesLibrary();
    v5 = dlsym(v6, "AXLocalizedTimeSummary");
    v11[3] = (uint64_t)v5;
    getAXLocalizedTimeSummarySymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    v9 = (_Unwind_Exception *)soft_AXUILocalizedStringForKey_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  ((void (*)(_QWORD, double))v5)(0, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)typingFeedbackFormatter
{
  if (typingFeedbackFormatter_onceToken != -1)
    dispatch_once(&typingFeedbackFormatter_onceToken, &__block_literal_global_295_0);
  return _Block_copy((const void *)typingFeedbackFormatter_formatter);
}

void __44__VOSSettingsHelper_typingFeedbackFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)typingFeedbackFormatter_formatter;
  typingFeedbackFormatter_formatter = (uint64_t)&__block_literal_global_296_0;

}

id __44__VOSSettingsHelper_typingFeedbackFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    AXVoiceOverSettingsTypingFeedbackLocalizedStringForKey(off_24CBAD6C8[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)audioDuckingMode
{
  if (audioDuckingMode_onceToken != -1)
    dispatch_once(&audioDuckingMode_onceToken, &__block_literal_global_305_0);
  return _Block_copy((const void *)audioDuckingMode_formatter);
}

void __37__VOSSettingsHelper_audioDuckingMode__block_invoke()
{
  void *v0;

  v0 = (void *)audioDuckingMode_formatter;
  audioDuckingMode_formatter = (uint64_t)&__block_literal_global_306_0;

}

id __37__VOSSettingsHelper_audioDuckingMode__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    AXVoiceOverSettingsLocalizedStringForKey(off_24CBAD6E8[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)typingStyleFormatter
{
  if (typingStyleFormatter_onceToken != -1)
    dispatch_once(&typingStyleFormatter_onceToken, &__block_literal_global_313_0);
  return _Block_copy((const void *)typingStyleFormatter_formatter);
}

void __41__VOSSettingsHelper_typingStyleFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)typingStyleFormatter_formatter;
  typingStyleFormatter_formatter = (uint64_t)&__block_literal_global_314_0;

}

id __41__VOSSettingsHelper_typingStyleFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    VOSLocString(off_24CBAD700[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)brailleInputOutputFormatter
{
  if (brailleInputOutputFormatter_onceToken != -1)
    dispatch_once(&brailleInputOutputFormatter_onceToken, &__block_literal_global_321_0);
  return _Block_copy((const void *)brailleInputOutputFormatter_formatter);
}

void __48__VOSSettingsHelper_brailleInputOutputFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)brailleInputOutputFormatter_formatter;
  brailleInputOutputFormatter_formatter = (uint64_t)&__block_literal_global_322_0;

}

id __48__VOSSettingsHelper_brailleInputOutputFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "integerValue") - 1;
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    AXVoiceOverBrailleOptionsLocalizedStringForKey(off_24CBAD718[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)phoneticFeedbackFormatter
{
  if (phoneticFeedbackFormatter_onceToken != -1)
    dispatch_once(&phoneticFeedbackFormatter_onceToken, &__block_literal_global_329_0);
  return _Block_copy((const void *)phoneticFeedbackFormatter_formatter);
}

void __46__VOSSettingsHelper_phoneticFeedbackFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)phoneticFeedbackFormatter_formatter;
  phoneticFeedbackFormatter_formatter = (uint64_t)&__block_literal_global_330_0;

}

id __46__VOSSettingsHelper_phoneticFeedbackFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    AXVoiceOverSettingsLocalizedStringForKey(off_24CBAD730[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)mediaDescriptionsFormatter
{
  if (mediaDescriptionsFormatter_onceToken != -1)
    dispatch_once(&mediaDescriptionsFormatter_onceToken, &__block_literal_global_337_0);
  return _Block_copy((const void *)mediaDescriptionsFormatter_formatter);
}

void __47__VOSSettingsHelper_mediaDescriptionsFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)mediaDescriptionsFormatter_formatter;
  mediaDescriptionsFormatter_formatter = (uint64_t)&__block_literal_global_338_0;

}

id __47__VOSSettingsHelper_mediaDescriptionsFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  switch(objc_msgSend(a2, "integerValue"))
  {
    case 0:
    case 1:
    case 2:
    case 3:
      AXParameterizedLocalizedString();
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)navigationStyleFormatter
{
  if (navigationStyleFormatter_onceToken != -1)
    dispatch_once(&navigationStyleFormatter_onceToken, &__block_literal_global_349_0);
  return _Block_copy((const void *)navigationStyleFormatter_formatter);
}

void __45__VOSSettingsHelper_navigationStyleFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)navigationStyleFormatter_formatter;
  navigationStyleFormatter_formatter = (uint64_t)&__block_literal_global_350_0;

}

id __45__VOSSettingsHelper_navigationStyleFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2)
  {
    if (v2 != 1)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("VOSPref.item.value.groupedNavigation");
  }
  else
  {
    v3 = CFSTR("VOSPref.item.value.flatNavigation");
  }
  VOSLocString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

+ (id)gestureDirectionFormatter
{
  if (gestureDirectionFormatter_onceToken != -1)
    dispatch_once(&gestureDirectionFormatter_onceToken, &__block_literal_global_355_0);
  return _Block_copy((const void *)gestureDirectionFormatter_formatter);
}

void __46__VOSSettingsHelper_gestureDirectionFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)gestureDirectionFormatter_formatter;
  gestureDirectionFormatter_formatter = (uint64_t)&__block_literal_global_356_0;

}

id __46__VOSSettingsHelper_gestureDirectionFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 2)
  {
    v3 = 0;
  }
  else
  {
    AXVoiceOverLocalizedStringForKey(off_24CBAD748[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)navigateImagesFormatter
{
  if (navigateImagesFormatter_onceToken != -1)
    dispatch_once(&navigateImagesFormatter_onceToken, &__block_literal_global_363_0);
  return _Block_copy((const void *)navigateImagesFormatter_formatter);
}

void __44__VOSSettingsHelper_navigateImagesFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)navigateImagesFormatter_formatter;
  navigateImagesFormatter_formatter = (uint64_t)&__block_literal_global_364_0;

}

id __44__VOSSettingsHelper_navigateImagesFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;

  v2 = objc_msgSend(a2, "integerValue");
  if (v2 > 3)
  {
    v3 = 0;
  }
  else
  {
    AXVoiceOverSettingsLocalizedStringForKey(off_24CBAD760[v2]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)punctuationFormatter
{
  if (punctuationFormatter_onceToken != -1)
    dispatch_once(&punctuationFormatter_onceToken, &__block_literal_global_371_1);
  return _Block_copy((const void *)punctuationFormatter_formatter);
}

void __41__VOSSettingsHelper_punctuationFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)punctuationFormatter_formatter;
  punctuationFormatter_formatter = (uint64_t)&__block_literal_global_372_0;

}

id __41__VOSSettingsHelper_punctuationFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  void *v6;

  v2 = a2;
  if (!v2)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {

LABEL_6:
    soft_AXUILocalizedStringForKey(CFSTR("OFF"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

+ (id)activitiesFormatter
{
  if (activitiesFormatter_onceToken != -1)
    dispatch_once(&activitiesFormatter_onceToken, &__block_literal_global_376_1);
  return _Block_copy((const void *)activitiesFormatter_formatter);
}

void __40__VOSSettingsHelper_activitiesFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)activitiesFormatter_formatter;
  activitiesFormatter_formatter = (uint64_t)&__block_literal_global_377_1;

}

id __40__VOSSettingsHelper_activitiesFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  void *v6;

  v2 = a2;
  if (!v2)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {

LABEL_6:
    soft_AXUILocalizedStringForKey(CFSTR("OFF"));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v2, "name");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

+ (id)brailleTableFormatter
{
  if (brailleTableFormatter_onceToken != -1)
    dispatch_once(&brailleTableFormatter_onceToken, &__block_literal_global_379_0);
  return _Block_copy((const void *)brailleTableFormatter_formatter);
}

void __42__VOSSettingsHelper_brailleTableFormatter__block_invoke()
{
  void *v0;

  v0 = (void *)brailleTableFormatter_formatter;
  brailleTableFormatter_formatter = (uint64_t)&__block_literal_global_380_0;

}

id __42__VOSSettingsHelper_brailleTableFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)MEMORY[0x24BE0FC60];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithIdentifier:", v3);

  objc_msgSend(v4, "localizedNameWithService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)voiceFormatterForEnabledVoiceCodes:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;

  v3 = a3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__VOSSettingsHelper_voiceFormatterForEnabledVoiceCodes___block_invoke;
  aBlock[3] = &unk_24CBAD690;
  v9 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  v6 = _Block_copy(v5);

  return v6;
}

id __56__VOSSettingsHelper_voiceFormatterForEnabledVoiceCodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = a2;
  if (objc_msgSend(v3, "integerValue"))
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voiceOverVoiceRotors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v3, "integerValue") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "userDefinedName");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v6, "userDefinedName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", &stru_24CBADC48);

      if ((v10 & 1) == 0)
      {
        objc_msgSend(v6, "userDefinedName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = &stru_24CBADC48;
        goto LABEL_8;
      }
    }
    objc_msgSend(v6, "selection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "voiceId");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  AXVoiceNameForVoiceId();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB6218], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resourceWithVoiceId:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "language");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dialectForLanguageID:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "languageNameAndLocaleInCurrentLocale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), v6, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v19;
}

- (NSArray)enabledVoices
{
  return self->_enabledVoices;
}

- (void)setEnabledVoices:(id)a3
{
  objc_storeStrong((id *)&self->_enabledVoices, a3);
}

- (double)sliderMaxValue
{
  return self->_sliderMaxValue;
}

- (void)setSliderMaxValue:(double)a3
{
  self->_sliderMaxValue = a3;
}

- (double)sliderMinValue
{
  return self->_sliderMinValue;
}

- (void)setSliderMinValue:(double)a3
{
  self->_sliderMinValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledVoices, 0);
}

@end
