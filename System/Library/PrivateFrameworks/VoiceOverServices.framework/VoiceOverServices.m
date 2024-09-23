void sub_21137AF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21137B18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21137B984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
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

void sub_21137C804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21137CA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id VOSVoiceOverBundle()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)VOSVoiceOverBundle__votBundle;
  if (!VOSVoiceOverBundle__votBundle)
  {
    objc_msgSend(&stru_24CBADC48, "stringByAppendingString:", CFSTR("/System/Library/CoreServices/VoiceOverTouch.app"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)VOSVoiceOverBundle__votBundle;
    VOSVoiceOverBundle__votBundle = v2;

    v0 = (void *)VOSVoiceOverBundle__votBundle;
  }
  return v0;
}

id _AXUISettingsAccessibilityBundle()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDD1488];
  AXSystemRootDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/System/Library/PreferenceBundles/AccessibilitySettings.bundle"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXVoiceOverSettingsTypingFeedbackLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _AXUISettingsAccessibilityBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("VoiceOverTypingFeedback"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXSettingsLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _AXUISettingsAccessibilityBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("Accessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXVoiceOverSettingsLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _AXUISettingsAccessibilityBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("VoiceOverSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXVoiceOverBrailleOptionsLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  _AXUISettingsAccessibilityBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("VoiceOverBrailleOptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id AXVoiceOverLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  VOSVoiceOverBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("VOTLocalizedStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t VOSProcessAllowsScreenRecognition(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (VOSProcessAllowsScreenRecognition_onceToken != -1)
  {
    dispatch_once(&VOSProcessAllowsScreenRecognition_onceToken, &__block_literal_global_4);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  v3 = objc_msgSend((id)VOSProcessAllowsScreenRecognition_UnsupportedApps, "containsObject:", v2) ^ 1;
LABEL_6:

  return v3;
}

id VOSVoiceOverServicesBundle()
{
  if (VOSVoiceOverServicesBundle_onceToken != -1)
    dispatch_once(&VOSVoiceOverServicesBundle_onceToken, &__block_literal_global_194);
  return (id)VOSVoiceOverServicesBundle__Bundle;
}

uint64_t VOSCustomBrailleEnabled()
{
  return _os_feature_enabled_impl();
}

id VOSBrailleTableForRotorItem(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v1 = (void *)MEMORY[0x24BE00658];
  v2 = a1;
  objc_msgSend(v1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Default"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LanguageDefaults"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v7;
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("RotorItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v9)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE0FC68], "defaultTableForLocale:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

id VOSDefaultBrailleTable()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "voiceOverBrailleLanguageRotorItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v1, "count"))
  {
    v2 = 0;
    while (1)
    {
      objc_msgSend(v1, "objectAtIndex:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Default"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLValue");

      if (v5)
        break;

      if (++v2 >= (unint64_t)objc_msgSend(v1, "count"))
        goto LABEL_5;
    }
    VOSBrailleTableForRotorItem(v3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FC68], "defaultTableForLocale:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

void VOSRepairBrailleTableSettings()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "voiceOverTouchBrailleDisplayOutputTableIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("com."));

  if ((v2 & 1) == 0)
  {
    VOSDefaultBrailleTable();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVoiceOverTouchBrailleDisplayOutputTableIdentifier:", v4);

  }
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceOverTouchBrailleDisplayInputTableIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("com."));

  if ((v8 & 1) == 0)
  {
    VOSDefaultBrailleTable();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setVoiceOverTouchBrailleDisplayInputTableIdentifier:", v10);

  }
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "voiceOverTouchBrailleGesturesInputTableIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("com."));

  if ((v14 & 1) == 0)
  {
    VOSFirstGesturesCompatibleBrailleTable();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVoiceOverTouchBrailleGesturesInputTableIdentifier:", v15);

  }
}

id VOSFirstGesturesCompatibleBrailleTable()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "voiceOverBrailleLanguageRotorItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "ax_filteredArrayUsingBlock:", &__block_literal_global_211);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count"))
  {
    v3 = 0;
    while (1)
    {
      objc_msgSend(v2, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      VOSBrailleTableForRotorItem(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!_os_feature_enabled_impl() || AXDeviceIsPad())
        break;
      v6 = objc_msgSend(v5, "supportsTranslationMode8Dot");

      if (!v6)
        goto LABEL_9;
      if (++v3 >= (unint64_t)objc_msgSend(v2, "count"))
        goto LABEL_7;
    }

LABEL_9:
    objc_msgSend(v2, "objectAtIndex:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    VOSBrailleTableForRotorItem(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

id _VOSCrystalReplacementForTableIdentifier(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", v3);
    objc_msgSend(v4, "replacements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      if ((unint64_t)(a2 - 1) > 2)
        v6 = (void *)MEMORY[0x24BDBD1A8];
      else
        v6 = *(&off_24CBAC378 + a2 - 1);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = v5;
      v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v19)
      {
        v10 = *(_QWORD *)v25;
        v18 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(v9);
            v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            v20 = 0u;
            v21 = 0u;
            v22 = 0u;
            v23 = 0u;
            v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16, v18);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v21;
              while (2)
              {
                for (j = 0; j != v14; ++j)
                {
                  if (*(_QWORD *)v21 != v15)
                    objc_enumerationMutation(v6);
                  if ((objc_msgSend(v12, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j)) & 1) != 0)
                  {
                    v7 = v12;

                    goto LABEL_26;
                  }
                }
                v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
                if (v14)
                  continue;
                break;
              }
            }
            v10 = v18;
          }
          v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v19);
      }

      objc_msgSend(v9, "firstObject");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v3;
    }
    v7 = v8;
LABEL_26:

  }
  else
  {
    VOSDefaultBrailleTable();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t _VOSHasReplaceableTableInRotorItems()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "voiceOverBrailleLanguageRotorItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        VOSBrailleTableForRotorItem(*(void **)(*((_QWORD *)&v10 + 1) + 8 * i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "replacements", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "count");

        if (v8)
        {
          v3 = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

void VOSCrystalMigrateBrailleTableReplacements()
{
  void *v0;
  void *v1;
  int v2;
  int v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
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
  void *v76;
  id obj;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  void *v93;
  void *v94;
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[2];
  _QWORD v98[2];
  void *v99;
  void *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "objectForKey:", CFSTR("_AccessibilityMigration__BrailleTableReplacements_18"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLValue");

    v3 = _VOSHasReplaceableTableInRotorItems();
    if (!v2 || v3 != 0)
    {
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "voiceOverBrailleTableIdentifier");
      v6 = objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        VOSDefaultBrailleTable();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifier");
        v6 = objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x24BE00658], "sharedInstance", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userLocale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "voiceOverBrailleLanguageRotorItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_opt_new();
      v13 = (void *)objc_opt_new();
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      obj = v11;
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
      if (v81)
      {
        v80 = *(_QWORD *)v89;
        v76 = v9;
        do
        {
          for (i = 0; i != v81; ++i)
          {
            if (*(_QWORD *)v89 != v80)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Default"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "BOOLValue");

            if (v17)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("LanguageDefaults"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "localeIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v19);
              v20 = objc_claimAutoreleasedReturnValue();

              v78 = (void *)v20;
              if (v20)
              {
                v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", v20);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BE0FC68], "defaultTableForLocale:", v9);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v33 = v21;
              v83 = i;
              objc_msgSend(v21, "replacements");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "count");

              if (v35)
              {
                objc_msgSend(v33, "replacements");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "firstObject");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v13, "addObject:", v37);
                v38 = (void *)objc_msgSend(v15, "mutableCopy");
                objc_msgSend(v9, "localeIdentifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = v39;
                v100 = v37;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
                v40 = v33;
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "setObject:forKeyedSubscript:", v41, CFSTR("LanguageDefaults"));

                objc_msgSend(v12, "addObject:", v38);
                objc_msgSend(v40, "replacements");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "count");

                if (v43 >= 2)
                {
                  v44 = 1;
                  do
                  {
                    objc_msgSend(v40, "replacements");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "objectAtIndex:", v44);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();

                    if ((objc_msgSend(v13, "containsObject:", v46) & 1) == 0)
                    {
                      v97[0] = CFSTR("Enabled");
                      v97[1] = CFSTR("RotorItem");
                      v98[0] = MEMORY[0x24BDBD1C8];
                      v98[1] = v46;
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "addObject:", v47);

                      objc_msgSend(v13, "addObject:", v46);
                    }

                    ++v44;
                    objc_msgSend(v40, "replacements");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    v49 = objc_msgSend(v48, "count");

                  }
                  while (v44 < v49);
                }

                i = v83;
                v9 = v76;
                v24 = v40;
LABEL_39:

              }
              else
              {
                v95[0] = CFSTR("Default");
                v95[1] = CFSTR("Enabled");
                v96[0] = MEMORY[0x24BDBD1C8];
                v96[1] = MEMORY[0x24BDBD1C8];
                v95[2] = CFSTR("LanguageDefaults");
                objc_msgSend(v9, "localeIdentifier");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v93 = v52;
                objc_msgSend(v33, "identifier");
                v53 = v9;
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = v54;
                v55 = v33;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v96[2] = v56;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v57);

                v24 = v55;
                v9 = v53;

                i = v83;
                if (v24)
                {
                  objc_msgSend(v24, "identifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "addObject:", v37);
                  goto LABEL_39;
                }
              }

              goto LABEL_41;
            }
            v22 = objc_alloc(MEMORY[0x24BE0FC60]);
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("RotorItem"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v22, "initWithIdentifier:", v23);

            objc_msgSend(v24, "replacements");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "count");

            if (v26)
            {
              v86 = 0u;
              v87 = 0u;
              v84 = 0u;
              v85 = 0u;
              objc_msgSend(v24, "replacements");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
              if (v27)
              {
                v28 = v27;
                v79 = v24;
                v82 = i;
                v29 = *(_QWORD *)v85;
                do
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v85 != v29)
                      objc_enumerationMutation(v18);
                    v31 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
                    if ((objc_msgSend(v13, "containsObject:", v31) & 1) == 0)
                    {
                      v32 = (void *)objc_msgSend(v15, "mutableCopy");
                      objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, CFSTR("RotorItem"));
                      objc_msgSend(v12, "addObject:", v32);
                      objc_msgSend(v13, "addObject:", v31);

                    }
                  }
                  v28 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
                }
                while (v28);
                v9 = v76;
                i = v82;
                v24 = v79;
              }
            }
            else
            {
              objc_msgSend(v24, "identifier");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v13, "containsObject:", v50);

              if ((v51 & 1) != 0)
                goto LABEL_42;
              objc_msgSend(v12, "addObject:", v15);
              objc_msgSend(v24, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v18);
            }
