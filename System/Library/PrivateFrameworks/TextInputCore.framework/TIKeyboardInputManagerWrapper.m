@implementation TIKeyboardInputManagerWrapper

- (void)handleKeyboardState:(id)a3
{
  -[TIKeyboardInputManagerWrapper handleKeyboardState:withInputEvent:](self, "handleKeyboardState:withInputEvent:", a3, 0);
}

- (void)setClientProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  kdebug_trace();
  kac_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, self);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "kbdManager.syncState", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v6);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = (void *)objc_msgSend(v6, "copy");
  else
    v12 = 0;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__TIKeyboardInputManagerWrapper_syncToKeyboardState_completionHandler___block_invoke;
  v24[3] = &unk_1EA0FABE8;
  v14 = v7;
  v26 = v14;
  v24[4] = self;
  v15 = v12;
  v25 = v15;
  v16 = objc_msgSend(v13, "syncToKeyboardState:completionHandler:", v6, v24);

  if ((v16 & 1) == 0)
  {
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "syncToKeyboardState:", v6);

    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyboardConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v14 + 2))(v14, v19);
    -[TIKeyboardInputManagerWrapper logger](self, "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logKeyboardConfig:forSyncToKeyboardState:", v19, v15);

    kdebug_trace();
    kac_get_log();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = os_signpost_id_make_with_pointer(v21, self);
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v21, OS_SIGNPOST_INTERVAL_END, v23, "kbdManager.syncState", ", buf, 2u);
      }
    }

  }
}

- (TIKeyboardInputManagerLogging)logger
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputManagerLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIKeyboardInputManagerLogging *)v3;
}

- (TIKeyboardInputManagerBase)inputManager
{
  return self->_inputManager;
}

- (NSString)cachedContextChangeTrigger
{
  return self->_cachedContextChangeTrigger;
}

- (void)changingContextWithTrigger:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());

  if (v5)
  {
    -[TIKeyboardInputManagerWrapper setCachedContextChangeTrigger:](self, "setCachedContextChangeTrigger:", v7);
  }
  else
  {
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changingContextWithTrigger:", v7);

  }
}

- (void)setCachedContextChangeTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_cachedContextChangeTrigger, a3);
}

- (void)setInputManager:(id)a3
{
  objc_storeStrong((id *)&self->_inputManager, a3);
}

- (TIKeyboardInputManagerWrapper)init
{
  TIKeyboardInputManagerWrapper *v2;
  TIKeyboardInputManagerBase *v3;
  TIKeyboardInputManagerBase *inputManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerWrapper;
  v2 = -[TIKeyboardInputManagerWrapper init](&v6, sel_init);
  if (v2)
  {
    v3 = -[TIKeyboardInputManagerBase initWithInputMode:keyboardState:]([TIKeyboardInputManagerBase alloc], "initWithInputMode:keyboardState:", 0, 0);
    inputManager = v2->_inputManager;
    v2->_inputManager = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedContextChangeTrigger, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
}

- (void)setLogger:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputManagerLogger:", v4);

}

- (void)handleKeyboardState:(id)a3 withInputEvent:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "canSuggestSupplementalItemsForCurrentSelection");
  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupplementalLexiconSearchEnabled:", v5);

  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supplementalLexicons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "supplementalLexiconIdentifier");

  objc_msgSend(v7, "setActiveLexiconWithIdentifier:", v8);
}

- (void)acceptSecureCandidate:(id)a3 keyboardState:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  id v78;
  id v79;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secureCandidateRenderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v17 = 0;
    goto LABEL_34;
  }
  v13 = objc_msgSend(v8, "slotID");
  v14 = v8;
  v15 = v14;
  if (v12)
    v16 = v13 == 0;
  else
    v16 = 1;
  if (v16)
  {
    v17 = v14;
    goto LABEL_34;
  }
  +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventAuthenticationMessage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "touchEventWithAuthenticationMessage:", v19);

  +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "verifySlotID:", objc_msgSend(v15, "slotID"));

  if (v21)
    objc_msgSend(v12, "cachedCandidateForSecureCandidate:", v15);
  else
    objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithUnchangedInput:", &stru_1EA1081D0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "candidate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v71, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "proactivePredictedItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "value");
      v23 = objc_claimAutoreleasedReturnValue();

      v71 = (void *)v23;
    }
  }
  v69 = v10;
  v70 = v9;
  v68 = v12;
  if (objc_msgSend(v17, "indexForMetrics"))
  {
    if (objc_msgSend(v17, "indexForMetrics") != 1)
      goto LABEL_20;
    -[TIKeyboardInputManagerBase inputMode](self->_inputManager, "inputMode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "languageWithRegion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "proactiveTrigger");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v9;
    v28 = (void *)v26;
    objc_msgSend(v27, "textInputTraits");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textContentType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticsLogProactiveSelectedSecond(v25, v28, v30, v71);
  }
  else
  {
    -[TIKeyboardInputManagerBase inputMode](self->_inputManager, "inputMode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "languageWithRegion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "proactiveTrigger");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v9;
    v28 = (void *)v31;
    objc_msgSend(v32, "textInputTraits");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textContentType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticsLogProactiveSelectedFirst(v25, v28, v30, v71);
  }

  v9 = v70;
