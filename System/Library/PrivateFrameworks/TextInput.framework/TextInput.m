id TIInputModeGetNormalizedIdentifier(void *a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    TIInputModeGetComponentsFromIdentifier(a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetNormalizedIdentifierFromComponents(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id TIInputModeGetNormalizedIdentifierFromComponents(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v1 = *MEMORY[0x1E0C997E8];
  v2 = a1;
  objc_msgSend(v2, "valueForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C997B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C99820]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C99848]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  TIInputModeGetNormalizedVariant(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v5)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v13 = v5;
      v16 = v7;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v3, v7, v15);
        goto LABEL_14;
      }
      v13 = v4;
      v16 = v7;
    }
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%@-%@"), v3, v13, v16);
  }
  else
  {
    if (v5)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v14 = v5;
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3, v12, v15);
        goto LABEL_14;
      }
      v14 = v4;
    }
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v3, v14, v15);
  }
LABEL_14:
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id TIInputModeGetLanguage(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    TIInputModeGetComponentsFromIdentifier(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0C997E8];
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0C99820];
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C99820]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v4, v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "setObject:forKey:", v6, v5);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id TIInputModeGetComponentsFromIdentifier(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_get_components_lock);
    v2 = (void *)TIInputModeGetComponentsFromIdentifier___componentsCache;
    if (!TIInputModeGetComponentsFromIdentifier___componentsCache)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v4 = (void *)TIInputModeGetComponentsFromIdentifier___componentsCache;
      TIInputModeGetComponentsFromIdentifier___componentsCache = (uint64_t)v3;

      v2 = (void *)TIInputModeGetComponentsFromIdentifier___componentsCache;
    }
    objc_msgSend(v2, "objectForKey:", v1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      os_unfair_lock_unlock((os_unfair_lock_t)&_get_components_lock);
      v7 = v6;
LABEL_38:

      goto LABEL_39;
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v1, "rangeOfString:", CFSTR("@"));
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || (v10 = v9, v9 >= objc_msgSend(v1, "length")))
    {
LABEL_28:
      if ((objc_msgSend(v1, "hasPrefix:", CFSTR("zh_Han")) & 1) != 0
        || objc_msgSend(v1, "hasPrefix:", CFSTR("yue_Han")))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("sw"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("hw"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("sw"));
        if (v25)
          objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("hw"));
        objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("_-@@"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "objectAtIndex:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v28, *MEMORY[0x1E0C997E8]);

        objc_msgSend(v27, "objectAtIndex:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v29, *MEMORY[0x1E0C997B0]);

        if ((unint64_t)objc_msgSend(v27, "count") >= 3)
        {
          objc_msgSend(v27, "objectAtIndex:", 2);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v30, *MEMORY[0x1E0C99848]);

        }
      }
      else
      {
        v23 = (void *)objc_msgSend(v8, "mutableCopy");
        v32 = *MEMORY[0x1E0C99848];
        objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0C99848]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        TIInputModeGetNormalizedVariant(v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v24, "length"))
          objc_msgSend(v23, "setValue:forKey:", v24, v32);
      }

      objc_msgSend((id)TIInputModeGetComponentsFromIdentifier___componentsCache, "setObject:forKey:", v23, v1);
      os_unfair_lock_unlock((os_unfair_lock_t)&_get_components_lock);
      v7 = v23;

      goto LABEL_38;
    }
    v34 = v8;
    v8 = (void *)objc_msgSend(v8, "mutableCopy");
    v35 = v1;
    objc_msgSend(v1, "substringFromIndex:", v10 + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(";"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (!v14)
      goto LABEL_27;
    v15 = v14;
    v16 = *(_QWORD *)v37;
LABEL_11:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v17);
      if (objc_msgSend(v18, "hasPrefix:", CFSTR("sw="))
        && (unint64_t)objc_msgSend(v18, "length") >= 4)
      {
        objc_msgSend(v18, "substringFromIndex:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v8;
        v21 = v19;
        v22 = CFSTR("sw");
      }
      else if (objc_msgSend(v18, "hasPrefix:", CFSTR("hw="))
             && (unint64_t)objc_msgSend(v18, "length") >= 4)
      {
        objc_msgSend(v18, "substringFromIndex:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v8;
        v21 = v19;
        v22 = CFSTR("hw");
      }
      else
      {
        if (!_os_feature_enabled_impl()
          || !objc_msgSend(v18, "hasPrefix:", CFSTR("ml="))
          || (unint64_t)objc_msgSend(v18, "length") < 4)
        {
          goto LABEL_25;
        }
        objc_msgSend(v18, "substringFromIndex:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v8;
        v21 = v19;
        v22 = CFSTR("ml");
      }
      objc_msgSend(v20, "setObject:forKey:", v21, v22);

LABEL_25:
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (!v15)
        {
LABEL_27:

          v1 = v35;
          goto LABEL_28;
        }
        goto LABEL_11;
      }
    }
  }
  v7 = 0;
LABEL_39:

  return v7;
}

id TIInputModeGetNormalizedVariant(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (TIInputModeGetNormalizedVariant___onceToken != -1)
    dispatch_once(&TIInputModeGetNormalizedVariant___onceToken, &__block_literal_global_1820);
  v2 = v1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = v1;
    if ((objc_msgSend((id)TIInputModeGetNormalizedVariant___variantsToKeepCapitalized, "containsObject:", v1) & 1) == 0)
    {
      objc_msgSend(v1, "capitalizedString");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v2;
}

id TIInputModeGetLanguageWithRegion(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-@"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:", v2, 2);

  v4 = v1;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringToIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id managedConfigurationFeatureForPreferenceKey(void *a1)
{
  id v1;
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;
  TIPreferencesController *v8;
  SEL v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("KeyboardAutocorrection")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("HWKeyboardAutocorrection")))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v2 = (id *)getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr;
    v14 = getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr;
    if (!getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr)
    {
      v3 = (void *)ManagedConfigurationLibrary();
      v2 = (id *)dlsym(v3, "MCFeatureAutoCorrectionAllowed");
      v12[3] = (uint64_t)v2;
      getMCFeatureAutoCorrectionAllowedSymbolLoc_ptr = (uint64_t)v2;
    }
  }
  else
  {
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("KeyboardPrediction"))
      || objc_msgSend(v1, "isEqualToString:", CFSTR("KeyboardInlineCompletion")))
    {
      getMCFeaturePredictiveKeyboardAllowed();
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("KeyboardMathExpressionCompletion")))
    {
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("KeyboardCheckSpelling")))
      {
        getMCFeatureSpellCheckAllowed();
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v1, "isEqualToString:", CFSTR("SmartQuotesEnabled")))
      {
        getMCFeatureSmartPunctuationAllowed();
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v1, "isEqualToString:", CFSTR("KeyboardContinuousPathEnabled")))
        {
          v5 = 0;
          goto LABEL_8;
        }
        getMCFeatureContinuousPathKeyboardAllowed();
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_7:
      v5 = v4;
LABEL_8:

      return v5;
    }
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v2 = (id *)getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr;
    v14 = getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr;
    if (!getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr)
    {
      v7 = (void *)ManagedConfigurationLibrary();
      v2 = (id *)dlsym(v7, "MCFeatureKeyboardMathSolvingAllowed");
      v12[3] = (uint64_t)v2;
      getMCFeatureKeyboardMathSolvingAllowedSymbolLoc_ptr = (uint64_t)v2;
    }
  }
  _Block_object_dispose(&v11, 8);
  if (v2)
  {
    v4 = *v2;
    goto LABEL_7;
  }
  dlerror();
  v8 = (TIPreferencesController *)abort_report_np();
  return -[TIPreferencesController valueForPreferenceKey:](v8, v9, v10);
}

