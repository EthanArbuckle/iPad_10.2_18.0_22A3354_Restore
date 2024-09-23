@implementation CACSpokenCommandManager

+ (id)sharedCACSpokenCommandManager
{
  if (sharedCACSpokenCommandManager_singletonInit != -1)
    dispatch_once(&sharedCACSpokenCommandManager_singletonInit, &__block_literal_global_16);
  return (id)sCACSpokenCommandManager;
}

void __56__CACSpokenCommandManager_sharedCACSpokenCommandManager__block_invoke()
{
  CACSpokenCommandManager *v0;
  void *v1;

  v0 = objc_alloc_init(CACSpokenCommandManager);
  v1 = (void *)sCACSpokenCommandManager;
  sCACSpokenCommandManager = (uint64_t)v0;

}

+ (id)capitalizedStringFromString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "length");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__CACSpokenCommandManager_capitalizedStringFromString___block_invoke;
  v16[3] = &unk_24F2AB980;
  v17 = v8;
  v11 = v9;
  v18 = v11;
  v12 = v8;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v16);

  v13 = v18;
  v14 = v11;

  return v14;
}

void __55__CACSpokenCommandManager_capitalizedStringFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_msgSend(a2, "capitalizedStringWithLocale:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", a3, a4, v7);

}

+ (id)hardwareEvaluatorKeys
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v3[0] = kCACCommandContextRequires3DTouchHardware;
  v3[1] = kCACCommandContextRequiresRingerSwitch;
  v3[2] = kCACCommandContextRequiresIPad;
  v3[3] = kCACCommandContextRequiresAppleVision;
  v3[4] = kCACCommandContextPreventWithAppleVision;
  v3[5] = kCACCommandContextRequiresCameraButton;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)doesEvaluatorKey:(id)a3 matchValue:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  __CFString *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  BOOL v21;
  int v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  Boolean keyExistsAndHasValidFormat;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (__CFString *)a4;
  objc_msgSend((id)sEvaluatorValueCache, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if (v8)
  {
    objc_msgSend((id)sEvaluatorResultCache, "objectForKey:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v9, "BOOLValue");

    goto LABEL_20;
  }
  if ((objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresFocusedStaticText) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresFocusedEditableText))
  {
    objc_msgSend((id)sCACSpokenCommandManager, "focusedElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = sCACSpokenCommandManager;
    if (sCACSpokenCommandManager)
      v12 = *(unsigned __int8 *)(sCACSpokenCommandManager + 368) != 0;
    if (v11 && !v12)
      goto LABEL_9;
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresInteractionLevel))
  {
    v13 = objc_msgSend((id)sCACSpokenCommandManager, "currentInteractionLevel");
LABEL_14:
    v10 = v13 == -[__CFString integerValue](v6, "integerValue");
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextSupportsInteractionLevel))
  {
    v13 = objc_msgSend((id)sCACSpokenCommandManager, "currentInteractionLevel");
    if (v13)
      goto LABEL_14;
LABEL_9:
    v10 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresActiveDictationRecognizerMode))
  {
    if (objc_msgSend((id)sCACSpokenCommandManager, "dictationRecognizerMode") != 1)
      goto LABEL_9;
LABEL_17:
    v10 = -[__CFString BOOLValue](v6, "BOOLValue") ^ 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresSpellingModeSupportForLocale))
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString bestLocaleIdentifier](v17, "bestLocaleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)RXLocalesSupportingSpellingMode();
    if (+[CACLocaleUtilities isLocaleIdentifier:containedInLocaleIdentifiers:](CACLocaleUtilities, "isLocaleIdentifier:containedInLocaleIdentifiers:", v18, v19)|| CFPreferencesGetAppBooleanValue(CFSTR("EnableSpellingModeDuringDevelopment"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), 0))
    {
      v10 = 1;
    }
    else
    {
      v10 = -[__CFString BOOLValue](v6, "BOOLValue") ^ 1;
    }
LABEL_25:

LABEL_26:
LABEL_48:

    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresSpellingModeSupportInAsset))
  {
    +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString supportsSpellingMode](v17, "supportsSpellingMode") & 1) != 0
      || CFPreferencesGetAppBooleanValue(CFSTR("EnableSpellingModeDuringDevelopment"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), 0))
    {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresOriginalEmojiCommands))
  {
    if (!CFPreferencesGetAppBooleanValue(CFSTR("UseAssetSupportForEmojiNameRecogition"), CFSTR("com.apple.SpeechRecognitionCore"), 0))goto LABEL_9;
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresSpecifiedBooleanPreferenceKeyIsTrue))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = 1;
    if (v6 && (isKindOfClass & 1) != 0)
    {
      keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(v6, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat))
      {
        v21 = keyExistsAndHasValidFormat == 0;
      }
      else
      {
        v21 = 1;
      }
      v10 = !v21;
    }
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresAnyOverlay))
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isDisplayingAnyOverlay](v17, "isDisplayingAnyOverlay") & 1) == 0)
    {
LABEL_46:
      v22 = -[__CFString BOOLValue](v6, "BOOLValue");
LABEL_47:
      v10 = v22 ^ 1u;
      goto LABEL_48;
    }
LABEL_30:
    v10 = 1;
    goto LABEL_48;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresNumberedElementsOverlay))
  {
    v23 = (void *)sCACSpokenCommandManager;
    v24 = CFSTR("NumberedElements");
    goto LABEL_51;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresAnyNumberedOverlay))
  {
    objc_msgSend((id)sCACSpokenCommandManager, "activeOverlayType");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("NumberedElements")) & 1) != 0
      || (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("NumberedGrid")) & 1) != 0)
    {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresTextDisambiguationNumberedOverlay))
  {
    objc_msgSend((id)sCACSpokenCommandManager, "activeOverlayType");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("NumberedElements")))
    {
      objc_msgSend((id)sCACSpokenCommandManager, "disambiguationHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "labeledElements");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "textMarkerRange");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
        v10 = 1;
      else
        v10 = -[__CFString BOOLValue](v6, "BOOLValue") ^ 1;

      goto LABEL_25;
    }
    goto LABEL_46;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresGridOverlay))
  {
    v23 = (void *)sCACSpokenCommandManager;
    v24 = CFSTR("NumberedGrid");
    goto LABEL_51;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresElementNamesOverlay))
  {
    v23 = (void *)sCACSpokenCommandManager;
    v24 = CFSTR("NamedElements");
LABEL_51:
    if ((objc_msgSend(v23, "isActiveOverlayType:", v24) & 1) != 0)
      goto LABEL_9;
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextPreventDuringAnyPresentation))
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isDisplayingAnyPresentation](v17, "isDisplayingAnyPresentation"))
      goto LABEL_46;
    goto LABEL_30;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextPreventDuringAnyOverlay))
  {
    objc_msgSend((id)sCACSpokenCommandManager, "activeOverlayType");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_46;
    goto LABEL_30;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresOneOfAppIdentifiers))
  {
    v17 = v6;
    if (-[__CFString count](v17, "count"))
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      objc_msgSend((id)sCACSpokenCommandManager, "activeApplications");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
      if (v10)
      {
        v27 = *(_QWORD *)v62;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v62 != v27)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "bundleId");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v29, "length") && -[__CFString containsObject:](v17, "containsObject:", v29))
            {

              v10 = 1;
              goto LABEL_26;
            }

          }
          v10 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v69, 16);
          if (v10)
            continue;
          break;
        }
      }
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextPreventDuringLockScreen)
    || objc_msgSend(v5, "isEqualToString:", kCACCommandContextPreventOniPhoneLockScreen)
    && (+[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v30, "carPlayConnected"),
        v30,
        (v31 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v22 = -[__CFString isScreenLocked](v17, "isScreenLocked");
    goto LABEL_47;
  }
  if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresAnyGesture))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    +[CACSpokenCommandGestureManager allManagers](CACSpokenCommandGestureManager, "allManagers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v58;
LABEL_92:
      v36 = 0;
      while (1)
      {
        if (*(_QWORD *)v58 != v35)
          objc_enumerationMutation(v32);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v36), "isInGesture") & 1) != 0)
          break;
        if (v34 == ++v36)
        {
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v68, 16);
          if (v34)
            goto LABEL_92;
          goto LABEL_109;
        }
      }
LABEL_110:
      v41 = 1;
      goto LABEL_111;
    }
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresDragGesture))
    {
      if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequires3DTouchGesture))
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        +[CACSpokenCommandGestureManager allManagers](CACSpokenCommandGestureManager, "allManagers", 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v50;
          while (2)
          {
            for (j = 0; j != v46; ++j)
            {
              if (*(_QWORD *)v50 != v47)
                objc_enumerationMutation(v44);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "isIn3DTouchGesture") & 1) != 0)
              {

                goto LABEL_9;
              }
            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
            if (v46)
              continue;
            break;
          }
        }

        goto LABEL_17;
      }
      if (!objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresSOS))
      {
        if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresSiri))
        {
          if ((AXDeviceIsSiriAvailable() & 1) != 0)
            goto LABEL_9;
          goto LABEL_17;
        }
        if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresRingerSwitch))
        {
          if ((AXDeviceIsRingerSwitchAvailable() & 1) != 0)
            goto LABEL_9;
          goto LABEL_17;
        }
        if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresSpeakScreen))
        {
          if (UIAccessibilityIsSpeakScreenEnabled())
            goto LABEL_9;
          goto LABEL_17;
        }
        if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresZoom))
        {
          if (_AXSZoomTouchEnabled())
            goto LABEL_9;
          goto LABEL_17;
        }
        if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresSideAppSupport))
        {
          if (!AXDeviceSupportsSideApp())
            goto LABEL_17;
        }
        else
        {
          if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresApplePay))
          {
            if ((AXDeviceCanArmApplePay() & 1) != 0)
              goto LABEL_9;
            goto LABEL_17;
          }
          if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresVoiceOver))
          {
            if (UIAccessibilityIsVoiceOverRunning())
              goto LABEL_9;
            goto LABEL_17;
          }
          if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextPreventWithVoiceOver))
          {
            if (!UIAccessibilityIsVoiceOverRunning())
              goto LABEL_9;
            goto LABEL_17;
          }
          if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresIPad))
          {
            if ((AXDeviceIsPad() & 1) != 0)
              goto LABEL_9;
            goto LABEL_17;
          }
          if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresAppleVision))
          {
            if ((AXDeviceIsRealityDevice() & 1) != 0)
              goto LABEL_9;
            goto LABEL_17;
          }
          if (!objc_msgSend(v5, "isEqualToString:", kCACCommandContextPreventWithAppleVision))
          {
            if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresCameraButton))
            {
              if ((AXDeviceSupportsCameraButton() & 1) != 0)
                goto LABEL_9;
              goto LABEL_17;
            }
            if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequires3DTouchHardware))
            {
              if (AXDeviceHas3DTouch() && !AXDeviceHasLongPress3dTouch())
                goto LABEL_9;
              goto LABEL_17;
            }
            if (!objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresCarPlay))
            {
              if (objc_msgSend(v5, "isEqualToString:", kCACCommandContextRequiresVoiceControlEnabled))
              {
                if (_AXSCommandAndControlEnabled())
                  goto LABEL_9;
              }
              else if (!objc_msgSend(v5, "isEqualToString:", kCACCommandContextPreventShowingCommand))
              {
                goto LABEL_9;
              }
              goto LABEL_17;
            }
            +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if ((-[__CFString carPlayAvailable](v17, "carPlayAvailable") & 1) != 0)
              goto LABEL_30;
            goto LABEL_46;
          }
        }
      }
      if (!AXDeviceIsRealityDevice())
        goto LABEL_9;
      goto LABEL_17;
    }
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    +[CACSpokenCommandGestureManager allManagers](CACSpokenCommandGestureManager, "allManagers");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v54;
LABEL_103:
      v40 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v39)
          objc_enumerationMutation(v32);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v40), "isInDragGesture") & 1) != 0)
          goto LABEL_110;
        if (v38 == ++v40)
        {
          v38 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
          if (v38)
            goto LABEL_103;
          break;
        }
      }
    }
  }
LABEL_109:
  v41 = 0;
LABEL_111:

  +[CACAXDragManager sharedManager](CACAXDragManager, "sharedManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "isDragActive");

  v10 = 1;
  if ((v41 & 1) == 0 && (v43 & 1) == 0)
    goto LABEL_17;
LABEL_18:
  if (sEvaluatorValueCache)
  {
    objc_msgSend((id)sEvaluatorValueCache, "setObject:forKey:", v6, v5);
    v14 = (void *)sEvaluatorResultCache;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v15, v5);

  }
LABEL_20:

  return v10;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  __CFNotificationCenter *v11;
  __CFNotificationCenter *v12;
  void *v13;
  objc_super v14;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("CACNotificationLanguageChanged"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("NotificationAlwaysShowOverlayTypeSettingsChanged"), 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, CFSTR("CACNotificationOverlayFadingSettingsChanged"), 0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, CFSTR("CACNotificationCommandsSettingsChanged"), 0);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, CFSTR("CACNotificationUserHintsSettingsChanged"), 0);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v9, self, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOn"), 0);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v10, self, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOff"), 0);
  v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v11, self, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOnFromInterrupt"), 0);
  v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v12, self, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOffFromInterrupt"), 0);
  if (self->_isAttentionAwareClientRunning)
  {
    +[CACUserAttentionInterface sharedManager](CACUserAttentionInterface, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopUserAttentionControllerIfNeeded");

  }
  v14.receiver = self;
  v14.super_class = (Class)CACSpokenCommandManager;
  -[CACSpokenCommandManager dealloc](&v14, sel_dealloc);
}

- (void)run
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  __CFNotificationCenter *v11;
  __CFNotificationCenter *v12;
  __CFNotificationCenter *v13;
  __CFNotificationCenter *v14;
  void *v15;
  NSString *v16;
  NSString *commandRecognitionLogPath;
  void *v18;
  id v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *externalContextOverrideTable;
  NSMutableArray *v23;
  NSMutableArray *recognizers;
  NSMutableDictionary *v25;
  NSMutableDictionary *oldRXLangaugeObjects;
  NSMutableArray *v27;
  NSMutableArray *recognizedCommandsReadyForDispatch;
  NSMutableDictionary *v29;
  NSMutableDictionary *recognizerInteractionLevels;
  NSMutableDictionary *v31;
  NSMutableDictionary *identifierBasedLanguageModelCache;
  NSMutableArray *v33;
  NSMutableArray *pendingCommandToExecute;
  CACLabeledElementsCollection *v35;
  CACLabeledElementsCollection *labeledScreenElementsCollection;
  void *v37;
  dispatch_queue_t v38;
  OS_dispatch_queue *v39;
  OS_dispatch_queue *commandExecutionDispatchQueue;
  OS_dispatch_queue *v41;
  OS_dispatch_queue *elementFetchingQueue;
  OS_dispatch_queue *v43;
  OS_dispatch_queue *nonScannerElementFetchingQueue;
  OS_dispatch_queue *v45;
  OS_dispatch_queue *perAppElementFetchingQueue;
  void *v47;
  CACAXNotificationObserver *v48;
  CACTouchEventObserver *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  dispatch_time_t v54;
  NSObject *v55;
  void *v56;
  NSTimer *v57;
  NSTimer *assetPurgabilityTimer;
  uint8_t v59[16];

  CACLogDictationCommands();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v59 = 0;
    _os_log_impl(&dword_229A40000, v3, OS_LOG_TYPE_DEFAULT, "-[CACSpokenCommandManager run] called", v59, 2u);
  }

  self->_displayIsOff = -[CACSpokenCommandManager _isSystemSleeping](self, "_isSystemSleeping");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_NotificationLanguageSettingsChanged, CFSTR("CACNotificationLanguageChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NotificationAlwaysShowOverlayTypeSettingsChanged, CFSTR("NotificationAlwaysShowOverlayTypeSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_NotificationOverlayOptionsSettingsChanged, CFSTR("CACNotificationOverlayFadingSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)_NotificationOverlayOptionsSettingsChanged, CFSTR("CACNotificationGridOverlaySettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)_NotificationCommandsSettingsChanged, CFSTR("CACNotificationCommandsSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)_NotificationUserHintsSettingsChanged, CFSTR("CACNotificationUserHintsSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)_NotificationAttentionBasedSettingsChanged, CFSTR("CACNotificationAttentionBasedSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v11, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOnAfterInterruption, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOnFromInterrupt"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOffAfterInterruption, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOffFromInterrupt"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v13, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOn, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOn"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v14 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v14, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOff, CFSTR("com.apple.SpeechRecognitionCore.liveRecordingOff"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "divertedCommandsLogPath");
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  commandRecognitionLogPath = self->_commandRecognitionLogPath;
  self->_commandRecognitionLogPath = v16;

  self->_forceAllCommandsToBeActive = objc_msgSend(v15, "forceAllCommandsToBeActive");
  self->_usingAutomationMode = objc_msgSend(v15, "usingAutomationMode");
  objc_msgSend(v15, "externalContextOverrideFilePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(v18, "stringByExpandingTildeInPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (NSDictionary *)objc_msgSend(v19, "initWithContentsOfFile:", v20);
    externalContextOverrideTable = self->_externalContextOverrideTable;
    self->_externalContextOverrideTable = v21;

  }
  else
  {
    v20 = self->_externalContextOverrideTable;
    self->_externalContextOverrideTable = 0;
  }

  v23 = (NSMutableArray *)objc_opt_new();
  recognizers = self->_recognizers;
  self->_recognizers = v23;

  v25 = (NSMutableDictionary *)objc_opt_new();
  oldRXLangaugeObjects = self->_oldRXLangaugeObjects;
  self->_oldRXLangaugeObjects = v25;

  v27 = (NSMutableArray *)objc_opt_new();
  recognizedCommandsReadyForDispatch = self->_recognizedCommandsReadyForDispatch;
  self->_recognizedCommandsReadyForDispatch = v27;

  v29 = (NSMutableDictionary *)objc_opt_new();
  recognizerInteractionLevels = self->_recognizerInteractionLevels;
  self->_recognizerInteractionLevels = v29;

  v31 = (NSMutableDictionary *)objc_opt_new();
  identifierBasedLanguageModelCache = self->_identifierBasedLanguageModelCache;
  self->_identifierBasedLanguageModelCache = v31;

  v33 = (NSMutableArray *)objc_opt_new();
  pendingCommandToExecute = self->_pendingCommandToExecute;
  self->_pendingCommandToExecute = v33;

  v35 = (CACLabeledElementsCollection *)objc_opt_new();
  labeledScreenElementsCollection = self->_labeledScreenElementsCollection;
  self->_labeledScreenElementsCollection = v35;

  v37 = (void *)objc_opt_new();
  -[CACSpokenCommandManager setStagedTextInsertionSpecifier:](self, "setStagedTextInsertionSpecifier:", v37);

  v38 = dispatch_queue_create("com.apple.speech.RecognizerSynchronizationQueue", 0);
  -[CACSpokenCommandManager setRecognizerSynchronizationDispatchQueue:](self, "setRecognizerSynchronizationDispatchQueue:", v38);

  v39 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.CommandsExecutionQueue", 0);
  commandExecutionDispatchQueue = self->_commandExecutionDispatchQueue;
  self->_commandExecutionDispatchQueue = v39;

  v41 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.ElementFetchingQueue", 0);
  elementFetchingQueue = self->_elementFetchingQueue;
  self->_elementFetchingQueue = v41;

  v43 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.NonScannerElementFetchingQueue", 0);
  nonScannerElementFetchingQueue = self->_nonScannerElementFetchingQueue;
  self->_nonScannerElementFetchingQueue = v43;

  v45 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.PerAppElementFetchingQueue", MEMORY[0x24BDAC9C0]);
  perAppElementFetchingQueue = self->_perAppElementFetchingQueue;
  self->_perAppElementFetchingQueue = v45;

  objc_msgSend(v15, "fixMissingLocalesForVocabularyEntriesIfNecessary");
  objc_msgSend(MEMORY[0x24BDFF5B0], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "warm");

  objc_msgSend(MEMORY[0x24BDFEA90], "applyElementAttributeCacheScheme:", 6);
  -[CACSpokenCommandManager _attentionAwareSettingChanged](self, "_attentionAwareSettingChanged");
  -[CACSpokenCommandManager startListening](self, "startListening");
  +[CACSignPostLog FetchElementsEventBeganWithReason:expectedDelay:](CACSignPostLog, "FetchElementsEventBeganWithReason:expectedDelay:", CFSTR("First fetch"), 0.0);
  -[CACSpokenCommandManager _fetchElements](self, "_fetchElements");
  _UIAccessibilityBlockPostingOfNotification();
  v48 = -[CACAXNotificationObserver initWithNotifications:]([CACAXNotificationObserver alloc], "initWithNotifications:", &unk_24F2CF500);
  -[CACAXNotificationObserver setDelegate:](v48, "setDelegate:", self);
  -[CACSpokenCommandManager setAxNotificationObserver:](self, "setAxNotificationObserver:", v48);
  v49 = objc_alloc_init(CACTouchEventObserver);
  -[CACTouchEventObserver setDelegate:](v49, "setDelegate:", self);
  -[CACTouchEventObserver beginObserving](v49, "beginObserving");
  -[CACSpokenCommandManager setTouchEventObserver:](self, "setTouchEventObserver:", v49);
  -[CACSpokenCommandManager beginObservingApplications](self, "beginObservingApplications");
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setDidShowOnboarding:", 1);

  objc_msgSend(MEMORY[0x24BE006E0], "sharedManager");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (id)objc_msgSend(v51, "shortcuts");

  v53 = +[CACSystemStatusManager sharedManager](CACSystemStatusManager, "sharedManager");
  v54 = dispatch_time(0, 500000000);
  dispatch_get_global_queue(21, 0);
  v55 = objc_claimAutoreleasedReturnValue();
  dispatch_after(v54, v55, &__block_literal_global_286);

  objc_msgSend(MEMORY[0x24BDF88B8], "currentNotificationCenter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setDelegate:", self);
  objc_msgSend(v56, "setWantsNotificationResponsesDelivered");
  -[CACSpokenCommandManager _updateMostRecentLaunchTime](self, "_updateMostRecentLaunchTime");
  -[CACSpokenCommandManager _updateAssetPurgeability](self, "_updateAssetPurgeability");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateAssetPurgeability, 0, 1, 86400.0);
  v57 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  assetPurgabilityTimer = self->_assetPurgabilityTimer;
  self->_assetPurgabilityTimer = v57;

}

void __30__CACSpokenCommandManager_run__block_invoke()
{
  CFIndex AppIntegerValue;
  id v1;

  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CACDefaultRecognizerMode"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), 0);
  if ((_DWORD)AppIntegerValue)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setDictationRecognizerMode:", AppIntegerValue);

  }
}

- (void)willTerminate
{
  id v2;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableStatusBarOverride:", 0);

}

- (id)screenElements
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_presentationElements || self->_topLevelElements)
    objc_msgSend(v3, "addObjectsFromArray:");
  return v4;
}

- (id)_allElementsIncludingNonScanner
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_presentationElements || self->_topLevelAndNonScannerElements)
    objc_msgSend(v3, "addObjectsFromArray:");
  return v4;
}

- (id)screenElementsForEscape
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandManager labeledElementsFromScreen](self, "labeledElementsFromScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "element");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommandManager _allElementsIncludingNonScanner](self, "_allElementsIncludingNonScanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v6)
  {
    objc_msgSend(v3, "addObject:", v6);
    objc_msgSend(v8, "removeObject:", v6);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
LABEL_5:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), (_QWORD)v15);
      if ((unint64_t)objc_msgSend(v9, "count") > 0x14)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v11)
          goto LABEL_5;
        break;
      }
    }
  }

  return v3;
}

- (void)updateScreenElementsWithNonScannerElements:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelAndNonScannerElements, a3);
}