LABEL_20:
  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self->_inputManager, "inputMode");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "languageWithRegion");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textInputTraits");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "textContentType");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "suggestionAccepted:fieldType:", v35, v37);

  objc_msgSend(v17, "proactiveTrigger");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "attributes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("subtype"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v38, "triggerSourceType") == 2
    || (objc_msgSend(v40, "isEqual:", CFSTR("recent location")) & 1) != 0
    || objc_msgSend(v40, "isEqual:", CFSTR("recent phone")))
  {
    if (objc_msgSend(v38, "triggerSourceType"))
      v41 = objc_msgSend(v38, "triggerSourceType") == 1;
    else
      v41 = 1;
    v64 = v41;
    objc_opt_class();
    v66 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v17;
    else
      v42 = 0;
    objc_msgSend(v17, "proactiveTrigger");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "attributes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("field"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    v67 = v38;
    v65 = v17;
    if (v45)
    {
      v47 = v45;
    }
    else
    {
      objc_msgSend(v17, "proactiveTrigger");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "attributes");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("type"));
      v47 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v42, "fromBundleId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v70;
    objc_msgSend(v70, "clientIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIConnectionsMetricsTracker sharedInstance](TIConnectionsMetricsTracker, "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v42, "ageForConnectionsMetrics");
    objc_msgSend(v70, "textInputTraits");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "textContentType");
    v55 = v42;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v63) = !v64;
    LOBYTE(v63) = v64;
    objc_msgSend(v52, "trackPredictionEngagmentWithConversion:age:fieldType:resultType:fromBundleId:targetApp:linguistic:semantic:", 1, v53, v56, v47, v50, v51, v63);

    v40 = v66;
    v38 = v67;
    v17 = v65;
  }

  v12 = v68;
  v10 = v69;
LABEL_34:
  if (objc_msgSend(v8, "customInfoType") == 64 || objc_msgSend(v8, "customInfoType") == 512)
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke;
    v76[3] = &unk_1EA0FAC10;
    v79 = v10;
    v77 = v17;
    v78 = v8;
    objc_msgSend(v57, "shouldAcceptOneTimeCode:completion:", v78, v76);

  }
  else if (objc_msgSend(v8, "customInfoType") == 1024)
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "presentHideMyEmailUI:keyboardState:completion:", v8, v9, v10);

  }
  else
  {
    if (objc_msgSend(v9, "needAutofill"))
    {
      +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "secureCandidateRenderer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v8, "slotID"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v8, "slotID"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke_2;
    v72[3] = &unk_1EA0FAC10;
    v75 = v10;
    v73 = v17;
    v74 = v8;
    objc_msgSend(v62, "shouldAcceptAutofill:withPayload:completion:", v74, v61, v72);

  }
}

- (void)updateAnalyticsForRejectedSuggestion:(id)a3 keyboardState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = a4;
  +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureCandidateRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v8 = objc_msgSend(v14, "slotID") != 0;
    if (!v7)
      goto LABEL_15;
  }
  else
  {
    v8 = 0;
    if (!v7)
      goto LABEL_15;
  }
  objc_msgSend(v7, "secureCandidateCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    v10 = v8;
  else
    v10 = 1;
  if ((v10 & 1) != 0)
    goto LABEL_14;
  if ((objc_msgSend(v5, "needAutofill") & 1) == 0)
  {

LABEL_13:
    +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secureCandidateCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suggestionNotAccepted:", v13);

LABEL_14:
    goto LABEL_15;
  }
  v11 = objc_msgSend(v5, "autofillMode");

  if (!v11)
    goto LABEL_13;
LABEL_15:

}

- (void)_updateKeyboardOutput:(id)a3 withSecureCandidatePayload:(id)a4 keyboardState:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v50 = a3;
  v7 = a4;
  v8 = a5;
  if (v50 && v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (id)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v50, "setCustomInfo:", v9);