BOOL isManagedPreferenceKey(void *a1)
{
  void *v1;
  _BOOL8 v2;

  managedConfigurationFeatureForPreferenceKey(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

id getMCFeaturePredictiveKeyboardAllowed()
{
  id *v0;
  void *v1;
  void *v3;
  SEL v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v0 = (id *)getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr;
  v10 = getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr;
  if (!getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr)
  {
    v1 = (void *)ManagedConfigurationLibrary();
    v0 = (id *)dlsym(v1, "MCFeaturePredictiveKeyboardAllowed");
    v8[3] = (uint64_t)v0;
    getMCFeaturePredictiveKeyboardAllowedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v7, 8);
  if (v0)
    return *v0;
  dlerror();
  v3 = (void *)abort_report_np();
  return +[_TIPreferenceDomain domainWithName:notification:](v3, v4, v5, v6);
}

void getMCFeatureSmartPunctuationAllowed()
{
  id *v0;
  void *v1;
  id v2;
  TIInputModeController *v3;
  SEL v4;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v0 = (id *)getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr;
  v9 = getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr;
  if (!getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr)
  {
    v1 = (void *)ManagedConfigurationLibrary();
    v0 = (id *)dlsym(v1, "MCFeatureSmartPunctuationAllowed");
    v7[3] = (uint64_t)v0;
    getMCFeatureSmartPunctuationAllowedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v6, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    dlerror();
    v3 = (TIInputModeController *)abort_report_np();
    -[TIInputModeController setDefaultInputModes:](v3, v4, v5);
  }
}

__CFString *preferenceKeyForEnumKey(int a1)
{
  __CFString *v1;
  __CFString *v2;

  v1 = 0;
  switch(a1)
  {
    case 0:
      v1 = CFSTR("AppleKeyboards");
      goto LABEL_84;
    case 1:
      v1 = CFSTR("AppleKeyboardsExpanded");
      goto LABEL_84;
    case 2:
      v1 = CFSTR("AppleKeyboardsIncludeIntl");
      goto LABEL_84;
    case 3:
      v1 = CFSTR("AppleLocale");
      goto LABEL_84;
    case 4:
      v1 = CFSTR("AppleLanguages");
      goto LABEL_84;
    case 7:
      v1 = CFSTR("KeyboardAssistant");
      goto LABEL_84;
    case 8:
      v1 = CFSTR("KeyboardAutocorrection");
      goto LABEL_84;
    case 9:
      v1 = CFSTR("KeyboardAutocapitalization");
      goto LABEL_84;
    case 10:
      v1 = CFSTR("KeyboardCheckSpelling");
      goto LABEL_84;
    case 11:
      v1 = CFSTR("KeyboardPeriodShortcut");
      goto LABEL_84;
    case 12:
      v1 = CFSTR("KeyboardCapsLock");
      goto LABEL_84;
    case 13:
      v1 = CFSTR("KeyboardLastUsed");
      goto LABEL_84;
    case 14:
      v1 = CFSTR("KeyboardsCurrentAndNext");
      goto LABEL_84;
    case 15:
      v1 = CFSTR("KeyboardLastUsedForLanguage");
      goto LABEL_84;
    case 16:
      v1 = CFSTR("KeyboardLayoutLastUsedForKeyboard");
      goto LABEL_84;
    case 17:
      v1 = CFSTR("KeyboardLastChosen");
      goto LABEL_84;
    case 19:
      v1 = CFSTR("KeyboardHardwareKeyboardsSeen");
      goto LABEL_84;
    case 20:
      v1 = CFSTR("HardwareKeyboardLastSeen");
      goto LABEL_84;
    case 21:
      v1 = CFSTR("SoftwareKeyboardShownByTouch");
      goto LABEL_84;
    case 22:
      v1 = CFSTR("AutomaticMinimizationEnabled");
      goto LABEL_84;
    case 23:
      v1 = CFSTR("UIKeyboardPersistentVerticalOffset");
      goto LABEL_84;
    case 24:
      v1 = CFSTR("UIKeyboardPersistentHorizontalOffset");
      goto LABEL_84;
    case 25:
      v1 = CFSTR("UIKeyboardPersistentSplitProgress");
      goto LABEL_84;
    case 26:
      v1 = CFSTR("UIKeyboardPersistentSplitLock");
      goto LABEL_84;
    case 27:
      v1 = CFSTR("UIKeyboardDidShowInternationalInfoIntroduction");
      goto LABEL_84;
    case 28:
      v1 = CFSTR("EmojiDefaultsKey");
      return v1;
    case 33:
      v1 = CFSTR("RivenKeyboard");
      goto LABEL_84;
    case 34:
      v1 = CFSTR("KeyboardPredictionHelpMessageCount");
      goto LABEL_84;
    case 35:
      v1 = CFSTR("KeyboardShowPredictionBar");
      goto LABEL_84;
    case 36:
      v1 = CFSTR("KeyboardPrediction");
      goto LABEL_84;
    case 37:
      v1 = CFSTR("KeyboardBias");
      goto LABEL_84;
    case 38:
      v1 = CFSTR("KeyboardAllowPaddle");
      goto LABEL_84;
    case 39:
      v1 = CFSTR("KeyboardIsFloating");
      goto LABEL_84;
    case 40:
      v1 = CFSTR("KeyboardReachableFirstInteraction");
      goto LABEL_84;
    case 41:
      v1 = CFSTR("HWKeyboardAutocorrection");
      goto LABEL_84;
    case 42:
      v1 = CFSTR("HWKeyboardAutocapitalization");
      goto LABEL_84;
    case 43:
      v1 = CFSTR("HWKeyboardPeriodShortcut");
      goto LABEL_84;
    case 44:
      v1 = CFSTR("HWKeyboardGlobeAsEmojiKey");
      goto LABEL_84;
    case 45:
      v1 = CFSTR("HWKeyboardCapsLockRomanSwitch");
      goto LABEL_84;
    case 46:
      v1 = CFSTR("HWKeyboardDictationShortcut");
      goto LABEL_84;
    case 47:
      v1 = CFSTR("KeyboardUseProLayout");
      goto LABEL_84;
    case 48:
      v1 = CFSTR("ShowMemoji");
      goto LABEL_84;
    case 49:
      v1 = CFSTR("ShowStickers");
      goto LABEL_84;
    case 50:
      v1 = CFSTR("DictationKeyAlwaysEnabled");
      return v1;
    case 51:
      v1 = CFSTR("KeyboardPerformanceLogging");
      goto LABEL_84;
    case 52:
      v1 = CFSTR("DictationLogging");
      return v1;
    case 53:
      v1 = CFSTR("TypologyEnabled");
      goto LABEL_84;
    case 54:
      v1 = CFSTR("CustomerTypologyEnabledByDiagnosticExtension");
      goto LABEL_84;
    case 67:
      v1 = CFSTR("KeyboardAssetDownloadInFive");
      goto LABEL_84;
    case 69:
      v1 = CFSTR("KeyboardSwipeToTab");
      return v1;
    case 70:
      v1 = CFSTR("RivenLayoutSize");
      goto LABEL_84;
    case 73:
      v1 = CFSTR("ShowExtraLayouts");
      return v1;
    case 75:
      v1 = CFSTR("KeyboardCachingDisabled");
      return v1;
    case 77:
      v1 = CFSTR("HandwritingCaptureEnabled");
      return v1;
    case 80:
      v1 = CFSTR("KeyboardGlobeKeyExperiments");
      goto LABEL_84;
    case 83:
      v1 = CFSTR("KeyboardFloatingEnabled");
      goto LABEL_84;
    case 84:
      v1 = CFSTR("KeyboardMultilingualEnabled");
      goto LABEL_84;
    case 85:
      v1 = CFSTR("KeyboardContinuousPathEnabled");
      goto LABEL_84;
    case 86:
      v1 = CFSTR("KeyboardContinuousPathProgressiveCandidatesEnabled");
      goto LABEL_84;
    case 87:
      v1 = CFSTR("KeyboardContinuousPathCompletesWords");
      goto LABEL_84;
    case 88:
      v1 = CFSTR("KeyboardContinuousPathLanguageWeight");
      goto LABEL_84;
    case 89:
      v1 = CFSTR("KeyboardContinuousPathDeleteWholeWord");
      goto LABEL_84;
    case 90:
      v1 = CFSTR("KeyboardInsertsSpaceAfterPredictiveInput");
      goto LABEL_84;
    case 91:
      v1 = CFSTR("KeyboardContinuousPathEnabledAlgorithmTypes");
      goto LABEL_84;
    case 92:
      v1 = CFSTR("KeyboardCPCandidateCount");
      goto LABEL_84;
    case 93:
      v1 = CFSTR("KeyboardIgnoreCPConfigRequirements");
      goto LABEL_84;
    case 94:
      v1 = CFSTR("KeyboardDODMLLoggingEnabled");
      goto LABEL_84;
    case 95:
      v1 = CFSTR("KeyboardCJContinuousPathEnabled");
      goto LABEL_84;
    case 96:
      v1 = CFSTR("TypoTrackerButton");
      return v1;
    case 100:
      v1 = CFSTR("FuzzyPinyin");
      goto LABEL_84;
    case 101:
      v1 = CFSTR("SuchengCangjie");
      goto LABEL_84;
    case 102:
      v1 = CFSTR("FuzzyPinyinPairs");
      goto LABEL_84;
    case 103:
      v1 = CFSTR("SpaceConfirmation");
      goto LABEL_84;
    case 105:
      v1 = CFSTR("DictationTipLastShownDate");
      goto LABEL_84;
    case 106:
      v1 = CFSTR("DictationTipsDisplayCountLimit");
      goto LABEL_84;
    case 107:
      v1 = CFSTR("DictationReplacementCommandTipShownCount");
      goto LABEL_84;
    case 108:
      v1 = CFSTR("DictationDeletionCommandTipShownCount");
      goto LABEL_84;
    case 109:
      v1 = CFSTR("DictationInsertionCommandTipShownCount");
      goto LABEL_84;
    case 110:
      v1 = CFSTR("DictationEmojiCommandTipShownCount");
      goto LABEL_84;
    case 111:
      v1 = CFSTR("DictationSelectionCommandTipShownCount");
      goto LABEL_84;
    case 112:
      v1 = CFSTR("DictationStopCommandTipShownCount");
      goto LABEL_84;
    case 113:
      v1 = CFSTR("DictationModelessInputTipShownCount");
LABEL_84:
      v2 = v1;
      break;
    default:
      return v1;
  }
  return v1;
}

id TIGetDefaultInputModesForLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v1 = a1;
  if (TIGetDefaultInputModesForLanguage_once != -1)
    dispatch_once(&TIGetDefaultInputModesForLanguage_once, &__block_literal_global_177);
  TIInputModeGetBaseLanguage(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__defaultLanguageInputModes, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _UIKeyboardBundleInfoWithKey(v2, CFSTR("UIKeyboardDefaultLanguageInputModes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend((id)__defaultLanguageInputModes, "addEntriesFromDictionary:", v3);
  }
  v4 = (id)__defaultLanguageInputModes;
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
  {
    TIInputModeGetLanguage(v1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  if (!objc_msgSend(v6, "count"))
  {
    TIInputModeGetBaseLanguage(v1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  if (!objc_msgSend(v6, "count"))
  {
    TIInputModeGetRegion(v1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }
  +[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "supportedInputModeIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __TIGetDefaultInputModesForLanguage_block_invoke_2;
    v20[3] = &unk_1E24394A8;
    v21 = v14;
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v16;
LABEL_16:
    v17 = v6;
    v6 = v17;
    goto LABEL_17;
  }
  if (!objc_msgSend(v14, "containsObject:", v1))
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v1);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:
  v18 = v17;

  return v18;
}

id TIInputModeGetBaseLanguage(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    TIInputModeGetComponentsFromIdentifier(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0C997E8];
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v4, v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v0;
  void *v2;

  if (ManagedConfigurationLibraryCore_frameworkLibrary)
    return ManagedConfigurationLibraryCore_frameworkLibrary;
  ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getMCProfileConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMCProfileConnectionClass_softClass;
  v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E243AE68;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  TITypologyStatisticComposite *v3;
  SEL v4;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (TITypologyStatisticComposite *)abort_report_np();
    return (Class)-[TITypologyStatisticComposite aggregateReport](v3, v4);
  }
  return result;
}

id getMCFeatureContinuousPathKeyboardAllowed()
{
  id *v0;
  void *v1;
  TITypologyStatisticTimeElapsed *v3;
  SEL v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr;
  v8 = getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr;
  if (!getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr)
  {
    v1 = (void *)ManagedConfigurationLibrary();
    v0 = (id *)dlsym(v1, "MCFeatureContinuousPathKeyboardAllowed");
    v6[3] = (uint64_t)v0;
    getMCFeatureContinuousPathKeyboardAllowedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
    return *v0;
  dlerror();
  v3 = (TITypologyStatisticTimeElapsed *)abort_report_np();
  return -[TITypologyStatisticTimeElapsed aggregateReport](v3, v4);
}

id kac_get_log()
{
  if (kac_get_log_onceToken != -1)
    dispatch_once(&kac_get_log_onceToken, &__block_literal_global_7379);
  return (id)kac_get_log_log;
}

id TIInputModeGetVariant(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;
  void *v4;

  v1 = a1;
  v2 = objc_msgSend(v1, "rangeOfString:options:", CFSTR("-"), 2);
  v3 = objc_msgSend(v1, "rangeOfString:options:", CFSTR("@"), 2);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = objc_msgSend(v1, "length");
  v4 = 0;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL && v2 < v3)
  {
    objc_msgSend(v1, "substringWithRange:", v2 + 1, v3 - (v2 + 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id kace_get_log()
{
  if (kace_get_log_onceToken != -1)
    dispatch_once(&kace_get_log_onceToken, &__block_literal_global_3);
  return (id)kace_get_log_log;
}

void __kac_get_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "KeyboardSignposts");
  v1 = (void *)kac_get_log_log;
  kac_get_log_log = (uint64_t)v0;

}

BOOL CheckSandboxAccess(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (is_kbd_onceToken != -1)
    dispatch_once(&is_kbd_onceToken, &__block_literal_global_200);
  if (is_kbd__result)
  {
    v2 = 1;
  }
  else
  {
    getpid();
    objc_msgSend(objc_retainAutorelease(v1), "fileSystemRepresentation");
    v2 = sandbox_check() == 0;
  }

  return v2;
}

id TIGetTextInputFrameworkPath()
{
  if (TIGetTextInputFrameworkPath_onceToken != -1)
    dispatch_once(&TIGetTextInputFrameworkPath_onceToken, &__block_literal_global_338);
  return (id)TIGetTextInputFrameworkPath_textInputFrameworkPath;
}

id TIImageCacheImagesPath()
{
  void *v0;
  void *v1;

  TIImageCachePath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("images"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id TIGetDefaultDictationLanguagesForKeyboardLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  if (TIGetDefaultDictationLanguagesForKeyboardLanguage_once != -1)
    dispatch_once(&TIGetDefaultDictationLanguagesForKeyboardLanguage_once, &__block_literal_global_231);
  objc_msgSend((id)TIGetDefaultDictationLanguagesForKeyboardLanguage___defaultDictationLanguageProperties, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    TIInputModeGetBaseLanguage(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _UIKeyboardBundleInfoWithKey(v3, CFSTR("UIDefaultDictationLanguages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v1);
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
      v2 = (void *)v5;
    else
      v2 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend((id)TIGetDefaultDictationLanguagesForKeyboardLanguage___defaultDictationLanguageProperties, "setObject:forKey:", v2, v1);

  }
  if (!objc_msgSend(v2, "count"))
  {

    v2 = 0;
  }

  return v2;
}

id TIImageCachePath()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Caches"), CFSTR("com.apple.keyboards"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id TIGetHardwareLayoutsForInputMode(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  TIGetInputModeProperties(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("HWLayouts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("Group-"), (_QWORD)v14))
        {
          TIGetHardwareLayoutGroups();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "addObjectsFromArray:", v11);
        }
        else
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id TIGetInputModeProperties(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v1 = a1;
  if (TIGetInputModeProperties_once != -1)
    dispatch_once(&TIGetInputModeProperties_once, &__block_literal_global_218);
  os_unfair_lock_lock((os_unfair_lock_t)&_get_input_mode_properties_lock);
  objc_msgSend((id)__inputModeProperties, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("_-@@"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    _UIKeyboardBundleInfoWithKey(v5, CFSTR("UIKeyboardSupportedInputModes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl() && objc_msgSend(v1, "containsString:", CFSTR("th_TH")))
    {
      v7 = (void *)objc_msgSend(v2, "mutableCopy");
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("KeyboardCPEnabled"));

      v2 = v7;
    }
    if (v2)
      objc_msgSend((id)__inputModeProperties, "setObject:forKey:", v2, v1);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_get_input_mode_properties_lock);

  return v2;
}

id _UIKeyboardBundleInfoWithKey(void *a1, void *a2)
{
  id v3;
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(CFSTR("InputMode_"), "stringByAppendingString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("plist"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(&unk_1E24C0210, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKey:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      TIBundlePathForInputMode(v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v10, v6, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "pathWithComponents:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v13, 1, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
        }
        else
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          v20[0] = v10;
          v20[1] = CFSTR("Resources");
          v20[2] = v6;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pathWithComponents:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v18, 1, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)v18;
        }
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
        _CFPropertyListCreateFiltered();
        objc_msgSend(0, "objectForKey:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id TIGetHardwareLayoutGroups()
{
  if (TIGetHardwareLayoutGroups_onceToken != -1)
    dispatch_once(&TIGetHardwareLayoutGroups_onceToken, &__block_literal_global_232);
  return (id)TIGetHardwareLayoutGroups___layoutGroups;
}

id TILoadMergedKeyboardPlistForLocale(void *a1, void *a2, void *a3, uint64_t a4, void *a5, int a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a1;
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = CFSTR("iPhone");
  if (a4 == 1)
    v14 = CFSTR("iPad");
  if (a4 == 2)
    v15 = CFSTR("AppleTV");
  else
    v15 = v14;
  if (TIDefaultKeyboardPlist_onceToken != -1)
    dispatch_once(&TIDefaultKeyboardPlist_onceToken, &__block_literal_global_372);
  v43 = (id)TIDefaultKeyboardPlist_defaultPlist;
  TIInputModeGetBaseLanguage(v13);
  v16 = objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguage(v13);
  v17 = objc_claimAutoreleasedReturnValue();
  v41 = v13;
  objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguageWithRegion(v18);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v10, v15);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v10, v11);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v47 = (void *)v20;
    v48 = (void *)v19;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v10, v12);
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v45 = (void *)v24;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v24, v15);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
      }
      else
      {
        v45 = 0;
        v46 = 0;
        v22 = 1;
      }
      v21 = 0;
      v23 = 1;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@-%@"), v10, v11, v12);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v44 = (void *)v25;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v25, v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
        }
        else
        {
          v21 = 0;
          v44 = 0;
        }
      }
      else
      {
        v44 = 0;
      }
    }
    else
    {
      v45 = 0;
      v46 = 0;
      v21 = 0;
      v44 = 0;
      v22 = 1;
      v23 = 1;
    }
  }
  else
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v21 = 0;
    v44 = 0;
    v22 = 1;
    v23 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (a6 && v16)
    objc_msgSend(v26, "addObject:", v16);
  if (a6 && v17 && (objc_msgSend(v27, "containsObject:", v17) & 1) == 0)
    objc_msgSend(v27, "addObject:", v17);
  if (a6 && v49 && (objc_msgSend(v27, "containsObject:", v49) & 1) == 0)
    objc_msgSend(v27, "addObject:", v49);
  if (v10 && (objc_msgSend(v27, "containsObject:", v10) & 1) == 0)
    objc_msgSend(v27, "addObject:", v10);
  if (v47 && (objc_msgSend(v27, "containsObject:", v47) & 1) == 0)
    objc_msgSend(v27, "addObject:", v47);
  if ((v22 & 1) == 0 && (objc_msgSend(v27, "containsObject:", v45) & 1) == 0)
    objc_msgSend(v27, "addObject:", v45);
  if ((v23 & 1) == 0 && (objc_msgSend(v27, "containsObject:", v44) & 1) == 0)
    objc_msgSend(v27, "addObject:", v44);
  if (v48 && (objc_msgSend(v27, "containsObject:", v48) & 1) == 0)
    objc_msgSend(v27, "addObject:", v48);
  if (v46 && (objc_msgSend(v27, "containsObject:", v46) & 1) == 0)
    objc_msgSend(v27, "addObject:", v46);
  v40 = (void *)v16;
  if (v21 && (objc_msgSend(v27, "containsObject:", v21) & 1) == 0)
    objc_msgSend(v27, "addObject:", v21);
  v39 = v12;
  v42 = v11;
  if ((objc_msgSend(v27, "containsObject:", CFSTR("default")) & 1) != 0 || (a6 & 1) != 0)
  {
    v28 = (void *)v17;
    v29 = (id)objc_msgSend(v43, "mutableCopy");
    objc_msgSend(v27, "removeObject:", CFSTR("default"));
  }
  else
  {
    v28 = (void *)v17;
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v30 = v27;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v52 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        TIBundlePathForInputMode(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        TILoadKeyboardPlist(v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addEntriesFromDictionary:", v37);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v32);
  }

  return v29;
}

id TIBundlePathForInputMode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  _TextInputBundlesRootForDevelopment();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2
    || (_TextInputBundlesRootForDevelopment(),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        _GetBundlePathForInputModeWithRootDirectory(v1, v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/System/Library/TextInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _GetBundlePathForInputModeWithRootDirectory(v1, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id _TextInputBundlesRootForDevelopment()
{
  if (_TextInputBundlesRootForDevelopment_onceToken != -1)
    dispatch_once(&_TextInputBundlesRootForDevelopment_onceToken, &__block_literal_global_341);
  return (id)_TextInputBundlesRootForDevelopment_bundlesRoot;
}

id TILoadKeyboardPlist(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Keyboard-%@.plist"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    TILoadBundlePlist(v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id TILoadBundlePlist(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) != 0)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Resources"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "fileExistsAtPath:", v8);

    if (!(_DWORD)v9)
    {
      v12 = 0;
      goto LABEL_9;
    }
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v8, 1, 0);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

LABEL_9:
  return v12;
}

char *TIImageNameForItem(void *a1, void *a2)
{
  id v3;
  id v4;
  char *v5;

  v3 = a1;
  v4 = a2;
  v5 = (char *)malloc_type_malloc(0x32uLL, 0x3CA87F9uLL);
  if (v5)
    v5 = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, snprintf(v5, 0x32uLL, "%lu%lu", objc_msgSend(v4, "hash"), objc_msgSend(v3, "hash")), 1, 1);

  return v5;
}

id _GetBundlePathForInputModeWithRootDirectory(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v3 = a2;
  TIInputModeGetBaseLanguage(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/TextInput_%@.bundle"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/TextInput_mul.bundle"), v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if (!v10)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v5 = v8;
  }
  v11 = v5;
  v8 = v11;
LABEL_6:

  return v11;
}

void TIDispatchAsync(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __TIDispatchAsync_block_invoke;
  v8[3] = &unk_1E2439BF8;
  v9 = v3;
  v4 = v3;
  v5 = a1;
  v6 = (void *)MEMORY[0x18D783768](v8);
  if (_block_count(void)::once_token != -1)
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_4);
  do
    v7 = __ldaxr(&_block_count(void)::count);
  while (__stlxr(v7 + 1, &_block_count(void)::count));
  dispatch_async(v5, v6);

}

__CFString *TICanonicalInputModeName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    TIInputModeGetComponentsFromIdentifier(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetNormalizedIdentifierFromComponents(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C99820]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_6:
      v6 = v4;
LABEL_7:

      goto LABEL_8;
    }
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C99848]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_6;
    TIGetDefaultInputModesForLanguage(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetBaseLanguage(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetBaseLanguage(v2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
LABEL_13:

        goto LABEL_7;
      }

    }
    v6 = v2;
    goto LABEL_13;
  }
  v6 = CFSTR("intl");
LABEL_8:

  return v6;
}

BOOL TICharIsJapaneseScript()
{
  return uscript_hasScript() || uscript_hasScript() != 0;
}

id TIInputModeGetRegion(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    TIInputModeGetComponentsFromIdentifier(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id TIInputModeGetSWLayout(void *a1)
{
  void *v1;
  void *v2;

  TIInputModeGetComponentsFromIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("sw"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

BOOL IXACanLogMessageAtLevel(unsigned int a1)
{
  if (IXACanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&IXACanLogMessageAtLevel_onceToken, &__block_literal_global_6);
  return IXACanLogMessageAtLevel_logLevel >= a1;
}

void TIStatisticScalarIncrement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "aggdName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      IXADefaultLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v2, "aggdName");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%s TIStatistic Aggd: %s"), "TIStatisticScalarIncrement", objc_msgSend(v8, "UTF8String"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_debug_impl(&dword_18C56E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIAggdReporter sharedAggdReporter](TIAggdReporter, "sharedAggdReporter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "aggdName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "incrementKey:", v6);

    }
    routeCounterChangeThroughCoreAnalytics(v2, 1);
  }

}

void TIStatisticScalarSetBoolean(void *a1, unsigned int a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aggdName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      IXADefaultLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "aggdName");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v9 = objc_msgSend(v8, "UTF8String");
        v10 = "no";
        if (a2)
          v10 = "yes";
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%s TIStatistic Aggd: %s=%s"), "TIStatisticScalarSetBoolean", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      TIStatisticScalarSetValue(v4, a2);
    }
  }

}

void TIStatisticScalarSetValue(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aggdName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      IXADefaultLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "aggdName");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%s TIStatistic Aggd: %s=%lld"), "TIStatisticScalarSetValue", objc_msgSend(v10, "UTF8String"), a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIAggdReporter sharedAggdReporter](TIAggdReporter, "sharedAggdReporter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aggdName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forScalarKey:", a2, v8);

    }
  }

}

id IXADefaultLogFacility()
{
  if (IXADefaultLogFacility_onceToken != -1)
    dispatch_once(&IXADefaultLogFacility_onceToken, &__block_literal_global_7);
  return (id)IXADefaultLogFacility_logFacility;
}

void ___tiShouldSkipMCObservation_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  SecurityLibrary();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v0 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  v10 = getSecTaskCreateFromSelfSymbolLoc_ptr;
  if (!getSecTaskCreateFromSelfSymbolLoc_ptr)
  {
    v1 = (void *)SecurityLibrary();
    v0 = dlsym(v1, "SecTaskCreateFromSelf");
    v8[3] = (uint64_t)v0;
    getSecTaskCreateFromSelfSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v7, 8);
  if (!v0)
    goto LABEL_12;
  v2 = ((uint64_t (*)(_QWORD))v0)(0);
  if (!v2)
    return;
  v3 = (const void *)v2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getSecTaskCopySigningIdentifierSymbolLoc_ptr;
  v10 = getSecTaskCopySigningIdentifierSymbolLoc_ptr;
  if (!getSecTaskCopySigningIdentifierSymbolLoc_ptr)
  {
    v5 = (void *)SecurityLibrary();
    v4 = dlsym(v5, "SecTaskCopySigningIdentifier");
    v8[3] = (uint64_t)v4;
    getSecTaskCopySigningIdentifierSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
LABEL_12:
    dlerror();
    abort_report_np();
    SecurityLibrary();
    return;
  }
  v6 = (void *)((uint64_t (*)(const void *, _QWORD))v4)(v3, 0);
  if (v6)
    _tiShouldSkipMCObservation__result = objc_msgSend(CFSTR("com.apple.checkpointd"), "isEqualToString:", v6);
  CFRelease(v3);

}

