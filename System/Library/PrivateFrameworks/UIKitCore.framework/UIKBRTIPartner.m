@implementation UIKBRTIPartner

- (RTIInputSourceState)rtiInputSourceState
{
  return self->_rtiInputSourceState;
}

- (void)setPartnerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_partnerDelegate, a3);
}

- (BOOL)inputSystemClientEnabled
{
  return self->_inputSystemClientEnabled;
}

- (void)_updateGeometryObserverIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD *v15;
  UIKBRTIPartner *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  BOOL v20;
  id v21;

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultDocumentRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultDocumentRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_msgSend(v6, "flags") & 4) == 0;

  }
  else
  {
    v7 = 1;
  }

  if (+[UIKeyboard supportsAutoFillPanel](UIKeyboard, "supportsAutoFillPanel"))
    v8 = +[UIKeyboard isAlwaysAllowedAutoFillPanelClient](UIKeyboard, "isAlwaysAllowedAutoFillPanelClient");
  else
    v8 = 0;
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEnvironmentEnabled"))
  {

    if (!v8)
      goto LABEL_16;
LABEL_22:
    -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textInputView");
    v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[UIView _addGeometryChangeObserver:](v19, self);

    v16 = self;
    v17 = 1;
    goto LABEL_23;
  }
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v7;
  else
    v11 = 1;
  if ((v11 & 1) == 0 && !-[UIKBRTIPartner isObservingGeometry](self, "isObservingGeometry"))
  {

    goto LABEL_22;
  }

  if (v8)
    goto LABEL_22;
LABEL_16:
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "isEnvironmentEnabled"))
  {
    v13 = -[UIKBRTIPartner isObservingGeometry](self, "isObservingGeometry");

    if (!v13)
      return;
    goto LABEL_20;
  }
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    return;
  }
  v20 = -[UIKBRTIPartner isObservingGeometry](self, "isObservingGeometry");

  if (v20)
  {
LABEL_20:
    -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textInputView");
    v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[UIView _removeGeometryChangeObserver:](v15, self);

    v16 = self;
    v17 = 0;
LABEL_23:
    -[UIKBRTIPartner setIsObservingGeometry:](v16, "setIsObservingGeometry:", v17);
  }
}

- (void)textSuggestionsChanged:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[UIKBRTIPartner _remoteInputSystemRequiresTextSuggestionUpdates](self, "_remoteInputSystemRequiresTextSuggestionUpdates");
  v5 = v9;
  if (v4)
  {
    if (v9)
    {
      +[UITextSuggestion encodeTextSuggestions:](UITextSuggestion, "encodeTextSuggestions:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTextInputSessionWithID:textSuggestionsChanged:", v8, v6);

    v5 = v9;
  }

}

- (BOOL)remoteTextInputClientHasActiveSession
{
  void *v3;
  void *v4;
  char v5;

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasActiveSessionWithID:", v4);

  return v5;
}

- (NSUUID)currentSessionIdentifier
{
  return self->_currentSessionIdentifier;
}

- (BOOL)_remoteInputSystemRequiresDocumentStateUpdates
{
  void *v3;
  _BOOL4 v4;

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!+[UIKeyboard usesInputSystemUIForAutoFillOnly](UIKeyboard, "usesInputSystemUIForAutoFillOnly")
      || (v4 = -[UIKBRTIPartner _remoteInputSystemRequiresDocumentStateForAutofill](self, "_remoteInputSystemRequiresDocumentStateForAutofill")))
    {
      LOBYTE(v4) = 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)forwardClearForwardingInputDelegateAndResign:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v3 = a3;
  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0D87188]);
  v13 = CFSTR("resign");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomInfo:", v7);

  objc_msgSend(v5, "setCustomInfoType:", CFSTR("UIEmojiSearchOperations"));
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTextInputSessionWithID:performInputOperation:", v10, v5);

  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputDelegateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldRespectForwardingInputDelegate:", 0);

}

- (RTIInputSystemClient)rtiClient
{
  return self->_rtiClient;
}

- (BOOL)isObservingGeometry
{
  return self->_isObservingGeometry;
}

- (BOOL)_remoteInputSystemRequiresDocumentStateForAutofill
{
  void *v3;
  char v4;
  void *v5;

  -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "autofillMode"))
  {
    v4 = 1;
  }
  else
  {
    -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isExplicitAutoFillMode");

  }
  return v4;
}

void __49__UIKBRTIPartner_registerTextOperationCustomInfo__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  _QWORD v123[5];
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;

  v122 = (void *)MEMORY[0x1E0D871E8];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v124 = 0;
  v125 = &v124;
  v126 = 0x2050000000;
  v8 = (void *)_MergedGlobals_1143;
  v127 = _MergedGlobals_1143;
  if (!_MergedGlobals_1143)
  {
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __getAFAnalyticsTurnBasedInstrumentationContextClass_block_invoke;
    v123[3] = &unk_1E16B14C0;
    v123[4] = &v124;
    __getAFAnalyticsTurnBasedInstrumentationContextClass_block_invoke((uint64_t)v123);
    v8 = (void *)v125[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v124, 8);
  v10 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "registerCustomInfoClasses:forType:", v11, CFSTR("UIDictationRemoteTextOperations"));

  v12 = (void *)MEMORY[0x1E0D87188];
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerCustomInfoClasses:forType:", v18, CFSTR("UIDictationRemoteInputOperations"));

  v19 = (void *)MEMORY[0x1E0D87188];
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "registerCustomInfoClasses:forType:", v23, CFSTR("UIUserPencilOperations"));

  v24 = (void *)MEMORY[0x1E0D87188];
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerCustomInfoClasses:forType:", v28, CFSTR("UIEmojiSearchOperations"));

  v29 = (void *)MEMORY[0x1E0D87188];
  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  v32 = objc_opt_class();
  v33 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, v32, v33, objc_opt_class(), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "registerCustomInfoClasses:forType:", v34, CFSTR("UIUserInteractionRemoteInputOperations"));

  v35 = (void *)MEMORY[0x1E0D871E8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "registerCustomInfoClasses:forType:", v36, CFSTR("_UIKeyboardIndirectTextSelectionGestureState"));

  v37 = (void *)MEMORY[0x1E0D871E8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "registerCustomInfoClasses:forType:", v38, CFSTR("UITextSuggestion"));

  v39 = (void *)MEMORY[0x1E0D871E8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "registerCustomInfoClasses:forType:", v40, CFSTR("UIPhysicalKeyboardEvent"));

  v41 = (void *)MEMORY[0x1E0D871E8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "registerCustomInfoClasses:forType:", v42, CFSTR("UIKBRTICustomInfoTypeDeleteAction"));

  v43 = (void *)MEMORY[0x1E0D871E8];
  v44 = (void *)MEMORY[0x1E0C99E60];
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  v49 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, v46, v47, v48, v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "registerCustomInfoClasses:forType:", v50, CFSTR("UIStickerRemoteInputOperations"));

  v51 = (void *)MEMORY[0x1E0D87188];
  v52 = (void *)MEMORY[0x1E0C99E60];
  v53 = objc_opt_class();
  objc_msgSend(v52, "setWithObjects:", v53, objc_opt_class(), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "registerCustomInfoClasses:forType:", v54, CFSTR("UIPhysicalKeyboardEvent"));

  v55 = (void *)MEMORY[0x1E0D87188];
  v56 = (void *)MEMORY[0x1E0C99E60];
  v57 = objc_opt_class();
  objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "registerCustomInfoClasses:forType:", v58, CFSTR("UIKeyboardCameraRemoteInputOperations"));

  v59 = (void *)MEMORY[0x1E0D871E8];
  v60 = (void *)MEMORY[0x1E0C99E60];
  v61 = objc_opt_class();
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  v64 = objc_opt_class();
  objc_msgSend(v60, "setWithObjects:", v61, v62, v63, v64, objc_opt_class(), 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "registerCustomInfoClasses:forType:", v65, CFSTR("UISupplementalLexiconOperations"));

  v66 = (void *)MEMORY[0x1E0D87188];
  v67 = (void *)MEMORY[0x1E0C99E60];
  v68 = objc_opt_class();
  v69 = objc_opt_class();
  v70 = objc_opt_class();
  v71 = objc_opt_class();
  objc_msgSend(v67, "setWithObjects:", v68, v69, v70, v71, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "registerCustomInfoClasses:forType:", v72, CFSTR("UISupplementalLexiconInputOperations"));

  v73 = (void *)MEMORY[0x1E0D871E8];
  v74 = (void *)MEMORY[0x1E0C99E60];
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  v77 = objc_opt_class();
  objc_msgSend(v74, "setWithObjects:", v75, v76, v77, objc_opt_class(), 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "registerCustomInfoClasses:forType:", v78, CFSTR("UIKBRTICustomInfoTypeAutofill"));

  v79 = (void *)MEMORY[0x1E0D871E8];
  v80 = (void *)MEMORY[0x1E0C99E60];
  v81 = objc_opt_class();
  v82 = objc_opt_class();
  v83 = objc_opt_class();
  v84 = objc_opt_class();
  objc_msgSend(v80, "setWithObjects:", v81, v82, v83, v84, objc_opt_class(), 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "registerCustomInfoClasses:forType:", v85, CFSTR("UIWebKitOperations"));

  v86 = (void *)MEMORY[0x1E0D87188];
  v87 = (void *)MEMORY[0x1E0C99E60];
  v88 = objc_opt_class();
  v89 = objc_opt_class();
  v90 = objc_opt_class();
  objc_msgSend(v87, "setWithObjects:", v88, v89, v90, objc_opt_class(), 0);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "registerCustomInfoClasses:forType:", v91, CFSTR("UIWebKitOperations"));

  v92 = (void *)MEMORY[0x1E0D871E8];
  v93 = (void *)MEMORY[0x1E0C99E60];
  v94 = objc_opt_class();
  objc_msgSend(v93, "setWithObjects:", v94, objc_opt_class(), 0);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "registerCustomInfoClasses:forType:", v95, CFSTR("UIEmojiSearchOperations"));

  v96 = (void *)MEMORY[0x1E0D871E8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "registerCustomInfoClasses:forType:", v97, CFSTR("UIKBRTICustomInfoTypeUpdateInputMode"));

  v98 = (void *)MEMORY[0x1E0D871E8];
  v99 = (void *)MEMORY[0x1E0C99E60];
  v100 = objc_opt_class();
  v101 = objc_opt_class();
  v102 = objc_opt_class();
  v103 = objc_opt_class();
  objc_msgSend(v99, "setWithObjects:", v100, v101, v102, v103, objc_opt_class(), 0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "registerCustomInfoClasses:forType:", v104, CFSTR("UIKBRTICustomInfoTypeKeyboardOperations"));

  v105 = (void *)MEMORY[0x1E0D87188];
  v106 = (void *)MEMORY[0x1E0C99E60];
  v107 = objc_opt_class();
  v108 = objc_opt_class();
  v109 = objc_opt_class();
  v110 = objc_opt_class();
  objc_msgSend(v106, "setWithObjects:", v107, v108, v109, v110, objc_opt_class(), 0);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "registerCustomInfoClasses:forType:", v111, CFSTR("UIKBRTICustomInfoTypeApplicationOperations"));

  v112 = (void *)MEMORY[0x1E0D871E8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "registerCustomInfoClasses:forType:", v113, CFSTR("UIKBRTICustomInfoTypeTypologyLogOperations"));

  v114 = (void *)MEMORY[0x1E0D87188];
  v115 = (void *)MEMORY[0x1E0C99E60];
  v116 = objc_opt_class();
  objc_msgSend(v115, "setWithObjects:", v116, objc_opt_class(), 0);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "registerCustomInfoClasses:forType:", v117, CFSTR("UIKBRTICustomInfoTypeAnalyticsOperations"));

  v118 = (void *)MEMORY[0x1E0D87188];
  v119 = (void *)MEMORY[0x1E0C99E60];
  v120 = objc_opt_class();
  objc_msgSend(v119, "setWithObjects:", v120, objc_opt_class(), 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "registerCustomInfoClasses:forType:", v121, CFSTR("UIKBRTICustomInfoTypeGrammarCorrectionOperations"));

}

- (void)_addFirstSelectionRectToDocumentState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  id v76;

  v76 = a3;
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "correctionRect");
  -[UIKBRTIPartner convertRect:from:](self, "convertRect:from:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v76, "setFirstSelectionRectInWindow:", v8, v10, v12, v14);
  -[UIKBRTIPartner _selectionClipRect](self, "_selectionClipRect");
  -[UIKBRTIPartner convertRect:from:](self, "convertRect:from:", v5);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v76, "setClientFrameInWindow:");
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectedTextRange");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "start");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "caretRectForPosition:", v26);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  -[UIKBRTIPartner convertRect:from:](self, "convertRect:from:", v5, v28, v30, v32, v34);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  objc_msgSend(v76, "setCaretRectInWindow:");
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "beginningOfDocument");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "selectedTextRange");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "start");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v43, "offsetFromPosition:toPosition:", v45, v48);

  objc_msgSend(v76, "addTextRect:forCharacterRange:granularity:isVertical:", v49, 0, 0, 0, v36, v38, v40, v42);
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "textInputTraits");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "insertionPointColor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x1E0D87168];
  v54 = objc_retainAutorelease(v52);
  objc_msgSend(v53, "colorWithCGColor:", objc_msgSend(v54, "CGColor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setInsertionPointColor:", v55);
  objc_msgSend(v5, "window");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "screen");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "coordinateSpace");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "convertRect:toCoordinateSpace:", v59, v16, v18, v20, v22);
  v61 = v60;
  v63 = v62;
  v65 = v64;
  v67 = v66;

  objc_msgSend(v5, "window");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v57) = objc_msgSend(v68, "_isHostedInAnotherProcess");

  if ((_DWORD)v57)
  {
    objc_msgSend(v5, "window");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "windowScene");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:](UITextEffectsWindow, "activeTextEffectsWindowForWindowScene:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "hostedViewReference");
    v73 = v72;
    v75 = v74;

    v61 = v61 + v73;
    v63 = v63 + v75;
  }
  objc_msgSend(v76, "setClientFrameInEntitySpace:", v61, v63, v65, v67);

}

- (id)inputDelegate
{
  void *v2;
  void *v3;

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)convertRect:(CGRect)a3 from:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  objc_msgSend(v9, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v19, "_isRemoteInputHostWindow");
  if ((_DWORD)v9)
  {
    -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "assistantViewInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    objc_msgSend(v21, "insets");
    v26 = v24 - v25;
    objc_msgSend(v21, "size");
    v14 = v14 + v26 - v27;

  }
  v28 = v12;
  v29 = v14;
  v30 = v16;
  v31 = v18;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)_updateRTITraitsIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
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
  int v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _BOOL4 v60;
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
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  objc_class *v92;
  const __CFString *v93;
  uint64_t cachedHasPreviousKeyResponder;
  void *v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t cachedHasNextKeyResponder;
  void *v99;
  uint64_t v100;
  _BOOL8 v101;
  void *v102;
  NSDictionary *pendingDisableBecomeFirstResponderParameters;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  NSNumber *v117;
  void *v118;
  uint64_t v119;
  NSNumber *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  __CFString *v141;
  _BOOL4 v142;
  void *v143;
  void *v144;
  _BYTE v145[12];
  _BYTE v146[12];
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  char isKindOfClass;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  int v178;
  void *v179;
  UIKBRTIPartner *v180;
  void *v181;
  void *v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  const __CFString *v187;
  void *v188;
  _QWORD v189[18];
  _QWORD v190[18];
  void *v191;
  _BYTE v192[128];
  uint64_t v193;

  v193 = *MEMORY[0x1E0C80C00];
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    LOBYTE(v51) = 0;
    return v51;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D87180]);
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTextInputTraits:", v8);

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegateAsResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "textInputContextIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextInputContextIdentifier:", v11);

  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputModeForResponder:", v10);
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v4, "setTextInputModeData:", v14);

  }
  v179 = (void *)v13;
  v180 = self;
  v181 = v10;
  v182 = v4;
  objc_msgSend(v10, "_additionalTextInputLocales");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v17 = v15;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v183, v192, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v184;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v184 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v183 + 1) + 8 * i), "localeIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v183, v192, 16);
    }
    while (v19);
  }

  if (objc_msgSend(v16, "count"))
    objc_msgSend(v4, "setAdditionalLocaleIdentifiers:", v16);
  objc_msgSend(v6, "recipientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecipientId:", v23);

  objc_msgSend(v6, "responseContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResponseContext:", v24);

  objc_msgSend(v6, "inputContextHistory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setInputContextHistory:", v26);

  objc_msgSend(v6, "supportedPayloadIds");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportedPayloadIds:", v27);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "textInputTraits");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hidePrediction");

  -[UIKBRTIPartner rtiDocumentTraits](v180, "rtiDocumentTraits");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v30;
  if (v31)
  {
    -[UIKBRTIPartner rtiDocumentTraits](v180, "rtiDocumentTraits");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v30 | objc_msgSend(v33, "hidePrediction");

  }
  objc_msgSend(v4, "setHidePrediction:", v30);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "textInputTraits");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "disablePrediction");

  -[UIKBRTIPartner rtiDocumentTraits](v180, "rtiDocumentTraits");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[UIKBRTIPartner rtiDocumentTraits](v180, "rtiDocumentTraits");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v32 |= v36 ^ objc_msgSend(v38, "disablePrediction");

  }
  v178 = v32;

  objc_msgSend(v4, "setDisablePrediction:", v36);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "inputDelegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "textInputView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldReverseLayoutDirection:", objc_msgSend(v41, "_shouldReverseLayoutDirection"));

  objc_msgSend(v4, "setAutofillMode:", objc_msgSend(v6, "autofillMode"));
  objc_msgSend(v4, "setAutofillSubMode:", objc_msgSend(v6, "autofillSubMode"));
  if (objc_msgSend(v6, "autofillMode") && objc_msgSend(v6, "autofillMode") != 8)
  {
    -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "textContentTypeForCurrentInputDelegate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputTraits");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTextContentType:", v43);

  }
  objc_msgSend(v6, "autofillContext");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutofillContext:", v45);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "_passwordRules");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPasswordRules:", v47);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldLoadAutofillSignUp:", objc_msgSend(v48, "shouldLoadAutofillSignUpInputViewController"));

  if (objc_msgSend(v6, "supplementalLexiconIdentifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "supplementalLexiconIdentifier"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabledSupplementalLexiconIdentifiers:", v50);

  }
  else
  {
    objc_msgSend(v4, "setEnabledSupplementalLexiconIdentifiers:", 0);
  }
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegateConformanceType:", objc_msgSend(v52, "delegateConformanceType"));

  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "inputDelegate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_opt_respondsToSelector();

  if ((v55 & 1) != 0)
  {
    -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "inputDelegate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisableAutomaticKeyboardUI:", objc_msgSend(v57, "_disableAutomaticKeyboardUI"));

  }
  -[UIKBRTIPartner rtiClient](v180, "rtiClient");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    v60 = +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI");

    if (v60)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "remoteInputViewHost");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v62, "inputViewInfo");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "rtiInputViewInfo");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setInputViewInfo:", v64);

      objc_msgSend(v62, "assistantViewInfo");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "rtiInputViewInfo");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAssistantViewInfo:", v66);

      -[UIKBRTIPartner delegate](v180, "delegate");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "remoteAssistantItemForResponder:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAssistantItem:", v68);

    }
  }
  objc_msgSend(v181, "_responderWindow");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "windowScene");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v176, "_sceneIdentifier");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSceneID:");
  objc_msgSend(v4, "setContextID:", objc_msgSend(v69, "_contextId"));
  v177 = v69;
  objc_msgSend(v69, "layer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayerID:", CALayerGetRenderId());

  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsImagePaste:", objc_msgSend(v71, "delegateSupportsImagePaste"));

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_43;
    -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v72, "canInsertAdaptiveImageGlyph"))
    {
      objc_msgSend(v4, "setSupportsEmojiImageTextAttachments:", 1);
      goto LABEL_42;
    }
    -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSupportsEmojiImageTextAttachments:", objc_msgSend(v73, "canInsertEmojiImageTextAttachment"));
LABEL_41:

    goto LABEL_42;
  }
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v72, "canInsertAdaptiveImageGlyph"))
  {
    -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSupportsAdaptiveImageGlyph:", objc_msgSend(v73, "canInsertEmojiImageTextAttachment"));
    goto LABEL_41;
  }
  objc_msgSend(v4, "setSupportsAdaptiveImageGlyph:", 1);
LABEL_42:

LABEL_43:
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "textInputTraits");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDevicePasscodeEntry:", objc_msgSend(v75, "isDevicePasscodeEntry"));

  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "textInputTraits");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisableInputBars:", objc_msgSend(v77, "disableInputBars"));

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "delegateAsResponder");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v189[0] = 0x1E1729F20;
  v80 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v173, "textInputTraits");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "numberWithBool:", objc_msgSend(v172, "forceFloatingKeyboard"));
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v190[0] = v171;
  v189[1] = 0x1E1729F40;
  v81 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "textInputTraits");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "numberWithBool:", objc_msgSend(v169, "forceDisableDictation"));
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v168;
  v189[2] = 0x1E1729F60;
  v82 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v167, "textInputTraits");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "numberWithBool:", objc_msgSend(v166, "useAutomaticEndpointing"));
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v165;
  v189[3] = 0x1E1729F80;
  v83 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "textInputTraits");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "numberWithBool:", objc_msgSend(v163, "acceptsDictationSearchResults"));
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v190[3] = v162;
  v189[4] = 0x1E1729FA0;
  v84 = (void *)MEMORY[0x1E0CB37E8];
  NSClassFromString(CFSTR("UISearchTextField"));
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "textInputTraits");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v135, "showDictationButton");
  }
  else
  {
    v85 = 0;
  }
  objc_msgSend(v84, "numberWithInt:", v85);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v190[4] = v160;
  v189[5] = 0x1E172A000;
  v86 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v159, "textInputTraits");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "numberWithBool:", objc_msgSend(v158, "forceEnableDictation"));
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v190[5] = v157;
  v189[6] = 0x1E1729FC0;
  v87 = (void *)MEMORY[0x1E0CB37E8];
  +[UIDictationController activeInstance](UIDictationController, "activeInstance");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "numberWithBool:", objc_msgSend(v156, "shouldSuppressSoftwareKeyboard"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v190[6] = v155;
  v189[7] = 0x1E1729FE0;
  v88 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardCameraSession activeSession](UIKeyboardCameraSession, "activeSession");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "numberWithBool:", objc_msgSend(v154, "shouldSuppressSoftwareKeyboard"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v190[7] = v153;
  v189[8] = 0x1E172A020;
  v89 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "numberWithBool:", objc_msgSend(v152, "hasCustomInputViewController"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v190[8] = v151;
  v189[9] = 0x1E172A040;
  v90 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "numberWithBool:", objc_msgSend(v150, "_shouldSuppressAssistantBar"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v190[9] = v149;
  v189[10] = 0x1E172A060;
  v91 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "numberWithBool:", objc_msgSend(v148, "_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:", 0));
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v190[10] = v147;
  v189[11] = 0x1E172A080;
  if (v181)
  {
    v92 = (objc_class *)objc_opt_class();
    NSStringFromClass(v92);
    v93 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v93 = &stru_1E16EDF20;
  }
  v141 = (__CFString *)v93;
  v190[11] = v93;
  v189[12] = 0x1E172A0A0;
  *(_QWORD *)&v146[4] = v180->_cachedHasPreviousKeyResponder;
  if (*(_QWORD *)&v146[4])
  {
    *(_DWORD *)v146 = 0;
    cachedHasPreviousKeyResponder = (uint64_t)v180->_cachedHasPreviousKeyResponder;
  }
  else
  {
    v95 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v79, "_previousKeyResponder");
    v96 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v146 = v96 != 0;
    v134 = (void *)v96;
    if (v96)
    {
      objc_msgSend(v79, "_previousKeyResponder");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v131 != v79;
    }
    else
    {
      v97 = 0;
    }
    objc_msgSend(v95, "numberWithInt:", v97);
    cachedHasPreviousKeyResponder = objc_claimAutoreleasedReturnValue();
  }
  v140 = (void *)cachedHasPreviousKeyResponder;
  v190[12] = cachedHasPreviousKeyResponder;
  v189[13] = 0x1E172A0C0;
  v174 = v79;
  *(_QWORD *)&v145[4] = v180->_cachedHasNextKeyResponder;
  if (*(_QWORD *)&v145[4])
  {
    *(_DWORD *)v145 = 0;
    cachedHasNextKeyResponder = (uint64_t)v180->_cachedHasNextKeyResponder;
  }
  else
  {
    v99 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v79, "_nextKeyResponder");
    v100 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v145 = v100 != 0;
    v133 = (void *)v100;
    if (v100)
    {
      objc_msgSend(v79, "_nextKeyResponder");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = v130 != v79;
    }
    else
    {
      v101 = 0;
    }
    objc_msgSend(v99, "numberWithInt:", v101);
    cachedHasNextKeyResponder = objc_claimAutoreleasedReturnValue();
  }
  v139 = (void *)cachedHasNextKeyResponder;
  v190[13] = cachedHasNextKeyResponder;
  v189[14] = 0x1E172A0E0;
  v102 = (void *)MEMORY[0x1E0CB37E8];
  -[UIKBRTIPartner partnerDelegate](v180, "partnerDelegate");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "numberWithBool:", objc_msgSend(v144, "returnKeyEnabled"));
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v190[14] = v143;
  v189[15] = 0x1E172A100;
  pendingDisableBecomeFirstResponderParameters = v180->_pendingDisableBecomeFirstResponderParameters;
  if (pendingDisableBecomeFirstResponderParameters)
  {
    v104 = v6;
    v142 = 0;
    v105 = v180->_pendingDisableBecomeFirstResponderParameters;
  }
  else
  {
    v187 = CFSTR("disabled");
    v106 = (void *)MEMORY[0x1E0CB37E8];
    v142 = +[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP");
    if (v142)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "keyboardArbiterClient");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = objc_msgSend(v137, "disableBecomeFirstResponder");
    }
    else
    {
      v107 = 0;
    }
    v104 = v6;
    objc_msgSend(v106, "numberWithInt:", v107);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = v132;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v190[15] = v105;
  v189[16] = 0x1E172A120;
  v108 = (void *)MEMORY[0x1E0CB37E8];
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "existingContainerRootController");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "numberWithInt:", objc_msgSend(v110, "hiddenCount"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v190[16] = v111;
  v189[17] = 0x1E172A140;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v104, "wordLearningEnabled"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v190[17] = v112;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v190, v189, 18);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setUserInfo:", v113);

  if (!pendingDisableBecomeFirstResponderParameters)
  {

  }
  v114 = v181;
  if (v142)
  {

  }
  if (!*(_QWORD *)&v145[4])

  if (!*(_DWORD *)v145)
  {
    if (*(_QWORD *)&v145[4])
      goto LABEL_75;
LABEL_90:

    if (*(_QWORD *)&v146[4])
      goto LABEL_76;
    goto LABEL_91;
  }

  if (!*(_QWORD *)&v145[4])
    goto LABEL_90;