LABEL_41:

LABEL_42:
          }
          v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v101, 16);
        }
        while (v81);
      }
      v58 = v9;

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setVoiceOverBrailleLanguageRotorItems:", v12);

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v75;
      _VOSCrystalReplacementForTableIdentifier(v75, objc_msgSend(v60, "voiceOverTouchBrailleDisplayOutputMode"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      _VOSCrystalReplacementForTableIdentifier(v75, objc_msgSend(v63, "voiceOverTouchBrailleDisplayInputMode"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      _VOSCrystalReplacementForTableIdentifier(v75, objc_msgSend(v65, "voiceOverTouchBrailleGesturesInputMode"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0FC60]), "initWithIdentifier:", v66);
      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setVoiceOverTouchBrailleDisplayOutputTableIdentifier:", v62);

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setVoiceOverTouchBrailleDisplayInputTableIdentifier:", v64);

      objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "setVoiceOverTouchBrailleDisplaySyncInputOutputTables:", 0);

      if (objc_msgSend(v67, "supportsTranslationMode8Dot") && (AXDeviceIsPad() & 1) == 0)
      {
        VOSFirstGesturesCompatibleBrailleTable();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "identifier");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setVoiceOverTouchBrailleGesturesInputTableIdentifier:", v72);

        v61 = v75;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setVoiceOverTouchBrailleGesturesInputTableIdentifier:", v66);
      }

      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("_AccessibilityMigration__BrailleTableReplacements_18"));

    }
  }
}

id VOSLocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  VOSVoiceOverServicesBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("VoiceOverServices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id soft_AXUILocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getAXUILocalizedStringForKeySymbolLoc_ptr;
  v10 = getAXUILocalizedStringForKeySymbolLoc_ptr;
  if (!getAXUILocalizedStringForKeySymbolLoc_ptr)
  {
    v3 = (void *)AccessibilityUIUtilitiesLibrary();
    v2 = dlsym(v3, "AXUILocalizedStringForKey");
    v8[3] = (uint64_t)v2;
    getAXUILocalizedStringForKeySymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v6 = (_Unwind_Exception *)soft_AXUILocalizedStringForKey_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  ((void (*)(id))v2)(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t AccessibilityUIUtilitiesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AccessibilityUIUtilitiesLibraryCore_frameworkLibrary;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_211396DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getUIAlertControllerClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UIAlertController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIAlertControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIAlertControllerClass_block_invoke_cold_1();
    UIKitLibrary();
  }
}

void UIKitLibrary()
{
  void *v0;

  if (!UIKitLibraryCore_frameworkLibrary)
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

VOSOutputEventDispatcher *__getUIAlertActionClass_block_invoke(uint64_t a1)
{
  VOSOutputEventDispatcher *result;
  void *v3;
  SEL v4;

  UIKitLibrary();
  result = (VOSOutputEventDispatcher *)objc_getClass("UIAlertAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIAlertActionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getUIAlertActionClass_block_invoke_cold_1();
    return +[VOSOutputEventDispatcher sharedInstance](v3, v4);
  }
  return result;
}

void sub_21139C37C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id getUIAlertActionClass()
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
  v0 = (void *)getUIAlertActionClass_softClass_0;
  v7 = getUIAlertActionClass_softClass_0;
  if (!getUIAlertActionClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIAlertActionClass_block_invoke_0;
    v3[3] = &unk_24CBAD828;
    v3[4] = &v4;
    __getUIAlertActionClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21139C5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIDeviceClass_block_invoke(uint64_t a1)
{
  Class result;

  UIKitLibrary_0();
  result = objc_getClass("UIDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getUIDeviceClass_block_invoke_cold_1();
  getUIDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void UIKitLibrary_0()
{
  void *v0;

  if (!UIKitLibraryCore_frameworkLibrary_0)
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

VOSOutputEventCategory *__getUIAlertControllerClass_block_invoke_0(uint64_t a1)
{
  VOSOutputEventCategory *result;
  uint64_t v3;

  UIKitLibrary_0();
  result = (VOSOutputEventCategory *)objc_getClass("UIAlertController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIAlertControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUIAlertControllerClass_block_invoke_cold_1();
    return __getUIAlertActionClass_block_invoke_0(v3);
  }
  return result;
}

VOSOutputEventCategory *__getUIAlertActionClass_block_invoke_0(uint64_t a1)
{
  VOSOutputEventCategory *result;
  void *v3;
  SEL v4;

  UIKitLibrary_0();
  result = (VOSOutputEventCategory *)objc_getClass("UIAlertAction");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIAlertActionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getUIAlertActionClass_block_invoke_cold_1();
    return +[VOSOutputEventCategory interaction](v3, v4);
  }
  return result;
}

uint64_t soft_AXUILocalizedStringForKey_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getUIAlertControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getUIAlertControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUIAlertActionClass_block_invoke_cold_1(v0);
}

uint64_t __getUIAlertActionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __38__VOSOutputEventDispatcher_sendEvent___block_invoke_cold_1(v0);
}

void __getUIDeviceClass_block_invoke_cold_1()
{
  abort_report_np();
  AXAppNameForBundleId();
}

uint64_t AXAppNameForBundleId()
{
  return MEMORY[0x24BDFFC60]();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFFED0]();
}

uint64_t AXDeviceHasForcePress3dTouch()
{
  return MEMORY[0x24BDFFF50]();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x24BDFFF80]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFFF90]();
}