uint64_t SecurityLibrary()
{
  uint64_t v0;
  void *v2;

  if (SecurityLibraryCore_frameworkLibrary)
    return SecurityLibraryCore_frameworkLibrary;
  SecurityLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SecurityLibraryCore_frameworkLibrary;
  if (!SecurityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id TIFeatureUsageAllowedValues()
{
  _QWORD v1[13];

  v1[12] = *MEMORY[0x1E0C80C00];
  v1[0] = kFeatureUsageStateInsufficientData;
  v1[1] = kFeatureUsageStateUnknown;
  v1[2] = kFeatureUsageStateUnsupported;
  v1[3] = kFeatureUsageStateUnaware;
  v1[4] = kFeatureUsageStateInactive;
  v1[5] = kFeatureUsageStateActiveVeryLow;
  v1[6] = kFeatureUsageStateActiveLow;
  v1[7] = kFeatureUsageStateActiveMedium;
  v1[8] = kFeatureUsageStateActiveHigh;
  v1[9] = kFeatureUsageStateActiveVeryHigh;
  v1[10] = kFeatureUsageStateActiveUnusuallyHigh;
  v1[11] = kFeatureUsageStateRejected;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

id TIStatisticGetKeyForInputMode(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  TISGetSafeInputModeIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    _GetPrefixForDomain();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@.%@"), v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v7, v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    TIStatisticGetKey(v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id TIStatisticGetKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  _GetPrefixForDomain();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingFormat:", CFSTR(".%@"), v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v3, v1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *_GetPrefixForDomain()
{
  if (_GetPlatformAddition_onceToken != -1)
    dispatch_once(&_GetPlatformAddition_onceToken, &__block_literal_global_43);
  return CFSTR("com.apple.keyboard");
}

__CFString *TISGetSafeInputModeIdentifier(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  __CFString *v15;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier;
    if (!TISGetSafeInputModeIdentifier___identifierToSafeIdentifier)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v4 = (void *)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier;
      TISGetSafeInputModeIdentifier___identifierToSafeIdentifier = (uint64_t)v3;

      v2 = (void *)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier;
    }
    objc_msgSend(v2, "objectForKey:", v1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
      goto LABEL_13;
    TIInputModeGetLanguageWithRegion(v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _GetStringByReplacingInvalidCharactersWithUnderscores(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    TIInputModeGetComponentsFromIdentifier(v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("sw"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _GetStringByReplacingInvalidCharactersWithUnderscores(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", CFSTR("hw"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _GetStringByReplacingInvalidCharactersWithUnderscores(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
      goto LABEL_11;
    if (objc_msgSend(v10, "length"))
    {
      if (!objc_msgSend(v12, "length"))
      {
        v13 = v10;

        v12 = v13;
      }
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@.%@"), v10, v12);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)TISGetSafeInputModeIdentifier___identifierToSafeIdentifier, "setObject:forKey:", v5, v1);
      v14 = 1;
    }
    else
    {
LABEL_11:
      v5 = 0;
      v14 = 0;
    }

    if (v14)
    {
LABEL_13:
      v5 = v5;
      v15 = v5;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = &stru_1E243B990;
  }

  return v15;
}

void __kace_get_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "KeyboardSignpostsEphemeral");
  v1 = (void *)kace_get_log_log;
  kace_get_log_log = (uint64_t)v0;

}

void __is_kbd_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  TIStatisticChangeCache *v7;
  SEL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  SecurityLibrary_10844();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v0 = getSecTaskCreateFromSelfSymbolLoc_ptr_10845;
  v12 = getSecTaskCreateFromSelfSymbolLoc_ptr_10845;
  if (!getSecTaskCreateFromSelfSymbolLoc_ptr_10845)
  {
    v1 = (void *)SecurityLibrary_10844();
    v0 = dlsym(v1, "SecTaskCreateFromSelf");
    v10[3] = (uint64_t)v0;
    getSecTaskCreateFromSelfSymbolLoc_ptr_10845 = v0;
  }
  _Block_object_dispose(&v9, 8);
  if (!v0)
    goto LABEL_12;
  v2 = ((uint64_t (*)(_QWORD))v0)(0);
  if (!v2)
    return;
  v3 = (const void *)v2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = getSecTaskCopySigningIdentifierSymbolLoc_ptr_10848;
  v12 = getSecTaskCopySigningIdentifierSymbolLoc_ptr_10848;
  if (!getSecTaskCopySigningIdentifierSymbolLoc_ptr_10848)
  {
    v5 = (void *)SecurityLibrary_10844();
    v4 = dlsym(v5, "SecTaskCopySigningIdentifier");
    v10[3] = (uint64_t)v4;
    getSecTaskCopySigningIdentifierSymbolLoc_ptr_10848 = v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
LABEL_12:
    dlerror();
    v7 = (TIStatisticChangeCache *)abort_report_np();
    -[TIStatisticChangeCache flush](v7, v8);
    return;
  }
  v6 = (void *)((uint64_t (*)(const void *, _QWORD))v4)(v3, 0);
  if (v6)
    is_kbd__result = objc_msgSend(CFSTR("com.apple.kbd"), "isEqualToString:", v6);
  CFRelease(v3);

}

void routeCounterChangeThroughCoreAnalytics(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "counterName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    IXADefaultLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "counterName");
        v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%s TIStatistic Counter: %s=%lld"), "routeCounterChangeThroughCoreAnalytics", objc_msgSend(v12, "UTF8String"), a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIStatisticChangeCache sharedInstance](TIStatisticChangeCache, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "counterName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "inputMode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addValue:toStatisticWithName:andInputMode:", a2, v9, v10);

    }
    else
    {
      if (v7)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "counterName");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v14, "stringWithFormat:", CFSTR("%s TIStatistic Adhoc: %s=%lld"), "routeCounterChangeThroughCoreAnalytics", objc_msgSend(v15, "UTF8String"), a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v16;
        _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIAdhocEventDispatcher sharedInstance](TIAdhocEventDispatcher, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "counterName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dispatchEventForStatisticWithName:andValue:", v9, a2);
    }

  }
}

id adhocEventConfig()
{
  void *v0;
  void *v1;
  _QWORD v3[13];
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("thirdPartyKeyboards");
  v3[0] = CFSTR("summonedSystemKeyboard");
  v3[1] = CFSTR("3PK.summonedKeyboard");
  v3[2] = CFSTR("3PK.switchedToFromSystem");
  v3[3] = CFSTR("3PK.switchedBackToSystem");
  v3[4] = CFSTR("3PK.crashed");
  v3[5] = CFSTR("3PK.primaryLanguageChanged");
  v3[6] = CFSTR("3PK.installedOnDevice");
  v3[7] = CFSTR("3PK.enabledOnDevice");
  v3[8] = CFSTR("3PK.asciiCapableOnDevice");
  v3[9] = CFSTR("3PK.requestedOpenAccess");
  v3[10] = CFSTR("3PK.grantedOpenAccess");
  v3[11] = CFSTR("3PK.usesSettings");
  v3[12] = CFSTR("3PK.containedInApp");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 13);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void ___ZL12_block_countv_block_invoke()
{
  atomic_store(0, &_block_count(void)::count);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id __TIKeyEquivalentMirroringCandidatesMap()
{
  if (__TIKeyEquivalentMirroringCandidatesMap___onceToken != -1)
    dispatch_once(&__TIKeyEquivalentMirroringCandidatesMap___onceToken, &__block_literal_global_256);
  return (id)__TIKeyEquivalentMirroringCandidatesMap___keyEquivalentMirroringCandidatesMap;
}

BOOL TICharIsCJScript()
{
  return uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript() != 0;
}

BOOL TICharIsAlphaNumeric(UTF32Char a1)
{
  const __CFCharacterSet *Predefined;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharIsDevanagariPUA(UTF32Char theChar)
{
  if (TICharIsDevanagariPUA___onceToken != -1)
    dispatch_once(&TICharIsDevanagariPUA___onceToken, &__block_literal_global);
  return CFCharacterSetIsLongCharacterMember((CFCharacterSetRef)TICharIsDevanagariPUA___devanagariPUACharacterSet, theChar) != 0;
}

BOOL TICharIsDelete(int a1)
{
  return a1 == 127 || a1 == 8;
}

BOOL TICharIsEAWidth(UChar32 a1)
{
  return u_getIntPropertyValue(a1, UCHAR_EAST_ASIAN_WIDTH) == 3;
}

BOOL TICharIsEAFullwidthOrWide(UChar32 a1)
{
  int32_t IntPropertyValue;

  IntPropertyValue = u_getIntPropertyValue(a1, UCHAR_EAST_ASIAN_WIDTH);
  return IntPropertyValue == 3 || IntPropertyValue == 5;
}

BOOL TICharIsIdeographic(UChar32 a1)
{
  return u_hasBinaryProperty(a1, UCHAR_IDEOGRAPHIC) != 0;
}

BOOL TICharIsSpace(UTF32Char a1)
{
  const __CFCharacterSet *Predefined;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharIsSpaceOrReturn(UTF32Char a1)
{
  const __CFCharacterSet *Predefined;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharIsNewlineOrReturn(int a1)
{
  return a1 == 13 || a1 == 10;
}

BOOL TICharIsNumber(UTF32Char a1)
{
  const __CFCharacterSet *Predefined;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

uint64_t TICharIsNumberDelimiter(unsigned int a1)
{
  return (a1 < 0x3F) & (0x7400FE0000000000uLL >> a1);
}

BOOL TICharIsNumberModifier(int a1)
{
  return a1 == 35 || (a1 & 0xFFFFFFFE) == 36;
}

BOOL TICharIsDelimitingNumber(unsigned int a1, UTF32Char a2)
{
  _BOOL8 result;
  const __CFCharacterSet *Predefined;

  result = 0;
  if (a1 <= 0x3E && ((1 << a1) & 0x7400FE0000000000) != 0)
  {
    Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
    return CFCharacterSetIsLongCharacterMember(Predefined, a2) != 0;
  }
  return result;
}

uint64_t TICharIsLeftAssociative(unsigned int a1)
{
  return (a1 < 0x40) & (0x8000400200000000 >> a1);
}

BOOL TICharIsPunctuation(UTF32Char a1)
{
  const __CFCharacterSet *Predefined;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  return CFCharacterSetIsLongCharacterMember(Predefined, a1) != 0;
}

BOOL TICharEstablishesContextForDoubleSpacePeriod(UTF32Char a1)
{
  const __CFCharacterSet *Predefined;
  _BOOL8 result;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  if (CFCharacterSetIsLongCharacterMember(Predefined, a1))
    return 0;
  if (a1 > 0x3F)
    return a1 - 12289 >= 2 && a1 != 2404;
  result = 0;
  if (((1 << a1) & 0x8C00700200000001) == 0)
    return a1 - 12289 >= 2 && a1 != 2404;
  return result;
}

uint64_t ContactsLibrary()
{
  uint64_t v0;
  void *v2;

  if (ContactsLibraryCore_frameworkLibrary)
    return ContactsLibraryCore_frameworkLibrary;
  ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ContactsLibraryCore_frameworkLibrary;
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getSTKStickerUsageManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getSTKStickerUsageManagerClass_softClass;
  v7 = getSTKStickerUsageManagerClass_softClass;
  if (!getSTKStickerUsageManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSTKStickerUsageManagerClass_block_invoke;
    v3[3] = &unk_1E243AE68;
    v3[4] = &v4;
    __getSTKStickerUsageManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

Class __getSTKStickerUsageManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!StickersLibraryCore_frameworkLibrary)
    StickersLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("STKStickerUsageManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerUsageManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy__233(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__234(uint64_t a1)
{

}

uint64_t IXA_IS_INTERNAL_INSTALL()
{
  if (IXA_IS_INTERNAL_INSTALL_once_token != -1)
    dispatch_once(&IXA_IS_INTERNAL_INSTALL_once_token, &__block_literal_global_250);
  return IXA_IS_INTERNAL_INSTALL_is_internal_install;
}

id IXASessionEventsLogFacility()
{
  if (IXASessionEventsLogFacility_onceToken != -1)
    dispatch_once(&IXASessionEventsLogFacility_onceToken, &__block_literal_global_10);
  return (id)IXASessionEventsLogFacility_logFacility;
}

id IXASessionDetailsLogFacility()
{
  if (IXASessionDetailsLogFacility_onceToken != -1)
    dispatch_once(&IXASessionDetailsLogFacility_onceToken, &__block_literal_global_12);
  return (id)IXASessionDetailsLogFacility_logFacility;
}

id IXASessionAlignmentLogFacility()
{
  if (IXASessionAlignmentLogFacility_onceToken != -1)
    dispatch_once(&IXASessionAlignmentLogFacility_onceToken, &__block_literal_global_14);
  return (id)IXASessionAlignmentLogFacility_logFacility;
}

id IXARevisionRateLogFacility()
{
  if (IXARevisionRateLogFacility_onceToken != -1)
    dispatch_once(&IXARevisionRateLogFacility_onceToken, &__block_literal_global_16);
  return (id)IXARevisionRateLogFacility_logFacility;
}

id IXATypingEffortLogFacility()
{
  if (IXATypingEffortLogFacility_onceToken != -1)
    dispatch_once(&IXATypingEffortLogFacility_onceToken, &__block_literal_global_18);
  return (id)IXATypingEffortLogFacility_logFacility;
}

id IXAFeedbackLogFacility()
{
  if (IXAFeedbackLogFacility_onceToken != -1)
    dispatch_once(&IXAFeedbackLogFacility_onceToken, &__block_literal_global_20);
  return (id)IXAFeedbackLogFacility_logFacility;
}

id IXAAdhocTestingLogFacility()
{
  if (IXAAdhocTestingLogFacility_onceToken != -1)
    dispatch_once(&IXAAdhocTestingLogFacility_onceToken, &__block_literal_global_22);
  return (id)IXAAdhocTestingLogFacility_logFacility;
}

uint64_t acute_accent_form(int a1)
{
  int v1;
  uint64_t result;

  if (a1 > 912)
  {
    if (a1 <= 944)
    {
      if (a1 > 926)
      {
        switch(a1)
        {
          case 927:
            return 908;
          case 933:
            return 910;
          case 937:
            return 911;
          default:
            return 0;
        }
      }
      else
      {
        switch(a1)
        {
          case 913:
            result = 902;
            break;
          case 917:
            result = 904;
            break;
          case 919:
            result = 905;
            break;
          case 921:
            result = 906;
            break;
          default:
            return 0;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 945:
          result = 940;
          break;
        case 946:
        case 947:
        case 948:
        case 950:
        case 952:
          return 0;
        case 949:
          result = 941;
          break;
        case 951:
          result = 942;
          break;
        case 953:
          result = 943;
          break;
        default:
          switch(a1)
          {
            case 965:
              result = 973;
              break;
            case 966:
            case 967:
            case 968:
              return 0;
            case 969:
              result = 974;
              break;
            case 970:
              result = 912;
              break;
            case 971:
              result = 944;
              break;
            default:
              if (a1 != 959)
                return 0;
              result = 972;
              break;
          }
          break;
      }
    }
  }
  else
  {
    v1 = a1 - 65;
    result = 193;
    switch(v1)
    {
      case 0:
        return result;
      case 2:
        result = 262;
        break;
      case 4:
        result = 201;
        break;
      case 8:
        result = 205;
        break;
      case 11:
        result = 313;
        break;
      case 13:
        result = 323;
        break;
      case 14:
        result = 211;
        break;
      case 17:
        result = 340;
        break;
      case 18:
        result = 346;
        break;
      case 20:
        result = 218;
        break;
      case 24:
        result = 221;
        break;
      case 25:
        result = 377;
        break;
      case 32:
        result = 225;
        break;
      case 34:
        result = 263;
        break;
      case 36:
        result = 233;
        break;
      case 40:
        result = 237;
        break;
      case 43:
        result = 314;
        break;
      case 45:
        result = 324;
        break;
      case 46:
        result = 243;
        break;
      case 49:
        result = 341;
        break;
      case 50:
        result = 347;
        break;
      case 52:
        result = 250;
        break;
      case 56:
        result = 253;
        break;
      case 57:
        result = 378;
        break;
      default:
        return 0;
    }
  }
  return result;
}

uint64_t grave_accent_form(int a1)
{
  if (a1 > 96)
  {
    if (a1 <= 104)
    {
      if (a1 == 97)
        return 224;
      if (a1 == 101)
        return 232;
    }
    else
    {
      switch(a1)
      {
        case 'i':
          return 236;
        case 'o':
          return 242;
        case 'u':
          return 249;
      }
    }
  }
  else if (a1 <= 72)
  {
    if (a1 == 65)
      return 192;
    if (a1 == 69)
      return 200;
  }
  else
  {
    switch(a1)
    {
      case 'I':
        return 204;
      case 'O':
        return 210;
      case 'U':
        return 217;
    }
  }
  return 0;
}

uint64_t circumflex_form(int a1)
{
  if (a1 > 96)
  {
    if (a1 <= 104)
    {
      if (a1 == 97)
        return 226;
      if (a1 == 101)
        return 234;
    }
    else
    {
      switch(a1)
      {
        case 'i':
          return 238;
        case 'o':
          return 244;
        case 'u':
          return 251;
      }
    }
  }
  else if (a1 <= 72)
  {
    if (a1 == 65)
      return 194;
    if (a1 == 69)
      return 202;
  }
  else
  {
    switch(a1)
    {
      case 'I':
        return 206;
      case 'O':
        return 212;
      case 'U':
        return 219;
    }
  }
  return 0;
}

uint64_t diaeresis_form(int a1)
{
  if (a1 > 104)
  {
    if (a1 > 920)
    {
      if (a1 > 952)
      {
        if (a1 == 953)
          return 970;
        if (a1 == 965)
          return 971;
      }
      else
      {
        if (a1 == 921)
          return 938;
        if (a1 == 933)
          return 939;
      }
    }
    else if (a1 > 116)
    {
      if (a1 == 117)
        return 252;
      if (a1 == 121)
        return 255;
    }
    else
    {
      if (a1 == 105)
        return 239;
      if (a1 == 111)
        return 246;
    }
  }
  else if (a1 > 84)
  {
    if (a1 > 96)
    {
      if (a1 == 97)
        return 228;
      if (a1 == 101)
        return 235;
    }
    else
    {
      if (a1 == 85)
        return 220;
      if (a1 == 89)
        return 376;
    }
  }
  else if (a1 > 72)
  {
    if (a1 == 73)
      return 207;
    if (a1 == 79)
      return 214;
  }
  else
  {
    if (a1 == 65)
      return 196;
    if (a1 == 69)
      return 203;
  }
  return 0;
}

uint64_t dialytika_tonos_form(int a1)
{
  unsigned int v1;

  if (a1 == 965)
    v1 = 944;
  else
    v1 = 0;
  if (a1 == 953)
    return 912;
  else
    return v1;
}

uint64_t caron_form(int a1)
{
  if ((a1 - 65) > 0x39)
    return 0;
  else
    return dword_18C5E7420[a1 - 65];
}

uint64_t ring_above_form(uint64_t result)
{
  if ((int)result > 116)
  {
    switch((_DWORD)result)
    {
      case 'u':
        return 367;
      case 'w':
        return 7832;
      case 'y':
        return 7833;
    }
  }
  else
  {
    switch((_DWORD)result)
    {
      case 'A':
        return 197;
      case 'U':
        return 366;
      case 'a':
        return 229;
    }
  }
  return result;
}

uint64_t small_tilde_form(uint64_t result)
{
  if ((int)result > 96)
  {
    if ((int)result <= 109)
    {
      if ((_DWORD)result == 97)
      {
        return 227;
      }
      else if ((_DWORD)result == 105)
      {
        return 297;
      }
    }
    else
    {
      switch((_DWORD)result)
      {
        case 'u':
          return 361;
        case 'o':
          return 245;
        case 'n':
          return 241;
      }
    }
  }
  else if ((int)result <= 77)
  {
    if ((_DWORD)result == 65)
    {
      return 195;
    }
    else if ((_DWORD)result == 73)
    {
      return 296;
    }
  }
  else
  {
    switch((_DWORD)result)
    {
      case 'N':
        return 209;
      case 'O':
        return 213;
      case 'U':
        return 360;
    }
  }
  return result;
}

uint64_t combines_with_selective_modifier(uint64_t a1, int a2)
{
  uint64_t result;
  unsigned int v4;
  BOOL v5;
  unint64_t v6;
  int v7;
  _BOOL4 v9;

  result = 0;
  if (a2 <= 709)
  {
    switch(a2)
    {
      case 168:
LABEL_20:
        v7 = circumflex_form(a1);
        break;
      case 175:
        v7 = macron_form(a1);
        break;
      case 180:
LABEL_9:
        v7 = acute_accent_form(a1);
        break;
      default:
        return result;
    }
    return v7 != 0;
  }
  else
  {
    switch(a2)
    {
      case 710:
        goto LABEL_20;
      case 711:
        v4 = a1 - 65;
        v5 = v4 > 0x39;
        v6 = (0x21E691D021E691DuLL >> v4) & 1;
        if (v5)
          return 0;
        else
          return v6;
      case 712:
      case 713:
        return result;
      case 714:
        goto LABEL_9;
      case 715:
        v7 = grave_accent_form(a1);
        return v7 != 0;
      default:
        if (a2 == 732)
        {
          v7 = small_tilde_form(a1);
          return v7 != 0;
        }
        v9 = (_DWORD)a1 == 953 || (_DWORD)a1 == 965;
        result = a2 == 901 && v9;
        break;
    }
  }
  return result;
}

uint64_t macron_form(int a1)
{
  if (a1 > 96)
  {
    if (a1 <= 104)
    {
      if (a1 == 97)
        return 257;
      if (a1 == 101)
        return 275;
    }
    else
    {
      switch(a1)
      {
        case 'i':
          return 299;
        case 'o':
          return 333;
        case 'u':
          return 363;
      }
    }
  }
  else if (a1 <= 72)
  {
    if (a1 == 65)
      return 256;
    if (a1 == 69)
      return 274;
  }
  else
  {
    switch(a1)
    {
      case 'I':
        return 298;
      case 'O':
        return 332;
      case 'U':
        return 362;
    }
  }
  return 0;
}

uint64_t strip_acute_accent(uint64_t result)
{
  if ((int)result <= 339)
  {
    if ((int)result > 242)
    {
      if ((int)result <= 262)
      {
        if ((int)result > 252)
        {
          if ((_DWORD)result == 253)
          {
            return 121;
          }
          else if ((_DWORD)result == 262)
          {
            return 67;
          }
        }
        else if ((_DWORD)result == 243)
        {
          return 111;
        }
        else if ((_DWORD)result == 250)
        {
          return 117;
        }
      }
      else if ((int)result <= 313)
      {
        if ((_DWORD)result == 263)
        {
          return 99;
        }
        else if ((_DWORD)result == 313)
        {
          return 76;
        }
      }
      else
      {
        switch((_DWORD)result)
        {
          case 0x13A:
            return 108;
          case 0x143:
            return 78;
          case 0x144:
            return 110;
        }
      }
    }
    else if ((int)result <= 217)
    {
      if ((int)result > 204)
      {
        if ((_DWORD)result == 205)
        {
          return 73;
        }
        else if ((_DWORD)result == 211)
        {
          return 79;
        }
      }
      else if ((_DWORD)result == 193)
      {
        return 65;
      }
      else if ((_DWORD)result == 201)
      {
        return 69;
      }
    }
    else if ((int)result <= 224)
    {
      if ((_DWORD)result == 218)
      {
        return 85;
      }
      else if ((_DWORD)result == 221)
      {
        return 89;
      }
    }
    else
    {
      switch((_DWORD)result)
      {
        case 0xE1:
          return 97;
        case 0xE9:
          return 101;
        case 0xED:
          return 105;
      }
    }
  }
  else if ((int)result > 939)
  {
    if ((int)result > 971)
    {
      switch((_DWORD)result)
      {
        case 0x3CC:
          return 959;
        case 0x3CD:
          return 965;
        case 0x3CE:
          return 969;
      }
    }
    else
    {
      switch((int)result)
      {
        case 940:
          result = 945;
          break;
        case 941:
          result = 949;
          break;
        case 942:
          result = 951;
          break;
        case 943:
          result = 953;
          break;
        default:
          return result;
      }
    }
  }
  else if ((int)result <= 901)
  {
    switch((int)result)
    {
      case 340:
        result = 82;
        break;
      case 341:
        result = 114;
        break;
      case 342:
      case 343:
      case 344:
      case 345:
        return result;
      case 346:
        result = 83;
        break;
      case 347:
        result = 115;
        break;
      default:
        if ((_DWORD)result == 377)
        {
          result = 90;
        }
        else if ((_DWORD)result == 378)
        {
          result = 122;
        }
        break;
    }
  }
  else
  {
    switch((int)result)
    {
      case 902:
        result = 913;
        break;
      case 904:
        result = 917;
        break;
      case 905:
        result = 919;
        break;
      case 906:
        result = 921;
        break;
      case 908:
        result = 927;
        break;
      case 910:
        result = 933;
        break;
      case 911:
        result = 937;
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t strip_greek_accent(uint64_t a1, int *a2)
{
  int v3;
  uint64_t result;
  int v5;

  v3 = a1 - 902;
  result = 913;
  v5 = 180;
  switch(v3)
  {
    case 0:
      break;
    case 1:
    case 5:
    case 7:
LABEL_8:
      v5 = 0;
      result = a1;
      break;
    case 2:
      result = 917;
      break;
    case 3:
      result = 919;
      break;
    case 4:
      result = 921;
      break;
    case 6:
      result = 927;
      break;
    case 8:
      result = 933;
      break;
    case 9:
      result = 937;
      break;
    case 10:
      result = 953;
LABEL_21:
      v5 = 901;
      break;
    default:
      switch((int)a1)
      {
        case 938:
          result = 921;
          goto LABEL_23;
        case 939:
          result = 933;
LABEL_23:
          v5 = 168;
          goto LABEL_28;
        case 940:
          result = 945;
          goto LABEL_27;
        case 941:
          result = 949;
          goto LABEL_27;
        case 942:
          result = 951;
          goto LABEL_27;
        case 943:
          result = 953;
LABEL_27:
          v5 = 180;
          goto LABEL_28;
        case 944:
          result = 965;
          goto LABEL_21;
        default:
          switch((int)a1)
          {
            case 970:
              result = 953;
              goto LABEL_23;
            case 971:
              result = 965;
              goto LABEL_23;
            case 972:
              result = 959;
              goto LABEL_27;
            case 973:
              result = 965;
              goto LABEL_27;
            case 974:
              result = 969;
              goto LABEL_27;
            default:
              goto LABEL_8;
          }
      }
  }
LABEL_28:
  *a2 = v5;
  return result;
}

uint64_t strip_caron(uint64_t result)
{
  int v1;

  if ((int)result <= 343)
  {
    if ((int)result > 282)
    {
      if ((int)result <= 317)
      {
        if ((_DWORD)result == 283)
        {
          return 101;
        }
        else if ((_DWORD)result == 317)
        {
          return 76;
        }
      }
      else
      {
        switch((_DWORD)result)
        {
          case 0x13E:
            return 108;
          case 0x147:
            return 78;
          case 0x148:
            return 110;
        }
      }
    }
    else
    {
      v1 = result - 268;
      result = 67;
      switch(v1)
      {
        case 1:
          result = 99;
          break;
        case 2:
          result = 68;
          break;
        case 3:
          result = 100;
          break;
        default:
          return result;
      }
    }
  }
  else if ((int)result > 460)
  {
    switch((int)result)
    {
      case 461:
        result = 65;
        break;
      case 462:
        result = 97;
        break;
      case 463:
        result = 73;
        break;
      case 464:
        result = 105;
        break;
      case 465:
        result = 79;
        break;
      case 466:
        result = 111;
        break;
      case 467:
        result = 85;
        break;
      case 468:
        result = 117;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch((int)result)
    {
      case 344:
        result = 82;
        break;
      case 345:
        result = 114;
        break;
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 354:
      case 355:
        return result;
      case 352:
        result = 83;
        break;
      case 353:
        result = 115;
        break;
      case 356:
        result = 84;
        break;
      case 357:
        result = 116;
        break;
      default:
        if ((_DWORD)result == 381)
        {
          result = 90;
        }
        else if ((_DWORD)result == 382)
        {
          result = 122;
        }
        break;
    }
  }
  return result;
}

uint64_t strip_circumflex(uint64_t result)
{
  if ((int)result > 225)
  {
    if ((int)result <= 237)
    {
      if ((_DWORD)result == 226)
      {
        return 97;
      }
      else if ((_DWORD)result == 234)
      {
        return 101;
      }
    }
    else
    {
      switch((_DWORD)result)
      {
        case 0xEE:
          return 105;
        case 0xF4:
          return 111;
        case 0xFB:
          return 117;
      }
    }
  }
  else if ((int)result <= 205)
  {
    if ((_DWORD)result == 194)
    {
      return 65;
    }
    else if ((_DWORD)result == 202)
    {
      return 69;
    }
  }
  else
  {
    switch((_DWORD)result)
    {
      case 0xCE:
        return 73;
      case 0xD4:
        return 79;
      case 0xDB:
        return 85;
    }
  }
  return result;
}

uint64_t strip_diaeresis(int a1)
{
  if (a1 > 245)
  {
    if (a1 > 937)
    {
      if (a1 > 969)
      {
        if (a1 == 970)
          return 953;
        if (a1 == 971)
          return 965;
      }
      else
      {
        if (a1 == 938)
          return 921;
        if (a1 == 939)
          return 933;
      }
    }
    else if (a1 > 254)
    {
      if (a1 == 255)
        return 121;
      if (a1 == 376)
        return 89;
    }
    else
    {
      if (a1 == 246)
        return 111;
      if (a1 == 252)
        return 117;
    }
  }
  else if (a1 > 219)
  {
    if (a1 > 234)
    {
      if (a1 == 235)
        return 101;
      if (a1 == 239)
        return 105;
    }
    else
    {
      if (a1 == 220)
        return 85;
      if (a1 == 228)
        return 97;
    }
  }
  else if (a1 > 206)
  {
    if (a1 == 207)
      return 73;
    if (a1 == 214)
      return 79;
  }
  else
  {
    if (a1 == 196)
      return 65;
    if (a1 == 203)
      return 69;
  }
  return 0;
}

uint64_t strip_dialytika_tonos(int a1)
{
  unsigned int v1;

  if (a1 == 944)
    v1 = 965;
  else
    v1 = 0;
  if (a1 == 912)
    return 953;
  else
    return v1;
}

uint64_t strip_grave_accent(uint64_t result)
{
  if ((int)result > 223)
  {
    if ((int)result <= 235)
    {
      if ((_DWORD)result == 224)
      {
        return 97;
      }
      else if ((_DWORD)result == 232)
      {
        return 101;
      }
    }
    else
    {
      switch((_DWORD)result)
      {
        case 0xEC:
          return 105;
        case 0xF2:
          return 111;
        case 0xF9:
          return 117;
      }
    }
  }
  else if ((int)result <= 203)
  {
    if ((_DWORD)result == 192)
    {
      return 65;
    }
    else if ((_DWORD)result == 200)
    {
      return 69;
    }
  }
  else
  {
    switch((_DWORD)result)
    {
      case 0xCC:
        return 73;
      case 0xD2:
        return 79;
      case 0xD9:
        return 85;
    }
  }
  return result;
}

uint64_t strip_macron(uint64_t result)
{
  if ((int)result > 298)
  {
    if ((int)result <= 332)
    {
      if ((_DWORD)result == 299)
      {
        return 105;
      }
      else if ((_DWORD)result == 332)
      {
        return 79;
      }
    }
    else
    {
      switch((_DWORD)result)
      {
        case 0x14D:
          return 111;
        case 0x16A:
          return 85;
        case 0x16B:
          return 117;
      }
    }
  }
  else if ((int)result <= 273)
  {
    if ((_DWORD)result == 256)
    {
      return 65;
    }
    else if ((_DWORD)result == 257)
    {
      return 97;
    }
  }
  else
  {
    switch((_DWORD)result)
    {
      case 0x112:
        return 69;
      case 0x113:
        return 101;
      case 0x12A:
        return 73;
    }
  }
  return result;
}

uint64_t strip_ring_above(uint64_t result)
{
  if ((int)result > 366)
  {
    switch((_DWORD)result)
    {
      case 0x16F:
        return 117;
      case 0x1E98:
        return 119;
      case 0x1E99:
        return 121;
    }
  }
  else
  {
    switch((_DWORD)result)
    {
      case 0xC5:
        return 65;
      case 0xE5:
        return 97;
      case 0x16E:
        return 85;
    }
  }
  return result;
}

uint64_t strip_small_tilde(uint64_t result)
{
  if ((int)result > 244)
  {
    if ((int)result <= 296)
    {
      if ((_DWORD)result == 245)
      {
        return 111;
      }
      else if ((_DWORD)result == 296)
      {
        return 73;
      }
    }
    else
    {
      switch((_DWORD)result)
      {
        case 0x129:
          return 105;
        case 0x168:
          return 85;
        case 0x169:
          return 117;
      }
    }
  }
  else if ((int)result <= 212)
  {
    if ((_DWORD)result == 195)
    {
      return 65;
    }
    else if ((_DWORD)result == 209)
    {
      return 78;
    }
  }
  else
  {
    switch((_DWORD)result)
    {
      case 0xD5:
        return 79;
      case 0xE3:
        return 97;
      case 0xF1:
        return 110;
    }
  }
  return result;
}

uint64_t combine_with_accent(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;

  v2 = result;
  LODWORD(result) = 0;
  if (a2 > 729)
  {
    if (a2 <= 899)
    {
      if (a2 == 730)
      {
        LODWORD(result) = ring_above_form(v2);
      }
      else if (a2 == 732)
      {
        LODWORD(result) = small_tilde_form(v2);
      }
      goto LABEL_29;
    }
    if (a2 == 901)
    {
      if ((_DWORD)v2 == 965)
        v3 = 944;
      else
        v3 = 0;
      if ((_DWORD)v2 == 953)
        LODWORD(result) = 912;
      else
        LODWORD(result) = v3;
      goto LABEL_29;
    }
    if (a2 != 900)
      goto LABEL_29;
LABEL_15:
    LODWORD(result) = acute_accent_form(v2);
    goto LABEL_29;
  }
  if (a2 > 709)
  {
    switch(a2)
    {
      case 710:
        LODWORD(result) = circumflex_form(v2);
        break;
      case 711:
        if ((v2 - 65) > 0x39)
          LODWORD(result) = 0;
        else
          LODWORD(result) = dword_18C5E7420[(v2 - 65)];
        break;
      case 714:
        goto LABEL_15;
      case 715:
        LODWORD(result) = grave_accent_form(v2);
        break;
      default:
        goto LABEL_29;
    }
    goto LABEL_29;
  }
  switch(a2)
  {
    case 168:
      LODWORD(result) = diaeresis_form(v2);
      break;
    case 175:
      LODWORD(result) = macron_form(v2);
      break;
    case 180:
      goto LABEL_15;
  }
LABEL_29:
  if ((_DWORD)result == (_DWORD)v2 || (_DWORD)result == 0)
    return 0;
  else
    return result;
}

uint64_t strip_accent(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;

  v2 = result;
  LODWORD(result) = 0;
  if (a2 > 729)
  {
    if (a2 <= 899)
    {
      if (a2 == 730)
      {
        LODWORD(result) = strip_ring_above(v2);
      }
      else if (a2 == 732)
      {
        LODWORD(result) = strip_small_tilde(v2);
      }
      goto LABEL_27;
    }
    if (a2 == 901)
    {
      if ((_DWORD)v2 == 944)
        v3 = 965;
      else
        v3 = 0;
      if ((_DWORD)v2 == 912)
        LODWORD(result) = 953;
      else
        LODWORD(result) = v3;
      goto LABEL_27;
    }
    if (a2 != 900)
      goto LABEL_27;
LABEL_15:
    LODWORD(result) = strip_acute_accent(v2);
    goto LABEL_27;
  }
  if (a2 > 709)
  {
    switch(a2)
    {
      case 710:
        LODWORD(result) = strip_circumflex(v2);
        break;
      case 711:
        LODWORD(result) = strip_caron(v2);
        break;
      case 714:
        goto LABEL_15;
      case 715:
        LODWORD(result) = strip_grave_accent(v2);
        break;
      default:
        goto LABEL_27;
    }
    goto LABEL_27;
  }
  switch(a2)
  {
    case 168:
      LODWORD(result) = strip_diaeresis(v2);
      break;
    case 175:
      LODWORD(result) = strip_macron(v2);
      break;
    case 180:
      goto LABEL_15;
  }
LABEL_27:
  if ((_DWORD)result == (_DWORD)v2 || (_DWORD)result == 0)
    return 0;
  else
    return result;
}

BOOL character_is_composable_accent(int a1)
{
  _BOOL8 result;

  result = 1;
  if (((a1 - 710) > 0x16 || ((1 << (a1 + 58)) & 0x500033) == 0)
    && ((a1 - 168) > 0xC || ((1 << (a1 + 88)) & 0x1081) == 0))
  {
    return (a1 - 900) < 2;
  }
  return result;
}

BOOL character_is_tamil_script(int a1)
{
  return (a1 & 0xFFFFFF80) == 2944;
}

void ___recentLexiconDispatchQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.recents-request", v2);
  v1 = (void *)_recentLexiconDispatchQueue___xpc_queue;
  _recentLexiconDispatchQueue___xpc_queue = (uint64_t)v0;

}

uint64_t __Block_byref_object_copy__906(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__907(uint64_t a1)
{

}

void std::vector<std::vector<TIHandwritingPoint>>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::vector<TIHandwritingPoint>>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a1);
}

_QWORD *std::vector<std::vector<TIHandwritingPoint>>::__swap_out_circular_buffer(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (_QWORD *)*result;
  v2 = (_QWORD *)result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    *(_QWORD *)(v4 - 24) = 0;
    *(_QWORD *)(v4 - 16) = 0;
    v4 -= 24;
    *(_QWORD *)(v4 + 16) = 0;
    v5 = *(_OWORD *)(v2 - 3);
    v2 -= 3;
    *(_OWORD *)v4 = v5;
    *(_QWORD *)(v4 + 16) = v2[2];
    *v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
  }
  a2[1] = v4;
  v6 = (_QWORD *)*result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<std::vector<TIHandwritingPoint>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    v4 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v4)
    {
      *(_QWORD *)(v2 - 16) = v4;
      operator delete(v4);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(16 * a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

_QWORD *std::vector<TIHandwritingPoint>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](a1, v5 >> 4);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<TIHandwritingPoint>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

char **std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *,std::vector<TIHandwritingPoint> *>(char **a1, char **a2, uint64_t a3)
{
  uint64_t v3;
  char **v4;
  char **v5;
  char **v6;
  char *v7;
  char *v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char **v15;
  int64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;

  v3 = a3;
  if (a1 != a2)
  {
    v4 = a2;
    v5 = a1;
    v6 = (char **)(a3 + 8);
    while (v5 == v6 - 1)
    {
LABEL_26:
      v5 += 3;
      v3 += 24;
      v6 += 3;
      if (v5 == v4)
        return v6 - 1;
    }
    v7 = *v5;
    v8 = v5[1];
    v9 = v8 - *v5;
    v10 = v9 >> 4;
    v11 = (uint64_t)v6[1];
    v12 = *(v6 - 1);
    if (v9 >> 4 > (unint64_t)((v11 - (uint64_t)v12) >> 4))
    {
      if (v12)
      {
        *v6 = v12;
        operator delete(v12);
        v11 = 0;
        *(v6 - 1) = 0;
        *v6 = 0;
        v6[1] = 0;
      }
      if (v9 < 0)
        abort();
      v13 = v11 >> 3;
      if (v11 >> 3 <= v10)
        v13 = v9 >> 4;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
        v14 = 0xFFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      std::vector<TIHandwritingPoint>::__vallocate[abi:nn180100](v6 - 1, v14);
      v12 = *v6;
      if (v8 != v7)
        memmove(*v6, v7, v9);
      v15 = v6;
      goto LABEL_25;
    }
    v15 = (char **)(v3 + 8);
    v16 = *v6 - v12;
    v17 = v16 >> 4;
    if (v16 >> 4 >= v10)
    {
      if (v8 == v7)
      {
LABEL_24:
        v4 = a2;
LABEL_25:
        *v15 = &v12[v9];
        goto LABEL_26;
      }
      v19 = *(v6 - 1);
      v18 = *v5;
    }
    else
    {
      if (*v6 != v12)
      {
        memmove(*(v6 - 1), *v5, v16);
        v12 = *v6;
      }
      v18 = &v7[16 * v17];
      v9 = v8 - v18;
      if (v8 == v18)
        goto LABEL_24;
      v19 = v12;
    }
    memmove(v19, v18, v9);
    goto LABEL_24;
  }
  return (char **)v3;
}

id TIInputModeGetFullInputModeIdentifier(void *a1)
{
  id v1;
  void (**v2)(_QWORD);
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v1 = a1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1806;
  v12 = __Block_byref_object_dispose__1807;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __TIInputModeGetFullInputModeIdentifier_block_invoke;
  v7[3] = &unk_1E243AE68;
  v7[4] = &v8;
  v2 = (void (**)(_QWORD))MEMORY[0x18D783768](v7);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v2[2](v2);
  else
    TIDispatchSync(MEMORY[0x1E0C80D38], v2);
  TIInputModeGetMultilingualID(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(v1, (void *)v9[5], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)objc_msgSend(v1, "copy");
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __Block_byref_object_copy__1806(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1807(uint64_t a1)
{

}

id TIInputModeGetMultilingualID(void *a1)
{
  void *v1;
  void *v2;

  TIInputModeGetComponentsFromIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("ml"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
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
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TIInputModeGetMultilingualID(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v52 = v5;
    if (v5)
    {
      v9 = v5;
    }
    else
    {
      +[TIInputModeController sharedInputModeController](TIInputModeController, "sharedInputModeController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "enabledInputModeIdentifiers");
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v71 = "TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages";
      v72 = 2112;
      v73 = v9;
      _os_log_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  enabledInputModeIdentifiers = %@", buf, 0x16u);
    }
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v61 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          TIInputModeGetMultilingualID(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "isEqualToString:", v17))
            objc_msgSend(v8, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v13);
    }

    v55 = v6;
    if (objc_msgSend(v6, "count"))
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v18 = v8;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v57;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v57 != v21)
              objc_enumerationMutation(v18);
            TIInputModeGetLanguage(*(void **)(*((_QWORD *)&v56 + 1) + 8 * j));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("vi"));

            if ((v24 & 1) != 0)
            {
              v8 = v18;
              goto LABEL_45;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          if (v20)
            continue;
          break;
        }
      }

      v25 = v18;
      v53 = v55;
      v26 = (void *)objc_msgSend(v25, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v28 = v25;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v65;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v65 != v31)
              objc_enumerationMutation(v28);
            TIInputModeGetLanguageWithRegion(*(void **)(*((_QWORD *)&v64 + 1) + 8 * k));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v33);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
        }
        while (v30);
      }

      if (objc_msgSend(v53, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v28, "count"));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        while (objc_msgSend(v27, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:forPreferences:", v27, v53);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_msgSend(v27, "indexOfObject:", v35);
          if (v35)
            v37 = v36 == 0x7FFFFFFFFFFFFFFFLL;
          else
            v37 = 1;
          if (v37)
          {

            break;
          }
          v38 = v36;
          objc_msgSend(v26, "objectAtIndexedSubscript:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v39);

          objc_msgSend(v27, "removeObjectAtIndex:", v38);
          objc_msgSend(v26, "removeObjectAtIndex:", v38);

        }
      }
      else
      {
        v8 = v26;
      }

LABEL_45:
      v6 = v55;
    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!TIInputModeSupportsMultilingual(v54)
        || TIInputModeIsMultilingualOnly(v54)
        || (TIInputModeGetRequiredMultilingualInputModes(v54),
            v40 = (void *)objc_claimAutoreleasedReturnValue(),
            v41 = objc_msgSend(v40, "count"),
            v40,
            v41))
      {
        v42 = objc_msgSend(v8, "count");
        if (v42)
        {
          v43 = v42;
          v44 = 0;
          while (1)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (!TIInputModeSupportsMultilingual(v45))
              goto LABEL_55;
            objc_msgSend(v8, "objectAtIndexedSubscript:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (TIInputModeIsMultilingualOnly(v46))
              break;
            objc_msgSend(v8, "objectAtIndexedSubscript:", v44);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            TIInputModeGetRequiredMultilingualInputModes(v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "count");

            if (!v49)
            {
              if (v44 != 0x7FFFFFFFFFFFFFFFLL)
              {
                objc_msgSend(v8, "objectAtIndexedSubscript:", v44);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "removeObjectAtIndex:", v44);
                objc_msgSend(v8, "insertObject:atIndex:", v51, 0);

              }
              goto LABEL_58;
            }
LABEL_57:
            if (v43 == ++v44)
              goto LABEL_58;
          }

LABEL_55:
          goto LABEL_57;
        }
      }
LABEL_58:

      v6 = v55;
    }

    v5 = v52;
  }
  else
  {
    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

BOOL TIInputModeSupportsMultilingual(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  TIInputModeGetNormalizedIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UIKeyboardSupportsMultilingual"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

BOOL TIInputModeIsMultilingualOnly(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  TIInputModeGetNormalizedIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UIKeyboardMultilingualOnly"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

id TIInputModeGetRequiredMultilingualInputModes(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  TIInputModeGetNormalizedIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UIKeyboardRequiredMultilingualInputModes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL TIISTypetoSiriMode(void *a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a1;
  TIInputModeGetBaseLanguage(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("en"))
    && ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri")) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SiriNCService")));

  return v5;
}

id TIInputModeGetNormalizedLevelsFromComponents(void *a1)
{
  uint64_t v1;
  id v2;
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
  void *v16;

  v1 = *MEMORY[0x1E0C997E8];
  v2 = a1;
  objc_msgSend(v2, "valueForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C997B0];
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C997B0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C99820]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0C99848]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", v5) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v3, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v15);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@-%@"), v3, v5, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v16);

    }
  }

  return v8;
}

id TIInputModeGetMultilingualSetFromInputModes(void *a1, void *a2)
{
  return TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(a1, a2, 0);
}

id TIGetSuggestedInputModesByLocaleForLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (TIGetSuggestedInputModesByLocaleForLanguage_once != -1)
    dispatch_once(&TIGetSuggestedInputModesByLocaleForLanguage_once, &__block_literal_global_214);
  TIInputModeGetBaseLanguage(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)TIGetSuggestedInputModesByLocaleForLanguage___suggestedLanguageInputModes, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _UIKeyboardBundleInfoWithKey(v2, CFSTR("UIKeyboardSuggestedLanguageInputModes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend((id)TIGetSuggestedInputModesByLocaleForLanguage___suggestedLanguageInputModes, "setObject:forKey:", v3, v2);
  }

  return v3;
}

id TIGetSuggestedDefaultInputModesByLocaleForLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (TIGetSuggestedDefaultInputModesByLocaleForLanguage_once != -1)
    dispatch_once(&TIGetSuggestedDefaultInputModesByLocaleForLanguage_once, &__block_literal_global_215);
  TIInputModeGetBaseLanguage(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)TIGetSuggestedDefaultInputModesByLocaleForLanguage___suggestedDefaultLanguageInputModes, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _UIKeyboardBundleInfoWithKey(v2, CFSTR("UIKeyboardSuggestedDefaultLanguageInputModes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend((id)TIGetSuggestedDefaultInputModesByLocaleForLanguage___suggestedDefaultLanguageInputModes, "setObject:forKey:", v3, v2);
  }

  return v3;
}

id TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage_once != -1)
    dispatch_once(&TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage_once, &__block_literal_global_216);
  TIInputModeGetBaseLanguage(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage___suggestedDefaultLanguageInputModesForPad, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _UIKeyboardBundleInfoWithKey(v2, CFSTR("UIKeyboardSuggestedDefaultLanguageInputModes-iPad"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend((id)TIGetSuggestedDefaultInputModesForPadByLocaleForLanguage___suggestedDefaultLanguageInputModesForPad, "setObject:forKey:", v3, v2);
  }

  return v3;
}

id TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage_once != -1)
    dispatch_once(&TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage_once, &__block_literal_global_217);
  TIInputModeGetBaseLanguage(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage___suggestedDefaultLanguageInputModesForFudge, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    _UIKeyboardBundleInfoWithKey(v2, CFSTR("UIKeyboardSuggestedDefaultLanguageInputModes-Fudge"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend((id)TIGetSuggestedDefaultInputModesForFudgeByLocaleForLanguage___suggestedDefaultLanguageInputModesForFudge, "setObject:forKey:", v3, v2);
  }

  return v3;
}

uint64_t TIGetAddKeyboardUsesPickerForInputMode(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  TIInputModeGetBaseLanguage(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKeyboardBundleInfoWithKey(v1, CFSTR("UIAddKeyboardUsesPicker"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

float TIGetAddressBookThresholdForInputMode(void *a1)
{
  void *v1;
  void *v2;
  float v3;
  float v4;

  TIInputModeGetBaseLanguage(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKeyboardBundleInfoWithKey(v1, CFSTR("KeyboardAddressBookThreshold"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

id TIGetAllInputModeProperties()
{
  if (TIGetAllInputModeProperties_once != -1)
    dispatch_once(&TIGetAllInputModeProperties_once, &__block_literal_global_222);
  return (id)__inputModeProperties;
}

id TIGetSuggestedDictationLanguagesForDeviceLanguage()
{
  void *v0;
  void *v1;
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
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (TIGetSuggestedDictationLanguagesForDeviceLanguage_once != -1)
    dispatch_once(&TIGetSuggestedDictationLanguagesForDeviceLanguage_once, &__block_literal_global_223);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.TextInput"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v0, "localizations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLocalizationsFromArray:forPreferences:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = 0;
    goto LABEL_14;
  }
  objc_msgSend((id)TIGetSuggestedDictationLanguagesForDeviceLanguage___suggestedDictationLanguageProperties, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languageCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _UIKeyboardBundleInfoWithKey(v7, CFSTR("UISuggestedDictationLanguages"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v8, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E24B0618, "arrayByAddingObjectsFromArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "preferredLocalizationsFromArray:forPreferences:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "isEqualToString:", CFSTR("zxx")) & 1) != 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      if (v14)
      {
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v15;
        goto LABEL_9;
      }
    }
LABEL_10:
    if (!objc_msgSend(v5, "count"))
    {
      v18[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v16 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v16;
    }
    objc_msgSend((id)TIGetSuggestedDictationLanguagesForDeviceLanguage___suggestedDictationLanguageProperties, "setObject:forKey:", v5, v4);

  }
LABEL_14:

  return v5;
}

id TIGetHardwareKeyboardSupport()
{
  if (TIGetHardwareKeyboardSupport_onceToken != -1)
    dispatch_once(&TIGetHardwareKeyboardSupport_onceToken, &__block_literal_global_235);
  return (id)TIGetHardwareKeyboardSupport___hardwareSupport;
}

id TIGetStickerTaxonomyIdentifiers()
{
  if (TIGetStickerTaxonomyIdentifiers_onceToken != -1)
    dispatch_once(&TIGetStickerTaxonomyIdentifiers_onceToken, &__block_literal_global_238);
  return (id)TIGetStickerTaxonomyIdentifiers___stickerTaxonomyIdentifiers;
}

id TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions()
{
  if (TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions_onceToken != -1)
    dispatch_once(&TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions_onceToken, &__block_literal_global_241);
  return (id)TIGetStickerTaxonomyIdentifiersAllowListSynonymExclusions___stickerTaxonomyIdentifiers;
}

id TIGetLanguageSupportForHardwareKeyboard(void *a1, void *a2)
{
  id v3;
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

  v3 = a1;
  v4 = a2;
  TIGetHardwareKeyboardSupport();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("KeyboardNames"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (objc_msgSend(v4, "integerValue") < 1)
    {
      v3 = 0;
    }
    else
    {
      TIGetHardwareKeyboardSupport();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("USBCountryCodeMap"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v9);
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v6, "objectForKey:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("US")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("U.S.")) & 1) != 0)
    {
      v11 = &unk_1E24B0630;
    }
    else if (objc_msgSend(v3, "isEqual:", CFSTR("Arabic")))
    {
      v11 = &unk_1E24B0648;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C9AA60];
    }
    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MatchedModes"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("MatchedModes"));

      v10 = v12;
    }
  }

  return v10;
}

id TIGetDefaultHWLayoutForKeyboardAndInputMode(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  TIGetLanguageSupportForHardwareKeyboard(a1, &unk_1E24C0340);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("DefaultHWLayouts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    TIGetHardwareLayoutsForInputMode(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
  }

  return v6;
}

uint64_t TIEnabledInputModesAllowOneToManyShortcuts()
{
  return 1;
}

id UIKeyboardAllBundles()
{
  int v0;
  __darwin_time_t tv_sec;
  uint64_t tv_nsec;
  int v3;
  __darwin_time_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  id v9;
  void *v10;
  char ***v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  char ***v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unsigned int v25;
  void *v26;
  id v27;
  const char *v28;
  void *v29;
  void *v30;
  id v32;
  unint64_t v33;
  void *v34;
  stat v35;

  memset(&v35, 0, sizeof(v35));
  v0 = stat("/System/Library/TextInput", &v35);
  if (v0)
    tv_sec = 0;
  else
    tv_sec = v35.st_mtimespec.tv_sec;
  if (v0)
    tv_nsec = 0;
  else
    tv_nsec = v35.st_mtimespec.tv_nsec;
  v3 = stat("/Library/TextInput", &v35);
  v4 = v35.st_mtimespec.tv_sec;
  v5 = v35.st_mtimespec.tv_nsec;
  if (v3)
  {
    v4 = 0;
    v5 = 0;
  }
  if (UIKeyboardBundleRootsChanged_init == 1
    && UIKeyboardBundleRootsChanged_SystemRootModTime_0 == tv_sec
    && UIKeyboardBundleRootsChanged_SystemRootModTime_1 == tv_nsec
    && UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_0 == v4
    && UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_1 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 1;
    UIKeyboardBundleRootsChanged_init = 1;
    UIKeyboardBundleRootsChanged_SystemRootModTime_0 = tv_sec;
    UIKeyboardBundleRootsChanged_SystemRootModTime_1 = tv_nsec;
    UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_0 = v4;
    UIKeyboardBundleRootsChanged_ThirdPartyRootModTime_1 = v5;
  }
  v7 = objc_msgSend((id)UIKeyboardAllBundles___allBundles, "count");
  if ((v6 & 1) == 0 && v7)
    return (id)UIKeyboardAllBundles___allBundles;
  if (UIKeyboardAllBundles___allBundles)
  {
    objc_msgSend((id)UIKeyboardAllBundles___allBundles, "removeAllObjects");
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = (void *)UIKeyboardAllBundles___allBundles;
    UIKeyboardAllBundles___allBundles = (uint64_t)v9;

  }
  v11 = &off_1EE03F000;
  if (!UIKeyboardAllBundles_bundleSearchPath)
  {
    v12 = objc_alloc(MEMORY[0x1E0C99D20]);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "/System/Library/TextInput");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "/Library/TextInput");
    v15 = objc_msgSend(v12, "initWithObjects:", v13, v14, 0);
    v16 = (void *)UIKeyboardAllBundles_bundleSearchPath;
    UIKeyboardAllBundles_bundleSearchPath = v15;

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend((id)UIKeyboardAllBundles_bundleSearchPath, "count");
  if (v33)
  {
    v17 = 0;
    v18 = 0;
    do
    {
      v19 = v11;
      objc_msgSend(v11[408], "objectAtIndex:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contentsOfDirectoryAtPath:error:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        v25 = 1;
        do
        {
          objc_msgSend(v21, "objectAtIndex:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringByAppendingPathComponent:", v26);
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v28 = (const char *)objc_msgSend(v27, "fileSystemRepresentation");
          memset(&v35, 0, sizeof(v35));
          if (!stat(v28, &v35) && (v35.st_mode & 0x4000) != 0)
          {
            v29 = (void *)UIKeyboardAllBundles___allBundles;
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v27);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v30);

          }
          v24 = v25;
        }
        while (v23 > v25++);
      }

      v17 = ++v18;
      v11 = v19;
    }
    while (v33 > v18);
  }
  v32 = (id)UIKeyboardAllBundles___allBundles;

  return v32;
}

uint64_t TILinguisticDataRoot()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/System/Library/LinguisticData");
}

id TILinguisticDataBundlePathForInputMode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetBaseLanguage(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasSuffix:", CFSTR("-Translit")))
  {
    v4 = v1;

    v3 = v4;
  }
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("mul")))
  {
    v5 = v1;

    v3 = v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/RequiredAssets_%@.bundle"), "/System/Library/LinguisticData", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v6))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

uint64_t TIInputModeIsTransliteration(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasSuffix:", CFSTR("-Translit"));
}

id TILinguisticDataAssetDataPathForInputMode(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  TILinguisticDataBundlePathForInputMode(a1);
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/AssetData"), v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id TIBundleForInputMode(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v1 = a1;
  v2 = (void *)TIBundleForInputMode___cache;
  if (!TIBundleForInputMode___cache)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)TIBundleForInputMode___cache;
    TIBundleForInputMode___cache = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    v6 = (void *)TIBundleForInputMode___sentinel;
    TIBundleForInputMode___sentinel = (uint64_t)v5;

    v2 = (void *)TIBundleForInputMode___cache;
  }
  objc_msgSend(v2, "objectForKey:", v1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    if (v7 == TIBundleForInputMode___sentinel)
      v9 = 0;
    else
      v9 = (void *)v7;
    v10 = v9;
  }
  else
  {
    TIBundlePathForInputMode(v1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v11), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (id)v12;
      objc_msgSend((id)TIBundleForInputMode___cache, "setObject:forKey:", v12, v1);
    }
    else
    {
      objc_msgSend((id)TIBundleForInputMode___cache, "setObject:forKey:", TIBundleForInputMode___sentinel, v1);
      v10 = 0;
    }

  }
  return v10;
}

id TILinguisticDataBundleForInputMode(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v1 = a1;
  v2 = (void *)TILinguisticDataBundleForInputMode___cache;
  if (!TILinguisticDataBundleForInputMode___cache)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)TILinguisticDataBundleForInputMode___cache;
    TILinguisticDataBundleForInputMode___cache = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x1E0DE7910]);
    v6 = (void *)TILinguisticDataBundleForInputMode___sentinel;
    TILinguisticDataBundleForInputMode___sentinel = (uint64_t)v5;

    v2 = (void *)TILinguisticDataBundleForInputMode___cache;
  }
  objc_msgSend(v2, "objectForKey:", v1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    if (v7 == TILinguisticDataBundleForInputMode___sentinel)
      v9 = 0;
    else
      v9 = (void *)v7;
    v10 = v9;
  }
  else
  {
    TILinguisticDataBundlePathForInputMode(v1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v11), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (id)v12;
      objc_msgSend((id)TILinguisticDataBundleForInputMode___cache, "setObject:forKey:", v12, v1);
    }
    else
    {
      objc_msgSend((id)TILinguisticDataBundleForInputMode___cache, "setObject:forKey:", TILinguisticDataBundleForInputMode___sentinel, v1);
      v10 = 0;
    }

  }
  return v10;
}

