@implementation TUIPreferencesController

- (id)suggestedDictationModesForKeyboardLanguages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *i;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  TUISuggestedInputMode *v48;
  void *v49;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  id obj;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[5];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateEnabledDictationLanguages:", 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v3;
  v59 = v8;
  v62 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
  if (v62)
  {
    v57 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v62; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v57)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "defaultDictationLanguagesForKeyboardLanguage:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        if (objc_msgSend(v11, "count"))
        {
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v74;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v74 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(v4, "setObject:forKey:", v10, *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j));
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v89, 16);
            }
            while (v14);
          }

          objc_msgSend(v60, "addObjectsFromArray:", v12);
        }
        else
        {
          objc_msgSend(v60, "addObject:", v10);
        }
        if (objc_msgSend(v11, "count"))
        {
          v17 = v11;
        }
        else
        {
          v88 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v70;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v70 != v21)
                objc_enumerationMutation(v18);
              MEMORY[0x18D7872FC](*(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v5, "containsObject:", v23))
                v24 = v6;
              else
                v24 = v5;
              objc_msgSend(v24, "addObject:", v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v69, v87, 16);
          }
          while (v20);
        }

        v8 = v59;
      }
      v62 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
    }
    while (v62);
  }

  objc_msgSend(v60, "array");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v63 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v66;
    v53 = *(_QWORD *)v66;
    do
    {
      v28 = 0;
      v61 = v26;
      do
      {
        if (*(_QWORD *)v66 != v27)
          objc_enumerationMutation(v63);
        v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v28);
        v82 = 0;
        v83 = &v82;
        v84 = 0x2050000000;
        v30 = (void *)getAFDictationConnectionClass_softClass;
        v85 = getAFDictationConnectionClass_softClass;
        if (!getAFDictationConnectionClass_softClass)
        {
          v81[0] = MEMORY[0x1E0C809B0];
          v81[1] = 3221225472;
          v81[2] = __getAFDictationConnectionClass_block_invoke;
          v81[3] = &unk_1E24FBD38;
          v81[4] = &v82;
          __getAFDictationConnectionClass_block_invoke((uint64_t)v81);
          v30 = (void *)v83[3];
        }
        v31 = objc_retainAutorelease(v30);
        _Block_object_dispose(&v82, 8);
        v64 = 0;
        v32 = objc_msgSend(v31, "dictationIsSupportedForLanguageCode:error:", v29, &v64);
        v33 = v64;
        if (v32)
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "localizedStringForKey:value:table:", v29, &stru_1E24FC6C0, CFSTR("Dictation"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v35, "length"))
          {
            objc_msgSend(v4, "objectForKey:", v29);
            v36 = objc_claimAutoreleasedReturnValue();
            v37 = (void *)v36;
            if (!v36)
              v36 = (uint64_t)v29;
            MEMORY[0x18D7872FC](v36);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v6, "containsObject:", v38);

            if (v39)
            {
              objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v29);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "countryCode");
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              v58 = v41;
              if (objc_msgSend(v41, "length"))
              {
                objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "stringByAppendingString:", CFSTR("_long"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "localizedStringForKey:value:table:", v43, &stru_1E24FC6C0, CFSTR("Dictation"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                v44 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "localizedStringForCountryCode:", v58);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "localizedStringWithFormat:", v52, v46);
                v51 = objc_claimAutoreleasedReturnValue();

                v35 = (void *)v51;
              }
              v27 = v53;

            }
            else
            {
              v27 = v53;
            }
          }
          if (!objc_msgSend(v35, "length") || objc_msgSend(v35, "hasPrefix:", v29))
          {
            TUIKeyboardDisplayNameFromIdentifierForContext(v29, 3);
            v47 = objc_claimAutoreleasedReturnValue();

            v35 = (void *)v47;
          }
          v48 = objc_alloc_init(TUISuggestedInputMode);
          -[TUISuggestedInputMode setDisplayName:](v48, "setDisplayName:", v35);
          -[TUISuggestedInputMode setIdentifier:](v48, "setIdentifier:", v29);
          objc_msgSend(v54, "objectForKey:", v29);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUISuggestedInputMode setEnabled:](v48, "setEnabled:", objc_msgSend(v49, "BOOLValue"));

          objc_msgSend(v55, "addObject:", v48);
          v26 = v61;
        }

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v65, v86, 16);
    }
    while (v26);
  }

  return v55;
}

+ (id)sharedPreferencesController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TUIPreferencesController_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_token != -1)
    dispatch_once(&sharedPreferencesController_token, block);
  return (id)sharedPreferencesController_sharedPreferencesController;
}

void __55__TUIPreferencesController_sharedPreferencesController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedPreferencesController_sharedPreferencesController;
  sharedPreferencesController_sharedPreferencesController = v0;

}

@end
