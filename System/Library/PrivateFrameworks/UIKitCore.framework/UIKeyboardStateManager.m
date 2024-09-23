@implementation UIKeyboardStateManager

void __65___UIKeyboardStateManager_generateAutofillCandidateByAddingTask___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "usesCandidateSelection");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    if ((objc_msgSend(v4, "_hasMarkedText") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 32), "committingCandidate") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "generateCandidatesWithOptions:", 2);
    }
    objc_msgSend(v5, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(v4, "generateAutocorrectionWithExecutionContext:", v5);
  }

}

void __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  _BOOL4 v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  _QWORD v60[5];
  char v61;
  char v62;
  char v63;
  char v64;
  BOOL v65;
  char v66;
  _QWORD block[4];
  id v68;
  id v69;
  _QWORD v70[6];
  _QWORD v71[6];
  _QWORD v72[6];
  _QWORD v73[8];

  v73[6] = *MEMORY[0x1E0C80C00];
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = *MEMORY[0x1E0DBE248];
  v59 = objc_msgSend(v3, "BOOLForPreferenceKey:");

  v4 = *(unsigned __int8 *)(a1 + 48);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v51 = *MEMORY[0x1E0DBE1D0];
  v52 = *MEMORY[0x1E0DBDF68];
  if (v4)
    v8 = *MEMORY[0x1E0DBDF68];
  else
    v8 = *MEMORY[0x1E0DBE1D0];
  v58 = objc_msgSend(v6, "BOOLForPreferenceKey:", v8);

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferencesActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0DBDE08];
  v57 = objc_msgSend(v10, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBDE08]);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 776));
  if (objc_msgSend(WeakRetained, "rivenPreference"))
  {
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferencesActions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForPreferenceKey:", *MEMORY[0x1E0DBEA70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v56 = v16 > 0.00000011921;

  }
  else
  {
    v56 = 0;
  }

  v17 = *(unsigned __int8 *)(a1 + 48);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferencesActions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = *MEMORY[0x1E0DBE378];
  v22 = *MEMORY[0x1E0DBDF90];
  if (v17)
    v23 = *MEMORY[0x1E0DBDF90];
  else
    v23 = *MEMORY[0x1E0DBE378];
  v55 = objc_msgSend(v19, "BOOLForPreferenceKey:", v23);

  v24 = *(unsigned __int8 *)(a1 + 48);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "preferencesActions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  v28 = *MEMORY[0x1E0DBE1D8];
  v29 = *MEMORY[0x1E0DBDF70];
  if (v24)
    v30 = *MEMORY[0x1E0DBDF70];
  else
    v30 = *MEMORY[0x1E0DBE1D8];
  v31 = objc_msgSend(v26, "BOOLForPreferenceKey:", v30);

  v32 = MEMORY[0x1E0C809B0];
  v33 = &qword_186677000;
  if (*(_QWORD *)(a1 + 40))
  {
    v54 = v31;
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "preferencesActions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *MEMORY[0x1E0DBE2F8];
    objc_msgSend(v35, "valueForPreferenceKey:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 48))
    {
      v72[0] = v53;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v37;
      v72[1] = v52;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v38;
      v72[2] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v73[2] = v39;
      v72[3] = *MEMORY[0x1E0DBEA70];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v56);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v73[3] = v40;
      v72[4] = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v73[4] = v41;
      v72[5] = v29;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v54);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v73[5] = v42;
      v43 = (void *)MEMORY[0x1E0C99D80];
      v44 = v73;
      v45 = v72;
    }
    else
    {
      v70[0] = v53;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v59);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v37;
      v70[1] = v51;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v58);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v38;
      v70[2] = v11;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v57);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v71[2] = v39;
      v70[3] = *MEMORY[0x1E0DBEA70];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v56);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v71[3] = v40;
      v70[4] = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v71[4] = v41;
      v70[5] = v28;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v54);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v71[5] = v42;
      v43 = (void *)MEMORY[0x1E0C99D80];
      v44 = v71;
      v45 = v70;
    }
    objc_msgSend(v43, "dictionaryWithObjects:forKeys:count:", v44, v45, 6);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "mutableCopy");

    if (v36)
      objc_msgSend(v47, "setValue:forKey:", v36, v50);
    v32 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    v33 = &qword_186677000;
    block[1] = 3221225472;
    block[2] = __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_2;
    block[3] = &unk_1E16B2F48;
    v48 = *(id *)(a1 + 40);
    v68 = v47;
    v69 = v48;
    v49 = v47;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    LOBYTE(v31) = v54;
  }
  v60[0] = v32;
  v60[1] = v33[481];
  v60[2] = __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_3;
  v60[3] = &unk_1E16BAFC0;
  v60[4] = *(_QWORD *)(a1 + 32);
  v61 = v59;
  v62 = v57;
  v63 = v31;
  v64 = v58;
  v65 = v56;
  v66 = v55;
  dispatch_async(MEMORY[0x1E0C80D38], v60);
}

uint64_t __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53___UIKeyboardStateManager_updateDefaultsWithResults___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
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
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  _BYTE *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 776));
  objc_msgSend((id)objc_opt_class(), "suppressSetPersistentOffset:", 1);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 515) = *(_BYTE *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 41);
  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 776));
  objc_msgSend(v4, "setAutomaticMinimizationEnabled:", v3);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = *(_BYTE *)(a1 + 42);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAutocorrectionEnabled:", objc_msgSend(*(id *)(a1 + 32), "_updateAutocorrectionPreferenceForTraitsWithCurrentPreference:", *(unsigned __int8 *)(a1 + 42)) != 0);
  objc_msgSend(*(id *)(a1 + 32), "setAutocorrectSpellingEnabled:", *(unsigned __int8 *)(a1 + 42));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 519) = *(_BYTE *)(a1 + 43);
  objc_msgSend(*(id *)(a1 + 32), "updateInputManagerAutocapitalizationType");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setInlineCompletionEnabled:", objc_msgSend(*(id *)(a1 + 32), "isInlineCompletionEnabled"));
  objc_msgSend(*(id *)(a1 + 32), "takeTextInputTraitsFromDelegate");
  objc_msgSend(*(id *)(a1 + 32), "UILanguagePreference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)UIKeyboardCurrentUILanguage;
  UIKeyboardCurrentUILanguage = v6;

  if (!+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeInputModes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferencesActions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2F8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "containsObject:", v10))
    {
      objc_msgSend(v10, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v8, "inputModeContextIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = 1;
    else
      v17 = objc_msgSend(*(id *)(a1 + 32), "shouldLoadAutofillSignUpInputViewController");

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18 || (v17 & 1) != 0)
    {
      if (((v15 | v17) & 1) != 0)
      {
        objc_msgSend(v8, "identifiersFromInputModes:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        UIKeyboardSetActiveInputModes(v21);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", 1, 1);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", 1, 1);
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        objc_msgSend(v8, "currentInputMode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", v10);

        if ((v20 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 32), "syncInputManagerToKeyboardState");
      }
    }

  }
  v22 = *(_BYTE **)(a1 + 32);
  if (v22[176])
  {
    +[UIKeyboardCache sharedInstance](UIKeyboardCache, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)UIKeyboardActiveInputModes;
    objc_msgSend(v23, "updateCacheForInputModes:", v24);

    v22 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v22, "inputDelegateManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "keyInputDelegate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {

  }
  else
  {
    v27 = *(unsigned __int8 *)(a1 + 44);
    v28 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "splitKeyboardMode");

    if (v27 != v28)
      UIKeyboardSetCurrentInputMode(CFSTR("intl"));
  }
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "keyInputDelegate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "currentInputMode");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "isEmojiInputMode"))
    {
      v33 = +[UIKeyboard isRemoteEmojiCollectionViewEnabled](UIKeyboard, "isRemoteEmojiCollectionViewEnabled");

      if (v33)
        goto LABEL_29;
    }
    else
    {

    }
    v34 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 776));
    objc_msgSend(v34, "updateLayout");

LABEL_29:
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 162) = *(_BYTE *)(a1 + 45);
  v35 = *(void **)(a1 + 32);
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "currentInputMode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "primaryLanguage");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "updateSmartPunctuationOptionsForLocaleIdentifier:", v38);

  v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 776));
  objc_msgSend(v39, "didCompleteUpdateDefaults");

  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 200);
}

uint64_t __54___UIKeyboardStateManager_setInputMode_userInitiated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInputMode:userInitiated:updateIndicator:executionContext:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0, a2);
}

uint64_t __69___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_force___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setKeyboardInputMode:userInitiated:updateIndicator:force:executionContext:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0, *(unsigned __int8 *)(a1 + 49), a2);
}

void __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  __int16 v8;

  v2 = *(void **)(a1 + 32);
  UIKeyboardGetCurrentInputMode();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "taskQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke_2;
    v6[3] = &unk_1E16BB038;
    v5 = *(void **)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 40);
    v7 = v5;
    v8 = *(_WORD *)(a1 + 56);
    objc_msgSend(v4, "performSingleTask:", v6);

  }
}

uint64_t __95___UIKeyboardStateManager_setKeyboardInputMode_userInitiated_updateIndicator_executionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setKeyboardInputMode:userInitiated:updateIndicator:force:executionContext:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), 0, a2);
}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "syncingDictationLanguageForInputModeSwitch"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:](UIDictationInputModeOptions, "dictationInputModeOptionsWithInvocationSource:", CFSTR("UIDictationInputModeInvocationSourceGlobalButtonOnDictationPlane"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "switchToDictationInputModeWithOptions:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setSyncingDictationLanguageForInputModeSwitch:", 0);
  }
  objc_msgSend(v5, "returnExecutionToParent");

}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartner");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "documentStateChanged");

}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "finishSetKeyboardInputMode:previousInputMode:didChangeDirection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  if (*(_BYTE *)(a1 + 57) && (objc_msgSend(*(id *)(a1 + 40), "isEmojiInputMode") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputModeIndicatorController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inputModeChanged");

  }
  objc_msgSend(v4, "returnExecutionToParent");

}

void __102___UIKeyboardStateManager__setKeyboardInputMode_userInitiated_updateIndicator_force_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = a2;
  objc_msgSend(v2, "finishSetKeyboardInputMode:previousInputMode:didChangeDirection:", v3, v4, v5);
  objc_msgSend(v6, "returnExecutionToParent");

}

void __86___UIKeyboardStateManager_keyboardInputModeIndicatorControllerShouldPresentIndicator___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("dictation");
  v2[1] = CFSTR("emoji");
  v2[2] = CFSTR("intl_HWR");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7D1E8;
  qword_1ECD7D1E8 = v0;

}

uint64_t __54___UIKeyboardStateManager_setInputModeFromPreferences__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", a2);
}

uint64_t __81___UIKeyboardStateManager_setInputModeToNextInPreferredListWithExecutionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishSetInputModeToNextInPreferredListWithExecutionContext:withPreviousInputMode:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __62___UIKeyboardStateManager_documentIdentifierForInputDelegate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 32) == a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __74___UIKeyboardStateManager__notifyDidTeardownExistingDelegate_newDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "didTeardownExistingDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "didTeardownExistingDelegate");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v4)[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);

  }
  else
  {
    objc_msgSend(v5, "returnExecutionToParent");
  }

}

void __72___UIKeyboardStateManager__notifyWillSetupNewDelegate_existingDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "willSetupNewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "willSetupNewDelegate");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, id))v4)[2](v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);

  }
  else
  {
    objc_msgSend(v5, "returnExecutionToParent");
  }

}

void __95___UIKeyboardStateManager__teardownExistingDelegate_forSetDelegate_force_delayEndInputSession___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isDevicePasscodeEntry") & 1) == 0)
  {
    +[UIKeyboard snapshotViewForOptions:](UIKeyboard, "snapshotViewForOptions:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 440);
    *(_QWORD *)(v6 + 440) = v5;

  }
  objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartnerPrivate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endInputSessionWithIdentifier:shouldResign:", v10, a3);

  if (objc_msgSend(*(id *)(a1 + 32), "isOutOfProcess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endAllowingRemoteTextInput:", v10);

  }
}

void __95___UIKeyboardStateManager__teardownExistingDelegate_forSetDelegate_force_delayEndInputSession___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resigningRTISessionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "resigningRTISessionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, 1);

    objc_msgSend(*(id *)(a1 + 32), "setResigningRTISessionIdentifier:", 0);
  }
}

void __95___UIKeyboardStateManager__teardownExistingDelegate_forSetDelegate_force_delayEndInputSession___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  _BYTE v12[22];
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _UIKeyboardInputSessionChangeLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = "NO";
    *(_QWORD *)&v12[4] = "-[_UIKeyboardStateManager _teardownExistingDelegate:forSetDelegate:force:delayEndInputSession:]_block_invoke_3";
    *(_DWORD *)v12 = 136315650;
    if ((_DWORD)a3)
      v11 = "YES";
    *(_WORD *)&v12[12] = 2112;
    *(_QWORD *)&v12[14] = v5;
    v13 = 2080;
    v14 = v11;
    _os_log_debug_impl(&dword_185066000, v6, OS_LOG_TYPE_DEBUG, "%s end input session: %@ (shouldResignImmediately=%s)", v12, 0x20u);
  }

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isDevicePasscodeEntry") & 1) == 0)
  {
    +[UIKeyboard snapshotViewForOptions:](UIKeyboard, "snapshotViewForOptions:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 440);
    *(_QWORD *)(v8 + 440) = v7;

  }
  objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartnerPrivate", *(_OWORD *)v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endInputSessionWithIdentifier:shouldResign:waitForReply:", v5, a3, 1);

}