LABEL_75:
  if (*(_QWORD *)&v146[4])
    goto LABEL_76;
LABEL_91:

LABEL_76:
  if (!*(_DWORD *)v146)
  {
    if (*(_QWORD *)&v146[4])
      goto LABEL_78;
LABEL_93:

    if (!v181)
      goto LABEL_80;
    goto LABEL_79;
  }

  if (!*(_QWORD *)&v146[4])
    goto LABEL_93;
LABEL_78:
  if (v181)
LABEL_79:

LABEL_80:
  if ((isKindOfClass & 1) != 0)
  {

  }
  objc_msgSend(v182, "userInfo");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "objectForKeyedSubscript:", 0x1E172A0A0);
  v116 = objc_claimAutoreleasedReturnValue();
  v117 = v180->_cachedHasPreviousKeyResponder;
  v180->_cachedHasPreviousKeyResponder = (NSNumber *)v116;

  objc_msgSend(v182, "userInfo");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "objectForKeyedSubscript:", 0x1E172A0C0);
  v119 = objc_claimAutoreleasedReturnValue();
  v120 = v180->_cachedHasNextKeyResponder;
  v180->_cachedHasNextKeyResponder = (NSNumber *)v119;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "textInputTraits");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setSingleLineDocument:", objc_msgSend(v122, "isSingleLineDocument"));

  _UIMainBundleIdentifier();
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "setBundleId:", v123);

  if (v178 && +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    -[UIKBRTIPartner delegate](v180, "delegate");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "_responderWindow");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "windowScene");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "_synchronizeDrawingAndReturnFence");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "setFenceHandle:", v127);

    v114 = v181;
  }
  -[UIKBRTIPartner rtiDocumentTraits](v180, "rtiDocumentTraits");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v182, "isEqual:", v128) ^ 1 | v178;

  if (v51 == 1)
    -[UIKBRTIPartner setRtiDocumentTraits:](v180, "setRtiDocumentTraits:", v182);

  return v51;
}

- (UIKBRTIPartnerDelegate)partnerDelegate
{
  return (UIKBRTIPartnerDelegate *)objc_loadWeakRetained((id *)&self->_partnerDelegate);
}

- (RTIDocumentTraits)rtiDocumentTraits
{
  return self->_rtiDocumentTraits;
}

- (void)setRtiDocumentTraits:(id)a3
{
  objc_storeStrong((id *)&self->_rtiDocumentTraits, a3);
}

- (CGRect)_selectionClipRect
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  char v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect result;

  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "selectionClipRect");
LABEL_5:
    v12 = v7;
    v13 = v8;
    v14 = v9;
    v15 = v10;

    goto LABEL_7;
  }
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_selectionClipRect");
    goto LABEL_5;
  }
  v12 = *MEMORY[0x1E0C9D628];
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_7:
  v26.origin.x = v12;
  v26.origin.y = v13;
  v26.size.width = v14;
  v26.size.height = v15;
  if (CGRectIsNull(v26))
  {
    -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textInputView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v12 = v18;
    v13 = v19;
    v14 = v20;
    v15 = v21;

  }
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (void)documentStateChanged
{
  -[UIKBRTIPartner documentStateChanged:](self, "documentStateChanged:", 0);
}

- (void)documentStateChanged:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateReturnKey:", 0);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__UIKBRTIPartner_documentStateChanged___block_invoke;
    v7[3] = &unk_1E16B1B78;
    v7[4] = self;
    v8 = a3;
    -[UIKBRTIPartner updateStateWithCompletion:updateTraits:](self, "updateStateWithCompletion:updateTraits:", v7, 1);
  }
}

- (void)setInputSystemClientEnabled:(BOOL)a3
{
  self->_inputSystemClientEnabled = a3;
}

- (void)_queryUIKitDocumentRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double MinX;
  uint64_t v51;
  double MaxX;
  uint64_t v53;
  double v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  void *v58;
  id v59;
  void (**v60)(id, void *);
  id v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  os_signpost_id_t v93;
  NSObject *v94;
  NSObject *v95;
  unint64_t v96;
  uint64_t v97;
  os_signpost_id_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  id v119;
  uint64_t v120;
  __int128 v121;
  NSObject *v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  NSObject *v130;
  void *v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t i;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  uint64_t v148;
  void *v149;
  void *v150;
  id v151;
  void *v152;
  NSObject *v153;
  NSObject *v154;
  void *v155;
  NSObject *v156;
  NSObject *v157;
  void *v158;
  __int128 v159;
  void *v160;
  os_signpost_id_t v161;
  void *v162;
  void *v163;
  id v164;
  unint64_t v165;
  unint64_t v166;
  void *v167;
  char v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void (**v173)(id, void *);
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  os_signpost_id_t spid;
  id v179;
  void *v180;
  void *v181;
  void *v182;
  int v183;
  void *v184;
  unint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  UIKBRTIPartner *v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  uint8_t v196[128];
  uint8_t buf[4];
  const char *v198;
  __int16 v199;
  uint64_t v200;
  __int16 v201;
  void *v202;
  __int16 v203;
  id v204;
  uint64_t v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;

  v205 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  _UIKeyboardLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _UIKeyboardLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v185 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "queryUIKitDocument", ", buf, 2u);
  }
  spid = v9;

  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputView");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](self, "_uiTextGranularityForRTITextGranularity:", objc_msgSend(v6, "textGranularity"));
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "textInputTraits");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "isSecureTextEntry") & 1) != 0
    || (objc_msgSend(v15, "recentInputIdentifier"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    v13 = 5;
  }
  objc_msgSend(v12, "selectedTextRange");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "markedTextRange");
  v18 = objc_claimAutoreleasedReturnValue();
  v191 = self;
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v12, "markedTextRange");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEmpty");

    if ((v21 & 1) != 0)
    {
      v183 = 0;
    }
    else
    {
      objc_msgSend(v12, "markedTextRange");
      v22 = objc_claimAutoreleasedReturnValue();

      v183 = 1;
      v17 = (void *)v22;
    }
    self = v191;
  }
  else
  {
    v183 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D87178], "documentStateWithRequest:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    _UIKeyboardLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v185 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v38))
      goto LABEL_51;
    *(_WORD *)buf = 0;
    goto LABEL_50;
  }
  v168 = objc_msgSend(v6, "flags");
  if ((v168 & 8) == 0)
  {
    objc_msgSend(v17, "start");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    objc_msgSend(v17, "end");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "inputDelegateManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "visibleTextRect");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;

  v206.origin.x = v43;
  v206.origin.y = v45;
  v206.size.width = v47;
  v206.size.height = v49;
  MinX = CGRectGetMinX(v206);
  v207.origin.x = v43;
  v207.origin.y = v45;
  v207.size.width = v47;
  v207.size.height = v49;
  objc_msgSend(v12, "closestPositionToPoint:", MinX, CGRectGetMinY(v207));
  v51 = objc_claimAutoreleasedReturnValue();
  if (!v51)
  {
    _UIKeyboardLog();
    v69 = objc_claimAutoreleasedReturnValue();
    v39 = v69;
    if (v185 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v69))
      goto LABEL_51;
    *(_WORD *)buf = 0;
LABEL_50:
    _os_signpost_emit_with_name_impl(&dword_185066000, v39, OS_SIGNPOST_INTERVAL_END, spid, "queryUIKitDocument", ", buf, 2u);
LABEL_51:

    v7[2](v7, v23);
    goto LABEL_159;
  }
  v24 = (void *)v51;
  v25 = v17;
  if (objc_msgSend(v12, "baseWritingDirectionForPosition:inDirection:", v51, 0) == 1)
  {
    v208.origin.x = v43;
    v208.origin.y = v45;
    v208.size.width = v47;
    v208.size.height = v49;
    MaxX = CGRectGetMaxX(v208);
    v209.origin.x = v43;
    v209.origin.y = v45;
    v209.size.width = v47;
    v209.size.height = v49;
    objc_msgSend(v12, "closestPositionToPoint:", MaxX, CGRectGetMinY(v209));
    v53 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v53;
  }
  v210.origin.x = v43;
  v210.origin.y = v45;
  v210.size.width = v47;
  v210.size.height = v49;
  v54 = CGRectGetMaxX(v210);
  v211.origin.x = v43;
  v211.origin.y = v45;
  v211.size.width = v47;
  v211.size.height = v49;
  objc_msgSend(v12, "closestPositionToPoint:", v54, CGRectGetMaxY(v211));
  v55 = objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    v26 = (void *)v55;
    if (objc_msgSend(v12, "baseWritingDirectionForPosition:inDirection:", v55, 0) == 1)
    {
      v212.origin.x = v43;
      v212.origin.y = v45;
      v212.size.width = v47;
      v212.size.height = v49;
      v56 = CGRectGetMinX(v212);
      v213.origin.x = v43;
      v213.origin.y = v45;
      v213.size.width = v47;
      v213.size.height = v49;
      objc_msgSend(v12, "closestPositionToPoint:", v56, CGRectGetMaxY(v213));
      v57 = objc_claimAutoreleasedReturnValue();

      v26 = (void *)v57;
    }
LABEL_16:
    v188 = v23;
    v170 = v15;
    v173 = v7;
    if ((objc_msgSend(v6, "surroundingGranularityCount") & 0x8000000000000000) == 0)
    {
      v27 = 0;
      while (1)
      {
        objc_msgSend(v12, "tokenizer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "positionFromPosition:toBoundary:inDirection:", v24, v13, 1);
        v29 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "tokenizer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "positionFromPosition:toBoundary:inDirection:", v26, v13, 0);
        v31 = objc_claimAutoreleasedReturnValue();

        if (!(v29 | v31))
          break;
        if (v29)
          v32 = (void *)v29;
        else
          v32 = v24;
        v33 = v32;

        if (v31)
          v34 = (void *)v31;
        else
          v34 = v26;
        v35 = v34;

        ++v27;
        v36 = objc_msgSend(v6, "surroundingGranularityCount");
        v37 = v35;
        v24 = v33;
        v26 = v37;
        if (v36 < v27)
          goto LABEL_37;
      }
    }
    v37 = v26;
    v33 = v24;
LABEL_37:
    v182 = v37;
    v184 = v33;
    v17 = v25;
    objc_msgSend(v25, "start");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "end");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    if (v58 || !v59)
    {
      v60 = v173;
      if (v59 || !v58)
      {
LABEL_43:
        v61 = v59;
        v62 = v25;
        v63 = v62;
        v64 = 0;
        v65 = 0x7FFFFFFFFFFFFFFFLL;
        v181 = v58;
        v167 = v62;
        v66 = 0;
        if (!v58)
        {
          v67 = 0;
          v180 = v62;
          v68 = 0;
          goto LABEL_78;
        }
        v67 = 0;
        v180 = v62;
        v68 = 0;
        if (!v61)
          goto LABEL_78;
        if ((objc_msgSend(v6, "flags") & 1) == 0)
        {
          v64 = 0;
          v66 = 0;
          v67 = 0;
          v68 = 0;
          v180 = v63;
          goto LABEL_78;
        }
        v70 = objc_msgSend(v12, "comparePosition:toPosition:", v184, v181);
        v71 = objc_msgSend(v12, "comparePosition:toPosition:", v184, v61);
        v72 = objc_msgSend(v12, "comparePosition:toPosition:", v182, v181);
        v73 = objc_msgSend(v12, "comparePosition:toPosition:", v182, v61);
        if (v70 == 1 && v71 == 1)
        {
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v184, v182);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textInRange:", v74);
          v75 = objc_claimAutoreleasedReturnValue();
          v174 = 0;
LABEL_63:
          v176 = 0;
LABEL_64:
          v180 = v167;
LABEL_65:

          goto LABEL_66;
        }
        if (v70 == 1 && v73 == 1)
        {
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v184, v61);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textInRange:", v74);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v61, v182);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textInRange:", v78);
          v75 = objc_claimAutoreleasedReturnValue();

          goto LABEL_63;
        }
        if (v70 != 1 && v73 != -1)
        {
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v184, v181);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textInRange:", v74);
          v176 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v181, v61);
          v84 = objc_claimAutoreleasedReturnValue();

          v180 = (void *)v84;
          objc_msgSend(v12, "textInRange:", v84);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v61, v182);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textInRange:", v85);
          v75 = objc_claimAutoreleasedReturnValue();

          goto LABEL_65;
        }
        if (v72 == 1 && v73 != 1)
        {
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v184, v181);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textInRange:", v74);
          v176 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textRangeFromPosition:toPosition:", v181, v182);
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "textInRange:", v158);
          v174 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_166:
          v75 = 0;
          goto LABEL_64;
        }
        v75 = 0;
        if (v72 == 1)
        {
          v180 = v167;
          v174 = 0;
          v176 = 0;
        }
        else
        {
          v180 = v167;
          v174 = 0;
          v176 = 0;
          if (v73 != 1)
          {
            objc_msgSend(v12, "textRangeFromPosition:toPosition:", v184, v182);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "textInRange:", v74);
            v174 = 0;
            v176 = objc_claimAutoreleasedReturnValue();
            goto LABEL_166;
          }
        }
LABEL_66:
        v171 = v75;
        if (v183)
        {
          objc_msgSend(v12, "selectedTextRange");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "start");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v12, "offsetFromPosition:toPosition:", v181, v80);

          objc_msgSend(v79, "start");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "end");
          v82 = v17;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v12, "offsetFromPosition:toPosition:", v81, v83);

          v17 = v82;
        }
        else
        {
          v67 = 0;
          v65 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v174)
        {
          if (objc_msgSend(v174, "length"))
          {
            v64 = (void *)v176;
            v68 = v174;
LABEL_77:
            v66 = (void *)v171;
            v60 = v173;
LABEL_78:
            v86 = v68;
            v87 = objc_alloc(MEMORY[0x1E0DBDB78]);
            if (v183)
              v88 = v86;
            else
              v88 = 0;
            v175 = v86;
            v177 = v64;
            if (v183)
              v89 = 0;
            else
              v89 = v86;
            v169 = (void *)objc_msgSend(v87, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v64, v88, v89, v66, v65, v67);
            objc_msgSend(v188, "setDocumentState:");
            objc_msgSend(v188, "setHasText:", objc_msgSend(v12, "hasText"));
            -[UIKBRTIPartner _addFirstSelectionRectToDocumentState:](v191, "_addFirstSelectionRectToDocumentState:", v188);
            if ((objc_msgSend(v6, "flags") & 0x10) != 0)
              -[UIKBRTIPartner _addTextCheckingAnnotatedStringToDocumentState:](v191, "_addTextCheckingAnnotatedStringToDocumentState:", v188);
            v172 = v66;
            v90 = v181;
            v91 = v61;
            v23 = v188;
            if ((objc_msgSend(v6, "flags") & 0x20) != 0)
              -[UIKBRTIPartner _addAutocorrectStylingToDocumentState:](v191, "_addAutocorrectStylingToDocumentState:", v188);
            v7 = v60;
            if ((objc_msgSend(v6, "flags") & 4) == 0)
              goto LABEL_153;
            _UIKeyboardLog();
            v92 = objc_claimAutoreleasedReturnValue();
            v93 = os_signpost_id_generate(v92);

            _UIKeyboardLog();
            v94 = objc_claimAutoreleasedReturnValue();
            v95 = v94;
            v96 = v93 - 1;
            if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_185066000, v95, OS_SIGNPOST_INTERVAL_BEGIN, v93, "queryUIKitDocument.addRects", ", buf, 2u);
            }

            v190 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](v191, "_uiTextGranularityForRTITextGranularity:", objc_msgSend(v6, "rectGranularity"));
            if (v190 == 5)
            {
              v97 = objc_msgSend(v12, "offsetFromPosition:toPosition:", v184, v182);
              objc_msgSend(v12, "firstRectForRange:", v167);
              -[UIKBRTIPartner convertRect:from:](v191, "convertRect:from:", v189);
              objc_msgSend(v188, "addTextRect:forCharacterRange:granularity:", 0, v97, 5);
              v98 = v93;
              v90 = v181;
LABEL_141:
              if (v183)
              {
                objc_msgSend(v12, "markedTextRange");
                v147 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIKBRTIPartner _addCharacterRectsToDocumentState:textRange:offset:](v191, "_addCharacterRectsToDocumentState:textRange:offset:", v23, v147, objc_msgSend(v177, "length"));

              }
              else if ((v168 & 8) == 0)
              {
                v148 = objc_msgSend(v177, "length");
                objc_msgSend(v167, "isEmpty");
                if (v91)
                {
                  objc_msgSend(v12, "_rangeOfEnclosingWord:", v91);
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = v149;
                  if (v149)
                  {
                    v166 = v96;
                    v151 = v149;

                    objc_msgSend(v151, "start");
                    v152 = (void *)objc_claimAutoreleasedReturnValue();
                    v148 = objc_msgSend(v12, "offsetFromPosition:toPosition:", v184, v152);

                    v23 = v188;
                    v180 = v151;
                    v96 = v166;
                  }

                  v90 = v181;
                }
                -[UIKBRTIPartner _addCharacterRectsToDocumentState:textRange:offset:](v191, "_addCharacterRectsToDocumentState:textRange:offset:", v23, v180, v148, v159);
              }
LABEL_149:
              _UIKeyboardLog();
              v153 = objc_claimAutoreleasedReturnValue();
              v154 = v153;
              if (v96 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v153))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_185066000, v154, OS_SIGNPOST_INTERVAL_END, v98, "queryUIKitDocument.addRects", ", buf, 2u);
              }

LABEL_153:
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                -[UIKBRTIPartner partnerDelegate](v191, "partnerDelegate");
                v155 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "setScrolling:", objc_msgSend(v155, "selectionScrolling"));

              }
              _UIKeyboardLog();
              v156 = objc_claimAutoreleasedReturnValue();
              v157 = v156;
              if (v185 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v156))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_185066000, v157, OS_SIGNPOST_INTERVAL_END, spid, "queryUIKitDocument", ", buf, 2u);
              }

              v7[2](v7, v23);
              v15 = v170;
              goto LABEL_159;
            }
            v161 = v93;
            v162 = v91;
            v163 = v17;
            v99 = v12;
            v100 = objc_msgSend(v6, "rectCountBefore");
            v101 = v100;
            v102 = *MEMORY[0x1E0D871F8];
            if (v100 <= *MEMORY[0x1E0D871F8])
              v103 = *MEMORY[0x1E0D871F8];
            else
              v103 = v100;
            objc_msgSend(v6, "surroundingGranularityCount");
            v104 = objc_msgSend(v6, "rectCountAfter");
            v105 = v104;
            if (v104 <= v102)
              v106 = v102;
            else
              v106 = v104;
            v186 = v106;
            v165 = v96;
            if (v102 >= v101)
            {
              v111 = v184;
            }
            else
            {
              objc_msgSend(v180, "start");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v103 & 0x8000000000000000) == 0)
              {
                v108 = 0;
                while (1)
                {
                  objc_msgSend(v99, "tokenizer");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v109, "positionFromPosition:toBoundary:inDirection:", v107, v190, 1);
                  v110 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v110 || objc_msgSend(v99, "comparePosition:toPosition:", v110, v184) == -1)
                    break;
                  v111 = v110;

                  ++v108;
                  v107 = v111;
                  if (v103 < v108)
                    goto LABEL_110;
                }

              }
              v111 = v107;
            }
LABEL_110:
            if (v102 >= v105)
            {
              v118 = v182;
              v12 = v99;
            }
            else
            {
              objc_msgSend(v180, "end");
              v112 = objc_claimAutoreleasedReturnValue();
              v113 = (void *)v112;
              v12 = v99;
              if ((v186 & 0x8000000000000000) == 0)
              {
                v114 = 0;
                v115 = v184;
                while (1)
                {
                  objc_msgSend(v99, "tokenizer");
                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v116, "positionFromPosition:toBoundary:inDirection:", v113, v190, 0);
                  v117 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v117 || objc_msgSend(v99, "comparePosition:toPosition:", v182, v117) == -1)
                    break;
                  v118 = v117;

                  ++v114;
                  v113 = v118;
                  if (v186 < v114)
                    goto LABEL_121;
                }

                v118 = v113;
LABEL_121:
                v119 = v111;
                v120 = objc_msgSend(v12, "offsetFromPosition:toPosition:", v115, v119);
                if (v120 < 0)
                {
                  _UIKeyboardLog();
                  v122 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315906;
                    v198 = "-[UIKBRTIPartner _queryUIKitDocumentRequest:completion:]";
                    v199 = 2048;
                    v200 = v120;
                    v201 = 2112;
                    v202 = v115;
                    v203 = 2112;
                    v204 = v119;
                    _os_log_error_impl(&dword_185066000, v122, OS_LOG_TYPE_ERROR, "%s negative offset=%lu from start=%@ to rectStart=%@", buf, 0x2Au);
                  }

                }
                v164 = v6;
                v123 = 0;
                v124 = 0;
                v125 = v120 & ~(v120 >> 63);
                *(_QWORD *)&v121 = 136315394;
                v159 = v121;
                v160 = v119;
                v126 = v119;
                v179 = v118;
                do
                {
                  v127 = v123;
                  v123 = v126;

                  objc_msgSend(v12, "tokenizer");
                  v128 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v128, "positionFromPosition:toBoundary:inDirection:", v123, v190, 0);
                  v126 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v126)
                    break;
                  objc_msgSend(v12, "textRangeFromPosition:toPosition:", v123, v126);
                  v129 = objc_claimAutoreleasedReturnValue();
                  _UIKeyboardLog();
                  v130 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = v159;
                    v198 = "-[UIKBRTIPartner _queryUIKitDocumentRequest:completion:]";
                    v199 = 2112;
                    v200 = v129;
                    _os_log_debug_impl(&dword_185066000, v130, OS_LOG_TYPE_DEBUG, "%s calling selectionRectsForRange:%@", buf, 0x16u);
                  }
                  v125 += v124;

                  v187 = (void *)v129;
                  objc_msgSend(v12, "selectionRectsForRange:", v129);
                  v131 = (void *)objc_claimAutoreleasedReturnValue();
                  v192 = 0u;
                  v193 = 0u;
                  v194 = 0u;
                  v195 = 0u;
                  v132 = v131;
                  v133 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v192, v196, 16);
                  if (v133)
                  {
                    v134 = v133;
                    v135 = *(_QWORD *)v193;
                    do
                    {
                      for (i = 0; i != v134; ++i)
                      {
                        if (*(_QWORD *)v193 != v135)
                          objc_enumerationMutation(v132);
                        v137 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * i);
                        objc_msgSend(v137, "rect", v159);
                        if (v138 != 0.0)
                        {
                          objc_msgSend(v137, "rect");
                          -[UIKBRTIPartner convertRect:from:](v191, "convertRect:from:", v189);
                          v140 = v139;
                          v142 = v141;
                          v144 = v143;
                          v146 = v145;
                          v124 = objc_msgSend(v99, "offsetFromPosition:toPosition:", v123, v126);
                          objc_msgSend(v188, "addTextRect:forCharacterRange:granularity:isVertical:", v125, v124, v190, objc_msgSend(v137, "isVertical"), v140, v142, v144, v146);
                        }
                      }
                      v134 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v192, v196, 16);
                    }
                    while (v134);
                  }

                  v12 = v99;
                  v118 = v179;
                  if (!objc_msgSend(v99, "comparePosition:toPosition:", v126, v123))
                    break;
                }
                while (objc_msgSend(v99, "comparePosition:toPosition:", v126, v179) == -1);

                v17 = v163;
                v6 = v164;
                v7 = v173;
                v23 = v188;
                v90 = v181;
                v98 = v161;
                v91 = v162;
                v96 = v165;
                if (!v190)
                  goto LABEL_149;
                goto LABEL_141;
              }
              v118 = (id)v112;
            }
            v115 = v184;
            goto LABEL_121;
          }

        }
        v68 = 0;
        v64 = (void *)v176;
        goto LABEL_77;
      }
    }
    else
    {
      v58 = v59;
      v60 = v173;
    }
    v59 = v58;
    v58 = v59;
    goto LABEL_43;
  }
  _UIKeyboardLog();
  v76 = objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (v185 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v76))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v77, OS_SIGNPOST_INTERVAL_END, spid, "queryUIKitDocument", ", buf, 2u);
  }

  v7[2](v7, v23);