objc_class *TIInputManagerClassForInputMode(void *a1, int a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  Class v16;
  objc_class *v17;

  v3 = a1;
  v4 = v3;
  if (!TIInputManagerClassForInputMode___default)
    TIInputManagerClassForInputMode___default = (uint64_t)CFSTR("TIKeyboardInputManager");
  TICanonicalInputModeName(v3);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    TIInputModeGetLanguageWithRegion(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ja_JP"));

    if (v7)
    {
      TIInputModeGetComponentsFromIdentifier(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("hw"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("KANA"));

      if (v10)
        v5 = CFSTR("ja_JP-Kana");
      else
        v5 = CFSTR("ja_JP-Romaji");

    }
  }
  TIInputModeGetNormalizedIdentifier(v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("UIKeyboardInputManagerClass"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    TIBundleForInputMode(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
      v16 = (Class)objc_msgSend(v14, "classNamed:", v13);
    else
      v16 = 0;

  }
  else
  {
    v16 = NSClassFromString((NSString *)TIInputManagerClassForInputMode___default);
  }
  v17 = v16;

  return v17;
}

id TIResourcePathForInputMode(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v25;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    TICanonicalInputModeName(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), v11, v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

    if (v15)
    {
      v16 = v13;
      v17 = v16;
    }
    else
    {
      TIInputModeGetLanguageWithRegion(v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), v11, v18, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "fileExistsAtPath:", v19);

      if (v21)
      {
        v16 = v19;
        v17 = v16;
      }
      else
      {
        TIInputModeGetBaseLanguage(v9);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), v11, v25, v10);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "fileExistsAtPath:", v16);

        if (v23)
          v17 = v16;
        else
          v17 = 0;

      }
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id TICachedResourcePathForInputMode(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v6, "length"))
  {
    if (!TICachedResourcePathForInputMode___cache)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = (void *)TICachedResourcePathForInputMode___cache;
      TICachedResourcePathForInputMode___cache = (uint64_t)v8;

      v10 = objc_alloc_init(MEMORY[0x1E0DE7910]);
      v11 = (void *)TICachedResourcePathForInputMode___sentinel;
      TICachedResourcePathForInputMode___sentinel = (uint64_t)v10;

      v12 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v13 = (void *)TICachedResourcePathForInputMode___key;
      TICachedResourcePathForInputMode___key = (uint64_t)v12;

    }
    +[TIInputModeLocaleIdentifierOverrideMapping sharedInstance](TIInputModeLocaleIdentifierOverrideMapping, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "overrideLocaleForIdentifier:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = v15;

      v6 = v16;
    }
    objc_msgSend((id)TICachedResourcePathForInputMode___key, "setString:", v5);
    objc_msgSend((id)TICachedResourcePathForInputMode___key, "appendString:", v6);
    objc_msgSend((id)TICachedResourcePathForInputMode___key, "appendString:", CFSTR("."));
    objc_msgSend((id)TICachedResourcePathForInputMode___key, "appendString:", v7);
    objc_msgSend((id)TICachedResourcePathForInputMode___cache, "objectForKey:", TICachedResourcePathForInputMode___key);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
    {
      if (v17 == TICachedResourcePathForInputMode___sentinel)
        v19 = 0;
      else
        v19 = (void *)v17;
      v20 = v19;
    }
    else
    {
      TILinguisticDataAssetDataPathForInputMode(v6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      TIResourcePathForInputMode(v21, v5, v6, v7);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
        v22 = (uint64_t)v20;
      else
        v22 = TICachedResourcePathForInputMode___sentinel;
      objc_msgSend((id)TICachedResourcePathForInputMode___cache, "setObject:forKey:", v22, TICachedResourcePathForInputMode___key);

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id TIStaticUnigramsFilePathForInputModeAndFileExtension(void *a1, void *a2)
{
  return TICachedResourcePathForInputMode(CFSTR("Unigrams-"), a1, a2);
}

id TIDeltaUnigramsFilePathForInputModeAndFileExtension(void *a1, void *a2)
{
  return TICachedResourcePathForInputMode(CFSTR("Delta-"), a1, a2);
}

id TIPhrasesFilePathForInputModeAndFileExtension(void *a1, void *a2)
{
  return TICachedResourcePathForInputMode(CFSTR("Phrases-"), a1, a2);
}

id TINgramModelPathForInputMode(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  TICachedResourcePathForInputMode(&stru_1E243B990, a1, CFSTR("lm"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, "stringByDeletingLastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id TIGetApplicableKeyboardShortcutOverrides(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("global"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    v27 = v8;
    v28 = v4;
    v26 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("global")) & 1) == 0
          && objc_msgSend(v4, "hasPrefix:", v13))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_23:

            v23 = 0;
            v24 = (id)MEMORY[0x1E0C9AA70];
            goto LABEL_26;
          }
          v15 = v14;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = v15;
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v14);
                v20 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
                objc_msgSend(v14, "objectForKeyedSubscript:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  v8 = v27;
                  v4 = v28;
                  goto LABEL_23;
                }
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v20);

              }
              v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              if (v17)
                continue;
              break;
            }
          }

          v8 = v27;
          v4 = v28;
          v11 = v26;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (objc_msgSend(v7, "count"))
    v22 = (void *)objc_msgSend(v7, "copy");
  else
    v22 = (void *)MEMORY[0x1E0C9AA70];
  v24 = v22;
  v23 = v24;