void __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  const __CFString *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "setInputManagerFromCurrentInputMode");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 1;
  if (*(_QWORD *)(a1 + 40))
    v4 = CFSTR("gainFocus");
  else
    v4 = CFSTR("loseFocus");
  objc_msgSend(*(id *)(a1 + 32), "changingContextWithTrigger:", v4);
  objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelectionWithExecutionContext:", v5);

}

void __140___UIKeyboardStateManager__setupDelegate_delegateSame_hardwareKeyboardStateChanged_endingInputSessionIdentifier_force_delayEndInputSession___block_invoke_461(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "refreshAutofillModeIfNecessary");
  objc_msgSend(v3, "returnExecutionToParent");

}

uint64_t __41___UIKeyboardStateManager_didSetDelegate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDelegatePasteSupport");
}

uint64_t __41___UIKeyboardStateManager_didSetDelegate__block_invoke_2()
{
  return objc_msgSend(CFSTR("loadEmojiCharacterSet"), "_containsEmoji");
}

void __53___UIKeyboardStateManager_updateDelegatePasteSupport__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/AvatarKit.framework"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v0)
    _MergedGlobals_987 = 1;

}

uint64_t __44___UIKeyboardStateManager_queueDelayedTask___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __39___UIKeyboardStateManager_textChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "textChanged:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __56___UIKeyboardStateManager_textChanged_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "finishTextChanged");
  objc_msgSend(v3, "returnExecutionToParent");

}

void __51___UIKeyboardStateManager_textSuggestionDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "textDidChange:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __42___UIKeyboardStateManager_setSuggestions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_setSuggestions:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __43___UIKeyboardStateManager__setSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "inputText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
    goto LABEL_5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v18, "searchText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v3) & 1) == 0)
    {

LABEL_5:
      goto LABEL_6;
    }
  }
  if (*(_BYTE *)(a1 + 80) || (v14 = *(void **)(a1 + 40)) == 0)
  {
    if (v7)

    goto LABEL_12;
  }
  objc_msgSend(v14, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "inputText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (v7)
  if ((v17 & 1) == 0)
  {
LABEL_12:
    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    v9 = *(void **)(a1 + 64);
    objc_msgSend(v18, "inputText");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
LABEL_6:
  if (*(_BYTE *)(a1 + 80))
  {
    v9 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", a3);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v13 = (void *)v10;
    objc_msgSend(v9, "addObject:", v10);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }

}

void __43___UIKeyboardStateManager__setSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setShowsCandidateBar:", objc_msgSend(*(id *)(a1 + 32), "shouldShowCandidateBar"));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hasOnlyTextSuggestions")
    && objc_msgSend(*(id *)(a1 + 40), "hasOnlyTextSuggestions"))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hasAutofillCandidates"))
      v3 = objc_msgSend(*(id *)(a1 + 40), "hasAutofillCandidates");
    else
      v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldPrioritizeTextSuggestionsOverCandidateResultSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32)) & 1) != 0|| v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCandidateDisplayAsyncWithCandidateSet:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v4, "returnExecutionToParent");

}

void __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BYTE *v7;
  _UIInputViewKeyboardOutput *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIInputViewKeyboardOutput *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  int8x16_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, void *);
  void *v38;
  int8x16_t v39;
  _QWORD v40[5];
  _UIInputViewKeyboardOutput *v41;
  id v42;
  id v43;

  objc_msgSend(*(id *)(a1 + 32), "keyboardOutputs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_completePerformInputViewControllerOutput:executionContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    goto LABEL_15;
  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateLastUsedInputMode:", v6);

  objc_msgSend(*(id *)(a1 + 40), "_updateInputViewControllerOutput:forKeyboardOutput:", *(_QWORD *)(a1 + 32), v3);
  v7 = *(_BYTE **)(a1 + 40);
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v7, "performKeyboardOutput:forwardToRemoteInputSource:", v3, 1);
    objc_msgSend(v3, "setPositionOffset:", 0);
    objc_msgSend(*(id *)(a1 + 32), "keyboardOutputs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "keyboardOutputs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setKeyboardOutputs:", v16);

    v18 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 48);
    goto LABEL_11;
  }
  v7[171] = 0;
  if (!objc_msgSend(v3, "deletionCount"))
  {
    objc_msgSend(v3, "insertionText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "keyboardOutputs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "keyboardOutputs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "subarrayWithRange:", 1, objc_msgSend(v22, "count") - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setKeyboardOutputs:", v23);

    v24 = *(void **)(a1 + 40);
    if (v20)
    {
      objc_msgSend(v3, "insertionText");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "physicalKeyboardEventWithInput:inputFlags:", v25, 128);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = *(void **)(a1 + 40);
      objc_msgSend(v3, "insertionText");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(void **)(a1 + 48);
      v35 = MEMORY[0x1E0C809B0];
      v36 = 3221225472;
      v37 = __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_3;
      v38 = &unk_1E16BB0D8;
      v34 = *(int8x16_t *)(a1 + 32);
      v29 = (id)v34.i64[0];
      v39 = vextq_s8(v34, v34, 8uLL);
      objc_msgSend(v28, "childWithContinuation:", &v35);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "_handleWebKeyEvent:withInputString:executionContext:", v9, v27, v30);

      goto LABEL_9;
    }
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 48);
    v17 = *(void **)(a1 + 40);
LABEL_11:
    objc_msgSend(v17, "_processInputViewControllerKeyboardOutput:executionContext:", v18, v19);
    goto LABEL_12;
  }
  v8 = objc_alloc_init(_UIInputViewKeyboardOutput);
  -[_UIInputViewKeyboardOutput setDeletionCount:](v8, "setDeletionCount:", objc_msgSend(v3, "deletionCount") - 1);
  objc_msgSend(v3, "setDeletionCount:", 0);
  objc_msgSend(*(id *)(a1 + 40), "physicalKeyboardEventWithInput:inputFlags:", CFSTR("\x7F"), 128);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(a1 + 48);
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_2;
  v40[3] = &unk_1E16BB1C0;
  v40[4] = v10;
  v41 = v8;
  v42 = v3;
  v43 = *(id *)(a1 + 32);
  v12 = v8;
  objc_msgSend(v11, "childWithContinuation:", v40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_handleWebKeyEvent:withInputString:executionContext:", v9, CFSTR("\x7F"), v13);

LABEL_9:
LABEL_12:
  if (objc_msgSend(v3, "deletionCount", *(_OWORD *)&v34, v35, v36, v37, v38))
  {
    objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "delegateRespectingForwardingDelegate:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "hasText");

    if ((v33 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "setInitialDirection");
  }
LABEL_15:

}

void __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "performKeyboardOutput:", v4);
  objc_msgSend(*(id *)(a1 + 48), "setPositionOffset:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_performInputViewControllerOutput:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "returnExecutionToParent");

}

void __86___UIKeyboardStateManager__processInputViewControllerKeyboardOutput_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_performInputViewControllerOutput:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __44___UIKeyboardStateManager_setDocumentState___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7D208;
  qword_1ECD7D208 = v0;

}

void __50___UIKeyboardStateManager_shouldAllowRepeatEvent___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECD7D218;
  qword_1ECD7D218 = v4;

}

uint64_t __79___UIKeyboardStateManager_handleKeyCommand_repeatOkay_beforePublicKeyCommands___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "handleKeyCommand:repeatOkay:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

id __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("KeyboardEventType");
  v7[1] = CFSTR("Operation");
  v8[0] = CFSTR("TextEditing");
  v8[1] = CFSTR("Using modifier key");
  v8[2] = CFSTR("HWKeyboard");
  v7[2] = CFSTR("TriggerType");
  v7[3] = CFSTR("UsingShiftKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v2;
  v7[4] = CFSTR("UsingCommandKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v3;
  v7[5] = CFSTR("UnmodifiedInput");
  objc_msgSend(*(id *)(a1 + 32), "_unmodifiedInput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  char v7;
  char v8;

  v4 = objc_msgSend(*(id *)(a1 + 32), "_delegateRequiresKeyEvents");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "inputDelegateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canPerformAction:withSender:", a2, 0);
  }
  else
  {
    objc_msgSend(v5, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();
  }
  v8 = v7;

  return v8 & 1;
}

uint64_t __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;

  v4 = objc_msgSend(*(id *)(a1 + 32), "_delegateRequiresKeyEvents");
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "inputDelegateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectableDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

LABEL_6:
    return v8 & 1;
  }
  objc_msgSend(v5, "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canPerformAction:withSender:", a2, 0);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "canPerformAction:withSender:", a2, 0);
    goto LABEL_6;
  }
  v8 = 1;
  return v8 & 1;
}

BOOL __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "baseWritingDirectionForPosition:inDirection:", v5, 0) == 1;

  return v6;
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_5(uint64_t a1)
{
  uint64_t (*v2)(void);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  if (*(_BYTE *)(a1 + 64))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && !*(_BYTE *)(a1 + 65))
    {
      v4 = *(void **)(a1 + 32);
      v3 = a1 + 32;
      objc_msgSend(v4, "inputDelegateManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_moveToStartOfWord:withHistory:", *(unsigned __int8 *)(v3 + 34), *(_QWORD *)(v3 + 8));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v5;
      objc_msgSend(*(id *)v3, "setArrowKeyHistory:", v5);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && !*(_BYTE *)(a1 + 65))
    {
      v6 = *(void **)(a1 + 32);
      v3 = a1 + 32;
      objc_msgSend(v6, "inputDelegateManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_moveToEndOfWord:withHistory:", *(unsigned __int8 *)(v3 + 34), *(_QWORD *)(v3 + 8));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_6(uint64_t a1)
{
  uint64_t (*v2)(void);
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  if (*(_BYTE *)(a1 + 64))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && !*(_BYTE *)(a1 + 65))
    {
      v4 = *(void **)(a1 + 32);
      v3 = a1 + 32;
      objc_msgSend(v4, "inputDelegateManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_moveToEndOfWord:withHistory:", *(unsigned __int8 *)(v3 + 34), *(_QWORD *)(v3 + 8));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v5;
      objc_msgSend(*(id *)v3, "setArrowKeyHistory:", v5);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) && !*(_BYTE *)(a1 + 65))
    {
      v6 = *(void **)(a1 + 32);
      v3 = a1 + 32;
      objc_msgSend(v6, "inputDelegateManager");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_moveToStartOfWord:withHistory:", *(unsigned __int8 *)(v3 + 34), *(_QWORD *)(v3 + 8));
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_7(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveToEndOfParagraph:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveToEndOfDocument:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_9(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveToStartOfParagraph:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_10(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveToStartOfDocument:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

id __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_11(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("KeyboardEventType");
  v3[1] = CFSTR("Operation");
  v4[0] = CFSTR("TextEditing");
  v4[1] = CFSTR("Using modifier key");
  v3[2] = CFSTR("TriggerType");
  v3[3] = CFSTR("KeyCommand");
  v1 = *(_QWORD *)(a1 + 32);
  v4[2] = CFSTR("HWKeyboard");
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_12(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_targetForResponderCommand:", sel_copy_);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "copy:", 0);

}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_13(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_targetForResponderCommand:", sel_paste_);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "paste:", 0);

}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_14(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_targetForResponderCommand:", sel_cut_);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cut:", 0);

}

void __63___UIKeyboardStateManager_handleKeyCommand_repeatOkay_options___block_invoke_15(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_targetForResponderCommand:", sel_pasteAndMatchStyle_);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pasteAndMatchStyle:", 0);

}

void __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke_2;
  v5[3] = &unk_1E16BAF98;
  v5[4] = v2;
  objc_msgSend(a2, "childWithContinuation:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleKeyboardInput:executionContext:", v3, v4);

}

void __67___UIKeyboardStateManager_handleInputManagerBasedKeybind_testOnly___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v7 = a2;
  if (objc_msgSend(v3, "delayedCandidateList"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 776));
    objc_msgSend(WeakRetained, "candidateController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inlineCandidateView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "removeCandidateList");
  }
  objc_msgSend(*(id *)(a1 + 32), "generateCandidates");
  objc_msgSend(v7, "returnExecutionToParent");

}

void __156___UIKeyboardStateManager_setMarkedText_selectedRange_inputString_lastInputString_searchString_candidateOffset_liveConversionSegments_highlighSegmentIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;
  NSRange v26;
  NSRange v27;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a2, "rangeValue");
  v7 = v6;
  v8 = v5 + v6;
  v9 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v5 >= v7)
    v10 = v7;
  else
    v10 = v5;
  if (v8 <= v9 && v8 >= v10)
  {
    v16 = *(void **)(a1 + 32);
    v17 = off_1EE071DC0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAttribute:value:range:", v17, v18, v5, v7);

    if (*(_QWORD *)(a1 + 48) == a3)
    {
      if (+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        *(_QWORD *)(v19 + 32) = v5;
        *(_QWORD *)(v19 + 40) = v7;
      }
      else
      {
        v20 = *(void **)(a1 + 32);
        v21 = *(_QWORD *)off_1E1678C50;
        +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addAttribute:value:range:", v21);

      }
    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      v27.location = v5;
      v27.length = v7;
      NSStringFromRange(v27);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v15;
      _os_log_fault_impl(&dword_185066000, v14, OS_LOG_TYPE_FAULT, "illegal range %@ in liveConversionSegments", buf, 0xCu);
LABEL_13:

LABEL_14:
      return;
    }
    v12 = kbLineSeparator_block_invoke_2___s_category;
    if (!kbLineSeparator_block_invoke_2___s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&kbLineSeparator_block_invoke_2___s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v26.location = v5;
      v26.length = v7;
      NSStringFromRange(v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v15;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "illegal range %@ in liveConversionSegments", buf, 0xCu);
      goto LABEL_13;
    }
  }
}

