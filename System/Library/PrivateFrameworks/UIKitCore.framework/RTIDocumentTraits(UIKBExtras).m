@implementation RTIDocumentTraits(UIKBExtras)

+ (id)currentRTIDocumentTraitsForAutoFillPanel
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
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
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_class *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  char isKindOfClass;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[13];
  _QWORD v101[13];
  void *v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0D87180]);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTextInputTraits:", v3);

  objc_msgSend(v1, "delegateAsResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "textInputContextIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setTextInputContextIdentifier:", v5);

  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputModeForResponder:", v4);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v0, "setTextInputModeData:", v8);

  }
  v92 = (void *)v7;
  objc_msgSend(v4, "_additionalTextInputLocales");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v97 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * i), "localeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
    objc_msgSend(v0, "setAdditionalLocaleIdentifiers:", v10);
  objc_msgSend(v2, "recipientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setRecipientId:", v17);

  objc_msgSend(v2, "responseContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setResponseContext:", v18);

  objc_msgSend(v2, "inputContextHistory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v0, "setInputContextHistory:", v20);

  objc_msgSend(v2, "supportedPayloadIds");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setSupportedPayloadIds:", v21);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "textInputTraits");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setHidePrediction:", objc_msgSend(v23, "hidePrediction"));

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textInputTraits");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "disablePrediction");

  objc_msgSend(v0, "setDisablePrediction:", v26);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "inputDelegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "textInputView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShouldReverseLayoutDirection:", objc_msgSend(v29, "_shouldReverseLayoutDirection"));

  objc_msgSend(v0, "setAutofillMode:", objc_msgSend(v2, "autofillMode"));
  objc_msgSend(v0, "setAutofillSubMode:", objc_msgSend(v2, "autofillSubMode"));
  objc_msgSend(v2, "autofillContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAutofillContext:", v30);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_passwordRules");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setPasswordRules:", v32);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShouldLoadAutofillSignUp:", objc_msgSend(v33, "shouldLoadAutofillSignUpInputViewController"));

  if (objc_msgSend(v2, "supplementalLexiconIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "supplementalLexiconIdentifier"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setEnabledSupplementalLexiconIdentifiers:", v35);

  }
  else
  {
    objc_msgSend(v0, "setEnabledSupplementalLexiconIdentifiers:", 0);
  }
  objc_msgSend(v1, "keyboardStateManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDelegateConformanceType:", objc_msgSend(v36, "delegateConformanceType"));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "inputDelegate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_opt_respondsToSelector();

    if ((v38 & 1) != 0)
    {
      objc_msgSend(v1, "inputDelegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "setDisableAutomaticKeyboardUI:", objc_msgSend(v39, "_disableAutomaticKeyboardUI"));

    }
  }
  objc_msgSend(v4, "_responderWindow");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "windowScene");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "_sceneIdentifier");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setSceneID:");
  objc_msgSend(v0, "setContextID:", objc_msgSend(v40, "_contextId"));
  v91 = v40;
  objc_msgSend(v40, "layer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setLayerID:", CALayerGetRenderId());

  objc_msgSend(v0, "setSupportsImagePaste:", objc_msgSend(v1, "delegateSupportsImagePaste"));
  objc_msgSend(v1, "textInputTraits");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDevicePasscodeEntry:", objc_msgSend(v42, "isDevicePasscodeEntry"));

  objc_msgSend(v1, "textInputTraits");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDisableInputBars:", objc_msgSend(v43, "disableInputBars"));

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "delegateAsResponder");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v100[0] = CFSTR("ForceFloatingKeyboard");
  v45 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "textInputTraits");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "numberWithBool:", objc_msgSend(v87, "forceFloatingKeyboard"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v101[0] = v86;
  v100[1] = CFSTR("ForceDisableDictation");
  v46 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "textInputTraits");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "numberWithBool:", objc_msgSend(v85, "forceDisableDictation"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v101[1] = v84;
  v100[2] = CFSTR("UseAutomaticEndpointing");
  v47 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "textInputTraits");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithBool:", objc_msgSend(v83, "useAutomaticEndpointing"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v101[2] = v82;
  v100[3] = CFSTR("AcceptsDictationResults");
  v48 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v1, "textInputTraits");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "numberWithBool:", objc_msgSend(v81, "acceptsDictationSearchResults"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v101[3] = v80;
  v100[4] = CFSTR("ShouldUseDictationSearchFieldBehavior");
  v49 = (void *)MEMORY[0x1E0CB37E8];
  NSClassFromString(CFSTR("UISearchTextField"));
  v95 = v4;
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v1, "textInputTraits");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v68, "showDictationButton");
  }
  else
  {
    v50 = 0;
  }
  objc_msgSend(v49, "numberWithInt:", v50);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v101[4] = v78;
  v100[5] = CFSTR("ForceEnableDictation");
  v51 = (void *)MEMORY[0x1E0CB37E8];
  v94 = v1;
  objc_msgSend(v1, "textInputTraits");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "numberWithBool:", objc_msgSend(v77, "forceEnableDictation"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v101[5] = v76;
  v100[6] = CFSTR("ShouldSuppressSoftwareKeyboard");
  v52 = (void *)MEMORY[0x1E0CB37E8];
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "numberWithBool:", objc_msgSend(v75, "shouldSuppressSoftwareKeyboard"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v101[6] = v74;
  v100[7] = CFSTR("ShouldSuppressSoftwareKeyboardForKeyboardCamera");
  v53 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardCameraSession activeSession](UIKeyboardCameraSession, "activeSession");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "numberWithBool:", objc_msgSend(v73, "shouldSuppressSoftwareKeyboard"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v101[7] = v72;
  v100[8] = CFSTR("HasCustomInputViewController");
  v54 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "numberWithBool:", objc_msgSend(v71, "hasCustomInputViewController"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v101[8] = v70;
  v100[9] = CFSTR("SuppressAssistantBar");
  v55 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "numberWithBool:", objc_msgSend(v69, "_shouldSuppressAssistantBar"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v101[9] = v56;
  v100[10] = CFSTR("SuppressSoftwareKeyboard");
  v57 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "numberWithBool:", objc_msgSend(v58, "_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:", 0));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v101[10] = v59;
  v100[11] = CFSTR("RTIInputDelegateClassName");
  if (v95)
  {
    v60 = (objc_class *)objc_opt_class();
    NSStringFromClass(v60);
    v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = &stru_1E16EDF20;
  }
  v101[11] = v61;
  v100[12] = CFSTR("CorrectionLearningAllowed");
  v93 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "wordLearningEnabled"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v101[12] = v62;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 13);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setUserInfo:", v63);

  if (v95)
  if ((isKindOfClass & 1) != 0)

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "textInputTraits");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setSingleLineDocument:", objc_msgSend(v65, "isSingleLineDocument"));

  }
  _UIMainBundleIdentifier();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBundleId:", v66);

  return v0;
}