LABEL_26:

  return v23;
}

id TIGetKeyboardShortcutOverridesForKeyboardLayout(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)MEMORY[0x1E0C9AA70];
  if (v4)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E243B990);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), &stru_1E243B990);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (TIGetNormalizedKeyboardLayoutForShortcutTranslation_onceToken != -1)
      dispatch_once(&TIGetNormalizedKeyboardLayoutForShortcutTranslation_onceToken, &__block_literal_global_351);
    objc_msgSend((id)TIGetNormalizedKeyboardLayoutForShortcutTranslation_keyboardlayout_map, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    v11 = v10;

    if (TIGetKeyboardShortcutOverridesForKeyboardLayout_once != -1)
      dispatch_once(&TIGetKeyboardShortcutOverridesForKeyboardLayout_once, &__block_literal_global_306);
    if (a2)
      v12 = CFSTR("_JIS");
    else
      v12 = &stru_1E243B990;
    objc_msgSend(v11, "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)TIGetKeyboardShortcutOverridesForKeyboardLayout___keyboardShortcutOverridesCache, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KeyboardShortcutEquivalents_%@.plist"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E24C0210, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 && a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KeyboardShortcutEquivalents_%@.plist"), v11);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(&unk_1E24C0210, "objectForKey:", v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)v19;
    }
    TIGetApplicableKeyboardShortcutOverrides(v18, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v14 = (void *)objc_msgSend(v20, "copy");
      if (!v20)
      {
LABEL_21:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v23 = "TIGetKeyboardShortcutOverridesForKeyboardLayout";
          v24 = 2112;
          v25 = v11;
          v26 = 2112;
          v27 = v16;
          _os_log_fault_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s: malformatted plist for keyboard layout(%@) bundleID(%@)", buf, 0x20u);
        }
      }
    }
    else
    {
      v14 = 0;
      if (!v20)
        goto LABEL_21;
    }
    if (!v14)
      v14 = v5;
    objc_msgSend((id)TIGetKeyboardShortcutOverridesForKeyboardLayout___keyboardShortcutOverridesCache, "setObject:forKey:", v14, v13);