LABEL_159:

}

- (int64_t)_uiTextGranularityForRTITextGranularity:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
    return 1;
  else
    return a3;
}

- (void)_addTextCheckingAnnotatedStringToDocumentState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "setTextCheckingAnnotatedString:", 0);
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v25;
  if ((v5 & 1) != 0)
  {
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "markedTextRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(v8, "selectedTextRange");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v25, "documentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contextBeforeInput");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "documentState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contextAfterInput");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "start");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v17, -objc_msgSend(v14, "length"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "end");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v19, objc_msgSend(v16, "length"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (v20)
        {
          objc_msgSend(v8, "textRangeFromPosition:toPosition:", v18, v20);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "annotatedSubstringForRange:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setTextCheckingAnnotatedString:", v24);

          }
        }
      }

    }
    v6 = v25;
  }

}

- (void)_addAutocorrectStylingToDocumentState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v4 = a3;
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_fontForCaretSelection");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D871F0];
  v7 = objc_msgSend(v26, "isSystemFont");
  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v26, "fontName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v26, "pointSize");
  v10 = v9;
  objc_msgSend(v26, "fontDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", *(_QWORD *)off_1E167DC80);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(v6, "textStylingWithFontName:fontSize:fontWeight:", v8, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v7 & 1) == 0)
  objc_msgSend(v4, "setAutocorrectBubbleStyling:", v14);
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_textColorForCaretSelection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D87168];
  v18 = objc_retainAutorelease(v16);
  objc_msgSend(v17, "colorWithCGColor:", objc_msgSend(v18, "CGColor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocorrectTextColor:", v19);
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textInputTraits");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "selectionHighlightColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D87168];
  v24 = objc_retainAutorelease(v22);
  objc_msgSend(v23, "colorWithCGColor:", objc_msgSend(v24, "CGColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutocorrectTextBackgroundColor:", v25);

}

- (void)beginAllowingRemoteTextInput:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[UIKBRTIPartner _createRTIClientIfNecessary](self, "_createRTIClientIfNecessary");
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginAllowingRemoteTextInput:", v4);

  -[UIKBRTIPartner _updateGeometryObserverIfNecessary](self, "_updateGeometryObserverIfNecessary");
}

- (void)beginInputSessionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
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
  _QWORD v21[4];
  id v22;
  UIKBRTIPartner *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  -[UIKBRTIPartner _createRTIClientIfNecessary](self, "_createRTIClientIfNecessary");
  -[UIKBRTIPartner setCurrentSessionIdentifier:](self, "setCurrentSessionIdentifier:", v4);
  if (!+[UIKeyboard usingEndInputSessionCompletion](UIKeyboard, "usingEndInputSessionCompletion"))
  {
    os_unfair_lock_lock(&self->_lock);
    -[UIKBRTIPartner rtiSessionMarkers](self, "rtiSessionMarkers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKey:", v6, v4);

    os_unfair_lock_unlock(&self->_lock);
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __50__UIKBRTIPartner_beginInputSessionWithIdentifier___block_invoke;
  v21[3] = &unk_1E16C0EA8;
  v7 = v4;
  v23 = self;
  v24 = &v25;
  v22 = v7;
  -[UIKBRTIPartner updateStateWithCompletion:updateTraits:](self, "updateStateWithCompletion:updateTraits:", v21, 0);
  if (+[UIKeyboard usingEndInputSessionCompletion](UIKeyboard, "usingEndInputSessionCompletion"))
  {
    *((_BYTE *)v26 + 24) = v7 != 0;
    if (v7)
    {
      -[UIKBRTIPartner rtiDocumentState](self, "rtiDocumentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0D87178]);
        -[UIKBRTIPartner setRtiDocumentState:](self, "setRtiDocumentState:", v9);

      }
    }
    objc_msgSend(MEMORY[0x1E0D871C0], "defaultBeginOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visualModeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "windowingModeEnabled");

    objc_msgSend(v10, "setEnhancedWindowingModeEnabled:", v13);
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "nextAnimationStyle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v15, "animated");

    if ((v13 & 1) == 0)
      objc_msgSend(v10, "setAnimated:", 0);
    -[UIKBRTIPartner updateAnimationForOptions:](self, "updateAnimationForOptions:", v10);
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner rtiDocumentState](self, "rtiDocumentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:", v7, v10, v17, v18);

    -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fenceHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "invalidate");

    -[UIKBRTIPartner _updateGeometryObserverIfNecessary](self, "_updateGeometryObserverIfNecessary");
    -[UIKBRTIPartner _performQueuedSupplementalLexiconOperations](self, "_performQueuedSupplementalLexiconOperations");
    -[UIKBRTIPartner updateTextSuggestionsIfNecessary:](self, "updateTextSuggestionsIfNecessary:", v7);

  }
  _Block_object_dispose(&v25, 8);

}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v14;
  unsigned int v15;
  uint64_t v16;
  _BOOL4 dontTakeKeyboardSnapshot;
  NSObject *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];
  uint8_t buf[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((_DWORD)v6 == 4
    && (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI")
     || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI")))
  {
    self->_applicationDeactivationReasonAssistant = 1;
    if (self->_dontTakeKeyboardSnapshot)
    {
      _UIKeyboardLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Assistant Keyboard Snapshot triggered", buf, 2u);
      }

      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "existingContainerRootController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "takeKeyboardSnapshotIgnoringSpotlightCheck:", self->_applicationDeactivationReasonAssistant);

    }
  }
  else
  {
    if (+[UIKeyboard usesInputSystemUIForAutoFillOnly](UIKeyboard, "usesInputSystemUIForAutoFillOnly"))
    {
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner authenticatingSessionIdentifier](self, "authenticatingSessionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) == 0 && ((_DWORD)v6 == 5 || (_DWORD)v6 == 0))
        -[UIKBRTIPartner forwardInputDestinationEventToUIHost:](self, "forwardInputDestinationEventToUIHost:", sel_dismissAutoFillPanel);
    }
    if ((v6 - 1) <= 1)
      self->_dontTakeKeyboardSnapshot = 1;
    if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
      v14 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:withNewReason:", -[UIKBRTIPartner _ignoredReasonsForKeyboard](self, "_ignoredReasonsForKeyboard"), v6);
    else
      v14 = 0;
    v15 = +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI");
    if (v15)
      v15 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:withNewReason:", -[UIKBRTIPartner _ignoredReasonsForAutoFill](self, "_ignoredReasonsForAutoFill"), v6);
    v16 = v14 | v15;
    if ((v6 - 11) > 1)
    {
      if ((_DWORD)v6 != 5)
      {
        -[UIKBRTIPartner setApplicationStateIsActiveForRTI:](self, "setApplicationStateIsActiveForRTI:", v16);
        -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 1, CFSTR("Application resigned active"));
      }
    }
    else
    {
      -[UIKBRTIPartner setApplicationStateIsActiveForRTI:](self, "setApplicationStateIsActiveForRTI:", v16);
      dontTakeKeyboardSnapshot = self->_dontTakeKeyboardSnapshot;
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject existingContainerRootController](v18, "existingContainerRootController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (dontTakeKeyboardSnapshot)
      {
        objc_msgSend(v19, "clearKeyboardSnapshot");

        _UIKeyboardLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_DEFAULT, "Keyboard Snapshot is skipped", v21, 2u);
        }
      }
      else
      {
        objc_msgSend(v19, "takeKeyboardSnapshotIgnoringSpotlightCheck:", self->_applicationDeactivationReasonAssistant);

      }
      -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 0, CFSTR("Application suspended"));
    }
  }
}

- (void)_applicationDidRemoveDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("_UIApplicationDeactivationReasonUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    v7 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:", -[UIKBRTIPartner _ignoredReasonsForKeyboard](self, "_ignoredReasonsForKeyboard"));
  else
    v7 = 0;
  v8 = +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI");
  if (v8)
    v8 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:", -[UIKBRTIPartner _ignoredReasonsForAutoFill](self, "_ignoredReasonsForAutoFill"));
  if ((v7 | v8) != 1)
  {
    if ((v6 - 11) < 2)
      goto LABEL_11;
    if (v6 == 5)
      goto LABEL_19;
    goto LABEL_17;
  }
  v9 = -[UIKBRTIPartner applicationStateIsActiveForRTI](self, "applicationStateIsActiveForRTI");
  if ((v6 - 11) >= 2)
  {
    if (v6 == 5)
      goto LABEL_19;
    if (v9)
    {
      v11 = 1;
LABEL_18:
      -[UIKBRTIPartner setApplicationStateIsActiveForRTI:](self, "setApplicationStateIsActiveForRTI:", v11);
      -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 1, CFSTR("Application became active"));
      goto LABEL_19;
    }
LABEL_17:
    v11 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReason:", 5);
    goto LABEL_18;
  }
  if (!v9)
  {
LABEL_11:
    v10 = objc_msgSend((id)UIApp, "_isActivatedIgnoringReasons:", -[UIKBRTIPartner _ignoredReasonsForKeyboard](self, "_ignoredReasonsForKeyboard"));
    goto LABEL_12;
  }
  v10 = 1;
LABEL_12:
  -[UIKBRTIPartner setApplicationStateIsActiveForRTI:](self, "setApplicationStateIsActiveForRTI:", v10);
  -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 0, CFSTR("Application resumed"));
  self->_applicationDeactivationReasonAssistant = 0;
LABEL_19:
  self->_dontTakeKeyboardSnapshot = 0;
}

- (unsigned)_ignoredReasonsForAutoFill
{
  return 4134;
}

- (void)_updateRTIAllowedAndNotify:(BOOL)a3 withReason:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  int64_t id;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;

  v13 = v12 > 0.0 && v10 > 0.0;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "existingContainerWindow");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = objc_msgSend(v16, "_isHostedInAnotherProcess");
  if (v18)
    v19 = -[UIKBRTIPartner viewServiceStateIsActiveForRTI](self, "viewServiceStateIsActiveForRTI");
  else
    v19 = -[UIKBRTIPartner applicationStateIsActiveForRTI](self, "applicationStateIsActiveForRTI");
  v20 = v13 & v19;
  if (v4)
    v21 = 2;
  else
    v21 = 0;
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isEnvironmentEnabled") || (v20 & 1) != 0)
  {

  }
  else
  {

    if (v16)
    {
      if (v18)
        v23 = 2;
      else
        v23 = 1;
      +[UIDictationController inputSystemSessionWillEndForReason:](UIDictationController, "inputSystemSessionWillEndForReason:", v23);
    }
  }
  v24 = v21 | v20;
  v25 = +[UIKeyboard usingEndInputSessionCompletion](UIKeyboard, "usingEndInputSessionCompletion");
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v25)
  {

    if (v27)
    {
      if (os_variant_has_internal_diagnostics())
      {
        _UIKeyboardExtendedLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = "Disabled";
          id = self->_id;
          *(_DWORD *)buf = 136315650;
          if ((_DWORD)v20)
            v33 = "Enabled";
          v39 = v33;
          v40 = 2112;
          v41 = v6;
          v42 = 2048;
          v43 = id;
          _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_DEFAULT, "RTIPartner setEnvironmentOptions:%s withReason:%@ (id=%ld)", buf, 0x20u);
        }

      }
      _UIKeyboardInputSessionChangeLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_185066000, v28, OS_LOG_TYPE_DEBUG, "Waiting on response from -setEnvironmentOptions:withReason:completion:", buf, 2u);
      }

      -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "taskQueue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke;
      v35[3] = &unk_1E16BB820;
      v35[4] = self;
      v37 = v24;
      v36 = v6;
      objc_msgSend(v30, "performSingleTask:", v35);

      _UIKeyboardInputSessionChangeLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_185066000, v31, OS_LOG_TYPE_DEBUG, "Done blocking on -setEnvironmentOptions:withReason:completion:", buf, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(v26, "setEnvironmentOptions:withReason:", v24, v6);

  }
}

- (BOOL)applicationStateIsActiveForRTI
{
  return self->_applicationStateIsActiveForRTI;
}

- (void)setApplicationStateIsActiveForRTI:(BOOL)a3
{
  self->_applicationStateIsActiveForRTI = a3;
}

- (NSUUID)authenticatingSessionIdentifier
{
  return self->_authenticatingSessionIdentifier;
}

- (void)_createRTIClientIfNecessary
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if (-[UIKBRTIPartner inputSystemClientEnabled](self, "inputSystemClientEnabled"))
  {
    _UIKeyboardLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "Creating a new RTI client", v5, 2u);
    }

    -[UIKBRTIPartner _createRTIClient](self, "_createRTIClient");
  }
}

void __50__UIKBRTIPartner_beginInputSessionWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void (**v25)(void);
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!+[UIKeyboard usingEndInputSessionCompletion](UIKeyboard, "usingEndInputSessionCompletion"))
  {
    objc_msgSend(*(id *)(a1 + 40), "rtiClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D871C0], "defaultBeginOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "visualModeManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "windowingModeEnabled");

      objc_msgSend(v10, "setEnhancedWindowingModeEnabled:", v13);
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "nextAnimationStyle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = objc_msgSend(v15, "animated");

      if ((v13 & 1) == 0)
        objc_msgSend(v10, "setAnimated:", 0);
      objc_msgSend(*(id *)(a1 + 40), "updateAnimationForOptions:", v10);
      objc_msgSend(*(id *)(a1 + 40), "rtiClient");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "rtiDocumentTraits");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "rtiDocumentState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "beginRemoteTextInputSessionWithID:options:documentTraits:initialDocumentState:", v17, v10, v18, v19);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "rtiClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "rtiDocumentTraits");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "rtiDocumentState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "beginRemoteTextInputSessionWithID:documentTraits:initialDocumentState:", v20, v16, v18);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(*(id *)(a1 + 40), "rtiSessionMarkers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "rtiSessionMarkers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 40));
    -[NSObject completionHandler](v5, "completionHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      _UIKeyboardLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v31 = *(_QWORD *)(a1 + 32);
        v32 = 138412290;
        v33 = v31;
        _os_log_debug_impl(&dword_185066000, v24, OS_LOG_TYPE_DEBUG, "Performing deferred end session for: %@", (uint8_t *)&v32, 0xCu);
      }

      -[NSObject completionHandler](v5, "completionHandler");
      v25 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v25[2]();

    }
    objc_msgSend(*(id *)(a1 + 40), "rtiDocumentTraits");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "fenceHandle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "invalidate");

    objc_msgSend(*(id *)(a1 + 40), "_updateGeometryObserverIfNecessary");
    objc_msgSend(*(id *)(a1 + 40), "_performQueuedSupplementalLexiconOperations");
    objc_msgSend(*(id *)(a1 + 40), "updateTextSuggestionsIfNecessary:", *(_QWORD *)(a1 + 32));
    goto LABEL_18;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    _UIKeyboardInputSessionChangeLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v30 = *(_QWORD *)(a1 + 32);
      v32 = 138412290;
      v33 = v30;
      _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "Got state for session with ID: %@", (uint8_t *)&v32, 0xCu);
    }

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 40), "currentSessionIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "rtiClient");
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "currentSessionIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "rtiDocumentState");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject remoteTextInputSessionWithID:documentDidChange:](v5, "remoteTextInputSessionWithID:documentDidChange:", v6, v7);

LABEL_18:
        return;
      }
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        _UIKeyboardInputSessionChangeLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v28 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "currentSessionIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 138412546;
          v33 = v28;
          v34 = 2112;
          v35 = v29;
          _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "WARNING: Got state for session beginning session with ID: %@, but current session has ID: %@", (uint8_t *)&v32, 0x16u);

        }
        goto LABEL_18;
      }
    }
  }
}

- (NSMutableDictionary)rtiSessionMarkers
{
  return self->_rtiSessionMarkers;
}

void __48__UIKBRTIPartner__updateRTIStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegateAsResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setRtiDocumentState:", v3);
    objc_msgSend(v3, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contextBeforeInput");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hasSuffix:", CFSTR("\n"));

    objc_msgSend(*(id *)(a1 + 40), "rtiDocumentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDocumentState:", v8);

    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "canSuggestSupplementalItemsForCurrentSelection");
    objc_msgSend(*(id *)(a1 + 40), "rtiDocumentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCanSuggestSupplementalItemsForCurrentSelection:", v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _UIKeyboardInputSessionChangeLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "Got document state but inputDelegate changed in meantime (not an error)", v14, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (RTIDocumentState)rtiDocumentState
{
  return self->_rtiDocumentState;
}

- (void)updateTextSuggestionsIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v11)
    goto LABEL_4;
  -[UIKBRTIPartner textSuggestions](self, "textSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKBRTIPartner textSuggestions](self, "textSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner textSuggestionsChanged:](self, "textSuggestionsChanged:", v10);

    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner removeTextSuggestionsForSessionWithID:](self, "removeTextSuggestionsForSessionWithID:", v4);
LABEL_4:

  }
}

- (void)updateStateWithCompletion:(id)a3 updateTraits:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (-[UIKBRTIPartner _updateRTITraitsIfNecessary](self, "_updateRTITraitsIfNecessary") && v4)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTextInputSessionWithID:documentTraitsDidChange:", v7, v8);

  }
  -[UIKBRTIPartner _updateRTIStateWithCompletion:](self, "_updateRTIStateWithCompletion:", v9);

}

- (void)updateAnimationForOptions:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextAnimationStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "setOffscreenDirection:", objc_msgSend(v4, "outDirection"));

}

- (NSMutableDictionary)textSuggestions
{
  return self->_textSuggestions;
}

- (void)setRtiDocumentState:(id)a3
{
  objc_storeStrong((id *)&self->_rtiDocumentState, a3);
}

- (void)setCurrentSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)_updateRTIStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  UIKBRTIPartner *v13;
  id v14;

  v4 = a3;
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultDocumentRequest");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D87170]);
    objc_msgSend(v6, "setTextGranularity:", 2);
    objc_msgSend(v6, "setRectGranularity:", 1);
    if (qword_1ECD7F0D0 != -1)
      dispatch_once(&qword_1ECD7F0D0, &__block_literal_global_921);
    objc_msgSend(v6, "setSurroundingGranularityCount:", qword_1ECD7F0C8);
    if (qword_1ECD7F0E0 != -1)
      dispatch_once(&qword_1ECD7F0E0, &__block_literal_global_931);
    objc_msgSend(v6, "setRectCountBefore:", qword_1ECD7F0D8);
    if (qword_1ECD7F0F0 != -1)
      dispatch_once(&qword_1ECD7F0F0, &__block_literal_global_937);
    objc_msgSend(v6, "setRectCountAfter:", qword_1ECD7F0E8);
    objc_msgSend(v6, "setFlags:", 49);
    if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
      objc_msgSend(v6, "setFlags:", objc_msgSend(v6, "flags") | 4);
  }
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegateAsResponder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__UIKBRTIPartner__updateRTIStateWithCompletion___block_invoke;
  v11[3] = &unk_1E16D7BD0;
  v12 = v8;
  v13 = self;
  v14 = v4;
  v9 = v4;
  v10 = v8;
  -[UIKBRTIPartner _queryDocumentRequest:completion:](self, "_queryDocumentRequest:completion:", v6, v11);

}

- (void)_queryDocumentRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v6)
  {
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDelegateManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasAsyncCapableInputDelegate");

    if (v9)
      -[UIKBRTIPartner _queryWKDocumentRequest:completion:](self, "_queryWKDocumentRequest:completion:", v10, v6);
    else
      -[UIKBRTIPartner _queryUIKitDocumentRequest:completion:](self, "_queryUIKitDocumentRequest:completion:", v10, v6);
  }

}

- (void)_performQueuedSupplementalLexiconOperations
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[UIKBRTIPartner queuedSupplementalLexiconOperations](self, "queuedSupplementalLexiconOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner setQueuedSupplementalLexiconOperations:](self, "setQueuedSupplementalLexiconOperations:", 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "type", (_QWORD)v13);
        if (v10 == 1)
        {
          -[UIKBRTIPartner _didRemoveSupplementalLexiconWithIdentifier:](self, "_didRemoveSupplementalLexiconWithIdentifier:", objc_msgSend(v9, "lexiconIdentifier"));
        }
        else if (!v10)
        {
          objc_msgSend(v9, "lexicon");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v9, "lexicon");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIKBRTIPartner _didAddSupplementalLexicon:](self, "_didAddSupplementalLexicon:", v12);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)setQueuedSupplementalLexiconOperations:(id)a3
{
  objc_storeStrong((id *)&self->_queuedSupplementalLexiconOperations, a3);
}

- (NSMutableArray)queuedSupplementalLexiconOperations
{
  return self->_queuedSupplementalLexiconOperations;
}

- (unsigned)_ignoredReasonsForKeyboard
{
  if (+[UIKeyboard shouldExtendKeyboardInputUI](UIKeyboard, "shouldExtendKeyboardInputUI"))
    return 4143;
  else
    return 4134;
}

- (void)_createRTIClient
{
  id v3;
  id v4;

  v3 = -[UIKBRTIPartner _newRTIConnection](self, "_newRTIConnection");
  -[UIKBRTIPartner setRtiClient:](self, "setRtiClient:", v3);

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner _didCreateRTIClient:](self, "_didCreateRTIClient:", v4);

}

- (void)setRtiClient:(id)a3
{
  objc_storeStrong((id *)&self->_rtiClient, a3);
}

- (id)_newRTIConnection
{
  id v4;
  void *v5;
  void *v6;

  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    return -[UIKBRTIPartner _newInputSystemUIClient](self, "_newInputSystemUIClient");
  if (+[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI](UIKeyboard, "usesInputSystemUIForAutoFillOnlyWithRTI"))
  {
    return -[UIKBRTIPartner _newInputSystemAutoFillUIClient](self, "_newInputSystemAutoFillUIClient");
  }
  v4 = objc_alloc(MEMORY[0x1E0D871A0]);
  -[UIKBRTIPartner _defaultRTIMachNames](self, "_defaultRTIMachNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMachNames:", v5);

  return v6;
}

- (id)_newInputSystemAutoFillUIClient
{
  id v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = objc_alloc(MEMORY[0x1E0D87198]);
  v3 = (void *)objc_msgSend(v2, "initWithUIHostMachName:", *MEMORY[0x1E0D87208]);
  _UIKeyboardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "creating new AutofillUI connection", v6, 2u);
  }

  return v3;
}

- (void)_didCreateRTIClient:(id)a3
{
  objc_msgSend(a3, "setDelegate:", self);
  -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 0, CFSTR("Synchronize with initial Application state"));
}

- (void)forwardInputDestinationEventToUIHost:(SEL)a3 params:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0D87188];
  v7 = a4;
  v11 = objc_alloc_init(v6);
  objc_msgSend(v11, "setActionSelector:", a3);
  objc_msgSend(v11, "setCustomInfoType:", CFSTR("UIUserInteractionRemoteInputOperations"));
  objc_msgSend(v11, "setCustomInfo:", v7);

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTextInputSessionWithID:performInputOperation:", v10, v11);

  }
}

- (void)forwardInputDestinationEventToUIHost:(SEL)a3
{
  -[UIKBRTIPartner forwardInputDestinationEventToUIHost:params:](self, "forwardInputDestinationEventToUIHost:params:", a3, 0);
}

- (void)finishCompletionHandlersIfNeeded
{
  void *v2;
  id v3;

  -[UIKBRTIPartner exchangeWaitingRTIOutputOperationResponseContext:](self, "exchangeWaitingRTIOutputOperationResponseContext:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "transferExecutionToMainThreadWithTask:", &__block_literal_global_394);
    v2 = v3;
  }

}

- (id)exchangeWaitingRTIOutputOperationResponseContext:(id)a3
{
  UIKeyboardTaskExecutionContext *v4;
  UIKBRTIPartner *v5;
  UIKeyboardTaskExecutionContext *v6;
  UIKeyboardTaskExecutionContext *waitingRTIOutputOperationResponseContext;
  UIKeyboardTaskExecutionContext *v8;

  v4 = (UIKeyboardTaskExecutionContext *)a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = v5->_waitingRTIOutputOperationResponseContext;
  waitingRTIOutputOperationResponseContext = v5->_waitingRTIOutputOperationResponseContext;
  v5->_waitingRTIOutputOperationResponseContext = v4;
  v8 = v4;

  objc_sync_exit(v5);
  return v6;
}