LABEL_5:

      goto LABEL_16;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "stickerIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v50, "setAcceptedCandidate:", v7);
        objc_msgSend(v50, "setTextToCommit:", &stru_1EA1081D0);
        goto LABEL_16;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    v9 = v7;
    objc_msgSend(v9, "proactivePredictedItem");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_27:
      +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "usePQT2Flow");

      objc_msgSend(v9, "proactivePredictedItem");
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = (void *)v38;
      if (v37)
      {
        if (!v38)
          goto LABEL_5;
        objc_msgSend(v9, "proactivePredictedItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v40, "itemType"))
        {
          v41 = objc_msgSend(v8, "needContactAutofill");

          if (!v41)
            goto LABEL_5;
          objc_msgSend(v8, "documentState");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "contextBeforeInput");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setDeletionCount:", objc_msgSend(v40, "length"));
        }
      }
      else
      {
        if (!v38)
          goto LABEL_5;
        objc_msgSend(v9, "proactivePredictedItem");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v40, "itemType"))
        {
          objc_msgSend(v9, "proactivePredictedItem");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "trigger");
          v43 = objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v44 = (void *)v43;
            objc_msgSend(v9, "proactivePredictedItem");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "trigger");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "attributedString");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKey:", CFSTR("contextBeforeInput"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v47)
              goto LABEL_5;
            objc_msgSend(v9, "proactivePredictedItem");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "trigger");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "attributedString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKey:", CFSTR("contextBeforeInput"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setDeletionCount:", objc_msgSend(v48, "length"));

          }
        }
      }

      goto LABEL_5;
    }
    v12 = (void *)v11;
    objc_msgSend(v9, "proactivePredictedItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "itemType") == 1)
    {
      objc_msgSend(v9, "proactivePredictedItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "operationData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_27;
      objc_msgSend(v9, "proactivePredictedItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "operationData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", CFSTR("bundleID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.messages.currentLocation"));

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", CFSTR("com.apple.messages.currentLocation"), *MEMORY[0x1E0DBE310]);
        objc_msgSend(v9, "proactivePredictedItem");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("currentLocation"));

        if (v22)
        {
          objc_msgSend(v50, "setShouldSendCurrentLocation:", 1);
          v23 = (_QWORD *)MEMORY[0x1E0DBE358];
        }
        else
        {
          objc_msgSend(v9, "proactivePredictedItem");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("requestLocation"));

          if (!v33)
          {
LABEL_23:
            objc_msgSend(v50, "setCustomInfo:", v12);
LABEL_26:

            goto LABEL_27;
          }
          v23 = (_QWORD *)MEMORY[0x1E0DBE360];
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v34, *v23);

        goto LABEL_23;
      }
      objc_msgSend(v9, "proactivePredictedItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "operationData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", CFSTR("bundleID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("com.apple.SafetyMonitorApp.SafetyMonitorMessages"));

      objc_msgSend(v9, "proactivePredictedItem");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v28;
      if (v27)
      {
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("start check-in"));

        if (!v30)
          goto LABEL_27;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", CFSTR("com.apple.SafetyMonitorApp.SafetyMonitorMessages"), *MEMORY[0x1E0DBE310]);
        goto LABEL_23;
      }
      objc_msgSend(v28, "operationData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v13, "mutableCopy");
      objc_msgSend(v50, "setCustomInfo:", v35);

    }
    goto LABEL_26;
  }
LABEL_16:

}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "acceptedCandidate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "slotID"))
  {
    objc_msgSend(v8, "acceptedCandidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __85__TIKeyboardInputManagerWrapper_handleKeyboardInput_keyboardState_completionHandler___block_invoke;
    v14[3] = &unk_1EA0FAC38;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v18 = v10;
    v17 = v12;
    -[TIKeyboardInputManagerWrapper acceptSecureCandidate:keyboardState:completion:](self, "acceptSecureCandidate:keyboardState:completion:", v13, v16, v14);

  }
  else
  {
    -[TIKeyboardInputManagerWrapper updateAnalyticsForRejectedSuggestion:keyboardState:](self, "updateAnalyticsForRejectedSuggestion:keyboardState:", v12, v9);
    -[TIKeyboardInputManagerWrapper handleKeyboardInput:acceptedSecureCandidate:keyboardState:completionHandler:](self, "handleKeyboardInput:acceptedSecureCandidate:keyboardState:completionHandler:", v8, v12, v9, v10);
  }

}

- (void)handleKeyboardInput:(id)a3 acceptedSecureCandidate:(id)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
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
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void (**v66)(id, void *, void *);
  const __CFString *v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v66 = (void (**)(id, void *, void *))a6;
  objc_msgSend(v10, "acceptedCandidate");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v11)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v10, "setAcceptedCandidate:", v11);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v11;
      objc_msgSend(v14, "proactivePredictedItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "proactivePredictedItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "itemType") == 1)
        {
          objc_msgSend(v14, "proactivePredictedItem");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "operationData");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 != 0;

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

      v21 = !v19;
    }
    else
    {
      v21 = 1;
    }
    objc_msgSend(v10, "acceptedCandidate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "candidate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "length");

    if (v24 && v21)
    {
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "acceptedCandidate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "candidate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "string");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      v30 = &stru_1EA1081D0;
      if (v28)
        v30 = (const __CFString *)v28;
      objc_msgSend(v25, "stringWithFormat:", CFSTR("%@%@"), v27, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setString:", v31);

    }
    else
    {
      objc_msgSend(v10, "setString:", &stru_1EA1081D0);
    }
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acceptedCandidate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "input");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "deletionCountForString:", v34);

    objc_msgSend(v10, "acceptedCandidate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "customInfoType");

    if (v37 == 4096)
      v20 = 0;
    else
      v20 = v35;
  }
  -[TIKeyboardInputManagerWrapper handleKeyboardState:withInputEvent:](self, "handleKeyboardState:withInputEvent:", v12, v10);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    v39 = (void *)objc_msgSend(v12, "copy");
  else
    v39 = 0;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "isHardwareKeyboardAutocorrectionEnabled"))
  {
    objc_msgSend(v10, "touchEvent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
      goto LABEL_28;
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addSynthesizedTouchToInput:", v10);
  }

LABEL_28:
  objc_msgSend(v10, "touchEvent");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "touchEvent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "skipHitTestForTouchEvent:keyboardState:", v44, v12);

  }
  objc_msgSend(v10, "acceptedCandidate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acceptedCandidate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "textAccepted:fromPredictiveInputBar:withInput:", v47, objc_msgSend(v10, "isSynthesizedByAcceptingCandidate"), v10);

  }
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "syncToKeyboardState:", v12);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleKeyboardInput:", v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v12, "secureTextEntry")
    || (objc_msgSend(v12, "textInputTraits"),
        v51 = (void *)objc_claimAutoreleasedReturnValue(),
        v52 = objc_msgSend(v51, "keyboardAppearance"),
        v51,
        v52 != 5))
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "secureCandidateRenderer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v11)
    {
LABEL_42:
      if (objc_msgSend(v12, "needAutofill"))
      {
        +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "secureCandidateRenderer");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "clearSecureCandidateCache");

      }
      else
      {
        objc_msgSend(v54, "clearSecureCandidateCache");
      }

      goto LABEL_46;
    }
    objc_msgSend(v50, "setDeletionCount:", v20);
    if (objc_msgSend(v11, "customInfoType") == 1024)
    {
      v67 = CFSTR("AutofillSuggestedUsername");
      objc_msgSend(v11, "candidate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, &v67, 1);
      v56 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v11, "customInfoType") & 0x800) != 0)
      {
        v57 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v10, "acceptedCandidate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v55, "slotID"));
      v56 = objc_claimAutoreleasedReturnValue();
    }
    v57 = (void *)v56;