void __125___UIKeyboardStateManager__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "inputDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textChanged:executionContext:", v4, v3);

}

void __125___UIKeyboardStateManager__setAttributedMarkedText_selectedRange_inputString_lastInputString_searchString_compareAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "markedTextRange");
  v5 = v4;
  if (objc_msgSend(*(id *)(a1 + 32), "candidateViewOffset") >= v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCharacterRectsForCharacterRange:", 0);
  }
  else
  {
    objc_msgSend(v7, "characterRectsForCharacterRange:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCharacterRectsForCharacterRange:", v6);

  }
}

uint64_t __86___UIKeyboardStateManager_smartSelectionForTextInDocument_inRange_options_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "signal");
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

uint64_t __59___UIKeyboardStateManager_syncDocumentStateToInputDelegate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncDocumentStateToInputDelegateWithExecutionContext:", a2);
}

void __58___UIKeyboardStateManager_documentStateFromInputDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "contextBefore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x65)
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 100);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  objc_msgSend(v16, "contextAfter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "length") >= 0x65)
  {
    objc_msgSend(v5, "substringToIndex:", 100);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = objc_alloc(MEMORY[0x1E0DBDB78]);
  objc_msgSend(v16, "markedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  if (v10)
  {
    objc_msgSend(v16, "markedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v16, "selectedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v16, "selectedRangeInMarkedText");
  v15 = (void *)objc_msgSend(v8, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v3, v11, v12, v5, v13, v14);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v15);

  if (v10)
}

void __58___UIKeyboardStateManager_documentStateFromInputDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x1E0DBDB78];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "contextBeforeSelection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextAfterSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "rangeInMarkedText");
  v11 = v10;

  v12 = (void *)objc_msgSend(v5, "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", v13, v6, v7, v8, v9, v11);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v12);

}

void __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  __int128 v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke_2;
  v6[3] = &unk_1E16BB350;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v4, "transferExecutionToMainThreadWithTask:", v6);

}

void __80___UIKeyboardStateManager_syncDocumentStateToInputDelegateWithExecutionContext___block_invoke_2(uint64_t a1, void *a2)
{
  _BYTE *v3;
  BOOL v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setDocumentState:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 171) = 1;
  v3 = *(_BYTE **)(a1 + 32);
  if (v3[509] || v3[511])
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "inputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_rtiSourceSession");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v13 != 0;

    }
    else
    {
      v4 = 0;
    }

    v3 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v3, "inputDelegateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasAsyncCapableInputDelegate");

  if ((v4 || (v6 & 1) != 0 || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isSecureTextEntry") & 1) == 0)
    && (objc_msgSend(*(id *)(a1 + 32), "isCallingTextChangedDuringInputModeSwitch") & 1) == 0)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_textInputSessionAnalytics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 40), "_selectedTextRange");
    objc_msgSend(v8, "didChangeToSelection:relativeRangeBefore:", v9, v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  objc_msgSend(v14, "returnExecutionToParent");

}

void __52___UIKeyboardStateManager_prepareForSelectionChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 464);
  *(_QWORD *)(v1 + 464) = 0;

}

uint64_t __52___UIKeyboardStateManager_updateForChangedSelection__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelectionWithExecutionContext:", a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 0;
  return result;
}

uint64_t __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

uint64_t __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

void __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320);
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_4;
  v4[3] = &unk_1E16BAF98;
  v4[4] = v2;
  objc_msgSend(a2, "childWithContinuation:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncInputManagerToKeyboardStateWithExecutionContext:", v3);

}

void __73___UIKeyboardStateManager_updateForChangedSelectionWithExecutionContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v8 = a2;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualModeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useVisualModeWindowed");

  if (objc_msgSend(*(id *)(a1 + 32), "shouldGenerateCandidatesAfterSelectionChange"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "oldPathForSnapshot") & 1) != 0)
    {
      v7 = +[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess") | v5;

      if (v7 != 1)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "generateCandidates");
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "completeUpdateForChangedSelection:", 1);
  objc_msgSend(v8, "returnExecutionToParent");

}

uint64_t __46___UIKeyboardStateManager_selectionDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 320) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelectionWithExecutionContext:", a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 0;
  return result;
}

uint64_t __46___UIKeyboardStateManager_selectionDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 511) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelectionWithExecutionContext:", a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 509) = 0;
  return result;
}

void __46___UIKeyboardStateManager_selectionDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "remoteTextInputPartner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentStateChanged");

  objc_msgSend(v4, "returnExecutionToParent");
}

uint64_t __58___UIKeyboardStateManager_syncInputManagerToKeyboardState__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncInputManagerToKeyboardStateWithExecutionContext:", a2);
}

void __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke_2;
  v6[3] = &unk_1E16BB0D8;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "transferExecutionToMainThreadWithTask:", v6);

}

void __79___UIKeyboardStateManager_syncInputManagerToKeyboardStateWithExecutionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "syncKeyboardToConfiguration:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id *v15;
  id *v16;
  id *v17;
  __int128 v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD aBlock[4];
  id v29;
  uint64_t v30;
  __int128 v31;
  id v32[2];
  char v33;
  char v34;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_2;
  aBlock[3] = &unk_1E16BB408;
  v8 = *(id *)(a1 + 32);
  v32[1] = *(id *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 40);
  v29 = v8;
  v30 = v9;
  v33 = *(_BYTE *)(a1 + 80);
  objc_copyWeak(v32, (id *)(a1 + 64));
  v34 = *(_BYTE *)(a1 + 81);
  v18 = *(_OWORD *)(a1 + 48);
  v10 = (id)v18;
  v31 = v18;
  v11 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 48), "takeOwnershipOfPendingCompletionBlock");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!*(_BYTE *)(a1 + 81) || v12)
  {
    v14 = *(void **)(a1 + 48);
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_3;
    v23[3] = &unk_1E16BB430;
    v26 = v11;
    v24 = v5;
    v25 = v6;
    v27 = v13;
    objc_msgSend(v14, "transferExecutionToMainThreadWithTask:", v23);
    v15 = &v26;
    v16 = &v24;
    v17 = &v25;

LABEL_7:
    goto LABEL_8;
  }
  if (!pthread_main_np())
  {
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_4;
    block[3] = &unk_1E16BB458;
    v15 = &v22;
    v22 = v11;
    v16 = &v20;
    v20 = v5;
    v17 = &v21;
    v21 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_7;
  }
  (*((void (**)(void *, id, id, _QWORD))v11 + 2))(v11, v5, v6, 0);
LABEL_8:

  objc_destroyWeak(v32);
}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  id *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  char v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  BOOL v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(id *);
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint8_t buf[16];

  v8 = a2;
  v9 = a3;
  v10 = a4;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 32));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_185066000, v11, OS_SIGNPOST_INTERVAL_END, v13, "appInput", " enableTelemetry=YES ", buf, 2u);
    }
  }

  v14 = CACurrentMediaTime();
  v15 = 0x1E0CD2000uLL;
  v16 = objc_msgSend(MEMORY[0x1E0CD28B0], "startFrameWithReason:beginTime:commitDeadline:", 32, v14, v14 + _UIQOSMaxFrameDurationSeconds());
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameInputTime:withToken:", v16, *(double *)(a1 + 72));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 776));
  objc_msgSend((id)objc_opt_class(), "sendPerformanceNotification:", CFSTR("UIKeyboardPerformanceHandleInputResponseNotification"));

  UIKeyboardGetCurrentInputMode();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 80))
    goto LABEL_7;
  objc_msgSend(v8, "customInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_6;
  objc_msgSend(v8, "insertionText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v9;
  if (v19)
  {
    v45 = *(void **)(a1 + 40);
    v46 = (void *)MEMORY[0x1E0DBDBE8];
    objc_msgSend(v8, "insertionText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "candidateWithCandidate:forInput:", v4, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v45, "shouldApplyAcceptedAutocorrection:", v9) & 1) != 0)
    {

      v9 = v50;
      v15 = 0x1E0CD2000;
LABEL_6:

LABEL_7:
      v20 = objc_loadWeakRetained((id *)(a1 + 64));
      if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
        && v20
        && (objc_msgSend(v8, "customInfo"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "count"),
            v21,
            v22))
      {
        objc_msgSend(*(id *)(a1 + 40), "remoteTextInputPartner");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "customInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "forwardAutofillPayload:toPayloadDelegate:", v24, v20);

      }
      else
      {
        v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "conformsToProtocol:", &unk_1EDFB4F88, v50);
        v26 = *(id **)(a1 + 40);
        if (v25)
        {
          objc_msgSend(v26[5], "performOutput:", v8);
        }
        else
        {
          objc_msgSend(v26, "updateKeyboardOutput:withInputForSmartPunctuation:keyboardConfiguration:", v8, *(_QWORD *)(a1 + 32), v9);
          objc_msgSend(*(id *)(a1 + 40), "inputSystemSourceSession");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "textOperations");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v50 = v9;
          objc_msgSend(v9, "multilingualLanguages");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          if (v29)
            v31 = v29;
          else
            v31 = MEMORY[0x1E0C9AA60];
          objc_msgSend(v28, "setMultilingualLanguages:", v31);

          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 8)
            v32 = 8;
          else
            v32 = 1;
          v51 = MEMORY[0x1E0C809B0];
          v52 = 3221225472;
          v53 = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_815;
          v54 = &unk_1E16B47A8;
          v33 = *(void **)(a1 + 32);
          v34 = *(void **)(a1 + 40);
          v55 = v34;
          v56 = v33;
          v35 = v8;
          v57 = v35;
          if (objc_msgSend(*(id *)(a1 + 40), "isInHardwareKeyboardMode"))
            v36 = 4;
          else
            v36 = v32;
          objc_msgSend(v34, "performOperations:withTextInputSource:", &v51, v36);
          v37 = *(_QWORD **)(a1 + 40);
          if (v37[53])
          {
            objc_msgSend(v37, "remoteTextInputPartner");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "documentStateChanged");

          }
          objc_msgSend(v35, "insertionText");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "_containsEmojiOnly");

          v15 = 0x1E0CD2000uLL;
          if (v40)
          {
            v41 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 776));
            v42 = objc_msgSend(v41, "isEmojiPopoverVisibleOrDismissing");

            if ((v42 & 1) == 0)
              +[UIKBAnalyticsDispatcher emojiInsertedByMethod:inputType:](UIKBAnalyticsDispatcher, "emojiInsertedByMethod:inputType:", CFSTR("Touch"), CFSTR("Keyboard"));
          }

          v9 = v50;
        }
      }

      goto LABEL_29;
    }
  }
  objc_msgSend(v8, "acceptedCandidate", v50);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "customInfoType");

  if (v19)
  {

  }
  v49 = v48 == 4096;
  v9 = v50;
  v15 = 0x1E0CD2000;
  if (v49)
    goto LABEL_7;
LABEL_29:
  UIKeyboardGetCurrentInputMode();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v18, "isEqualToString:", v43);

  if (v44)
    objc_msgSend(*(id *)(a1 + 40), "syncKeyboardToConfiguration:", v9);
  if (*(_BYTE *)(a1 + 81))
  {
    if (v10)
      v10[2](v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "returnExecutionToParent");
  }
  objc_msgSend(*(id *)(v15 + 2224), "finishFrameWithToken:", v16, v50, v51, v52, v53, v54, v55);

}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_815(id *a1)
{
  id WeakRetained;
  void *v3;
  _BOOL8 v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if (objc_msgSend(a1[4], "showingEmojiSearch"))
  {
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 97);
    if (objc_msgSend(WeakRetained, "isEmojiPopoverPresented"))
    {
      objc_msgSend(a1[5], "touchEvent");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3 == 0;

    }
    else
    {
      v4 = 1;
    }

  }
  else
  {
    v4 = 1;
  }
  v5 = a1[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_2_816;
  v6[3] = &unk_1E16B1B50;
  v6[4] = v5;
  v7 = a1[6];
  objc_msgSend(v5, "_performKeyboardOutput:respectingForwardingDelegate:", v6, v4);

}

uint64_t __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_2_816(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performKeyboardOutput:", *(_QWORD *)(a1 + 40));
}

uint64_t __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[7]);
}

uint64_t __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

void __64___UIKeyboardStateManager_handleKeyboardInput_executionContext___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "returnExecutionToParent");

}

void __62___UIKeyboardStateManager_replaceAllTextInResponder_withText___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "_editMenuAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelDelayedCommandRequests");

  objc_msgSend(v4, "returnExecutionToParent");
}

void __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "_handleKeyCommand:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