uint64_t AXDeviceIsTV()
{
  return MEMORY[0x24BDFFFB8]();
}

uint64_t AXDeviceIsWatch()
{
  return MEMORY[0x24BDFFFC8]();
}

uint64_t AXDeviceSupportsBackTap()
{
  return MEMORY[0x24BDFFFD8]();
}

uint64_t AXDeviceSupportsManyTouches()
{
  return MEMORY[0x24BE00010]();
}

uint64_t AXDeviceSupportsQuickNote()
{
  return MEMORY[0x24BE00028]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x24BE000D0]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BE00198]();
}

uint64_t AXLogBrailleHW()
{
  return MEMORY[0x24BE001F8]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BE00260]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x24BE00280]();
}

uint64_t AXParameterizedLocalizedString()
{
  return MEMORY[0x24BE00288]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXRuntimeCheck_HasANE()
{
  return MEMORY[0x24BE00340]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x24BE00428]();
}

uint64_t AXVoiceNameForVoiceId()
{
  return MEMORY[0x24BE00450]();
}

uint64_t AXVoiceOverRotorLocString()
{
  return MEMORY[0x24BE00478]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x24BE66EB8]();
}

uint64_t BTDeviceGetSupportedServices()
{
  return MEMORY[0x24BE66F00]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t VOTLogBraille()
{
  return MEMORY[0x24BE007D8]();
}

uint64_t VOTLogCommon()
{
  return MEMORY[0x24BE007E0]();
}

uint64_t _AXSVibrationDisabled()
{
  return MEMORY[0x24BED2588]();
}

uint64_t _AXSVoiceOverTouchCopyBrailleLanguageRotorItems()
{
  return MEMORY[0x24BED25A0]();
}

uint64_t _AXSVoiceOverTouchCopyTactileGraphicsDisplay()
{
  return MEMORY[0x24BED25A8]();
}

uint64_t _AXSVoiceOverTouchSetTactileGraphicsDisplay()
{
  return MEMORY[0x24BED25D0]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BE00818]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x24BE00820]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x24BE00880]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