LABEL_41:
    -[TIKeyboardInputManagerWrapper _updateKeyboardOutput:withSecureCandidatePayload:keyboardState:](self, "_updateKeyboardOutput:withSecureCandidatePayload:keyboardState:", v50, v57, v12);

    goto LABEL_42;
  }
LABEL_46:
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "keyboardConfiguration");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v66[2](v66, v50, v61);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "humanReadableTrace");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "logKeyboardOutput:keyboardConfiguration:trace:forKeyboardInput:keyboardState:", v50, v61, v64, v10, v39);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "clearHumanReadableTrace");

}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4
{
  -[TIKeyboardInputManagerWrapper generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:](self, "generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:", a3, 0, 3, a4);
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  TIAccumulatingCandidateHandler *v16;
  id v17;
  id v18;
  id v19;
  TIAccumulatingCandidateHandler *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  TIKeyboardInputManagerWrapper *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 1));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "kbdManager.generateAutocorrections", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v9);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (void *)objc_msgSend(v9, "copy");
  else
    v15 = 0;

  v16 = [TIAccumulatingCandidateHandler alloc];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __107__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_completionHandler___block_invoke;
  v25 = &unk_1EA0FAC60;
  v26 = self;
  v27 = v15;
  v28 = v9;
  v29 = v10;
  v17 = v9;
  v18 = v15;
  v19 = v10;
  v20 = -[TIAccumulatingCandidateHandler initWithHandlerBlock:](v16, "initWithHandlerBlock:", &v22);
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager", v22, v23, v24, v25, v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v17, location, length, v20);

}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  NSUInteger location;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  TIStreamingCandidateHandler *v18;
  void *v19;
  void *v20;
  TIKeyboardInputManagerBase *inputManager;
  id v22;
  id v23;
  id v24;
  id v25;
  TIStreamingCandidateHandler *v26;
  void *v27;
  NSUInteger length;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[16];

  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  kdebug_trace();
  kac_get_log();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, (const void *)((unint64_t)self ^ 1));
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "kbdManager.generateAutocorrections", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v10);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = (void *)objc_msgSend(v10, "copy");
  else
    v17 = 0;

  v18 = [TIStreamingCandidateHandler alloc];
  -[TIKeyboardInputManagerWrapper clientProxy](self, "clientProxy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  inputManager = self->_inputManager;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __120__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke;
  v29[3] = &unk_1EA0FAC88;
  v32 = v10;
  v33 = v12;
  v29[4] = self;
  v30 = v17;
  v31 = v11;
  v22 = v10;
  v23 = v11;
  v24 = v17;
  v25 = v12;
  v26 = -[TIStreamingCandidateHandler initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateHandler:](v18, "initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateHandler:", v19, v24, v23, v20, inputManager, v29);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v22, location, length, v26);

}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateInlineCompletions:withPrefix:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearHumanReadableTrace");

  return v9;
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  void *v14;
  void *v15;
  TIAccumulatingCandidateHandler *v16;
  id v17;
  id v18;
  TIAccumulatingCandidateHandler *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[16];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 3));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "kbdManager.generateCandidates", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v9);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = (void *)objc_msgSend(v9, "copy");
  else
    v15 = 0;

  v16 = [TIAccumulatingCandidateHandler alloc];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __102__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_completionHandler___block_invoke;
  v21[3] = &unk_1EA0FACB0;
  v22 = v15;
  v23 = v10;
  v21[4] = self;
  v17 = v15;
  v18 = v10;
  v19 = -[TIAccumulatingCandidateHandler initWithResultSetHandlerBlock:](v16, "initWithResultSetHandlerBlock:", v21);
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "generateCandidatesWithKeyboardState:candidateRange:candidateHandler:", v9, location, length, v19);

}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  TIStreamingCandidateHandler *v17;
  void *v18;
  void *v19;
  TIKeyboardInputManagerBase *inputManager;
  id v21;
  id v22;
  id v23;
  TIStreamingCandidateHandler *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id buf[2];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  kdebug_trace();
  kac_get_log();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, (const void *)((unint64_t)self ^ 3));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v12))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.generateCandidates", ", (uint8_t *)buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v9);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_msgSend(v9, "copy");
  else
    v16 = 0;

  objc_initWeak(buf, self);
  v17 = [TIStreamingCandidateHandler alloc];
  -[TIKeyboardInputManagerWrapper clientProxy](self, "clientProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  inputManager = self->_inputManager;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __115__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke;
  v27[3] = &unk_1EA0FACD8;
  objc_copyWeak(&v31, buf);
  v29 = v10;
  v30 = v11;
  v28 = v16;
  v21 = v10;
  v22 = v16;
  v23 = v11;
  v24 = -[TIStreamingCandidateHandler initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateResultSetHandler:](v17, "initWithClientProxy:keyboardState:requestToken:logger:inputManager:candidateResultSetHandler:", v18, v22, v21, v19, inputManager, v27);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "generateCandidatesWithKeyboardState:candidateRange:candidateHandler:", v9, a4.location, a4.length, v24);

  objc_destroyWeak(&v31);
  objc_destroyWeak(buf);

}

- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v8, "slotID"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__TIKeyboardInputManagerWrapper_handleAcceptedCandidate_keyboardState_completionHandler___block_invoke;
    v11[3] = &unk_1EA0FAD00;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    -[TIKeyboardInputManagerWrapper acceptSecureCandidate:keyboardState:completion:](self, "acceptSecureCandidate:keyboardState:completion:", v12, v13, v11);

  }
  else
  {
    -[TIKeyboardInputManagerWrapper updateAnalyticsForRejectedSuggestion:keyboardState:](self, "updateAnalyticsForRejectedSuggestion:keyboardState:", v8, v9);
    -[TIKeyboardInputManagerWrapper handleAcceptedCandidate:acceptedSecureCandidate:keyboardState:completionHandler:](self, "handleAcceptedCandidate:acceptedSecureCandidate:keyboardState:completionHandler:", v8, v8, v9, v10);
  }

}

- (void)handleAcceptedCandidate:(id)a3 acceptedSecureCandidate:(id)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, id);
  NSObject *v14;
  const void *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  int v18;
  id v19;
  int v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  os_signpost_id_t v41;
  void *v42;
  uint8_t v43[16];
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  kdebug_trace();
  kac_get_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (const void *)((unint64_t)self ^ 4);
  v16 = os_signpost_id_make_with_pointer(v14, (const void *)((unint64_t)self ^ 4));
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v16;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v17, "kbdManager.acceptCandidate", ", buf, 2u);
    }
  }

  if (!v10)
  {
    v19 = v11;
    v20 = 0;
    goto LABEL_17;
  }
  v18 = objc_msgSend(v10, "slotID");
  v19 = v11;

  v20 = 0;
  if (v11 == v10 || !v18)
    goto LABEL_17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = v19;
    objc_msgSend(v21, "proactivePredictedItem");
    v22 = objc_claimAutoreleasedReturnValue();
    v19 = v21;
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v21, "proactivePredictedItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "itemType") != 1)
      {

        v19 = v21;
        goto LABEL_14;
      }
      objc_msgSend(v21, "proactivePredictedItem");
      v25 = v11;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "operationData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v25;
      v19 = v21;
      if (v27)
      {
        objc_msgSend(v21, "candidateByReplacingWithCandidate:", &stru_1EA1081D0);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v23 = v21;
LABEL_14:

      }
    }

  }
  v20 = 1;
LABEL_17:
  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v12);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v11;
  if (v28)
    v29 = (void *)objc_msgSend(v12, "copy");
  else
    v29 = 0;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleAcceptedCandidate:keyboardState:", v19, v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = objc_alloc_init(MEMORY[0x1E0DBDC40]);
  objc_msgSend(v32, "setTextToCommit:", v31);
  if (v20)
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "secureCandidateRenderer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "cachedPayloadForSecureCandidateSlotID:", objc_msgSend(v19, "slotID"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerWrapper _updateKeyboardOutput:withSecureCandidatePayload:keyboardState:](self, "_updateKeyboardOutput:withSecureCandidatePayload:keyboardState:", v32, v35, v12);

  }
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "keyboardConfiguration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v13[2](v13, v37, v32);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "logKeyboardConfig:textToCommit:forAcceptedCandidate:keyboardState:", v37, v31, v19, v29);

  kdebug_trace();
  kac_get_log();
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v40 = os_signpost_id_make_with_pointer(v39, v15);
  if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v41 = v40;
    if (os_signpost_enabled(v39))
    {
      *(_WORD *)v43 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v39, OS_SIGNPOST_INTERVAL_END, v41, "kbdManager.acceptCandidate", ", v43, 2u);
    }
  }

}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acceptingCandidateWithTrigger:", v4);

}

- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  const void *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  uint8_t v21[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)((unint64_t)self ^ 5);
  v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 5));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.generateReplacements", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "generateReplacementsForString:keyLayout:", v8, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v16);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logReplacements:forString:keyLayout:", v16, v8, v9);

  kdebug_trace();
  kac_get_log();
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_make_with_pointer(v18, v12);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v19;
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v18, OS_SIGNPOST_INTERVAL_END, v20, "kbdManager.generateReplacements", ", v21, 2u);
    }
  }

}

- (void)generateRefinementsForCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  const void *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_signpost_id_t v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)((unint64_t)self ^ 6);
  v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 6));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.generateRefinements", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v9);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_msgSend(v9, "copy");
  else
    v16 = 0;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "generateRefinementsForCandidate:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v18);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logRefinements:forCandidate:keyboardState:", v18, v8, v16);

  kdebug_trace();
  kac_get_log();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_make_with_pointer(v20, v12);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v20, OS_SIGNPOST_INTERVAL_END, v22, "kbdManager.generateRefinements", ", v23, 2u);
    }
  }

}

- (void)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  const void *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  os_signpost_id_t v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)((unint64_t)self ^ 7);
  v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 7));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.performHitTest", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v9);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_msgSend(v9, "copy");
  else
    v16 = 0;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "performHitTestForTouchEvent:keyboardState:", v8, v9);

  v10[2](v10, v18);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logHitKeyCode:forTouchEvent:keyboardState:", v18, v8, v16);

  kdebug_trace();
  kac_get_log();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_make_with_pointer(v20, v12);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v20, OS_SIGNPOST_INTERVAL_END, v22, "kbdManager.performHitTest", ", v23, 2u);
    }
  }

}

- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  const void *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  os_signpost_id_t v28;
  uint8_t v29[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)((unint64_t)self ^ 7);
  v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 7));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.performHitTest", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v9);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_msgSend(v9, "copy");
  else
    v16 = 0;

  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v17 = 1;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v17 - 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "skipHitTestForTouchEvent:keyboardState:", v18, v9);

      -[TIKeyboardInputManagerWrapper logger](self, "logger");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logReceivedSkipHitTestForTouchEvent:forKeyboardState:", v18, v16);

      ++v17;
    }
    while (v17 < objc_msgSend(v8, "count"));
  }
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "performHitTestForTouchEvent:keyboardState:", v22, v9);

  v10[2](v10, v23);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "logHitKeyCode:forTouchEvent:keyboardState:", v23, v25, v16);

  kdebug_trace();
  kac_get_log();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = os_signpost_id_make_with_pointer(v26, v12);
  if (v27 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v28 = v27;
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v26, OS_SIGNPOST_INTERVAL_END, v28, "kbdManager.performHitTest", ", v29, 2u);
    }
  }

}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v11);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (void *)objc_msgSend(v11, "copy");
  else
    v8 = 0;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "skipHitTestForTouchEvent:keyboardState:", v6, v11);

  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logReceivedSkipHitTestForTouchEvent:forKeyboardState:", v6, v8);

}

- (void)skipHitTestForTouchEvents:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v7);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = (void *)objc_msgSend(v7, "copy");
  else
    v9 = 0;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "skipHitTestForTouchEvent:keyboardState:", v15, v7);

        -[TIKeyboardInputManagerWrapper logger](self, "logger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logReceivedSkipHitTestForTouchEvent:forKeyboardState:", v15, v9);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const void *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a3;
  v8 = a4;
  v9 = a5;
  kdebug_trace();
  kac_get_log();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (const void *)((unint64_t)self ^ 8);
  v12 = os_signpost_id_make_with_pointer(v10, (const void *)((unint64_t)self ^ 8));
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v13, "kbdManager.adjustPhraseBoundary", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:](self, "adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:", v6, 0, v8, v9);
  kdebug_trace();
  kac_get_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, v11);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v14, OS_SIGNPOST_INTERVAL_END, v16, "kbdManager.adjustPhraseBoundary", ", v17, 2u);
    }
  }

}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(id, uint64_t, _QWORD);

  length = a4.length;
  location = a4.location;
  v22 = (void (**)(id, uint64_t, _QWORD))a8;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "smartSelectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:", v17, location, length, v16, v15, a7);
  v21 = v20;

  v22[2](v22, v19, v21);
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  void (**v11)(id, void *);
  NSObject *v12;
  const void *v13;
  os_signpost_id_t v14;
  os_signpost_id_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  uint8_t v26[16];
  uint8_t buf[16];

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  kdebug_trace();
  kac_get_log();
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (const void *)((unint64_t)self ^ 9);
  v14 = os_signpost_id_make_with_pointer(v12, (const void *)((unint64_t)self ^ 9));
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v15, "kbdManager.adjustPhraseBoundary.granular", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper handleKeyboardState:](self, "handleKeyboardState:", v10);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = (void *)objc_msgSend(v10, "copy");
  else
    v17 = 0;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "syncToKeyboardState:", v10);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "adjustPhraseBoundaryInForwardDirection:granularity:", v8, v7);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyboardConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2](v11, v21);
  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logKeyboardConfig:forAdjustedPhraseBoundaryInForwardDirection:granularity:keyboardState:", v21, v8, v7, v17);

  kdebug_trace();
  kac_get_log();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_make_with_pointer(v23, v13);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v25 = v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v23, OS_SIGNPOST_INTERVAL_END, v25, "kbdManager.adjustPhraseBoundary.granular", ", v26, 2u);
    }
  }

}