- (void)setScreenElements:(id)a3 presentationElements:(id)a4 activeApplications:(id)a5 focusedTextAreaElement:(id)a6
{
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  AXElement *v14;
  NSArray *topLevelElements;
  _BOOL4 v16;
  int v17;
  NSObject *v18;
  NSObject *p_super;
  NSArray *v20;
  NSArray *presentationElements;
  AXElement **p_focusedElement;
  AXElement *focusedElement;
  CACSpokenCommandManager *v24;
  void *v25;
  __CFString *v26;
  NSArray *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  NSArray *activeApplications;
  CACSpokenCommandManager *v41;
  void *v42;
  void *v43;
  void *v44;
  unsigned int v45;
  NSObject *v46;
  NSObject *v47;
  AXElement *v48;
  id obj;

  v11 = (NSArray *)a3;
  v12 = (NSArray *)a4;
  obj = a5;
  v13 = (NSArray *)a5;
  v14 = (AXElement *)a6;
  topLevelElements = self->_topLevelElements;
  if (topLevelElements == v11)
  {
    CACLogElementCollection();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
      -[CACSpokenCommandManager setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:].cold.2();
    v17 = 0;
  }
  else
  {
    v16 = -[NSArray isVisuallyEqualToArray:](topLevelElements, "isVisuallyEqualToArray:", v11);
    v17 = !v16;
    if (v16)
    {
      CACLogElementCollection();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CACSpokenCommandManager setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:].cold.3();

    }
    else
    {
      -[CACSpokenCommandManager _markAsDirtyForBuiltInLMIdentifier:](self, "_markAsDirtyForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF50]);
      if (-[CACSpokenCommandManager isActiveOverlayType:](self, "isActiveOverlayType:", CFSTR("NumberedElements")))
        -[CACSpokenCommandManager _markAsDirtyForBuiltInLMIdentifier:](self, "_markAsDirtyForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF20]);
    }
    v20 = v11;
    p_super = &self->_topLevelElements->super;
    self->_topLevelElements = v20;
  }

  objc_storeStrong((id *)&self->_topLevelAndNonScannerElements, a3);
  presentationElements = self->_presentationElements;
  if (presentationElements != v12)
  {
    if (!-[NSArray isVisuallyEqualToArray:](presentationElements, "isVisuallyEqualToArray:", v12))
    {
      -[CACSpokenCommandManager _markAsDirtyForBuiltInLMIdentifier:](self, "_markAsDirtyForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF50]);
      -[CACSpokenCommandManager _markAsDirtyForBuiltInLMIdentifier:](self, "_markAsDirtyForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF20]);
      v17 = 1;
    }
    objc_storeStrong((id *)&self->_presentationElements, a4);
  }
  p_focusedElement = &self->_focusedElement;
  focusedElement = v14;
  if (self->_focusedElement != v14)
  {
    v24 = self;
    objc_sync_enter(v24);
    objc_storeStrong((id *)&self->_focusedElement, a6);
    objc_sync_exit(v24);

    focusedElement = self->_focusedElement;
    v17 = 1;
  }
  if (focusedElement)
  {
    -[AXElement uiElement](focusedElement, "uiElement");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithAXAttribute:", 5019);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v48 = v14;
    v27 = v13;
    if (!-[__CFString length](v26, "length"))
    {
      -[AXElement recognitionStrings](*p_focusedElement, "recognitionStrings");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = objc_claimAutoreleasedReturnValue();

      v26 = (__CFString *)v29;
    }
    +[CACMessageTracerUtilities sharedCACMessageTracerUtilities](CACMessageTracerUtilities, "sharedCACMessageTracerUtilities");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v26, "length"))
      v31 = v26;
    else
      v31 = &stru_24F2ADCC8;
    objc_msgSend(v30, "setTextAreaIdentifierOrLabel:", v31);

    -[AXElement cacTextSelectionCACTextMarkerRange](*p_focusedElement, "cacTextSelectionCACTextMarkerRange");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      +[CACMessageTracerUtilities sharedCACMessageTracerUtilities](CACMessageTracerUtilities, "sharedCACMessageTracerUtilities");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x24BDD17C8];
      v35 = v17;
      v36 = objc_msgSend(v32, "nsRange");
      objc_msgSend(v32, "nsRange");
      objc_msgSend(v34, "stringWithFormat:", CFSTR("%ld,%ld"), v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTextAreaSelectionRange:", v38);

      v17 = v35;
    }

    v13 = v27;
    v14 = v48;
  }
  v39 = v17;
  activeApplications = v13;
  if (self->_activeApplications != v13)
  {
    v41 = self;
    objc_sync_enter(v41);
    objc_storeStrong((id *)&self->_activeApplications, obj);
    objc_sync_exit(v41);

    activeApplications = self->_activeApplications;
  }
  -[NSArray firstObject](activeApplications, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bundleId");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  +[CACMessageTracerUtilities sharedCACMessageTracerUtilities](CACMessageTracerUtilities, "sharedCACMessageTracerUtilities");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTargetApplicationIdentifier:", v43);

  v45 = -[CACSpokenCommandManager currentInteractionLevel](self, "currentInteractionLevel");
  if (self->_lastSyncdInteractionLevel == v45)
  {
    if (!v39)
    {
      CACLogElementCollection();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[CACSpokenCommandManager setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:].cold.1();
      goto LABEL_39;
    }
  }
  else
  {
    self->_lastSyncdInteractionLevel = v45;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v47 = objc_claimAutoreleasedReturnValue();
  v46 = v47;
  if (v11)
    -[NSObject addObjectsFromArray:](v47, "addObjectsFromArray:", v11);
  if (v12)
    -[NSObject addObjectsFromArray:](v46, "addObjectsFromArray:", v12);
  -[CACLabeledElementsCollection updateWithAXElements:](self->_labeledScreenElementsCollection, "updateWithAXElements:", v46);
  -[CACSpokenCommandManager synchronizeRecognizersWithReason:](self, "synchronizeRecognizersWithReason:", kSRUISyncReasonContentChanged);
LABEL_39:

}

- (id)focusedElement
{
  CACSpokenCommandManager *v2;
  AXElement *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_focusedElement;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)doesFocusedElementRequireSecureInput
{
  void *v2;
  char v3;

  -[CACSpokenCommandManager focusedElement](self, "focusedElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAnyTraits:", *MEMORY[0x24BDFEF80]);

  return v3;
}

- (id)activeApplications
{
  CACSpokenCommandManager *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeApplications;
  objc_sync_exit(v2);

  return v3;
}

- (id)leadingTextForCurrentSelection
{
  void *v2;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  __CFStringTokenizer *v9;
  CFRange v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t location;

  -[CACSpokenCommandManager focusedElement](self, "focusedElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "cacString");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = -[__CFString length](v4, "length");
    if (v5 < 1)
    {
LABEL_6:
      v9 = 0;
      goto LABEL_7;
    }
    v6 = v5;
    objc_msgSend(v3, "cacTextSelectionCACTextMarkerRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "nsRange");

    v9 = 0;
    if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v8 > v6)
        goto LABEL_6;
      if (v8 >= 0x190)
        v11.location = v8 - 400;
      else
        v11.location = 0;
      v11.length = v8 - v11.location;
      v9 = CFStringTokenizerCreate(0, v4, v11, 0, 0);
      if (v9)
      {
        v12 = 0;
        v13 = v8;
        while (1)
        {
          v14 = v13 - 1;
          if (CFStringTokenizerGoToTokenAtIndex(v9, v13 - 1))
          {
            location = CFStringTokenizerGetCurrentTokenRange(v9).location;
            if (location >= v13 || (++v12, (v13 = location) == 0))
            {
LABEL_21:
              CFRelease(v9);
              -[__CFString substringWithRange:](v4, "substringWithRange:", v13, v8 - v13);
              v9 = (__CFStringTokenizer *)objc_claimAutoreleasedReturnValue();
              break;
            }
          }
          else
          {
            --v13;
            if (!v14)
              goto LABEL_21;
          }
          if (v12 >= 0xA)
            goto LABEL_21;
        }
      }
    }
LABEL_7:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGRect)bestDictationRecognizerModeImageRectForView:(id)a3
{
  id v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double x;
  double v20;
  double y;
  double v22;
  double width;
  double v24;
  double height;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  _BOOL4 v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGRect v53;
  CGRect v54;
  CGRect result;
  CGRect v56;
  CGRect v57;

  v4 = a3;
  v5 = *MEMORY[0x24BDBF090];
  v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[CACSpokenCommandManager focusedElement](self, "focusedElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "cacTextSelectionCACTextMarkerRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "nsRange");
    v14 = v13;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v10, "textCursorFrame");
      x = CACViewRectFromPortraitUpRect(v4, v15, v16, v17, v18);
      y = v20;
      width = v22;
      height = v24;
      if (!CGFloatIsValid()
        || !CGFloatIsValid()
        || !CGFloatIsValid()
        || (CGFloatIsValid() & 1) == 0)
      {
        v26 = v12 + v14;
        objc_msgSend(v10, "cacLastPosition");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "index");

        v29 = v28 > 0;
        v30 = v26 >= v28;
        v31 = v29 & v30;
        if (v29 && v30)
          v32 = v28 - 1;
        else
          v32 = v26;
        objc_msgSend(v10, "visibleFrame");
        v47 = v34;
        v48 = v33;
        v45 = v36;
        v46 = v35;
        objc_msgSend(v10, "rectForRange:", v12, 0);
        v51 = v38;
        v52 = v37;
        v49 = v40;
        v50 = v39;
        objc_msgSend(v10, "rectForRange:", v32, v31);
        x = v53.origin.x;
        y = v53.origin.y;
        width = v53.size.width;
        height = v53.size.height;
        v56.origin.x = v5;
        v56.origin.y = v6;
        v56.size.width = v8;
        v56.size.height = v7;
        if (CGRectEqualToRect(v53, v56))
          goto LABEL_12;
        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = width;
        v54.size.height = height;
        v57.origin.y = v47;
        v57.origin.x = v48;
        v57.size.height = v45;
        v57.size.width = v46;
        if (!CGRectIntersectsRect(v54, v57))
        {
LABEL_12:
          y = v51;
          x = v52;
          height = v49;
          width = v50;
        }
      }
      v5 = x + width;
      v6 = y + height + 6.0;
      v7 = 16.0;
      v8 = 16.0;
    }
  }

  v41 = v5;
  v42 = v6;
  v43 = v8;
  v44 = v7;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (void)didBeginTouches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  self->_userIsTouching = 1;
  -[CACSpokenCommandManager cancelAnyTransientOverlay](self, "cancelAnyTransientOverlay");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  +[CACSpokenCommandGestureManager allManagers](CACSpokenCommandGestureManager, "allManagers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "resetState");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[CACSpokenCommandManager setPreviousTextInsertionSpecifier:](self, "setPreviousTextInsertionSpecifier:", 0);
}

- (void)didEndTouches
{
  self->_userIsTouching = 0;
  -[CACSpokenCommandManager _scheduleFetchElementsWithDelay:andReason:](self, "_scheduleFetchElementsWithDelay:andReason:", CFSTR("Ended touches"), 1.0);
}

- (void)willUpdateElementsSignificantly
{
  void *v2;
  char v3;
  void *v4;
  id v5;

  -[CACSpokenCommandManager activeOverlayType](self, "activeOverlayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("NumberedGrid"));

  if ((v3 & 1) == 0)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hideAnyNonInteractiveOverlay");

    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hideAnyInProcessPresentation");

  }
}

- (void)_pushLeadingContextToSpeechRecognitionSystem
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__CACSpokenCommandManager__pushLeadingContextToSpeechRecognitionSystem__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(v3, block);

}

void __71__CACSpokenCommandManager__pushLeadingContextToSpeechRecognitionSystem__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v3 = v2;
  if (*(double *)&sEvaluatorResultCache_block_invoke_sDelayLeadingTextCalcUntilReferenceDate < v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "leadingTextForCurrentSelection", *(double *)&sEvaluatorResultCache_block_invoke_sDelayLeadingTextCalcUntilReferenceDate);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    if (v5 - v3 > 0.5)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      *(double *)&sEvaluatorResultCache_block_invoke_sDelayLeadingTextCalcUntilReferenceDate = v6 + 60.0;
    }
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "string");
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "string");
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
    if (v4)
    {
      if ((objc_msgSend(v7, "isEqualToString:", v4) & 1) == 0)
      {
        +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLeadingContextString:", v4);

        +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = v4;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAdditionalContextStrings:", v12);

        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v4);
      }
    }

  }
}

- (void)_pushSecureFieldStatusToSpeechRecognitionSystem
{
  _BOOL8 v3;
  void *v4;

  v3 = -[CACSpokenCommandManager doesFocusedElementRequireSecureInput](self, "doesFocusedElementRequireSecureInput");
  if (self->_previousStatusFocusOnSecureField != v3)
  {
    +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSecureFieldFocused:", v3);

  }
  self->_previousStatusFocusOnSecureField = v3;
}

- (void)cancelAnyTransientOverlay
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  NSString *transientOverlayType;
  void *v11;

  if (!-[CACSpokenCommandManager shouldPreserveDisambiguationHandler](self, "shouldPreserveDisambiguationHandler"))
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDisambiguationHandler:", 0);

  }
  if (!self->_transientOverlayType)
  {
    -[CACSpokenCommandManager activeOverlayType](self, "activeOverlayType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("NumberedGrid")) & 1) != 0)
    {
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isGridAtTopLevel");

      if (v6)
      {
        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "updateGridLayoutFromPreferences");

        if (v8)
        {
          +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "resetGrid");

        }
        return;
      }
    }
    else
    {

    }
  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hideAnyNonInteractiveOverlay");

  transientOverlayType = self->_transientOverlayType;
  self->_transientOverlayType = 0;

}

- (BOOL)isActiveOverlayType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CACSpokenCommandManager activeOverlayType](self, "activeOverlayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (id)activeOverlayType
{
  void *v3;
  char v4;
  __CFString *v5;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  char v10;
  void *v11;

  if (-[CACSpokenCommandManager currentInteractionLevel](self, "currentInteractionLevel")
    || (+[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "carPlayConnected"),
        v3,
        (v4 & 1) != 0))
  {
    v5 = 0;
    return v5;
  }
  -[CACSpokenCommandManager disambiguationHandler](self, "disambiguationHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v5 = (__CFString *)v7;
    v8 = CFSTR("NumberedElements");
LABEL_7:

    v5 = (__CFString *)v8;
    return v5;
  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDisplayingAnyPresentation");

  if ((v10 & 1) != 0)
  {
    v5 = CFSTR("NumberedElements");
    return v5;
  }
  v5 = self->_transientOverlayType;
  if (!v5)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alwaysShowOverlayType");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("None")))
      {
        v8 = 0;
        goto LABEL_7;
      }
    }
  }
  return v5;
}

- (void)startRecordingGesture
{
  id v2;

  -[CACSpokenCommandManager touchEventObserver](self, "touchEventObserver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRecordingGesture");

}

- (id)stopRecordingGesture
{
  void *v2;
  void *v3;

  -[CACSpokenCommandManager touchEventObserver](self, "touchEventObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRecordingGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateStatusIndicatorView
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CACSpokenCommandManager_updateStatusIndicatorView__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __52__CACSpokenCommandManager_updateStatusIndicatorView__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  _BYTE *v8;

  +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isRecording"))
  {

LABEL_4:
    v5 = 3;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "touchEventObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRecording");

  if ((v4 & 1) != 0)
    goto LABEL_4;
  v8 = *(_BYTE **)(a1 + 32);
  if (v8[272])
  {
    if (objc_msgSend(v8, "currentInteractionLevel"))
      v5 = 1;
    else
      v5 = 2;
  }
  else
  {
    v5 = 1;
  }
LABEL_5:
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatusIndicatorType:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_notifyStatusChanged:", v5);
}

- (void)_notifyStatusChanged:(int64_t)a3
{
  const __CFString *v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v6;

  if ((unint64_t)(a3 - 1) > 2)
  {
    CACLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CACSpokenCommandManager _notifyStatusChanged:].cold.2();

  }
  else
  {
    v3 = off_24F2ABD20[a3 - 1];
    CACLogGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CACSpokenCommandManager _notifyStatusChanged:].cold.1();

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
  }
}

- (void)_createCommandRecognizersIfNecessary
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  CACSpokenCommand *v13;
  CACSpokenCommand *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  CACCommandRecognizer *v31;
  CACCommandRecognizer *v32;
  void *v33;
  void *v34;
  CACCommandRecognizer *v35;
  NSMutableArray *v36;
  void *v37;
  NSMutableArray *v38;
  void *v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  CACSpokenCommandManager *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = self->_recognizers;
  objc_sync_enter(v3);
  v46 = self;
  v4 = -[NSMutableArray count](self->_recognizers, "count");
  objc_sync_exit(v3);

  if (!v4)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_opt_new();
    v45 = (void *)objc_opt_new();
    objc_msgSend(v47, "builtInCommandsTable");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKey:", CFSTR("CommandProperties"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v41, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v5)
    {
      v43 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v53 != v43)
            objc_enumerationMutation(obj);
          v7 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          if ((objc_msgSend(v47, "isEnabledForCommandIdentifier:", v7) & 1) != 0 || v46->_forceAllCommandsToBeActive)
          {
            objc_msgSend(v47, "bestLocaleIdentifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v47, "isCommandIdentifier:availableForLocaleIdentifier:", v7, v8);

            if (v9)
            {
              v10 = objc_alloc(MEMORY[0x24BDBCED8]);
              objc_msgSend(v41, "objectForKey:", v7);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = (void *)objc_msgSend(v10, "initWithDictionary:", v11);

              objc_msgSend(v12, "setObject:forKey:", v7, kCACCommandPropertyIdentifier);
              v13 = -[CACSpokenCommand initWithProperties:]([CACSpokenCommand alloc], "initWithProperties:", v12);
              v14 = v13;
              if (v13)
              {
                v15 = -[CACSpokenCommand languageModel](v13, "languageModel");
                -[CACSpokenCommand strings](v14, "strings");
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  v17 = (void *)objc_opt_new();
                  -[CACSpokenCommand contextEvaluation](v14, "contextEvaluation");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "addEntriesFromDictionary:", v18);

                  objc_msgSend(v12, "objectForKey:", CFSTR("RecognizerClassName"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v19)
                  {
                    objc_msgSend(v17, "setObject:forKey:", &unk_24F2CEB30, v19);
                    -[CACSpokenCommand identifier](v14, "identifier");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "setObject:forKey:", v19, v20);

                  }
                  +[CACSpokenCommand stringFromContextEvaluationDictionary:isCustom:](CACSpokenCommand, "stringFromContextEvaluationDictionary:isCustom:", v17, 0);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "objectForKey:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v22)
                  {
                    v22 = (void *)objc_opt_new();
                    objc_msgSend(v40, "setObject:forKey:", v22, v21);
                  }
                  objc_msgSend(v22, "addObject:", v14);

                }
              }

            }
          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v5);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v23 = v40;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    if (v24)
    {
      v44 = *(_QWORD *)v49;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v49 != v44)
            objc_enumerationMutation(v23);
          v26 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
          objc_msgSend(v23, "objectForKey:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKey:", v29);
          v30 = (NSString *)objc_claimAutoreleasedReturnValue();

          if (-[NSString length](v30, "length"))
            v31 = (CACCommandRecognizer *)objc_alloc(NSClassFromString(v30));
          else
            v31 = [CACCommandRecognizer alloc];
          v32 = v31;
          objc_msgSend(v27, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "contextEvaluation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[CACCommandRecognizer initWithCommands:contextEvaluators:builtInLMIdentifiers:](v32, "initWithCommands:contextEvaluators:builtInLMIdentifiers:", v27, v34, 0);

          if (v35)
          {
            -[CACCommandRecognizer setType:](v35, "setType:", v26);
            v36 = v46->_recognizers;
            objc_sync_enter(v36);
            -[NSMutableArray addObject:](v46->_recognizers, "addObject:", v35);
            objc_sync_exit(v36);

          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      }
      while (v24);
    }

    +[CACCommandRecognizerCustom customCommandRecognizers](CACCommandRecognizerCustom, "customCommandRecognizers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "count"))
    {
      v38 = v46->_recognizers;
      objc_sync_enter(v38);
      -[NSMutableArray addObjectsFromArray:](v46->_recognizers, "addObjectsFromArray:", v37);
      objc_sync_exit(v38);

    }
  }
}

- (void)_rebuildCommandRecognizers
{
  NSObject *v3;
  _QWORD block[5];

  -[CACSpokenCommandManager recognizerSynchronizationDispatchQueue](self, "recognizerSynchronizationDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CACSpokenCommandManager__rebuildCommandRecognizers__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(v3, block);

  -[CACSpokenCommandManager synchronizeRecognizersWithReason:](self, "synchronizeRecognizersWithReason:", kSRUISyncReasonRecognizersChanged);
}

uint64_t __53__CACSpokenCommandManager__rebuildCommandRecognizers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetRecognitionSystems");
}

- (void)_rebuildCustomCommandRecognizers
{
  NSObject *v3;
  _QWORD block[5];

  -[CACSpokenCommandManager recognizerSynchronizationDispatchQueue](self, "recognizerSynchronizationDispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CACSpokenCommandManager__rebuildCustomCommandRecognizers__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(v3, block);

  -[CACSpokenCommandManager synchronizeRecognizersWithReason:](self, "synchronizeRecognizersWithReason:", kSRUISyncReasonRecognizersChanged);
}

void __59__CACSpokenCommandManager__rebuildCustomCommandRecognizers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  objc_sync_enter(v2);
  v3 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "speechRecognizer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "closeSpeechRecognizer");

          objc_msgSend(v3, "addObject:", v8);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), (_QWORD)v16);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

  objc_sync_exit(v2);
  +[CACCommandRecognizerCustom customCommandRecognizers](CACCommandRecognizerCustom, "customCommandRecognizers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v15 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
    objc_sync_enter(v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObjectsFromArray:", v14);
    objc_sync_exit(v15);

  }
}

- (void)_markAsDirtyForBuiltInLMIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CACSpokenCommandManager recognizerSynchronizationDispatchQueue](self, "recognizerSynchronizationDispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__CACSpokenCommandManager__markAsDirtyForBuiltInLMIdentifier___block_invoke;
  v7[3] = &unk_24F2AAD70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __62__CACSpokenCommandManager__markAsDirtyForBuiltInLMIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id obj;

  obj = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIsCurrent:", 0);

  objc_sync_exit(obj);
}

- (id)languageModelForBuiltInLMIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_identifierBasedLanguageModelCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (__RXLanguageObject)rxLanguageObjectForBuiltInLMIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  __RXLanguageObject *v7;

  v4 = a3;
  v5 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_identifierBasedLanguageModelCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__RXLanguageObject *)objc_msgSend(v6, "rxLanguageObject");

  objc_sync_exit(v5);
  return v7;
}

- (void)_intializeBuiltInLMIdentifierTableIfNecessary
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  CACLanguageModel *v15;
  int v16;
  void *v17;
  CACLanguageModel *v18;
  CACLanguageModel *v19;
  void *v20;
  CACLanguageModel *v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  NSMutableDictionary *v27;
  id obj;
  uint64_t v29;
  CACSpokenCommandManager *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _QWORD v36[12];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v27 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v27);
  v30 = self;
  if (!-[NSMutableDictionary count](self->_identifierBasedLanguageModelCache, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v4 = *MEMORY[0x24BEAFF50];
    v36[0] = *MEMORY[0x24BEAFF30];
    v36[1] = v4;
    v5 = *MEMORY[0x24BEAFF28];
    v36[2] = *MEMORY[0x24BEAFF20];
    v36[3] = v5;
    v6 = *MEMORY[0x24BEAFEF8];
    v36[4] = *MEMORY[0x24BEAFEF0];
    v36[5] = v6;
    v7 = *MEMORY[0x24BEAFF40];
    v36[6] = *MEMORY[0x24BEAFEE8];
    v36[7] = v7;
    v8 = *MEMORY[0x24BEAFF18];
    v36[8] = *MEMORY[0x24BEAFF10];
    v36[9] = v8;
    v9 = *MEMORY[0x24BEAFF00];
    v36[10] = *MEMORY[0x24BEAFF08];
    v36[11] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v11)
    {
      obj = v10;
      v29 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v29)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v14 = (void *)objc_opt_new();
          v15 = [CACLanguageModel alloc];
          v16 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEAFF28]);
          if (v16)
          {
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v13, kCACLanguageModelAttributeProxyIdentifier, 0);
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v2;
          }
          else
          {
            v17 = 0;
          }
          v18 = -[CACLanguageModel initWithText:identifier:attributes:](v15, "initWithText:identifier:attributes:", &stru_24F2ADCC8, 0, v17);
          if (v16)

          v19 = [CACLanguageModel alloc];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v13, kCACLanguageModelAttributeParameterIdentifier, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[CACLanguageModel initWithText:identifier:attributes:](v19, "initWithText:identifier:attributes:", &stru_24F2ADCC8, v13, v20);

          -[CACLanguageModel addChildLanguageModel:](v18, "addChildLanguageModel:", v21);
          objc_msgSend(v14, "setLanguageModel:", v18);
          +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (const void *)objc_msgSend(v22, "createRXLanguageObjectRefFromCACLanguageModel:ignoreBuiltInLMTable:", v18, 1);

          v24 = *MEMORY[0x24BEAFEF8];
          v35[0] = *MEMORY[0x24BEAFEF0];
          v35[1] = v24;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "containsObject:", v13);

          if ((v26 & 1) == 0)
            RXObjectSetProperty();
          objc_msgSend(v14, "setRxLanguageObject:", v23);
          RXRelease(v23);
          -[NSMutableDictionary setObject:forKey:](v30->_identifierBasedLanguageModelCache, "setObject:forKey:", v14, v13);

        }
        v10 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v11);
    }

    -[CACSpokenCommandManager _updateLanguageModelForBuiltInLMIdentifier:](v30, "_updateLanguageModelForBuiltInLMIdentifier:", *MEMORY[0x24BEAFEE8]);
    -[CACSpokenCommandManager _updateLanguageModelForBuiltInLMIdentifier:](v30, "_updateLanguageModelForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF40]);
    -[CACSpokenCommandManager _updateLanguageModelForBuiltInLMIdentifier:](v30, "_updateLanguageModelForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF10]);
    -[CACSpokenCommandManager _updateLanguageModelForBuiltInLMIdentifier:](v30, "_updateLanguageModelForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF18]);
    -[CACSpokenCommandManager _updateLanguageModelForBuiltInLMIdentifier:](v30, "_updateLanguageModelForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF08]);
    -[CACSpokenCommandManager _updateLanguageModelForBuiltInLMIdentifier:](v30, "_updateLanguageModelForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF00]);
  }
  objc_sync_exit(v27);

}

- (void)_flushBuiltInLMIdentifierTable
{
  NSMutableDictionary *obj;

  obj = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_identifierBasedLanguageModelCache, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_oldRXLangaugeObjects, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)_waitUntilElementsAreNumbered
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  char v8;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "labeledElementsForItemNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    for (i = 11; i > 1; --i)
    {
      -[CACSpokenCommandManager labeledScreenElementsCollection](self, "labeledScreenElementsCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "areElementsNumbered");

      if ((v8 & 1) != 0)
        break;
      usleep(0x186A0u);
    }
  }
}

- (BOOL)_isNumberOnlyString:(id)a3 lessThanOrEqualToValue:(int64_t)a4
{
  id v5;
  int64_t v6;
  BOOL v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v5 = a3;
  v6 = objc_msgSend(v5, "integerValue");
  v7 = v6 >= 1 && v6 <= a4;
  if (v7 && (v8 = v6, objc_msgSend(v5, "length")))
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setNumberStyle:", 1);
    v10 = (void *)MEMORY[0x24BDBCEA0];
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bestLocaleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localeWithLocaleIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v9, "setLocale:", v13);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromNumber:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "isEqualToString:", v5);
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_updateLanguageModelForBuiltInLMIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  char v8;
  CACLanguageModel *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t i9;
  void *v17;
  CACLanguageModel *v18;
  void *v19;
  CACLanguageModel *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t i;
  void *v27;
  CACLanguageModel *v28;
  void *v29;
  CACLanguageModel *v30;
  id v31;
  void *v32;
  void *i6;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i7;
  void *v46;
  unsigned int v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i8;
  void *v52;
  id v53;
  CACLanguageModel *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  CACLanguageModel *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t j;
  void *v70;
  void *v71;
  CACLanguageModel *v72;
  void *v73;
  void *v74;
  void *v75;
  CACLanguageModel *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t n;
  void *v83;
  CACLanguageModel *v84;
  void *v85;
  CACLanguageModel *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  _QWORD *v91;
  void *v92;
  CACLanguageModel *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t jj;
  void *v100;
  CACLanguageModel *v101;
  void *v102;
  CACLanguageModel *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t ii;
  void *v108;
  void *v109;
  CACLanguageModel *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  CACLanguageModel *v115;
  dispatch_time_t v116;
  NSObject *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  uint64_t i3;
  void *v124;
  CACLanguageModel *v125;
  void *v126;
  CACLanguageModel *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t k;
  void *v134;
  void *v135;
  CACLanguageModel *v136;
  void *v137;
  void *v138;
  void *v139;
  CACLanguageModel *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  int v148;
  void *v149;
  int v150;
  void *v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  _QWORD *v156;
  uint64_t m;
  void *v158;
  void *v159;
  CACLanguageModel *v160;
  void *v161;
  void *v162;
  void *v163;
  CACLanguageModel *v164;
  void *v165;
  void *v166;
  char v167;
  _QWORD *v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t i10;
  void *v175;
  void *v176;
  void *v177;
  CACRXLanguageObjectWrapper *v178;
  NSMutableDictionary *oldRXLangaugeObjects;
  void *v180;
  uint64_t v181;
  void *v182;
  double v183;
  double v184;
  void *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  double v190;
  uint64_t i11;
  void *v192;
  double v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  _QWORD *v198;
  uint64_t mm;
  void *v200;
  CACLanguageModel *v201;
  void *v202;
  CACLanguageModel *v203;
  CACLanguageModel *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  CACLanguageModel *v213;
  void *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  void *v218;
  NSObject *v219;
  void *v220;
  NSObject *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t kk;
  uint64_t v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  _QWORD *v235;
  uint64_t i1;
  void *v237;
  CACLanguageModel *v238;
  void *v239;
  CACLanguageModel *v240;
  void *v241;
  void *v242;
  void *v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  void *v247;
  NSObject *v248;
  NSObject *v249;
  void *v250;
  void *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t i4;
  NSObject *v255;
  NSObject *v256;
  void *v257;
  void *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t i5;
  uint64_t v262;
  uint64_t nn;
  void *v264;
  CACLanguageModel *v265;
  uint64_t i2;
  void *v267;
  CACLanguageModel *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  NSObject *v274;
  void *v275;
  void *v276;
  CACLanguageModel *v277;
  void *v278;
  void *v279;
  void *v280;
  CACLanguageModel *v281;
  void *v282;
  void *v283;
  uint64_t v284;
  void *v285;
  void *v286;
  id obj;
  int objc;
  id obja;
  id objb;
  uint64_t v291;
  int v292;
  uint64_t v293;
  void *v294;
  id v295;
  id v296;
  int v297;
  NSMutableDictionary *v298;
  id v299;
  id v300;
  id v301;
  id v302;
  id v303;
  int v304;
  id v305;
  id v306;
  id v307;
  id v308;
  CACSpokenCommandManager *v309;
  CACLanguageModel *v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  id v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  id v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  id v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  _QWORD block[5];
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  _BYTE v399[128];
  _BYTE v400[128];
  _QWORD v401[2];
  void *v402;
  _BYTE v403[128];
  _BYTE v404[128];
  _BYTE v405[128];
  _BYTE v406[128];
  _BYTE v407[128];
  uint8_t v408[128];
  uint8_t buf[4];
  uint64_t v410;
  __int16 v411;
  void *v412;
  __int16 v413;
  NSObject *v414;
  _BYTE v415[128];
  _BYTE v416[128];
  _QWORD v417[5];
  _QWORD v418[5];
  _BYTE v419[128];
  _BYTE v420[128];
  _BYTE v421[128];
  _BYTE v422[128];
  _BYTE v423[128];
  _BYTE v424[128];
  _BYTE v425[128];
  _BYTE v426[128];
  _BYTE v427[128];
  _BYTE v428[128];
  _BYTE v429[128];
  uint64_t v430;

  v430 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v5);
  v283 = v4;
  -[NSMutableDictionary objectForKey:](self->_identifierBasedLanguageModelCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "isCurrent");

    objc_sync_exit(v5);
    if ((v8 & 1) != 0)
      goto LABEL_177;
  }
  else
  {
    objc_sync_exit(v5);

  }
  v309 = self;
  v9 = [CACLanguageModel alloc];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v283, kCACLanguageModelAttributeParameterIdentifier, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v310 = -[CACLanguageModel initWithText:identifier:attributes:](v9, "initWithText:identifier:attributes:", &stru_24F2ADCC8, v283, v10);

  if (!objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF50]))
  {
    if ((objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF20]) & 1) != 0
      || objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF28]))
    {
      if (self->_externalContextOverrideTable)
      {
        v382 = 0u;
        v381 = 0u;
        v380 = 0u;
        v379 = 0u;
        -[CACSpokenCommandManager _arrayFromExternalContextOverrideForBuiltInIdentifier:](self, "_arrayFromExternalContextOverrideForBuiltInIdentifier:", v283);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v379, v425, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v380;
          v24 = *MEMORY[0x24BDBD270];
          v25 = (_QWORD *)MEMORY[0x24BEAFF60];
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v380 != v23)
                objc_enumerationMutation(v21);
              v27 = *(void **)(*((_QWORD *)&v379 + 1) + 8 * i);
              if (objc_msgSend(v27, "length"))
              {
                v28 = [CACLanguageModel alloc];
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v24, *v25, 0);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = -[CACLanguageModel initWithText:identifier:attributes:](v28, "initWithText:identifier:attributes:", v27, 0, v29);

                -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v30);
              }
            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v379, v425, 16);
          }
          while (v22);
        }

        goto LABEL_148;
      }
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isActiveOverlayType:", CFSTR("NumberedGrid"));

      if (v63)
      {
        v378 = 0u;
        v377 = 0u;
        v376 = 0u;
        v375 = 0u;
        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "labeledElementsForGrid");
        v302 = (id)objc_claimAutoreleasedReturnValue();

        v65 = objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v375, v424, 16);
        if (v65)
        {
          v66 = *(_QWORD *)v376;
          v67 = *MEMORY[0x24BDBD270];
          v68 = (_QWORD *)MEMORY[0x24BEAFF60];
          do
          {
            for (j = 0; j != v65; ++j)
            {
              if (*(_QWORD *)v376 != v66)
                objc_enumerationMutation(v302);
              v70 = *(void **)(*((_QWORD *)&v375 + 1) + 8 * j);
              objc_msgSend(v70, "numberedLabel");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = [CACLanguageModel alloc];
              v73 = (void *)MEMORY[0x24BDBCE70];
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v70, kCACCommandParameterLabeledElement, 0);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "dictionaryWithObjectsAndKeys:", v74, kCACLanguageModelAttributeCommandParameters, v67, *v68, 0);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = -[CACLanguageModel initWithText:identifier:attributes:](v72, "initWithText:identifier:attributes:", v71, 0, v75);

              -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v76);
            }
            v65 = objc_msgSend(v302, "countByEnumeratingWithState:objects:count:", &v375, v424, 16);
          }
          while (v65);
        }
      }
      else
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "isActiveOverlayType:", CFSTR("NumberedElements"));

        if (!v88)
          goto LABEL_139;
        -[CACSpokenCommandManager disambiguationHandler](self, "disambiguationHandler");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v302 = v89;
        if (v89)
        {
          objc_msgSend(v89, "labeledElements");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          -[CACSpokenCommandManager labeledScreenElementsCollection](self, "labeledScreenElementsCollection");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "collectedElements");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

        }
        -[CACSpokenCommandManager _waitUntilElementsAreNumbered](self, "_waitUntilElementsAreNumbered");
        v374 = 0u;
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v296 = v90;
        v129 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v371, v423, 16);
        if (v129)
        {
          v130 = *(_QWORD *)v372;
          v131 = *MEMORY[0x24BDBD270];
          v132 = (_QWORD *)MEMORY[0x24BEAFF60];
          do
          {
            for (k = 0; k != v129; ++k)
            {
              if (*(_QWORD *)v372 != v130)
                objc_enumerationMutation(v296);
              v134 = *(void **)(*((_QWORD *)&v371 + 1) + 8 * k);
              objc_msgSend(v134, "numberedLabel");
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              v136 = [CACLanguageModel alloc];
              v137 = (void *)MEMORY[0x24BDBCE70];
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v134, kCACCommandParameterLabeledElement, 0);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v137, "dictionaryWithObjectsAndKeys:", v138, kCACLanguageModelAttributeCommandParameters, v131, *v132, 0);
              v139 = (void *)objc_claimAutoreleasedReturnValue();
              v140 = -[CACLanguageModel initWithText:identifier:attributes:](v136, "initWithText:identifier:attributes:", v135, 0, v139);

              -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v140);
            }
            v129 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v371, v423, 16);
          }
          while (v129);
        }

      }