+ (id)translateToRTITextInputKeyboardActionButtonConfiguration:()UIKBExtras
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int16 v25;
  __int16 v26;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _UIKeyboardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_16:

      v23 = 0;
      goto LABEL_17;
    }
    v26 = 0;
    v12 = "keyboardActionButtonItem is set to nil, returning nil for the keyboardActionButtonItem";
    v13 = (uint8_t *)&v26;
LABEL_20:
    _os_log_error_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_16;
  }
  objc_msgSend(v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _UIKeyboardLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v25 = 0;
    v12 = "keyboardActionButtonItem.image is set to nil, returning nil for the keyboardActionButtonItem";
    v13 = (uint8_t *)&v25;
    goto LABEL_20;
  }
  objc_msgSend(v4, "accessibilityLabel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      objc_msgSend(v4, "accessibilityLabel");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v14 = (void *)v10;
      goto LABEL_12;
    }
  }
  objc_msgSend(v4, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v4, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (!v16)
    {
      v14 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v4, "title");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v4, "tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0D87168];
    objc_msgSend(v4, "tintColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v18, "colorWithCGColor:", objc_msgSend(v19, "CGColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v20 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(v4, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D871E0], "actionButtonWithSystemImageData:backgroundColor:accessibilityTitle:", v22, v17, v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIsEnabled:", objc_msgSend(v4, "isEnabled"));

LABEL_17:
  return v23;
}

@end