uint64_t __48___UIKeyboardStateManager_performKeyboardEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleKeyEvent:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __60___UIKeyboardStateManager_performKeyboardOutputAsRTIClient___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:", v3, 0, 0);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_copyTo:");
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "usesCandidateSelection"))
      {
        objc_msgSend(v13, "acceptedCandidate");
        v3 = objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          v4 = (void *)v3;
          objc_msgSend(v13, "textToCommit");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "length"))
          {

          }
          else
          {
            objc_msgSend(v13, "insertionText");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v6, "length");

            if (!v7)
              objc_msgSend(v13, "setAcceptedCandidate:", 0);
          }
        }
      }
    }
  }
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(*(id *)(a1 + 40), "inputManagerState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "commitsAcceptedCandidate"))
    {

    }
    else
    {
      objc_msgSend(v13, "acceptedCandidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "candidate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textToCommit");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

      if (v12)
        objc_msgSend(v13, "setTextToCommit:", 0);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_3;
    block[3] = &unk_1E16B1B28;
    v5 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_3(uint64_t a1)
{
  id v2;

  +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleStickerSuggestionWithTISticker:", *(_QWORD *)(a1 + 32));

}

void __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "insertionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceAllTextInResponder:withText:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "autofillController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "showASPInTextField:isRightToLeft:", v5, *(unsigned __int8 *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "autofillController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addTemporaryTextColorToTextField:", v5);

}

uint64_t __93___UIKeyboardStateManager_performKeyboardOutput_checkingDelegate_forwardToRemoteInputSource___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copyTo:", a2);
}

void __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_2;
  v10[3] = &unk_1E16BB560;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v8 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v13 = v3;
  v15 = v7;
  v14 = v8;
  v9 = v3;
  objc_msgSend(v4, "addDeferredTask:", v10);

}

void __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_3;
  v11[3] = &unk_1E16BB560;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v12 = v4;
  v13 = v5;
  v7 = v6;
  v9 = *(void **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v14 = v7;
  v16 = v8;
  v15 = v9;
  objc_msgSend(a2, "childWithContinuation:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "returnExecutionToParent");

}

void __87___UIKeyboardStateManager_generateCandidatesAsynchronouslyWithRange_selectedCandidate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t v12[16];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "currentCandidateRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isSameRequestAs:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "inputManagerDidGenerateCandidateResultSet:", *(_QWORD *)(a1 + 48));
    kdebug_trace();
    kac_get_log();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 64));
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_185066000, v6, OS_SIGNPOST_INTERVAL_END, v8, "appCandidates", " enableTelemetry=YES ", v12, 2u);
      }
    }

    objc_msgSend(*(id *)(a1 + 48), "committedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "generateCandidatesWithOptions:", 2);
    }
    else if (objc_msgSend(*(id *)(a1 + 48), "inputManagerHasPendingCandidatesUpdate"))
    {
      objc_msgSend(*(id *)(a1 + 40), "generateCandidatesAsynchronouslyWithRange:selectedCandidate:", 0, 0, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "inputForMarkedText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {

      }
      else
      {
        v11 = objc_msgSend(*(id *)(a1 + 48), "generatedCandidateCount");

        if (!v11)
          objc_msgSend(*(id *)(a1 + 40), "_postInputResponderCapabilitiesChangedNotificationWithOutput:selectionChanged:", 0, 1);
      }
    }
  }
  objc_msgSend(v3, "returnExecutionToParent");

}

uint64_t __74___UIKeyboardStateManager__inputManagerDidGenerateSupplementalCandidates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAutocorrectionIgnoringCaseAndDiacriticsAndSupplementalItemPrefix") ^ 1;
}

void __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke_2;
  v6[3] = &unk_1E16BB0D8;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "transferExecutionToMainThreadWithTask:", v6);

}

void __70___UIKeyboardStateManager_generateAutocorrectionWithExecutionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 640) = objc_msgSend(v3, "sourceForAutocorrection");
  objc_msgSend(*(id *)(a1 + 32), "inputManagerDidGenerateAutocorrections:executionContext:", *(_QWORD *)(a1 + 40), v4);

}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v3 = a2;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputContextHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -objc_msgSend(v7, "length");

  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_2;
  v15[3] = &unk_1E16B47A8;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  v16 = v12;
  v17 = v13;
  v18 = v6;
  v14 = v6;
  objc_msgSend(v11, "adjustSelection:completionHandler:", v8, v10, v15);

  objc_msgSend(v3, "returnExecutionToParent");
}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1[4], "smartReplySourceCandidate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "candidate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(a1[5], "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "tiInputContextHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_startWritingToolsWithTool:prompt:entryPoint:inputContextHistory:sender:", CFSTR("WTUIRequestedToolSmartReply"), v5, v7, v6, a1[5]);

}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setAutocorrectionToAcceptBeforeProgressiveCandidates:", 0);
  objc_msgSend(*(id *)(a1 + 32), "inputManagerDidGenerateAutocorrections:executionContext:", *(_QWORD *)(a1 + 40), v4);

}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "predictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend(*(id *)(a1 + 32), "predictions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "emojiList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listWithPredictions:emojiList:proactiveTriggers:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "corrections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "autocorrection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputManagerDidGenerateAutocorrections:forPredictiveInput:executionContext:", v7, v10, v11);

  }
  else
  {
    objc_msgSend(v11, "returnExecutionToParent");
  }

}

uint64_t __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceReloadInputViews");
}

void __102___UIKeyboardStateManager_inputManagerDidGenerateAutocorrections_forPredictiveInput_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "inlineTextCompletionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "inlineTextCompletionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateTextCompletionPromptExecutionContext:", v5);

  }
  else
  {
    objc_msgSend(v5, "returnExecutionToParent");
  }

}

uint64_t __80___UIKeyboardStateManager__insertSupplementalCandidate_overridingCandidateText___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "autocorrectionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextSuggestionList:", 0);

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSupplementalItem:candidate:replacementRange:", v10, v9, v8);

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 540) = 0;
  objc_msgSend(*(id *)(a1 + 32), "syncInputManagerToKeyboardState");
  return 1;
}

void __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke_2;
  v9[3] = &unk_1E16BB640;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v9[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addTask:", v9);

  objc_destroyWeak(&v11);
}

void __108___UIKeyboardStateManager__acceptAutofillCandidateRequiringAuthentication_payloadDelegate_executionContext___block_invoke_2(id *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a1 + 6;
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "remoteTextInputPartner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "customInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "forwardAutofillPayload:toPayloadDelegate:", v7, WeakRetained);

  }
  else
  {
    _UIKeyboardImplLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Cannot forward autofill payload to client: autofill payload delegate is nil", v9, 2u);
    }

  }
  objc_msgSend(v4, "returnExecutionToParent");

}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_2;
  v12[3] = &unk_1E16BB1C0;
  v7 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  v14 = v9;
  v15 = v6;
  v16 = v5;
  v10 = v5;
  v11 = v6;
  objc_msgSend(v7, "transferExecutionToMainThreadWithTask:", v12);

}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  int v35;
  void *v36;
  char v37;
  id WeakRetained;
  void *v39;
  int v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[3];

  v71[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "isSupplementalItemCandidate");
  v6 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v6, "remoteTextInputPartner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "textToCommit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textOperation_insertSupplementalCandidate:textToCommit:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "inputSystemSourceSession");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v10 && v11)
    {
      objc_msgSend(v10, "customInfoType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textOperations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCustomInfoType:", v13);

      objc_msgSend(v10, "customInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textOperations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCustomInfo:", v15);

      objc_msgSend(v12, "flushOperations");
    }

  }
  else
  {
    objc_msgSend(v6, "inputDelegateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "forwardingInputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_9;
    v19 = MEMORY[0x1E0C809B0];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_3;
    v69[3] = &unk_1E16BB538;
    v20 = *(void **)(a1 + 40);
    v70 = *(id *)(a1 + 48);
    objc_msgSend(v20, "performKeyboardOutputOnInputSourceSession:", v69);
    v67[0] = v19;
    v67[1] = 3221225472;
    v67[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_4;
    v67[3] = &unk_1E16BB538;
    v21 = *(void **)(a1 + 40);
    v68 = *(id *)(a1 + 48);
    objc_msgSend(v21, "performKeyboardOutputOnInputSourceSession:", v67);
    v65[0] = v19;
    v65[1] = 3221225472;
    v65[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_5;
    v65[3] = &unk_1E16BB538;
    v22 = *(void **)(a1 + 40);
    v66 = *(id *)(a1 + 48);
    objc_msgSend(v22, "performKeyboardOutputOnInputSourceSession:", v65);
    v63[0] = v19;
    v63[1] = 3221225472;
    v63[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_6;
    v63[3] = &unk_1E16BB538;
    v23 = *(void **)(a1 + 40);
    v64 = *(id *)(a1 + 32);
    objc_msgSend(v23, "performKeyboardOutputOnInputSourceSession:", v63);

    v10 = v70;
  }

LABEL_9:
  objc_msgSend(*(id *)(a1 + 48), "textToCommit");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 40), "inputDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25
      && (objc_msgSend(*(id *)(a1 + 40), "inputDelegateManager"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "callShouldReplaceExtendedRange:withText:includeMarkedText:", objc_msgSend(*(id *)(a1 + 48), "deletionCount"), v24, objc_msgSend(*(id *)(a1 + 40), "_hasMarkedText")), v26, !v27))
    {
      objc_msgSend(*(id *)(a1 + 40), "unmarkText:", &stru_1E16EDF20);
      v37 = 0;
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "_hasMarkedText") & 1) == 0
        && objc_msgSend(*(id *)(a1 + 48), "deletionCount"))
      {
        objc_msgSend(*(id *)(a1 + 48), "insertionText");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 == 0;

        objc_msgSend(*(id *)(a1 + 40), "deleteBackwardAndNotifyAtEnd:deletionCount:reinsertTextInLoop:", v29, objc_msgSend(*(id *)(a1 + 48), "deletionCount"), 0);
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isSlottedCandidate")
        && objc_msgSend(v24, "hasPrefix:", CFSTR("https://")))
      {
        objc_msgSend(*(id *)(a1 + 40), "documentState");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "contextBeforeInput");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "characterIsMember:", objc_msgSend(v31, "characterAtIndex:", objc_msgSend(v31, "length") - 1));

          if ((v33 & 1) == 0)
          {
            objc_msgSend(CFSTR(" "), "stringByAppendingString:", v24);
            v34 = objc_claimAutoreleasedReturnValue();

            v24 = (void *)v34;
          }
        }

      }
      v35 = objc_msgSend(*(id *)(a1 + 32), "isSupplementalItemCandidate");
      v36 = *(void **)(a1 + 40);
      if (v35)
      {
        objc_msgSend(v36, "_willReplaceText:withSupplementalCandidate:", v24, *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "unmarkText:", v24);
        objc_msgSend(*(id *)(a1 + 40), "_didReplaceText:withSupplementalCandidate:", v24, *(_QWORD *)(a1 + 32));
      }
      else
      {
        objc_msgSend(v36, "unmarkText:", v24);
      }
      v37 = 1;
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 776));
    objc_msgSend(WeakRetained, "candidateController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "barIsExtended");

    if (v40)
    {
      v41 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 776));
      objc_msgSend(v41, "candidateController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "collapse");

    }
    v43 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 776));
    objc_msgSend(v43, "candidateController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "inlineCandidateView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
      objc_msgSend(*(id *)(a1 + 40), "removeCandidateList");
  }
  else
  {
    v37 = 1;
  }
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess")
    || !v24
    || !objc_msgSend(*(id *)(a1 + 32), "isSupplementalItemCandidate")
    || (objc_msgSend(*(id *)(a1 + 40), "_insertSupplementalCandidate:overridingCandidateText:", *(_QWORD *)(a1 + 32), v24) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "customInfo");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "customInfo");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "performKeyboardOutputInfo:", v48);

    }
  }
  objc_msgSend(*(id *)(a1 + 48), "acceptedCandidate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v49, "customInfoType") & 0x1000) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "acceptedCandidate");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stickerIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v51)
      goto LABEL_41;
    objc_msgSend(*(id *)(a1 + 40), "backendController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "acceptedCandidate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stickerIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = CFSTR("com.apple.stickers.role.still");
    v71[1] = CFSTR("com.apple.stickers.role.animated");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "stickerWithIdentifier:stickerRoles:completionHandler:", v53, v54, &__block_literal_global_888);

  }
LABEL_41:
  v55 = objc_msgSend(*(id *)(a1 + 32), "cursorMovement");
  v56 = v37 ^ 1;
  if (!v55)
    v56 = 1;
  if ((v56 & 1) == 0)
  {
    v57 = v55;
    v58 = *(_QWORD *)(a1 + 40);
    v59 = *(_BYTE *)(v58 + 508);
    *(_BYTE *)(v58 + 508) = 1;
    v60 = *(void **)(a1 + 40);
    objc_msgSend(v60, "documentState");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "documentStateAfterCursorAdjustment:", v57);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setDocumentState:", v62);

    objc_msgSend(*(id *)(a1 + 40), "moveCursorByAmount:", v57);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 508) = v59;
  }
  objc_msgSend(*(id *)(a1 + 40), "syncKeyboardToConfiguration:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "returnExecutionToParent");

}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDeletionCount:", objc_msgSend(v2, "deletionCount"));

}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "textToCommit");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextToCommit:", v4);

}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "customInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCustomInfo:", v4);

}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPositionOffset:", objc_msgSend(v2, "cursorMovement"));

}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _QWORD block[4];
  id v5;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_8;
    block[3] = &unk_1E16B1B28;
    v5 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __68___UIKeyboardStateManager_handleAcceptedCandidate_executionContext___block_invoke_8(uint64_t a1)
{
  id v2;

  +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleStickerSuggestionWithTISticker:", *(_QWORD *)(a1 + 32));

}

void __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke_2;
  v7[3] = &unk_1E16BB6B8;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "transferExecutionToMainThreadWithTask:", v7);

}

void __92___UIKeyboardStateManager_generateReplacementsForString_candidatesHandler_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
  v5 = a2;
  v4(v2, v3);
  objc_msgSend(v5, "returnExecutionToParent");

}

BOOL __53___UIKeyboardStateManager_skipHitTestForTouchEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stage") != 5;
}