LABEL_139:
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v304 = objc_msgSend(v141, "isActiveOverlayType:", CFSTR("NumberedElements"));
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v297 = objc_msgSend(v142, "isActiveOverlayType:", CFSTR("NamedElements"));
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v292 = objc_msgSend(v143, "isActiveOverlayType:", CFSTR("NumberedWords"));
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc = objc_msgSend(v144, "isActiveOverlayType:", CFSTR("NumberedLines"));
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = objc_msgSend(v145, "isActiveOverlayType:", CFSTR("NumberedCharacters"));
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = objc_msgSend(v147, "isActiveOverlayType:", CFSTR("NumberedSentences"));
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = objc_msgSend(v149, "isActiveOverlayType:", CFSTR("NumberedParagraphs"));

      if (v304 | v297 | v292 | objc | v146 | v148 | v150)
      {
        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "labeledTextSegmentElements");
        v152 = (void *)objc_claimAutoreleasedReturnValue();

        v370 = 0u;
        v369 = 0u;
        v368 = 0u;
        v367 = 0u;
        v305 = v152;
        v153 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v367, v422, 16);
        if (v153)
        {
          v154 = *(_QWORD *)v368;
          v155 = *MEMORY[0x24BDBD270];
          v156 = (_QWORD *)MEMORY[0x24BEAFF60];
          do
          {
            for (m = 0; m != v153; ++m)
            {
              if (*(_QWORD *)v368 != v154)
                objc_enumerationMutation(v305);
              v158 = *(void **)(*((_QWORD *)&v367 + 1) + 8 * m);
              objc_msgSend(v158, "numberedLabel");
              v159 = (void *)objc_claimAutoreleasedReturnValue();
              v160 = [CACLanguageModel alloc];
              v161 = (void *)MEMORY[0x24BDBCE70];
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v158, kCACCommandParameterLabeledElement, 0);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v161, "dictionaryWithObjectsAndKeys:", v162, kCACLanguageModelAttributeCommandParameters, v155, *v156, 0);
              v163 = (void *)objc_claimAutoreleasedReturnValue();
              v164 = -[CACLanguageModel initWithText:identifier:attributes:](v160, "initWithText:identifier:attributes:", v159, 0, v163);

              -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v164);
            }
            v153 = objc_msgSend(v305, "countByEnumeratingWithState:objects:count:", &v367, v422, 16);
          }
          while (v153);
        }

      }
      goto LABEL_148;
    }
    if (objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF30]))
    {
      if (self->_externalContextOverrideTable)
      {
        v366 = 0u;
        v365 = 0u;
        v364 = 0u;
        v363 = 0u;
        -[CACSpokenCommandManager _arrayFromExternalContextOverrideForBuiltInIdentifier:](self, "_arrayFromExternalContextOverrideForBuiltInIdentifier:", v283);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v363, v421, 16);
        if (v78)
        {
          v79 = *(_QWORD *)v364;
          v80 = *MEMORY[0x24BDBD270];
          v81 = (_QWORD *)MEMORY[0x24BEAFF60];
          do
          {
            for (n = 0; n != v78; ++n)
            {
              if (*(_QWORD *)v364 != v79)
                objc_enumerationMutation(v77);
              v83 = *(void **)(*((_QWORD *)&v363 + 1) + 8 * n);
              if (objc_msgSend(v83, "length"))
              {
                v84 = [CACLanguageModel alloc];
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v80, *v81, 0);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = -[CACLanguageModel initWithText:identifier:attributes:](v84, "initWithText:identifier:attributes:", v83, 0, v85);

                -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v86);
              }
            }
            v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v363, v421, 16);
          }
          while (v78);
        }

      }
      else
      {
        +[CACApplicationUtilities targetApplications](CACApplicationUtilities, "targetApplications");
        v303 = (id)objc_claimAutoreleasedReturnValue();
        v362 = 0u;
        v360 = 0u;
        v361 = 0u;
        v359 = 0u;
        v104 = objc_msgSend(v303, "countByEnumeratingWithState:objects:count:", &v359, v420, 16);
        if (v104)
        {
          v105 = *(_QWORD *)v360;
          v106 = *MEMORY[0x24BDBD270];
          do
          {
            for (ii = 0; ii != v104; ++ii)
            {
              if (*(_QWORD *)v360 != v105)
                objc_enumerationMutation(v303);
              v108 = *(void **)(*((_QWORD *)&v359 + 1) + 8 * ii);
              objc_msgSend(v108, "objectForKey:", kCACCommandParameterAppName);
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = [CACLanguageModel alloc];
              v111 = (void *)MEMORY[0x24BDBCE70];
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v108);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "dictionaryWithObjectsAndKeys:", v112, kCACCommandParameterMatchingApps, 0);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "dictionaryWithObjectsAndKeys:", v113, kCACLanguageModelAttributeCommandParameters, v106, *MEMORY[0x24BEAFF60], 0);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v115 = -[CACLanguageModel initWithText:identifier:attributes:](v110, "initWithText:identifier:attributes:", v109, 0, v114);

              -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v115);
            }
            v104 = objc_msgSend(v303, "countByEnumeratingWithState:objects:count:", &v359, v420, 16);
          }
          while (v104);
        }
        if (!objc_msgSend(v303, "count"))
        {
          v116 = dispatch_time(0, 1000000000);
          -[CACSpokenCommandManager recognizerSynchronizationDispatchQueue](v309, "recognizerSynchronizationDispatchQueue");
          v117 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __70__CACSpokenCommandManager__updateLanguageModelForBuiltInLMIdentifier___block_invoke;
          block[3] = &unk_24F2AA860;
          block[4] = v309;
          dispatch_after(v116, v117, block);

        }
      }
      goto LABEL_148;
    }
    v91 = (_QWORD *)MEMORY[0x24BEAFEE8];
    if (objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFEE8]))
    {
      objc_msgSend(MEMORY[0x24BEAFED0], "deviceName");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = -[CACLanguageModel initWithText:identifier:attributes:]([CACLanguageModel alloc], "initWithText:identifier:attributes:", v92, *v91, 0);
      -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v93);

      goto LABEL_148;
    }
    if (objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF08]))
    {
      if (self->_externalContextOverrideTable)
      {
        v356 = 0u;
        v357 = 0u;
        v354 = 0u;
        v355 = 0u;
        -[CACSpokenCommandManager _arrayFromExternalContextOverrideForBuiltInIdentifier:](self, "_arrayFromExternalContextOverrideForBuiltInIdentifier:", v283);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v354, v419, 16);
        if (v95)
        {
          v96 = *(_QWORD *)v355;
          v97 = *MEMORY[0x24BDBD270];
          v98 = (_QWORD *)MEMORY[0x24BEAFF60];
          do
          {
            for (jj = 0; jj != v95; ++jj)
            {
              if (*(_QWORD *)v355 != v96)
                objc_enumerationMutation(v94);
              v100 = *(void **)(*((_QWORD *)&v354 + 1) + 8 * jj);
              if (objc_msgSend(v100, "length"))
              {
                v101 = [CACLanguageModel alloc];
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v97, *v98, 0);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                v103 = -[CACLanguageModel initWithText:identifier:attributes:](v101, "initWithText:identifier:attributes:", v100, 0, v102);

                -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v103);
              }
            }
            v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v354, v419, 16);
          }
          while (v95);
        }

        goto LABEL_148;
      }
      v204 = [CACLanguageModel alloc];
      v205 = *MEMORY[0x24BDBD270];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDBD270], *MEMORY[0x24BEAFF60], 0);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v277 = -[CACLanguageModel initWithText:identifier:attributes:](v204, "initWithText:identifier:attributes:", &stru_24F2ADCC8, 0, v206);

      +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
      v275 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v275, "bestLocaleIdentifier");
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v417[0] = CFSTR("ModifierKeyName.Command");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v418[0] = v207;
      v417[1] = CFSTR("ModifierKeyName.Option");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 2);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v418[1] = v208;
      v417[2] = CFSTR("ModifierKeyName.Shift");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 8);
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v418[2] = v209;
      v417[3] = CFSTR("ModifierKeyName.Control");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 4);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      v418[3] = v210;
      v417[4] = CFSTR("ModifierKeyName.Caps Lock");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 16);
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      v418[4] = v211;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v418, v417, 5);
      v279 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v212, "dictionaryForLocaleIdentifier:resourceFileName:resourceFileExtension:", v273, CFSTR("ModifierKeyNames"), CFSTR("strings"));
      v299 = (id)objc_claimAutoreleasedReturnValue();

      v213 = [CACLanguageModel alloc];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v205, *MEMORY[0x24BEAFF58], 0);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = -[CACLanguageModel initWithText:identifier:attributes:](v213, "initWithText:identifier:attributes:", &stru_24F2ADCC8, 0, v214);

      v352 = 0u;
      v353 = 0u;
      v350 = 0u;
      v351 = 0u;
      objc_msgSend(v279, "allKeys");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v307 = (id)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v350, v416, 16);
      if (!v307)
        goto LABEL_217;
      v293 = *(_QWORD *)v351;
LABEL_192:
      v215 = 0;
      while (1)
      {
        if (*(_QWORD *)v351 != v293)
          objc_enumerationMutation(obja);
        v216 = *(_QWORD *)(*((_QWORD *)&v350 + 1) + 8 * v215);
        objc_msgSend(v299, "objectForKey:", v216);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v217, "length"))
        {
          CACLogDictationCommands();
          v219 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v219, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v410 = v216;
            _os_log_impl(&dword_229A40000, v219, OS_LOG_TYPE_DEFAULT, "Error loading modifier key name string: %@", buf, 0xCu);
          }
          goto LABEL_204;
        }
        v349 = 0;
        objc_msgSend(MEMORY[0x24BEAFED0], "languageModelDictionaryFromCommandText:parsingErrorString:", v217, &v349);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = v349;
        if (-[NSObject length](v219, "length"))
        {
          v220 = 0;
        }
        else
        {
          +[CACSpokenCommand languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:](CACSpokenCommand, "languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:", v218, 0, 0, 0);
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          if (v220 && !-[NSObject length](v219, "length"))
          {
            objc_msgSend(v220, "setIdentifier:", v216);
            v222 = (void *)MEMORY[0x24BDBCE70];
            objc_msgSend(v279, "objectForKey:", v216);
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v222, "dictionaryWithObjectsAndKeys:", v223, kCACCommandParameterAXModifierFlag, 0);
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v220, "setObject:forAttribute:", v224, kCACLanguageModelAttributeCommandParameters);

            v347 = 0u;
            v348 = 0u;
            v345 = 0u;
            v346 = 0u;
            objc_msgSend(v220, "children");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            v226 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v345, v415, 16);
            if (v226)
            {
              v227 = *(_QWORD *)v346;
              do
              {
                for (kk = 0; kk != v226; ++kk)
                {
                  if (*(_QWORD *)v346 != v227)
                    objc_enumerationMutation(v225);
                  objc_msgSend(*(id *)(*((_QWORD *)&v345 + 1) + 8 * kk), "setIdentifier:", v216);
                }
                v226 = objc_msgSend(v225, "countByEnumeratingWithState:objects:count:", &v345, v415, 16);
              }
              while (v226);
            }

            -[CACLanguageModel addChildLanguageModel:](v281, "addChildLanguageModel:", v220);
            goto LABEL_201;
          }
        }
        CACLogDictationCommands();
        v221 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v221, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v410 = v216;
          v411 = 2112;
          v412 = v217;
          v413 = 2112;
          v414 = v219;
          _os_log_impl(&dword_229A40000, v221, OS_LOG_TYPE_DEFAULT, "Error parsing modifier key name: %@, '%@', %@", buf, 0x20u);
        }

LABEL_201:
LABEL_204:

        if ((id)++v215 == v307)
        {
          v229 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v350, v416, 16);
          v307 = (id)v229;
          if (!v229)
          {
LABEL_217:

            v230 = 4;
            do
            {
              -[CACLanguageModel addChildLanguageModel:](v277, "addChildLanguageModel:", v281);
              --v230;
            }
            while (v230);
            -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v277);

            goto LABEL_148;
          }
          goto LABEL_192;
        }
      }
    }
    if (!objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF00]))
    {
      if (objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF40]))
      {
        if (self->_externalContextOverrideTable)
        {
          v325 = 0u;
          v326 = 0u;
          v323 = 0u;
          v324 = 0u;
          -[CACSpokenCommandManager _arrayFromExternalContextOverrideForBuiltInIdentifier:](self, "_arrayFromExternalContextOverrideForBuiltInIdentifier:", v283);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v323, v404, 16);
          if (v195)
          {
            v196 = *(_QWORD *)v324;
            v197 = *MEMORY[0x24BDBD270];
            v198 = (_QWORD *)MEMORY[0x24BEAFF60];
            do
            {
              for (mm = 0; mm != v195; ++mm)
              {
                if (*(_QWORD *)v324 != v196)
                  objc_enumerationMutation(v194);
                v200 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * mm);
                if (objc_msgSend(v200, "length"))
                {
                  v201 = [CACLanguageModel alloc];
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v197, *v198, 0);
                  v202 = (void *)objc_claimAutoreleasedReturnValue();
                  v203 = -[CACLanguageModel initWithText:identifier:attributes:](v201, "initWithText:identifier:attributes:", v200, 0, v202);

                  -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v203);
                }
              }
              v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v323, v404, 16);
            }
            while (v195);
          }

        }
        else
        {
          for (nn = 2; nn != 101; ++nn)
          {
            -[CACSpokenCommandManager _stringInRecognitionLocaleFormatFromIntegerValue:](v309, "_stringInRecognitionLocaleFormatFromIntegerValue:", nn);
            v264 = (void *)objc_claimAutoreleasedReturnValue();
            v265 = -[CACLanguageModel initWithText:identifier:attributes:]([CACLanguageModel alloc], "initWithText:identifier:attributes:", v264, 0, 0);
            -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v265);

          }
        }
      }
      else if ((objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF10]) & 1) != 0
             || objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF18]))
      {
        if (self->_externalContextOverrideTable)
        {
          v321 = 0u;
          v322 = 0u;
          v319 = 0u;
          v320 = 0u;
          -[CACSpokenCommandManager _arrayFromExternalContextOverrideForBuiltInIdentifier:](self, "_arrayFromExternalContextOverrideForBuiltInIdentifier:", v283);
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          v232 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v319, v403, 16);
          if (v232)
          {
            v233 = *(_QWORD *)v320;
            v234 = *MEMORY[0x24BDBD270];
            v235 = (_QWORD *)MEMORY[0x24BEAFF60];
            do
            {
              for (i1 = 0; i1 != v232; ++i1)
              {
                if (*(_QWORD *)v320 != v233)
                  objc_enumerationMutation(v231);
                v237 = *(void **)(*((_QWORD *)&v319 + 1) + 8 * i1);
                if (objc_msgSend(v237, "length"))
                {
                  v238 = [CACLanguageModel alloc];
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v234, *v235, 0);
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  v240 = -[CACLanguageModel initWithText:identifier:attributes:](v238, "initWithText:identifier:attributes:", v237, 0, v239);

                  -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v240);
                }
              }
              v232 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", &v319, v403, 16);
            }
            while (v232);
          }

        }
        else
        {
          for (i2 = 2; i2 != 100; ++i2)
          {
            -[CACSpokenCommandManager _stringInRecognitionLocaleFormatFromIntegerValue:](v309, "_stringInRecognitionLocaleFormatFromIntegerValue:", i2);
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            v268 = -[CACLanguageModel initWithText:identifier:attributes:]([CACLanguageModel alloc], "initWithText:identifier:attributes:", v267, 0, 0);
            -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v268);

          }
        }
      }
      goto LABEL_148;
    }
    if (self->_externalContextOverrideTable)
    {
      v343 = 0u;
      v344 = 0u;
      v341 = 0u;
      v342 = 0u;
      -[CACSpokenCommandManager _arrayFromExternalContextOverrideForBuiltInIdentifier:](self, "_arrayFromExternalContextOverrideForBuiltInIdentifier:", v283);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v341, v408, 16);
      if (v119)
      {
        v120 = *(_QWORD *)v342;
        v121 = *MEMORY[0x24BDBD270];
        v122 = (_QWORD *)MEMORY[0x24BEAFF60];
        do
        {
          for (i3 = 0; i3 != v119; ++i3)
          {
            if (*(_QWORD *)v342 != v120)
              objc_enumerationMutation(v118);
            v124 = *(void **)(*((_QWORD *)&v341 + 1) + 8 * i3);
            if (objc_msgSend(v124, "length"))
            {
              v125 = [CACLanguageModel alloc];
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v121, *v122, 0);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = -[CACLanguageModel initWithText:identifier:attributes:](v125, "initWithText:identifier:attributes:", v124, 0, v126);

              -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v127);
            }
          }
          v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v341, v408, 16);
        }
        while (v119);
      }

      goto LABEL_148;
    }
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v271, "builtInCommandsTable");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v271, "bestLocaleIdentifier");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "objectForKey:", CFSTR("KeyboardKeyProperties"));
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v241, "dictionaryForLocaleIdentifier:resourceFileName:resourceFileExtension:", v270, CFSTR("KeyboardKeyNames"), CFSTR("strings"));
    v294 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v242, "dictionaryForLocaleIdentifier:bundle:subDirectory:rootFileName:rootFileExtension:", v270, v243, CFSTR("LocalizedPhoneticAlphabet"), CFSTR("PhoneticAlphabet"), CFSTR("plist"));
    v276 = (void *)objc_claimAutoreleasedReturnValue();

    v339 = 0u;
    v340 = 0u;
    v337 = 0u;
    v338 = 0u;
    objc_msgSend(v280, "allKeys");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    v300 = (id)objc_msgSend(v286, "countByEnumeratingWithState:objects:count:", &v337, v407, 16);
    if (!v300)
    {
LABEL_275:

      goto LABEL_148;
    }
    objb = *(id *)v338;
LABEL_235:
    v244 = 0;
    while (1)
    {
      if (*(id *)v338 != objb)
        objc_enumerationMutation(v286);
      v245 = *(_QWORD *)(*((_QWORD *)&v337 + 1) + 8 * v244);
      objc_msgSend(v294, "objectForKey:", v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v246)
        goto LABEL_244;
      v336 = 0;
      objc_msgSend(MEMORY[0x24BEAFED0], "languageModelDictionaryFromCommandText:parsingErrorString:", v246, &v336);
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      v248 = v336;
      if (-[NSObject length](v248, "length")
        || (+[CACSpokenCommand languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:](CACSpokenCommand, "languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:", v247, 0, 0, 0), (v308 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v308 = 0;
LABEL_241:
        CACLogDictationCommands();
        v249 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v249, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v410 = v245;
          v411 = 2112;
          v412 = v246;
          v413 = 2112;
          v414 = v248;
          _os_log_impl(&dword_229A40000, v249, OS_LOG_TYPE_DEFAULT, "Error parsing keyboard key name: %@, '%@', %@", buf, 0x20u);
        }
        goto LABEL_243;
      }
      if (-[NSObject length](v248, "length"))
        goto LABEL_241;
      objc_msgSend(v308, "setIdentifier:", v245);
      objc_msgSend(v280, "objectForKey:", v245);
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v308, "setObject:forAttribute:", v250, kCACLanguageModelAttributeCommandParameters);

      v334 = 0u;
      v335 = 0u;
      v332 = 0u;
      v333 = 0u;
      objc_msgSend(v308, "children");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v332, v406, 16);
      if (v252)
      {
        v253 = *(_QWORD *)v333;
        do
        {
          for (i4 = 0; i4 != v252; ++i4)
          {
            if (*(_QWORD *)v333 != v253)
              objc_enumerationMutation(v251);
            objc_msgSend(*(id *)(*((_QWORD *)&v332 + 1) + 8 * i4), "setIdentifier:", v245);
          }
          v252 = objc_msgSend(v251, "countByEnumeratingWithState:objects:count:", &v332, v406, 16);
        }
        while (v252);
      }

      -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v308);
      objc_msgSend(v276, "objectForKey:", CFSTR("PhoneticPronunciationMapping"));
      v255 = objc_claimAutoreleasedReturnValue();
      v249 = v255;
      if (v255)
        break;
LABEL_243:

LABEL_244:
      if ((id)++v244 == v300)
      {
        v262 = objc_msgSend(v286, "countByEnumeratingWithState:objects:count:", &v337, v407, 16);
        v300 = (id)v262;
        if (!v262)
          goto LABEL_275;
        goto LABEL_235;
      }
    }
    -[NSObject objectForKey:](v255, "objectForKey:", v245);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v282, "length"))
    {
LABEL_263:

      goto LABEL_243;
    }
    v331 = 0;
    objc_msgSend(MEMORY[0x24BEAFED0], "languageModelDictionaryFromCommandText:parsingErrorString:", v282, &v331);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = v331;
    if (-[NSObject length](v274, "length")
      || (+[CACSpokenCommand languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:](CACSpokenCommand, "languageModelFromCommandDictionary:tokenResolution:containsBuiltInIdentifier:error:", v272, 0, 0, 0), (v278 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v278 = 0;
    }
    else if (!-[NSObject length](v274, "length"))
    {
      objc_msgSend(v278, "setIdentifier:", v245);
      objc_msgSend(v280, "objectForKey:", v245);
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "setObject:forAttribute:", v257, kCACLanguageModelAttributeCommandParameters);

      v329 = 0u;
      v330 = 0u;
      v327 = 0u;
      v328 = 0u;
      objc_msgSend(v278, "children");
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      v259 = objc_msgSend(v258, "countByEnumeratingWithState:objects:count:", &v327, v405, 16);
      if (v259)
      {
        v260 = *(_QWORD *)v328;
        do
        {
          for (i5 = 0; i5 != v259; ++i5)
          {
            if (*(_QWORD *)v328 != v260)
              objc_enumerationMutation(v258);
            objc_msgSend(*(id *)(*((_QWORD *)&v327 + 1) + 8 * i5), "setIdentifier:", v245);
          }
          v259 = objc_msgSend(v258, "countByEnumeratingWithState:objects:count:", &v327, v405, 16);
        }
        while (v259);
      }

      -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v278);
LABEL_262:

      goto LABEL_263;
    }
    CACLogDictationCommands();
    v256 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v256, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v410 = v245;
      v411 = 2112;
      v412 = v282;
      v413 = 2112;
      v414 = v274;
      _os_log_impl(&dword_229A40000, v256, OS_LOG_TYPE_DEFAULT, "Error parsing phonetic key name: %@, '%@', %@", buf, 0x20u);
    }

    goto LABEL_262;
  }
  if (!self->_externalContextOverrideTable)
  {
    v31 = -[CACLabeledElementsCollection copyTableOfCollectedElementsByTitle](self->_labeledScreenElementsCollection, "copyTableOfCollectedElementsByTitle");
    v391 = 0u;
    v392 = 0u;
    v393 = 0u;
    v394 = 0u;
    v285 = v31;
    objc_msgSend(v31, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    obj = (id)objc_claimAutoreleasedReturnValue();

    v295 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v391, v428, 16);
    if (!v295)
      goto LABEL_68;
    v291 = *(_QWORD *)v392;
    v284 = *MEMORY[0x24BDBD270];
    while (1)
    {
      for (i6 = 0; i6 != v295; i6 = (char *)i6 + 1)
      {
        if (*(_QWORD *)v392 != v291)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v391 + 1) + 8 * (_QWORD)i6);
        if (objc_msgSend(v34, "length"))
        {
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isActiveOverlayType:", CFSTR("NumberedGrid"));

          if (!v36
            || (+[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v37, "labeledElementsForGrid"),
                v38 = (void *)objc_claimAutoreleasedReturnValue(),
                v39 = objc_msgSend(v38, "count"),
                v38,
                v37,
                v39 < 1)
            || !-[CACSpokenCommandManager _isNumberOnlyString:lessThanOrEqualToValue:](v309, "_isNumberOnlyString:lessThanOrEqualToValue:", v34, v39))
          {
            objc_msgSend(v285, "objectForKey:", v34);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v40, "count"))
            {
              objc_msgSend(v40, "objectAtIndex:", 0);
              v301 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v301 = 0;
            }
            v390 = 0u;
            v389 = 0u;
            v388 = 0u;
            v387 = 0u;
            v41 = v40;
            v42 = 0;
            v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v387, v427, 16);
            if (v43)
            {
              v44 = *(_QWORD *)v388;
              do
              {
                for (i7 = 0; i7 != v43; ++i7)
                {
                  if (*(_QWORD *)v388 != v44)
                    objc_enumerationMutation(v41);
                  objc_msgSend(*(id *)(*((_QWORD *)&v387 + 1) + 8 * i7), "axIdentifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v46, "hasPrefix:", CFSTR("_CAC_NUMBERED_ONLY_ELEMENT_"));

                  v42 += v47;
                }
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v387, v427, 16);
              }
              while (v43);
            }

            v386 = 0u;
            v385 = 0u;
            v384 = 0u;
            v383 = 0u;
            objc_msgSend(v301, "recognitionStrings");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v383, v426, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v384;
              while (2)
              {
                for (i8 = 0; i8 != v49; ++i8)
                {
                  if (*(_QWORD *)v384 != v50)
                    objc_enumerationMutation(v48);
                  v52 = *(void **)(*((_QWORD *)&v383 + 1) + 8 * i8);
                  if (!objc_msgSend(v52, "caseInsensitiveCompare:", v34))
                  {
                    v53 = v52;
                    goto LABEL_59;
                  }
                }
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v383, v426, 16);
                if (v49)
                  continue;
                break;
              }
            }
            v53 = 0;
LABEL_59:

            if (objc_msgSend(v53, "length"))
            {
              if (objc_msgSend(v41, "count") - v42 == 1)
              {
                v54 = [CACLanguageModel alloc];
                v55 = (void *)MEMORY[0x24BDBCE70];
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v301, kCACCommandParameterLabeledElement, 0);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "dictionaryWithObjectsAndKeys:", v56, kCACLanguageModelAttributeCommandParameters, v284, *MEMORY[0x24BEAFF60], 0);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = -[CACLanguageModel initWithText:identifier:attributes:](v54, "initWithText:identifier:attributes:", v53, 0, v57);
                goto LABEL_64;
              }
              if ((unint64_t)(objc_msgSend(v41, "count") - v42) >= 2)
              {
                v59 = [CACLanguageModel alloc];
                v60 = (void *)MEMORY[0x24BDBCE70];
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v301, kCACCommandParameterLabeledElementForDisambiguation, 0);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "dictionaryWithObjectsAndKeys:", v56, kCACLanguageModelAttributeCommandParameters, v284, *MEMORY[0x24BEAFF60], 0);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = -[CACLanguageModel initWithText:identifier:attributes:](v59, "initWithText:identifier:attributes:", v53, 0, v57);
LABEL_64:
                v61 = (void *)v58;

                -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v61);
              }
            }

            continue;
          }
        }
      }
      v295 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v391, v428, 16);
      if (!v295)
      {
LABEL_68:

        goto LABEL_148;
      }
    }
  }
  v398 = 0u;
  v397 = 0u;
  v396 = 0u;
  v395 = 0u;
  -[CACSpokenCommandManager _arrayFromExternalContextOverrideForBuiltInIdentifier:](self, "_arrayFromExternalContextOverrideForBuiltInIdentifier:", v283);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v395, v429, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v396;
    v14 = *MEMORY[0x24BDBD270];
    v15 = (_QWORD *)MEMORY[0x24BEAFF60];
    do
    {
      for (i9 = 0; i9 != v12; ++i9)
      {
        if (*(_QWORD *)v396 != v13)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v395 + 1) + 8 * i9);
        if (objc_msgSend(v17, "length"))
        {
          v18 = [CACLanguageModel alloc];
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v14, *v15, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[CACLanguageModel initWithText:identifier:attributes:](v18, "initWithText:identifier:attributes:", v17, 0, v19);

          -[CACLanguageModel addChildLanguageModel:](v310, "addChildLanguageModel:", v20);
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v395, v429, 16);
    }
    while (v12);
  }

LABEL_148:
  v298 = v309->_identifierBasedLanguageModelCache;
  objc_sync_enter(v298);
  +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v306 = (id)objc_msgSend(v165, "createRXLanguageObjectRefFromCACLanguageModel:ignoreBuiltInLMTable:", v310, 1);

  if (v306)
  {
    v402 = v283;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v402, 1);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v167 = objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF20]);
    v168 = (_QWORD *)MEMORY[0x24BEAFF20];
    if ((v167 & 1) != 0 || objc_msgSend(v283, "isEqualToString:", *MEMORY[0x24BEAFF28]))
    {
      v169 = *MEMORY[0x24BEAFF28];
      v401[0] = *v168;
      v401[1] = v169;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v401, 2);
      v170 = objc_claimAutoreleasedReturnValue();

      v166 = (void *)v170;
    }
    v317 = 0u;
    v318 = 0u;
    v315 = 0u;
    v316 = 0u;
    v171 = v166;
    v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v315, v400, 16);
    if (v172)
    {
      v173 = *(_QWORD *)v316;
      do
      {
        for (i10 = 0; i10 != v172; ++i10)
        {
          if (*(_QWORD *)v316 != v173)
            objc_enumerationMutation(v171);
          -[NSMutableDictionary objectForKey:](v309->_identifierBasedLanguageModelCache, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v315 + 1) + 8 * i10));
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = v175;
          if (v175)
          {
            objc_msgSend(v175, "setIsCurrent:", 1);
            objc_msgSend(v176, "languageModel");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v176, "rxLanguageObject");
            objc_msgSend(v177, "removeAllChildren");
            objc_msgSend(v177, "addChildLanguageModel:", v310);
            if (RXLanguageObjectGetCount() < 1)
            {
              RXLanguageObjectAddObject();
            }
            else
            {
              v178 = -[CACRXLanguageObjectWrapper initWithRXLanguageObject:]([CACRXLanguageObjectWrapper alloc], "initWithRXLanguageObject:", RXLanguageObjectGetObjectAtIndex());
              if (v178)
              {
                oldRXLangaugeObjects = v309->_oldRXLangaugeObjects;
                v180 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
                objc_msgSend(v180, "stringWithFormat:", CFSTR("%f"), v181);
                v182 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKey:](oldRXLangaugeObjects, "setObject:forKey:", v178, v182);

                RXLanguageObjectSetObjectAtIndex();
              }

            }
          }

        }
        v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v315, v400, 16);
      }
      while (v172);
    }

    RXRelease(v306);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v184 = v183;
  -[NSMutableDictionary allKeys](v309->_oldRXLangaugeObjects, "allKeys");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = (void *)objc_msgSend(v185, "copy");

  v313 = 0u;
  v314 = 0u;
  v311 = 0u;
  v312 = 0u;
  v187 = v186;
  v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v311, v399, 16);
  if (v188)
  {
    v189 = *(_QWORD *)v312;
    v190 = v184 + -60.0;
    do
    {
      for (i11 = 0; i11 != v188; ++i11)
      {
        if (*(_QWORD *)v312 != v189)
          objc_enumerationMutation(v187);
        v192 = *(void **)(*((_QWORD *)&v311 + 1) + 8 * i11);
        objc_msgSend(v192, "doubleValue");
        if (v193 < v190)
          -[NSMutableDictionary removeObjectForKey:](v309->_oldRXLangaugeObjects, "removeObjectForKey:", v192);
      }
      v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v311, v399, 16);
    }
    while (v188);
  }

  objc_sync_exit(v298);
LABEL_177:

}

uint64_t __70__CACSpokenCommandManager__updateLanguageModelForBuiltInLMIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;

  CACLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __70__CACSpokenCommandManager__updateLanguageModelForBuiltInLMIdentifier___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "forceSynchronizeRecognizersForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF30]);
}

- (id)_arrayFromExternalContextOverrideForBuiltInIdentifier:(id)a3
{
  NSDictionary *externalContextOverrideTable;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  externalContextOverrideTable = self->_externalContextOverrideTable;
  v5 = a3;
  -[NSDictionary objectForKey:](externalContextOverrideTable, "objectForKey:", CFSTR("CommandParameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSDictionary objectForKey:](self->_externalContextOverrideTable, "objectForKey:", CFSTR("CommandParameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (id)labeledElementsFromScreenWithTitle:(id)a3
{
  return -[CACLabeledElementsCollection collectedElementsWithTitle:](self->_labeledScreenElementsCollection, "collectedElementsWithTitle:", a3);
}

- (id)labeledElementsFromScreenWithTrait:(unint64_t)a3
{
  return -[CACLabeledElementsCollection collectedElementsWithTrait:](self->_labeledScreenElementsCollection, "collectedElementsWithTrait:", a3);
}

- (id)labeledElementsFromScreen
{
  return -[CACLabeledElementsCollection collectedElements](self->_labeledScreenElementsCollection, "collectedElements");
}

- (id)_stringInRecognitionLocaleFormatFromIntegerValue:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setNumberStyle:", 1);
  v5 = (void *)MEMORY[0x24BDBCEA0];
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeWithLocaleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "setLocale:", v8);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unsigned)currentInteractionLevel
{
  return -[CACSpokenCommandManager currentInteractionLevelPassingBackTopReferencingObject:](self, "currentInteractionLevelPassingBackTopReferencingObject:", 0);
}

- (unsigned)currentInteractionLevelPassingBackTopReferencingObject:(id *)a3
{
  NSMutableDictionary *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = self->_recognizerInteractionLevels;
  objc_sync_enter(v4);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_recognizerInteractionLevels, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "intValue");
        if (v12 > v6)
        {
          -[NSMutableDictionary objectForKey:](self->_recognizerInteractionLevels, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastObject");
          v14 = objc_claimAutoreleasedReturnValue();

          v6 = v12;
          v7 = (void *)v14;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v7);
  objc_sync_exit(v4);

  return v6;
}

- (BOOL)_pushInteractionLevel:(unsigned int)a3 referencingObject:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[5];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d"), v4);
    v8 = self->_recognizerInteractionLevels;
    objc_sync_enter(v8);
    -[NSMutableDictionary objectForKey:](self->_recognizerInteractionLevels, "objectForKey:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;
    v11 = (void *)v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_recognizerInteractionLevels, "setObject:forKey:", v11, v7);
    }
    objc_msgSend(v11, "addObject:", v6);

    objc_sync_exit(v8);
    if (!v9)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __67__CACSpokenCommandManager__pushInteractionLevel_referencingObject___block_invoke;
      block[3] = &unk_24F2AA860;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      -[CACSpokenCommandManager forceElementFetchWithReason:](self, "forceElementFetchWithReason:", CFSTR("Interaction pushInteractionLevel"));
      -[CACSpokenCommandManager updateStatusIndicatorView](self, "updateStatusIndicatorView");
      CACLogRecognition();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CACSpokenCommandManager _pushInteractionLevel:referencingObject:].cold.2(v4, v12, v13, v14, v15, v16, v17, v18);

      v10 = 1;
    }
  }
  else
  {
    CACLogRecognition();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CACSpokenCommandManager _pushInteractionLevel:referencingObject:].cold.1();
    v10 = 0;
  }

  return v10;
}

uint64_t __67__CACSpokenCommandManager__pushInteractionLevel_referencingObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAnyTransientOverlay");
}

- (BOOL)_popInteractionLevel:(unsigned int)a3 referencingObject:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v4 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%d"), v4);
  v8 = self->_recognizerInteractionLevels;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKey:](self->_recognizerInteractionLevels, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    if (objc_msgSend(v9, "count") == 1)
      objc_msgSend(v9, "removeLastObject");
  }
  else
  {
    v24 = v4;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "isEqual:", v6) & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v15 = v14;

      v4 = v24;
      if (!v15)
        goto LABEL_15;
      objc_msgSend(v10, "removeObject:", v15);
    }
    else
    {
LABEL_10:

      v4 = v24;
LABEL_15:
      objc_msgSend(v10, "removeLastObject");
      v15 = 0;
    }

  }
  v16 = objc_msgSend(v9, "count");
  if (v16)
  {

    objc_sync_exit(v8);
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_recognizerInteractionLevels, "removeObjectForKey:", v7);

    objc_sync_exit(v8);
    -[CACSpokenCommandManager forceElementFetchWithReason:](self, "forceElementFetchWithReason:", CFSTR("Interaction popInteractionLevel"));
    -[CACSpokenCommandManager updateStatusIndicatorView](self, "updateStatusIndicatorView");
    CACLogRecognition();
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR))
      -[CACSpokenCommandManager _popInteractionLevel:referencingObject:].cold.1(v4, &v8->super.super, v17, v18, v19, v20, v21, v22);
  }

  return v16 == 0;
}

- (void)_resetInteractionLevel
{
  NSMutableDictionary *obj;

  obj = self->_recognizerInteractionLevels;
  objc_sync_enter(obj);
  -[NSMutableDictionary removeAllObjects](self->_recognizerInteractionLevels, "removeAllObjects");
  objc_sync_exit(obj);

}

- (void)setDictationRecognizerMode:(int)a3
{
  CACSpokenCommandManager *v4;
  int dictationRecognizerMode;

  v4 = self;
  objc_sync_enter(v4);
  dictationRecognizerMode = v4->_dictationRecognizerMode;
  if (dictationRecognizerMode != 1)
    v4->_attentionAwarePreviousDictationRecognizerMode = dictationRecognizerMode;
  v4->_dictationRecognizerMode = a3;
  objc_sync_exit(v4);

  -[CACSpokenCommandManager synchronizeRecognizersWithReason:](v4, "synchronizeRecognizersWithReason:", kSRUISyncReasonRecognizerModeChanged);
}

- (int)dictationRecognizerMode
{
  CACSpokenCommandManager *v2;
  int dictationRecognizerMode;

  v2 = self;
  objc_sync_enter(v2);
  dictationRecognizerMode = v2->_dictationRecognizerMode;
  objc_sync_exit(v2);

  return dictationRecognizerMode;
}

- (void)enterSleepInteractionLevel
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[CACSpokenCommandManager _pushInteractionLevel:referencingObject:](self, "_pushInteractionLevel:referencingObject:", 1, self))
  {
    +[CACUserHintsManager sharedManager](CACUserHintsManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "shouldDisplayUserHintAfterRegisteringIdentifier:", CFSTR("EnteringCommandSleep"));

    if (v3)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.EnteringCommandSleep"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "primaryStringForCommandIdentifier:", CFSTR("System.WakeListening"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayMessageString:type:", v9, 0);

    }
  }
}

- (void)exitSleepInteractionLevel
{
  -[CACSpokenCommandManager _popInteractionLevel:referencingObject:](self, "_popInteractionLevel:referencingObject:", 1, self);
}

- (BOOL)_telephonyRequiresAirPods
{
  return MGGetBoolAnswer() ^ 1;
}

- (id)_telephonyQueue
{
  if (_telephonyQueue_onceToken != -1)
    dispatch_once(&_telephonyQueue_onceToken, &__block_literal_global_387);
  return (id)_telephonyQueue_sQueue;
}

void __42__CACSpokenCommandManager__telephonyQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.speech.CallCenterQueue", 0);
  v1 = (void *)_telephonyQueue_sQueue;
  _telephonyQueue_sQueue = (uint64_t)v0;

}

- (void)_microphoneTurnedOffAfterInteruption
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD block[5];
  id v10;
  _QWORD v11[5];

  if (self->_initialListenRequestWasSuccessful)
  {
    if (-[CACSpokenCommandManager currentInteractionLevel](self, "currentInteractionLevel") == 2)
    {
      CACLogAudio();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_229A40000, v3, OS_LOG_TYPE_INFO, "Received excessive notification of audio loss!", v8, 2u);
      }
    }
    else
    {
      v4 = (void *)MEMORY[0x24BEB4938];
      -[CACSpokenCommandManager _telephonyQueue](self, "_telephonyQueue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "callCenterWithQueue:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[CACSpokenCommandManager _telephonyQueue](self, "_telephonyQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_3;
      block[3] = &unk_24F2AAD70;
      block[4] = self;
      v10 = v6;
      v3 = v6;
      dispatch_async(v7, block);

      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_390);
    }

    -[CACSpokenCommandManager _pushInteractionLevel:referencingObject:](self, "_pushInteractionLevel:referencingObject:", 2, self);
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke;
    v11[3] = &unk_24F2AA860;
    v11[4] = self;
    if (_microphoneTurnedOffAfterInteruption_sRetryMicToken != -1)
      dispatch_once(&_microphoneTurnedOffAfterInteruption_sRetryMicToken, v11);
  }
}

void __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_2;
  block[3] = &unk_24F2AA860;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayRetryMessageAndRetryGrabbingMic");
}

void __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 40), "incomingCall");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setTelephonyInterruptedListening:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "incomingVideoCall");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      v3 = 1;
    else
      v3 = objc_msgSend(*(id *)(a1 + 40), "hasCurrentCalls");
    objc_msgSend(*(id *)(a1 + 32), "setTelephonyInterruptedListening:", v3);

  }
}

void __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_4()
{
  void *v0;
  id v1;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ListeningInterruptionBegan"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayMessageString:type:", v0, 1);

}

- (void)_microphoneTurnedOnAfterInteruption
{
  void *v3;
  char v4;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_attentionIsLostWithListeningOffAction");

  if ((v4 & 1) == 0)
    -[CACSpokenCommandManager _popInteractionLevel:referencingObject:](self, "_popInteractionLevel:referencingObject:", 2, self);
}

- (void)_microphoneTurnedOn
{
  if (!self->_initialListenRequestWasSuccessful)
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  self->_initialListenRequestWasSuccessful = 1;
  -[CACSpokenCommandManager updateStatusIndicatorView](self, "updateStatusIndicatorView");
}

- (BOOL)_attentionIsLostWithListeningOffAction
{
  return self->_attentionAwareStatus == 2
      && -[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("ListeningOffAndOn"));
}

- (void)displayRetryMessageAndRetryGrabbingMic
{
  -[CACSpokenCommandManager attemptGrabbingMic:](self, "attemptGrabbingMic:", &unk_24F2CEB48);
}

- (void)attemptGrabbingMic:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  NSObject *recognizerSynchronizationDispatchQueue;
  void *v8;
  _QWORD block[5];

  v4 = objc_msgSend(a3, "integerValue");
  if (self->_initialListenRequestWasSuccessful)
  {
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  }
  else
  {
    v5 = v4;
    v6 = (double)v4 * 10.0;
    if (v6 <= 80.0)
    {
      if (!v4)
        -[CACSpokenCommandManager displayRetryMessage](self, "displayRetryMessage");
      if (v6 <= 80.0 && !self->_initialListenRequestWasSuccessful)
      {
        recognizerSynchronizationDispatchQueue = self->_recognizerSynchronizationDispatchQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __46__CACSpokenCommandManager_attemptGrabbingMic___block_invoke;
        block[3] = &unk_24F2AA860;
        block[4] = self;
        dispatch_async(recognizerSynchronizationDispatchQueue, block);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5 + 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACSpokenCommandManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_attemptGrabbingMic_, v8, 10.0);

      }
    }
    else
    {
      -[CACSpokenCommandManager displayMessageAndQuitVoiceControl](self, "displayMessageAndQuitVoiceControl");
    }
  }
}

uint64_t __46__CACSpokenCommandManager_attemptGrabbingMic___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetRecognitionSystems");
}

- (void)displayRetryMessage
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_399);
}

void __46__CACSpokenCommandManager_displayRetryMessage__block_invoke()
{
  void *v0;
  id v1;

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.MicrophoneBusy"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "displayMessageString:type:", v1, 0);

}

- (void)displayMessageAndQuitVoiceControl
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_402);
}

void __60__CACSpokenCommandManager_displayMessageAndQuitVoiceControl__block_invoke()
{
  void *v0;
  double v1;
  dispatch_time_t v2;
  id v3;

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.MicrophoneCannotBeObtained"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "displayMessageString:type:", v3, 1);

  +[CACDisplayManager durationToDisplayMessageString:](CACDisplayManager, "durationToDisplayMessageString:", v3);
  v2 = dispatch_time(0, (uint64_t)(v1 * 1000000000.0));
  dispatch_after(v2, MEMORY[0x24BDAC9B8], &__block_literal_global_405);

}

uint64_t __60__CACSpokenCommandManager_displayMessageAndQuitVoiceControl__block_invoke_2()
{
  void *v0;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCommandAndControlEnabled:", 0);

  return _AXSCommandAndControlCarPlaySetEnabled();
}

- (void)attentionAwareLost
{
  id v3;

  self->_attentionAwareStatus = 2;
  if (-[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("SleepAndWake")))
  {
    -[CACSpokenCommandManager enterSleepInteractionLevel](self, "enterSleepInteractionLevel");
  }
  else if (-[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("ListeningOffAndOn")))
  {
    -[CACSpokenCommandManager _pushInteractionLevel:referencingObject:](self, "_pushInteractionLevel:referencingObject:", 2, self);
  }
  else if (-[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("DictationOffAndNormal")))
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDictationRecognizerMode:", 1);

  }
}

- (void)attentionAwareGained
{
  void *v3;
  id v4;

  self->_attentionAwareStatus = 1;
  if (-[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("SleepAndWake")))
  {
    if (-[CACSpokenCommandManager isListening](self, "isListening"))
    {
      +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rxRecognitionSystemReset");

    }
    -[CACSpokenCommandManager exitSleepInteractionLevel](self, "exitSleepInteractionLevel");
  }
  else if (-[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("ListeningOffAndOn")))
  {
    -[CACSpokenCommandManager _popInteractionLevel:referencingObject:](self, "_popInteractionLevel:referencingObject:", 2, self);
  }
  else if (-[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("DictationOffAndNormal")))
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDictationRecognizerMode:", self->_attentionAwarePreviousDictationRecognizerMode);

  }
}

- (void)attentionAwareInterrupted
{
  void *v3;
  id v4;

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.CameraInterruption"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayMessageString:type:", v4, 0);

  -[CACSpokenCommandManager attentionAwareGained](self, "attentionAwareGained");
}

- (void)attentionAwareInterruptionEnded
{
  void *v2;
  id v3;

  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.CameraInterruptionEnded"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayMessageString:type:", v3, 0);

}

- (void)_attentionAwareSettingChanged
{
  NSObject *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSString **p_currentAttentionAwarenessAction;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CACLogAttentionAware();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_229A40000, v3, OS_LOG_TYPE_INFO, "Attention Aware setting changed", (uint8_t *)&v13, 2u);
  }

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attentionAwareAction");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "carPlayConnected");

  if (v7)
  {

    CACLogAttentionAware();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_229A40000, v8, OS_LOG_TYPE_INFO, "Disabling attention aware due to carplay active", (uint8_t *)&v13, 2u);
    }

    v5 = CFSTR("None");
  }
  CACLogAttentionAware();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v5;
    _os_log_impl(&dword_229A40000, v9, OS_LOG_TYPE_INFO, "Resolved attention aware setting - %@", (uint8_t *)&v13, 0xCu);
  }

  if (!-[NSString isEqualToString:](self->_currentAttentionAwarenessAction, "isEqualToString:", v5))
  {
    p_currentAttentionAwarenessAction = &self->_currentAttentionAwarenessAction;
    if ((-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("None")) & 1) != 0)
    {
      if (self->_isAttentionAwareClientRunning)
      {
        self->_isAttentionAwareClientRunning = 0;
        self->_attentionAwareStatus = 0;
        +[CACUserAttentionInterface sharedManager](CACUserAttentionInterface, "sharedManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stopUserAttentionControllerIfNeeded");
LABEL_15:

      }
    }
    else if (!self->_isAttentionAwareClientRunning)
    {
      self->_isAttentionAwareClientRunning = 1;
      +[CACUserAttentionInterface sharedManager](CACUserAttentionInterface, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startUserAttentionControllerIfNeededForTypes:", 1);
      goto LABEL_15;
    }
    if (-[NSString isEqualToString:](*p_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("SleepAndWake")))
    {
      -[CACSpokenCommandManager exitSleepInteractionLevel](self, "exitSleepInteractionLevel");
    }
    else if (-[NSString isEqualToString:](*p_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("ListeningOffAndOn")))
    {
      -[CACSpokenCommandManager _popInteractionLevel:referencingObject:](self, "_popInteractionLevel:referencingObject:", 2, self);
    }
    else if (-[NSString isEqualToString:](*p_currentAttentionAwarenessAction, "isEqualToString:", CFSTR("DictationOffAndNormal")))
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDictationRecognizerMode:", self->_attentionAwarePreviousDictationRecognizerMode);

    }
    objc_storeStrong((id *)&self->_currentAttentionAwarenessAction, v5);
  }

}