- (UIKBRTIPartner)init
{
  UIKBRTIPartner *v2;
  UIKBRTIPartner *v3;
  uint64_t v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *rtiSessionMarkers;
  void *v7;
  NSObject *v9;
  int64_t id;
  objc_super v11;
  uint8_t buf[4];
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)UIKBRTIPartner;
  v2 = -[UIKBRTIPartner init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = _nextInstanceID_count++;
    v2->_id = v4;
    if (os_variant_has_internal_diagnostics())
    {
      _UIKeyboardExtendedLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id = v3->_id;
        *(_DWORD *)buf = 134217984;
        v13 = id;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "RTI partner init (id=%ld)", buf, 0xCu);
      }

    }
    objc_msgSend((id)objc_opt_class(), "registerTextOperationCustomInfo");
    v3->_lock._os_unfair_lock_opaque = 0;
    v3->_applicationStateIsActiveForRTI = objc_msgSend((id)UIApp, "applicationState") == 0;
    v3->_viewServiceStateIsActiveForRTI = 1;
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rtiSessionMarkers = v3->_rtiSessionMarkers;
    v3->_rtiSessionMarkers = v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__applicationWillSuspend_, CFSTR("UIApplicationSuspendedNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__viewServiceHostDidBecomeActive_, 0x1E1784B00, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__viewServiceHostWillResignActive_, 0x1E1784AE0, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__viewServiceHostDidBecomeActive_, 0x1E1784AC0, 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__applicationWillAddDeactivationReason_, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__applicationDidRemoveDeactivationReason_, CFSTR("_UIApplicationDidRemoveDeactivationReasonNotification"), 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel__screenModeDidChange_, CFSTR("UIScreenModeDidChangeNotification"), 0);

  }
  return v3;
}

+ (void)registerTextOperationCustomInfo
{
  if (registerTextOperationCustomInfo_onceToken != -1)
    dispatch_once(&registerTextOperationCustomInfo_onceToken, &__block_literal_global_365);
}

- (void)_applicationWillSuspend:(id)a3
{
  void *v4;
  id v5;

  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (+[UIKeyboard usingEndInputSessionCompletion](UIKeyboard, "usingEndInputSessionCompletion"))
    {
      -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 0, CFSTR("Application will suspend"));
    }
    else
    {
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner endAllowingRemoteTextInput:](self, "endAllowingRemoteTextInput:", v5);

    }
  }
}

- (void)removeTextSuggestionsForSessionWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIKBRTIPartner textSuggestions](self, "textSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBRTIPartner textSuggestions](self, "textSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (void)endInputSessionWithIdentifier:(id)a3 shouldResign:(BOOL)a4 waitForReply:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  id *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  NSNumber *cachedHasPreviousKeyResponder;
  NSNumber *cachedHasNextKeyResponder;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  UIKBRTIPartner *v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v5 = a5;
  v6 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (+[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
    v9 = !v6;
  else
    v9 = 1;
  if (!v9 && +[UIDictationController isRunning](UIDictationController, "isRunning"))
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowState:", 0);

  }
  if (!v8)
  {
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D871C0], "defaultOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setShouldResign:", v6);
    -[UIKBRTIPartner updateAnimationForOptions:](self, "updateAnimationForOptions:", v12);
  }
  if (v5
    && (-[UIKBRTIPartner rtiClient](self, "rtiClient"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_opt_respondsToSelector(),
        v13,
        (v14 & 1) != 0))
  {
    _UIKeyboardInputSessionChangeLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v8;
      _os_log_debug_impl(&dword_185066000, v15, OS_LOG_TYPE_DEBUG, "Waiting on response from -endRemoteTextInputSessionWithID:%@", buf, 0xCu);
    }

    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "taskQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke;
    v39[3] = &unk_1E16BB128;
    v39[4] = self;
    v18 = &v40;
    v19 = v8;
    v40 = v19;
    v20 = &v41;
    v41 = v12;
    objc_msgSend(v17, "performSingleTask:", v39);

    _UIKeyboardInputSessionChangeLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v19;
      _os_log_debug_impl(&dword_185066000, (os_log_t)v21, OS_LOG_TYPE_DEBUG, "Done blocking on -endRemoteTextInputSessionWithID:%@", buf, 0xCu);
    }
  }
  else
  {
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_153;
    v35 = &unk_1E16B47A8;
    v36 = self;
    v18 = &v37;
    v22 = v8;
    v37 = v22;
    v20 = &v38;
    v38 = v12;
    v21 = (uint64_t)_Block_copy(&v32);
    os_unfair_lock_lock(&self->_lock);
    -[UIKBRTIPartner rtiSessionMarkers](self, "rtiSessionMarkers", v32, v33, v34, v35, v36);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "setCompletionHandler:", v21);
      os_unfair_lock_unlock(&self->_lock);
      _UIKeyboardLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v22;
        _os_log_debug_impl(&dword_185066000, v25, OS_LOG_TYPE_DEBUG, "Found an active begin session, deferring end: %@", buf, 0xCu);
      }

    }
    else
    {
      os_unfair_lock_unlock(&self->_lock);
      (*(void (**)(uint64_t))(v21 + 16))(v21);
    }

  }
  -[UIKBRTIPartner finishCompletionHandlersIfNeeded](self, "finishCompletionHandlersIfNeeded");
  -[UIKBRTIPartner setCurrentSessionIdentifier:](self, "setCurrentSessionIdentifier:", 0);
  -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "devicePasscodeEntry");

  if (v27)
  {
    v28 = objc_alloc_init(MEMORY[0x1E0DBDB78]);
    -[UIKBRTIPartner rtiDocumentState](self, "rtiDocumentState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDocumentState:", v28);

  }
  cachedHasPreviousKeyResponder = self->_cachedHasPreviousKeyResponder;
  self->_cachedHasPreviousKeyResponder = 0;

  cachedHasNextKeyResponder = self->_cachedHasNextKeyResponder;
  self->_cachedHasNextKeyResponder = 0;

  -[UIKBRTIPartner _updateGeometryObserverIfNecessary](self, "_updateGeometryObserverIfNecessary");
  -[UIKBRTIPartner removeTextSuggestionsForSessionWithID:](self, "removeTextSuggestionsForSessionWithID:", v8);

}

- (void)endInputSessionWithIdentifier:(id)a3 shouldResign:(BOOL)a4
{
  -[UIKBRTIPartner endInputSessionWithIdentifier:shouldResign:waitForReply:](self, "endInputSessionWithIdentifier:shouldResign:waitForReply:", a3, a4, 0);
}

- (void)endAllowingRemoteTextInput:(id)a3 waitForReply:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endAllowingRemoteTextInput:", v7);

    -[UIKBRTIPartner _updateGeometryObserverIfNecessary](self, "_updateGeometryObserverIfNecessary");
  }
  -[UIKBRTIPartner finishCompletionHandlersIfNeeded](self, "finishCompletionHandlersIfNeeded");

}

- (void)endAllowingRemoteTextInput:(id)a3
{
  -[UIKBRTIPartner endAllowingRemoteTextInput:waitForReply:](self, "endAllowingRemoteTextInput:waitForReply:", a3, 0);
}

- (void)dealloc
{
  __CFStringTokenizer *wkRectTokenizer;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int64_t id;
  objc_super v10;
  uint8_t buf[4];
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id = self->_id;
      *(_DWORD *)buf = 134217984;
      v12 = id;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "RTI partner dealloc (id=%ld)", buf, 0xCu);
    }

  }
  wkRectTokenizer = self->_wkRectTokenizer;
  if (wkRectTokenizer)
    CFRelease(wkRectTokenizer);
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UIKBRTIPartner endInputSessionWithIdentifier:](self, "endInputSessionWithIdentifier:", 0);
  }
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateConnections");

  v10.receiver = self;
  v10.super_class = (Class)UIKBRTIPartner;
  -[UIKBRTIPartner dealloc](&v10, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  RTIInputSystemClient *rtiClient;
  NSObject *v8;
  int64_t id;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id = self->_id;
      v10 = 134217984;
      v11 = id;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_DEFAULT, "RTI partner invalidate (id=%ld)", (uint8_t *)&v10, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIApplicationSuspendedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1784B00, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1784AE0, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x1E1784AC0, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIApplicationWillAddDeactivationReasonNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIApplicationDidRemoveDeactivationReasonNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIScreenModeDidChangeNotification"), 0);
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UIKBRTIPartner endInputSessionWithIdentifier:](self, "endInputSessionWithIdentifier:", 0);
  }
  -[RTIInputSystemClient invalidateConnections](self->_rtiClient, "invalidateConnections");
  -[RTIInputSystemClient setDelegate:](self->_rtiClient, "setDelegate:", self);
  rtiClient = self->_rtiClient;
  self->_rtiClient = 0;

}

- (UIKeyboardTaskSubqueue)keyboardTaskSubqueue
{
  UIKBRTIPartner *v2;
  UIKeyboardTaskSubqueue *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_keyboardTaskSubqueue;
  objc_sync_exit(v2);

  return v3;
}

- (void)setKeyboardTaskSubqueue:(id)a3
{
  UIKeyboardTaskSubqueue *v4;
  UIKeyboardTaskSubqueue *keyboardTaskSubqueue;
  UIKBRTIPartner *obj;

  v4 = (UIKeyboardTaskSubqueue *)a3;
  obj = self;
  objc_sync_enter(obj);
  keyboardTaskSubqueue = obj->_keyboardTaskSubqueue;
  obj->_keyboardTaskSubqueue = v4;

  objc_sync_exit(obj);
}

- (void)_viewServiceHostWillResignActive:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "existingContainerRootController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "takeKeyboardSnapshotIgnoringSpotlightCheck:", 0);

  if (+[UIKeyboard usesInputSystemUIForAutoFillOnly](UIKeyboard, "usesInputSystemUIForAutoFillOnly"))
  {
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner authenticatingSessionIdentifier](self, "authenticatingSessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
      -[UIKBRTIPartner forwardInputDestinationEventToUIHost:](self, "forwardInputDestinationEventToUIHost:", sel_dismissAutoFillPanel);
  }
  -[UIKBRTIPartner setViewServiceStateIsActiveForRTI:](self, "setViewServiceStateIsActiveForRTI:", 0);
  -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 0, CFSTR("View service host resigned active"));
}

- (void)_viewServiceHostDidBecomeActive:(id)a3
{
  -[UIKBRTIPartner setViewServiceStateIsActiveForRTI:](self, "setViewServiceStateIsActiveForRTI:", 1);
  -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 0, CFSTR("View service host became active"));
}

- (void)endInputSessionOnSwitchingApps
{
  if (-[UIKBRTIPartner applicationStateIsActiveForRTI](self, "applicationStateIsActiveForRTI"))
  {
    -[UIKBRTIPartner setApplicationStateIsActiveForRTI:](self, "setApplicationStateIsActiveForRTI:", 0);
    -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 1, CFSTR("Application resigned active"));
  }
}

- (void)_screenModeDidChange:(id)a3
{
  -[UIKBRTIPartner _updateRTIAllowedAndNotify:withReason:](self, "_updateRTIAllowedAndNotify:withReason:", 0, CFSTR("Screen mode did change"));
}

- (id)delegate
{
  void *v2;
  void *v3;

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)documentTraitsChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[UIKBRTIPartner _updateRTITraitsIfNecessary](self, "_updateRTITraitsIfNecessary"))
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteTextInputSessionWithID:documentTraitsDidChange:", v4, v5);

    -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fenceHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

  }
}

- (void)endInputSessionWithIdentifier:(id)a3
{
  -[UIKBRTIPartner endInputSessionWithIdentifier:shouldResign:](self, "endInputSessionWithIdentifier:shouldResign:", a3, 1);
}

void __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  +[UIKeyboardTaskSubqueue subqueueWithExecutionContext:](UIKeyboardTaskSubqueue, "subqueueWithExecutionContext:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardTaskSubqueue:", v3);

  objc_msgSend(*(id *)(a1 + 32), "rtiClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_2;
  v9[3] = &unk_1E16B1B50;
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v8;
  objc_msgSend(v4, "endRemoteTextInputSessionWithID:options:completion:", v7, v6, v9);

}

uint64_t __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  _UIKeyboardInputSessionChangeLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "Got response from -endRemoteTextInputSessionWithID:%@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "keyboardTaskSubqueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnExecutionToParentQueue");

  return objc_msgSend(*(id *)(a1 + 40), "setKeyboardTaskSubqueue:", 0);
}

void __74__UIKBRTIPartner_endInputSessionWithIdentifier_shouldResign_waitForReply___block_invoke_153(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rtiClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endRemoteTextInputSessionWithID:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __39__UIKBRTIPartner_documentStateChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "rtiDocumentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOriginatedFromSource:", v2);

  if (objc_msgSend(*(id *)(a1 + 32), "_remoteInputSystemRequiresDocumentStateUpdates"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rtiClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentSessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "rtiDocumentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteTextInputSessionWithID:documentDidChange:", v5, v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "rtiDocumentTraits");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fenceHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

}

- (void)performInputOperation:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTextInputSessionWithID:performInputOperation:", v7, v8);

  }
}

- (void)forwardKeyboardSuppression:(BOOL)a3 suppressAssistantBar:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v4 = a4;
  v5 = a3;
  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0D87188]);
  v14[0] = CFSTR("suppressSoftwareKeyboard");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("suppressAssistantBar");
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomInfo:", v10);

  objc_msgSend(v7, "setCustomInfoType:", CFSTR("UIUserPencilOperations"));
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteTextInputSessionWithID:performInputOperation:", v13, v7);

  }
}

- (void)forwardApplicationOperation:(SEL)a3 object:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D87188]);
  objc_msgSend(v6, "setActionSelector:", a3);
  objc_msgSend(v6, "setCustomInfoType:", CFSTR("UIKBRTICustomInfoTypeApplicationOperations"));
  objc_msgSend(v6, "setCustomInfo:", v13);
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTextInputSessionWithID:performInputOperation:", v10, v6);

  }
  if (sel_setRemoteDisableBecomeFirstResponder_ == a3)
  {
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = 0;
    else
      v12 = v13;
    objc_storeStrong((id *)&self->_pendingDisableBecomeFirstResponderParameters, v12);

  }
}

- (void)forwardKeyboardInputMode:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D87188];
  v5 = a3;
  v9 = objc_alloc_init(v4);
  objc_msgSend(v9, "setCustomInfoType:", CFSTR("UIUserPencilOperations"));
  objc_msgSend(v9, "setActionSelector:", sel_setInputMode_);
  objc_msgSend(v9, "setCustomInfo:", v5);

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTextInputSessionWithID:performInputOperation:", v8, v9);

  }
}

- (void)forwardKeyboardEventToUIHost:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "keyEventForwardedFromInputUIHost") & 1) == 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D87188]);
    objc_msgSend(v4, "setCustomInfo:", v9);
    objc_msgSend(v4, "setCustomInfoType:", CFSTR("UIPhysicalKeyboardEvent"));
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[UIKBRTIPartner rtiClient](self, "rtiClient");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteTextInputSessionWithID:performInputOperation:", v8, v4);

    }
  }

}

- (BOOL)synchronousForwardKeyCommandsBeforePublicToUIHost:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  uint8_t v18[8];
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v4 = a3;
  if ((objc_msgSend(v4, "keyEventForwardedFromInputUIHost") & 1) == 0)
  {
    objc_msgSend(v4, "setKeyCommandHandlingBeforePublic:", 1);
    v6 = objc_alloc_init(MEMORY[0x1E0D87188]);
    objc_msgSend(v6, "setCustomInfo:", v4);
    objc_msgSend(v6, "setCustomInfoType:", CFSTR("UIPhysicalKeyboardEvent"));
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEnvironmentEnabled](v7, "isEnvironmentEnabled"))
    {
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[UIKBRTIPartner rtiClient](self, "rtiClient");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) == 0)
        {
LABEL_12:
          -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setInputModeSwitcherVisibleInRemote:", *((unsigned __int8 *)v24 + 24));

          v5 = *((_BYTE *)v28 + 24) != 0;
LABEL_13:
          _Block_object_dispose(&v23, 8);
          _Block_object_dispose(&v27, 8);

          goto LABEL_14;
        }
        v11 = dispatch_semaphore_create(0);
        -[UIKBRTIPartner rtiClient](self, "rtiClient");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __68__UIKBRTIPartner_synchronousForwardKeyCommandsBeforePublicToUIHost___block_invoke;
        v19[3] = &unk_1E16D7B60;
        v21 = &v27;
        v22 = &v23;
        v7 = v11;
        v20 = v7;
        objc_msgSend(v12, "remoteTextInputSessionWithID:performInputOperation:withResponse:", v13, v6, v19);

        v14 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v7, v14))
        {
          _UIKeyboardLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v18 = 0;
            _os_log_error_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Synchronous IPC call to forward key commands timed out", v18, 2u);
          }

          v5 = 1;
          goto LABEL_13;
        }

      }
    }

    goto LABEL_12;
  }
  v5 = 0;
LABEL_14:

  return v5;
}

intptr_t __68__UIKBRTIPartner_synchronousForwardKeyCommandsBeforePublicToUIHost___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 & 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (a2 & 0x10) != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)synchronousForwardKeyCommandsToUIHost:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  uint8_t v17[16];
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  if ((objc_msgSend(v4, "keyEventForwardedFromInputUIHost") & 1) == 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D87188]);
    objc_msgSend(v6, "setCustomInfo:", v4);
    objc_msgSend(v6, "setCustomInfoType:", CFSTR("UIWebKitOperations"));
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v7 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEnvironmentEnabled](v7, "isEnvironmentEnabled"))
    {
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[UIKBRTIPartner rtiClient](self, "rtiClient");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) == 0)
        {
LABEL_12:
          v5 = *((_BYTE *)v22 + 24) != 0;
LABEL_13:
          _Block_object_dispose(&v21, 8);

          goto LABEL_14;
        }
        v11 = dispatch_semaphore_create(0);
        -[UIKBRTIPartner rtiClient](self, "rtiClient");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __56__UIKBRTIPartner_synchronousForwardKeyCommandsToUIHost___block_invoke;
        v18[3] = &unk_1E16D7B88;
        v20 = &v21;
        v7 = v11;
        v19 = v7;
        objc_msgSend(v12, "remoteTextInputSessionWithID:performInputOperation:withResponse:", v13, v6, v18);

        v14 = dispatch_time(0, 2000000000);
        if (dispatch_semaphore_wait(v7, v14))
        {
          _UIKeyboardLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v17 = 0;
            _os_log_error_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "synchronousForwardKeyCommandsToUIHost timed out", v17, 2u);
          }

          v5 = 1;
          goto LABEL_13;
        }

      }
    }

    goto LABEL_12;
  }
  v5 = 0;
LABEL_14:

  return v5;
}

intptr_t __56__UIKBRTIPartner_synchronousForwardKeyCommandsToUIHost___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 & 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)synchronousForwardKeyInputMethodCommandEventToUIHost:(id)a3 canHandleAppKeyCommand:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  dispatch_semaphore_t v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  NSObject *v18;
  BOOL v19;
  uint8_t v21[8];
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _QWORD v29[3];
  _QWORD v30[4];

  v4 = a4;
  v30[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0D87188]);
  v29[0] = CFSTR("selector");
  v29[1] = CFSTR("keyEvent");
  v30[0] = CFSTR("_handleKeyInputMethodCommandForEvent:canHandleAppKeyCommand:");
  v30[1] = v6;
  v29[2] = CFSTR("canHandleAppKeyCommand");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCustomInfo:", v9);
  objc_msgSend(v7, "setCustomInfoType:", CFSTR("UIWebKitOperations"));
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEnvironmentEnabled](v10, "isEnvironmentEnabled"))
    goto LABEL_9;
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
LABEL_10:
    v19 = *((_BYTE *)v26 + 24) != 0;
    goto LABEL_11;
  }
  v14 = dispatch_semaphore_create(0);
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __94__UIKBRTIPartner_synchronousForwardKeyInputMethodCommandEventToUIHost_canHandleAppKeyCommand___block_invoke;
  v22[3] = &unk_1E16D7B88;
  v24 = &v25;
  v10 = v14;
  v23 = v10;
  objc_msgSend(v15, "remoteTextInputSessionWithID:performInputOperation:withResponse:", v16, v7, v22);

  v17 = dispatch_time(0, 2000000000);
  if (!dispatch_semaphore_wait(v10, v17))
  {

LABEL_9:
    goto LABEL_10;
  }
  _UIKeyboardLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v21 = 0;
    _os_log_error_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "synchronousForwardKeyCommandsToUIHost timed out", v21, 2u);
  }

  v19 = 1;
LABEL_11:
  _Block_object_dispose(&v25, 8);

  return v19;
}

intptr_t __94__UIKBRTIPartner_synchronousForwardKeyInputMethodCommandEventToUIHost_canHandleAppKeyCommand___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 & 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)forwardDictationEventToUIHost:(SEL)a3 withOptionalObject:(id)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0D87188];
  v7 = a4;
  v11 = objc_alloc_init(v6);
  objc_msgSend(v11, "setActionSelector:", a3);
  objc_msgSend(v11, "setInputModality:", 2);
  objc_msgSend(v11, "setCustomInfo:", v7);

  objc_msgSend(v11, "setCustomInfoType:", CFSTR("UIDictationRemoteInputOperations"));
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTextInputSessionWithID:performInputOperation:", v10, v11);

  }
}

- (void)forwardSelectorToUIHost:(SEL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D87188]);
  objc_msgSend(v7, "setActionSelector:", a3);
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEnvironmentEnabled")
    && (-[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier"),
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[UIKBRTIPartner rtiClient](self, "rtiClient");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__UIKBRTIPartner_forwardSelectorToUIHost_completionHandler___block_invoke;
      v15[3] = &unk_1E16D7E70;
      v16 = v6;
      objc_msgSend(v13, "remoteTextInputSessionWithID:performInputOperation:withResponse:", v14, v7, v15);

      goto LABEL_8;
    }
  }
  else
  {

  }
  if (v6)
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
LABEL_8:

}

uint64_t __60__UIKBRTIPartner_forwardSelectorToUIHost_completionHandler___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(result + 16))(result, 1, (a2 >> 2) & 1);
  return result;
}

- (void)forwardKeyboardCameraEvent_startCameraInput:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D87188];
  v5 = a3;
  v9 = objc_alloc_init(v4);
  objc_msgSend(v9, "setActionSelector:", sel_handleRemoteKeyboardCameraEvent_startCameraInput_);
  objc_msgSend(v9, "setInputModality:", 1);
  objc_msgSend(v9, "setCustomInfo:", v5);

  objc_msgSend(v9, "setCustomInfoType:", CFSTR("UIKeyboardCameraRemoteInputOperations"));
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTextInputSessionWithID:performInputOperation:", v8, v9);

  }
}

- (void)forwardEventCallbackToRemoteSource_didChooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = (void *)v6[1];
  else
    v8 = 0;
  v9 = v8;
  if (v7)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D87188]);
    objc_msgSend(v10, "setCustomInfoType:", CFSTR("UISupplementalLexiconInputOperations"));
    v18[0] = CFSTR("selector");
    NSStringFromSelector(sel_handleEventCallbackFromRemoteDestination_didChooseSupplementalItem_toReplaceText_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v18[1] = CFSTR("supplementalItem");
    v12 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18[2] = CFSTR("textToReplace");
    v19[1] = v12;
    v19[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCustomInfo:", v13);

    if (!v9)
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[UIKBRTIPartner rtiClient](self, "rtiClient");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "remoteTextInputSessionWithID:performInputOperation:", v17, v10);

    }
  }

}

- (void)forwardEventToRemoteSource_canSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v3 = a3;
  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0D87188]);
  objc_msgSend(v5, "setCustomInfoType:", CFSTR("UISupplementalLexiconInputOperations"));
  v12[0] = CFSTR("selector");
  NSStringFromSelector(sel_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection_);
  v6 = objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("canSuggest");
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomInfo:", v8);

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteTextInputSessionWithID:performInputOperation:", v11, v5);

  }
}

- (id)textOperation_insertSupplementalCandidate:(id)a3 textToCommit:(id)a4
{
  void *v4;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v4 = 0;
  v16[3] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v7 = (objc_class *)MEMORY[0x1E0D871E8];
    v8 = a4;
    v9 = a3;
    v10 = [v7 alloc];
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v10, "initWithTargetSessionUUID:", v11);

    objc_msgSend(v4, "setCustomInfoType:", CFSTR("UISupplementalLexiconOperations"));
    v15[0] = CFSTR("selector");
    NSStringFromSelector(sel_handleEventFromRemoteSource_insertSupplementalCandidate_textToCommit_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = v9;
    v15[1] = CFSTR("candidate");
    v15[2] = CFSTR("textToCommit");
    v16[2] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setCustomInfo:", v13);
  }
  return v4;
}

- (id)textOperation_chooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13) + 8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "addObject:", v14, (_QWORD)v22);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }

  v15 = objc_msgSend(v8, "count");
  v16 = 0;
  if (v7 && v15)
  {
    v17 = objc_alloc(MEMORY[0x1E0D871E8]);
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v17, "initWithTargetSessionUUID:", v18);

    objc_msgSend(v16, "setCustomInfoType:", CFSTR("UISupplementalLexiconOperations"));
    v26[0] = CFSTR("selector");
    NSStringFromSelector(sel_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = v8;
    v26[1] = CFSTR("supplementalItems");
    v26[2] = CFSTR("textToReplace");
    v27[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCustomInfo:", v20);

  }
  return v16;
}

- (id)textOperation_cancelChooseSupplementalItemToInsert
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D871E8]);
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTargetSessionUUID:", v4);

  objc_msgSend(v5, "setCustomInfoType:", CFSTR("UISupplementalLexiconOperations"));
  v9 = CFSTR("selector");
  NSStringFromSelector(sel_handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomInfo:", v7);

  return v5;
}