uint64_t __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke_2;
  v4[3] = &__block_descriptor_40_e40_v16__0__UIKeyboardTaskExecutionContext_8l;
  v4[4] = a2;
  return objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", v4);
}

void __88___UIKeyboardStateManager_performHitTestForTouchEvents_executionContextPassingNSNumber___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithInteger:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "returnExecutionToParentWithInfo:", v5);

}

void __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke_2;
  v6[3] = &unk_1E16BB0D8;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "transferExecutionToMainThreadWithTask:", v6);

}

void __95___UIKeyboardStateManager_adjustPhraseBoundaryInForwardDirection_granularity_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "syncKeyboardToConfiguration:", v4);
  objc_msgSend(*(id *)(a1 + 32), "didChangePhraseBoundary");
  objc_msgSend(v5, "returnExecutionToParent");

}

uint64_t __55___UIKeyboardStateManager_removeAllDynamicDictionaries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __61___UIKeyboardStateManager_desirableInputModesWithExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  char v6;
  int v7;
  id v8;

  v3 = a2;
  v4 = v3;
  v8 = v3;
  if ((!*(_BYTE *)(a1 + 64) || (v5 = objc_msgSend(v3, "isExtensionInputMode"), v4 = v8, (v5 & 1) == 0))
    && ((v6 = objc_msgSend(v4, "isAllowedForTraits:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136)), v4 = v8, (v6 & 1) != 0)
     || *(_QWORD *)(a1 + 40) && (v7 = objc_msgSend(v8, "isAllowedForTraits:"), v4 = v8, v7)))
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
    if (*(_QWORD *)(a1 + 40) && objc_msgSend(v8, "isAllowedForTraits:"))
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
  }
  else if (objc_msgSend(v4, "isExtensionInputMode"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 220) = 1;
  }

}

void __43___UIKeyboardStateManager_notifyShiftState__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "shiftKeyStateChangedFrom:to:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));

  objc_msgSend(v5, "returnExecutionToParent");
}

uint64_t __60___UIKeyboardStateManager_handleDeleteWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

uint64_t __39___UIKeyboardStateManager_handleDelete__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDeleteWithExecutionContext:", a2);
}

uint64_t __38___UIKeyboardStateManager_handleClear__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleClearWithExecutionContext:", a2);
}

void __158___UIKeyboardStateManager_handleMoveCursorToStartOfLine_beforePublicKeyCommands_testOnly_savedHistory_force_canHandleSelectableInputDelegateCommand_keyEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveToStartOfLine:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

void __156___UIKeyboardStateManager_handleMoveCursorToEndOfLine_beforePublicKeyCommands_testOnly_savedHistory_force_canHandleSelectableInputDelegateCommand_keyEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveToEndOfLine:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

void __241___UIKeyboardStateManager_handleHorizontalArrow_shiftDown_beforePublicKeyCommands_testOnly_isVerticalCandidate_hasCandidatesForTypedInput_shouldNavigateCandidateList_canHandleInputDelegateCommand_savedHistory_keyCommandTypeHandled_keyEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveRight:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

void __241___UIKeyboardStateManager_handleHorizontalArrow_shiftDown_beforePublicKeyCommands_testOnly_isVerticalCandidate_hasCandidatesForTypedInput_shouldNavigateCandidateList_canHandleInputDelegateCommand_savedHistory_keyCommandTypeHandled_keyEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_moveLeft:withHistory:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v2);

}

void __239___UIKeyboardStateManager_handleVerticalArrow_shiftDown_beforePublicKeyCommands_testOnly_isVerticalCandidate_hasCandidatesForTypedInput_inputDelegateCommandEnabled_canHandleInputDelegateCommand_savedHistory_keyCommandTypeHandled_keyEvent___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  id v7;

  v2 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = *(unsigned __int8 *)(a1 + 49) != 0;
  if (v2)
    objc_msgSend(v3, "_moveDown:withHistory:", v5, v4);
  else
    objc_msgSend(v3, "_moveUp:withHistory:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setArrowKeyHistory:", v6);

}

void __72___UIKeyboardStateManager_deleteForwardAndNotify_producedByDeleteInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setForwardDeletionCount:", 1);
  objc_msgSend(v3, "setProducedByDeleteInput:", *(unsigned __int8 *)(a1 + 32));

}

uint64_t __87___UIKeyboardStateManager__handleKeyInputMethodCommandForEvent_canHandleAppKeyCommand___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(v3 + 507);
  *(_BYTE *)(v3 + 507) = 0;
  result = objc_msgSend(*(id *)(a1 + 32), "handleKeyWithString:forKeyEvent:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 507) = v4;
  return result;
}

uint64_t __62___UIKeyboardStateManager_handleReplacement_forSpaceAndInput___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeletionCount:", 1);
}

void __62___UIKeyboardStateManager_handleReplacement_forSpaceAndInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "acceptedCandidate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAcceptedCandidate:", v4);

}

uint64_t __52___UIKeyboardStateManager_addInputString_withFlags___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addInputString:withFlags:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __73___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addInputString:withFlags:withInputManagerHint:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __90___UIKeyboardStateManager__addInputString_withFlags_withInputManagerHint_withInputSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addInputString:withFlags:withInputManagerHint:withInputSource:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), a2);
}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  _QWORD *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  objc_msgSend(*(id *)(a1 + 32), "inputManagerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "newInputAcceptsUserSelectedCandidate"))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "inputManagerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "inputStringAcceptsCurrentCandidateIfSelected:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "longPredictionListEnabled");

  if ((v4 & 1) == 0)
  {
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[5] != 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_2;
    v12[3] = &unk_1E16BB010;
    v12[4] = v5;
    v14 = v6;
    v7 = *(void **)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    objc_msgSend(v7, "childWithContinuation:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptCurrentCandidateIfSelectedWithExecutionContext:", v8);

    return;
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setUserSelectedCurrentCandidate:", 0);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 48), "childWithContinuation:", &__block_literal_global_972);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addInputEvent:executionContext:", v10, v11);

}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  void *v12;
  id v13;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = *(_BYTE *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_3;
  v11 = &unk_1E16BB0D8;
  v12 = v5;
  v6 = v4;
  v13 = v6;
  objc_msgSend(a2, "childWithContinuation:", &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addInputEvent:executionContext:", v6, v7, v8, v9, v10, v11, v12);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend((id)objc_opt_class(), "_isInputEligibleForSpaceAutodelete:", *(_QWORD *)(a1 + 40)))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 170) = 1;
  +[UIKBAnalyticsDispatcher didCandidateReplacement](UIKBAnalyticsDispatcher, "didCandidateReplacement");
  objc_msgSend(v3, "returnExecutionToParent");

}

void __106___UIKeyboardStateManager_addInputString_withFlags_withInputManagerHint_withInputSource_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  +[UIKBAnalyticsDispatcher didCandidateReplacement](UIKBAnalyticsDispatcher, "didCandidateReplacement");
  objc_msgSend(v2, "returnExecutionToParent");

}

void __58___UIKeyboardStateManager_addInputEvent_executionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v15, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v15, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("_UIKeyboardStateManager.m"), 12132, CFSTR("UIKeyboardTask %s expected TIKeyboardCandidate but received %@"), "-[_UIKeyboardStateManager addInputEvent:executionContext:]_block_invoke", v10);

    }
  }
  objc_msgSend(v15, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (*(_QWORD *)(a1 + 40)
    && (objc_msgSend(v11, "candidate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "hasSuffix:", *(_QWORD *)(a1 + 40)),
        v13,
        v14))
  {
    objc_msgSend(*(id *)(a1 + 32), "completeAddInputString:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v15, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addWordTerminator:afterSpace:afterAcceptingCandidate:elapsedTime:executionContext:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), v12, v15, *(double *)(a1 + 64));
  }

}

void __58___UIKeyboardStateManager_addInputEvent_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v11 = a2;
  objc_msgSend(v3, "autocorrectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasAutocorrection") & 1) == 0)
  {

    v9 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "autocorrectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autocorrection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isForShortcutConversion");

  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (!v7)
  {
LABEL_5:
    v10 = 1;
    goto LABEL_6;
  }
  v10 = objc_msgSend(v9, "shouldShowLongPredictionList");
LABEL_6:
  objc_msgSend(v9, "completeAddInputString:generateCandidates:", v8, v10);
  objc_msgSend(v11, "returnExecutionToParent");

}

void __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke_2;
  v5[3] = &unk_1E16BB8E0;
  v5[4] = a1[6];
  objc_msgSend(a2, "childWithContinuation:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptAutocorrectionForWordTerminator:executionContextPassingTIKeyboardCandidate:", v3, v4);

}

void __65___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v6, "returnExecutionToParent");
}

void __108___UIKeyboardStateManager_acceptAutocorrectionForWordTerminator_executionContextPassingTIKeyboardCandidate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "info");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v14, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 56);
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "info");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("_UIKeyboardStateManager.m"), 12225, CFSTR("UIKeyboardTask %s expected TIKeyboardCandidate but received %@"), "-[_UIKeyboardStateManager acceptAutocorrectionForWordTerminator:executionContextPassingTIKeyboardCandidate:]_block_invoke", v10);

    }
  }
  objc_msgSend(v14, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSSelectorFromString(CFSTR("learningFlags"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "valueForKey:", CFSTR("learningFlags"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntValue");

    objc_msgSend(*(id *)(a1 + 32), "didAcceptAutocorrection:inputCandidate:wordTerminator:learningFlagsMask:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "didAcceptAutocorrection:inputCandidate:wordTerminator:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(*(id *)(a1 + 32), "setAutocorrection:", 0);
  objc_msgSend(v14, "returnExecutionToParentWithInfo:", v11);

}

uint64_t __60___UIKeyboardStateManager_inputWordForTerminatorAtSelection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "inputManagerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stringEndsWord:", v3);

  return v5;
}

uint64_t __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteFromInputWithFlags:executionContext:", 1024, a2);
}

void __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0DBDBF8];
  v4 = a2;
  v7 = objc_alloc_init(v3);
  objc_msgSend(v7, "setString:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "childWithContinuation:", &__block_literal_global_980);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "handleKeyboardInput:executionContext:", v7, v6);
}

uint64_t __60___UIKeyboardStateManager_insertedAccentVariantFromPopover___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

void __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;

  v3 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_2;
  aBlock[3] = &unk_1E16BB978;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "backendController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleKeyboardInput:keyboardState:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);

}

uint64_t __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferExecutionToMainThreadWithTask:", &__block_literal_global_981);
}

uint64_t __58___UIKeyboardStateManager_handleEmojiInput_keyboardState___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParentWithInfo:", 0);
}

uint64_t __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcceptedCandidate:", *(_QWORD *)(a1 + 32));
}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v10;
  void *v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;

  objc_msgSend(*(id *)(a1 + 32), "setDocumentStateForAutocorrection:", *(_QWORD *)(a1 + 40));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_3;
  v13[3] = &unk_1E16BB9A0;
  v10 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 48);
  v13[1] = 3221225472;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v14 = v10;
  v12 = *(_OWORD *)(a1 + 72);
  v19 = *(_OWORD *)(a1 + 56);
  v20 = v12;
  objc_msgSend(v11, "transferExecutionToMainThreadWithTask:", v13);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;

}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (CGRectIsEmpty(*(CGRect *)(a1 + 48)))
  {
    objc_msgSend(v4, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_textChoicesAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trackUnderlineForWebKitCandidate:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "animateAutocorrectionToRect:fromRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 32), "didApplyAutocorrection:autocorrectPromptFrame:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(v4, "returnExecutionToParentWithInfo:", *(_QWORD *)(a1 + 40));
  }

}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_4(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v10;
  void *v11;
  __int128 v12;
  _QWORD v13[5];
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;

  objc_msgSend(*(id *)(a1 + 32), "setDocumentStateForAutocorrection:", *(_QWORD *)(a1 + 40));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[2] = __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_5;
  v13[3] = &unk_1E16BB9A0;
  v10 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 48);
  v13[1] = 3221225472;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v12 = *(_OWORD *)(a1 + 72);
  v19 = *(_OWORD *)(a1 + 56);
  v20 = v12;
  v14 = v10;
  objc_msgSend(v11, "transferExecutionToMainThreadWithTask:", v13);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;

}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (CGRectIsEmpty(*(CGRect *)(a1 + 48)))
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "animateAutocorrectionToRect:fromRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 32), "didApplyAutocorrection:autocorrectPromptFrame:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    objc_msgSend(v3, "returnExecutionToParentWithInfo:", *(_QWORD *)(a1 + 40));
  }

}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rect");
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

void __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rect");
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

uint64_t __91___UIKeyboardStateManager_acceptAutocorrection_executionContextPassingTIKeyboardCandidate___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstRect");
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
}

void __109___UIKeyboardStateManager_addWordTerminator_afterSpace_afterAcceptingCandidate_elapsedTime_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v12 = a2;
  objc_msgSend(v3, "autocorrectionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasAutocorrection"))
  {
    objc_msgSend(*(id *)(a1 + 32), "autocorrectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autocorrection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isForShortcutConversion") ^ 1;

  }
  else
  {
    v7 = 1;
  }

  v8 = objc_msgSend(*(id *)(a1 + 40), "isContinuousPathConversion");
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = 1;
  if ((v7 & 1) == 0 && (v8 & 1) == 0)
    v11 = objc_msgSend(v9, "shouldShowLongPredictionList");
  objc_msgSend(v9, "completeAddInputString:generateCandidates:", v10, v11);
  objc_msgSend(v12, "returnExecutionToParent");

}