- (void)beginObservingApplications
{
  FBSApplicationLibrary *v3;
  FBSApplicationLibrary *appLibrary;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (!self->_appLibrary)
  {
    v3 = (FBSApplicationLibrary *)objc_alloc_init(MEMORY[0x24BE383F0]);
    appLibrary = self->_appLibrary;
    self->_appLibrary = v3;

  }
  -[CACSpokenCommandManager appLibrary](self, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__CACSpokenCommandManager_beginObservingApplications__block_invoke;
  v11[3] = &unk_24F2ABA68;
  v11[4] = self;
  objc_msgSend(v5, "observeDidAddApplicationsWithBlock:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommandManager appLibrary](self, "appLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __53__CACSpokenCommandManager_beginObservingApplications__block_invoke_416;
  v10[3] = &unk_24F2ABA68;
  v10[4] = self;
  objc_msgSend(v8, "observeDidRemoveApplicationsWithBlock:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CACSpokenCommandManager setApplicationAddedObservationToken:](self, "setApplicationAddedObservationToken:", v7);
  -[CACSpokenCommandManager setApplicationRemovedObservationToken:](self, "setApplicationRemovedObservationToken:", v9);

}

void __53__CACSpokenCommandManager_beginObservingApplications__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CACLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_INFO, "Resyncing: Application newly added %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "synchronizeRecognizersWithReason:", kSRUISyncReasonApplicationsChanged);
}

void __53__CACSpokenCommandManager_beginObservingApplications__block_invoke_416(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CACLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_INFO, "Resyncing: Application removed %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "synchronizeRecognizersWithReason:", kSRUISyncReasonApplicationsChanged);
}

- (void)stopObservingApplications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CACSpokenCommandManager appLibrary](self, "appLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandManager applicationAddedObservationToken](self, "applicationAddedObservationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserverForToken:", v4);

  -[CACSpokenCommandManager appLibrary](self, "appLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandManager applicationRemovedObservationToken](self, "applicationRemovedObservationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserverForToken:", v6);

  -[CACSpokenCommandManager setApplicationAddedObservationToken:](self, "setApplicationAddedObservationToken:", 0);
  -[CACSpokenCommandManager setApplicationRemovedObservationToken:](self, "setApplicationRemovedObservationToken:", 0);
}

- (void)synchronizeRecognizersWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  CACSpokenCommandManager *v9;

  v4 = a3;
  v5 = v4;
  if (self->_isListening)
  {
    if (objc_msgSend(v4, "isEqualToString:", kSRUISyncReasonOverlayStateChanged))
    {
      -[CACSpokenCommandManager _markAsDirtyForBuiltInLMIdentifier:](self, "_markAsDirtyForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF20]);
      if (-[CACSpokenCommandManager isActiveOverlayType:](self, "isActiveOverlayType:", CFSTR("NumberedGrid")))
        -[CACSpokenCommandManager _markAsDirtyForBuiltInLMIdentifier:](self, "_markAsDirtyForBuiltInLMIdentifier:", *MEMORY[0x24BEAFF50]);
    }
    -[CACSpokenCommandManager recognizerSynchronizationDispatchQueue](self, "recognizerSynchronizationDispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__CACSpokenCommandManager_synchronizeRecognizersWithReason___block_invoke;
    v7[3] = &unk_24F2AAD70;
    v8 = v5;
    v9 = self;
    dispatch_async(v6, v7);

  }
}

void __60__CACSpokenCommandManager_synchronizeRecognizersWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  RXSignpostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    *(_DWORD *)buf = 136315138;
    v53 = v3;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdPrep: Syncing recognizers", "%s", buf, 0xCu);
  }

  v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (*(double *)(v5 + 128) == 0.0)
    *(_QWORD *)(v5 + 128) = 0;
  objc_sync_exit(v4);

  v6 = 2.0;
  do
  {
    objc_msgSend(*(id *)(a1 + 40), "labeledScreenElementsCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCollecting");

    if (!v8)
      break;
    usleep(0x186A0u);
    v6 = v6 + -0.1;
  }
  while (v6 > 0.0);
  v9 = *(id *)(*(_QWORD *)(a1 + 40) + 112);
  objc_sync_enter(v9);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 112), "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_sync_exit(v9);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 40), "_updateLanguageModelForBuiltInLMIdentifier:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 40), "_pushLeadingContextToSpeechRecognitionSystem");
  objc_msgSend(*(id *)(a1 + 40), "_pushSecureFieldStatusToSpeechRecognitionSystem");
  v16 = *(id *)(*(_QWORD *)(a1 + 40) + 88);
  objc_sync_enter(v16);
  v17 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "copy");
  objc_sync_exit(v16);

  v18 = objc_opt_new();
  v19 = (void *)sEvaluatorValueCache;
  sEvaluatorValueCache = v18;

  v20 = objc_opt_new();
  v21 = (void *)sEvaluatorResultCache;
  sEvaluatorResultCache = v20;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = v17;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "synchronizeWithReason:", *(_QWORD *)(a1 + 32), (_QWORD)v42);
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v23);
  }

  v26 = (void *)sEvaluatorValueCache;
  sEvaluatorValueCache = 0;

  v27 = (void *)sEvaluatorResultCache;
  sEvaluatorResultCache = 0;

  v28 = *(id *)(a1 + 40);
  objc_sync_enter(v28);
  v29 = *(_QWORD *)(a1 + 40);
  if (*(double *)(v29 + 128) == 0.0)
    *(_QWORD *)(v29 + 128) = 0;
  objc_sync_exit(v28);

  +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "recognitionSystemRef");

  if (v31)
  {
    v32 = objc_msgSend(*(id *)(a1 + 40), "currentInteractionLevel") - 1;
    v33 = *(_QWORD *)(a1 + 40);
    if (v32 >= 2)
    {
      v35 = objc_msgSend((id)v33, "dictationRecognizerMode");
      v33 = *(_QWORD *)(a1 + 40);
      if (v35 == 1 || !*(_QWORD *)(v33 + 32))
      {
        v34 = 2;
      }
      else
      {
        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "carPlayConnected");

        v34 = v37 ? 2 : 1;
        v33 = *(_QWORD *)(a1 + 40);
      }
    }
    else
    {
      v34 = 3;
    }
    if (*(_DWORD *)(v33 + 360) != (_DWORD)v34)
    {
      +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setRxRecognitionSystemResetMode:", v34);

      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 360) = v34;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", kSRUISyncReasonRecognizerModeChanged, (_QWORD)v42)&& objc_msgSend(*(id *)(a1 + 40), "isListening"))
  {
    +[CACSpeechSystem speechSystem](CACSpeechSystem, "speechSystem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "rxRecognitionSystemReset");

  }
  RXSignpostLog();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v40))
  {
    v41 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
    *(_DWORD *)buf = 136315138;
    v53 = v41;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdPrep: Syncing recognizers", "%s", buf, 0xCu);
  }

}

- (BOOL)isSynchronizingRecognizers
{
  CACSpokenCommandManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_recognizerSyncTransactionID != 0.0;
  objc_sync_exit(v2);

  return v3;
}

- (id)activeCommandIdentifiers
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  NSMutableArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  obj = self->_recognizers;
  objc_sync_enter(obj);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_recognizers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v8, "isListening"))
        {
          v18 = 0u;
          v19 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v8, "spokenCommands");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v17;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v17 != v11)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "identifier");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v13);

              }
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            }
            while (v10);
          }

        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  objc_sync_exit(obj);
  return v3;
}

- (void)forceSynchronizeRecognizersForBuiltInLMIdentifier:(id)a3
{
  -[CACSpokenCommandManager _markAsDirtyForBuiltInLMIdentifier:](self, "_markAsDirtyForBuiltInLMIdentifier:", a3);
  -[CACSpokenCommandManager synchronizeRecognizersWithReason:](self, "synchronizeRecognizersWithReason:", kSRUISyncReasonRecognizersChanged);
}

- (void)suspendCommandDispatching:(BOOL)a3
{
  NSMutableArray *obj;

  obj = self->_recognizedCommandsReadyForDispatch;
  objc_sync_enter(obj);
  self->_suspendCommandDispatching = a3;
  if (!a3)
    -[CACSpokenCommandManager dispatchPendingCommand](self, "dispatchPendingCommand");
  objc_sync_exit(obj);

}

- (void)handleRecognizedCommand:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSMutableArray *v9;

  v4 = a3;
  CACLogRecognition();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CACSpokenCommandManager handleRecognizedCommand:].cold.1(v4, v5);

  if (self->_commandRecognitionLogPath)
  {
    -[CACSpokenCommandManager _appendSpokenCommand:toLogAtPath:](self, "_appendSpokenCommand:toLogAtPath:", v4);
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommandManager setRecognizedCommandIdentifier:](self, "setRecognizedCommandIdentifier:", v6);

    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CACSpokenCommandManager shouldIgnoreCommand:](self, "shouldIgnoreCommand:", v7);

    if (!v8)
    {
      v9 = self->_recognizedCommandsReadyForDispatch;
      objc_sync_enter(v9);
      -[NSMutableArray addObject:](self->_recognizedCommandsReadyForDispatch, "addObject:", v4);
      if (!self->_suspendCommandDispatching)
        -[CACSpokenCommandManager dispatchPendingCommand](self, "dispatchPendingCommand");
      objc_sync_exit(v9);

    }
  }

}

- (void)dispatchPendingCommand
{
  void *v3;
  NSObject *commandExecutionDispatchQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  CACSpokenCommandManager *v19;

  if (-[NSMutableArray count](self->_recognizedCommandsReadyForDispatch, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_recognizedCommandsReadyForDispatch, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_recognizedCommandsReadyForDispatch, "removeObjectAtIndex:", 0);
    if (v3)
    {
      commandExecutionDispatchQueue = self->_commandExecutionDispatchQueue;
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke;
      v17 = &unk_24F2AAD70;
      v5 = v3;
      v18 = v5;
      v19 = self;
      dispatch_async(commandExecutionDispatchQueue, &v14);
      +[CACMessageTracerUtilities sharedCACMessageTracerUtilities](CACMessageTracerUtilities, "sharedCACMessageTracerUtilities", v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recognizedParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRecognitionProperties:", v7);

      +[CACMessageTracerUtilities sharedCACMessageTracerUtilities](CACMessageTracerUtilities, "sharedCACMessageTracerUtilities");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = objc_msgSend(v5, "performSelector:withObject:", sel_customProperties, 0);
      else
        v9 = 0;
      objc_msgSend(v8, "setCustomUserCommandProperties:", v9);

      if ((objc_msgSend(v5, "executedIndirectly") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isScreenLocked");

        if ((v11 & 1) == 0)
        {
          +[CACMessageTracerUtilities sharedCACMessageTracerUtilities](CACMessageTracerUtilities, "sharedCACMessageTracerUtilities");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "logCommandWithIdentifier:", v13);

        }
      }

    }
  }
}

void __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "commandRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerSignPostEndProcessingForSpeechRecognizer:message:", v4, v5);

  objc_msgSend(*(id *)(a1 + 40), "stagedTextInsertionSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCommandIdentifier:", v7);

  objc_msgSend(*(id *)(a1 + 40), "stagedTextInsertionSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recognizedParameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRecognizedParams:", v9);

  objc_msgSend(*(id *)(a1 + 32), "performAction");
  dispatch_get_global_queue(21, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v10, &__block_literal_global_417);

  objc_msgSend(*(id *)(a1 + 40), "setNextPreviousResolverSpokenCommand:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setRepeatingSpokenCommand:", *(_QWORD *)(a1 + 32));
  +[CACRecordedUserActionManager sharedManager](CACRecordedUserActionManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addRecognizedSpokenCommand:", *(_QWORD *)(a1 + 32));

  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("Command executed: %@"), v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "forceElementFetchWithReason:", v14);
}

void __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke_2()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE51AF8], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v1 = (void *)objc_msgSend(v0, "newAssertionToDisableIdleTimerForReason:error:", CFSTR("CommandAndControl.CommandExecution"), &v4);
  v2 = v4;

  objc_msgSend(v1, "invalidate");
  if (v2)
  {
    CACLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke_2_cold_1();

  }
}

- (void)_appendSpokenCommand:(id)a3 toLogAtPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  FILE *v28;
  id v29;
  void (**synchronousRemoteRequestCompletionBlock)(id, void *, _QWORD);
  void *v31;
  id v32;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _QWORD v40[10];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v33 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "appendFormat:", CFSTR("%f\t"), v7);
  objc_msgSend(v5, "recognizedParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", kCACCommandParameterText);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@\t"), v9);

  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  objc_msgSend(v6, "appendFormat:", CFSTR("%@\t"), v10);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = *MEMORY[0x24BEAFF50];
  v40[0] = *MEMORY[0x24BEAFF30];
  v40[1] = v12;
  v13 = *MEMORY[0x24BEAFEF8];
  v40[2] = *MEMORY[0x24BEAFEF0];
  v40[3] = v13;
  v14 = *MEMORY[0x24BEAFF28];
  v40[4] = *MEMORY[0x24BEAFF20];
  v40[5] = v14;
  v15 = *MEMORY[0x24BEAFF40];
  v40[6] = *MEMORY[0x24BEAFEE8];
  v40[7] = v15;
  v16 = *MEMORY[0x24BEAFF18];
  v40[8] = *MEMORY[0x24BEAFF10];
  v40[9] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v23 = v5;
        objc_msgSend(v5, "recognizedParameters");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", kCACCommandParameterText);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
          objc_msgSend(v11, "appendFormat:", CFSTR("%@:%@\t"), v22, v26);

        v5 = v23;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v19);
  }

  objc_msgSend(v33, "stringByExpandingTildeInPath");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = fopen((const char *)objc_msgSend(v27, "UTF8String"), "a");

  v29 = objc_retainAutorelease(v11);
  fprintf(v28, "%s\n", (const char *)objc_msgSend(v29, "UTF8String"));
  fclose(v28);
  synchronousRemoteRequestCompletionBlock = (void (**)(id, void *, _QWORD))self->_synchronousRemoteRequestCompletionBlock;
  if (synchronousRemoteRequestCompletionBlock)
  {
    v39 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v39, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    synchronousRemoteRequestCompletionBlock[2](synchronousRemoteRequestCompletionBlock, v31, 0);

    v32 = self->_synchronousRemoteRequestCompletionBlock;
    self->_synchronousRemoteRequestCompletionBlock = 0;

  }
}

- (BOOL)shouldIgnoreCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CACSpokenCommandManager commandsToIgnore](self, "commandsToIgnore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[CACSpokenCommandManager commandsToIgnore](self, "commandsToIgnore", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "isEqualToString:", v4) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        v5 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return (char)v5;
}

- (void)_startSynchronousRemoteRecognitionWithCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id synchronousRemoteRequestCompletionBlock;
  CACSpokenCommandManager *obj;

  obj = self;
  v4 = a3;
  objc_sync_enter(obj);
  v5 = MEMORY[0x22E2D5D40](v4);

  synchronousRemoteRequestCompletionBlock = obj->_synchronousRemoteRequestCompletionBlock;
  obj->_synchronousRemoteRequestCompletionBlock = (id)v5;

  objc_sync_exit(obj);
}

- (void)_cancelSynchronousRemoteRecognition
{
  id synchronousRemoteRequestCompletionBlock;
  CACSpokenCommandManager *obj;

  obj = self;
  objc_sync_enter(obj);
  synchronousRemoteRequestCompletionBlock = obj->_synchronousRemoteRequestCompletionBlock;
  obj->_synchronousRemoteRequestCompletionBlock = 0;

  objc_sync_exit(obj);
}

- (void)didFinishExecutingSpokenCommand:(id)a3
{
  id v4;
  CACSpokenCommandManager *v5;
  void (**synchronousRemoteRequestCompletionBlock)(id, void *, _QWORD);
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  synchronousRemoteRequestCompletionBlock = (void (**)(id, void *, _QWORD))v5->_synchronousRemoteRequestCompletionBlock;
  if (synchronousRemoteRequestCompletionBlock)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    synchronousRemoteRequestCompletionBlock[2](synchronousRemoteRequestCompletionBlock, v7, 0);

    v8 = v5->_synchronousRemoteRequestCompletionBlock;
    v5->_synchronousRemoteRequestCompletionBlock = 0;

  }
  v9 = (void *)objc_opt_new();
  -[CACSpokenCommandManager setStagedTextInsertionSpecifier:](v5, "setStagedTextInsertionSpecifier:", v9);

  -[CACSpokenCommandManager _clearPreviousTextInsertionSpecifierBasedOnExecutedCommand:](v5, "_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand:", v4);
  objc_sync_exit(v5);

}

- (void)didFindCloseSpokenCommandIdentifiers:(id)a3
{
  id v4;
  CACSpokenCommandManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id synchronousRemoteRequestCompletionBlock;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_synchronousRemoteRequestCompletionBlock)
  {
    v6 = (void *)objc_opt_new();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](v5, "_templateSpokenCommandWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v6, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    (*((void (**)(void))v5->_synchronousRemoteRequestCompletionBlock + 2))();
    synchronousRemoteRequestCompletionBlock = v5->_synchronousRemoteRequestCompletionBlock;
    v5->_synchronousRemoteRequestCompletionBlock = 0;

  }
  objc_sync_exit(v5);

}

- (void)notifyUserOfCommandFailureUsingSound
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_433);
}

- (void)notifyUserOfCommandFailureWithTitle:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayMessageString:type:", v7, 1);
}

- (void)setNextPreviousResolverSpokenCommand:(id)a3
{
  CACSpokenCommandManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "identifier");
  v5 = (CACSpokenCommandManager *)objc_claimAutoreleasedReturnValue();
  if ((-[CACSpokenCommandManager isEqualToString:](v5, "isEqualToString:", CFSTR("Text.SelectNext")) & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v11, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Text.SelectPrevious")))
    goto LABEL_7;
  objc_msgSend(v11, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("System.OverlayChooseLabel")))
  {
LABEL_6:

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v11, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("System.OverlayChooseLabelWithoutPrefix")) & 1) != 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v11, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("System.OverlayChooseAllLabels"));

  if ((v10 & 1) != 0)
    goto LABEL_9;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_currentNextPreviousResolverSpokenCommand, a3);
  objc_sync_exit(v5);
LABEL_8:

LABEL_9:
}

- (BOOL)isNextPreviousResolverSpokenCommandEmojiBased
{
  void *v2;
  char v3;

  -[CACSpokenCommand identifier](self->_currentNextPreviousResolverSpokenCommand, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Text.SelectEmojiWithPhrase"));

  return v3;
}

- (id)resolvedNextSpokenCommand
{
  CACSpokenCommandManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_currentNextPreviousResolverSpokenCommand)
  {
    -[CACSpokenCommandManager _nextResolverRelationships](v2, "_nextResolverRelationships");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommand identifier](v2->_currentNextPreviousResolverSpokenCommand, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)-[CACSpokenCommand copy](v2->_currentNextPreviousResolverSpokenCommand, "copy");
      objc_msgSend(v6, "setIdentifier:", v5);
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Text.SelectNext")) & 1) == 0)
      {
        -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](v2, "_templateSpokenCommandWithIdentifier:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          objc_msgSend(v6, "setAction:", objc_msgSend(v7, "action"));

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](v2, "_templateSpokenCommandWithIdentifier:", CFSTR("Text.SelectNextWord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)resolvedPreviousSpokenCommand
{
  CACSpokenCommandManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_currentNextPreviousResolverSpokenCommand)
  {
    -[CACSpokenCommandManager _previousResolverRelationships](v2, "_previousResolverRelationships");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommand identifier](v2->_currentNextPreviousResolverSpokenCommand, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)-[CACSpokenCommand copy](v2->_currentNextPreviousResolverSpokenCommand, "copy");
      objc_msgSend(v6, "setIdentifier:", v5);
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Text.SelectPrevious")) & 1) == 0)
      {
        -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](v2, "_templateSpokenCommandWithIdentifier:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          objc_msgSend(v6, "setAction:", objc_msgSend(v7, "action"));

      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](v2, "_templateSpokenCommandWithIdentifier:", CFSTR("Text.SelectPreviousWord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)_nextResolverRelationships
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CACSpokenCommandManager__nextResolverRelationships__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  if (_nextResolverRelationships_nextResolverRelationshipsLoad != -1)
    dispatch_once(&_nextResolverRelationships_nextResolverRelationshipsLoad, block);
  return self->_nextResolverRelationships;
}

void __53__CACSpokenCommandManager__nextResolverRelationships__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("Text.SelectCurrentCharacter"), CFSTR("Text.SelectNextCharacter"), CFSTR("Text.SelectNextCharacter"), CFSTR("Text.SelectNextCharacter"), CFSTR("Text.SelectPreviousCharacter"), CFSTR("Text.SelectNextCharactersUsingCardinalNumber"), CFSTR("Text.SelectNextCharactersUsingCardinalNumber"), CFSTR("Text.SelectNextCharactersUsingCardinalNumber"), CFSTR("Text.SelectPreviousCharactersUsingCardinalNumber"), CFSTR("Text.SelectNextWord"), CFSTR("Text.SelectCurrentWord"), CFSTR("Text.SelectNextWord"), CFSTR("Text.SelectNextWord"), CFSTR("Text.SelectNextWord"), CFSTR("Text.SelectPreviousWord"), CFSTR("Text.SelectNextWordsUsingCardinalNumber"), CFSTR("Text.SelectNextWordsUsingCardinalNumber"),
         CFSTR("Text.SelectNextWordsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousWordsUsingCardinalNumber"),
         CFSTR("Text.SelectNextSentence"),
         CFSTR("Text.SelectCurrentSentence"),
         CFSTR("Text.SelectNextSentence"),
         CFSTR("Text.SelectNextSentence"),
         CFSTR("Text.SelectNextSentence"),
         CFSTR("Text.SelectPreviousSentence"),
         CFSTR("Text.SelectNextSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectNextSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectNextSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectNextParagraph"),
         CFSTR("Text.SelectCurrentParagraph"),
         CFSTR("Text.SelectNextParagraph"),
         CFSTR("Text.SelectNextParagraph"),
         CFSTR("Text.SelectNextParagraph"),
         CFSTR("Text.SelectPreviousParagraph"),
         CFSTR("Text.SelectNextParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectNextParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectNextParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectNextLine"),
         CFSTR("Text.SelectCurrentLine"),
         CFSTR("Text.SelectNextLine"),
         CFSTR("Text.SelectNextLine"),
         CFSTR("Text.SelectNextLine"),
         CFSTR("Text.SelectPreviousLine"),
         CFSTR("Text.SelectNextLinesUsingCardinalNumber"),
         CFSTR("Text.SelectNextLinesUsingCardinalNumber"),
         CFSTR("Text.SelectNextLinesUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousLinesUsingCardinalNumber"),
         CFSTR("Text.SelectNext"),
         CFSTR("Text.SelectPhrase"),
         CFSTR("Text.SelectNext"),
         CFSTR("Text.SelectEmojiWithPhrase"),
         CFSTR("Text.SelectNext"),
         CFSTR("Text.SelectPhraseThroughPhrase"),
         CFSTR("Text.SelectNext"),
         CFSTR("Text.SelectNext"),
         CFSTR("Text.SelectNext"),
         CFSTR("Text.SelectPrevious"),
         0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 176);
  *(_QWORD *)(v3 + 176) = v2;

}

- (id)_previousResolverRelationships
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CACSpokenCommandManager__previousResolverRelationships__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  if (_previousResolverRelationships_previousResolverRelationshipsLoad != -1)
    dispatch_once(&_previousResolverRelationships_previousResolverRelationshipsLoad, block);
  return self->_previousResolverRelationships;
}

void __57__CACSpokenCommandManager__previousResolverRelationships__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("Text.SelectCurrentCharacter"), CFSTR("Text.SelectPreviousCharacter"), CFSTR("Text.SelectNextCharacter"), CFSTR("Text.SelectPreviousCharacter"), CFSTR("Text.SelectPreviousCharacter"), CFSTR("Text.SelectPreviousCharactersUsingCardinalNumber"), CFSTR("Text.SelectNextCharactersUsingCardinalNumber"), CFSTR("Text.SelectPreviousCharactersUsingCardinalNumber"), CFSTR("Text.SelectPreviousCharactersUsingCardinalNumber"), CFSTR("Text.SelectPreviousWord"), CFSTR("Text.SelectCurrentWord"), CFSTR("Text.SelectPreviousWord"), CFSTR("Text.SelectNextWord"), CFSTR("Text.SelectPreviousWord"), CFSTR("Text.SelectPreviousWord"), CFSTR("Text.SelectPreviousWordsUsingCardinalNumber"), CFSTR("Text.SelectNextWordsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousWordsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousWordsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousSentence"),
         CFSTR("Text.SelectCurrentSentence"),
         CFSTR("Text.SelectPreviousSentence"),
         CFSTR("Text.SelectNextSentence"),
         CFSTR("Text.SelectPreviousSentence"),
         CFSTR("Text.SelectPreviousSentence"),
         CFSTR("Text.SelectPreviousSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectNextSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousSentencesUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousParagraph"),
         CFSTR("Text.SelectCurrentParagraph"),
         CFSTR("Text.SelectPreviousParagraph"),
         CFSTR("Text.SelectNextParagraph"),
         CFSTR("Text.SelectPreviousParagraph"),
         CFSTR("Text.SelectPreviousParagraph"),
         CFSTR("Text.SelectPreviousParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectNextParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousParagraphsUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousLine"),
         CFSTR("Text.SelectCurrentLine"),
         CFSTR("Text.SelectPreviousLine"),
         CFSTR("Text.SelectNextLine"),
         CFSTR("Text.SelectPreviousLine"),
         CFSTR("Text.SelectPreviousLine"),
         CFSTR("Text.SelectPreviousLinesUsingCardinalNumber"),
         CFSTR("Text.SelectNextLinesUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousLinesUsingCardinalNumber"),
         CFSTR("Text.SelectPreviousLinesUsingCardinalNumber"),
         CFSTR("Text.SelectPrevious"),
         CFSTR("Text.SelectPhrase"),
         CFSTR("Text.SelectPrevious"),
         CFSTR("Text.SelectEmojiWithPhrase"),
         CFSTR("Text.SelectPrevious"),
         CFSTR("Text.SelectPhraseThroughPhrase"),
         CFSTR("Text.SelectPrevious"),
         CFSTR("Text.SelectNext"),
         CFSTR("Text.SelectPrevious"),
         CFSTR("Text.SelectPrevious"),
         0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 184);
  *(_QWORD *)(v3 + 184) = v2;

}

- (id)_templateSpokenCommandWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  int v14;
  id v15;
  NSMutableArray *v17;
  NSMutableArray *obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = self->_recognizers;
  objc_sync_enter(v17);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_recognizers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v19 = *(_QWORD *)v26;
    v20 = 0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v7, "spokenCommands", v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v12, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", v4);

              if (v14)
              {
                v15 = v12;

                v20 = v15;
                goto LABEL_16;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }
  else
  {
    v20 = 0;
  }

  objc_sync_exit(v17);
  return v20;
}

- (void)setRepeatingSpokenCommand:(id)a3
{
  void *v4;
  char v5;
  CACSpokenCommandManager *v6;
  uint64_t v7;
  CACSpokenCommand *currentRepeatingSpokenCommand;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("System.RepeatPreviousCommand"));

  if ((v5 & 1) == 0)
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = objc_msgSend(v9, "copy");
    currentRepeatingSpokenCommand = v6->_currentRepeatingSpokenCommand;
    v6->_currentRepeatingSpokenCommand = (CACSpokenCommand *)v7;

    objc_sync_exit(v6);
  }

}

- (void)stopAnyRepeatingSpokenCommand
{
  CACSpokenCommandManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_repeatingSpokenCommandRemainingCount = 0;
  objc_sync_exit(obj);

}