- (void)setOriginalInput:(id)a3
{
  id v4;
  NSObject *v5;
  const void *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)((unint64_t)self ^ 0xA);
  v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0xA));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.setOriginalInput", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setOriginalInput:", v4);

  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logReceivedSetOriginalInput:", v4);

  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, v6);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_END, v13, "kbdManager.setOriginalInput", ", v14, 2u);
    }
  }

}

- (void)textAccepted:(id)a3
{
  -[TIKeyboardInputManagerWrapper textAccepted:completionHandler:](self, "textAccepted:completionHandler:", a3, 0);
}

- (void)textAccepted:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  const void *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  os_signpost_id_t v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  kdebug_trace();
  kac_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)((unint64_t)self ^ 0xB);
  v10 = os_signpost_id_make_with_pointer(v8, (const void *)((unint64_t)self ^ 0xB));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdManager.textAccepted", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textAccepted:fromPredictiveInputBar:withInput:", v6, 0, 0);

  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logReceivedTextAccepted:", v6);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyboardConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  kdebug_trace();
  kac_get_log();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_make_with_pointer(v16, v9);
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v18 = v17;
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v16, OS_SIGNPOST_INTERVAL_END, v18, "kbdManager.textAccepted", ", v19, 2u);
    }
  }

  if (v7)
    v7[2](v7, v15);

}

- (void)candidateRejected:(id)a3
{
  id v4;
  NSObject *v5;
  const void *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)((unint64_t)self ^ 0xC);
  v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0xC));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.candidateRejected", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "candidateRejected:", v4);

  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logReceivedCandidateRejected:", v4);

  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, v6);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_END, v13, "kbdManager.candidateRejected", ", v14, 2u);
    }
  }

}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const void *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  void *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  os_signpost_id_t v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  kdebug_trace();
  kac_get_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = (const void *)((unint64_t)self ^ 0xC);
  v16 = os_signpost_id_make_with_pointer(v14, (const void *)((unint64_t)self ^ 0xC));
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v16;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v17, "kbdManager.candidateRejected", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerLearning:fullCandidate:keyboardState:mode:", v10, v11, v12, v13);

  kdebug_trace();
  kac_get_log();
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v20 = os_signpost_id_make_with_pointer(v19, v15);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)v22 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v19, OS_SIGNPOST_INTERVAL_END, v21, "kbdManager.candidateRejected", ", v22, 2u);
    }
  }

}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  const void *v18;
  os_signpost_id_t v19;
  os_signpost_id_t v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  os_signpost_id_t v24;
  uint8_t v25[16];
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  kdebug_trace();
  kac_get_log();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = (const void *)((unint64_t)self ^ 0xC);
  v19 = os_signpost_id_make_with_pointer(v17, (const void *)((unint64_t)self ^ 0xC));
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v19;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v20, "kbdManager.candidateRejected", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerLearningForCompletion:fullCompletion:context:prefix:mode:", v12, v13, v14, v15, v16);

  kdebug_trace();
  kac_get_log();
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v23 = os_signpost_id_make_with_pointer(v22, v18);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v24 = v23;
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v22, OS_SIGNPOST_INTERVAL_END, v24, "kbdManager.candidateRejected", ", v25, 2u);
    }
  }

}

- (void)lastAcceptedCandidateCorrected
{
  NSObject *v3;
  const void *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint8_t v12[16];
  uint8_t buf[16];

  kdebug_trace();
  kac_get_log();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (const void *)((unint64_t)self ^ 0xD);
  v5 = os_signpost_id_make_with_pointer(v3, (const void *)((unint64_t)self ^ 0xD));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v6, "kbdManager.lastAcceptedCorrected", ", buf, 2u);
    }
  }

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastAcceptedCandidateCorrected");

  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logReceivedLastAcceptedCandidateCorrected");

  kdebug_trace();
  kac_get_log();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, v4);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v9, OS_SIGNPOST_INTERVAL_END, v11, "kbdManager.lastAcceptedCorrected", ", v12, 2u);
    }
  }

}

- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logDiscoverabilityEvent:userInfo:", v4, v6);

}

- (void)writeTypologyLogWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void (**)(id, void *))a3;
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeLanguageModelDynamicDataIncludingCache");

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearHumanReadableTrace");

  -[TIKeyboardInputManagerWrapper logger](self, "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeToFile");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

}

- (void)addSupplementalLexicon:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  const void *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  kdebug_trace();
  kac_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)((unint64_t)self ^ 0xE);
  v10 = os_signpost_id_make_with_pointer(v8, (const void *)((unint64_t)self ^ 0xE));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdManager.addSupplementalLexicon", ", buf, 2u);
    }
  }

  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ensureSupplementalLexicons");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addLexicon:", v6);

  if (v7)
    v7[2](v7);
  kdebug_trace();
  kac_get_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_make_with_pointer(v14, v9);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v14, OS_SIGNPOST_INTERVAL_END, v16, "kbdManager.addSupplementalLexicon", ", v17, 2u);
    }
  }

}