uint64_t __69___UIKeyboardStateManager_movePhraseBoundaryToDirection_granularity___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "adjustPhraseBoundaryInForwardDirection:granularity:executionContext:", *(_QWORD *)(a1 + 40) == 0, *(unsigned int *)(a1 + 48), a2);
}

void __67___UIKeyboardStateManager_deleteOnceFromInputWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned int *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "completeDeleteOnceFromInputWithCharacterBefore:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

uint64_t __53___UIKeyboardStateManager__deleteFromInputWithFlags___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteFromInputWithFlags:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __52___UIKeyboardStateManager_deleteFromInputWithFlags___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteFromInputWithFlags:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __49___UIKeyboardStateManager_undoWithKeyboardInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleKeyboardInput:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];

  v9 = a2;
  if (objc_msgSend(v9, "_containsEmojiOnly"))
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    *a7 = 1;
  }
  else if (objc_msgSend(v9, "_isSpace"))
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  else
  {
    v10 = (void *)a1[4];
    v11 = objc_msgSend(v10, "length");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_2;
    v12[3] = &unk_1E16BBAB8;
    v12[4] = a1[5];
    objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 259, v12);
    *a7 = 1;
  }

}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a4;
  *a7 = 1;
  return result;
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteBackward:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteOnceFromInputWithExecutionContext:", a2);
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteBackward:", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __93___UIKeyboardStateManager_performAutoDeleteNumberOfTimes_deleteOneWord_forwardToInputSource___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteBackward");
}

uint64_t __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_2;
  v3[3] = &unk_1E16BAF98;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "transferExecutionToMainThreadWithTask:", v3);
}

void __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_3;
  v4[3] = &unk_1E16BAF98;
  v4[4] = v2;
  objc_msgSend(a2, "childWithContinuation:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDocumentStateToInputDelegateWithExecutionContext:", v3);

}

uint64_t __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncInputManagerToKeyboardStateWithExecutionContext:", a2);
}

void __69___UIKeyboardStateManager_deleteFromInputWithFlags_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  if (!*(_BYTE *)(v4 + 274))
    goto LABEL_4;
  v5 = *(_DWORD *)(v4 + 544);
  *(_DWORD *)(v4 + 544) = v5 + 1;
  if (!v5)
  {
    v4 = *(_QWORD *)(a1 + 32);
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setNeedAutofill:", objc_msgSend((id)v4, "needAutofillLogin"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAutofillMode:", objc_msgSend(*(id *)(a1 + 32), "needAutofill"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setAutofillSubMode:", objc_msgSend(*(id *)(a1 + 32), "autofillSubMode"));
    objc_msgSend(*(id *)(a1 + 32), "completeDelete");
  }
  objc_msgSend(*(id *)(a1 + 32), "completeDeleteFromInput");
  objc_msgSend(v6, "returnExecutionToParent");

}

uint64_t __50___UIKeyboardStateManager_completeDeleteFromInput__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "inputManagerState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stringEndsWord:", v3);

  return v5;
}

uint64_t __71___UIKeyboardStateManager_acceptInlineCompletionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "endAcceptingInlineCompletionByDirectTap");
  _UIKeyboardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[_UIKeyboardStateManager acceptInlineCompletionWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Completed accept inline completion", (uint8_t *)&v6, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke(uint64_t a1, int a2, int a3)
{
  NSObject *v6;
  const char *v7;
  const char *v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD aBlock[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _UIKeyboardLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    v14 = "-[_UIKeyboardStateManager acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:]_block_invoke";
    if (a2)
      v8 = "YES";
    else
      v8 = "NO";
    *(_DWORD *)buf = 136315650;
    v16 = v8;
    v15 = 2080;
    if (a3)
      v7 = "YES";
    v17 = 2080;
    v18 = v7;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "%s Got response from keyboard UI host: didForward=%s, shouldWaitForOutput=%s", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_1002;
  aBlock[3] = &unk_1E16B1BF8;
  v12 = *(id *)(a1 + 40);
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((a2 & 1) == 0)
  {
    if (pthread_main_np() != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("_UIKeyboardStateManager.m"), 13321, CFSTR("Call must be made on main thread"));

    }
    objc_msgSend(*(id *)(a1 + 32), "_local_acceptAutocorrection");
    goto LABEL_14;
  }
  if ((a3 & 1) == 0)
  {
LABEL_14:
    v9[2](v9);
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(a1 + 32), "_setWaitingOnPerformAutocorrect:", *(_QWORD *)(a1 + 40));
LABEL_15:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

}

void __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_1002(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    if (pthread_main_np() == 1)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_2;
      block[3] = &unk_1E16B1BF8;
      v3 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
}

uint64_t __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103___UIKeyboardStateManager_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  uint64_t v12;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "autocorrectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autocorrection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "shouldApplyAcceptedAutocorrection:", v4);
  if ((_DWORD)v5)
  {

  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_hasMarkedText") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "inlineCompletionAsMarkedText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v5 = 1;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "inlineCompletionAsMarkedText");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = (void *)v7,
          objc_msgSend(*(id *)(a1 + 32), "inlineTextCompletionController"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "currentlyAcceptingInlineCompletionByDirectTap"),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      v5 = 0;
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "inlineTextCompletionController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeTextCompletionPrompt");
  }

LABEL_11:
  v11 = *(unsigned __int8 *)(a1 + 48);
  if (*(_BYTE *)(a1 + 48))
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, v5);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_shouldAcceptAutocorrectionOnSelectionChange");
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "_acceptAutocorrection");
  if (!v11)
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v5);
  }
  return result;
}

void __54___UIKeyboardStateManager__local_acceptAutocorrection__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_local_acceptAutocorrection");
  objc_msgSend(v3, "returnExecutionToParent");

}

void __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke_2;
    v6[3] = &unk_1E16B3FD8;
    v7 = v3;
    objc_msgSend(v5, "acceptAutocorrectionWithCompletionHandler:", v6);

  }
  else
  {
    objc_msgSend(v5, "_acceptAutocorrection");
    objc_msgSend(v3, "returnExecutionToParent");
  }

}

uint64_t __48___UIKeyboardStateManager__acceptAutocorrection__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "returnExecutionToParent");
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "remoteTextInputPartner");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exchangeWaitingRTIOutputOperationResponseContext:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _UIKeyboardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[_UIKeyboardStateManager acceptAutocorrection]_block_invoke";
      _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "%s Timeout while waiting for acceptAutocorrectionWithCompletionHandler:", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "transferExecutionToMainThreadWithTask:", &__block_literal_global_1009);
  }

}

uint64_t __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_1008(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exchangeWaitingRTIOutputOperationResponseContext:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _UIKeyboardLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[_UIKeyboardStateManager acceptAutocorrection]_block_invoke_2";
      _os_log_error_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, "%s Found unhandled waitingRTIOutputOperationResponseContext", buf, 0xCu);
    }

  }
  objc_msgSend(WeakRetained, "remoteTextInputPartner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_1010;
  v10[3] = &unk_1E16BBBB8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = WeakRetained;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v8, "forwardSelectorToUIHost:completionHandler:", sel_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination_, v10);

}

void __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_1010(id *a1, char a2, char a3)
{
  void *v5;
  int v6;

  if ((a2 & 1) == 0)
    objc_msgSend(a1[4], "_local_acceptAutocorrection");
  if ((a3 & 1) == 0)
  {
    objc_msgSend(a1[5], "remoteTextInputPartner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "compareWaitingRTIOutputOperationResponseContext:andExchange:", a1[6], 0);

    if (v6)
      objc_msgSend(a1[6], "transferExecutionToMainThreadWithTask:", &__block_literal_global_1012);
  }
}

uint64_t __47___UIKeyboardStateManager_acceptAutocorrection__block_invoke_2_1011(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

uint64_t __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35[2];
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40[2];
  id location;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = (void *)(*(_QWORD *)(v10 + 664) + 1);
    *(_QWORD *)(v10 + 664) = v11;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_2;
    v36[3] = &unk_1E16BBC08;
    v12 = v40;
    objc_copyWeak(v40, &location);
    v40[1] = v11;
    v13 = v8;
    v37 = v13;
    v38 = v9;
    v39 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "setChooseSupplementalCandidateCompletion:", v36);
    objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "input");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textOperation_chooseSupplementalItem:toReplaceText:", v7, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "inputSystemSourceSession");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16 && v17)
    {
      objc_msgSend(v16, "customInfoType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textOperations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCustomInfoType:", v19);

      objc_msgSend(v16, "customInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textOperations");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCustomInfo:", v21);

      objc_msgSend(v18, "flushOperations");
    }

    v23 = v37;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_respondsToSelector();

    if ((v25 & 1) == 0)
    {
      v29 = 0;
      goto LABEL_10;
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    v26 = *(_QWORD *)(a1 + 32);
    v27 = (void *)(*(_QWORD *)(v26 + 664) + 1);
    *(_QWORD *)(v26 + 664) = v27;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 1;
    objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_3;
    v31[3] = &unk_1E16BC0D0;
    v12 = v35;
    objc_copyWeak(v35, &location);
    v35[1] = v27;
    v32 = v8;
    v33 = v9;
    v34 = *(id *)(a1 + 40);
    objc_msgSend(v28, "_chooseSupplementalItemToInsert:replacementRange:completionHandler:", v7, v33, v31);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;
    v23 = v32;
  }

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  v29 = 1;
LABEL_10:

  return v29;
}

void __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 64);
    if (v6 == objc_msgSend(WeakRetained, "lastChooseSupplementalItemToInsertCallbackIdentifier"))
    {
      objc_msgSend(v5, "setPendingSupplementalCandidateToInsert:", 0);
      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 32), "input");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_rangeForSupplementalItemText:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "inputDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "_range:isEqualToRange:", *(_QWORD *)(a1 + 40), v8);

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3[1], "identifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setSupplementalItemIdentifiers:", v12);

          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }

      }
    }
  }

}

void __67___UIKeyboardStateManager__acceptSupplementalCandidate_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(_QWORD *)(a1 + 64);
    if (v6 == objc_msgSend(WeakRetained, "lastChooseSupplementalItemToInsertCallbackIdentifier"))
    {
      objc_msgSend(v5, "setPendingSupplementalCandidateToInsert:", 0);
      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 32), "input");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_rangeForSupplementalItemText:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "inputDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "_range:isEqualToRange:", *(_QWORD *)(a1 + 40), v8);

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3[1], "identifier"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setSupplementalItemIdentifiers:", v12);

          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }

      }
    }
  }

}

void __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "backendController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_2;
  v10[3] = &unk_1E16BBC58;
  v11 = v3;
  v9 = v3;
  objc_msgSend(v5, "candidateAccepted:keyboardState:candidateRquestToken:completionHandler:", v6, v7, v8, v10);

}

uint64_t __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "returnExecutionToParent");
}

void __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "nextCandidateReplacementSource");

    +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNextCandidateReplacementSource:", 0);

    objc_msgSend(WeakRetained, "taskQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_4;
    v9[3] = &unk_1E16BBCA8;
    v12 = v6;
    v10 = WeakRetained;
    v11 = v3;
    v13 = *(_BYTE *)(a1 + 40);
    objc_msgSend(v8, "addTask:", v9);

  }
}

uint64_t __65___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNextCandidateReplacementSource:", v3);

  objc_msgSend(*(id *)(a1 + 32), "acceptPredictiveInput:appendSeparator:executionContext:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), v4);
  if (objc_msgSend(*(id *)(a1 + 32), "predictionType") == 1)
    return objc_msgSend(*(id *)(a1 + 32), "setPredictionType:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "predictionType");
  if ((_DWORD)result == 3)
    return objc_msgSend(*(id *)(a1 + 32), "setPredictionType:", 0);
  return result;
}

void __48___UIKeyboardStateManager_rejectAutocorrection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "inputManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidateRejected:", *(_QWORD *)(a1 + 40));

  objc_msgSend(v5, "returnExecutionToParent");
}

void __40___UIKeyboardStateManager_textAccepted___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", v5);

  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 40), "textAccepted:executionContext:", *(_QWORD *)(a1 + 48), v6);
  else
    objc_msgSend(v6, "returnExecutionToParent");

}

void __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke_2;
  v6[3] = &unk_1E16BB0D8;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "transferExecutionToMainThreadWithTask:", v6);

}

void __57___UIKeyboardStateManager_textAccepted_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  if ((objc_msgSend(v3, "usesCandidateSelection") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "syncKeyboardToConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "finishTextChanged");
  objc_msgSend(v4, "returnExecutionToParent");

}

uint64_t __64___UIKeyboardStateManager_acceptAutofillExtraCandidateIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAcceptedCandidate:", *(_QWORD *)(a1 + 32));
}

void __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  *((_BYTE *)a1[4] + 170) = 1;
  if (objc_msgSend(a1[5], "length"))
  {
    objc_msgSend(a1[4], "documentState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contextAfterInput");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hasPrefix:", a1[5]) & 1) != 0)
    {
      objc_msgSend(a1[4], "documentState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextBeforeInput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hasSuffix:", a1[5]);

      if (v7)
        objc_msgSend(a1[4], "deleteForwardAndNotify:", 0);
    }
    else
    {

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 97);
  objc_msgSend(WeakRetained, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "triggerSpaceKeyplaneSwitchIfNecessary");

  objc_msgSend(a1[6], "input");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBAnalyticsDispatcher didCandidateReplacementWithRemovedText:insertedText:](UIKBAnalyticsDispatcher, "didCandidateReplacementWithRemovedText:insertedText:", v10, v11);

  if (+[_UISmartReplyFeedbackManager candidateIsSmartReply:](_UISmartReplyFeedbackManager, "candidateIsSmartReply:", a1[6]))
  {
    objc_msgSend(a1[4], "smartReplyFeedbackManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 78), "inputContextHistory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "threadIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userSelectedSmartReply:isLongForm:withMailOrMsgThreadId:", v13, 0, v15);

  }
  objc_msgSend(v16, "returnExecutionToParent");

}