- (void)beginExecutingRepeatingSpokenCommandNumberOfTimes:(int64_t)a3 completionBlock:(id)a4
{
  CACSpokenCommandManager *v6;
  id v7;

  v7 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v6->_repeatingSpokenCommandRemainingCount = a3;
  -[CACSpokenCommand setExecutedIndirectly:](v6->_currentRepeatingSpokenCommand, "setExecutedIndirectly:", 1);
  objc_sync_exit(v6);

  -[CACSpokenCommandManager _executeNextRepeatWithCompletionBlock:](v6, "_executeNextRepeatWithCompletionBlock:", v7);
}

- (void)_executeNextRepeatWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *);
  CACSpokenCommandManager *v5;
  CACSpokenCommand *v6;
  uint64_t repeatingSpokenCommandRemainingCount;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  CACSpokenCommand *v17;
  void (**v18)(id, void *);

  v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_currentRepeatingSpokenCommand;
  repeatingSpokenCommandRemainingCount = v5->_repeatingSpokenCommandRemainingCount;
  objc_sync_exit(v5);

  if (repeatingSpokenCommandRemainingCount < 1)
  {
    CACMakeSuccessError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v10);
  }
  else
  {
    if (-[CACSpokenCommand isCustomCommand](v6, "isCustomCommand")
      || -[CACSpokenCommand isListening](v6, "isListening"))
    {
      goto LABEL_9;
    }
    -[CACSpokenCommand contextEvaluation](v6, "contextEvaluation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", kCACCommandContextRequiresNumberedElementsOverlay);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "BOOLValue"))
    {

LABEL_9:
      dispatch_get_global_queue(21, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke;
      block[3] = &unk_24F2AA9E0;
      block[4] = v5;
      v17 = v6;
      v18 = v4;
      dispatch_async(v14, block);

      goto LABEL_10;
    }
    -[CACSpokenCommand contextEvaluation](v6, "contextEvaluation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", kCACCommandContextRequiresAnyNumberedOverlay);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
      goto LABEL_9;
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("ErrorMessage.PreviousCommandNotAppropriate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CACMakeError(3002, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v15);

  }
LABEL_10:

}

void __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  objc_sync_exit(v2);

  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke_2;
  v7 = &unk_24F2ABAD0;
  v3 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setCompletionBlock:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "handleRecognizedCommand:", *(_QWORD *)(a1 + 40), v4, v5, v6, v7, v8);

}

uint64_t __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  double v2;

  +[CACSpokenCommand defaultDelayBetweenCommands](CACSpokenCommand, "defaultDelayBetweenCommands");
  usleep((v2 * 1000000.0));
  return objc_msgSend(*(id *)(a1 + 32), "_executeNextRepeatWithCompletionBlock:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isFetchingElements
{
  CACSpokenCommandManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fetchingTransactionID != 0.0;
  objc_sync_exit(v2);

  return v3;
}

- (void)forceElementFetchWithReason:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  CACSpokenCommandManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CACSpokenCommandManager_forceElementFetchWithReason___block_invoke;
  v6[3] = &unk_24F2AAD70;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __55__CACSpokenCommandManager_forceElementFetchWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Forced fetch: %@"), *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_scheduleFetchElementsWithDelay:andReason:", v2, 0.05);

}

- (void)forceElementFetch
{
  -[CACSpokenCommandManager forceElementFetchWithReason:](self, "forceElementFetchWithReason:", CFSTR("(No reason specified)"));
}

- (void)setNextFetchDelayFactor:(double)a3
{
  self->_nextFetchDelayFactor = a3;
}

- (id)_fetchPresentationElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  CACLocalAXElement *v16;
  CACLocalAXElement *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBADC8], "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeafNodePredicate:", &__block_literal_global_513);
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityLeafDescendantsWithOptions:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
        v14 = _AXCreateAXUIElementWithElement();
        if (v14)
        {
          v15 = (const void *)v14;
          v16 = [CACLocalAXElement alloc];
          v17 = -[CACLocalAXElement initWithAXUIElement:](v16, "initWithAXUIElement:", v15, (_QWORD)v19);
          -[CACLocalAXElement setLocalElement:](v17, "setLocalElement:", v13);
          objc_msgSend(v2, "addObject:", v17);
          CFRelease(v15);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  +[CACSignPostLog FetchElementsEventCompletedWithNumberOfElements:numberOfElementsAlreadyCached:](CACSignPostLog, "FetchElementsEventCompletedWithNumberOfElements:numberOfElementsAlreadyCached:", objc_msgSend(v2, "count"), 0);
  return v2;
}

uint64_t __53__CACSpokenCommandManager__fetchPresentationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement"))
    v3 = objc_msgSend(v2, "accessibilityRespondsToUserInteraction");
  else
    v3 = 0;

  return v3;
}

- (BOOL)elementIsOccluded:(id)a3 occludedAppScenes:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "fbSceneIdentifier", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "fbSceneIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)inCallServiceApplication
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "elementForAttribute:shouldFetchAttributes:", 1007, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "pid");
  if ((_DWORD)v2 == getpid())
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "uiElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectWithAXAttribute:", 3003);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.InCallService")))
      v4 = v3;
    else
      v4 = 0;

  }
  return v4;
}

- (void)_fetchElements
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Skipping fetch elements. A fetch elements transaction is already enqueued", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  char v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  id obj;
  void *v58;
  void *v59;
  NSObject *group;
  uint8_t buf[8];
  _QWORD v62[4];
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  _QWORD v67[5];
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD block[4];
  id v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 328);
  objc_sync_exit(v2);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "carPlayConnected");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementsForAttribute:", 1009);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentApplications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentApplications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(a1 + 32), "inCallServiceApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v85;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v85 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "bundleId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bundleId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
          {
            v9 = v11;
            goto LABEL_15;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
        if (v13)
          continue;
        break;
      }
    }

    objc_msgSend(v11, "arrayByAddingObject:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_chamoisSupportEnabledForVoiceControl"))
  {
    v20 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "containsObject:", v21);

    if ((v22 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFEA68], "systemApplication");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v23);

    }
    v24 = v20;

    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "focusedOccludedAppScenes");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v24;
  }
  else
  {
    v59 = (void *)MEMORY[0x24BDBD1A8];
  }
  v56 = v10;
  if (_AXSTwiceRemoteScreenEnabled())
  {
    v26 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDFEA68], "systemWideElement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "accessibilityUIServerApplication");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28 && (objc_msgSend(v26, "containsObject:", v28) & 1) == 0)
      objc_msgSend(v26, "addObject:", v28);

  }
  else
  {
    v26 = v9;
  }
  group = dispatch_group_create();
  v58 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v26;
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  if (v29)
  {
    v30 = v29;
    v31 = 0;
    v32 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v81 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
        if (!v31)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * j), "firstResponder");
          v31 = (id)objc_claimAutoreleasedReturnValue();
        }
        v35 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 352);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_2;
        block[3] = &unk_24F2ABB38;
        v75 = v59;
        v76 = v34;
        v77 = *(_QWORD *)(a1 + 32);
        v78 = v58;
        v79 = v19;
        dispatch_group_async(group, v35, block);

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    }
    while (v30);
  }
  else
  {
    v31 = 0;
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  if (!v31)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v36 = v19;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v71;
      while (2)
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v71 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * k), "elementForTextInsertionAndDeletion");
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v31 = (id)v41;
            goto LABEL_49;
          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v70, v88, 16);
        if (v38)
          continue;
        break;
      }
    }
    v31 = 0;
LABEL_49:

  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "hideObsoletePresentationsIfNeededForElements:", v19);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isDisplayingAnyInteractiveContentInProcess");

  if (v44)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isDisplayingAnyOutOfProcessPresentation");

    if ((v46 & 1) == 0)
    {

      v31 = 0;
    }
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_3;
    v67[3] = &unk_24F2AAEA0;
    v67[4] = *(_QWORD *)(a1 + 32);
    v68 = obj;
    v31 = v31;
    v69 = v31;
    dispatch_async(MEMORY[0x24BDAC9B8], v67);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:", v19, 0, obj, v31);
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_521);
  }
  v47 = *(id *)(a1 + 32);
  objc_sync_enter(v47);
  v48 = *(_QWORD *)(a1 + 32);
  if (v3 == *(double *)(v48 + 328))
  {
    *(_QWORD *)(v48 + 328) = 0;
    v49 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 344);
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_5;
    v62[3] = &unk_24F2AB1A8;
    v50 = obj;
    v51 = *(_QWORD *)(a1 + 32);
    v63 = v50;
    v64 = v51;
    v65 = v59;
    v66 = v55;
    dispatch_async(v49, v62);

  }
  objc_sync_exit(v47);

  RXSignpostLog();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_229A40000, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdPrep: Fetching Elements", (const char *)&unk_229AD580E, buf, 2u);
  }

  CACLogElementCollection();
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    __41__CACSpokenCommandManager__fetchElements__block_invoke_cold_1();

  v54 = *(id *)(a1 + 32);
  objc_sync_enter(v54);
  --_fetchElements___fetchQueueDepth;
  objc_sync_exit(v54);

}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_2(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t j;
  void *v19;
  int v20;
  void *v21;
  id *v22;
  unint64_t v23;
  int v24;
  unint64_t v25;
  void *v26;
  int v27;
  int v28;
  char v29;
  void *v30;
  uint64_t v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v7, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "bundleId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v10)
          objc_msgSend(v33, "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v4);
  }

  objc_msgSend(a1[5], "uiElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiElementsWithAttribute:parameter:", 94500, &unk_24F2CF518);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    v16 = 0x24BDFE000uLL;
    v17 = 0x24F2A9000uLL;
    v31 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(v16 + 2664), "elementWithUIElement:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isVisible");
        objc_msgSend(*(id *)(v17 + 1888), "sharedManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "carPlayConnected") & 1) != 0)
        {
          v22 = a1;
          v23 = v16;
          v24 = objc_msgSend(v19, "windowDisplayId");
          objc_msgSend(*(id *)(v17 + 1888), "sharedManager");
          v25 = v17;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v24 != objc_msgSend(v26, "carPlayDisplayID");

          v17 = v25;
          v28 = (v19 != 0) & ~v27;
          v16 = v23;
          a1 = v22;
          v15 = v31;
          if ((v28 & v20) != 1)
            goto LABEL_24;
LABEL_22:
          if ((objc_msgSend(a1[6], "elementIsOccluded:occludedAppScenes:", v19, v33) & 1) == 0)
            objc_msgSend(v30, "addObject:", v19);
          goto LABEL_24;
        }

        if (v19)
          v29 = v20;
        else
          v29 = 0;
        if ((v29 & 1) != 0)
          goto LABEL_22;
LABEL_24:

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v14);
  }

  objc_msgSend(a1[7], "lock");
  objc_msgSend(a1[8], "addObjectsFromArray:", v30);
  objc_msgSend(a1[7], "unlock");

}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_3(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "_fetchPresentationElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:", 0, v3, a1[5], a1[6]);

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshOverlays");

}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_4()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "refreshOverlays");

}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id obj;
  _QWORD v14[5];
  id v15;
  _QWORD block[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_group_create();
  v3 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7);
        v9 = *(void **)(a1 + 48);
        v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 352);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_6;
        block[3] = &unk_24F2ABB38;
        v17 = v9;
        v18 = v8;
        v19 = *(_QWORD *)(a1 + 40);
        v20 = v3;
        v21 = *(id *)(a1 + 56);
        dispatch_group_async(v2, v10, block);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v5);
  }

  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(NSObject **)(v11 + 336);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_7;
  v14[3] = &unk_24F2AAD70;
  v14[4] = v11;
  v15 = *(id *)(a1 + 56);
  dispatch_async(v12, v14);

}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_6(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  int v28;
  BOOL v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v39 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "bundleId");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v5);
  }

  v12 = objc_msgSend(a1[5], "pid");
  if (v12 != getpid())
  {
    objc_msgSend(a1[5], "uiElement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uiElementsWithAttribute:parameter:", 94500, &unk_24F2CF530);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (!v16)
      goto LABEL_25;
    v17 = v16;
    v18 = *(_QWORD *)v35;
    v19 = 0x24BDFE000uLL;
    v20 = 0x24F2A9000uLL;
    v31 = v2;
    v32 = *(_QWORD *)v35;
    v30 = v15;
    while (1)
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(v19 + 2664), "elementWithUIElement:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), v30, v31, v32);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_msgSend(a1[6], "elementIsOccluded:occludedAppScenes:", v22, v2) & 1) == 0)
        {
          objc_msgSend(*(id *)(v20 + 1888), "sharedManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "carPlayConnected") & 1) == 0)
          {

LABEL_22:
            objc_msgSend(v33, "addObject:", v22);
            goto LABEL_23;
          }
          v24 = objc_msgSend(v22, "windowDisplayId");
          objc_msgSend(*(id *)(v20 + 1888), "sharedManager");
          v25 = v19;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v20;
          v28 = objc_msgSend(v26, "carPlayDisplayID");

          v19 = v25;
          v29 = v24 == v28;
          v20 = v27;
          v15 = v30;
          v2 = v31;
          v18 = v32;
          if (v29)
            goto LABEL_22;
        }
LABEL_23:

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (!v17)
      {
LABEL_25:

        objc_msgSend(a1[7], "lock");
        objc_msgSend(a1[8], "addObjectsFromArray:", v33);
        objc_msgSend(a1[7], "unlock");

        break;
      }
    }
  }

}

uint64_t __41__CACSpokenCommandManager__fetchElements__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateScreenElementsWithNonScannerElements:", *(_QWORD *)(a1 + 40));
}

- (void)_scheduleFetchElementsWithDelay:(double)a3 andReason:(id)a4
{
  CACSpokenCommandManager *v6;
  double v7;
  id v8;

  v8 = a4;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__fetchElements, 0);
  +[CACSignPostLog FetchElementsEventBeganWithReason:expectedDelay:](CACSignPostLog, "FetchElementsEventBeganWithReason:expectedDelay:", v8, a3);
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v6->_fetchingTransactionID = v7;
  objc_sync_exit(v6);

  -[CACSpokenCommandManager performSelector:withObject:afterDelay:](v6, "performSelector:withObject:afterDelay:", sel__fetchElements, 0, fmax(v6->_nextFetchDelayFactor, 1.0) * a3);
  v6->_nextFetchDelayFactor = 0.0;

}

- (void)_scheduleFetchElementsWithDelay:(double)a3
{
  -[CACSpokenCommandManager _scheduleFetchElementsWithDelay:andReason:](self, "_scheduleFetchElementsWithDelay:andReason:", CFSTR("(No reason specified)"), a3);
}

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  int v10;
  CACSpokenCommandManager *v11;
  _BOOL4 displayIsOff;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a4;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  CACLogDictationCommands();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v23 = v6;
    v24 = 2112;
    v25 = a5;
    _os_log_impl(&dword_229A40000, v9, OS_LOG_TYPE_INFO, "did observe notification: %d, notification data: %@", buf, 0x12u);
  }

  if ((int)v6 <= 1068)
  {
    if ((v6 - 1000) > 0x12)
      goto LABEL_32;
    v10 = 1 << (v6 + 24);
    if ((v10 & 0x13) != 0)
    {
      v11 = self;
      objc_sync_enter(v11);
      displayIsOff = v11->_displayIsOff;
      if (displayIsOff != -[CACSpokenCommandManager _isSystemSleeping](v11, "_isSystemSleeping"))
      {
        v13 = -[CACSpokenCommandManager _isSystemSleeping](v11, "_isSystemSleeping");
        v11->_displayIsOff = v13;
        if (v13)
          -[CACSpokenCommandManager _microphoneTurnedOffAfterInteruption](v11, "_microphoneTurnedOffAfterInteruption");
        else
          -[CACSpokenCommandManager _microphoneTurnedOnAfterInteruption](v11, "_microphoneTurnedOnAfterInteruption");
      }
      objc_sync_exit(v11);

      if ((_DWORD)v6 == 1000)
      {
        -[CACSpokenCommandManager willUpdateElementsSignificantly](v11, "willUpdateElementsSignificantly");
      }
      else if ((_DWORD)v6 != 1001 && (_DWORD)v6 != 1004)
      {
        goto LABEL_32;
      }
    }
    else if ((v10 & 0x40280) == 0)
    {
      goto LABEL_32;
    }
LABEL_27:
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[CACSpokenCommandManager nameOfAXNotification:](self, "nameOfAXNotification:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("AXNotification: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CACSpokenCommandManager delayForNotification:](self, "delayForNotification:", v6);
    v21 = v20;
    if (a5 && CFEqual(a5, (CFTypeRef)*MEMORY[0x24BDFEEB0]))
      -[CACSpokenCommandManager forceElementFetchWithReason:](self, "forceElementFetchWithReason:", v19);
    else
      -[CACSpokenCommandManager _scheduleFetchElementsWithDelay:andReason:](self, "_scheduleFetchElementsWithDelay:andReason:", v19, v21);

    goto LABEL_32;
  }
  if ((int)v6 <= 5799)
  {
    if ((_DWORD)v6 != 1069 && (_DWORD)v6 != 5001)
      goto LABEL_32;
    goto LABEL_27;
  }
  if ((_DWORD)v6 == 5800)
  {
    if (!self->_recognitionModeOverriddenForDictation)
    {
      self->_recognitionModeOverriddenForDictation = 1;
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_recognitionModePriorToDictation = objc_msgSend(v15, "dictationRecognizerMode");

      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDictationRecognizerMode:", 1);

    }
  }
  else if ((_DWORD)v6 == 5801 && self->_recognitionModeOverriddenForDictation)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDictationRecognizerMode:", self->_recognitionModePriorToDictation);

    self->_recognitionModeOverriddenForDictation = 0;
  }
LABEL_32:

}

- (double)delayForNotification:(int)a3
{
  double result;

  result = 0.3;
  if (a3 == 1069)
    return 0.75;
  return result;
}

- (id)nameOfAXNotification:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 1017)
  {
    switch(a3)
    {
      case 1018:
        return CFSTR("kAXFirstResponderChangedNotification");
      case 1069:
        return CFSTR("kAXScrollViewDidEndDeceleratingNotification");
      case 5001:
        return CFSTR("kAXFocusedApplicationsDidChangeNotification");
      default:
LABEL_15:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown, %i"), *(_QWORD *)&a3);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v3;
    }
  }
  else
  {
    v3 = CFSTR("kAXScreenLockedNotification");
    switch(a3)
    {
      case 1000:
        v3 = CFSTR("kAXScreenChangedNotification");
        return v3;
      case 1001:
        result = CFSTR("kAXLayoutChangedNotification");
        break;
      case 1004:
        return v3;
      case 1007:
        result = CFSTR("kAXWebPageLoadedNotification");
        break;
      case 1009:
        result = CFSTR("kAXElementScrolledByPageNotification");
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

- (void)didObserveFirstTouchDownForObserver:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  CACLogDictationCommands();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_DEFAULT, "Did observe first touch down", v5, 2u);
  }

  -[CACSpokenCommandManager didBeginTouches](self, "didBeginTouches");
}

- (void)didObserveLastTouchUpForObserver:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  CACLogDictationCommands();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_DEFAULT, "Did observe last touch up", v5, 2u);
  }

  -[CACSpokenCommandManager didEndTouches](self, "didEndTouches");
}

- (void)insertDictatedAttributedString:(id)a3
{
  id v4;

  objc_msgSend(a3, "string");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandManager insertDictatedString:](self, "insertDictatedString:", v4);

}

- (void)insertDictatedString:(id)a3
{
  AXElement *focusedElement;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  focusedElement = self->_focusedElement;
  v5 = a3;
  -[AXElement cacTextSelectionCACTextMarkerRange](focusedElement, "cacTextSelectionCACTextMarkerRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "nsRange");

  -[AXElement insertText:asUndoableAction:](self->_focusedElement, "insertText:asUndoableAction:", v5, 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  self->_lastDictationInsertionTimeStamp = v8;
  -[CACSpokenCommandManager stagedTextInsertionSpecifier](self, "stagedTextInsertionSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInsertedString:", v5);

  -[CACSpokenCommandManager stagedTextInsertionSpecifier](self, "stagedTextInsertionSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "length");

  objc_msgSend(v10, "setInsertedRange:", v7, v11);
  -[CACSpokenCommandManager stagedTextInsertionSpecifier](self, "stagedTextInsertionSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAxElement:", self->_focusedElement);

  -[CACSpokenCommandManager stagedTextInsertionSpecifier](self, "stagedTextInsertionSpecifier");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandManager setPreviousTextInsertionSpecifier:](self, "setPreviousTextInsertionSpecifier:", v13);

}

- (void)enterDictatedString:(id)a3
{
  id v4;

  -[CACSpokenCommandManager insertDictatedString:](self, "insertDictatedString:", a3);
  -[AXElement uiElement](self->_focusedElement, "uiElement");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performAXAction:", 2054);

}

- (id)primaryStringForCommandIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[NSMutableArray count](self->_recognizers, "count"))
  {
    -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](self, "_templateSpokenCommandWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "strings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertiesForCommandIdentifier:localeIdentifier:", v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("BuiltInStrings"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSetInit != -1)
  {
    dispatch_once(&_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSetInit, &__block_literal_global_548);
    v4 = v7;
  }
  v5 = (void *)_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSet;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    -[CACSpokenCommandManager setPreviousTextInsertionSpecifier:](self, "setPreviousTextInsertionSpecifier:", 0);

}

void __86__CACSpokenCommandManager__clearPreviousTextInsertionSpecifierBasedOnExecutedCommand___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("System.Cut"), CFSTR("Text.EditingCompletion"), CFSTR("System.KeyTab"), CFSTR("System.Paste"), CFSTR("System.Shake"), CFSTR("System.Undo"), CFSTR("Text.DeleteSelection"), CFSTR("Text.DeleteAll"), CFSTR("Text.DeletePhrase"), CFSTR("Text.DeleteCurrentCharacter"), CFSTR("Text.DeleteCurrentLine"), CFSTR("Text.DeleteCurrentParagraph"), CFSTR("Text.DeleteCurrentSentence"), CFSTR("Text.DeleteCurrentWord"), CFSTR("Text.DeleteNextCharacter"), CFSTR("Text.DeleteNextCharactersUsingCardinalNumber"), CFSTR("Text.DeleteNextLine"),
         CFSTR("Text.DeleteNextLinesUsingCardinalNumber"),
         CFSTR("Text.DeleteNextParagraph"),
         CFSTR("Text.DeleteNextParagraphsUsingCardinalNumber"),
         CFSTR("Text.DeleteNextSentence"),
         CFSTR("Text.DeleteNextSentencesUsingCardinalNumber"),
         CFSTR("Text.DeleteNextWord"),
         CFSTR("Text.DeleteNextWordsUsingCardinalNumber"),
         CFSTR("Text.DeletePreviousCharacter"),
         CFSTR("Text.DeletePreviousCharactersUsingCardinalNumber"),
         CFSTR("Text.DeletePreviousLine"),
         CFSTR("Text.DeletePreviousLinesUsingCardinalNumber"),
         CFSTR("Text.DeletePreviousParagraph"),
         CFSTR("Text.DeletePreviousParagraphsUsingCardinalNumber"),
         CFSTR("Text.DeletePreviousSentence"),
         CFSTR("Text.DeletePreviousSentencesUsingCardinalNumber"),
         CFSTR("Text.DeletePreviousWord"),
         CFSTR("Text.DeletePreviousWordsUsingCardinalNumber"),
         0);
  v1 = (void *)_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSet;
  _clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSet = v0;

}

- (BOOL)_isSystemSleeping
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BE00720], "server");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isSystemSleeping"))
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "carPlayConnected") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_closeAllRecognizers
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = self->_recognizers;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_recognizers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "speechRecognizer", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "closeSpeechRecognizer");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_recognizers, "removeAllObjects");
  objc_sync_exit(v3);

}

- (void)handleSRSystemServerError
{
  NSObject *recognizerSynchronizationDispatchQueue;
  _QWORD block[5];

  recognizerSynchronizationDispatchQueue = self->_recognizerSynchronizationDispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__CACSpokenCommandManager_handleSRSystemServerError__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(recognizerSynchronizationDispatchQueue, block);
}

uint64_t __52__CACSpokenCommandManager_handleSRSystemServerError__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopListening");
  objc_msgSend(*(id *)(a1 + 32), "_flushBuiltInLMIdentifierTable");
  objc_msgSend(*(id *)(a1 + 32), "_closeAllRecognizers");
  +[CACSpeechSystem closeSpeechSystem](CACSpeechSystem, "closeSpeechSystem");
  return objc_msgSend(*(id *)(a1 + 32), "_startListening");
}

- (void)handleSRSystemBeginUtteranceWithID:(unint64_t)a3
{
  +[CACCommandRecognizer resetCloseMatchAccumulator](CACCommandRecognizer, "resetCloseMatchAccumulator", a3);
}

- (BOOL)doesCurrentLanguageSupportInterWordSpaces
{
  void *v2;
  char v3;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bestLocaleIdentifier");
  v3 = RXIsLocaleWithNoSpaceInPostITN() ^ 1;

  return v3;
}

- (void)_handleLanguageChange
{
  NSObject *recognizerSynchronizationDispatchQueue;
  _QWORD block[5];

  recognizerSynchronizationDispatchQueue = self->_recognizerSynchronizationDispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CACSpokenCommandManager__handleLanguageChange__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(recognizerSynchronizationDispatchQueue, block);
}

void __48__CACSpokenCommandManager__handleLanguageChange__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 289) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_resetRecognitionSystems");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CACSpokenCommandManager__handleLanguageChange__block_invoke_2;
  block[3] = &unk_24F2AA860;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__CACSpokenCommandManager__handleLanguageChange__block_invoke_2(uint64_t a1)
{
  void *v2;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayReadyToUseWithLanguageMessage");

  return objc_msgSend(*(id *)(a1 + 32), "_updateAssetPurgeability");
}

- (void)_resetRecognitionSystems
{
  -[CACSpokenCommandManager _stopListening](self, "_stopListening");
  -[CACSpokenCommandManager _flushBuiltInLMIdentifierTable](self, "_flushBuiltInLMIdentifierTable");
  -[CACSpokenCommandManager _closeAllRecognizers](self, "_closeAllRecognizers");
  +[CACSpeechSystem closeSpeechSystem](CACSpeechSystem, "closeSpeechSystem");
  +[CACEmojiManager resetSharedManager](CACEmojiManager, "resetSharedManager");
  if (self->_dictationRecognizerMode == 3)
    self->_dictationRecognizerMode = 0;
  -[CACSpokenCommandManager _startListening](self, "_startListening");
}

- (void)startListening
{
  NSObject *recognizerSynchronizationDispatchQueue;
  _QWORD block[5];

  recognizerSynchronizationDispatchQueue = self->_recognizerSynchronizationDispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CACSpokenCommandManager_startListening__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(recognizerSynchronizationDispatchQueue, block);
}

uint64_t __41__CACSpokenCommandManager_startListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startListening");
}