- (id)textOperation_insertionPointEnteredText:(id)a3 withSupplementalCandidate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_alloc(MEMORY[0x1E0D871E8]);
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTargetSessionUUID:", v9);

    objc_msgSend(v10, "setCustomInfoType:", CFSTR("UISupplementalLexiconOperations"));
    v14[0] = CFSTR("selector");
    NSStringFromSelector(sel_handleEventFromRemoteSource_insertionPointEnteredText_withSupplementalCandidate_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = v6;
    v14[1] = CFSTR("text");
    v14[2] = CFSTR("candidate");
    v15[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCustomInfo:", v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)textOperation_insertionPointExitedTextWithSupplementalItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D871E8]);
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTargetSessionUUID:", v4);

  objc_msgSend(v5, "setCustomInfoType:", CFSTR("UISupplementalLexiconOperations"));
  v9 = CFSTR("selector");
  NSStringFromSelector(sel_handleEventFromRemoteSource_insertionPointExitedTextWithSupplementalItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomInfo:", v7);

  return v5;
}

- (id)textOperation_insertAutofillContent:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D871E8];
  v5 = a3;
  v6 = [v4 alloc];
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithTargetSessionUUID:", v7);

  objc_msgSend(v8, "setCustomInfoType:", CFSTR("UIKBRTICustomInfoTypeAutofill"));
  v13[0] = CFSTR("selector");
  NSStringFromSelector(sel_handleEventFromRemoteSource_insertAutofillContent_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("autofillContent");
  v14[0] = v9;
  v10 = (void *)objc_msgSend(v5, "copy");

  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomInfo:", v11);

  return v8;
}

- (id)payloadDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputSystemSourceSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sessionIndependentPayloadDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)forwardAutofillPayload:(id)a3 toPayloadDelegate:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "count");
  if (v6 && v7)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D871A8]);
    -[UIKBRTIPartner textOperation_insertAutofillContent:](self, "textOperation_insertAutofillContent:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextOperations:", v9);

    objc_msgSend(v6, "handleTextActionPayload:", v8);
  }

}

- (void)forwardKeyboardOperation:(SEL)a3 object:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputSystemSourceSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "textOperations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEditingActionSelector:", a3);
    objc_msgSend(v8, "setCustomInfoType:", CFSTR("UIKBRTICustomInfoTypeKeyboardOperations"));
    objc_msgSend(v8, "setCustomInfo:", v9);
    objc_msgSend(v7, "flushOperations");

  }
}

- (void)forwardTypologyLogURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputSystemSourceSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "textOperations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCustomInfoType:", CFSTR("UIKBRTICustomInfoTypeTypologyLogOperations"));
    objc_msgSend(v6, "setCustomInfo:", v7);
    objc_msgSend(v5, "flushOperations");

  }
}

- (void)forwardGrammarCorrectionEntries:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D87188];
  v5 = a3;
  v9 = objc_alloc_init(v4);
  objc_msgSend(v9, "setActionSelector:", sel_handleGrammarCorrectionEntries_);
  objc_msgSend(v9, "setCustomInfo:", v5);

  objc_msgSend(v9, "setCustomInfoType:", CFSTR("UIKBRTICustomInfoTypeGrammarCorrectionOperations"));
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteTextInputSessionWithID:performInputOperation:", v8, v9);

  }
}

- (void)addTextSuggestions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBRTIPartner textSuggestions](self, "textSuggestions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[UIKBRTIPartner setTextSuggestions:](self, "setTextSuggestions:", v6);

    }
    -[UIKBRTIPartner textSuggestions](self, "textSuggestions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, v8);

  }
}

- (void)_queueSupplementalLexiconOperation:(unint64_t)a3 lexicon:(id)a4
{
  void *v6;
  id v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;

  v12 = (id *)a4;
  -[UIKBRTIPartner queuedSupplementalLexiconOperations](self, "queuedSupplementalLexiconOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIKBRTIPartner setQueuedSupplementalLexiconOperations:](self, "setQueuedSupplementalLexiconOperations:", v7);

  }
  v8 = v12;
  if (v12)
  {
    if (a3 == 1)
    {
      v9 = -[_UISupplementalLexiconOperation initRemoveOperationWithLexiconIdentifier:]([_UISupplementalLexiconOperation alloc], "initRemoveOperationWithLexiconIdentifier:", objc_msgSend(v12[1], "identifier"));
    }
    else
    {
      if (a3)
        goto LABEL_10;
      v9 = -[_UISupplementalLexiconOperation initAddOperationWithLexicon:]([_UISupplementalLexiconOperation alloc], "initAddOperationWithLexicon:", v12);
    }
    v10 = v9;
    v8 = v12;
    if (v10)
    {
      -[UIKBRTIPartner queuedSupplementalLexiconOperations](self, "queuedSupplementalLexiconOperations");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v10);

      v8 = v12;
    }
  }
LABEL_10:

}

- (void)didAddSupplementalLexicon:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIKBRTIPartner _didAddSupplementalLexicon:](self, "_didAddSupplementalLexicon:", v5);
  else
    -[UIKBRTIPartner _queueSupplementalLexiconOperation:lexicon:](self, "_queueSupplementalLexiconOperation:lexicon:", 0, v5);

}

- (void)didRemoveSupplementalLexicon:(id)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;

  v6 = a3;
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)v6[1];

    -[UIKBRTIPartner _didRemoveSupplementalLexiconWithIdentifier:](self, "_didRemoveSupplementalLexiconWithIdentifier:", objc_msgSend(v5, "identifier"));
  }
  else
  {
    -[UIKBRTIPartner _queueSupplementalLexiconOperation:lexicon:](self, "_queueSupplementalLexiconOperation:lexicon:", 1, v6);

  }
}

- (void)_didAddSupplementalLexicon:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D871D8];
  v5 = *((id *)a3 + 1);
  v8 = (id)objc_msgSend([v4 alloc], "initWithTISupplementalLexicon:iconProvider:", v5, &__block_literal_global_219_1);

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTextInputSessionWithID:didAddRTISupplementalLexicon:", v7, v8);

}

id __45__UIKBRTIPartner__didAddSupplementalLexicon___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  supplementalItem(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "icon"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    v5 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(v3, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0D871D0]);
      v9 = (void *)objc_msgSend(v8, "initWithDataType:data:", *MEMORY[0x1E0D87220], v7);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_didRemoveSupplementalLexiconWithIdentifier:(unint64_t)a3
{
  void *v5;
  id v6;

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteTextInputSessionWithID:didRemoveRTISupplementalLexiconWithIdentifier:", v5, a3);

}

void __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  +[UIKeyboardTaskSubqueue subqueueWithExecutionContext:](UIKeyboardTaskSubqueue, "subqueueWithExecutionContext:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardTaskSubqueue:", v3);

  objc_msgSend(*(id *)(a1 + 32), "rtiClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke_2;
  v7[3] = &unk_1E16B1B28;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setEnvironmentOptions:withReason:completion:", v5, v6, v7);

}

uint64_t __56__UIKBRTIPartner__updateRTIAllowedAndNotify_withReason___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  dispatch_assert_queue_not_V2(MEMORY[0x1E0C80D38]);
  _UIKeyboardInputSessionChangeLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_185066000, v2, OS_LOG_TYPE_DEBUG, "Got response from -setEnvironmentOptions:withReason:completion:", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "keyboardTaskSubqueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnExecutionToParentQueue");

  return objc_msgSend(*(id *)(a1 + 32), "setKeyboardTaskSubqueue:", 0);
}

- (id)_defaultRTIMachNames
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D87210];
  v4[0] = *MEMORY[0x1E0D87218];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_newInputSystemUIClient
{
  id v2;
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = objc_alloc(MEMORY[0x1E0D871B0]);
  v3 = (void *)objc_msgSend(v2, "initWithUIHostMachName:", *MEMORY[0x1E0D87208]);
  _UIKeyboardLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "creating new systemUI connection", v6, 2u);
  }

  return v3;
}

- (void)ensureRTIConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CatalystTextInputLog_UIKit();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[UIKBRTIPartner delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner rtiClient](self, "rtiClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_debug_impl(&dword_185066000, v3, OS_LOG_TYPE_DEBUG, "RTI XPCEndpoint available: self.delegate: %{public}@, self.rtiClient: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[UIKBRTIPartner delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    CatalystTextInputLog_UIKit();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "RTIClient not around when we have a delegate! Attempting to recover...", (uint8_t *)&v9, 2u);
    }

    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resetInputDelegate");
  }

}

- (void)restartCurrentSession
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIKBRTIPartner rtiClient](self, "rtiClient");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner beginAllowingRemoteTextInput:](self, "beginAllowingRemoteTextInput:", v6);

      -[UIKBRTIPartner documentStateChanged](self, "documentStateChanged");
    }
  }
}

- (BOOL)documentTraitsDisableAutomaticKeyboardUI
{
  void *v2;
  char v3;

  -[UIKBRTIPartner rtiDocumentTraits](self, "rtiDocumentTraits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableAutomaticKeyboardUI");

  return v3;
}

- (id)inputDelegateView
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "textInputView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)_addCharacterRectsToDocumentState:(id)a3 textRange:(id)a4 offset:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  unsigned int v63;
  id v64;

  v64 = a3;
  v8 = a4;
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectionRectsForRange:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v11, "isVertical");

  if (v8)
  {
    if ((objc_msgSend(v8, "isEmpty") & 1) == 0)
    {
      -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "inputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "textInputView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v35, "offsetFromPosition:toPosition:", v36, v37);

      objc_msgSend(v8, "start");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38 >= 1)
      {
        v62 = v10;
        v40 = 0;
        while (1)
        {
          objc_msgSend(v13, "positionFromPosition:offset:", v39, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v41)
            break;
          objc_msgSend(v13, "textRangeFromPosition:toPosition:", v39, v41);
          v42 = objc_claimAutoreleasedReturnValue();
          if (!v42)
            break;
          v43 = (void *)v42;
          -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "firstRectForRange:", v43);
          v46 = v45;
          v48 = v47;
          v50 = v49;
          v52 = v51;

          objc_msgSend(v34, "window");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "convertRect:toView:", v53, v46, v48, v50, v52);
          v55 = v54;
          v57 = v56;
          v59 = v58;
          v61 = v60;

          objc_msgSend(v64, "addTextRect:forCharacterRange:granularity:isVertical:", a5, 1, 0, v63, v55, v57, v59, v61);
          v40 = v41;

          ++a5;
          v39 = v40;
          if (!--v38)
            goto LABEL_12;
        }
        v40 = v39;
LABEL_12:

        v39 = v40;
        v10 = v62;
      }

      goto LABEL_14;
    }
    if (objc_msgSend(v8, "isEmpty"))
    {
      -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textInputView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "caretRectForPosition:", v15);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      objc_msgSend(v13, "window");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertRect:toView:", v24, v17, v19, v21, v23);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;

      objc_msgSend(v64, "addTextRect:forCharacterRange:granularity:isVertical:", a5, 0, 0, v63, v26, v28, v30, v32);
LABEL_14:

    }
  }

}

- (void)applyRemoteDocumentTraitsIfNecessary:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  RTIDocumentTraits *remoteDocumentTraits;
  RTIDocumentTraits *v14;
  void *v15;
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
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  RTIDocumentTraits *v30;
  void *v31;
  RTIDocumentTraits *v32;
  RTIDocumentTraits *v33;
  uint64_t v34;
  void *v35;
  _UNKNOWN **v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  UIInputContextHistory *v52;
  void *v53;
  void *v54;
  UIInputContextHistory *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  int v67;
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
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  _UNKNOWN **v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  void *v142;
  int v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  int v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  int v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  char v165;
  BOOL v166;
  void *v167;
  void *v168;
  int v169;
  void *v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  _BOOL4 v178;
  uint64_t v179;
  uint64_t v180;
  _BOOL4 v181;
  void *v182;
  void *v183;
  void *v184;
  _BOOL4 v185;
  void *v186;
  void *v187;
  int v188;
  _QWORD block[4];
  id v190;
  UIKBRTIPartner *v191;
  id v192;
  BOOL v193;
  char v194;
  _QWORD v195[4];
  id v196;
  uint64_t v197;
  uint64_t v198;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputSystemSourceSession");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
  }
  v185 = v4;
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textInputTraits");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  remoteDocumentTraits = self->_remoteDocumentTraits;
  objc_msgSend(v6, "documentTraits");
  v14 = (RTIDocumentTraits *)objc_claimAutoreleasedReturnValue();

  v187 = v9;
  if (remoteDocumentTraits == v14)
  {
    v178 = 0;
    v188 = 0;
  }
  else
  {
    v183 = v12;
    v15 = v11;
    objc_msgSend(v6, "documentTraits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inputViewInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIDocumentTraits inputViewInfo](self->_remoteDocumentTraits, "inputViewInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 == v18)
    {
      v188 = 0;
    }
    else
    {
      objc_msgSend(v6, "documentTraits");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "inputViewInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIDocumentTraits inputViewInfo](self->_remoteDocumentTraits, "inputViewInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v188 = objc_msgSend(v20, "isEqual:", v21) ^ 1;

    }
    objc_msgSend(v6, "documentTraits");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textInputModeData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[RTIDocumentTraits textInputModeData](self->_remoteDocumentTraits, "textInputModeData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        objc_msgSend(v6, "documentTraits");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "textInputModeData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTIDocumentTraits textInputModeData](self->_remoteDocumentTraits, "textInputModeData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v188 |= objc_msgSend(v26, "isEqualToData:", v27) ^ 1;

      }
      v11 = v15;

      v9 = v187;
    }
    else
    {
      v9 = v187;
      v11 = v15;
    }
    v12 = v183;

    v28 = -[RTIDocumentTraits autofillMode](self->_remoteDocumentTraits, "autofillMode");
    objc_msgSend(v6, "documentTraits");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = v28 != objc_msgSend(v29, "autofillMode");

    v30 = self->_remoteDocumentTraits;
    objc_msgSend(v6, "documentTraits");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIDocumentTraits isEqual:](v30, "isEqual:", v31);

    objc_msgSend(v6, "documentTraits");
    v32 = (RTIDocumentTraits *)objc_claimAutoreleasedReturnValue();
    v33 = self->_remoteDocumentTraits;
    self->_remoteDocumentTraits = v32;

  }
  v34 = objc_msgSend(v11, "keyboardAppearance");
  v180 = objc_msgSend(v11, "keyboardType");
  v179 = objc_msgSend(v11, "returnKeyType");
  objc_msgSend(v6, "documentTraits");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = &off_1E167A000;
  if (v35)
  {
    objc_msgSend(v6, "documentTraits");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "textInputTraits");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "overlayWithTITextInputTraits:", v38);

    objc_msgSend(v6, "documentTraits");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "PINEntrySeparatorIndexes");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPINEntrySeparatorIndexes:", v40);

    objc_msgSend(v6, "documentTraits");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "validTextRange");
    objc_msgSend(v12, "setValidTextRange:", v42, v43);

    objc_msgSend(v6, "documentTraits");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "recipientId");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutocorrectionContext:", v45);

    objc_msgSend(v6, "documentTraits");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "recipientId");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRecipientIdentifier:", v47);

    objc_msgSend(v6, "documentTraits");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "responseContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setResponseContext:", v49);

    objc_msgSend(v6, "documentTraits");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "responseContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResponseContext:", v51);

    v52 = [UIInputContextHistory alloc];
    objc_msgSend(v6, "documentTraits");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "inputContextHistory");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = -[UIInputContextHistory initWithInputContextHistory:](v52, "initWithInputContextHistory:", v54);
    objc_msgSend(v12, "setInputContextHistory:", v55);

    objc_msgSend(v6, "documentTraits");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "inputContextHistory");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v57, "copy");
    objc_msgSend(v9, "setInputContextHistory:", v58);

    objc_msgSend(v6, "documentTraits");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "supportedPayloadIds");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupportedPayloadIds:", v60);

    objc_msgSend(v6, "documentTraits");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDevicePasscodeEntry:", objc_msgSend(v61, "devicePasscodeEntry"));

    objc_msgSend(v6, "documentTraits");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisableInputBars:", objc_msgSend(v62, "disableInputBars"));

    objc_msgSend(v6, "documentTraits");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDisablePrediction:", objc_msgSend(v63, "disablePrediction"));

    if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    {
      objc_msgSend(v6, "documentTraits");
      v64 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidePrediction:", objc_msgSend((id)v64, "hidePrediction"));

      LODWORD(v64) = objc_msgSend(v11, "hidePrediction");
      objc_msgSend(v6, "documentTraits");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v64 ^ objc_msgSend(v65, "hidePrediction");

      v67 = v188 & ~v66;
      v36 = &off_1E167A000;
      v188 = v67;
      objc_msgSend(v6, "documentTraits");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDisablePrediction:", objc_msgSend(v68, "disablePrediction"));

    }
    objc_msgSend(v6, "documentTraits");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "fenceHandle");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = v70 != 0;

  }
  else
  {
    v181 = 0;
  }
  if ((objc_msgSend(v36[429], "isInputSystemUI") & 1) == 0)
    objc_msgSend(v12, "setKeyboardAppearance:", v34);
  objc_msgSend(v6, "documentTraits");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutofillMode:", objc_msgSend(v71, "autofillMode"));

  objc_msgSend(v6, "documentTraits");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutofillSubMode:", objc_msgSend(v72, "autofillSubMode"));

  objc_msgSend(v6, "documentTraits");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "enabledSupplementalLexiconIdentifiers");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v186 = v11;
  v184 = v74;
  if (objc_msgSend(v74, "count"))
  {
    objc_msgSend(v74, "firstObject");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSupplementalLexiconIdentifier:", objc_msgSend(v75, "unsignedLongLongValue"));

  }
  else
  {
    objc_msgSend(v9, "setSupplementalLexiconIdentifier:", 0);
  }
  objc_msgSend(v6, "documentTraits");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "autofillContext");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v77, "mutableCopy");

  if (!v78)
  {
    objc_msgSend(v6, "documentTraits");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "shouldLoadAutofillSignUp");

    if ((v80 & 1) != 0)
    {
      v78 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v6, "documentTraits");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "appId");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    objc_msgSend(v6, "documentTraits");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "appId");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "setObject:forKey:", v84, CFSTR("_AppId"));
    if (objc_msgSend(v36[429], "isKeyboardProcess"))
      objc_msgSend(v9, "setClientIdentifier:", v84);

  }
  objc_msgSend(v6, "documentTraits");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "bundleId");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    objc_msgSend(v6, "documentTraits");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "bundleId");
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v78, "setObject:forKey:", v88, CFSTR("_BundleId"));
  }
  objc_msgSend(v6, "documentTraits");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "associatedDomains");
  v90 = objc_claimAutoreleasedReturnValue();

  if (v90)
    objc_msgSend(v78, "setObject:forKey:", v90, CFSTR("_AssociatedDomains"));
  v182 = (void *)v90;
  objc_msgSend(v9, "setAutofillContext:", v78);
  -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDocumentIdentifier:", v92);

  }
  objc_msgSend(v6, "documentTraits");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "userInfo");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = &off_1E167A000;
  if (v94)
  {
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E1729F20);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setForceFloatingKeyboard:", objc_msgSend(v96, "BOOLValue"));

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E1729F40);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setForceDisableDictation:", objc_msgSend(v97, "BOOLValue"));

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E1729F60);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUseAutomaticEndpointing:", objc_msgSend(v98, "BOOLValue"));

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E1729F80);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAcceptsDictationSearchResults:", objc_msgSend(v99, "BOOLValue"));

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A000);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setForceEnableDictation:", objc_msgSend(v100, "BOOLValue"));

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "isSettingDelegate");

    if (v102)
    {
      objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E1729FC0);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v103, "BOOLValue");

      if (v104)
      {
        +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v105;
        v107 = 1;
      }
      else
      {
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v105;
        v107 = 0;
      }
      objc_msgSend(v105, "setShouldSuppressSoftwareKeyboard:", v107);

    }
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A080);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "set_inputDelegateClassName:", v108);

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E1729FA0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v110, "BOOLValue");
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "set_shouldUseDictationSearchFieldBehavior:", v111);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v111) = objc_msgSend(v113, "isSettingDelegate");

    if ((_DWORD)v111)
    {
      objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E1729FE0);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "BOOLValue");

      if (v115)
      {
        +[UIKeyboardCameraSession sharedSession](UIKeyboardCameraSession, "sharedSession");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v116;
        v118 = 1;
      }
      else
      {
        +[UIKeyboardCameraSession activeSession](UIKeyboardCameraSession, "activeSession");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = v116;
        v118 = 0;
      }
      objc_msgSend(v116, "setShouldSuppressSoftwareKeyboard:", v118);

    }
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A020);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend(v119, "BOOLValue");
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "setHasCustomInputViewController:", v120);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A040);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "_setShouldSuppressAssistantBar:", objc_msgSend(v123, "BOOLValue"));

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A060);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "_setShouldSuppressSoftwareKeyboard:", objc_msgSend(v125, "BOOLValue"));

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:", 0);

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A0A0);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend(v127, "BOOLValue");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setHasPreviousKeyResponder:", v128);

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A0C0);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v130, "BOOLValue");
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setHasNextKeyResponder:", v131);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A0E0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "setReturnKeyEnabled:", objc_msgSend(v134, "BOOLValue"));

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A140);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "setCorrectionLearningAllowed:", objc_msgSend(v136, "BOOLValue"));

    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A100);
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v137;
    if (!v137)
      goto LABEL_57;
    objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("disabled"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v139)
      goto LABEL_57;
    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("disabled"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = objc_msgSend(v140, "BOOLValue");

    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("forSuppressionAssertion"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = objc_msgSend(v142, "BOOLValue");

    objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("updatePlacement"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = objc_msgSend(v144, "BOOLValue");

    if (v143)
    {
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:", v141, 1, v145);
    }
    else
    {
      if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
        goto LABEL_57;
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "keyboardArbiterClient");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend(v148, "disableBecomeFirstResponder");

      if ((_DWORD)v141 == v149)
        goto LABEL_57;
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "setDisableBecomeFirstResponder:forSuppressionAssertion:", v141, 0);
    }

LABEL_57:
    objc_msgSend(v94, "objectForKeyedSubscript:", 0x1E172A120);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "BOOLValue");
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "existingContainerRootController");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "setHiddenCount:", v151);

    v9 = v187;
    v95 = &off_1E167A000;
  }
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = objc_msgSend(v154, "showingEmojiSearch");

  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v156;
  if (v155)
  {
    v195[0] = MEMORY[0x1E0C809B0];
    v195[1] = 3221225472;
    v195[2] = __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke;
    v195[3] = &unk_1E16D7BF8;
    v196 = v12;
    v197 = v179;
    v198 = v180;
    objc_msgSend(v157, "modifyTextInputTraits:forceSync:", v195, v185);

    v157 = v196;
  }
  else
  {
    objc_msgSend(v156, "updateInputDelegateForRemoteTraitChange:forceSync:", v12, v185);
  }

  if (+[UIKeyboard isInputSystemUI](UIKeyboard, "isInputSystemUI"))
  {
    objc_msgSend(v6, "documentTraits");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "assistantItem");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKBRTIPartner applyAssistantItem:](self, "applyAssistantItem:", v159);

    objc_msgSend(v6, "documentTraits");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "assistantViewInfo");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentTraits");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "uiRemoteInputViewInfoForProcessId:", objc_msgSend(v162, "processId"));
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = &off_1E167A000;
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "updateAssistantViewInfo:", v163);

    v165 = v188;
    v166 = v181;
    if ((v188 | v181) == 1)
    {
      if (v181)
      {
        objc_msgSend(v6, "documentTraits");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "fenceHandle");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = objc_msgSend(v168, "isUsable");

        if (v169)
        {
          objc_msgSend(v6, "documentTraits");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "fenceHandle");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v172 = (void *)objc_msgSend(v171, "copy");

        }
        else
        {
          v172 = 0;
        }
        v165 = v188;
        v166 = v181;
        v95 = &off_1E167A000;
      }
      else
      {
        v172 = 0;
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke_2;
      block[3] = &unk_1E16B2950;
      v193 = v166;
      v190 = v172;
      v191 = self;
      v192 = v6;
      v194 = v165;
      v173 = v172;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v9 = v187;
    }
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentTraits");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v174, "setRemoteDelegateSupportsImagePaste:", objc_msgSend(v175, "supportsImagePaste"));

    objc_msgSend(v95[474], "activeInstance");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v176, "_updateDelegateRequiresKeyEventsFromRemoteTextInput");

  }
  if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone](UIKeyboard, "useAutoFillUIRTIInterfaceForIphone")
    && +[UIKeyboard supportsAutoFillPanel](UIKeyboard, "supportsAutoFillPanel")
    && v178)
  {
    objc_msgSend(v95[474], "activeInstance");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v177, "displayAutoFillPopoverIfAutoFillModeDetected");

  }
}

void __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v4, "setKeyboardAppearance:", objc_msgSend(v3, "keyboardAppearance"));
  objc_msgSend(v4, "setReturnKeyType:", a1[5]);
  objc_msgSend(v4, "setKeyboardType:", a1[6]);

}