- (void)removeSupplementalLexiconWithIdentifier:(unint64_t)a3
{
  NSObject *v5;
  const void *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  os_signpost_id_t v13;
  uint8_t v14[16];
  uint8_t buf[16];

  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)((unint64_t)self ^ 0xF);
  v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0xF));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.removeSupplementalLexicon", ", buf, 2u);
    }
  }

  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "supplementalLexicons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeLexiconWithIdentifier:", a3);

  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, v6);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_END, v13, "kbdManager.removeSupplementalLexicon", ", v14, 2u);
    }
  }

}

- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TIStickerCandidateGenerator *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (_os_feature_enabled_impl())
  {
    v10 = _os_feature_enabled_impl();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerBase inputMode](self->_inputManager, "inputMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "languageWithRegion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl() && objc_msgSend(v12, "hasPrefix:", CFSTR("en")))
      v10 = objc_msgSend(v14, "hasPrefix:", CFSTR("en"));
    else
      v10 = 0;

  }
  if (v17 && v10)
  {
    v15 = objc_alloc_init(TIStickerCandidateGenerator);
    -[TIStickerCandidateGenerator keyboardStickerWithIdentifier:roles:](v15, "keyboardStickerWithIdentifier:roles:", v17, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v16);

  }
  else
  {
    v9[2](v9, 0);
  }

}

- (TIClientProxy)clientProxy
{
  return self->_clientProxy;
}

uint64_t __89__TIKeyboardInputManagerWrapper_handleAcceptedCandidate_keyboardState_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  if (a2)
  {
    v6 = a1[7];
    v7 = a2;
  }
  else
  {
    objc_msgSend(v3, "updateAnalyticsForRejectedSuggestion:keyboardState:", v4, a1[6]);
    v3 = (void *)a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = a1[7];
    v7 = v4;
  }
  return objc_msgSend(v3, "handleAcceptedCandidate:acceptedSecureCandidate:keyboardState:completionHandler:", v4, v7, v5, v6);
}

void __115__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t WeakRetained;
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a2;
  WeakRetained = (unint64_t)objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, (const void *)(WeakRetained ^ 3));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v5, OS_SIGNPOST_INTERVAL_END, v7, "kbdManager.generateCandidates", ", v12, 2u);
    }
  }

  objc_msgSend((id)WeakRetained, "logger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)WeakRetained, "inputManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "humanReadableTrace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logCandidateResultSet:trace:forKeyboardState:requestToken:", v3, v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend((id)WeakRetained, "inputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearHumanReadableTrace");

}

void __102__TIKeyboardInputManagerWrapper_generateCandidatesWithKeyboardState_candidateRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  kdebug_trace();
  kac_get_log();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(_QWORD *)(a1 + 32) ^ 3));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateCandidates", ", v11, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "humanReadableTrace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logCandidateResultSet:trace:forKeyboardState:requestToken:", v3, v9, *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearHumanReadableTrace");

}

void __120__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  kdebug_trace();
  kac_get_log();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(_QWORD *)(a1 + 32) ^ 1));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateAutocorrections", ", v12, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "humanReadableTrace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logAutocorrections:trace:forKeyboardState:requestToken:", v3, v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidatesOfferedFeedback:keyboardState:", v3, *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearHumanReadableTrace");

}

void __107__TIKeyboardInputManagerWrapper_generateAutocorrectionsWithKeyboardState_candidateRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  kdebug_trace();
  kac_get_log();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(_QWORD *)(a1 + 32) ^ 1));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateAutocorrections", ", v12, 2u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "humanReadableTrace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logAutocorrections:trace:forKeyboardState:requestToken:", v3, v9, *(_QWORD *)(a1 + 40), 0);

  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "candidatesOfferedFeedback:keyboardState:", v3, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "inputManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clearHumanReadableTrace");

}

uint64_t __85__TIKeyboardInputManagerWrapper_handleKeyboardInput_keyboardState_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)a1[4];
  v4 = a1[6];
  if (a2)
  {
    v5 = a1[5];
    v6 = a1[8];
    v7 = a2;
  }
  else
  {
    objc_msgSend(v3, "updateAnalyticsForRejectedSuggestion:keyboardState:", a1[7], a1[6]);
    v3 = (void *)a1[4];
    v5 = a1[5];
    v4 = a1[6];
    v7 = a1[7];
    v6 = a1[8];
  }
  return objc_msgSend(v3, "handleKeyboardInput:acceptedSecureCandidate:keyboardState:completionHandler:", v5, v7, v4, v6);
}

uint64_t __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 40;
  if (a2)
    v2 = 32;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + v2));
}

uint64_t __80__TIKeyboardInputManagerWrapper_acceptSecureCandidate_keyboardState_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 40;
  if (a2)
    v2 = 32;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + v2));
}

void __71__TIKeyboardInputManagerWrapper_syncToKeyboardState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, id);
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void (**)(uint64_t, id))(v3 + 16);
  v5 = a2;
  v4(v3, v5);
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logKeyboardConfig:forSyncToKeyboardState:", v5, *(_QWORD *)(a1 + 40));

  kdebug_trace();
  kac_get_log();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v7, OS_SIGNPOST_INTERVAL_END, v9, "kbdManager.syncState", ", v10, 2u);
    }
  }

}

@end