- (void)_startListening
{
  double v3;
  dispatch_time_t v4;
  void *v5;
  _QWORD block[5];

  if (!self->_isListening)
  {
    self->_isListening = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    self->_startedListeningTimeStamp = v3;
    -[CACSpokenCommandManager _intializeBuiltInLMIdentifierTableIfNecessary](self, "_intializeBuiltInLMIdentifierTableIfNecessary");
    -[CACSpokenCommandManager _createCommandRecognizersIfNecessary](self, "_createCommandRecognizersIfNecessary");
    -[CACSpokenCommandManager synchronizeRecognizersWithReason:](self, "synchronizeRecognizersWithReason:", kSRUISyncReasonStartedListening);
    -[CACSpokenCommandManager _handlePendingCommands](self, "_handlePendingCommands");
    if ((int)(CFPreferencesGetAppIntegerValue(CFSTR("RXDebugAutomationMode"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), 0) << 24) >= 1)
    {
      v4 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__CACSpokenCommandManager__startListening__block_invoke;
      block[3] = &unk_24F2AA860;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("CACSpokenCommandManagerStartedListening"), 0);

  }
}

uint64_t __42__CACSpokenCommandManager__startListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_microphoneTurnedOn");
}

- (void)stopListening
{
  NSObject *recognizerSynchronizationDispatchQueue;
  _QWORD block[5];

  recognizerSynchronizationDispatchQueue = self->_recognizerSynchronizationDispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__CACSpokenCommandManager_stopListening__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(recognizerSynchronizationDispatchQueue, block);
}

uint64_t __40__CACSpokenCommandManager_stopListening__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopListening");
}

- (void)_stopListening
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->_isListening)
  {
    self->_isListening = 0;
    v3 = self->_recognizers;
    objc_sync_enter(v3);
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_recognizers;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "stopListening", (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    objc_sync_exit(v3);
    if (-[CACSpokenCommandManager currentInteractionLevel](self, "currentInteractionLevel") != 1)
      -[CACSpokenCommandManager _resetInteractionLevel](self, "_resetInteractionLevel");
    -[CACSpokenCommandManager updateStatusIndicatorView](self, "updateStatusIndicatorView", (_QWORD)v8);
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_627);
  }
}

void __41__CACSpokenCommandManager__stopListening__block_invoke()
{
  id v0;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "hideAnyOverlay");

}

- (BOOL)isListening
{
  return self->_isListening;
}

- (BOOL)showUIAsListening
{
  return 1;
}

- (BOOL)_shouldBeListening
{
  return !-[CACSpokenCommandManager _isSystemSleeping](self, "_isSystemSleeping");
}

- (id)copySupportedCommandWithIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSMutableArray *v17;
  NSMutableArray *obj;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = self->_recognizers;
  objc_sync_enter(v17);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_recognizers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v19 = *(_QWORD *)v26;
    v20 = 0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v7, "spokenCommands", v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v8);
              v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v12, "identifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v4, "isEqualToString:", v13);

              if (v14)
              {
                v15 = objc_msgSend(v12, "copy");

                v20 = (void *)v15;
                goto LABEL_16;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }
  else
  {
    v20 = 0;
  }

  objc_sync_exit(v17);
  return v20;
}

- (void)_handlePendingCommands
{
  void *v3;
  void *v4;
  void *v5;

  while (-[NSMutableArray count](self->_pendingCommandToExecute, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_pendingCommandToExecute, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](self, "_templateSpokenCommandWithIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleRecognizedCommand:", v4);

    }
    -[NSMutableArray removeObjectAtIndex:](self->_pendingCommandToExecute, "removeObjectAtIndex:", 0);

  }
}

- (void)handleCommandWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CACSpokenCommandManager_handleCommandWithIdentifier___block_invoke;
  v6[3] = &unk_24F2AAD70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

_BYTE *__55__CACSpokenCommandManager_handleCommandWithIdentifier___block_invoke(uint64_t a1)
{
  _BYTE *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "addObject:", *(_QWORD *)(a1 + 40));
  result = *(_BYTE **)(a1 + 32);
  if (result[272])
    return (_BYTE *)objc_msgSend(result, "_handlePendingCommands");
  return result;
}

- (id)synchronousRecognitionOfString:(id)a3 timeoutInterval:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__CACSpokenCommandManager_synchronousRecognitionOfString_timeoutInterval___block_invoke;
  v12[3] = &unk_24F2ABBC0;
  v12[4] = &v13;
  -[CACSpokenCommandManager _startSynchronousRemoteRecognitionWithCompletionBlock:](self, "_startSynchronousRemoteRecognitionWithCompletionBlock:", v12);
  +[CACSpeechSystem recognizeString:](CACSpeechSystem, "recognizeString:", v6);
  if (!v14[5])
  {
    while (1)
    {
      usleep(0xF4240u);
      a4 = a4 + -1.0;
      v7 = v14[5];
      if (a4 <= 0.0)
        break;
      if (v7)
        goto LABEL_7;
    }
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Timed out!"), CFSTR("ERROR:"), 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14[5];
      v14[5] = v8;

    }
  }
LABEL_7:
  -[CACSpokenCommandManager _cancelSynchronousRemoteRecognition](self, "_cancelSynchronousRemoteRecognition");
  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __74__CACSpokenCommandManager_synchronousRecognitionOfString_timeoutInterval___block_invoke(uint64_t a1, void *a2, unsigned int a3)
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
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("CommandIdentifier"));

        objc_msgSend(v9, "recognizedParameters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", kCACCommandParameterText);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v9, "recognizedParameters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", kCACCommandParameterText);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("RecognizedText"));

        }
        objc_msgSend(v4, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  v16 = objc_msgSend(v4, "count");
  v17 = (void *)MEMORY[0x24BDBCE70];
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v4, CFSTR("CommandInfoDictionaries"), v18, CFSTR("WasCloseResult"), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Timed out!"), CFSTR("ERROR:"), 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;
  }

}

- (id)synchronousRecognitionUsingCommandIdentifier:(id)a3 parameters:(id)a4 timeoutInterval:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD block[4];
  id v30;
  id v31;
  id v32;
  CACSpokenCommandManager *v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  CACLogRecognition();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[CACSpokenCommandManager synchronousRecognitionUsingCommandIdentifier:parameters:timeoutInterval:].cold.1((uint64_t)v8, v9, v10);

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v11 = -[CACSpokenCommandManager copySupportedCommandWithIdentifier:](self, "copySupportedCommandWithIdentifier:", v8);
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Dictation.Streaming")) & 1) == 0
    && (objc_msgSend(v8, "isEqualToString:", CFSTR("Dictation.Literal")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("Dictation.SpellAs")))
  {
    if (!v11)
      goto LABEL_9;
    v24 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke;
    v34[3] = &unk_24F2ABBC0;
    v34[4] = &v35;
    -[CACSpokenCommandManager _startSynchronousRemoteRecognitionWithCompletionBlock:](self, "_startSynchronousRemoteRecognitionWithCompletionBlock:", v34);
    -[CACSpokenCommandManager recognizerSynchronizationDispatchQueue](self, "recognizerSynchronizationDispatchQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke_2;
    block[3] = &unk_24F2AB1A8;
    v30 = v8;
    v31 = v9;
    v32 = v11;
    v33 = self;
    dispatch_async(v25, block);

    if (!v36[5])
    {
      while (1)
      {
        usleep(0xF4240u);
        a5 = a5 + -1.0;
        v26 = v36[5];
        if (a5 <= 0.0)
          break;
        if (v26)
          goto LABEL_17;
      }
      if (!v26)
      {
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Timed out!"), CFSTR("ERROR:"), 0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v36[5];
        v36[5] = v27;

      }
    }
LABEL_17:
    -[CACSpokenCommandManager _cancelSynchronousRemoteRecognition](self, "_cancelSynchronousRemoteRecognition");

    v15 = v30;
    goto LABEL_8;
  }
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hideAnyNonInteractiveOverlay");

  objc_msgSend(v9, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v9, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommandManager insertDictatedString:](self, "insertDictatedString:", v14);

    sleep(1u);
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setObject:forKey:", v8, CFSTR("CommandIdentifier"));
    objc_msgSend(v9, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("RecognizedText"));

    v17 = (void *)MEMORY[0x24BDBCE70];
    v41[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, CFSTR("CommandInfoDictionaries"), v19, CFSTR("WasCloseResult"), 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v36[5];
    v36[5] = v20;

LABEL_8:
  }
LABEL_9:
  v22 = (id)v36[5];

  _Block_object_dispose(&v35, 8);
  return v22;
}

void __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke(uint64_t a1, void *a2, unsigned int a3)
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
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        v10 = (void *)objc_opt_new();
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("CommandIdentifier"));

        objc_msgSend(v9, "recognizedParameters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", kCACCommandParameterText);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v9, "recognizedParameters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", kCACCommandParameterText);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("RecognizedText"));

        }
        objc_msgSend(v4, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  v16 = objc_msgSend(v4, "count");
  v17 = (void *)MEMORY[0x24BDBCE70];
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v4, CFSTR("CommandInfoDictionaries"), v18, CFSTR("WasCloseResult"), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v19;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Timed out!"), CFSTR("ERROR:"), 0);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;
  }

}

void __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
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
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  id *v87;
  id *v88;
  id *v89;
  void *v90;
  void *v91;
  void *v92;
  id obj;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  const __CFString *v106;
  void *v107;
  void *v108;
  _QWORD v109[2];
  _QWORD v110[2];
  void *v111;
  _QWORD v112[2];
  _QWORD v113[2];
  void *v114;
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _BYTE v119[128];
  _QWORD v120[2];
  _QWORD v121[2];
  _BYTE v122[128];
  _QWORD v123[2];
  _QWORD v124[2];
  void *v125;
  const __CFString *v126;
  void *v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandStringsTableForLocaleIdentifier:", CFSTR("en_US"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = a1[4];
  objc_msgSend(MEMORY[0x24BEAFED0], "activeTargetTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unparsedCommandTextForCommandIdentifier:targetTypes:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1[4], "isEqualToString:", CFSTR("System.SwitchToApplication")))
  {
    objc_msgSend(a1[5], "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v87 = a1;
      v90 = v6;
      v92 = v3;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      +[CACApplicationUtilities runningApplications](CACApplicationUtilities, "runningApplications");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v128, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v103;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v103 != v10)
              objc_enumerationMutation(obj);
            v12 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKey:", kCACCommandParameterAppName);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "lowercaseString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "lowercaseString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
            {
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v126 = CFSTR("MatchingApps");
              v124[0] = v7;
              v123[0] = CFSTR("TargetAppName");
              v123[1] = CFSTR("TargetAppIdentifier");
              objc_msgSend(v12, "objectForKey:", kCACCommandParameterAppIdentifier);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v124[1] = v30;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v125 = v31;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v125, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v127 = v32;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKey:", v33, CFSTR("BuiltInLM.SwitchableApplication"));

              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v87[4], v7);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKey:", v34, CFSTR("Text"));

              objc_msgSend(v87[6], "setRecognizedParameters:", v21);
              objc_msgSend(v87[7], "handleRecognizedCommand:", v87[6]);
              goto LABEL_36;
            }
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v128, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_37:

LABEL_38:
      v6 = v90;
      v3 = v92;
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (objc_msgSend(v6, "rangeOfString:", *MEMORY[0x24BEAFF50]) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v6, "rangeOfString:", *MEMORY[0x24BEAFF20]) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v6, "rangeOfString:", CFSTR("BuiltInLM.Dictation")) == 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v6, "rangeOfString:", CFSTR("BuiltInLM.Dictation.2")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v6, "rangeOfString:", CFSTR("BuiltInLM.Dictation")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v106 = CFSTR("Text");
          objc_msgSend(a1[6], "strings");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "firstObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = v18;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[5], "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v45)
          {
            v109[0] = CFSTR("Text");
            objc_msgSend(a1[5], "firstObject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v109[1] = CFSTR("TextVariants");
            v110[0] = v46;
            objc_msgSend(a1[5], "firstObject");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = v47;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
            v48 = v6;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v110[1] = v49;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v50, CFSTR("BuiltInLM.Dictation"));

            v6 = v48;
          }
          v51 = (void *)MEMORY[0x24BDD17C8];
          v52 = a1[4];
          objc_msgSend(a1[5], "firstObject");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "stringWithFormat:", CFSTR("%@:%@"), v52, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v54, CFSTR("Text"));

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1[5], "count") == 2)
        {
          v115[0] = CFSTR("Text");
          objc_msgSend(a1[5], "firstObject");
          v91 = v6;
          v58 = v7;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v115[1] = CFSTR("TextVariants");
          v116[0] = v59;
          objc_msgSend(a1[5], "firstObject");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v60;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v116[1] = v61;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
          v62 = a1;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v63, CFSTR("BuiltInLM.Dictation"));

          v112[0] = CFSTR("Text");
          objc_msgSend(v62[5], "objectAtIndex:", 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v112[1] = CFSTR("TextVariants");
          v113[0] = v64;
          objc_msgSend(v62[5], "objectAtIndex:", 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v65;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v111, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v113[1] = v66;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v67, CFSTR("BuiltInLM.Dictation.2"));

          a1 = v62;
          v68 = (void *)MEMORY[0x24BDD17C8];
          v69 = v62[4];
          objc_msgSend(v62[5], "firstObject");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62[5], "objectAtIndex:", 1);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "stringWithFormat:", CFSTR("%@:%@,%@"), v69, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setObject:forKey:", v72, CFSTR("Text"));

          v6 = v91;
          v7 = v58;
        }
      }
      objc_msgSend(a1[6], "setRecognizedParameters:", v7);
      objc_msgSend(a1[7], "handleRecognizedCommand:", a1[6]);
      goto LABEL_39;
    }
    objc_msgSend(a1[5], "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_39;
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isActiveOverlayType:", CFSTR("NumberedGrid"));

    v90 = v6;
    v92 = v3;
    v89 = a1;
    if (v36)
    {
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "labeledElementsForGrid");
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isActiveOverlayType:", CFSTR("NumberedElements"));

      if (!v56)
      {
        v57 = 0;
        goto LABEL_50;
      }
      +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "labeledElementsForItemNumbers");
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v57 = (void *)v38;

LABEL_50:
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    v73 = v57;
    v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
    if (v74)
    {
      v75 = v74;
      v76 = *(_QWORD *)v95;
      while (2)
      {
        for (j = 0; j != v75; ++j)
        {
          if (*(_QWORD *)v95 != v76)
            objc_enumerationMutation(v73);
          v78 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
          objc_msgSend(v78, "numberedLabel");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "lowercaseString");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v7;
          objc_msgSend(v7, "lowercaseString");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v80, "isEqualToString:", v82);

          if (v83)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v117[0] = CFSTR("Text");
            v117[1] = kCACCommandParameterLabeledElement;
            v7 = v81;
            v118[0] = v81;
            v118[1] = v78;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setObject:forKey:", v85, *MEMORY[0x24BEAFF20]);

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v89[4], v81);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setObject:forKey:", v86, CFSTR("Text"));

            objc_msgSend(v89[6], "setRecognizedParameters:", v84);
            objc_msgSend(v89[7], "handleRecognizedCommand:", v89[6]);

            goto LABEL_60;
          }
          v7 = v81;
        }
        v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v94, v119, 16);
        if (v75)
          continue;
        break;
      }
    }
LABEL_60:

    goto LABEL_38;
  }
  objc_msgSend(a1[5], "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v90 = v6;
    v92 = v3;
    v88 = a1;
    v19 = (void *)objc_msgSend(*((id *)a1[7] + 31), "copyTableOfCollectedElementsByTitle");
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = v19;
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v99;
      while (2)
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v99 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
          objc_msgSend(v26, "lowercaseString");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "lowercaseString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "isEqualToString:", v28);

          if (v29)
          {
            objc_msgSend(obj, "objectForKey:", v26);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v39, "count"))
            {
              objc_msgSend(v39, "objectAtIndex:", 0);
              v40 = objc_claimAutoreleasedReturnValue();
              if (v40)
              {
                v41 = (void *)v40;
                objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v120[0] = CFSTR("Text");
                v120[1] = kCACCommandParameterLabeledElement;
                v121[0] = v7;
                v121[1] = v41;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v121, v120, 2);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setObject:forKey:", v43, *MEMORY[0x24BEAFF50]);

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v88[4], v7);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "setObject:forKey:", v44, CFSTR("Text"));

                objc_msgSend(v88[6], "setRecognizedParameters:", v42);
                objc_msgSend(v88[7], "handleRecognizedCommand:", v88[6]);

              }
            }

            goto LABEL_36;
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v98, v122, 16);
        if (v23)
          continue;
        break;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
LABEL_39:

}

- (id)allCustomCommandsDetail
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[2];
  _QWORD v93[2];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v76 = (id)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  objc_msgSend(v2, "bestLocaleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commandIdentifiersForCommandSetIdentifier:localeIdentifier:", CFSTR("Custom"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
  if (v5)
  {
    v6 = v5;
    v7 = CFSTR("Identifier");
    v8 = *(_QWORD *)v89;
    v9 = CFSTR("CustomCommands");
    v72 = v2;
    v64 = *(_QWORD *)v89;
    do
    {
      v10 = 0;
      v65 = v6;
      do
      {
        if (*(_QWORD *)v89 != v8)
          objc_enumerationMutation(obj);
        v78 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v2, "propertiesForCommandIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithDictionary:", v13);

        objc_msgSend(v14, "setObject:forKey:", v11, v7);
        objc_msgSend(v14, "objectForKey:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "bestLocaleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v14;
        if (v18)
          objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("UnparsedString"));
        objc_msgSend(v14, "objectForKey:", CFSTR("CustomType"), v64);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", CFSTR("PasteText")))
        {
          objc_msgSend(v19, "objectForKey:", CFSTR("CustomTextToInsert"));
          v21 = (id)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v19, "objectForKey:", CFSTR("CustomTextToInsert"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKey:", v22, CFSTR("InsertionText"));

          }
          else
          {
            objc_msgSend(v19, "setObject:forKey:", &stru_24F2ADCC8, CFSTR("InsertionText"));
          }
        }
        else
        {
          if ((objc_msgSend(v20, "isEqualToString:", CFSTR("PasteBoard")) & 1) != 0)
            goto LABEL_39;
          if (objc_msgSend(v20, "isEqualToString:", CFSTR("RunShortcutsWorkflow")))
          {
            v23 = v6;
            v24 = v9;
            v25 = v8;
            v26 = v7;
            objc_msgSend(v19, "objectForKey:", CFSTR("CustomShortcutsWorkflow"));
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              objc_msgSend(v19, "objectForKey:", CFSTR("CustomShortcutsWorkflow"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKey:", v28, CFSTR("ShortcutIdentifier"));

            }
            else
            {
              objc_msgSend(v19, "setObject:forKey:", &stru_24F2ADCC8, CFSTR("ShortcutIdentifier"));
            }
            v21 = (id)v27;
            v7 = v26;
            v8 = v25;
            v9 = v24;
            v6 = v23;
            v2 = v72;
          }
          else if (objc_msgSend(v20, "isEqualToString:", CFSTR("RunGesture")))
          {
            v67 = v18;
            v29 = (void *)MEMORY[0x24BDD1620];
            v30 = objc_opt_class();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CustomGesture"));
            v31 = v19;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = 0;
            objc_msgSend(v29, "unarchivedObjectOfClass:fromData:error:", v30, v32, &v87);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v87;

            if (v33)
            {
              v68 = v21;
              v70 = v31;
              v66 = v20;
              v34 = (void *)objc_opt_new();
              if (objc_msgSend(v33, "numberOfEvents"))
              {
                v35 = 0;
                v74 = v34;
                do
                {
                  v36 = (void *)objc_opt_new();
                  v37 = (void *)MEMORY[0x24BDBCE60];
                  objc_msgSend(v33, "timeAtEventIndex:", v35);
                  objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v77 = v36;
                  objc_msgSend(v36, "setObject:forKey:", v38, CFSTR("GestureEventDate"));

                  v81 = (void *)objc_opt_new();
                  v83 = 0u;
                  v84 = 0u;
                  v85 = 0u;
                  v86 = 0u;
                  objc_msgSend(v33, "fingerIdentifiersAtEventIndex:", v35);
                  v79 = (id)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
                  if (v39)
                  {
                    v40 = v39;
                    v80 = *(_QWORD *)v84;
                    do
                    {
                      for (i = 0; i != v40; ++i)
                      {
                        if (*(_QWORD *)v84 != v80)
                          objc_enumerationMutation(v79);
                        v42 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
                        v43 = (void *)objc_opt_new();
                        objc_msgSend(v43, "setObject:forKey:", v42, CFSTR("FingerIdentifier"));
                        objc_msgSend(v33, "pointForFingerIdentifier:atEventIndex:", v42, v35);
                        v45 = v44;
                        v92[0] = CFSTR("x");
                        *(float *)&v46 = v46;
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v46);
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        v92[1] = CFSTR("y");
                        v93[0] = v47;
                        *(float *)&v48 = v45;
                        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v48);
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        v93[1] = v49;
                        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "setObject:forKey:", v50, CFSTR("FingerPoint"));

                        v51 = (void *)MEMORY[0x24BDD16E0];
                        objc_msgSend(v33, "forceForFingerIdentifier:atEventIndex:", v42, v35);
                        *(float *)&v52 = v52;
                        objc_msgSend(v51, "numberWithFloat:", v52);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v43, "setObject:forKey:", v53, CFSTR("FingerForce"));

                        objc_msgSend(v81, "addObject:", v43);
                      }
                      v40 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
                    }
                    while (v40);
                  }

                  objc_msgSend(v77, "setObject:forKey:", v81, CFSTR("GestureEventFingers"));
                  v34 = v74;
                  objc_msgSend(v74, "addObject:", v77);

                  ++v35;
                }
                while (v35 < objc_msgSend(v33, "numberOfEvents"));
              }
              v19 = v70;
              objc_msgSend(v70, "setObject:forKey:", v34, CFSTR("GestureEvents"));
              v2 = v72;
              v7 = CFSTR("Identifier");
              v8 = v64;
              v6 = v65;
              v9 = CFSTR("CustomCommands");
              v20 = v66;
              v21 = v68;
            }
            else
            {
              objc_msgSend(v21, "localizedDescription");
              v75 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKey:", v75, CFSTR("GesturesError"));
              v19 = v31;
              v34 = (void *)v75;
            }

            v18 = v67;
          }
          else
          {
            if (!objc_msgSend(v20, "isEqualToString:", CFSTR("RunUserActionFlow")))
              goto LABEL_39;
            v54 = (void *)MEMORY[0x24BDD1620];
            v55 = objc_opt_class();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("CustomUserActionFlow"));
            v71 = v19;
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = 0;
            objc_msgSend(v54, "unarchivedObjectOfClass:fromData:error:", v55, v56, &v82);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = v82;

            v69 = v58;
            if (v57)
            {
              objc_msgSend(v57, "plistDescription");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v71;
              v60 = v71;
              v61 = v59;
              v62 = CFSTR("UserActionFlow");
            }
            else
            {
              objc_msgSend(v58, "localizedDescription");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v71;
              v60 = v71;
              v61 = v59;
              v62 = CFSTR("UserActionFlowError");
            }
            objc_msgSend(v60, "setObject:forKey:", v61, v62);

            v21 = v69;
          }
        }

LABEL_39:
        objc_msgSend(v76, "addObject:", v19);

        v10 = v78 + 1;
      }
      while (v78 + 1 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    }
    while (v6);
  }

  return v76;
}

- (id)allCommandsForLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  id obja;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "builtInCommandsTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v3;
  objc_msgSend(v5, "commandStringsTableForLocaleIdentifier:", v3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("CommandProperties"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
        v12 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v44, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithDictionary:", v13);

        objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("Identifier"));
        objc_msgSend(v52, "setObject:forKey:", v14, v11);
        objc_msgSend(MEMORY[0x24BEAFED0], "activeTargetTypes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "unparsedCommandTextForCommandIdentifier:targetTypes:", v11, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("UnparsedString"));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v8);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v53, "bestLocaleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commandIdentifiersForCommandSetIdentifier:localeIdentifier:", CFSTR("Custom"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v18;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v19)
  {
    v20 = v19;
    v49 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v63 != v49)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
        v23 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v53, "propertiesForCommandIdentifier:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v23, "initWithDictionary:", v24);

        objc_msgSend(v25, "setObject:forKey:", v22, CFSTR("Identifier"));
        objc_msgSend(v25, "objectForKey:", CFSTR("CustomCommands"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "bestLocaleIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          objc_msgSend(v25, "setObject:forKey:", v29, CFSTR("UnparsedString"));
        objc_msgSend(v52, "setObject:forKey:", v25, v22);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v20);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v53, "availableCommandSetIdentifiers");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  obja = (id)objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (obja)
  {
    v43 = *(_QWORD *)v59;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v59 != v43)
          objc_enumerationMutation(v42);
        v50 = v30;
        v31 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v30);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        objc_msgSend(v53, "commandIdentifiersForCommandSetIdentifier:localeIdentifier:", v31, v46);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v55;
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v55 != v35)
                objc_enumerationMutation(v32);
              v37 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k);
              objc_msgSend(v52, "objectForKey:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "addObject:", v38);
              objc_msgSend(v38, "setObject:forKey:", v31, CFSTR("CommandSet"));
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v53, "isEnabledForCommandIdentifier:", v37));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("Enabled"));

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          }
          while (v34);
        }

        v30 = v50 + 1;
      }
      while ((id)(v50 + 1) != obja);
      obja = (id)objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (obja);
  }

  return v51;
}

- (id)groupedCommandsForLocaleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id obj;
  id obja;
  id objb;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "builtInCommandsTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAFED8], "sharedSpokenCommandUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v3;
  objc_msgSend(v7, "commandStringsTableForLocaleIdentifier:", v3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v6;
  objc_msgSend(v6, "objectForKey:", CFSTR("CommandProperties"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v67;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v67 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v47, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithDictionary:", v14);

        objc_msgSend(v15, "setObject:forKey:", v12, CFSTR("Identifier"));
        objc_msgSend(v4, "setObject:forKey:", v15, v12);
        objc_msgSend(MEMORY[0x24BEAFED0], "activeTargetTypes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "unparsedCommandTextForCommandIdentifier:targetTypes:", v12, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
          objc_msgSend(v15, "setObject:forKey:", v17, CFSTR("UnparsedString"));

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v9);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend(v5, "bestLocaleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandIdentifiersForCommandSetIdentifier:localeIdentifier:", CFSTR("Custom"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v19;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v20)
  {
    v21 = v20;
    obja = *(id *)v63;
    do
    {
      v22 = 0;
      do
      {
        if (*(id *)v63 != obja)
          objc_enumerationMutation(v45);
        v23 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v22);
        v24 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v5, "propertiesForCommandIdentifier:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v24, "initWithDictionary:", v25);

        objc_msgSend(v26, "setObject:forKey:", v23, CFSTR("Identifier"));
        objc_msgSend(v26, "objectForKey:", CFSTR("CustomCommands"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bestLocaleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKey:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          objc_msgSend(v26, "setObject:forKey:", v30, CFSTR("UnparsedString"));
        objc_msgSend(v4, "setObject:forKey:", v26, v23);

        ++v22;
      }
      while (v21 != v22);
      v21 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v21);
  }

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v5, "availableCommandSetIdentifiers");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objb = (id)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (objb)
  {
    v46 = *(id *)v59;
    do
    {
      v31 = 0;
      do
      {
        if (*(id *)v59 != v46)
          objc_enumerationMutation(v44);
        v32 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)v31);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v32, CFSTR("Identifier"));
        objc_msgSend(v5, "displayNameForCommandSetIdentifier:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v34, CFSTR("Text"));

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKey:", v35, CFSTR("Commands"));
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v5, "commandIdentifiersForCommandSetIdentifier:localeIdentifier:", v32, v49);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v55;
          do
          {
            v40 = 0;
            do
            {
              if (*(_QWORD *)v55 != v39)
                objc_enumerationMutation(v36);
              objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v40));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
                objc_msgSend(v35, "addObject:", v41);

              ++v40;
            }
            while (v38 != v40);
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          }
          while (v38);
        }

        objc_msgSend(v50, "addObject:", v33);
        v31 = (char *)v31 + 1;
      }
      while (v31 != objb);
      objb = (id)objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (objb);
  }

  return v50;
}