void __61__UIKBRTIPartner_applyRemoteDocumentTraitsIfNecessary_force___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_BYTE *)(a1 + 56))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isUsable"))
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_responderWindow");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "windowScene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_synchronizeDrawingUsingFence:", *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    objc_msgSend(*(id *)(a1 + 48), "documentTraits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fenceHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

  }
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadInputViews");
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAssistantView");
  }

}

- (void)applyAssistantItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyAssistantItem:", v4);

}

- (void)applyRemoteDocumentStateIfNecessary:(id)a3 force:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputSystemSourceSession");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v24;
  }
  v25 = v6;
  objc_msgSend(v6, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "originatedFromSource");

  v10 = v25;
  if (v25)
  {
    objc_msgSend(v25, "documentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "documentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v25;
    if (v12)
    {
      objc_msgSend(v25, "documentState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "documentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "documentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "selectedTextRange");
      v18 = v17;

      v19 = objc_msgSend(v13, "hasText");
      self->_isNotifyingDelegateOfRemoteOutputOperation = 1;
      if (v9)
      {
        -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateForExpectedRemoteDocumentStateChange:selectedTextRange:forceSync:", v14, v16, v18, v4);
      }
      else
      {
        v21 = v19;
        v22 = objc_msgSend(v13, "canSuggestSupplementalItemsForCurrentSelection");
        -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setCanSuggestSupplementalItemsForCurrentSelection:", v22);

        -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateInputDelegateForRemoteDocumentStateChange:selectedTextRange:hasText:forceSync:", v14, v16, v18, v21, v4);
      }

      self->_isNotifyingDelegateOfRemoteOutputOperation = 0;
      v10 = v25;
    }
  }

}

- (void)sendAutoFillDidInsertCallbacksWithTextOperations:(id)a3
{
  char v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v4 = objc_opt_respondsToSelector();
  v5 = v19;
  if ((v4 & 1) != 0)
  {
    v6 = objc_msgSend(v19, "isAutoFillTextOperation");
    v5 = v19;
    if (v6)
    {
      objc_msgSend(v19, "textToAssert");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "length"))
      {

        v5 = v19;
      }
      else
      {
        objc_msgSend(v19, "keyboardOutput");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertionText");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "length");

        v5 = v19;
        if (!v10)
          goto LABEL_12;
      }
      v11 = objc_msgSend(v5, "isExplicitAutoFillInvocation");
      -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if (v11)
      {
        v5 = v19;
        if ((v14 & 1) != 0)
        {
          -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "inputDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          v18 = 1;
LABEL_11:
          objc_msgSend(v16, "autoFillDidInsertWithExplicitInvocationMode:", v18);

          v5 = v19;
        }
      }
      else
      {
        v5 = v19;
        if ((v14 & 1) != 0)
        {
          -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "inputDelegate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          v18 = 0;
          goto LABEL_11;
        }
      }
    }
  }
LABEL_12:

}

- (void)inputSession:(id)a3 documentTraitsDidChange:(id)a4
{
  -[UIKBRTIPartner applyRemoteDocumentTraitsIfNecessary:force:](self, "applyRemoteDocumentTraitsIfNecessary:force:", a3, 1);
}

- (void)inputSession:(id)a3 documentStateDidChange:(id)a4
{
  -[UIKBRTIPartner applyRemoteDocumentStateIfNecessary:force:](self, "applyRemoteDocumentStateIfNecessary:force:", a3, 1);
}

- (void)inputSession:(id)a3 performInputOperation:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void (**v12)(_QWORD);
  void *v13;
  int v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  int v18;
  void (**v19)(_QWORD);
  void *v20;
  int v21;
  void (**v22)(_QWORD);
  void *v23;
  int v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void (**v32)(_QWORD);
  void *v33;
  int v34;
  char *v35;
  void *v36;
  void *v37;
  int v38;
  void (**v39)(_QWORD);
  void *v40;
  int v41;
  void (**v42)(_QWORD);
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  void (**v49)(_QWORD);
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  UIKBRTIPartner *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[5];
  _QWORD v60[4];
  id v61;
  UIKBRTIPartner *v62;
  _QWORD v63[4];
  id v64;
  UIKBRTIPartner *v65;
  _QWORD v66[4];
  id v67;
  UIKBRTIPartner *v68;
  _QWORD v69[4];
  id v70;
  UIKBRTIPartner *v71;
  _QWORD aBlock[4];
  id v73;
  UIKBRTIPartner *v74;
  _QWORD block[5];
  id v76;

  v5 = a4;
  objc_msgSend(v5, "customInfoType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("UIPhysicalKeyboardEvent"));

  if (!v7)
  {
    objc_msgSend(v5, "customInfoType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("UISupplementalLexiconInputOperations"));

    if (v11)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2;
      aBlock[3] = &unk_1E16B1B50;
      v73 = v5;
      v74 = self;
      v12 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (pthread_main_np() == 1)
        v12[2](v12);
      else
        dispatch_async(MEMORY[0x1E0C80D38], v12);

      v16 = v73;
      goto LABEL_41;
    }
    objc_msgSend(v5, "customInfoType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("UIDictationRemoteInputOperations"));

    if (v14)
    {
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3;
      v69[3] = &unk_1E16B1B50;
      v70 = v5;
      v71 = self;
      v15 = (void (**)(_QWORD))_Block_copy(v69);
      if (pthread_main_np() == 1)
        v15[2](v15);
      else
        dispatch_async(MEMORY[0x1E0C80D38], v15);

      v16 = v70;
      goto LABEL_41;
    }
    objc_msgSend(v5, "customInfoType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("UIUserInteractionRemoteInputOperations"));

    if (v18)
    {
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_304;
      v66[3] = &unk_1E16B1B50;
      v67 = v5;
      v68 = self;
      v19 = (void (**)(_QWORD))_Block_copy(v66);
      if (pthread_main_np() == 1)
        v19[2](v19);
      else
        dispatch_async(MEMORY[0x1E0C80D38], v19);

      v16 = v67;
      goto LABEL_41;
    }
    objc_msgSend(v5, "customInfoType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("UIKeyboardCameraRemoteInputOperations"));

    if (v21)
    {
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_348;
      v63[3] = &unk_1E16B1B50;
      v64 = v5;
      v65 = self;
      v22 = (void (**)(_QWORD))_Block_copy(v63);
      if (pthread_main_np() == 1)
        v22[2](v22);
      else
        dispatch_async(MEMORY[0x1E0C80D38], v22);

      v16 = v64;
      goto LABEL_41;
    }
    objc_msgSend(v5, "customInfoType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("UIEmojiSearchOperations"));

    if (v24)
    {
      objc_msgSend(v5, "customInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_42;
      objc_msgSend(v5, "customInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("resign"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_53;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "clearForwardingInputDelegateAndResign:", objc_msgSend(v28, "BOOLValue"));
    }
    else
    {
      objc_msgSend(v5, "customInfoType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("UIUserPencilOperations"));

      if (v31)
      {
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2_349;
        v60[3] = &unk_1E16B1B50;
        v61 = v5;
        v62 = self;
        v32 = (void (**)(_QWORD))_Block_copy(v60);
        if (pthread_main_np() == 1)
          v32[2](v32);
        else
          dispatch_async(MEMORY[0x1E0C80D38], v32);

        v16 = v61;
        goto LABEL_41;
      }
      objc_msgSend(v5, "customInfoType");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeApplicationOperations"));

      v35 = (char *)objc_msgSend(v5, "actionSelector");
      if (!v34)
      {
        if (!v35 || (char *)objc_msgSend(v5, "actionSelector") != sel_acceptAutocorrection)
        {
          objc_msgSend(v5, "customInfoType");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("UIWebKitOperations"));

          if (v38)
          {
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_4;
            v57[3] = &unk_1E16B1B28;
            v58 = v5;
            v39 = (void (**)(_QWORD))_Block_copy(v57);
            if (pthread_main_np() == 1)
              v39[2](v39);
            else
              dispatch_async(MEMORY[0x1E0C80D38], v39);

            v16 = v58;
          }
          else
          {
            objc_msgSend(v5, "customInfoType");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeAnalyticsOperations"));

            if (v41)
            {
              v55[0] = MEMORY[0x1E0C809B0];
              v55[1] = 3221225472;
              v55[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_5;
              v55[3] = &unk_1E16B1B28;
              v56 = v5;
              v42 = (void (**)(_QWORD))_Block_copy(v55);
              if (pthread_main_np() == 1)
                v42[2](v42);
              else
                dispatch_async(MEMORY[0x1E0C80D38], v42);

              v16 = v56;
            }
            else
            {
              objc_msgSend(v5, "customInfoType");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeGrammarCorrectionOperations"));

              if (!v48)
              {
                objc_msgSend(v5, "keyboardInput");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "output");
                v8 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v8)
                  goto LABEL_9;
                -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "keyboardInput");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "undoWithKeyboardInput:", v51);

                goto LABEL_4;
              }
              v52[0] = MEMORY[0x1E0C809B0];
              v52[1] = 3221225472;
              v52[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_6;
              v52[3] = &unk_1E16B1B50;
              v53 = v5;
              v54 = self;
              v49 = (void (**)(_QWORD))_Block_copy(v52);
              if (pthread_main_np() == 1)
                v49[2](v49);
              else
                dispatch_async(MEMORY[0x1E0C80D38], v49);

              v16 = v53;
            }
          }
LABEL_41:

          goto LABEL_42;
        }
        if (pthread_main_np() != 1)
        {
          v59[0] = MEMORY[0x1E0C809B0];
          v59[1] = 3221225472;
          v59[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3_358;
          v59[3] = &unk_1E16B1B28;
          v59[4] = self;
          dispatch_async(MEMORY[0x1E0C80D38], v59);
          goto LABEL_42;
        }
        -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "acceptAutocorrection");
LABEL_54:

        goto LABEL_42;
      }
      if (v35 == sel_setRemoteDisableBecomeFirstResponder_)
      {
        objc_msgSend(v5, "customInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("disabled"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v29, "BOOLValue");
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("forSuppressionAssertion"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "BOOLValue");
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("updatePlacement"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setDisableBecomeFirstResponder:forSuppressionAssertion:updatePlacement:", v43, v45, objc_msgSend(v46, "BOOLValue"));

      }
      else
      {
        if ((char *)objc_msgSend(v5, "actionSelector") == sel_verifyPlacement)
        {
          +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "verifyPlacement");
          goto LABEL_54;
        }
        if ((char *)objc_msgSend(v5, "actionSelector") != sel_setInputViewsHidden_)
          goto LABEL_42;
        objc_msgSend(v5, "customInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "existingContainerRootController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("hidden"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setInputViewsHidden:", objc_msgSend(v36, "BOOLValue"));

      }
    }

LABEL_53:
    goto LABEL_54;
  }
  objc_msgSend(v5, "customInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke;
    block[3] = &unk_1E16B1B50;
    block[4] = self;
    v76 = v8;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    goto LABEL_9;
  }
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performKeyboardEvent:", v8);
LABEL_4:

LABEL_9:
LABEL_42:

}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "partnerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performKeyboardEvent:", *(_QWORD *)(a1 + 40));

}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  NSString *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "customInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("selector"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("selector"));
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = NSSelectorFromString(v5);

      if (sel_isEqual(v6, sel_handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection_))
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("canSuggest"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_15:

          goto LABEL_16;
        }
        v8 = objc_msgSend(v7, "BOOLValue");
        objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection:", v8);
LABEL_14:

        goto LABEL_15;
      }
      if (sel_isEqual(v6, sel_handleEventCallbackFromRemoteDestination_didChooseSupplementalItem_toReplaceText_))
      {
        objc_msgSend(v12, "objectForKey:", CFSTR("supplementalItem"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", CFSTR("textToReplace"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          supplementalItem(objc_msgSend(v7, "identifier"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "handleEventCallbackFromRemoteDestination_didChooseSupplementalItem:toReplaceText:", v10, v9);

          }
        }

        goto LABEL_14;
      }
    }
LABEL_16:

    v3 = v12;
  }

}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3(uint64_t a1)
{
  char *v2;
  void *v3;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[16];
  uint8_t v24[16];

  if (!objc_msgSend(*(id *)(a1 + 32), "actionSelector"))
    return;
  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector");
  v3 = *(void **)(a1 + 32);
  if (v2 == sel_handleRemoteDictationEvent_switchToDictationInputModeWithOptions_)
  {
    objc_msgSend(v3, "customInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v22 = v12;
    else
      v22 = 0;
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleRemoteDictationEvent_switchToDictationInputModeWithOptions:", v22);

    goto LABEL_40;
  }
  if ((char *)objc_msgSend(v3, "actionSelector") == sel_handleRemoteDictationEvent_switchToDictationLanguage_)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "customInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_switchToDictationLanguage:", v14);
LABEL_39:

    goto LABEL_40;
  }
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleRemoteDictationEvent_startDictation)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_startDictation");
LABEL_40:

    return;
  }
  v4 = (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector");
  v5 = *(void **)(a1 + 32);
  if (v4 == sel_handleRemoteDictationEvent_stopDictation_)
  {
    objc_msgSend(v5, "customInfo");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v15 = objc_msgSend(v22, "BOOLValue");
    else
      v15 = 1;
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleRemoteDictationEvent_stopDictation:", v15);
    goto LABEL_39;
  }
  if ((char *)objc_msgSend(v5, "actionSelector") == sel_handleRemoteDictationEvent_cancelDictation)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_cancelDictation");
    goto LABEL_40;
  }
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleRemoteDictationEvent_movePopoverView_)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "customInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_movePopoverView:", v14);
    goto LABEL_39;
  }
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleRemoteDictationEvent_setEditMenuFrame_)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "customInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_setEditMenuFrame:", v14);
    goto LABEL_39;
  }
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleRemoteDictationEvent_handleTip_)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "customInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_handleTip:", v14);
    goto LABEL_39;
  }
  v6 = (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector");
  v7 = *(void **)(a1 + 32);
  if (v6 == sel_handleRemoteDictationEvent_updateIdleDetection_)
  {
    objc_msgSend(v7, "customInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_updateIdleDetection:", v17);
    goto LABEL_40;
  }
  v8 = (char *)objc_msgSend(v7, "actionSelector");
  v9 = *(void **)(a1 + 32);
  if (v8 == sel_setKeyboardMinimizedByDictation_)
  {
    objc_msgSend(v9, "customInfo");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setKeyboardMinimizedByDictation:", objc_msgSend(v22, "BOOLValue"));
    goto LABEL_39;
  }
  if ((char *)objc_msgSend(v9, "actionSelector") == sel_handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases");
    goto LABEL_40;
  }
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleRemoteDictationEvent_resumeDictation)
  {
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleRemoteDictationEvent_resumeDictation");
    goto LABEL_40;
  }
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleDictationShouldPause_withNewDelagate_)
  {
    objc_msgSend(*(id *)(a1 + 32), "customInfo");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("shouldPause"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("withNewDelagate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleDictationShouldPause:withNewDelagate:", v19, objc_msgSend(v20, "BOOLValue"));

    goto LABEL_39;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_fault_impl(&dword_185066000, v21, OS_LOG_TYPE_FAULT, "Unrecognized selector for dictation event", v24, 2u);
    }

  }
  else
  {
    v10 = UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke___s_category;
    if (!UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke___s_category)
    {
      v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v10, (unint64_t *)&UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke___s_category);
    }
    v11 = *(NSObject **)(v10 + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "Unrecognized selector for dictation event", buf, 2u);
    }
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_304(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[16];
  uint8_t v14[16];

  if (objc_msgSend(*(id *)(a1 + 32), "actionSelector"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_acceptAutocorrection)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "acceptAutocorrection");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleEmojiPopoverKeyCommand)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleEmojiPopoverKeyCommand");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleAutoFillContactPopoverCommand)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleAutoFillContactPopoverCommand");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleAutoFillCreditCardPopoverCommand)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleAutoFillCreditCardPopoverCommand");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleAutoFillPasswordPopoverCommand)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleAutoFillPasswordPopoverCommand");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleAutoFillContactDetected)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleAutoFillContactDetected");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleAutoFillCreditCardDetected)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleAutoFillCreditCardDetected");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleAutoFillPasswordDetected)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleAutoFillPasswordDetected");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_performStopAutoDeleteAtDocumentStart)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "performStopAutoDeleteAtDocumentStart");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_ejectKeyDown)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ejectKeyDown");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_textSelectionWillScroll)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textWillScroll");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_textSelectionDidScroll)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textDidScroll");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_removeInlineTextCompletionPrompt)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeInlineTextCompletionPrompt");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_beginAcceptingInlineCompletionByDirectTap)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "beginAcceptingInlineCompletionByDirectTap");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_endAcceptingInlineCompletionByDirectTap)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endAcceptingInlineCompletionByDirectTap");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_presentTextChoicePromptForRange_)
    {
      objc_msgSend(*(id *)(a1 + 32), "customInfo");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "presentTextChoicePromptForRange:", v12);

        }
      }
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && (char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_dismissTextChoicePrompt)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dismissTextChoicePrompt");
      goto LABEL_71;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && sel_isEqual((SEL)objc_msgSend(*(id *)(a1 + 32), "actionSelector"), sel_clearShiftState))
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clearShiftState");
LABEL_71:

      return;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "actionSelector")
      && sel_isEqual((SEL)objc_msgSend(*(id *)(a1 + 32), "actionSelector"), sel_setKeyboardInputMode_userInitiated_))
    {
      objc_msgSend(*(id *)(a1 + 32), "customInfo");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "customInfo");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputMode"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("isUserInitiated"));
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v5;
        if (v4)
        {
          if (v5)
          {
            objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setKeyboardInputMode:userInitiated:", v4, objc_msgSend(v6, "BOOLValue"));

          }
        }

        goto LABEL_71;
      }
    }
    else if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "Unrecognized selector for user interaction event", v14, 2u);
      }

    }
    else
    {
      v8 = UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_2___s_category;
      if (!UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_2___s_category)
      {
        v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v8, (unint64_t *)&UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_2___s_category);
      }
      v9 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unrecognized selector for user interaction event", buf, 2u);
      }
    }
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_348(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "actionSelector"))
  {
    objc_msgSend(*(id *)(a1 + 32), "customInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v2;
    else
      v4 = 0;
    if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleRemoteKeyboardCameraEvent_startCameraInput_)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleRemoteKeyboardCameraEvent_startCameraInput:", v4);

    }
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_2_349(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "actionSelector");
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(v3, "customInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("suppressAssistantBar"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("suppressSoftwareKeyboard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
LABEL_8:

      return;
    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setShouldSuppressAssistantBar:", objc_msgSend(v4, "BOOLValue"));

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setShouldSuppressSoftwareKeyboard:", objc_msgSend(v5, "BOOLValue"));

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:", 0);
LABEL_7:

    goto LABEL_8;
  }
  if ((char *)objc_msgSend(v3, "actionSelector") == sel_setInputMode_)
  {
    objc_msgSend(*(id *)(a1 + 32), "customInfo");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("inputMode"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("userInitiated"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInputMode:userInitiated:", v5, objc_msgSend(v8, "BOOLValue"));
    goto LABEL_7;
  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_3_358(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "partnerDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "acceptAutocorrection");

}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_4(uint64_t a1)
{
  void *v1;
  NSString *v2;
  const char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "customInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("selector"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("selector"));
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    v3 = NSSelectorFromString(v2);

  }
  else
  {
    v3 = 0;
  }

  if (sel_isEqual(v3, sel__addInputString_withFlags_withInputManagerHint_withInputSource_))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("inputManagerHint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {

      v4 = 0;
    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("flags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("string"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("source"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_addInputString:withFlags:withInputManagerHint:withInputSource:", v7, v6, v4, v9);

    goto LABEL_10;
  }
  if (sel_isEqual(v3, sel__deleteFromInputWithFlags_))
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("flags"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deleteFromInputWithFlags:", v12);
LABEL_10:

  }
}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_5(uint64_t a1)
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "customInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_acceptingCandidateWithTrigger_)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("candidateAcceptedTrigger"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptingCandidateWithTrigger:", v4);
  }
  else
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "actionSelector") == (_QWORD)sel_changingContextWithTrigger_;
    v3 = v6;
    if (!v2)
      goto LABEL_7;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contextChangeTrigger"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changingContextWithTrigger:", v4);
  }

  v3 = v6;
LABEL_7:

}

void __53__UIKBRTIPartner_inputSession_performInputOperation___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "customInfo");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((char *)objc_msgSend(*(id *)(a1 + 32), "actionSelector") == sel_handleGrammarCorrectionEntries_)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "partnerDelegate");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleGrammarCorrectionEntries:", v3);

    }
  }

}

- (void)inputSession:(id)a3 performInputOperation:(id)a4 withResponse:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  _QWORD aBlock[4];
  id v13;
  UIKBRTIPartner *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke;
  aBlock[3] = &unk_1E16BAD68;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
    v11[2](v11);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke(id *a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  NSObject *v16;
  void (**v17)(id, _QWORD);
  void *v18;
  char v19;
  void *v20;
  NSString *v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(id, uint64_t);
  uint64_t v28;
  NSObject *v29;
  id v30;
  uint8_t buf[8];
  _QWORD v32[4];
  id v33;

  objc_msgSend(a1[4], "customInfoType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("UIPhysicalKeyboardEvent"));

  v4 = a1[4];
  if (v3)
  {
    objc_msgSend(v4, "customInfo");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "partnerDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "performKeyboardEvent:", v30);

    if (a1[6])
    {
      if (v6)
      {
        if (objc_msgSend(v30, "keyCommandHandlingBeforePublic"))
        {
          objc_msgSend(a1[5], "partnerDelegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "inputModeSwitcherVisible");

        }
      }
      (*((void (**)(void))a1[6] + 2))();
    }

    return;
  }
  if (objc_msgSend(v4, "actionSelector")
    && (char *)objc_msgSend(a1[4], "actionSelector") == sel_acceptAutocorrectionWithCompletionHandler_requestedByRemoteInputDestination_)
  {
    objc_msgSend(a1[5], "partnerDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke_2;
    v32[3] = &unk_1E16B1BA0;
    v33 = a1[6];
    objc_msgSend(v18, "acceptAutocorrectionWithCompletionHandler:requestedByRemoteInputDestination:", v32, 1);

    return;
  }
  objc_msgSend(a1[4], "customInfoType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("UIWebKitOperations"));

  if (v9)
  {
    objc_msgSend(a1[4], "customInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(a1[4], "customInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "_handleKeyCommand:", v12);
    }
    else
    {
      objc_opt_class();
      v19 = objc_opt_isKindOfClass();

      if ((v19 & 1) == 0)
      {
        v14 = 0;
        goto LABEL_33;
      }
      objc_msgSend(a1[4], "customInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("selector"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("selector"));
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        v22 = NSSelectorFromString(v21);

      }
      else
      {
        v22 = 0;
      }

      if (sel_isEqual(v22, sel__handleKeyInputMethodCommandForEvent_canHandleAppKeyCommand_))
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("keyEvent"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("canHandleAppKeyCommand"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "_handleKeyInputMethodCommandForEvent:canHandleAppKeyCommand:", v23, objc_msgSend(v24, "BOOLValue"));
      }
      else
      {
        if (!sel_isEqual(v22, sel__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_))
        {
          v14 = 0;
          goto LABEL_32;
        }
        objc_msgSend(a1[5], "partnerDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("keyEvent"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("webEventType"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputString"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("inputStringIgnoringModifiers"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_handleWebKeyEvent:withEventType:withInputString:withInputStringIgnoringModifiers:", v23, v24, v25, v26);

        v14 = 1;
      }

    }
LABEL_32:

LABEL_33:
    v27 = (void (**)(id, uint64_t))a1[6];
    if (v27)
    {
      if (v14)
        v28 = 1;
      else
        v28 = 2;
      v27[2](v27, v28);
    }
    return;
  }
  if (os_variant_has_internal_diagnostics())
  {
    __UIFaultDebugAssertLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v29, OS_LOG_TYPE_FAULT, "Unrecognized event sent to ui host", buf, 2u);
    }

  }
  else
  {
    v15 = UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_3___s_category;
    if (!UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_3___s_category)
    {
      v15 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v15, (unint64_t *)&UIKBRTICustomInfoTypeGrammarCorrectionOperations_block_invoke_3___s_category);
    }
    v16 = *(NSObject **)(v15 + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Unrecognized event sent to ui host", buf, 2u);
    }
  }
  v17 = (void (**)(id, _QWORD))a1[6];
  if (v17)
    v17[2](v17, 0);
}

uint64_t __66__UIKBRTIPartner_inputSession_performInputOperation_withResponse___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (a2)
      v3 = 4;
    else
      v3 = 8;
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

- (void)inputSession:(id)a3 textSuggestionsChanged:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  if (pthread_main_np() == 1)
  {
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UITextSuggestion decodeTextSuggestions:](UITextSuggestion, "decodeTextSuggestions:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSuggestions:", v7);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__UIKBRTIPartner_inputSession_textSuggestionsChanged___block_invoke;
    v8[3] = &unk_1E16B1B50;
    v8[4] = self;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __54__UIKBRTIPartner_inputSession_textSuggestionsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "partnerDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[UITextSuggestion decodeTextSuggestions:](UITextSuggestion, "decodeTextSuggestions:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestions:", v2);

}

- (void)inputSession:(id)a3 didAddRTISupplementalLexicon:(id)a4
{
  id v5;
  uint64_t v6;
  void (**v7)(void *, id);
  _QWORD block[4];
  id v9;
  void (**v10)(void *, id);
  _QWORD aBlock[5];

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke;
  aBlock[3] = &unk_1E16D7C20;
  aBlock[4] = self;
  v7 = (void (**)(void *, id))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
  {
    v7[2](v7, v5);
  }
  else
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke_2;
    block[3] = &unk_1E16B2F48;
    v10 = v7;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _UISupplementalLexicon *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _UISupplementalLexicon *v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "identifier");
  v10 = -[_UISupplementalLexicon initWithRTISupplementalLexicon:]([_UISupplementalLexicon alloc], "initWithRTISupplementalLexicon:", v3);

  v5 = v10;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "supplementalLexicons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 32), "setSupplementalLexicons:", v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "supplementalLexicons");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v9);

    v5 = v10;
  }

}