LABEL_26:
    goto LABEL_27;
  }
  v14 = (void *)MEMORY[0x1E0C9AA70];
LABEL_27:

  return v14;
}

id TILoadMergedKeyboardPlistForInputMode(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  TIInputModeGetLanguage(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetRegion(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetVariant(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  TILoadMergedKeyboardPlistForLocale(v4, v5, v6, a2, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id TIKeyboardPopupVariantsForInputMode(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a1;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TILoadMergedKeyboardPlistForInputMode(v4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __TIKeyboardPopupVariantsForInputMode_block_invoke;
    v8[3] = &unk_1E2439670;
    v9 = v5;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  return v5;
}

id TIInputModeGetMultilingualSet(void *a1)
{
  return TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages(a1, 0, 0);
}

BOOL TIInputModeWantsMultilingualUnionOVS(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  TIInputModeGetNormalizedIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UIKeyboardWantsMultilingualUnionOVS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t TIInputModeUseMorphemeLevelLexicon(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  if (_os_feature_enabled_impl())
  {
    TIGetInputModeProperties(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("UIKeyboardUseMorphemeLevelLexicon"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "BOOLValue");
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _TIValueForCGRect(double a1, double a2, double a3, double a4)
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __Block_byref_object_copy__2607(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2608(uint64_t a1)
{

}

const __CFString *TIKeyboardCandidateTypingEngineTypeToString(unsigned int a1)
{
  if (a1 > 6)
    return CFSTR("Other");
  else
    return off_1E24399E8[a1];
}

uint64_t TI_USER_DIRECTORY()
{
  uint64_t result;

  result = s_user_directory;
  if (!s_user_directory)
  {
    if (TI_USER_DIRECTORY_onceToken != -1)
      dispatch_once(&TI_USER_DIRECTORY_onceToken, &__block_literal_global_3668);
    return TI_USER_DIRECTORY_default_user_directory;
  }
  return result;
}

void *__getCPSharedResourcesDirectorySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AppSupportLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AppSupportLibraryCore_frameworkLibrary;
  }
  else
  {
    AppSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AppSupportLibraryCore_frameworkLibrary;
    if (!AppSupportLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CPSharedResourcesDirectory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCPSharedResourcesDirectorySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void TI_SET_USER_DIRECTORY(CFTypeRef cf)
{
  if ((CFTypeRef)s_user_directory != cf)
  {
    if (s_user_directory)
    {
      CFRelease((CFTypeRef)s_user_directory);
      s_user_directory = 0;
    }
    if (cf)
      s_user_directory = (uint64_t)CFRetain(cf);
  }
}

uint64_t TI_DEVICE_UNLOCKED()
{
  void *v0;
  void *v1;
  int v2;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  v8 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBGetDeviceLockState");
    v6[3] = (uint64_t)v0;
    getMKBGetDeviceLockStateSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = ((uint64_t (*)(_QWORD))v0)(0);
    return !v2 || v2 == 3;
  }
  else
  {
    dlerror();
    abort_report_np();
    return MobileKeyBagLibrary();
  }
}

uint64_t MobileKeyBagLibrary()
{
  uint64_t v0;
  void *v2;

  if (MobileKeyBagLibraryCore_frameworkLibrary)
    return MobileKeyBagLibraryCore_frameworkLibrary;
  MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MobileKeyBagLibraryCore_frameworkLibrary;
  if (!MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

BOOL TI_DEVICE_UNLOCKED_SINCE_BOOT()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v7 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v1 = (void *)MobileKeyBagLibrary();
    v0 = dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    v5[3] = (uint64_t)v0;
    getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return ((unsigned int (*)(void))v0)() == 1;
  dlerror();
  v3 = abort_report_np();
  return TI_SET_PROTECTION_CLASS_C(v3);
}

BOOL TI_SET_PROTECTION_CLASS_C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a1, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C99928];
  v3 = *MEMORY[0x1E0C99938];
  v7 = 0;
  objc_msgSend(v1, "setResourceValue:forKey:error:", v2, v3, &v7);
  v4 = v7;
  if (v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_18C56E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "couldn't set protection class, error: %@", buf, 0xCu);

  }
  return v4 == 0;
}

uint64_t TI_IS_FILE_CLASS_C(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v2, "attributesOfItemAtPath:error:", v1, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB2AD8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2AC0]);

  return v5;
}

id _TIQueueBackground()
{
  if (_TIQueueBackground::onceToken != -1)
    dispatch_once(&_TIQueueBackground::onceToken, &__block_literal_global_4251);
  return (id)_TIQueueBackground::sQueue;
}

id _TIQueueLow()
{
  if (_TIQueueLow::onceToken != -1)
    dispatch_once(&_TIQueueLow::onceToken, &__block_literal_global_1);
  return (id)_TIQueueLow::sQueue;
}

id _TIQueueUserInitiated()
{
  if (_TIQueueUserInitiated::onceToken != -1)
    dispatch_once(&_TIQueueUserInitiated::onceToken, &__block_literal_global_2);
  return (id)_TIQueueUserInitiated::sQueue;
}

void TIDispatchSync(void *a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  NSObject *queue;

  queue = a1;
  v3 = a2;
  if (_block_count(void)::once_token != -1)
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_4);
  do
    v4 = __ldaxr(&_block_count(void)::count);
  while (__stlxr(v4 + 1, &_block_count(void)::count));
  dispatch_sync(queue, v3);
  if (_block_count(void)::once_token != -1)
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_4);
  do
    v5 = __ldaxr(&_block_count(void)::count);
  while (__stlxr(v5 - 1, &_block_count(void)::count));

}

unint64_t TIDispatchCount()
{
  if (_block_count(void)::once_token != -1)
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global_4);
  return atomic_load(&_block_count(void)::count);
}

void TIDispatchWaitForAllBlocks()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x18D7835DC]();
  v1 = *MEMORY[0x1E0C99748];
  while (1)
  {
    if (_block_count(void)::once_token != -1)
      dispatch_once(&_block_count(void)::once_token, &__block_literal_global_4);
    v2 = atomic_load(&_block_count(void)::count);
    if (v2 < 1)
      break;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.01);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "acceptInputForMode:beforeDate:", v1, v4);

  }
  objc_autoreleasePoolPop(v0);
}

id _assistantInternalQueue()
{
  if (_assistantInternalQueue_onceToken != -1)
    dispatch_once(&_assistantInternalQueue_onceToken, &__block_literal_global_4338);
  return (id)_assistantInternalQueue___xpc_queue;
}

void ___assistantInternalQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.rdt", v2);
  v1 = (void *)_assistantInternalQueue___xpc_queue;
  _assistantInternalQueue___xpc_queue = (uint64_t)v0;

}