- (id)activeCommandsForLocaleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t k;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v21;
  id v22;
  NSMutableArray *obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[CACSpokenCommandManager allCommandsForLocaleIdentifier:](self, "allCommandsForLocaleIdentifier:", v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", CFSTR("Identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  v21 = self->_recognizers;
  objc_sync_enter(v21);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_recognizers;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
        if (objc_msgSend(v12, "isListening", v21))
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v12, "spokenCommands");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v28;
            do
            {
              for (k = 0; k != v14; ++k)
              {
                if (*(_QWORD *)v28 != v15)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * k), "identifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "objectForKey:", v17);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                if (v18)
                {
                  objc_msgSend(v12, "type");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("RecognizerType"));

                  objc_msgSend(v4, "addObject:", v18);
                }

              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
            }
            while (v14);
          }

        }
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v25);
  }

  objc_sync_exit(v21);
  return v4;
}

- (id)_descriptionForAXTextUnit:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("unknown");
  else
    return off_24F2ABD38[a3];
}

- (id)contextSummary
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  CACSpokenCommandManager *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  const __CFString *v57;
  void *v58;
  __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v98;
  id obj;
  uint64_t v100;
  CACSpokenCommandManager *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  void *v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;
  NSRange v132;

  v131 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = self;
  v3 = -[CACLabeledElementsCollection copyTableOfCollectedElementsByTitle](self->_labeledScreenElementsCollection, "copyTableOfCollectedElementsByTitle");
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  v102 = v3;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v103 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
  if (v103)
  {
    v100 = *(_QWORD *)v124;
    v6 = 0x24BDD1000uLL;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v124 != v100)
          objc_enumerationMutation(obj);
        v104 = v7;
        objc_msgSend(v102, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0u;
        v120 = 0u;
        v121 = 0u;
        v122 = 0u;
        v109 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
        if (v109)
        {
          v106 = *(id *)v120;
          do
          {
            for (i = 0; i != v109; ++i)
            {
              if (*(id *)v120 != v106)
                objc_enumerationMutation(v8);
              v10 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "rectangle");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%4.0f, %4.0f, %4.0f, %4.0f)"), v12, v13, v14, v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("Rectangle"));

              v17 = v6;
              objc_msgSend(*(id *)(v6 + 1760), "numberWithInteger:", objc_msgSend(v8, "count"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v18, CFSTR("Count"));

              objc_msgSend(v10, "element");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "recognitionStrings");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "firstObject");
              v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "application");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "recognitionStrings");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "firstObject");
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

              if (v21)
                v25 = v21;
              else
                v25 = &stru_24F2ADCC8;
              objc_msgSend(v11, "setObject:forKey:", v25, CFSTR("Text"));
              if (v24)
                v26 = v24;
              else
                v26 = &stru_24F2ADCC8;
              objc_msgSend(v11, "setObject:forKey:", v26, CFSTR("AppLabel"));
              objc_msgSend(v19, "value");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
              {
                objc_msgSend(v19, "value");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setObject:forKey:", v28, CFSTR("Value"));

              }
              else
              {
                objc_msgSend(v11, "setObject:forKey:", &stru_24F2ADCC8, CFSTR("Value"));
              }

              objc_msgSend(v10, "numberedLabel");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                objc_msgSend(v10, "numberedLabel");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setObject:forKey:", v30, CFSTR("Number"));

              }
              else
              {
                objc_msgSend(v11, "setObject:forKey:", &stru_24F2ADCC8, CFSTR("Number"));
              }

              v6 = v17;
              objc_msgSend(*(id *)(v17 + 1760), "numberWithLongLong:", objc_msgSend(v19, "traits"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKey:", v31, CFSTR("Traits"));

              objc_msgSend(v105, "addObject:", v11);
            }
            v109 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
          }
          while (v109);
        }

        v7 = v104 + 1;
      }
      while (v104 + 1 != v103);
      v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
    }
    while (v103);
  }

  objc_msgSend(v98, "setObject:forKey:", v105, CFSTR("Elements"));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_test_activeEditingOverlayElements");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = v33;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
  v35 = v101;
  if (v34)
  {
    v36 = v34;
    v37 = *(_QWORD *)v116;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v116 != v37)
          objc_enumerationMutation(v107);
        v39 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "label");
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v41;
        if (v41)
          v43 = (const __CFString *)v41;
        else
          v43 = &stru_24F2ADCC8;
        objc_msgSend(v40, "setObject:forKey:", v43, CFSTR("label"));

        v132.location = objc_msgSend(v39, "range");
        NSStringFromRange(v132);
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)v44;
        if (v44)
          v46 = (const __CFString *)v44;
        else
          v46 = &stru_24F2ADCC8;
        objc_msgSend(v40, "setObject:forKey:", v46, CFSTR("range"));

        objc_msgSend(v39, "representedText");
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v47;
        if (v47)
          v49 = (const __CFString *)v47;
        else
          v49 = &stru_24F2ADCC8;
        objc_msgSend(v40, "setObject:forKey:", v49, CFSTR("representedText"));

        v50 = objc_msgSend(v39, "textUnit");
        v35 = v101;
        -[CACSpokenCommandManager _descriptionForAXTextUnit:](v101, "_descriptionForAXTextUnit:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", v51, CFSTR("type"));

        objc_msgSend(v110, "addObject:", v40);
      }
      v36 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
    }
    while (v36);
  }

  v52 = v98;
  objc_msgSend(v98, "setObject:forKey:", v110, CFSTR("OverlayElements"));
  +[CACApplicationUtilities targetApplications](CACApplicationUtilities, "targetApplications");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setObject:forKey:", v53, CFSTR("Applications"));

  if (v35->_focusedElement)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXElement recognitionStrings](v35->_focusedElement, "recognitionStrings");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "firstObject");
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v56)
      v57 = v56;
    else
      v57 = &stru_24F2ADCC8;
    objc_msgSend(v54, "setObject:forKey:", v57, CFSTR("Text"));
    -[AXElement uiElement](v35->_focusedElement, "uiElement");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringWithAXAttribute:", 5019);
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v59)
      v60 = v59;
    else
      v60 = &stru_24F2ADCC8;
    objc_msgSend(v54, "setObject:forKey:", v60, CFSTR("Identifier"));
    -[AXElement value](v35->_focusedElement, "value");
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v61;
    if (v61)
      v63 = (const __CFString *)v61;
    else
      v63 = &stru_24F2ADCC8;
    objc_msgSend(v54, "setObject:forKey:", v63, CFSTR("Value"));
    -[AXElement cacTextOperations](v35->_focusedElement, "cacTextOperations");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v64)
      objc_msgSend(v54, "setObject:forKey:", v64, CFSTR("AvaiableTextOperations"));
    -[AXElement cacTextSelectionCACTextMarkerRange](v35->_focusedElement, "cacTextSelectionCACTextMarkerRange");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)MEMORY[0x24BDD17C8];
    v67 = objc_msgSend(v65, "nsRange");
    objc_msgSend(v65, "nsRange");
    objc_msgSend(v66, "stringWithFormat:", CFSTR("%ld, %ld"), v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKey:", v69, CFSTR("SelectionRange"));

    -[AXElement cacStringForCACTextMarkerRange:](v35->_focusedElement, "cacStringForCACTextMarkerRange:", v65);
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = (void *)v70;
    if (v70)
      v72 = (const __CFString *)v70;
    else
      v72 = &stru_24F2ADCC8;
    objc_msgSend(v54, "setObject:forKey:", v72, CFSTR("SelectedText"));
    objc_msgSend(v98, "setObject:forKey:", v54, CFSTR("FocusedTextElement"));

  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "isActiveOverlayType:", CFSTR("NumberedElements"));

  if (v74)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    v114 = 0u;
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "labeledElementsForItemNumbers");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = v77;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v112;
      do
      {
        for (k = 0; k != v79; ++k)
        {
          if (*(_QWORD *)v112 != v80)
            objc_enumerationMutation(v108);
          v82 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "numberedLabel");
          v84 = objc_claimAutoreleasedReturnValue();
          v85 = (void *)v84;
          if (v84)
            v86 = (const __CFString *)v84;
          else
            v86 = &stru_24F2ADCC8;
          objc_msgSend(v83, "setObject:forKey:", v86, CFSTR("Text"));
          objc_msgSend(v82, "rectangle");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%4.0f, %4.0f, %4.0f, %4.0f)"), v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setObject:forKey:", v91, CFSTR("Rectangle"));

          objc_msgSend(v82, "labelRectangle");
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%4.0f, %4.0f, %4.0f, %4.0f)"), v92, v93, v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "setObject:forKey:", v96, CFSTR("LabelRectangle"));

          objc_msgSend(v75, "addObject:", v83);
        }
        v79 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
      }
      while (v79);
    }

    v52 = v98;
    objc_msgSend(v98, "setObject:forKey:", v75, CFSTR("LabeledElements"));

  }
  return v52;
}

- (void)registerSignPostBeginProcessingForSpeechRecognizer:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_recognizers;
  objc_sync_enter(v8);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = self->_recognizers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v50;
    while (2)
    {
      v13 = 0;
      v14 = v11 + v10;
      do
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v13), "speechRecognizer", (_QWORD)v49);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v15 == v6;

        if (v16)
        {
          switch(v11 + v13)
          {
            case 0:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v18 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v18;
                v19 = "CAC, CmdRec: Processing recognzer 0.";
                goto LABEL_71;
              }
              break;
            case 1:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v20 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v20;
                v19 = "CAC, CmdRec: Processing recognzer 1.";
                goto LABEL_71;
              }
              break;
            case 2:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v21 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v21;
                v19 = "CAC, CmdRec: Processing recognzer 2.";
                goto LABEL_71;
              }
              break;
            case 3:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v22 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v22;
                v19 = "CAC, CmdRec: Processing recognzer 3.";
                goto LABEL_71;
              }
              break;
            case 4:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v23;
                v19 = "CAC, CmdRec: Processing recognzer 4.";
                goto LABEL_71;
              }
              break;
            case 5:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v24 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v24;
                v19 = "CAC, CmdRec: Processing recognzer 5.";
                goto LABEL_71;
              }
              break;
            case 6:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v25 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v25;
                v19 = "CAC, CmdRec: Processing recognzer 6.";
                goto LABEL_71;
              }
              break;
            case 7:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v26 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v26;
                v19 = "CAC, CmdRec: Processing recognzer 7.";
                goto LABEL_71;
              }
              break;
            case 8:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v27 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v27;
                v19 = "CAC, CmdRec: Processing recognzer 8.";
                goto LABEL_71;
              }
              break;
            case 9:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v28 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v28;
                v19 = "CAC, CmdRec: Processing recognzer 9.";
                goto LABEL_71;
              }
              break;
            case 10:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v29 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v29;
                v19 = "CAC, CmdRec: Processing recognzer 10.";
                goto LABEL_71;
              }
              break;
            case 11:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v30 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v30;
                v19 = "CAC, CmdRec: Processing recognzer 11.";
                goto LABEL_71;
              }
              break;
            case 12:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v31 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v31;
                v19 = "CAC, CmdRec: Processing recognzer 12.";
                goto LABEL_71;
              }
              break;
            case 13:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v32 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v32;
                v19 = "CAC, CmdRec: Processing recognzer 13.";
                goto LABEL_71;
              }
              break;
            case 14:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v33 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v33;
                v19 = "CAC, CmdRec: Processing recognzer 14.";
                goto LABEL_71;
              }
              break;
            case 15:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v34 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v34;
                v19 = "CAC, CmdRec: Processing recognzer 15.";
                goto LABEL_71;
              }
              break;
            case 16:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v35 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v35;
                v19 = "CAC, CmdRec: Processing recognzer 16.";
                goto LABEL_71;
              }
              break;
            case 17:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v36 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v36;
                v19 = "CAC, CmdRec: Processing recognzer 17.";
                goto LABEL_71;
              }
              break;
            case 18:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v37 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v37;
                v19 = "CAC, CmdRec: Processing recognzer 18.";
                goto LABEL_71;
              }
              break;
            case 19:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v38 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v38;
                v19 = "CAC, CmdRec: Processing recognzer 19.";
                goto LABEL_71;
              }
              break;
            case 20:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v39 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v39;
                v19 = "CAC, CmdRec: Processing recognzer 20.";
                goto LABEL_71;
              }
              break;
            case 21:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v40 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v40;
                v19 = "CAC, CmdRec: Processing recognzer 21.";
                goto LABEL_71;
              }
              break;
            case 22:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v41 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v41;
                v19 = "CAC, CmdRec: Processing recognzer 22.";
                goto LABEL_71;
              }
              break;
            case 23:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v42 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v42;
                v19 = "CAC, CmdRec: Processing recognzer 24.";
                goto LABEL_71;
              }
              break;
            case 25:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v44 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v44;
                v19 = "CAC, CmdRec: Processing recognzer 25.";
                goto LABEL_71;
              }
              break;
            case 26:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v45 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v45;
                v19 = "CAC, CmdRec: Processing recognzer 26.";
                goto LABEL_71;
              }
              break;
            case 27:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v48 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v48;
                v19 = "CAC, CmdRec: Processing recognzer 27.";
                goto LABEL_71;
              }
              break;
            case 28:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v46 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v46;
                v19 = "CAC, CmdRec: Processing recognzer 28.";
                goto LABEL_71;
              }
              break;
            case 29:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v47 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v47;
                v19 = "CAC, CmdRec: Processing recognzer 29.";
                goto LABEL_71;
              }
              break;
            default:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v43 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v43;
                v19 = "CAC, CmdRec: Processing recognzer >= 30.";
LABEL_71:
                _os_signpost_emit_with_name_impl(&dword_229A40000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v19, "%s", buf, 0xCu);
              }
              break;
          }

          goto LABEL_73;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      v11 = v14;
      if (v10)
        continue;
      break;
    }
  }
LABEL_73:

  objc_sync_exit(v8);
}

- (void)registerSignPostEndProcessingForSpeechRecognizer:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BOOL4 v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self->_recognizers;
  objc_sync_enter(v8);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = self->_recognizers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v50;
    while (2)
    {
      v13 = 0;
      v14 = v11 + v10;
      do
      {
        if (*(_QWORD *)v50 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v13), "speechRecognizer", (_QWORD)v49);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v15 == v6;

        if (v16)
        {
          switch(v11 + v13)
          {
            case 0:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v18 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v18;
                v19 = "CAC, CmdRec: Processing recognzer 0.";
                goto LABEL_71;
              }
              break;
            case 1:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v20 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v20;
                v19 = "CAC, CmdRec: Processing recognzer 1.";
                goto LABEL_71;
              }
              break;
            case 2:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v21 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v21;
                v19 = "CAC, CmdRec: Processing recognzer 2.";
                goto LABEL_71;
              }
              break;
            case 3:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v22 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v22;
                v19 = "CAC, CmdRec: Processing recognzer 3.";
                goto LABEL_71;
              }
              break;
            case 4:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v23 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v23;
                v19 = "CAC, CmdRec: Processing recognzer 4.";
                goto LABEL_71;
              }
              break;
            case 5:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v24 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v24;
                v19 = "CAC, CmdRec: Processing recognzer 5.";
                goto LABEL_71;
              }
              break;
            case 6:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v25 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v25;
                v19 = "CAC, CmdRec: Processing recognzer 6.";
                goto LABEL_71;
              }
              break;
            case 7:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v26 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v26;
                v19 = "CAC, CmdRec: Processing recognzer 7.";
                goto LABEL_71;
              }
              break;
            case 8:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v27 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v27;
                v19 = "CAC, CmdRec: Processing recognzer 8.";
                goto LABEL_71;
              }
              break;
            case 9:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v28 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v28;
                v19 = "CAC, CmdRec: Processing recognzer 9.";
                goto LABEL_71;
              }
              break;
            case 10:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v29 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v29;
                v19 = "CAC, CmdRec: Processing recognzer 10.";
                goto LABEL_71;
              }
              break;
            case 11:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v30 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v30;
                v19 = "CAC, CmdRec: Processing recognzer 11.";
                goto LABEL_71;
              }
              break;
            case 12:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v31 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v31;
                v19 = "CAC, CmdRec: Processing recognzer 12.";
                goto LABEL_71;
              }
              break;
            case 13:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v32 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v32;
                v19 = "CAC, CmdRec: Processing recognzer 13.";
                goto LABEL_71;
              }
              break;
            case 14:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v33 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v33;
                v19 = "CAC, CmdRec: Processing recognzer 14.";
                goto LABEL_71;
              }
              break;
            case 15:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v34 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v34;
                v19 = "CAC, CmdRec: Processing recognzer 15.";
                goto LABEL_71;
              }
              break;
            case 16:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v35 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v35;
                v19 = "CAC, CmdRec: Processing recognzer 16.";
                goto LABEL_71;
              }
              break;
            case 17:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v36 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v36;
                v19 = "CAC, CmdRec: Processing recognzer 17.";
                goto LABEL_71;
              }
              break;
            case 18:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v37 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v37;
                v19 = "CAC, CmdRec: Processing recognzer 18.";
                goto LABEL_71;
              }
              break;
            case 19:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v38 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v38;
                v19 = "CAC, CmdRec: Processing recognzer 19.";
                goto LABEL_71;
              }
              break;
            case 20:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v39 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v39;
                v19 = "CAC, CmdRec: Processing recognzer 20.";
                goto LABEL_71;
              }
              break;
            case 21:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v40 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v40;
                v19 = "CAC, CmdRec: Processing recognzer 21.";
                goto LABEL_71;
              }
              break;
            case 22:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v41 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v41;
                v19 = "CAC, CmdRec: Processing recognzer 22.";
                goto LABEL_71;
              }
              break;
            case 23:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v42 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v42;
                v19 = "CAC, CmdRec: Processing recognzer 24.";
                goto LABEL_71;
              }
              break;
            case 25:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v44 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v44;
                v19 = "CAC, CmdRec: Processing recognzer 25.";
                goto LABEL_71;
              }
              break;
            case 26:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v45 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v45;
                v19 = "CAC, CmdRec: Processing recognzer 26.";
                goto LABEL_71;
              }
              break;
            case 27:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v48 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v48;
                v19 = "CAC, CmdRec: Processing recognzer 27.";
                goto LABEL_71;
              }
              break;
            case 28:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v46 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v46;
                v19 = "CAC, CmdRec: Processing recognzer 28.";
                goto LABEL_71;
              }
              break;
            case 29:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v47 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v47;
                v19 = "CAC, CmdRec: Processing recognzer 29.";
                goto LABEL_71;
              }
              break;
            default:
              RXSignpostLog();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_signpost_enabled(v17))
              {
                v43 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
                *(_DWORD *)buf = 136315138;
                v54 = v43;
                v19 = "CAC, CmdRec: Processing recognzer >= 30.";
LABEL_71:
                _os_signpost_emit_with_name_impl(&dword_229A40000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v19, "%s", buf, 0xCu);
              }
              break;
          }

          goto LABEL_73;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      v11 = v14;
      if (v10)
        continue;
      break;
    }
  }
LABEL_73:

  objc_sync_exit(v8);
}

- (void)_updateAssetPurgeability
{
  NSObject *v2;

  dispatch_get_global_queue(21, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_790);

}

void __51__CACSpokenCommandManager__updateAssetPurgeability__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bestLocaleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v5[0] = v1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
    RXObjectSetProperty();
  }
  else
  {
    CACLogRecognition();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __51__CACSpokenCommandManager__updateAssetPurgeability__block_invoke_cold_1();

  }
  v3 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (const __CFString *)_AXSAccessibilityPreferenceDomain();
  CFPreferencesSetValue(CFSTR("LastPurgabilityUpdate"), v3, v4, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);

}

- (void)_updateMostRecentLaunchTime
{
  const void *v2;

  v2 = (const void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  CFPreferencesSetValue(CFSTR("LastVoiceControlLaunch"), v2, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
}

- (OS_dispatch_queue)recognizerSynchronizationDispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRecognizerSynchronizationDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (CACLabeledElementsCollection)labeledScreenElementsCollection
{
  return (CACLabeledElementsCollection *)objc_getProperty(self, a2, 248, 1);
}

- (CACDisambiguationHandler)disambiguationHandler
{
  return (CACDisambiguationHandler *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDisambiguationHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSString)transientOverlayType
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTransientOverlayType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)userIsTouching
{
  return self->_userIsTouching;
}

- (double)lastDictationInsertionTimeStamp
{
  return self->_lastDictationInsertionTimeStamp;
}

- (NSString)recognizedCommandIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRecognizedCommandIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSMutableArray)commandsToIgnore
{
  return (NSMutableArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCommandsToIgnore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (BOOL)isAttentionAwareClientRunning
{
  return self->_isAttentionAwareClientRunning;
}

- (BOOL)telephonyInterruptedListening
{
  return self->_telephonyInterruptedListening;
}

- (void)setTelephonyInterruptedListening:(BOOL)a3
{
  self->_telephonyInterruptedListening = a3;
}

- (BOOL)shouldPreserveDisambiguationHandler
{
  return self->_shouldPreserveDisambiguationHandler;
}

- (void)setShouldPreserveDisambiguationHandler:(BOOL)a3
{
  self->_shouldPreserveDisambiguationHandler = a3;
}

- (CACTextInsertionSpecifier)previousTextInsertionSpecifier
{
  return (CACTextInsertionSpecifier *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPreviousTextInsertionSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (CACTextInsertionSpecifier)stagedTextInsertionSpecifier
{
  return (CACTextInsertionSpecifier *)objc_getProperty(self, a2, 400, 1);
}

- (void)setStagedTextInsertionSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (BOOL)forceAllCommandsToBeActive
{
  return self->_forceAllCommandsToBeActive;
}

- (NSString)commandRecognitionLogPath
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)usingAutomationMode
{
  return self->_usingAutomationMode;
}

- (CACAXNotificationObserver)axNotificationObserver
{
  return self->_axNotificationObserver;
}

- (void)setAxNotificationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_axNotificationObserver, a3);
}

- (CACTouchEventObserver)touchEventObserver
{
  return self->_touchEventObserver;
}

- (void)setTouchEventObserver:(id)a3
{
  objc_storeStrong((id *)&self->_touchEventObserver, a3);
}

- (FBSApplicationLibrary)appLibrary
{
  return self->_appLibrary;
}

- (void)setAppLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_appLibrary, a3);
}

- (FBSALOToken)applicationAddedObservationToken
{
  return self->_applicationAddedObservationToken;
}

- (void)setApplicationAddedObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_applicationAddedObservationToken, a3);
}

- (FBSALOToken)applicationRemovedObservationToken
{
  return self->_applicationRemovedObservationToken;
}

- (void)setApplicationRemovedObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_applicationRemovedObservationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRemovedObservationToken, 0);
  objc_storeStrong((id *)&self->_applicationAddedObservationToken, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_touchEventObserver, 0);
  objc_storeStrong((id *)&self->_axNotificationObserver, 0);
  objc_storeStrong((id *)&self->_stagedTextInsertionSpecifier, 0);
  objc_storeStrong((id *)&self->_previousTextInsertionSpecifier, 0);
  objc_storeStrong((id *)&self->_commandsToIgnore, 0);
  objc_storeStrong((id *)&self->_recognizedCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_perAppElementFetchingQueue, 0);
  objc_storeStrong((id *)&self->_nonScannerElementFetchingQueue, 0);
  objc_storeStrong((id *)&self->_elementFetchingQueue, 0);
  objc_storeStrong((id *)&self->_currentAttentionAwarenessAction, 0);
  objc_storeStrong((id *)&self->_assetPurgabilityTimer, 0);
  objc_storeStrong((id *)&self->_transientOverlayType, 0);
  objc_storeStrong((id *)&self->_disambiguationHandler, 0);
  objc_storeStrong((id *)&self->_labeledScreenElementsCollection, 0);
  objc_storeStrong((id *)&self->_pendingCommandToExecute, 0);
  objc_storeStrong(&self->_synchronousRemoteRequestCompletionBlock, 0);
  objc_storeStrong((id *)&self->_externalContextOverrideTable, 0);
  objc_storeStrong((id *)&self->_commandRecognitionLogPath, 0);
  objc_storeStrong((id *)&self->_builtInLocalizedCommandStrings, 0);
  objc_storeStrong((id *)&self->_previousResolverRelationships, 0);
  objc_storeStrong((id *)&self->_nextResolverRelationships, 0);
  objc_storeStrong((id *)&self->_currentRepeatingSpokenCommand, 0);
  objc_storeStrong((id *)&self->_currentNextPreviousResolverSpokenCommand, 0);
  objc_storeStrong((id *)&self->_commandExecutionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_oldRXLangaugeObjects, 0);
  objc_storeStrong((id *)&self->_identifierBasedLanguageModelCache, 0);
  objc_storeStrong((id *)&self->_recognizerInteractionLevels, 0);
  objc_storeStrong((id *)&self->_recognizedCommandsReadyForDispatch, 0);
  objc_storeStrong((id *)&self->_recognizers, 0);
  objc_storeStrong((id *)&self->_recognizerSynchronizationDispatchQueue, 0);
  objc_storeStrong((id *)&self->_previousLeadingTextString, 0);
  objc_storeStrong((id *)&self->_presentationElements, 0);
  objc_storeStrong((id *)&self->_focusedElement, 0);
  objc_storeStrong((id *)&self->_topLevelAndNonScannerElements, 0);
  objc_storeStrong((id *)&self->_topLevelElements, 0);
  objc_storeStrong((id *)&self->_activeApplications, 0);
}

- (void)setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "No change in elements!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "No change in top level elements! 2", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "No change in top level elements!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_notifyStatusChanged:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_9(&dword_229A40000, v1, (uint64_t)v1, "Sending notification %@ for status %ld", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_notifyStatusChanged:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_229A40000, v0, v1, "NOT sending notification for status %ld", v2);
  OUTLINED_FUNCTION_1();
}

void __70__CACSpokenCommandManager__updateLanguageModelForBuiltInLMIdentifier___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_229A40000, v0, v1, "[installedApplications] Retrying query of installed apps.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_pushInteractionLevel:referencingObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_229A40000, v0, v1, "_pushInteractionLevel: called with nil referencing object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_pushInteractionLevel:(uint64_t)a3 referencingObject:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_229A40000, a2, a3, "_pushInteractionLevel: pushed level %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_popInteractionLevel:(uint64_t)a3 referencingObject:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_229A40000, a2, a3, "_popInteractionLevel: popped level %d.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleRecognizedCommand:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "recognizedParameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_229A40000, a2, v5, "handleRecognizedCommand recognizedParameters: %@", v6);

  OUTLINED_FUNCTION_3();
}

void __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_229A40000, v0, OS_LOG_TYPE_ERROR, "Error invalidating idle assertion %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_229A40000, v0, v1, "Did fetch elements", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)synchronousRecognitionUsingCommandIdentifier:(uint64_t)a1 parameters:(void *)a2 timeoutInterval:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_9(&dword_229A40000, a3, v6, "synchronousRecognitionUsingCommandIdentifier: identifier (%@), parameters (%@)", (uint8_t *)&v7);

  OUTLINED_FUNCTION_3();
}

void __51__CACSpokenCommandManager__updateAssetPurgeability__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_229A40000, v0, v1, "No current locale for dictation, not preventing purgeability for any languages", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