uint64_t __60__UIKBRTIPartner_inputSession_didAddRTISupplementalLexicon___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)inputSession:(id)a3 didRemoveRTISupplementalLexicon:(id)a4
{
  id v5;
  uint64_t v6;
  void (**v7)(void *, id);
  _QWORD block[4];
  id v9;
  void (**v10)(void *, id);
  _QWORD aBlock[5];

  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke;
  aBlock[3] = &unk_1E16D7C20;
  aBlock[4] = self;
  v7 = (void (**)(void *, id))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
  {
    v7[2](v7, v5);
  }
  else
  {
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke_2;
    block[3] = &unk_1E16B2F48;
    v10 = v7;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_msgSend(a2, "identifier");
  objc_msgSend(*(id *)(a1 + 32), "supplementalLexicons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "supplementalLexicons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

uint64_t __63__UIKBRTIPartner_inputSession_didRemoveRTISupplementalLexicon___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)compareWaitingRTIOutputOperationResponseContext:(id)a3 andExchange:(id)a4
{
  id v7;
  UIKBRTIPartner *v8;
  UIKeyboardTaskExecutionContext *v9;
  UIKeyboardTaskExecutionContext *waitingRTIOutputOperationResponseContext;

  v7 = a4;
  v8 = self;
  v9 = (UIKeyboardTaskExecutionContext *)a3;
  objc_sync_enter(v8);
  waitingRTIOutputOperationResponseContext = v8->_waitingRTIOutputOperationResponseContext;

  if (waitingRTIOutputOperationResponseContext == v9)
    objc_storeStrong((id *)&v8->_waitingRTIOutputOperationResponseContext, a4);
  objc_sync_exit(v8);

  return waitingRTIOutputOperationResponseContext == v9;
}

uint64_t __50__UIKBRTIPartner_finishCompletionHandlersIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

- (void)performTextOperations:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "customInfoType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("UIEmojiSearchOperations")) & 1) == 0)
  {

LABEL_5:
    -[UIKBRTIPartner performTextOperations:resultHandler:](self, "performTextOperations:resultHandler:", v9, &__block_literal_global_395);
    v8 = v9;
    goto LABEL_6;
  }
  +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "activationState");

  v8 = v9;
  if (!v7)
    goto LABEL_5;
LABEL_6:

}

- (void)performTextOperations:(id)a3 resultHandler:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  void (**v17)(id, uint64_t);
  _QWORD v18[5];
  id v19;
  void (**v20)(id, uint64_t);
  _QWORD v21[4];
  id v22;
  id v23;
  UIKBRTIPartner *v24;
  void (**v25)(id, uint64_t);
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (!+[UIKeyboard usingEndInputSessionCompletion](UIKeyboard, "usingEndInputSessionCompletion"))
  {
    -[UIKBRTIPartner exchangeWaitingRTIOutputOperationResponseContext:](self, "exchangeWaitingRTIOutputOperationResponseContext:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "keyboardOutput");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner setPendingOutputOperation:](self, "setPendingOutputOperation:", v10);

      v7[2](v7, 255);
      objc_msgSend(v9, "transferExecutionToMainThreadWithTask:", &__block_literal_global_398_0);
    }
    else
    {
      if (pthread_main_np() != 1)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_2;
        v15[3] = &unk_1E16BAD68;
        v15[4] = self;
        v16 = v6;
        v17 = v7;
        dispatch_async(MEMORY[0x1E0C80D38], v15);

        v12 = v16;
LABEL_16:

        goto LABEL_17;
      }
      -[UIKBRTIPartner _queued_performTextOperations:resultHandler:](self, "_queued_performTextOperations:resultHandler:", v6, v7);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (pthread_main_np() != 1)
  {
    -[UIKBRTIPartner keyboardTaskSubqueue](self, "keyboardTaskSubqueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      _UIKeyboardInputSessionChangeLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v27 = v6;
        v28 = 2112;
        v29 = v9;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "Dispatching -_queued_performTextOperations:%p as main-thread task on keyboard task subqueue: %@", buf, 0x16u);
      }

      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke;
      v21[3] = &unk_1E16B4420;
      v22 = v6;
      v23 = v9;
      v24 = self;
      v25 = v7;
      objc_msgSend(v23, "dispatchAsync:", v21);

      v12 = v22;
    }
    else
    {
      -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "taskQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_396;
      v18[3] = &unk_1E16D6C60;
      v18[4] = self;
      v19 = v6;
      v20 = v7;
      objc_msgSend(v14, "addTask:", v18);

      v12 = v19;
    }
    goto LABEL_16;
  }
  _UIKeyboardLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Unexpected call to UIKBRTIPartner's -performTextOperations:resultHandler: on main thread.", buf, 2u);
  }

  -[UIKBRTIPartner _queued_performTextOperations:resultHandler:](self, "_queued_performTextOperations:resultHandler:", v6, v7);
LABEL_18:

}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _UIKeyboardInputSessionChangeLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "Now performing -_queued_performTextOperations:%p as main-thread task on keyboard task subqueue: %@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_queued_performTextOperations:resultHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
}

void __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_396(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v2, "_queued_performTextOperations:resultHandler:", v3, v4);
  objc_msgSend(v5, "returnExecutionToParent");

}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_397(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "returnExecutionToParent");
}

uint64_t __54__UIKBRTIPartner_performTextOperations_resultHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queued_performTextOperations:resultHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queued_performTextOperations:(id)a3 resultHandler:(id)a4
{
  id v6;
  void (**v7)(id, unint64_t);
  void *v8;
  RTIInputSourceState *rtiInputSourceState;
  void *v10;
  int v11;
  RTIInputSourceState *v12;
  RTIInputSourceState *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  UIKBRTIPartner *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void (**v35)(id, unint64_t);
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  unint64_t v47;
  void *v48;
  char v49;
  uint64_t v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  RTIInputSourceState *v56;
  void *v57;
  void (**v58)(id, unint64_t);
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  NSString *v66;
  const char *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void (**v72)(id, unint64_t);
  void *v73;
  NSObject *v74;
  unint64_t v75;
  void *v76;
  void *v77;
  unint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void (**v84)(id, unint64_t);
  void *v85;
  NSObject *v86;
  unint64_t v87;
  void *v88;
  void *v89;
  unint64_t v90;
  void *v91;
  RTIInputSourceState *v92;
  void *v93;
  id v94;
  void *v95;
  const char *v96;
  id v97;
  NSString *v98;
  NSObject *v99;
  NSObject *v100;
  void *v101;
  id v102;
  void *v103;
  NSString *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  char v114;
  void *v115;
  void *v116;
  UIKBRTIPartner *v117;
  void *v118;
  id v119;
  const char *v120;
  id v121;
  void *v122;
  id v123;
  void (**v124)(id, unint64_t);
  void *v125;
  NSObject *v126;
  unint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  NSString *v135;
  const char *v136;
  void *v137;
  void *v138;
  void (**v139)(id, unint64_t);
  void *v140;
  NSObject *v141;
  unint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t i;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  void *v165;
  _BOOL4 isEqual;
  void *v167;
  NSObject *v168;
  void *v169;
  uint64_t v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  double v182;
  double v183;
  void *v184;
  float v185;
  double v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  const __CFString *v202;
  id v203;
  void *v204;
  id v205;
  id v206;
  void *v207;
  id v208;
  void *v209;
  void *v210;
  uint64_t v211;
  void *v212;
  id obj;
  id obja;
  id objb;
  void (**v216)(id, unint64_t);
  void (**v217)(id, unint64_t);
  unsigned int v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  id v224;
  int v225;
  int v226;
  void *v227;
  char v228;
  UIKBRTIPartner *v229;
  void *v230;
  void *v231;
  unsigned int v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  _QWORD v237[5];
  _QWORD v238[5];
  uint8_t v239[128];
  uint8_t buf[4];
  RTIInputSourceState *v241;
  __int16 v242;
  NSObject *v243;
  uint64_t v244;

  v244 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, unint64_t))a4;
  objc_msgSend(v6, "inputSourceState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    rtiInputSourceState = self->_rtiInputSourceState;
    if (rtiInputSourceState)
    {
      objc_msgSend(v6, "inputSourceState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[RTIInputSourceState isEqual:](rtiInputSourceState, "isEqual:", v10) ^ 1;

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v6, "inputSourceState");
    v12 = (RTIInputSourceState *)objc_claimAutoreleasedReturnValue();
    v13 = self->_rtiInputSourceState;
    self->_rtiInputSourceState = v12;

    _UIKeyboardLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v92 = self->_rtiInputSourceState;
      *(_DWORD *)buf = 138412290;
      v241 = v92;
      _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "Received input source state: %@", buf, 0xCu);
    }

  }
  else
  {
    v11 = 0;
  }
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetSessionUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v15)
      goto LABEL_24;
  }
  else
  {
    v18 = 1;
    if (!v15)
    {
LABEL_24:
      _UIKeyboardLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        -[UIKBRTIPartner currentSessionIdentifier](self, "currentSessionIdentifier");
        v46 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v241 = (RTIInputSourceState *)v16;
        v242 = 2112;
        v243 = v46;
        _os_log_impl(&dword_185066000, v45, OS_LOG_TYPE_DEFAULT, "Skipping performing textoperation targetsessionid: %@, currentSessionID: %@", buf, 0x16u);

      }
      v47 = 0;
      goto LABEL_97;
    }
  }
  if (!v18)
    goto LABEL_24;
  -[UIKBRTIPartner sendAutoFillDidInsertCallbacksWithTextOperations:](self, "sendAutoFillDidInsertCallbacksWithTextOperations:", v6);
  if (os_variant_has_internal_diagnostics())
  {
    _UIKeyboardExtendedLog();
    v168 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v168, OS_LOG_TYPE_DEFAULT, "performing keyboard output", buf, 2u);
    }

  }
  v226 = v11;
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPerformingRemoteTextOperations:", 1);

  self->_isNotifyingDelegateOfRemoteOutputOperation = 1;
  -[UIKBRTIPartner rtiDocumentState](self, "rtiDocumentState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = objc_msgSend(v20, "canSuggestSupplementalItemsForCurrentSelection");

  v21 = objc_msgSend(v6, "editingActionSelector") == 0;
  -[UIKBRTIPartner rtiDocumentState](self, "rtiDocumentState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "selectionRangeToAssert");
  v229 = self;
  v25 = objc_msgSend(v22, "deltaForSelectionRange:", v23, v24);
  v27 = v26;

  -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textToAssert");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v25;
  v31 = v229;
  LODWORD(v21) = objc_msgSend(v28, "assertTextForRemoteDocument:withSelectionDelta:updatingSelection:", v29, v30, v27, v21);

  if ((_DWORD)v21)
    v32 = 2;
  else
    v32 = 0;
  v228 = -[UIKBRTIPartner _performKeyboardOutputOperations:](v229, "_performKeyboardOutputOperations:", v6);
  if ((v228 & 1) != 0 && +[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "triggerPendingKeyup");

  }
  objc_msgSend(v6, "styledIntermediateText");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v219 = v16;
    v35 = v7;
    objc_msgSend(v6, "styledIntermediateText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "customInfoType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("UIKBRTICustomInfoInlineCompletionAsMarkedText"));

    objc_msgSend(v36, "displayString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v36, "selectedRange");
    v42 = v41;
    objc_msgSend(v36, "inputString");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "searchString");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38)
      objc_msgSend(v15, "setInlineCompletionAsMarkedText:selectedRange:inputString:searchString:", v39, v40, v42, v43, v44);
    else
      objc_msgSend(v15, "setAttributedMarkedText:selectedRange:inputString:searchString:", v39, v40, v42, v43, v44);

    v50 = objc_msgSend(v36, "cursorVisibility");
    v7 = v35;
    if (v50)
      objc_msgSend(v15, "setCaretVisible:", v50 == 1);
    v47 = 2;
    v16 = v219;
    v31 = v229;
    goto LABEL_33;
  }
  v47 = v32 | (2 * (v228 & 1u));
  objc_msgSend(v6, "intermediateText");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v6, "intermediateText");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v15, "assertIntermediateText:", v36);
    v47 |= 2 * (v49 & 1u);
    v228 |= v49;
LABEL_33:

  }
  if (objc_msgSend(v6, "editingActionSelector"))
  {
    objc_msgSend(v6, "customInfoType");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeKeyboardOperations"));

    if ((v52 & 1) == 0)
    {
      objc_msgSend(v15, "performTextOperationActionSelector:", objc_msgSend(v6, "editingActionSelector"));
      v47 |= 1uLL;
    }
  }
  objc_msgSend(v6, "enumerateImagesAndUserInfosUsingBlock:", &__block_literal_global_400_1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v238[0] = MEMORY[0x1E0C809B0];
    v238[1] = 3221225472;
    v238[2] = __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_2;
    v238[3] = &unk_1E16D7CA8;
    v238[4] = v31;
    objc_msgSend(v6, "enumerateAdaptiveImageGlyphsUsingBlock:", v238);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v237[0] = MEMORY[0x1E0C809B0];
    v237[1] = 3221225472;
    v237[2] = __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_3;
    v237[3] = &unk_1E16D7CD0;
    v237[4] = v31;
    objc_msgSend(v6, "enumerateTextAttachmentsUsingBlock:", v237);
  }
  objc_msgSend(v6, "inputSourceState");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "inputMode");
  v45 = objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "currentInputMode");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "identifier");
    v56 = (RTIInputSourceState *)objc_claimAutoreleasedReturnValue();

    if ((-[RTIInputSourceState isEqualToString:](v56, "isEqualToString:", v45) & 1) == 0)
    {
      v57 = v15;
      v58 = v7;
      +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v45);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      _UIKeyboardLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v241 = v56;
        v242 = 2112;
        v243 = v45;
        _os_log_debug_impl(&dword_185066000, v60, OS_LOG_TYPE_DEBUG, "Detected an input mode change: %@->%@", buf, 0x16u);
      }

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setKeyboardInputMode:userInitiated:", v59, 0);

      v7 = v58;
      v15 = v57;
      v31 = v229;
    }

  }
  objc_msgSend(v6, "customInfoType");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "customInfo");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v227 = v62;
  if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIDictationRemoteTextOperations")))
  {
    v216 = v7;
    v220 = v63;
    v64 = v63;
    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("selector"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("selector"));
      v66 = (NSString *)objc_claimAutoreleasedReturnValue();
      v67 = NSSelectorFromString(v66);

    }
    else
    {
      v67 = 0;
    }

    if (sel_isEqual(v67, sel_updateLastHypothesis_WithNewHypothesis_))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("lastHypothesis"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("newHypothesis"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "updateLastHypothesis:WithNewHypothesis:", v80, v81);

LABEL_57:
LABEL_58:
      v7 = v216;
LABEL_84:

LABEL_85:
      v31 = v229;
      v63 = v220;
      goto LABEL_86;
    }
    v7 = v216;
    if (sel_isEqual(v67, sel_resetLastHypothesis))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "resetLastHypothesis");
      goto LABEL_84;
    }
    if (sel_isEqual(v67, sel_setCandidateDictationSerializableResults_))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("candidateDictationSerializableResults"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setCandidateDictationSerializableResults:", v91);
      goto LABEL_83;
    }
    if (sel_isEqual(v67, sel_postNotificationName_object_userInfo_))
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("notificationName"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("userInfo"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "postNotificationName:userInfo:", v91, v101);
    }
    else
    {
      if (!sel_isEqual(v67, sel_insertSerializedDictationResult_withCorrectionIdentifier_))
      {
        if (sel_isEqual(v67, sel_startLandingIfNecessary))
        {
          +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "startLandingIfNecessary");
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_stopLanding))
        {
          +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stopLanding");
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_stopLandingForError))
        {
          +[UIDictationLandingView sharedInstance](UIDictationLandingView, "sharedInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "stopLandingForError");
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_resignFirstResponderWhenIdleIfNeeded))
        {
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "resignFirstResponderWhenIdleIfNeeded");
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_setRemoteDictationPopover_))
        {
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setRemoteDictationPopover:", v64);
          goto LABEL_84;
        }
        if (sel_isEqual(v67, sel_setKeyboardMinimizedByDictation_))
        {
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("minimized"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setKeyboardMinimizedByDictation:", objc_msgSend(v91, "BOOLValue"));
          goto LABEL_83;
        }
        if (sel_isEqual(v67, sel_setShadowState_))
        {
          +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("state"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setShadowState:", objc_msgSend(v91, "integerValue"));
          goto LABEL_83;
        }
        if (sel_isEqual(v67, sel_presentDictationMenuTip_))
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "presentDictationMenuTip:", v64);
          goto LABEL_58;
        }
        if (sel_isEqual(v67, sel_dismissDictationMenu))
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "dismissDictationMenu");
          goto LABEL_58;
        }
        if (sel_isEqual(v67, sel_setUsingTypeAndTalk_))
        {
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("usingTypeAndTalk"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = objc_msgSend(v79, "BOOLValue");
          +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "setUsingTypeAndTalk:", v170);
        }
        else
        {
          if (!sel_isEqual(v67, sel_setIsCurrentDictationLanguageOnDevice_))
          {
            if (sel_isEqual(v67, sel_updateCaretRectInWindowIfNeeded))
            {
              +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
              v178 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v178, "inputDelegate");
              v79 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v79, "textInputView");
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "selectedTextRange");
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v180, "start");
              v181 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "caretRectForPosition:", v181);
              objc_msgSend(v179, "convertRect:toView:", 0);
              v183 = v182;

              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("caretRectInWindow.y"));
              v184 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v184, "floatValue");
              v186 = v185;

              if (vabdd_f64(v186, v183) > 2.0)
                -[UIKBRTIPartner documentStateChanged](v229, "documentStateChanged");
              goto LABEL_58;
            }
            if (sel_isEqual(v67, sel_setCurrentInstrumentationContext_))
            {
              +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("instrumentationContext"));
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "setCurrentInstrumentationContext:", v80);
              goto LABEL_57;
            }
            if (sel_isEqual(v67, sel_setLocalSpeechRecognitionForced_))
            {
              +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("forceOfflineRecognition"));
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "setLocalSpeechRecognitionForced:", v80 != 0);
              goto LABEL_57;
            }
            if (sel_isEqual(v67, sel_setInteractionIdentifier_))
            {
              +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("interactionIdentifier"));
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "setInteractionIdentifier:", v80);
              goto LABEL_57;
            }
            if (sel_isEqual(v67, sel_didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID_gazeRangeAtCommandRecognitionTime_))
            {
              +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("identifier"));
              objb = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("strings"));
              v212 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("parameters"));
              v196 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("voiceCommandUUID"));
              v197 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("gazeRangeAtCommandRecognitionTime"));
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:gazeRangeAtCommandRecognitionTime:", objb, v212, v196, v197, v198);

              goto LABEL_58;
            }
            if (sel_isEqual(v67, sel_setIdleTimerDisabled_forReason_))
            {
              +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("disabled"));
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v199 = objc_msgSend(v80, "BOOLValue");
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("reason"));
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "setIdleTimerDisabled:forReason:", v199, v200);

              goto LABEL_57;
            }
            v7 = v216;
            if (!sel_isEqual(v67, sel_showLowStorageUserAlertWithLanguage_))
              goto LABEL_85;
            +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("language"));
            v201 = objc_claimAutoreleasedReturnValue();
            v91 = (void *)v201;
            if (v201)
              v202 = (const __CFString *)v201;
            else
              v202 = &stru_1E16EDF20;
            objc_msgSend(v79, "showLowStorageUserAlertWithLanguage:", v202);
LABEL_83:

            goto LABEL_84;
          }
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("isCurrentDictationLanguageOnDevice"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = objc_msgSend(v79, "BOOLValue");
          +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "setIsCurrentDictationLanguageOnDevice:", v173);
        }

        goto LABEL_58;
      }
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("dictationResult"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("correctionIdentifier"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "insertSerializedDictationResult:withCorrectionIdentifier:", v91, v101);
    }

    goto LABEL_83;
  }
  if (!objc_msgSend(v62, "isEqualToString:", CFSTR("_UIKeyboardIndirectTextSelectionGestureState")))
  {
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UITextSuggestion")))
    {
      v70 = v63;
      -[UIKBRTIPartner inputDelegate](v31, "inputDelegate");
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
      v71 = v16;
      v72 = v7;
      v73 = v15;
      v74 = v45;
      v75 = v47;
      v76 = v63;
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "insertCustomTextSuggestion:", v70);

      v63 = v76;
      v78 = v75;
      v45 = v74;
      v15 = v73;
      v7 = v72;
      v16 = v71;
      v47 = v78 | 2;

      goto LABEL_86;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIStickerRemoteInputOperations")))
    {
      _UIStickerCreateStickerFromTextInputPayload(v63);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner inputDelegate](v31, "inputDelegate");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
      v83 = v16;
      v84 = v7;
      v85 = v15;
      v86 = v45;
      v87 = v47;
      v88 = v63;
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "insertSticker:", v82);

      v63 = v88;
      v90 = v87;
      v45 = v86;
      v15 = v85;
      v7 = v84;
      v16 = v83;
      v47 = v90 | 2;

LABEL_63:
      goto LABEL_86;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeAutofill")))
    {
      objc_opt_class();
      v221 = v63;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v93 = v63;
      else
        v93 = 0;
      v94 = v93;
      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("selector"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v96 = 0;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("selector"));
        v97 = v94;
        v98 = (NSString *)objc_claimAutoreleasedReturnValue();
        v96 = NSSelectorFromString(v98);

        v94 = v97;
      }

      if (sel_isEqual(v96, sel_handleEventFromRemoteSource_insertAutofillContent_))
      {
        objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("autofillContent"));
        v99 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
          v100 = objc_claimAutoreleasedReturnValue();
          -[NSObject handleEventFromRemoteSource_insertAutofillContent:](v100, "handleEventFromRemoteSource_insertAutofillContent:", v99);
          goto LABEL_130;
        }
        _UIKeyboardLog();
        v100 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          goto LABEL_130;
        *(_WORD *)buf = 0;
        v120 = "Value for 'autofillContent' is not a dictionary (customInfoType: Autofill)";
      }
      else
      {
        v63 = v221;
        if (!sel_isEqual(v96, sel_handleEventFromRemoteSource_autoFillAuthentication_))
        {
          if (sel_isEqual(v96, sel_handleEventFromRemoteSource_autoFillIsMenuPresented_))
          {
            -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
            v99 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("isMenuPresented"));
            v121 = v94;
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject handleEventFromRemoteSource_autoFillIsMenuPresented:](v99, "handleEventFromRemoteSource_autoFillIsMenuPresented:", objc_msgSend(v122, "BOOLValue"));

            v94 = v121;
          }
          else
          {
            _UIKeyboardLog();
            v99 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_185066000, v99, OS_LOG_TYPE_ERROR, "Unexpected value for 'selector' (customInfoType: Autofill)", buf, 2u);
            }
          }
          goto LABEL_131;
        }
        objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("isAuthenticating"));
        v99 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (-[NSObject BOOLValue](v99, "BOOLValue"))
          {
            v117 = v229;
            v118 = v16;
          }
          else
          {
            v117 = v229;
            v118 = 0;
          }
          -[UIKBRTIPartner setAuthenticatingSessionIdentifier:](v117, "setAuthenticatingSessionIdentifier:", v118);
          goto LABEL_131;
        }
        _UIKeyboardLog();
        v100 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
LABEL_130:

          v63 = v221;
LABEL_131:

LABEL_132:
          v31 = v229;
          goto LABEL_86;
        }
        *(_WORD *)buf = 0;
        v120 = "Value for 'isAuthenticating' is not a NSNumber (customInfoType: Autofill)";
      }
      _os_log_error_impl(&dword_185066000, v100, OS_LOG_TYPE_ERROR, v120, buf, 2u);
      goto LABEL_130;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UISupplementalLexiconOperations")))
    {
      v222 = v63;
      v102 = v63;
      objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("selector"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      if (v103)
      {
        objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("selector"));
        v104 = (NSString *)objc_claimAutoreleasedReturnValue();
        v105 = NSSelectorFromString(v104);

      }
      else
      {
        v105 = 0;
      }

      if (sel_isEqual(v105, sel_handleEventFromRemoteSource_insertSupplementalCandidate_textToCommit_))
      {
        objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("candidate"));
        v119 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("textToCommit"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v31 = v229;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
            v205 = v119;
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v132, "handleEventFromRemoteSource_insertSupplementalCandidate:textToCommit:", v205, v131);

            v119 = v205;
            v47 |= 2uLL;
          }
        }
      }
      else
      {
        v31 = v229;
        if (!sel_isEqual(v105, sel_handleEventFromRemoteSource_insertionPointEnteredText_withSupplementalCandidate_))
        {
          if (sel_isEqual(v105, sel_handleEventFromRemoteSource_insertionPointExitedTextWithSupplementalItems))
          {
            -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
            v119 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "handleEventFromRemoteSource_insertionPointExitedTextWithSupplementalItems");
          }
          else
          {
            if (sel_isEqual(v105, sel_handleEventFromRemoteSource_chooseSupplementalItem_toReplaceText_))
            {
              objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("supplementalItems"));
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("textToReplace"));
              v204 = (void *)objc_claimAutoreleasedReturnValue();
              v147 = objc_alloc(MEMORY[0x1E0C99DE8]);
              v148 = objc_msgSend(v146, "count");
              v149 = v147;
              v119 = v146;
              v210 = (void *)objc_msgSend(v149, "initWithCapacity:", v148);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v203 = v102;
                v235 = 0u;
                v236 = 0u;
                v233 = 0u;
                v234 = 0u;
                v207 = v146;
                obj = v146;
                v150 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v233, v239, 16);
                if (v150)
                {
                  v151 = v150;
                  v152 = *(_QWORD *)v234;
                  do
                  {
                    for (i = 0; i != v151; ++i)
                    {
                      if (*(_QWORD *)v234 != v152)
                        objc_enumerationMutation(obj);
                      v154 = *(void **)(*((_QWORD *)&v233 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        supplementalItem(objc_msgSend(v154, "identifier"));
                        v155 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v155)
                          objc_msgSend(v210, "addObject:", v155);

                      }
                    }
                    v151 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v233, v239, 16);
                  }
                  while (v151);
                }

                v31 = v229;
                v102 = v203;
                v119 = v207;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v63 = v222;
                if (objc_msgSend(v210, "count"))
                {
                  -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
                  v208 = v119;
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v156, "handleEventFromRemoteSource_chooseSupplementalItem:toReplaceText:", v210, v204);

                  v119 = v208;
                  v47 |= 2uLL;
                }
              }
              else
              {
                v63 = v222;
              }

              goto LABEL_127;
            }
            if (!sel_isEqual(v105, sel_handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert))
            {
              v63 = v222;
              goto LABEL_128;
            }
            -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
            v119 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert");
          }
          goto LABEL_126;
        }
        objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("text"));
        v119 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "objectForKeyedSubscript:", CFSTR("candidate"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
            v206 = v119;
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "handleEventFromRemoteSource_insertionPointEnteredText:withSupplementalCandidate:", v206, v131);

            v119 = v206;
          }
        }
      }

LABEL_126:
      v63 = v222;
      goto LABEL_127;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIPhysicalKeyboardEvent")))
    {
      v119 = v63;
      -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
      v102 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "performKeyboardEvent:", v119);
LABEL_127:

      goto LABEL_128;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeDeleteAction")))
    {
      v123 = v63;
      -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
      v102 = (id)objc_claimAutoreleasedReturnValue();
      v223 = v16;
      v124 = v7;
      v125 = v15;
      v126 = v45;
      v127 = v47;
      v128 = v63;
      v129 = objc_msgSend(v123, "integerValue");

      v130 = v129;
      v63 = v128;
      v47 = v127;
      v45 = v126;
      v15 = v125;
      v7 = v124;
      v16 = v223;
      objc_msgSend(v102, "handleAutoDeleteContinuationOnDestinationWithDeletionCount:", v130);
LABEL_128:

      goto LABEL_86;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIWebKitOperations")))
    {
      v217 = v7;
      v220 = v63;
      v64 = v63;
      objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("selector"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      if (v134)
      {
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("selector"));
        v135 = (NSString *)objc_claimAutoreleasedReturnValue();
        v136 = NSSelectorFromString(v135);

      }
      else
      {
        v136 = 0;
      }

      if (sel_isEqual(v136, sel__handleWebKeyEvent_withIndex_inInputString_))
      {
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("event"));
        v158 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("index"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = objc_msgSend(v159, "unsignedIntegerValue");

        v161 = (void *)v158;
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("inputString"));
        v162 = objc_claimAutoreleasedReturnValue();
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = v160;
        v165 = (void *)v162;
        objc_msgSend(v163, "_handleWebKeyEvent:withIndex:inInputString:", v161, v164, v162);
        v7 = v217;
      }
      else
      {
        isEqual = sel_isEqual(v136, sel__handleWebKeyEvent_withEventType_withInputString_withInputStringIgnoringModifiers_);
        v7 = v217;
        if (!isEqual)
          goto LABEL_85;
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("keyEvent"));
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("webEventType"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v211 = objc_msgSend(v167, "unsignedIntegerValue");

        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("inputString"));
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("inputStringIgnoringModifiers"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = obja;
        objc_msgSend(v209, "_handleWebKeyEvent:withEventType:withInputString:withInputStringIgnoringModifiers:", obja, v211, v165, v163);

      }
      goto LABEL_85;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIEmojiSearchOperations")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v232 = objc_msgSend(v63, "BOOLValue");
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "inputDelegateManager");
        v138 = v16;
        v139 = v7;
        v140 = v15;
        v141 = v45;
        v142 = v47;
        v143 = v63;
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "setShouldRespectForwardingInputDelegate:", v232);

        v63 = v143;
        v47 = v142;
        v45 = v141;
        v15 = v140;
        v7 = v139;
        v16 = v138;

      }
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "remoteInputViewHost");
      v102 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v102, "updateInputViewsIfNecessary");
      goto LABEL_128;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeUpdateInputMode")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_86;
      +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v63);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "setKeyboardInputMode:userInitiated:", v82, 1);

      goto LABEL_63;
    }
    if (objc_msgSend(v62, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeTypologyLogOperations")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_86;
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "presentKeyboardFeedbackAssistantViewControllerForLogURL:", v63);
      goto LABEL_63;
    }
    if (!objc_msgSend(v62, "isEqualToString:", CFSTR("UIKBRTICustomInfoTypeKeyboardOperations")))
      goto LABEL_86;
    v224 = v6;
    if (sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_setFloating_))
    {
      +[UIKeyboardImpl setFloating:](UIKeyboardImpl, "setFloating:", objc_msgSend(v63, "BOOLValue"));
      goto LABEL_217;
    }
    if (sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_updateTextInputKeyboardSource_))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "updateTextInputKeyboardSource:", v63);
    }
    else if (sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_becomeFirstResponderAndMakeVisible_))
    {
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "becomeFirstResponderAndMakeVisible:", objc_msgSend(v63, "BOOLValue"));
    }
    else
    {
      if (sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_resignFirstResponder))
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "responder");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "resignFirstResponder");
      }
      else
      {
        if (sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_postNotificationName_))
        {
          v174 = (void *)MEMORY[0x1E0CB37D0];
          v175 = v63;
          objc_msgSend(v174, "defaultCenter");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("name"));
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("objecrt"));
          v177 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v169, "postNotificationName:object:", v176, v177);
          goto LABEL_216;
        }
        if (sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_setIsExtended_))
        {
          v31 = v229;
          -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v187, "setCandidateDisplayIsExtended:", objc_msgSend(v63, "BOOLValue"));

          goto LABEL_86;
        }
        objc_msgSend(v6, "editingActionSelector");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          +[UIAssistantBarButtonItemProvider performSelector:](UIAssistantBarButtonItemProvider, "performSelector:", objc_msgSend(v6, "editingActionSelector"));
          goto LABEL_132;
        }
        if (sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_setShiftStatesNeededInDestination_autoShifted_shiftLocked_))
        {
          objc_msgSend(v6, "customInfo");
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          v189 = v188;
          if (v188)
          {
            objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("autoShift"));
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            v218 = objc_msgSend(v190, "BOOLValue");

            objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("shiftLocked"));
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            v192 = objc_msgSend(v191, "BOOLValue");

            objc_msgSend(v189, "objectForKeyedSubscript:", CFSTR("shift"));
            v193 = (void *)objc_claimAutoreleasedReturnValue();
            v194 = objc_msgSend(v193, "BOOLValue");

            -[UIKBRTIPartner partnerDelegate](v229, "partnerDelegate");
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v195, "setShiftStatesNeededInDestination:autoShifted:shiftLocked:", v194, v218, v192);

          }
          goto LABEL_217;
        }
        if (!sel_isEqual((SEL)objc_msgSend(v6, "editingActionSelector"), sel_clearKeyboardSnapshot))
        {
LABEL_217:
          v6 = v224;
          goto LABEL_132;
        }
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v169, "existingContainerRootController");
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "clearKeyboardSnapshot");
      }

    }
LABEL_216:

    goto LABEL_217;
  }
  -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setPerformingRemoteTextOperations:", 0);

  v31->_isNotifyingDelegateOfRemoteOutputOperation = 0;
  objc_msgSend(v15, "handleRemoteIndirectGestureWithState:", v63);
  -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setPerformingRemoteTextOperations:", 1);

  v31->_isNotifyingDelegateOfRemoteOutputOperation = 1;
LABEL_86:
  objc_msgSend(v15, "_updateCanSuggestSupplementalItemsForCurrentSelection");
  v106 = objc_msgSend(v15, "canSuggestSupplementalItemsForCurrentSelection");
  if (v225 != (_DWORD)v106)
    -[UIKBRTIPartner forwardEventToRemoteSource_canSuggestSupplementalItemsForCurrentSelection:](v31, "forwardEventToRemoteSource_canSuggestSupplementalItemsForCurrentSelection:", v106);
  objc_msgSend(v15, "provideAutoFillTypingUpdatesIfNecessary");
  v31->_isNotifyingDelegateOfRemoteOutputOperation = 0;
  -[UIKBRTIPartner partnerDelegate](v31, "partnerDelegate");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setPerformingRemoteTextOperations:", 0);

  v108 = v227;
  if ((v47 & 2) != 0 || (v228 & 2) != 0)
    -[UIKBRTIPartner documentStateChanged:](v31, "documentStateChanged:", (v228 & 2) == 0);
  if (((v47 >> 1) | v226) == 1)
  {
    v109 = v6;
    v110 = v16;
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "existingContainerRootController");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "presentedViewController");
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = objc_msgSend(v113, "conformsToProtocol:", &unk_1EDFCBCE0);
    if (v113 && (v114 & 1) == 0)
    {
      +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "existingContainerRootController");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "dismissViewControllerAnimated:completion:", 1, 0);

    }
    v16 = v110;
    v6 = v109;
    v108 = v227;
  }

LABEL_97:
  if (v7)
    v7[2](v7, v47);

}

void __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.png-sticker")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessibilityLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardMediaController sharedKeyboardMediaController](UIKeyboardMediaController, "sharedKeyboardMediaController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stageStickerWithFileHandle:url:accessibilityLabel:", v10, v7, v8);

  }
}

void __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(&sel_revealedSelectionByScrollingWebFrame_[16], "prefersTextAttachment"))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v3, "nominalTextAttachment"), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v8 = 0;
      goto LABEL_9;
    }
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x1E0CB3498];
    v10 = *(_QWORD *)off_1E1678C48;
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributedStringWithAttachment:attributes:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_9;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAdaptiveImageGlyph:attributes:", v3, MEMORY[0x1E0C9AA70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "partnerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertAttributedText:", v8);

  }
LABEL_9:

}

void __62__UIKBRTIPartner__queued_performTextOperations_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "partnerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertEmojiImageTextAttachment:", v3);

  }
  else
  {
    v10 = -4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0CB3498]);
    v11 = *(_QWORD *)off_1E1678C48;
    v12[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "partnerDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "insertAttributedText:", v8);

  }
}

- (unsigned)_performKeyboardOutputOperations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  UIKBRTIPartner *v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "keyboardOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "_isEmpty") & 1) == 0)
  {
    UIKeyboardGetCurrentInputMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customInfoType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("UIDictationRemoteTextOperations"));

    objc_msgSend(v4, "multilingualLanguages");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      UIKeyboardGetCurrentInputMode();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "isEqualToString:", v13);

      if (v14)
      {
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentInputMode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "multilingualLanguages");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "count"))
        {
          objc_msgSend(v4, "multilingualLanguages");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setMultilingualLanguages:", v18);

        }
        else
        {
          objc_msgSend(v16, "setMultilingualLanguages:", 0);
        }

      }
    }
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v10)
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __51__UIKBRTIPartner__performKeyboardOutputOperations___block_invoke;
      v27 = &unk_1E16B1B50;
      v28 = self;
      v29 = v6;
      objc_msgSend(v20, "performOperations:withTextInputSource:", &v24, 2);

      v7 = 1;
    }
    else
    {
      v21 = objc_msgSend(v19, "performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:", v6, 1, 0);

      if (v21)
        v7 = 1;
      else
        v7 = 3;
    }
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate", v24, v25, v26, v27, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "updateDocumentViewsAfterKeyboardOutput:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __51__UIKBRTIPartner__performKeyboardOutputOperations___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "partnerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performKeyboardOutput:checkingDelegate:forwardToRemoteInputSource:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)defaultDocumentRequestDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__UIKBRTIPartner_defaultDocumentRequestDidChange___block_invoke;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __50__UIKBRTIPartner_defaultDocumentRequestDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateGeometryObserverIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "documentStateChanged");
}

- (void)_performDocumentRequest:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    -[UIKBRTIPartner payloadDelegate](self, "payloadDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "performDocumentRequest:completion:", v9, v6);
    }
    else if (v6)
    {
      v6[2](v6, 0);
    }

  }
  else
  {
    -[UIKBRTIPartner performDocumentRequest:completion:](self, "performDocumentRequest:completion:", v9, v6);
  }

}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIKBRTIPartner_performDocumentRequest_completion___block_invoke;
  block[3] = &unk_1E16BAD68;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__UIKBRTIPartner_performDocumentRequest_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryDocumentRequest:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addMergedTextRectsToDocumentState:(id)a3 forWKContext:(id)a4 textInputView:(id)a5 granularity:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  CFIndex v14;
  __CFStringTokenizer *wkRectTokenizer;
  CFOptionFlags v16;
  const __CFAllocator *v17;
  const __CFLocale *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  int64_t v29;
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD v32[4];
  __int128 v33;
  __int128 v34;
  _QWORD aBlock[5];
  CFRange v36;
  CFRange v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "fullText");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = -[__CFString length](v13, "length");
  wkRectTokenizer = self->_wkRectTokenizer;
  if (wkRectTokenizer)
  {
    v36.location = 0;
    v36.length = v14;
    CFStringTokenizerSetString(wkRectTokenizer, v13, v36);
  }
  else
  {
    if ((unint64_t)(a6 - 2) >= 3)
      v16 = 0;
    else
      v16 = a6 - 1;
    v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v18 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v37.location = 0;
    v37.length = v14;
    self->_wkRectTokenizer = CFStringTokenizerCreate(v17, v13, v37, v16, v18);
  }
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke;
  aBlock[3] = &unk_1E16D7CF8;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x4010000000;
  v32[3] = &unk_18685B0AF;
  v21 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v33 = *MEMORY[0x1E0C9D628];
  v34 = v21;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3010000000;
  v31[0] = 0;
  v31[1] = 0;
  v30[3] = &unk_18685B0AF;
  if (((*((uint64_t (**)(void *, _QWORD *))v20 + 2))(v20, v31) & 1) != 0)
  {
    v22 = -[__CFString length](v13, "length");
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke_2;
    v23[3] = &unk_1E16D7D20;
    v27 = v30;
    v26 = v20;
    v28 = v32;
    v24 = v10;
    v25 = v12;
    v29 = a6;
    objc_msgSend(v11, "enumerateLayoutRectsWithOptions:characterRange:block:", 0, 0, v22, v23);

  }
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

BOOL __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke(uint64_t a1, CFRange *a2)
{
  CFStringTokenizerTokenType Token;

  Token = CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(*(_QWORD *)(a1 + 32) + 32));
  if (Token)
    *a2 = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  return Token != 0;
}

void __92__UIKBRTIPartner__addMergedTextRectsToDocumentState_forWKContext_textInputView_granularity___block_invoke_2(_QWORD *a1, unint64_t a2, uint64_t a3, _BYTE *a4, double x, double y, double width, double height)
{
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  double *v19;
  void *v20;
  void *v21;
  double *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  CGRect v26;
  CGRect v27;

  while (1)
  {
    v16 = *(_QWORD *)(a1[7] + 8);
    v17 = *(_QWORD *)(v16 + 32);
    if (*(_QWORD *)(v16 + 40) + v17 >= a2)
      break;
    if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0)
      goto LABEL_3;
  }
  v18 = a2 + a3;
  if (v18 > v17)
  {
    if (!CGRectIsNull(*(CGRect *)(*(_QWORD *)(a1[8] + 8) + 32)))
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v26 = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1[8] + 8) + 32), v27);
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
    }
    v19 = *(double **)(a1[8] + 8);
    v19[4] = x;
    v19[5] = y;
    v19[6] = width;
    v19[7] = height;
    if (v18 == *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) + *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 32))
    {
      v20 = (void *)a1[4];
      v21 = (void *)a1[5];
      v22 = *(double **)(a1[8] + 8);
      objc_msgSend(v21, "window");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "convertRect:toView:", v23, v22[4], v22[5], v22[6], v22[7]);
      objc_msgSend(v20, "addTextRect:forCharacterRange:granularity:isVertical:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 32), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[9], 0);

      v24 = *(_QWORD *)(a1[8] + 8);
      v25 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)(v24 + 32) = *MEMORY[0x1E0C9D628];
      *(_OWORD *)(v24 + 48) = v25;
      if (((*(uint64_t (**)(void))(a1[6] + 16))() & 1) == 0)
LABEL_3:
        *a4 = 1;
    }
  }
}

- (void)_queryWKDocumentRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  UIWKDocumentRequest *v14;
  int64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int64_t v21;
  unsigned int v22;
  int v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  UIKBRTIPartner *v37;
  id v38;
  id v39;
  int64_t v40;
  int64_t v41;
  os_signpost_id_t v42;
  char v43;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[UIKBRTIPartner inputDelegate](self, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textInputView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIKeyboardLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  _UIKeyboardLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "queryWKDocument", ", buf, 2u);
  }

  v14 = objc_alloc_init(UIWKDocumentRequest);
  v15 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](self, "_uiTextGranularityForRTITextGranularity:", objc_msgSend(v6, "textGranularity"));
  v16 = objc_msgSend(v6, "flags");
  v17 = objc_msgSend(v6, "flags") & 2 | v16 & 1;
  if ((objc_msgSend(v6, "flags") & 4) != 0)
    v18 = v17 | 0x24;
  else
    v18 = v17;
  if (_os_feature_enabled_impl())
    v18 = v18 & 0xFFFFFFFFFFFFFFBFLL | ((((unint64_t)objc_msgSend(v6, "flags") >> 3) & 1) << 6);
  -[UIWKDocumentRequest setFlags:](v14, "setFlags:", objc_msgSend(v6, "flags") & 0x10 | v18);
  -[UIWKDocumentRequest setSurroundingGranularity:](v14, "setSurroundingGranularity:", v15);
  -[UIWKDocumentRequest setGranularityCount:](v14, "setGranularityCount:", objc_msgSend(v6, "surroundingGranularityCount"));
  if ((objc_msgSend(v6, "flags") & 8) != 0)
  {
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "inputDelegateManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "visibleTextRect");
    -[UIWKDocumentRequest setDocumentRect:](v14, "setDocumentRect:");

  }
  v21 = -[UIKBRTIPartner _uiTextGranularityForRTITextGranularity:](self, "_uiTextGranularityForRTITextGranularity:", objc_msgSend(v6, "rectGranularity"));
  v22 = objc_msgSend(v6, "flags");
  aBlock[0] = MEMORY[0x1E0C809B0];
  v23 = (v21 != 0) & (v22 >> 2);
  aBlock[1] = 3221225472;
  aBlock[2] = __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke;
  aBlock[3] = &unk_1E16D7D70;
  if (v21 == v15)
    LOBYTE(v23) = 0;
  v35 = v6;
  v36 = v8;
  v43 = v23;
  v37 = self;
  v38 = v9;
  v40 = v21;
  v41 = v15;
  v42 = v11;
  v24 = v7;
  v39 = v24;
  v25 = v9;
  v26 = v8;
  v27 = v6;
  v28 = _Block_copy(aBlock);
  -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "inputDelegateManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "asyncCapableInputDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "inputDelegateManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "requestDocumentContext:completionHandler:", v14, v28);

  }
  else
  {
    (*((void (**)(id, _QWORD))v24 + 2))(v24, 0);
  }

}

void __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  id v22;
  void *v23;
  void *v24;
  uint8_t buf[16];
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D87178], "documentStateWithRequest:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x1E0DBDB78]);
  objc_msgSend(v3, "contextBefore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "markedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextAfter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForObject(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v3;
  v12 = objc_msgSend(v3, "selectedRangeInMarkedText");
  v14 = (void *)objc_msgSend(v22, "initWithUnboundedContextBefore:markedText:selectedText:unboundedContextAfter:selectedRangeInMarkedText:", v5, v7, v9, v11, v12, v13);

  objc_msgSend(v4, "setDocumentState:", v14);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setHasText:", objc_msgSend(*(id *)(a1 + 40), "hasText"));
  objc_msgSend(v24, "annotatedText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextCheckingAnnotatedString:", v15);

  objc_msgSend(*(id *)(a1 + 48), "_addFirstSelectionRectToDocumentState:", v4);
  if ((objc_msgSend(*(id *)(a1 + 32), "flags") & 0x20) != 0)
    objc_msgSend(*(id *)(a1 + 48), "_addAutocorrectStylingToDocumentState:", v4);
  if (*(_BYTE *)(a1 + 96))
  {
    objc_msgSend(*(id *)(a1 + 48), "_addMergedTextRectsToDocumentState:forWKContext:textInputView:granularity:", v4, v24, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke_2;
    v26[3] = &unk_1E16D7D48;
    v16 = *(void **)(a1 + 56);
    v26[4] = *(_QWORD *)(a1 + 48);
    v27 = v16;
    v17 = v4;
    v18 = *(_QWORD *)(a1 + 80);
    v28 = v17;
    v29 = v18;
    objc_msgSend(v24, "enumerateLayoutRects:", v26);

  }
  _UIKeyboardLog();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v21 = *(_QWORD *)(a1 + 88);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_185066000, v20, OS_SIGNPOST_INTERVAL_END, v21, "queryWKDocument", ", buf, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __53__UIKBRTIPartner__queryWKDocumentRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "convertRect:from:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "addTextRect:forCharacterRange:granularity:isVertical:", a2, a3, *(_QWORD *)(a1 + 56), 0);
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 6) != 0)
    -[UIKBRTIPartner documentStateChanged](self, "documentStateChanged");
}

- (id)insertionPointColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (!+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
    goto LABEL_6;
  +[UIKeyboard currentDocumentState](UIKeyboard, "currentDocumentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "insertionPointColor"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    -[UIKBRTIPartner partnerDelegate](self, "partnerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertionPointColor");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v6 = v5;
  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v5, "cgColor"));
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (BOOL)isNotifyingDelegateOfRemoteOutputOperation
{
  return self->_isNotifyingDelegateOfRemoteOutputOperation;
}

- (BOOL)viewServiceStateIsActiveForRTI
{
  return self->_viewServiceStateIsActiveForRTI;
}

- (void)setViewServiceStateIsActiveForRTI:(BOOL)a3
{
  self->_viewServiceStateIsActiveForRTI = a3;
}

- (TIKeyboardOutput)pendingOutputOperation
{
  return self->_pendingOutputOperation;
}

- (void)setPendingOutputOperation:(id)a3
{
  objc_storeStrong((id *)&self->_pendingOutputOperation, a3);
}

- (void)setIsObservingGeometry:(BOOL)a3
{
  self->_isObservingGeometry = a3;
}

- (void)setRtiSessionMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_rtiSessionMarkers, a3);
}

- (NSMutableDictionary)supplementalLexicons
{
  return self->_supplementalLexicons;
}

- (void)setSupplementalLexicons:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalLexicons, a3);
}

- (void)setTextSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_textSuggestions, a3);
}

- (void)setAuthenticatingSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_queuedSupplementalLexiconOperations, 0);
  objc_storeStrong((id *)&self->_textSuggestions, 0);
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);
  objc_storeStrong((id *)&self->_rtiSessionMarkers, 0);
  objc_storeStrong((id *)&self->_currentSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingOutputOperation, 0);
  objc_storeStrong((id *)&self->_rtiInputSourceState, 0);
  objc_storeStrong((id *)&self->_rtiDocumentState, 0);
  objc_storeStrong((id *)&self->_rtiDocumentTraits, 0);
  objc_storeStrong((id *)&self->_rtiClient, 0);
  objc_destroyWeak((id *)&self->_partnerDelegate);
  objc_storeStrong((id *)&self->_pendingDisableBecomeFirstResponderParameters, 0);
  objc_storeStrong((id *)&self->_keyboardTaskSubqueue, 0);
  objc_storeStrong((id *)&self->_waitingRTIOutputOperationResponseContext, 0);
  objc_storeStrong((id *)&self->_cachedHasNextKeyResponder, 0);
  objc_storeStrong((id *)&self->_cachedHasPreviousKeyResponder, 0);
  objc_storeStrong((id *)&self->_remoteDocumentTraits, 0);
}

@end