void __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  char v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPreviousInputString:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 161) = 0;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v5 = *(void **)(a1 + 40);
  v6 = v5;

  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke_3;
  v9[3] = &unk_1E16BBCF8;
  v10 = *(_BYTE *)(a1 + 48);
  v9[4] = v7;
  objc_msgSend(v3, "childWithContinuation:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textAccepted:executionContext:", v6, v8);

}

void __82___UIKeyboardStateManager_acceptPredictiveInput_appendSeparator_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_BYTE *)(v3 + 508);
    *(_BYTE *)(v3 + 508) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 321) = 1;
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertTextAfterSelection:", CFSTR(" "));

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 321) = 0;
    +[UIKBAnalyticsDispatcher sharedInstance](UIKBAnalyticsDispatcher, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNextCandidateReplacementSource:", 0);

    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      objc_msgSend(*(id *)(a1 + 32), "inputSystemSourceSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "textOperations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "keyboardOutput");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setInsertionTextAfterSelection:", CFSTR(" "));

        objc_msgSend(v8, "flushOperations");
      }

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = v4;
  }
  objc_msgSend(v11, "returnExecutionToParent");

}

uint64_t __52___UIKeyboardStateManager_acceptCandidate_forInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  return v5;
}

uint64_t __54___UIKeyboardStateManager_handleDeletionForCandidate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDeletionCount:", *(_QWORD *)(a1 + 32));
}

void __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "taskQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_2;
  v10[3] = &unk_1E16BB128;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "performSingleTask:", v10);

}

uint64_t __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "acceptCandidate:forInput:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __58___UIKeyboardStateManager_acceptCurrentCandidateForInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __57___UIKeyboardStateManager_acceptInlineCandidateForInput___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "acceptCandidate:forInput:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

void __69___UIKeyboardStateManager_acceptCandidate_forInput_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "completeAcceptCandidate:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __47___UIKeyboardStateManager_acceptFirstCandidate__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "acceptCandidate:forInput:executionContext:", *(_QWORD *)(a1 + 40), 0, a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 560), "wordSeparator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "insertText:updateInputSource:", v4, 0);

  }
}

uint64_t __59___UIKeyboardStateManager_acceptCurrentCandidateIfSelected__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "acceptCurrentCandidateIfSelectedWithExecutionContext:", a2);
}

void __80___UIKeyboardStateManager_acceptCurrentCandidateIfSelectedWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "completeAcceptCandidate:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __56___UIKeyboardStateManager_candidateListAcceptCandidate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = a2;
  objc_msgSend(v3, "currentCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "defaultCandidate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(*(id *)(a1 + 32), "acceptPredictiveInput:executionContext:", v8, v4);
}

void __45___UIKeyboardStateManager_acceptRecentInput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  void *v10;
  id v11;

  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __45___UIKeyboardStateManager_acceptRecentInput___block_invoke_2;
  v9 = &unk_1E16BB0D8;
  v3 = *(void **)(a1 + 40);
  v10 = *(void **)(a1 + 32);
  v4 = v10;
  v11 = v3;
  objc_msgSend(a2, "childWithContinuation:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleClearWithExecutionContext:", v5, v6, v7, v8, v9, v10);

}

uint64_t __45___UIKeyboardStateManager_acceptRecentInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addInputString:withFlags:executionContext:", *(_QWORD *)(a1 + 40), 128, a2);
}

uint64_t __42___UIKeyboardStateManager_addInputObject___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addInputObject:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __59___UIKeyboardStateManager_addInputObject_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "updateTextCandidateView");
  objc_msgSend(v3, "returnExecutionToParent");

}

uint64_t __59___UIKeyboardStateManager_addInputObject_executionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeAcceptCandidateBeforeAddingInputObject:executionContext:", *(_QWORD *)(a1 + 40), a2);
}

void __91___UIKeyboardStateManager_completeAcceptCandidateBeforeAddingInputObject_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "completeAddInputString:", 0);
  objc_msgSend(v3, "returnExecutionToParent");

}

void __59___UIKeyboardStateManager_acceptWord_firstDelete_forInput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v4, "setAcceptedCandidate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v4, "acceptedCandidate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(v4, "insertText:", *(_QWORD *)(a1 + 40));
  }

}

void __59___UIKeyboardStateManager_acceptWord_firstDelete_forInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(v4, "setAcceptedCandidate:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v4, "acceptedCandidate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      objc_msgSend(v4, "insertText:", *(_QWORD *)(a1 + 40));
  }

}

void __46___UIKeyboardStateManager_processPayloadInfo___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateRespectingForwardingDelegate:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x1E0DBE350]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v13 = 0;
      goto LABEL_5;
    }
    objc_msgSend(*(id *)(a1 + 32), "autofillController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "autofillGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", CFSTR("password"));
    v2 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v2, "__isKindOfUIResponder"))
    {
      v2 = v2;
      objc_msgSend(v2, "becomeFirstResponder");
      v13 = v2;
      goto LABEL_4;
    }
  }
  v13 = 0;
LABEL_4:

LABEL_5:
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __46___UIKeyboardStateManager_processPayloadInfo___block_invoke_2;
  v18 = &unk_1E16BB538;
  v4 = *(void **)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v4, "performKeyboardOutputOnInputSourceSession:", &v15);
  objc_msgSend(v13, "resignFirstResponder");
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("AutofillOneTimeCodeAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isExtensionInputMode");

    if (v8)
    {
      +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "switchToCurrentSystemInputMode");

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "performKeyboardOutputInfo:", *(_QWORD *)(a1 + 40), v13, v15, v16, v17, v18);

}

void __46___UIKeyboardStateManager_processPayloadInfo___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v3, "setCustomInfo:", v4);

}

void __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke(id *a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;

  v32 = a2;
  objc_msgSend(a1[4], "currentCandidateRequest");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = a1[5];
    objc_msgSend(a1[4], "currentCandidateRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "isSameRequestAs:", v6);

    if ((v5 & 1) != 0)
      goto LABEL_6;
  }
  objc_msgSend(a1[6], "predictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAutofillCandidate");

  if (!v9)
    goto LABEL_12;
  objc_msgSend(a1[4], "delegateForCandidateRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke_2;
  v33[3] = &unk_1E16BBDE0;
  v34 = a1[5];
  objc_msgSend(v10, "keysOfEntriesPassingTest:", v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v11, "count"))
  {

    goto LABEL_12;
  }
  objc_msgSend(a1[4], "delegateForCandidateRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "anyObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a1[4], "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueWithPointer:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "isEqual:", v17);

  if (!v18)
  {
LABEL_12:
    objc_msgSend(v32, "returnExecutionToParent");
    goto LABEL_13;
  }
LABEL_6:
  v19 = a1[6];
  v20 = objc_msgSend(v19, "sourceForAutocorrection");
  v21 = a1[4];
  objc_msgSend(v19, "corrections");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "autocorrection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v21, "shouldAcceptContinuousPathConversion:", v23);

  if ((_DWORD)v21)
  {
    v24 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend(v19, "predictions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "emojiList");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "listWithCorrections:predictions:emojiList:", 0, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v27;
  }
  *((_QWORD *)a1[4] + 80) = v20;
  objc_msgSend(a1[4], "inputManagerDidGenerateAutocorrections:executionContext:", v19, v32);
  if (_os_feature_enabled_impl())
  {
    v28 = a1[4];
    v29 = (void *)v28[103];
    v28[103] = 0;

  }
  objc_msgSend(a1[4], "smartReplyFeedbackManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "predictions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "updateCandidates:", v31);

LABEL_13:
}

uint64_t __60___UIKeyboardStateManager_pushAutocorrections_requestToken___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSameRequestAs:", a2);
}

void __63___UIKeyboardStateManager_pushCandidateResultSet_requestToken___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentCandidateRequest");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentCandidateRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isSameRequestAs:", v6);

    if ((_DWORD)v5)
      objc_msgSend(*(id *)(a1 + 32), "inputManagerDidGenerateCandidateResultSet:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(v7, "returnExecutionToParent");

}

void __49___UIKeyboardStateManager_setAutocorrectionList___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_supplementalCandidateIcon:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIcon:", v4);

}

uint64_t __46___UIKeyboardStateManager_removeCandidateList__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setUIKeyboardCandidateListDelegate:", 0);
}

void __41___UIKeyboardStateManager_setCandidates___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0DBDB70];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithAutocorrection:alternateCorrections:", *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", v6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "inputManagerDidGenerateAutocorrections:executionContext:", v5, v4);

}

void __62___UIKeyboardStateManager_touchDelayDeleteTimerWithThreshold___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "deleteWordLastDelete");
  if (v3 <= -*MEMORY[0x1E0C9ADE8])
  {
    objc_msgSend(v4, "returnExecutionToParent");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDeleteWordLastDelete:");
    objc_msgSend(*(id *)(a1 + 32), "handleDeleteWithExecutionContext:", v4);
  }

}

void __47___UIKeyboardStateManager_applyAutocorrection___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setDocumentStateForAutocorrection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_textChoicesAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackUnderlineForWebKitCandidate:", *(_QWORD *)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;
}

void __47___UIKeyboardStateManager_applyAutocorrection___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setDocumentStateForAutocorrection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_textChoicesAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackUnderlineForWebKitCandidate:", *(_QWORD *)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;
}

void __52___UIKeyboardStateManager_populateEuclidCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isSelectionAtSentenceAutoshiftBoundary:", 1);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        if (v4)
        {
          +[UIDictationUtilities capitalizeFirstWord:](UIDictationUtilities, "capitalizeFirstWord:", v11);
          v12 = objc_claimAutoreleasedReturnValue();

          v11 = (id)v12;
        }
        objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:property:", v11, *(_QWORD *)(a1 + 40), 32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", 0, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __52___UIKeyboardStateManager_populateEuclidCandidates___block_invoke_2;
  v17[3] = &unk_1E16B4030;
  v20 = *(_BYTE *)(a1 + 48);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v5;
  v19 = v14;
  v15 = v14;
  v16 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

void __52___UIKeyboardStateManager_populateEuclidCandidates___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_BYTE *)(a1 + 56))
  {
    v1 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DBDBE0], "setWithCandidates:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setCandidates:", v2);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "autocorrectionController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAutocorrectionList:", v3);
  }

  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logEuclidRequested");

}

uint64_t __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v3 = (void *)a1[4];
  v2 = a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke_2;
  v5[3] = &unk_1E16BBE80;
  v5[4] = a1[6];
  return objc_msgSend(v3, "generateReplacementsForString:candidatesHandler:executionContext:", v2, v5, a2);
}

void __62___UIKeyboardStateManager_generateAutocorrectionReplacements___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", 0, a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setAutocorrectionListUIDisplayed:", 1);
  objc_msgSend(*(id *)(a1 + 40), "backendController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_2;
  v8[3] = &unk_1E16BBED0;
  v6 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v4, "generateAutocorrectionsWithKeyboardState:completionHandler:", v5, v8);

}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_3;
  v7[3] = &unk_1E16BBEA8;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "transferExecutionToMainThreadWithTask:", v7);

}

void __68___UIKeyboardStateManager_generateAutocorrectionListForSelectedText__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
  v3 = a2;
  objc_msgSend(v3, "returnExecutionToParent");

}

void __88___UIKeyboardStateManager_touchAutoDeleteTimerWithThreshold_adjustForPartialCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "touchAutoDeleteTimerWithThreshold:adjustForPartialCompletion:", 0, *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "handleAutoDeleteWithExecutionContext:", v3);

}

void __63___UIKeyboardStateManager_performStopAutoDeleteAtDocumentStart__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_stopAutoDeleteAtDocumentStart");
  objc_msgSend(v3, "returnExecutionToParent");

}

void __64___UIKeyboardStateManager_handleAutoDeleteWithExecutionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "completeHandleAutoDelete");
  objc_msgSend(v3, "returnExecutionToParent");

}

void __56___UIKeyboardStateManager_handleDelayedActionLongPress___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  id v5;

  v3 = a2;
  v4 = (_QWORD *)a1[5];
  v5 = v3;
  if (a1[4] == v4[12])
  {
    objc_msgSend(v4, "longPressAction:", a1[6]);
    v3 = v5;
  }
  objc_msgSend(v3, "returnExecutionToParent");

}

uint64_t __109___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWebKeyEvent:withEventType:withInputString:withInputStringIgnoringModifiers:executionContext:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2);
}

void __126___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_executionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "returnExecutionToParentWithInfo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

void __126___UIKeyboardStateManager__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_executionContext___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (**v5)(id);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  int v12;
  void (**v13)(id);

  objc_msgSend(*(id *)(a1 + 32), "takeOwnershipOfPendingCompletionBlock");
  v5 = (void (**)(id))objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v13 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v13[2](v13);
    v5 = v13;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_DWORD *)(v9 + 104);
    v11 = __OFSUB__(v10, 1);
    v12 = v10 - 1;
    if (v12 < 0 == v11)
      *(_DWORD *)(v9 + 104) = v12;
  }

}