uint64_t _recordTypeForEventRecordHeader(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = *(id *)(a1 + 16);
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Completions")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Autocorrection")) & 1) != 0)
  {
    v3 = 2;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("Predictions")))
  {
    v3 = 3;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id _parseRawCandidateGroupsFromString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v12;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v1);
  v12 = 0;
  v4 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n["), &v12);
  v5 = v12;
  v6 = v5;
  if (v4)
  {
    do
    {
      +[TITraceLogCandidateGroup groupFromGroupString:](TITraceLogCandidateGroup, "groupFromGroupString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v2, "addObject:", v7);

      v12 = v6;
      v8 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n["), &v12);
      v9 = v12;

      v6 = v9;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    v9 = v5;
  }
  v10 = (void *)objc_msgSend(v2, "copy");

  return v10;
}

id _parseRemovedCandidatesGroupFromString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v12;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v1);
  v12 = 0;
  v4 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n"), &v12);
  v5 = v12;
  v6 = v5;
  if (v4)
  {
    do
    {
      +[TITraceLogCandidate candidateFromRemovedCandidateString:](TITraceLogCandidate, "candidateFromRemovedCandidateString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v2, "addObject:", v7);

      v12 = v6;
      v8 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n"), &v12);
      v9 = v12;

      v6 = v9;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    v9 = v5;
  }
  v10 = (void *)objc_msgSend(v2, "copy");

  return v10;
}

id _parseFinalCandidatesGroupFromString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v12;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v1);
  v12 = 0;
  v4 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n"), &v12);
  v5 = v12;
  v6 = v5;
  if (v4)
  {
    do
    {
      +[TITraceLogCandidate candidateFromFinalCandidateString:](TITraceLogCandidate, "candidateFromFinalCandidateString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(v2, "addObject:", v7);

      v12 = v6;
      v8 = objc_msgSend(v3, "scanUpToString:intoString:", CFSTR("\n"), &v12);
      v9 = v12;

      v6 = v9;
    }
    while ((v8 & 1) != 0);
  }
  else
  {
    v9 = v5;
  }
  v10 = (void *)objc_msgSend(v2, "copy");

  return v10;
}

__CFString *autoCorrectionTypeAsString(int a1)
{
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if ((a1 & 1) != 0)
  {
    objc_msgSend(&stru_1E243B990, "stringByAppendingString:", CFSTR("All|"));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((a1 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = &stru_1E243B990;
  if ((a1 & 2) != 0)
  {
LABEL_5:
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Caps|"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v3;
  }
LABEL_6:
  if ((a1 & 4) != 0)
  {
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Dia|"));
    v6 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v6;
    if ((a1 & 8) == 0)
    {
LABEL_8:
      if ((a1 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_31;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_8;
  }
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Pred|"));
  v7 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v7;
  if ((a1 & 0x10) == 0)
  {
LABEL_9:
    if ((a1 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Spc|"));
  v8 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v8;
  if ((a1 & 0x20) == 0)
  {
LABEL_10:
    if ((a1 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Retro|"));
  v9 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v9;
  if ((a1 & 0x40) == 0)
  {
LABEL_11:
    if ((a1 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Adapt|"));
  v10 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v10;
  if ((a1 & 0x80) == 0)
  {
LABEL_12:
    if ((a1 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("MultiPred|"));
  v11 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v11;
  if ((a1 & 0x100) == 0)
  {
LABEL_13:
    if ((a1 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Recent|"));
  v12 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v12;
  if ((a1 & 0x200) == 0)
  {
LABEL_14:
    if ((a1 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Learned|"));
  v13 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v13;
  if ((a1 & 0x400) == 0)
  {
LABEL_15:
    if ((a1 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Transposition|"));
  v14 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v14;
  if ((a1 & 0x800) == 0)
  {
LABEL_16:
    if ((a1 & 0x1000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Insert|"));
  v15 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v15;
  if ((a1 & 0x1000) == 0)
  {
LABEL_17:
    if ((a1 & 0x2000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Skip|"));
  v16 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v16;
  if ((a1 & 0x2000) == 0)
  {
LABEL_18:
    if ((a1 & 0x4000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("NamedEntity|"));
  v17 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v17;
  if ((a1 & 0x4000) == 0)
  {
LABEL_19:
    if ((a1 & 0x8000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Near|"));
  v18 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v18;
  if ((a1 & 0x8000) == 0)
  {
LABEL_20:
    if ((a1 & 0x10000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Subst|"));
  v19 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v19;
  if ((a1 & 0x10000) == 0)
  {
LABEL_21:
    if ((a1 & 0x20000) == 0)
      goto LABEL_22;
    goto LABEL_44;
  }
LABEL_43:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("HitTest|"));
  v20 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v20;
  if ((a1 & 0x20000) == 0)
  {
LABEL_22:
    if ((a1 & 0x40000) == 0)
      goto LABEL_23;
    goto LABEL_45;
  }
LABEL_44:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("CPCompletion|"));
  v21 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v21;
  if ((a1 & 0x40000) == 0)
  {
LABEL_23:
    if ((a1 & 0x80000) == 0)
      goto LABEL_24;
    goto LABEL_46;
  }
LABEL_45:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("MultiLingual|"));
  v22 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v22;
  if ((a1 & 0x80000) == 0)
  {
LABEL_24:
    if ((a1 & 0x100000) == 0)
      goto LABEL_25;
    goto LABEL_47;
  }
LABEL_46:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("CP|"));
  v23 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v23;
  if ((a1 & 0x100000) == 0)
  {
LABEL_25:
    if ((a1 & 0x200000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_47:
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("SupplLex|"));
  v24 = objc_claimAutoreleasedReturnValue();

  v2 = (__CFString *)v24;
  if ((a1 & 0x200000) != 0)
  {
LABEL_26:
    -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("Join|"));
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (__CFString *)v4;
  }
LABEL_27:
  if (-[__CFString length](v2, "length"))
  {
    -[__CFString substringToIndex:](v2, "substringToIndex:", -[__CFString length](v2, "length") - 1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("NONE");
  }

  return v5;
}

__CFString *TIStatisticCandidateSourceAsString(int a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  if (!a1)
  {
    v4 = CFSTR("Unknown");
    return v4;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 0x8000) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("PrimaryStatic"));
    if ((a1 & 0x20000) == 0)
    {
LABEL_4:
      if ((a1 & 0x10000) == 0)
        goto LABEL_5;
      goto LABEL_27;
    }
  }
  else if ((a1 & 0x20000) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", CFSTR("SecondaryStatic"));
  if ((a1 & 0x10000) == 0)
  {
LABEL_5:
    if ((a1 & 0x40000) == 0)
      goto LABEL_6;
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "addObject:", CFSTR("PrimaryDynamic"));
  if ((a1 & 0x40000) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "addObject:", CFSTR("SecondaryDynamic"));
  if ((a1 & 0x40) == 0)
  {
LABEL_7:
    if ((a1 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "addObject:", CFSTR("PQT"));
  if ((a1 & 0x400) == 0)
  {
LABEL_8:
    if ((a1 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "addObject:", CFSTR("Supplemental"));
  if ((a1 & 0x10) == 0)
  {
LABEL_9:
    if ((a1 & 8) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "addObject:", CFSTR("NamedEntity"));
  if ((a1 & 8) == 0)
  {
LABEL_10:
    if ((a1 & 4) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "addObject:", CFSTR("AddressBook"));
  if ((a1 & 4) == 0)
  {
LABEL_11:
    if ((a1 & 0x800) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "addObject:", CFSTR("TextReplacement"));
  if ((a1 & 0x800) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "addObject:", CFSTR("AppNames"));
  if ((a1 & 0x2000) == 0)
  {
LABEL_13:
    if ((a1 & 0x20) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "addObject:", CFSTR("SmartResponse"));
  if ((a1 & 0x20) == 0)
  {
LABEL_14:
    if ((a1 & 0x80) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(v3, "addObject:", CFSTR("OOV"));
  if ((a1 & 0x80) == 0)
  {
LABEL_15:
    if ((a1 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(v3, "addObject:", CFSTR("Offensive"));
  if ((a1 & 0x100) == 0)
  {
LABEL_16:
    if ((a1 & 0x200) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(v3, "addObject:", CFSTR("Vulgar"));
  if ((a1 & 0x200) == 0)
  {
LABEL_17:
    if ((a1 & 0x4000) == 0)
      goto LABEL_18;
LABEL_40:
    objc_msgSend(v3, "addObject:", CFSTR("Emoji"));
    if ((a1 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_39:
  objc_msgSend(v3, "addObject:", CFSTR("Sensitive"));
  if ((a1 & 0x4000) != 0)
    goto LABEL_40;
LABEL_18:
  if ((a1 & 0x80000) != 0)
LABEL_19:
    objc_msgSend(v3, "addObject:", CFSTR("InlineCompletion"));
LABEL_20:
  if ((a1 & 0xFFF00003) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Unexpected"));
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v4;
}

__CFString *candidateSourceAsString(int a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 11);
  v3 = v2;
  if ((a1 & 0x400) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("Supplemental"));
  if ((a1 & 0x28000) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Static"));
  if ((a1 & 0x40000) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("Dynamic"));
    if ((a1 & 4) == 0)
    {
LABEL_7:
      if ((a1 & 8) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(v3, "addObject:", CFSTR("TextReplc"));
  if ((a1 & 8) == 0)
  {
LABEL_8:
    if ((a1 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "addObject:", CFSTR("Contact"));
  if ((a1 & 0x10) == 0)
  {
LABEL_9:
    if ((a1 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "addObject:", CFSTR("NamedEntitity"));
  if ((a1 & 0x20) == 0)
  {
LABEL_10:
    if ((a1 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "addObject:", CFSTR("OOV"));
  if ((a1 & 0x40) == 0)
  {
LABEL_11:
    if ((a1 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "addObject:", CFSTR("PQT"));
  if ((a1 & 0x80) == 0)
  {
LABEL_12:
    if ((a1 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "addObject:", CFSTR("Offensive"));
  if ((a1 & 0x100) == 0)
  {
LABEL_13:
    if ((a1 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_24:
  objc_msgSend(v3, "addObject:", CFSTR("Vulgar"));
  if ((a1 & 0x200) != 0)
LABEL_14:
    objc_msgSend(v3, "addObject:", CFSTR("Sensitive"));
LABEL_15:
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("|"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("None");
  }

  return v4;
}

uint64_t __Block_byref_object_copy__6046(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6047(uint64_t a1)
{

}

uint64_t TIIsRegisterLearningModeRejection(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("rejected"));
}

uint64_t TIIsRegisterLearningModeAcceptance(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR("accepted"));
}

Class __getIAEventDispatcherClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!InputAnalyticsLibraryCore_frameworkLibrary)
    InputAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("IAEventDispatcher");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIAEventDispatcherClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id keyboardui_system_get_log()
{
  if (keyboardui_system_get_log_onceToken != -1)
    dispatch_once(&keyboardui_system_get_log_onceToken, &__block_literal_global_5);
  return (id)keyboardui_system_get_log_log;
}

void __keyboardui_system_get_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TextInput", "KeyboardUISignpostsSystem");
  v1 = (void *)keyboardui_system_get_log_log;
  keyboardui_system_get_log_log = (uint64_t)v0;

}

void std::__tree<NSHolder<TIInputContextEntry>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(*a1);
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(a1[1]);

    operator delete(a1);
  }
}

uint64_t std::set<NSHolder<TIInputContextEntry>>::insert[abi:nn180100]<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>(uint64_t result, void **a2, void **a3)
{
  uint64_t v3;
  uint64_t v4;
  void **v6;
  uint64_t v7;
  _QWORD *v8;
  id *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  uint64_t **v17;
  uint64_t *v18;
  void **v19;
  void **v20;
  uint64_t v21[11];

  if (a2 != a3)
  {
    v21[9] = v3;
    v21[10] = v4;
    v6 = a2;
    v7 = result;
    v8 = (_QWORD *)(result + 8);
    do
    {
      v9 = v6 + 4;
      v10 = *(_QWORD **)(v7 + 8);
      if (*(_QWORD **)v7 == v8)
      {
        v12 = v8;
        if (v10)
          goto LABEL_23;
      }
      else
      {
        v11 = v8;
        if (v10)
        {
          do
          {
            v12 = v10;
            v10 = (_QWORD *)v10[1];
          }
          while (v10);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v11[2];
            v15 = *v12 == (_QWORD)v11;
            v11 = v12;
          }
          while (v15);
        }
        v13 = (void *)v12[4];
        v14 = *v9;
        if (v13)
          v15 = v14 == 0;
        else
          v15 = 1;
        if (v15)
        {
          if (v14)
            v16 = -1;
          else
            v16 = 0;
          if (v13)
            result = 1;
          else
            result = v16;
          if ((result & 0x80000000) == 0)
          {
LABEL_25:
            result = (uint64_t)std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>(v7, v21, v6 + 4);
            v17 = (uint64_t **)result;
            goto LABEL_26;
          }
        }
        else
        {
          result = objc_msgSend(v13, "compare:");
          if ((result & 0x80000000) == 0)
            goto LABEL_25;
        }
        if (*v8)
        {
LABEL_23:
          v21[0] = (uint64_t)v12;
          v17 = (uint64_t **)(v12 + 1);
          goto LABEL_26;
        }
      }
      v21[0] = (uint64_t)v8;
      v17 = (uint64_t **)v8;
LABEL_26:
      if (!*v17)
      {
        v18 = (uint64_t *)operator new(0x28uLL);
        v18[4] = (uint64_t)*v9;
        result = (uint64_t)std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)v7, v21[0], v17, v18);
      }
      v19 = (void **)v6[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (void **)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (void **)v6[2];
          v15 = *v20 == v6;
          v6 = v20;
        }
        while (!v15);
      }
      v6 = v20;
    }
    while (v20 != a3);
  }
  return result;
}

uint64_t **std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  _BYTE *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v4 = (uint64_t *)**result;
  if (v4)
  {
    *result = v4;
    a4 = *a3;
  }
  v5 = result[1];
  *((_BYTE *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      v6 = (uint64_t *)a4[2];
      if (*((_BYTE *)v6 + 24))
        break;
      v7 = (uint64_t *)v6[2];
      v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        v11 = v7[1];
        if (!v11 || (v12 = *(unsigned __int8 *)(v11 + 24), v9 = (_BYTE *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            v13 = (uint64_t **)a4[2];
          }
          else
          {
            v13 = (uint64_t **)v6[1];
            v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              v14[2] = (uint64_t)v6;
              v7 = (uint64_t *)v6[2];
            }
            v13[2] = v7;
            *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = v13;
            *v13 = v6;
            v6[2] = (uint64_t)v13;
            v7 = v13[2];
            v6 = (uint64_t *)*v7;
          }
          *((_BYTE *)v13 + 24) = 1;
          *((_BYTE *)v7 + 24) = 0;
          v17 = v6[1];
          *v7 = v17;
          if (v17)
            *(_QWORD *)(v17 + 16) = v7;
          v6[2] = v7[2];
          *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (v10 = *((unsigned __int8 *)v8 + 24), v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          v15 = a4[1];
          *v6 = v15;
          if (v15)
          {
            *(_QWORD *)(v15 + 16) = v6;
            v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(_QWORD *)(v6[2] + 8 * (*(_QWORD *)v6[2] != (_QWORD)v6)) = a4;
          a4[1] = (uint64_t)v6;
          v6[2] = (uint64_t)a4;
          v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((_BYTE *)a4 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v6 = (uint64_t *)v7[1];
        v16 = *v6;
        v7[1] = *v6;
        if (v16)
          *(_QWORD *)(v16 + 16) = v7;
        v6[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v6;
        *v6 = (uint64_t)v7;
LABEL_29:
        v7[2] = (uint64_t)v6;
        break;
      }
      *((_BYTE *)v6 + 24) = 1;
      a4 = v7;
      *((_BYTE *)v7 + 24) = v7 == v5;
      *v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

_QWORD *std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>(uint64_t a1, _QWORD *a2, void **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v16;
  int v17;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    while (1)
    {
      v7 = v4;
      v8 = *a3;
      v9 = v4[4];
      if (*a3)
        v10 = v9 == 0;
      else
        v10 = 1;
      if (v10)
      {
        if (v9)
          v11 = -1;
        else
          v11 = 0;
        if (v8)
          v12 = 1;
        else
          v12 = v11;
        if (v12 < 0)
          goto LABEL_14;
LABEL_17:
        v13 = (void *)v7[4];
        v14 = *a3;
        if (v13)
          v15 = v14 == 0;
        else
          v15 = 1;
        if (v15)
        {
          if (v14)
            v16 = -1;
          else
            v16 = 0;
          if (v13)
            v17 = 1;
          else
            v17 = v16;
          if ((v17 & 0x80000000) == 0)
            goto LABEL_34;
        }
        else if ((objc_msgSend(v13, "compare:") & 0x80000000) == 0)
        {
          goto LABEL_34;
        }
        v5 = v7 + 1;
        v4 = (_QWORD *)v7[1];
        if (!v4)
          goto LABEL_34;
      }
      else
      {
        if ((objc_msgSend(v8, "compare:") & 0x80000000) == 0)
          goto LABEL_17;
LABEL_14:
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_34;
      }
    }
  }
  v7 = (_QWORD *)(a1 + 8);
LABEL_34:
  *a2 = v7;
  return v5;
}

uint64_t std::__tree<NSHolder<TIInputContextEntry>>::__count_unique<NSHolder<TIInputContextEntry>>(_QWORD *a1, void **a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v13;
  int v14;

  if (a1)
  {
    v3 = a1;
    v4 = 1;
    do
    {
      v5 = *a2;
      v6 = v3[4];
      if (*a2)
        v7 = v6 == 0;
      else
        v7 = 1;
      if (v7)
      {
        if (v6)
          v8 = -1;
        else
          v8 = 0;
        if (v5)
          v9 = 1;
        else
          v9 = v8;
        if (v9 < 0)
          goto LABEL_32;
      }
      else if ((objc_msgSend(v5, "compare:") & 0x80000000) != 0)
      {
        goto LABEL_32;
      }
      v10 = (void *)v3[4];
      v11 = *a2;
      if (v10)
        v12 = v11 == 0;
      else
        v12 = 1;
      if (v12)
      {
        if (v11)
          v13 = -1;
        else
          v13 = 0;
        if (v10)
          v14 = 1;
        else
          v14 = v13;
        if ((v14 & 0x80000000) == 0)
          return v4;
      }
      else if ((objc_msgSend(v10, "compare:") & 0x80000000) == 0)
      {
        return v4;
      }
      ++v3;
LABEL_32:
      v3 = (_QWORD *)*v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t **std::__tree<NSHolder<TIInputContextEntry>>::__emplace_unique_key_args<NSHolder<TIInputContextEntry>,NSHolder<TIInputContextEntry>>(uint64_t **a1, void **a2, uint64_t *a3)
{
  uint64_t **result;
  uint64_t **v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  result = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_equal<NSHolder<TIInputContextEntry>>((uint64_t)a1, &v9, a2);
  if (!*result)
  {
    v6 = result;
    v7 = (uint64_t *)operator new(0x28uLL);
    v8 = *a3;
    *a3 = 0;
    v7[4] = v8;
    return std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at(a1, v9, v6, v7);
  }
  return result;
}

void std::__tree<NSHolder<TIInputContextEntry>>::__assign_multi<std::__tree_const_iterator<NSHolder<TIInputContextEntry>,std::__tree_node<NSHolder<TIInputContextEntry>,void *> *,long>>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  _QWORD *v10;
  id *v11;
  uint64_t **leaf_high;
  _QWORD *v13;
  BOOL v14;
  uint64_t *i;
  uint64_t *v16;
  void *v17;
  uint64_t **v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  if (*(_QWORD *)(a1 + 16))
  {
    v6 = *(uint64_t **)a1;
    v7 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)a1 = a1 + 8;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)(a1 + 8) = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    if (!v8)
    {
      v16 = 0;
LABEL_23:
      std::__tree<NSHolder<TIInputContextEntry>>::destroy(v16);
      goto LABEL_24;
    }
    v9 = std::__tree<NSHolder<TIInputContextEntry>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
    if (a2 != a3)
    {
      v10 = a2;
      do
      {
        v11 = (id *)v8;
        v8 = v9;
        objc_storeStrong(v11 + 4, (id)v10[4]);
        leaf_high = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_leaf_high(a1, &v21, v11 + 4);
        std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)a1, v21, leaf_high, (uint64_t *)v11);
        if (v9)
          v9 = std::__tree<NSHolder<TIInputContextEntry>>::_DetachedTreeCache::__detach_next((uint64_t)v9);
        else
          v9 = 0;
        v13 = (_QWORD *)v10[1];
        if (v13)
        {
          do
          {
            a2 = v13;
            v13 = (_QWORD *)*v13;
          }
          while (v13);
        }
        else
        {
          do
          {
            a2 = (_QWORD *)v10[2];
            v14 = *a2 == (_QWORD)v10;
            v10 = a2;
          }
          while (!v14);
        }
        if (!v8)
          break;
        v10 = a2;
      }
      while (a2 != a3);
    }
    std::__tree<NSHolder<TIInputContextEntry>>::destroy(v8);
    if (v9)
    {
      for (i = (uint64_t *)v9[2]; i; i = (uint64_t *)i[2])
        v9 = i;
      v16 = v9;
      goto LABEL_23;
    }
  }
LABEL_24:
  if (a2 != a3)
  {
    do
    {
      v17 = operator new(0x28uLL);
      *((_QWORD *)v17 + 4) = (id)a2[4];
      v18 = (uint64_t **)std::__tree<NSHolder<TIInputContextEntry>>::__find_leaf_high(a1, &v21, (void **)v17 + 4);
      std::__tree<NSHolder<TIInputContextEntry>>::__insert_node_at((uint64_t **)a1, v21, v18, (uint64_t *)v17);
      v19 = (_QWORD *)a2[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (_QWORD *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (_QWORD *)a2[2];
          v14 = *v20 == (_QWORD)a2;
          a2 = v20;
        }
        while (!v14);
      }
      a2 = v20;
    }
    while (v20 != a3);
  }
}

_QWORD *std::__tree<NSHolder<TIInputContextEntry>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

_QWORD *std::__tree<NSHolder<TIInputContextEntry>>::__find_leaf_high(uint64_t a1, _QWORD *a2, void **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v7;
  uint64_t v8;
  int v10;
  int v11;
  _QWORD *result;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (!v4)
  {
    result = (_QWORD *)(a1 + 8);
    goto LABEL_20;
  }
  do
  {
    while (1)
    {
      v5 = v4;
      v7 = *a3;
      v8 = v4[4];
      if (!*a3 || v8 == 0)
        break;
      if ((objc_msgSend(v7, "compare:") & 0x80000000) == 0)
        goto LABEL_17;
LABEL_14:
      v4 = (_QWORD *)*v5;
      result = v5;
      if (!*v5)
        goto LABEL_20;
    }
    if (v8)
      v10 = -1;
    else
      v10 = 0;
    if (v7)
      v11 = 1;
    else
      v11 = v10;
    if (v11 < 0)
      goto LABEL_14;
LABEL_17:
    v4 = (_QWORD *)v5[1];
  }
  while (v4);
  result = v5 + 1;
LABEL_20:
  *a2 = v5;
  return result;
}

void setFromArray<TIInputContextEntry>(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = a1 + 8;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v9 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v8 = v9;
        std::__tree<NSHolder<TIInputContextEntry>>::__emplace_unique_key_args<NSHolder<TIInputContextEntry>,NSHolder<TIInputContextEntry>>((uint64_t **)a1, &v9, (uint64_t *)&v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

id arrayFromSet<TIInputContextEntry>(_QWORD *a1)
{
  void *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)*a1;
  v3 = a1 + 1;
  v4 = v5;
  if (v5 != v3)
  {
    do
    {
      objc_msgSend(v2, "addObject:", v4[4]);
      v6 = (_QWORD *)v4[1];
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v4[2];
          v8 = *v7 == (_QWORD)v4;
          v4 = v7;
        }
        while (!v8);
      }
      v4 = v7;
    }
    while (v7 != v3);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id getMCFeatureSpellCheckAllowed()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getMCFeatureSpellCheckAllowedSymbolLoc_ptr;
  v7 = getMCFeatureSpellCheckAllowedSymbolLoc_ptr;
  if (!getMCFeatureSpellCheckAllowedSymbolLoc_ptr)
  {
    v1 = (void *)ManagedConfigurationLibrary();
    v0 = (id *)dlsym(v1, "MCFeatureSpellCheckAllowed");
    v5[3] = (uint64_t)v0;
    getMCFeatureSpellCheckAllowedSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
    return *v0;
  dlerror();
  v3 = abort_report_np();
  return (id)__49__TIPreferencesController_synchronizePreferences__block_invoke(v3);
}

Class __getCloudSettingsManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudSettingsLibraryCore_frameworkLibrary)
  {
    CloudSettingsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CloudSettingsLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CloudSettingsManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getCloudSettingsManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("NPSManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void NotificationCallback(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v4 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __NotificationCallback_block_invoke;
  v6[3] = &unk_1E243AF88;
  v7 = v4;
  v8 = a3;
  v5 = v4;
  TIDispatchAsync(MEMORY[0x1E0C80D38], v6);

}

uint64_t __Block_byref_object_copy__8155(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8156(uint64_t a1)
{

}

void ___preferencesClientDispatchQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.TextInput.preferences-client", v2);
  v1 = (void *)_preferencesClientDispatchQueue___xpc_queue;
  _preferencesClientDispatchQueue___xpc_queue = (uint64_t)v0;

}

uint64_t isH13ANEPresentOnIOS()
{
  if (isH13ANEPresentOnIOS_onceToken != -1)
    dispatch_once(&isH13ANEPresentOnIOS_onceToken, &__block_literal_global_634);
  return isH13ANEPresentOnIOS_hasH13ANE;
}

uint64_t __isH13ANEPresentOnIOS_block_invoke()
{
  uint64_t result;

  result = MGIsQuestionValid();
  if ((_DWORD)result)
  {
    result = MGGetSInt64Answer();
    isH13ANEPresentOnIOS_hasH13ANE = result > 31;
  }
  return result;
}

BOOL TIStatisticShouldSample(uint32_t a1)
{
  return arc4random_uniform(0x64u) < a1;
}

void TIStatisticScalarAddValue(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aggdName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      IXADefaultLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "aggdName");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%s TIStatistic Aggd: %s=%lld"), "TIStatisticScalarAddValue", objc_msgSend(v10, "UTF8String"), a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIAggdReporter sharedAggdReporter](TIAggdReporter, "sharedAggdReporter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aggdName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addValue:forKey:", a2, v8);

    }
    routeCounterChangeThroughCoreAnalytics(v4, a2);
  }

}

void TIStatisticScalarSubtractValue(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aggdName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      IXADefaultLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "aggdName");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%s TIStatistic Aggd: %s=%lld"), "TIStatisticScalarSubtractValue", objc_msgSend(v10, "UTF8String"), a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIAggdReporter sharedAggdReporter](TIAggdReporter, "sharedAggdReporter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aggdName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subtractValue:forKey:", a2, v8);

    }
    routeCounterChangeThroughCoreAnalytics(v4, -a2);
  }

}

void TIStatisticScalarDecrement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "aggdName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      IXADefaultLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v2, "aggdName");
        v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%s TIStatistic Aggd: %s"), "TIStatisticScalarDecrement", objc_msgSend(v8, "UTF8String"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_debug_impl(&dword_18C56E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIAggdReporter sharedAggdReporter](TIAggdReporter, "sharedAggdReporter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "aggdName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "decrementKey:", v6);

    }
    routeCounterChangeThroughCoreAnalytics(v2, -1);
  }

}

void TIStatisticDistributionPushValue(void *a1, double a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "aggdName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      IXADefaultLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v4, "aggdName");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%s TIStatistic Aggd: %s=%f"), "TIStatisticDistributionPushValue", objc_msgSend(v10, "UTF8String"), *(_QWORD *)&a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_debug_impl(&dword_18C56E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      +[TIAggdReporter sharedAggdReporter](TIAggdReporter, "sharedAggdReporter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "aggdName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pushValue:forKey:", v8, a2);

    }
  }

}

id _GetStringByReplacingInvalidCharactersWithUnderscores(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet;
    if (!_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet)
    {
      objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("_"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addCharactersInRange:", 97, 26);
      objc_msgSend(v3, "addCharactersInRange:", 65, 26);
      objc_msgSend(v3, "addCharactersInRange:", 48, 10);
      objc_msgSend(v3, "invert");
      v4 = (void *)_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet;
      _GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet = (uint64_t)v3;

      v2 = (void *)_GetInvalidInputModeIdentifierCharacterSet___invalidCharacterSet;
    }
    v5 = v2;
    if (objc_msgSend(v1, "rangeOfCharacterFromSet:", v5) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v1;
    }
    else
    {
      objc_msgSend(v1, "_stringByReplacingCharactersInSet:withCharacter:", v5, 95);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

  }
  else
  {
    v7 = v1;
  }

  return v7;
}

id TIStatisticGetAutocorrectionKeyForInputMode(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.%@"), a2, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode(v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id TIStatisticGetKeyForInputStringCount(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.inputStringCount"), v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL _activeInputStringCountKey()
{
  unsigned int v0;

  if (_activeInputStringCountKey_onceToken != -1)
    dispatch_once(&_activeInputStringCountKey_onceToken, &__block_literal_global_8443);
  v0 = _activeInputStringCountKey__logIterationLimit;
  return arc4random() % _activeInputStringCountKey__logIterationLimit == v0 >> 1;
}

void ___activeInputStringCountKey_block_invoke()
{
  id v0;

  v0 = (id)CFPreferencesCopyValue(CFSTR("kbInputStringCount"), CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (objc_msgSend(v0, "unsignedIntValue"))
    _activeInputStringCountKey__logIterationLimit = objc_msgSend(v0, "unsignedIntValue");

}

void TIStatisticScalarIncrementInputStringCount(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  if (_activeInputStringCountKey())
  {
    TIStatisticGetKeyForInputStringCount((uint64_t)v5, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement(v4);

  }
}

void TIStatisticScalarIncrementAutocorrectionKey(void *a1, int a2, void *a3)
{
  id v5;
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
  void *v20;
  void *v21;
  id v22;

  v22 = a1;
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement(v7);

    if ((a2 & 2) == 0)
    {
LABEL_3:
      if ((a2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.capitalization"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v8);

  if ((a2 & 4) == 0)
  {
LABEL_4:
    if ((a2 & 8) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.diacritic"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v9);

  if ((a2 & 8) == 0)
  {
LABEL_5:
    if ((a2 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.prediction"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v10);

  if ((a2 & 0x10) == 0)
  {
LABEL_6:
    if ((a2 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.spacebar"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v11);

  if ((a2 & 0x20) == 0)
  {
LABEL_7:
    if ((a2 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.retro"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v12);

  if ((a2 & 0x40) == 0)
  {
LABEL_8:
    if ((a2 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.useradapted"), v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v13);

  if ((a2 & 0x100) == 0)
  {
LABEL_9:
    if ((a2 & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.userrecency"), v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v14);

  if ((a2 & 0x200) == 0)
  {
LABEL_10:
    if ((a2 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.userlearned"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v15);

  if ((a2 & 0x80) == 0)
  {
LABEL_11:
    if ((a2 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.multiwordprediction"), v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v16);

  if ((a2 & 0x400) == 0)
  {
LABEL_12:
    if ((a2 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.transposition"), v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v17);

  if ((a2 & 0x800) == 0)
  {
LABEL_13:
    if ((a2 & 0x1000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.insertKey"), v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v18);

  if ((a2 & 0x1000) == 0)
  {
LABEL_14:
    if ((a2 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.skipTouch"), v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v19);

  if ((a2 & 0x4000) == 0)
  {
LABEL_15:
    if ((a2 & 0x8000) == 0)
      goto LABEL_16;
LABEL_33:
    TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.substitution"), v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement(v21);

    if ((a2 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.nearTouch"), v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v20);

  if ((a2 & 0x8000) != 0)
    goto LABEL_33;
LABEL_16:
  if ((a2 & 0x10000) != 0)
  {
LABEL_17:
    TIStatisticGetAutocorrectionKeyForInputMode((uint64_t)v22, (uint64_t)CFSTR("autocorrection.hitTest"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement(v6);

  }
LABEL_18:

}

id TIStatisticGetKeyForCandidateAccepted(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  TISGetSafeInputModeIdentifier(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(v6, "length");
    _GetPrefixForDomain();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(".%@.%@.%@"), v5, v8, v6);
    else
      objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(".%@.%@"), v5, v8, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v13, v5, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id TIStatisticGetKeyForCandidateAcceptedSelectedSortingMethod(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  TISGetSafeInputModeIdentifier(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    _GetPrefixForDomain();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(".%@.%lu.%@.%@"), CFSTR("candidateAccepted.sortingMethod"), a1, v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v9, 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id TIStatisticGetKeyForTenKeyKeyTappedInKeyplane(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  TISGetSafeInputModeIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && objc_msgSend(v3, "length"))
  {
    _GetPrefixForDomain();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@.%@.%@"), CFSTR("tenKey.keyTappedInKeyplane"), v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v7, 0, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id TIStatisticGetKeyForTenKeyFlick(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  TISGetSafeInputModeIdentifier(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    _GetPrefixForDomain();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(".%@.%@"), CFSTR("tenKey.keyFlick"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v4, CFSTR("tenKey.keyFlick"), v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id TIStatisticGetKeyForTenKeyFlickPunctuation(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  TISGetSafeInputModeIdentifier(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    _GetPrefixForDomain();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(".%@.%@"), CFSTR("tenKey.keyFlickPunctuation"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v4, CFSTR("tenKey.keyFlickPunctuation"), v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id TIStatisticGetKeyForMultilingual(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a1;
  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v9)
        {
          v10 = v9;
          v11 = (void *)_GetSafeString___identifierToSafeIdentifier;
          if (!_GetSafeString___identifierToSafeIdentifier)
          {
            v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v13 = (void *)_GetSafeString___identifierToSafeIdentifier;
            _GetSafeString___identifierToSafeIdentifier = (uint64_t)v12;

            v11 = (void *)_GetSafeString___identifierToSafeIdentifier;
          }
          objc_msgSend(v11, "objectForKey:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            _GetStringByReplacingInvalidCharactersWithUnderscores(v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)_GetSafeString___identifierToSafeIdentifier, "setObject:forKey:", v14, v10);
          }

          if (v6)
          {
            objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("+%@"), v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v15;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v14);
            v6 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  _GetPrefixForDomain();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingFormat:", CFSTR(".%@.%@"), v20, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v17, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void TIStatisticScalarIncrementSystemKeyboardSummoned(void *a1)
{
  id v1;

  TIStatisticGetKeyForInputMode(CFSTR("summonedSystemKeyboard"), a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  TIStatisticScalarIncrement(v1);

}

void TIStatisticScalarIncrement3PKSummoned(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = a1;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("3PK.summonedKeyboard"), v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticGetKey(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement(v2);

  }
}

id TIStatisticGetKeyForOTA(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v5;
  v9 = v8;
  if (objc_msgSend(v6, "length"))
  {
    _GetStringByReplacingInvalidCharactersWithUnderscores(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(".%@"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "length"))
  {
    _GetStringByReplacingInvalidCharactersWithUnderscores(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(".%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }
  _GetPrefixForDomain();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(".%@"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[TIStatisticKey statisticKeyWithAggdName:andCounterName:andInputMode:](TIStatisticKey, "statisticKeyWithAggdName:andCounterName:andInputMode:", v14, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id TIStatisticsGetKeyForGesture(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKey(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t TIStatisticsGetIsCPDiscovered()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPDidDiscover"));

  return v1;
}

uint64_t __Block_byref_object_copy__9692(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9693(uint64_t a1)
{

}

id _getPreSmartSet()
{
  if (_getPreSmartSet_onceToken != -1)
    dispatch_once(&_getPreSmartSet_onceToken, &__block_literal_global_29);
  return (id)_getPreSmartSet__preSmartSet;
}

id _getPostSmartSet()
{
  if (_getPostSmartSet_onceToken != -1)
    dispatch_once(&_getPostSmartSet_onceToken, &__block_literal_global_33);
  return (id)_getPostSmartSet__postSmartSet;
}

void ___getPostSmartSet_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR(")].,;:?'!\"%*-/}>"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(v0, "addCharactersInRange:", 162, 1);
  objc_msgSend(v0, "addCharactersInRange:", 170, 2);
  objc_msgSend(v0, "addCharactersInRange:", 173, 2);
  objc_msgSend(v0, "addCharactersInRange:", 176, 1);
  objc_msgSend(v0, "addCharactersInRange:", 178, 3);
  objc_msgSend(v0, "addCharactersInRange:", 185, 3);
  objc_msgSend(v0, "addCharactersInRange:", 8208, 6);
  objc_msgSend(v0, "addCharactersInRange:", 8216, 2);
  objc_msgSend(v0, "addCharactersInRange:", 8220, 2);
  objc_msgSend(v0, "addCharactersInRange:", 8224, 2);
  objc_msgSend(v0, "addCharactersInRange:", 8228, 4);
  objc_msgSend(v0, "addCharactersInRange:", 8240, 5);
  objc_msgSend(v0, "addCharactersInRange:", 8250, 4);
  objc_msgSend(v0, "addCharactersInRange:", 8262, 4);
  objc_msgSend(v0, "addCharactersInRange:", 8240, 5);
  objc_msgSend(v0, "addCharactersInRange:", 8304, 37);
  objc_msgSend(v0, "addCharactersInRange:", 4352, 256);
  objc_msgSend(v0, "addCharactersInRange:", 11904, 352);
  objc_msgSend(v0, "addCharactersInRange:", 12272, 464);
  objc_msgSend(v0, "addCharactersInRange:", 12800, 29392);
  objc_msgSend(v0, "addCharactersInRange:", 44032, 11183);
  objc_msgSend(v0, "addCharactersInRange:", 63744, 352);
  objc_msgSend(v0, "addCharactersInRange:", 65072, 32);
  objc_msgSend(v0, "addCharactersInRange:", 65280, 240);
  objc_msgSend(v0, "addCharactersInRange:", 0x20000, 42711);
  objc_msgSend(v0, "addCharactersInRange:", 194560, 542);
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v2);

  v3 = (void *)_getPostSmartSet__postSmartSet;
  _getPostSmartSet__postSmartSet = (uint64_t)v0;

}

void ___getPreSmartSet_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(v0, "addCharactersInRange:", 161, 1);
  objc_msgSend(v0, "addCharactersInRange:", 163, 3);
  objc_msgSend(v0, "addCharactersInRange:", 167, 1);
  objc_msgSend(v0, "addCharactersInRange:", 169, 1);
  objc_msgSend(v0, "addCharactersInRange:", 171, 4);
  objc_msgSend(v0, "addCharactersInRange:", 177, 1);
  objc_msgSend(v0, "addCharactersInRange:", 182, 1);
  objc_msgSend(v0, "addCharactersInRange:", 187, 1);
  objc_msgSend(v0, "addCharactersInRange:", 191, 1);
  objc_msgSend(v0, "addCharactersInRange:", 8208, 6);
  objc_msgSend(v0, "addCharactersInRange:", 8216, 8);
  objc_msgSend(v0, "addCharactersInRange:", 8226, 6);
  objc_msgSend(v0, "addCharactersInRange:", 8249, 1);
  objc_msgSend(v0, "addCharactersInRange:", 8259, 3);
  objc_msgSend(v0, "addCharactersInRange:", 8352, 22);
  objc_msgSend(v0, "addCharactersInRange:", 4352, 256);
  objc_msgSend(v0, "addCharactersInRange:", 11904, 352);
  objc_msgSend(v0, "addCharactersInRange:", 12272, 464);
  objc_msgSend(v0, "addCharactersInRange:", 12800, 29392);
  objc_msgSend(v0, "addCharactersInRange:", 44032, 11183);
  objc_msgSend(v0, "addCharactersInRange:", 63744, 352);
  objc_msgSend(v0, "addCharactersInRange:", 65072, 32);
  objc_msgSend(v0, "addCharactersInRange:", 65280, 240);
  objc_msgSend(v0, "addCharactersInRange:", 0x20000, 42711);
  objc_msgSend(v0, "addCharactersInRange:", 194560, 542);
  v2 = (void *)_getPreSmartSet__preSmartSet;
  _getPreSmartSet__preSmartSet = (uint64_t)v0;

}

void ___getRegularWhiteSet_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" "));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_getRegularWhiteSet__regularWhiteSet;
  _getRegularWhiteSet__regularWhiteSet = v0;

}

id TIImageCacheOSLogFacility()
{
  if (TIImageCacheOSLogFacility_onceToken != -1)
    dispatch_once(&TIImageCacheOSLogFacility_onceToken, &__block_literal_global_10811);
  return (id)TIImageCacheOSLogFacility_logFacility;
}

void release_munmap(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  size_t v6;

  v4 = *a1;
  v5 = (void *)(a2 - v4);
  v6 = v4 + a3;
  munlock((const void *)(a2 - v4), v4 + a3);
  munmap(v5, v6);
  free(a1);
}

uint64_t SecurityLibrary_10844()
{
  uint64_t v0;
  void *v2;

  if (SecurityLibraryCore_frameworkLibrary_10852)
    return SecurityLibraryCore_frameworkLibrary_10852;
  SecurityLibraryCore_frameworkLibrary_10852 = _sl_dlopen();
  v0 = SecurityLibraryCore_frameworkLibrary_10852;
  if (!SecurityLibraryCore_frameworkLibrary_10852)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t TIImageCacheVersion()
{
  if (TIImageCacheVersion_onceToken != -1)
    dispatch_once(&TIImageCacheVersion_onceToken, &__block_literal_global_16_10840);
  return TIImageCacheVersion_buildVersion;
}

unint64_t TIImageCacheSizeForItem(double a1, double a2, double a3)
{
  return CGBitmapGetAlignedBytesPerRow() * vcvtpd_u64_f64(a2 * a3);
}

uint64_t __Block_byref_object_copy__11039(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11040(uint64_t a1)
{

}

uint64_t TIKeyboardTypeIsNumberPad(unsigned int a1)
{
  return (a1 < 0xE) & (0x2930u >> a1);
}

void __shouldOptOutForSelector_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E24B41A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldOptOutForSelector___knownSelectors;
  shouldOptOutForSelector___knownSelectors = v0;

}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInRange(CFAllocatorRef alloc, CFRange theRange)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E0](alloc, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1E0C98328](theSet, *(_QWORD *)&theChar);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C68](allocator, activities, repeats, order, block);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

uint64_t CFStringGetRangeOfCharacterClusterAtIndex()
{
  return MEMORY[0x1E0C99158]();
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x1E0C99218](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1E0C99248](string, range, transform, reverse);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x1E0C9BB98]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x1E0C9CD00](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x1E0C9CDC0]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetSInt64Answer()
{
  return MEMORY[0x1E0DE2B78]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

void operator delete(void *__p)
{
  off_1E24385F8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E2438600(__sz);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C841D0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C84218](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1E0DE87B8](a1, *(_QWORD *)&onoff);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1E0DE5958](*(_QWORD *)&c);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1E0DE5978](*(_QWORD *)&c);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1E0DE59C0](*(_QWORD *)&c, *(_QWORD *)&which);
}

UBool u_hasBinaryProperty(UChar32 c, UProperty which)
{
  return MEMORY[0x1E0DE59E0](*(_QWORD *)&c, *(_QWORD *)&which);
}

uint64_t ubidi_getBaseDirection()
{
  return MEMORY[0x1E0DE5BE8]();
}

UBlockCode ublock_getCode(UChar32 c)
{
  return MEMORY[0x1E0DE5C88](*(_QWORD *)&c);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t uscript_getScript()
{
  return MEMORY[0x1E0DE6898]();
}

uint64_t uscript_hasScript()
{
  return MEMORY[0x1E0DE68B0]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x1E0DE69A0]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