uint64_t __70___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWebKeyEvent:withIndex:inInputString:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWebKeyEvent:withIndex:inInputString:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64) + *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  _BYTE *v6;
  uint64_t v7;

  v5 = a2;
  v6 = *(_BYTE **)(a1 + 32);
  if (v6[269])
  {
LABEL_2:
    v6[269] = 0;
    objc_msgSend(*(id *)(a1 + 32), "setExternalTask:", 0);
    objc_msgSend(v5, "returnExecutionToParent");
    v7 = 1;
    goto LABEL_3;
  }
  v7 = 0;
  if (!v6[270] && (a3 & 1) == 0)
  {
    objc_msgSend(v6, "handleKeyAppCommandForCurrentEvent");
    v6 = *(_BYTE **)(a1 + 32);
    if (!v6[269])
    {
      v7 = 0;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v7;
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  int v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 40) || (v7 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v7 + 271)))
  {
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 776));
    objc_msgSend(WeakRetained, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v6 = objc_msgSend(*(id *)(a1 + 32), "callLayoutUsesAutoShift");
    else
      v6 = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "externalTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 273) = 0;
      objc_msgSend(*(id *)(a1 + 32), "setShiftNeedsUpdate");
    }
    objc_msgSend(*(id *)(a1 + 32), "externalTask");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExternalTask:", 0);
    objc_msgSend(v13, "childWithContinuation:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v12);

  }
  else
  {
    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 273) = 1;
      objc_msgSend(*(id *)(a1 + 32), "setShiftOffIfNeeded");
    }
    v5[2](v5, v13);
  }

}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_5;
  v8[3] = &unk_1E16BBFC0;
  v7 = *(id *)(a1 + 40);
  v12 = v6;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v3, "transferExecutionToMainThreadWithTask:", v8);

}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_5(uint64_t a1, void *a2)
{
  char v3;
  id v4;

  v4 = a2;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setEventForCurrentWebEvent:", 0);
  if ((v3 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_7;
  v5[3] = &unk_1E16BC010;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  objc_msgSend(a2, "transferExecutionToMainThreadWithTask:", v5);

}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _UIKeyboardImplHeldOperation *v10;
  uint64_t v11;
  void *v12;
  _UIKeyboardImplHeldOperation *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _UIKeyboardImplHeldOperation *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD aBlock[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v3 = a2;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "BOOLValue");

  }
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_8;
  aBlock[3] = &unk_1E16BC010;
  v7 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v24 = v7;
  v25 = *(id *)(a1 + 48);
  v26 = *(id *)(a1 + 56);
  v27 = *(id *)(a1 + 64);
  v28 = *(id *)(a1 + 72);
  v29 = *(id *)(a1 + 80);
  v8 = _Block_copy(aBlock);
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))() & 1) == 0)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "source");
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
    {
      v10 = -[_UIKeyboardImplHeldOperation initWithOperation:]([_UIKeyboardImplHeldOperation alloc], "initWithOperation:", v8);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 480);
      *(_QWORD *)(v11 + 480) = v10;
      v13 = v10;

      v14 = *(void **)(a1 + 32);
      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_12;
      v20[3] = &unk_1E16B2F48;
      v22 = *(id *)(a1 + 72);
      v21 = v3;
      objc_msgSend(v14, "performOperations:withTextInputSource:", v20, v9);

    }
    else
    {
      v15 = *(void **)(a1 + 32);
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_14;
      v16[3] = &unk_1E16BC058;
      v18 = (_UIKeyboardImplHeldOperation *)*(id *)(a1 + 72);
      v17 = v3;
      v19 = v8;
      objc_msgSend(v15, "performOperations:withTextInputSource:", v16, v9);

      v13 = v18;
    }

  }
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "taskQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_9;
  v7[3] = &unk_1E16BC010;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 80);
  objc_msgSend(v5, "addTask:", v7);

  objc_msgSend(v4, "returnExecutionToParent");
}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_9(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 271) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 270) = 0;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_10;
  v13 = &unk_1E16BBFE8;
  v8 = *(id *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = *(id *)(a1 + 72);
  v17 = *(id *)(a1 + 80);
  objc_msgSend(a2, "childWithContinuation:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_handleWebKeyEvent:withEventType:withInputString:withInputStringIgnoringModifiers:executionContext:", v5, 5, v6, v7, v9, v10, v11, v12, v13, v14);

}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_11;
  v8[3] = &unk_1E16BBFC0;
  v7 = *(id *)(a1 + 40);
  v12 = v6;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v3, "transferExecutionToMainThreadWithTask:", v8);

}

void __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_11(uint64_t a1, void *a2)
{
  char v3;
  id v4;

  v4 = a2;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setEventForCurrentWebEvent:", 0);
  if ((v3 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), &__block_literal_global_1204);
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_13(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

uint64_t __87___UIKeyboardStateManager__handleWebKeyEvent_withIndex_inInputString_executionContext___block_invoke_14(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

void __60___UIKeyboardStateManager__handleKeyEvent_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "flushTouchEventWaitingForKeyInputEventIfNecessary");
  objc_msgSend(v3, "returnExecutionToParent");

}

uint64_t __42___UIKeyboardStateManager_handleKeyEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handleKeyEvent:executionContext:", *(_QWORD *)(a1 + 40), a2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isSecureTextEntry"))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "source") == 4)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "_isKeyDown"))
      {
        objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "keyInputDelegate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "keyInputDelegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "_fieldEditor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "set_shouldObscureNextInput:", 1);

        }
      }
    }
  }
  result = +[UIKeyboard isCapslockIndicatorEnabled](UIKeyboard, "isCapslockIndicatorEnabled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setCapsLockIfNeeded");
  return result;
}

uint64_t __59___UIKeyboardStateManager_handleKeyEvent_executionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleKeyWithString:forKeyEvent:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __76___UIKeyboardStateManager_handleKeyWithString_forKeyEvent_executionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "completeHandleKeyEvent:", v3);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __76___UIKeyboardStateManager_handleKeyWithString_forKeyEvent_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a2;
  objc_msgSend(v3, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("UIKeyboardReturnKeyPressed"), v5);

  objc_msgSend(*(id *)(a1 + 32), "completeHandleKeyEvent:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "returnExecutionToParent");

}

void __76___UIKeyboardStateManager_handleKeyWithString_forKeyEvent_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  unsigned __int8 *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  v3 = *(unsigned __int8 **)(a1 + 32);
  v4 = v3[521];
  v5 = a2;
  objc_msgSend(v3, "setShouldSkipCandidateSelection:userInitiated:", v4, 0);
  objc_msgSend(*(id *)(a1 + 32), "inlineTextCompletionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentingTextCompletionAsMarkedText");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "usesCandidateSelection") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "inlineTextCompletionController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentingTextCompletionAsMarkedText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v14, "length")
        || (objc_msgSend(*(id *)(a1 + 32), "_markedText"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "isEqualToString:", v14),
            v11,
            (v12 & 1) == 0))
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 1;
        objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unmarkText");

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "completeHandleKeyEvent:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "returnExecutionToParent");

}

uint64_t __68___UIKeyboardStateManager_enableTransientInputDelegateSelectionMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableTransientSelectionMode");
}

void __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v3 = a2;
  if (*(_BYTE *)(a1 + 72))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 1;
  v4 = *(unsigned __int8 *)(a1 + 73);
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSuppressSoftwareKeyboard");

  v7 = objc_msgSend(*(id *)(a1 + 40), "length");
  if (v4)
    v8 = 1;
  else
    v8 = v6;
  if (v7 || (v8 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "markedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "length"))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "showingEmojiSearch");

      if ((v10 & 1) != 0)
        goto LABEL_12;
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v11, "inputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "replaceAllTextInResponder:withText:", v9, *(_QWORD *)(a1 + 40));
    }

  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_textRangeFromNSRange:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSelectedTextRange:", v13);

  objc_msgSend(*(id *)(a1 + 32), "updateReturnKey:", 0);
  if (*(_BYTE *)(a1 + 72))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 508) = 0;
  objc_msgSend(*(id *)(a1 + 48), "markedText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (!v16)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 1;
    objc_msgSend(*(id *)(a1 + 32), "clearInput");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 121) = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setDocumentState:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "resumeDictationForResponderChange");
  if ((+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
     || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI"))&& objc_msgSend(*(id *)(a1 + 32), "isRTIClient"))
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "documentStateChanged:", 1);

  }
  if (*(_BYTE *)(a1 + 72))
  {
    v18 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke_2;
    v20[3] = &unk_1E16BAF98;
    v20[4] = v18;
    objc_msgSend(v3, "childWithContinuation:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "syncInputManagerToKeyboardStateWithExecutionContext:", v19);

  }
  else
  {
    objc_msgSend(v3, "returnExecutionToParent");
  }

}

void __111___UIKeyboardStateManager_updateInputDelegateForRemoteDocumentStateChange_selectedTextRange_hasText_forceSync___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v3 = *(void **)(a1 + 32);
  v14 = a2;
  if (objc_msgSend(v3, "shouldGenerateCandidatesAfterSelectionChange"))
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "oldPathForSnapshot")
      && !+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "visualModeManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "useVisualModeWindowed");

      if (!v13)
        goto LABEL_6;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "generateCandidates");
  }
LABEL_6:
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEmpty");

    if ((v7 & 1) == 0)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "inputDelegateManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedTextRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentTextChoicePromptForRange:", v10);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "completeUpdateForChangedSelection:", 1);
  objc_msgSend(v14, "returnExecutionToParent");

}

void __98___UIKeyboardStateManager_updateForExpectedRemoteDocumentStateChange_selectedTextRange_forceSync___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "updateReturnKey:", 0);
  objc_msgSend(v3, "returnExecutionToParent");

}

uint64_t __92___UIKeyboardStateManager_assertTextForRemoteDocument_withSelectionDelta_updatingSelection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForChangedSelection");
}

void __92___UIKeyboardStateManager_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "remoteTextInputPartner");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "forwardEventCallbackToRemoteSource_didChooseSupplementalItem:toReplaceText:", v6, v5);

}

void __92___UIKeyboardStateManager_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained
    && (v5 = *(_QWORD *)(a1 + 64),
        v5 == objc_msgSend(WeakRetained, "lastChooseSupplementalItemToInsertCallbackIdentifier"))
    && (objc_msgSend(v4, "setPendingSupplementalCandidateToInsert:", 0), v10))
  {
    objc_msgSend(v4, "_rangeForSupplementalItemText:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_range:isEqualToRange:", *(_QWORD *)(a1 + 40), v6);

    if ((v8 & 1) != 0)
      v9 = v10;
    else
      v9 = 0;
    (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v9, *(_QWORD *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __107___UIKeyboardStateManager_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "canSuggestSupplementalItemsForCurrentSelection");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 624), "setCanSuggestSupplementalItemsForCurrentSelection:", *(unsigned __int8 *)(a1 + 40));
  if (*(unsigned __int8 *)(a1 + 40) != v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "usesCandidateSelection");
    v5 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v5, "generateCandidatesAsynchronouslyWithRange:selectedCandidate:", 0, 0x7FFFFFFFLL, 0);
    }
    else
    {
      objc_msgSend(v5, "autocorrectionController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNeedsAutocorrection");

    }
  }
  objc_msgSend(v7, "returnExecutionToParent");

}

void __77___UIKeyboardStateManager_handleEventFromRemoteSource_insertAutofillContent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v3, "performKeyboardOutput:", v4);
  objc_msgSend(*(id *)(a1 + 32), "remoteTextInputPartner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentStateChanged");

  objc_msgSend(v6, "returnExecutionToParent");
}

void __50___UIKeyboardStateManager_createTypoTrackerReport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50___UIKeyboardStateManager_createTypoTrackerReport__block_invoke_2;
  v5[3] = &unk_1E16B1B50;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __50___UIKeyboardStateManager_createTypoTrackerReport__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentKeyboardFeedbackAssistantViewControllerForLogURL:", *(_QWORD *)(a1 + 40));
}

void __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v5 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "source");
  v4 = *(void **)(a1 + 40);
  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke_2;
    v6[3] = &unk_1E16B47A8;
    v6[4] = v4;
    v7 = *(id *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v4, "performOperations:withTextInputSource:", v6, objc_msgSend(*(id *)(a1 + 32), "source"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_processInputViewControllerKeyboardOutput:executionContext:", *(_QWORD *)(a1 + 32), v5);
  }

}

uint64_t __61___UIKeyboardStateManager__performInputViewControllerOutput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processInputViewControllerKeyboardOutput:executionContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __51___UIKeyboardStateManager__requestInputManagerSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncInputManagerToKeyboardStateWithExecutionContext:", a2);
}

void __71___UIKeyboardStateManager_showFirstTextAlternativeWithRangeAdjustment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  id v19;

  v9 = a2;
  if (v9)
  {
    v19 = v9;
    objc_msgSend(*(id *)(a1 + 32), "inputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactionAssistant");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "inputDelegateManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_textRangeFromNSRange:", a3, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scheduleDictationReplacementsForAlternatives:range:", v19, v13);

    v9 = v19;
    *a5 = 1;
  }
  v14 = a3 + a4;
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(_QWORD *)(a1 + 32);
  if (v15 >= a3 + a4)
  {
    v17 = v15 - (a3 + a4);
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 48);
    v17 = 0;
  }
  *(_QWORD *)(v16 + 328) = v14;
  *(_QWORD *)(v16 + 336) = v17;
  if (*a5)
    v18 = 0;
  else
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) == 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v18;

}

@end
