@implementation TIProactiveQuickTypeManager

- (void)reset
{
  void *v3;
  NSDate *lastSuggestionTime;
  NSString *maxLengthProactiveCandidate;

  -[TIProactiveQuickTypeManager inputContextPredictionManager](self, "inputContextPredictionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  lastSuggestionTime = self->_lastSuggestionTime;
  self->_lastSuggestionTime = 0;

  maxLengthProactiveCandidate = self->_maxLengthProactiveCandidate;
  self->_maxLengthProactiveCandidate = 0;

}

- (void)keyboardActivityDidTransition:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  _QWORD v7[4];
  id v8;
  TIProactiveQuickTypeManager *v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__TIProactiveQuickTypeManager_keyboardActivityDidTransition___block_invoke;
  v7[3] = &unk_1EA107030;
  v8 = v4;
  v9 = self;
  v5 = v4;
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v7);
  TIDispatchAsync();

}

+ (id)sharedInstance
{
  if (__testingInstance_5998)
    return (id)__testingInstance_5998;
  +[TIProactiveQuickTypeManager singletonInstance](TIProactiveQuickTypeManager, "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_5996 != -1)
    dispatch_once(&singletonInstance_onceToken_5996, &__block_literal_global_5997);
  return (id)singletonInstance_singleton;
}

void __61__TIProactiveQuickTypeManager_keyboardActivityDidTransition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "toState");
  if (v2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "inputContextPredictionManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hibernate");
  }
  else
  {
    if (v2 != 1)
      return;
    objc_msgSend(*(id *)(a1 + 40), "inputContextPredictionManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "warmUp");
  }

}

- (TIProactiveQuickTypeManager)init
{
  TIProactiveQuickTypeManager *v2;
  TIProactiveQuickTypeManager *v3;
  uint64_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  _ICPredictionManaging *inputContextPredictionManager;
  dispatch_block_t v8;
  _QWORD block[4];
  TIProactiveQuickTypeManager *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TIProactiveQuickTypeManager;
  v2 = -[TIProactiveQuickTypeManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    -[TIProactiveQuickTypeManager _makeQueue](v2, "_makeQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0D3AB78], "predictionManager");
    v6 = objc_claimAutoreleasedReturnValue();
    inputContextPredictionManager = v3->_inputContextPredictionManager;
    v3->_inputContextPredictionManager = (_ICPredictionManaging *)v6;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__TIProactiveQuickTypeManager_init__block_invoke;
    block[3] = &unk_1EA106A98;
    v11 = v3;
    v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    TIDispatchAsync();

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeActivityObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TIProactiveQuickTypeManager;
  -[TIProactiveQuickTypeManager dealloc](&v4, sel_dealloc);
}

- (BOOL)usePQT2Flow
{
  return _os_feature_enabled_impl();
}

- (id)inputContextPredictionManager
{
  return self->_inputContextPredictionManager;
}

- (id)_makeQueue
{
  NSObject *v2;
  dispatch_queue_t v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.TextInput.ProactiveQuickTypeManager", v2);

  return v3;
}

- (id)renderItems:(id)a3 withAdditionalPredictions:(id)a4 withSecureCandidateRenderer:(id)a5 withRenderTraits:(id)a6 withInput:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TIProactiveQuickTypeManager *v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  int v79;
  TIProactiveTrigger *v80;
  void *v81;
  void *v82;
  void *v83;
  TIProactiveTrigger *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  float v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  id v105;
  void *v106;
  TIProactiveQuickTypeManager *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  id obj;
  id obja;
  id objb;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t buf[4];
  void *v120;
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = self;
  v17 = v15;
  v18 = a7;
  v19 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v13;
  v106 = v17;
  v110 = v18;
  v111 = v14;
  if (!-[TIProactiveQuickTypeManager usePQT2Flow](v16, "usePQT2Flow"))
  {
LABEL_12:
    v109 = v20;
    objc_msgSend((id)objc_opt_class(), "buildSecureCandidateFrom:withSecureCandidateRenderer:input:", v12, v14, v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "count")
      || (objc_msgSend(v12, "objectAtIndexedSubscript:", 0),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v34 = objc_msgSend(v33, "layoutHint"),
          v33,
          v34 != 1))
    {
      v37 = v32;
      goto LABEL_34;
    }
    objc_msgSend(v17, "setSharedCellCount:", 0);
    v35 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrayWithObject:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setSharedCellCount:", 0);
    if (-[TIProactiveQuickTypeManager usePQT2Flow](v16, "usePQT2Flow")
      && (unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      if ((unint64_t)objc_msgSend(v12, "count") < 2)
        goto LABEL_34;
      obja = v37;
      v38 = 0;
      v39 = 1;
      while (1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("SmartReply"));

        if (v42)
        {
          v43 = objc_alloc(MEMORY[0x1E0DBDDD0]);
          objc_msgSend(v40, "value");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "label");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v43, "initWithCandidate:responseKitCategory:", v44, v45);
          objc_msgSend(v109, "addObject:", v46);

          if (v38 == 1)
          {

LABEL_32:
            v37 = obja;
            v17 = v106;
LABEL_33:
            v19 = 0x1E0C99000uLL;
            goto LABEL_34;
          }
          v38 = 1;
        }

        if (++v39 >= (unint64_t)objc_msgSend(v12, "count"))
          goto LABEL_32;
      }
    }
    v47 = objc_msgSend(v13, "count");
    if (v47 >= 2)
      v48 = 2;
    else
      v48 = v47;
    if (v48)
    {
      objb = v37;
      for (i = 0; i != v48; ++i)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", i);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)MEMORY[0x1E0DBDBE8];
        objc_msgSend(v50, "candidate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "input");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "candidateWithCandidate:forInput:", v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "addObject:", v54);

      }
      v17 = v106;
      v37 = objb;
      goto LABEL_33;
    }
LABEL_34:
    if (!_os_feature_enabled_impl() || !objc_msgSend(v17, "shouldOfferHideMyEmail"))
    {
      v59 = 0;
      goto LABEL_48;
    }
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "secureCandidateRenderer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "secureCandidateRenderer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "localizedStringForKey:", CFSTR("SAFARI_HIDE_MY_EMAIL_SUGGESTION"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (v59 && objc_msgSend(v59, "length"))
      {
LABEL_47:
        objc_msgSend(v17, "setHideMyEmailLocalizedText:", v59);
        v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD8]), "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", &stru_1EA1081D0, v59, v59, &stru_1EA1081D0, 0);
        v64 = (void *)objc_msgSend(v37, "mutableCopy");
        objc_msgSend(v64, "removeLastObject");
        objc_msgSend(v64, "addObject:", v63);

        v37 = v64;
LABEL_48:
        objc_msgSend(*(id *)(v19 + 3560), "arrayWithCapacity:", objc_msgSend(v37, "count"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "slotIDsFromSecureCandidates:withRenderTraits:outWidths:", v37, v17, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = _os_feature_enabled_impl();
        obj = v37;
        v104 = v59;
        if (v59)
        {
          if (v67)
          {
            if (objc_msgSend(v106, "shouldOfferHideMyEmail"))
            {
              v68 = objc_msgSend(v37, "count");
              if (v68 == objc_msgSend(v66, "count"))
              {
                objc_msgSend(v37, "lastObject");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "secureContent");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = objc_msgSend(v70, "isEqualToString:", v59);

                if (v71)
                {
                  objc_msgSend(v66, "subarrayWithRange:", 0, 1);
                  v72 = objc_claimAutoreleasedReturnValue();

                  v66 = (void *)v72;
                }
              }
            }
          }
        }
        if (objc_msgSend(v66, "count"))
        {
          v73 = 0;
          v108 = v65;
          do
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v73);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "trigger");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v75, "triggerSourceType") == 3)
            {
              v76 = 3;
            }
            else
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v73);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v77, "trigger");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = objc_msgSend(v78, "triggerSourceType");
              if (v79 == 2)
                v76 = 2;
              else
                v76 = v79 == 1;

            }
            v80 = [TIProactiveTrigger alloc];
            objc_msgSend(v12, "objectAtIndexedSubscript:", v73);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "trigger");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "attributedString");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = -[TIProactiveTrigger initWithSourceType:attributes:](v80, "initWithSourceType:attributes:", v76, v83);

            objc_msgSend(v66, "objectAtIndexedSubscript:", v73);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "unsignedIntegerValue");

            objc_msgSend(MEMORY[0x1E0DBDBE8], "secureCandidateForInput:slotID:", &stru_1EA1081D0, v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v65, "count") <= v73)
            {
              objc_msgSend(v87, "setSecureCandidateWidth:", 0.0);
            }
            else
            {
              objc_msgSend(v65, "objectAtIndexedSubscript:", v73);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "floatValue");
              objc_msgSend(v87, "setSecureCandidateWidth:", v89);

            }
            objc_msgSend(obj, "objectAtIndexedSubscript:", v73);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "setSecureCandidateHash:", objc_msgSend(v90, "candidateHash"));

            objc_msgSend(v87, "setIndexForMetrics:", v73);
            objc_msgSend(v109, "addObject:", v87);
            v91 = objc_alloc(MEMORY[0x1E0DBDDD0]);
            objc_msgSend(obj, "objectAtIndexedSubscript:", v73);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "secureFormattedContent");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectAtIndexedSubscript:", v73);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v103) = 1;
            v95 = (void *)objc_msgSend(v91, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:secureContentCandidate:proactiveTrigger:proactivePredictedItem:", v93, v110, 0, 0, 0, 0, v103, v84, v94);

            objc_msgSend(v95, "setIndexForMetrics:", v73);
            objc_msgSend(v12, "objectAtIndexedSubscript:", v73);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "setAgeForConnectionsMetrics:", objc_msgSend(v96, "predictionAge"));

            objc_msgSend(v111, "secureCandidateCache");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v86);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "setObject:forKey:", v95, v98);

            +[TIKeyboardSecureTouchManager sharedInstance](TIKeyboardSecureTouchManager, "sharedInstance");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "registerSlotID:", v86);

            ++v73;
            v65 = v108;
          }
          while (v73 < objc_msgSend(v66, "count"));
        }

        v13 = v105;
        v14 = v111;
        v20 = v109;
LABEL_67:
        v17 = v106;
        v18 = v110;
        goto LABEL_68;
      }
    }
    else
    {
      TIProactiveQuickTypeOSLogFacility();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s self.secureCandidateRenderer is nil"), "-[TIProactiveQuickTypeManager renderItems:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:]");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v120 = v102;
        _os_log_debug_impl(&dword_1DA6F2000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      v59 = 0;
    }
    TIProactiveQuickTypeOSLogFacility();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Localized Hide My Email text is nil"), "-[TIProactiveQuickTypeManager renderItems:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:]");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v120 = v101;
      _os_log_debug_impl(&dword_1DA6F2000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v62 = (id)*MEMORY[0x1E0DBE3E8];

    v59 = v62;
    goto LABEL_47;
  }
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = v12;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
  if (v21)
  {
    v22 = v21;
    v107 = v16;
    v23 = *(_QWORD *)v116;
    while (2)
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v116 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * j);
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("SmartReply"));

        if (!v27)
        {
          objc_msgSend(v20, "removeAllObjects");

          v13 = v105;
          v17 = v106;
          v19 = 0x1E0C99000;
          v16 = v107;
          goto LABEL_12;
        }
        v28 = objc_alloc(MEMORY[0x1E0DBDDD0]);
        objc_msgSend(v25, "value");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "label");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v28, "initWithCandidate:responseKitCategory:", v29, v30);
        objc_msgSend(v20, "addObject:", v31);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v121, 16);
      if (v22)
        continue;
      break;
    }
    v13 = v105;
    goto LABEL_67;
  }
LABEL_68:

  return v20;
}

- (void)addToTypologyTrace:(id)a3 withTriggerSource:(id)a4 withTriggerType:(id)a5 withTriggerSubType:(id)a6 withPredictionResults:(id)a7 withFirstTrigger:(id)a8
{
  void (**v13)(id, void *);
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
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
  v13 = (void (**)(id, void *))a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(v17, "count"))
  {
    if (v14 && objc_msgSend(v14, "length"))
    {
      objc_msgSend(CFSTR("Proactive Trigger:\n"), "stringByAppendingString:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v19);

    }
    if (v15 && objc_msgSend(v15, "length"))
    {
      objc_msgSend(CFSTR("Proactive Trigger Type:\n"), "stringByAppendingString:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v20);

    }
    v35 = v18;
    if (v16 && objc_msgSend(v16, "length"))
    {
      objc_msgSend(CFSTR("Proactive Trigger SubType:\n"), "stringByAppendingString:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, v21);

    }
    v13[2](v13, CFSTR("Proactive Suggestions:"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v37;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v26), "value");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v13[2](v13, v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v24);
    }

    v18 = v35;
  }
  else
  {
    objc_msgSend(v18, "attributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKey:", *MEMORY[0x1E0D432C8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) == 0)
    {
      if (v14 && objc_msgSend(v14, "length"))
      {
        objc_msgSend(CFSTR("Proactive Triggers:\n"), "stringByAppendingString:", v14);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v32);

      }
      if (v15 && objc_msgSend(v15, "length"))
      {
        objc_msgSend(CFSTR("Proactive Trigger Type:\n"), "stringByAppendingString:", v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v33);

      }
      if (v16 && objc_msgSend(v16, "length"))
      {
        objc_msgSend(CFSTR("Proactive Trigger SubType:\n"), "stringByAppendingString:", v16);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v34);

      }
      v13[2](v13, CFSTR("Proactive Suggestions:\nNone"));
    }

  }
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  id v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__5867;
  v23 = __Block_byref_object_dispose__5868;
  v24 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __277__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withAvailableApps_logBlock___block_invoke;
  v18[3] = &unk_1EA1029F8;
  v18[4] = &v19;
  LOBYTE(v17) = 0;
  *(_WORD *)((char *)&v16 + 1) = 0;
  LOBYTE(v16) = a12;
  -[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:](self, "generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v16, a13, a14, v17, v18);
  v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  __CFString *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  int v55;
  __CFString *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  __CFString *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  __CFString *v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  int v78;
  dispatch_block_t v79;
  void *v80;
  dispatch_block_t v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  __CFString *v91;
  id v92;
  id v94;
  id v95;
  __CFString *v96;
  void *v97;
  id v98;
  id v99;
  id v100;
  _QWORD v101[5];
  id v102;
  id v103;
  id v104;
  id v105;
  uint64_t *v106;
  __int128 *p_buf;
  int v108;
  int v109;
  BOOL v110;
  BOOL v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  _QWORD block[5];
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  int v124;
  int v125;
  BOOL v126;
  BOOL v127;
  _QWORD aBlock[5];
  id v129;
  __CFString *v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  __CFString *v138;
  id v139;
  id v140;
  id v141;
  int v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 buf;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, uint64_t);
  void (*v150)(uint64_t);
  void *v151;
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v95 = a3;
  v100 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v91 = (__CFString *)a8;
  v94 = a9;
  v26 = a10;
  v99 = a11;
  v98 = a15;
  v27 = a16;
  v28 = a18;
  v29 = v28;
  if (v25)
  {
    v86 = v28;
    v87 = v27;
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    v30 = v100;
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v82 = v25;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Found triggers, count = %lu"), "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]", objc_msgSend(v95, "count"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v83;
        _os_log_debug_impl(&dword_1DA6F2000, v31, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

        v25 = v82;
      }

    }
    v89 = v24;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v23;
    v88 = v25;
    if (-[TIProactiveQuickTypeManager usePQT2Flow](self, "usePQT2Flow"))
    {
      v32 = v26;

      objc_msgSend(v100, "documentState");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "contextBeforeInput");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_msgSend(v100, "documentState");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "contextBeforeInput");
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v36 = &stru_1EA1081D0;
      }

      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString componentsSeparatedByCharactersInSet:](v36, "componentsSeparatedByCharactersInSet:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "lastObject");
      v39 = (id)objc_claimAutoreleasedReturnValue();

      if (a12)
      {
        objc_msgSend(v39, "stringByAppendingString:", CFSTR(" "));
        v59 = objc_claimAutoreleasedReturnValue();

        v39 = (id)v59;
      }
      v26 = v32;
      objc_msgSend(v100, "textInputTraits");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "textContentType");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = v91;
      if (!objc_msgSend(v61, "length"))
      {
        v63 = objc_msgSend(v100, "autofillMode");
        if ((unint64_t)(v63 - 4) <= 2)
        {
          v64 = **((id **)&unk_1EA0FF448 + v63 - 4);

          v61 = v64;
        }
      }
      v65 = objc_alloc(MEMORY[0x1E0D3AB90]);
      objc_msgSend(v100, "inputContextHistory");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(v65, "initWithContext:inputContextHistory:contentType:", v39, v66, v61);

      objc_msgSend(v67, "setAvailableApps:", v98);
      objc_msgSend(v97, "addObject:", v67);
      if (objc_msgSend(v61, "length"))
      {
        v68 = (__CFString *)v39;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v69 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "componentsSeparatedByCharactersInSet:");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "lastObject");
        v71 = objc_claimAutoreleasedReturnValue();
        v72 = (void *)v71;
        if (v71)
          v73 = (__CFString *)v71;
        else
          v73 = &stru_1EA1081D0;
        v68 = v73;

        v62 = (void *)v69;
      }

      v56 = 0;
      v55 = 0;
      v53 = 0;
      v54 = v68;
    }
    else
    {
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      v39 = v95;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v143, v152, 16);
      if (v40)
      {
        v41 = v40;
        v84 = v26;
        v96 = 0;
        v42 = 0;
        v43 = *(_QWORD *)v144;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v144 != v43)
              objc_enumerationMutation(v39);
            v45 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
            v46 = objc_msgSend(v45, "triggerSourceType");
            if (v46 > 2)
            {
              v47 = 0;
            }
            else
            {
              v47 = v46;
              v96 = off_1EA0FF460[v46];
              v42 = *(_DWORD *)&a2_0[4 * v46];
            }
            objc_msgSend(v100, "textInputTraits");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "textContentType");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            TIStatisticLogProactive(v99, v45, 0, v49, 0);

            v50 = objc_alloc(MEMORY[0x1E0D3AB90]);
            objc_msgSend(v45, "attributes");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)objc_msgSend(v50, "initWithSource:attributes:", v47, v51);

            objc_msgSend(v52, "setAvailableApps:", v98);
            objc_msgSend(v97, "addObject:", v52);

          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v143, v152, 16);
        }
        while (v41);
        v53 = v39;
        v30 = v100;
        v26 = v84;
        v54 = v91;
        v55 = v42;
        v56 = v96;
      }
      else
      {
        v56 = 0;
        v55 = 0;
        v53 = v39;
        v54 = v91;
      }
    }

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke;
    aBlock[3] = &unk_1EA0FF370;
    aBlock[4] = self;
    v95 = v53;
    v129 = v95;
    v140 = v87;
    v130 = v56;
    v92 = v85;
    v131 = v92;
    v74 = v26;
    v132 = v74;
    v133 = v30;
    v75 = v99;
    v134 = v75;
    v141 = v86;
    v135 = v88;
    v136 = v90;
    v137 = v89;
    v38 = v54;
    v138 = v38;
    v76 = v97;
    v139 = v76;
    v142 = v55;
    v77 = _Block_copy(aBlock);
    if (-[TIProactiveQuickTypeManager usePQT2Flow](self, "usePQT2Flow"))
      v78 = 3;
    else
      v78 = 2;
    if (a17)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_123;
      block[3] = &unk_1EA0FF398;
      block[4] = self;
      v119 = v76;
      v120 = v74;
      v121 = v94;
      v122 = v75;
      v126 = a13;
      v127 = a14;
      v124 = v55;
      v125 = v78;
      v123 = v77;
      v79 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
      TIDispatchAsync();

      v80 = v119;
    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v148 = 0x3032000000;
      v149 = __Block_byref_object_copy__5867;
      v150 = __Block_byref_object_dispose__5868;
      v151 = 0;
      v112 = 0;
      v113 = &v112;
      v114 = 0x3032000000;
      v115 = __Block_byref_object_copy__5867;
      v116 = __Block_byref_object_dispose__5868;
      v117 = 0;
      v101[0] = MEMORY[0x1E0C809B0];
      v101[1] = 3221225472;
      v101[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3_125;
      v101[3] = &unk_1EA0FF3C0;
      v106 = &v112;
      v101[4] = self;
      v102 = v76;
      v103 = v74;
      v104 = v94;
      v110 = a13;
      v111 = a14;
      v108 = v55;
      v109 = v78;
      v105 = v75;
      p_buf = &buf;
      v81 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v101);
      TIDispatchSync();

      (*((void (**)(void *, uint64_t, _QWORD))v77 + 2))(v77, v113[5], *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      _Block_object_dispose(&v112, 8);

      _Block_object_dispose(&buf, 8);
      v80 = v151;
    }

    v37 = v100;
    v24 = v89;
    v23 = v90;
    v27 = v87;
    v25 = v88;
    v29 = v86;
  }
  else
  {
    (*((void (**)(id, _QWORD))v28 + 2))(v28, MEMORY[0x1E0C9AA60]);
    v37 = v100;
    v38 = v91;
  }

}

- (void)userActionWithNoNewTriggers:(id)a3 fieldType:(id)a4
{
  NSDate *lastSuggestionTime;
  id v7;
  id v8;
  NSDate *v9;

  lastSuggestionTime = self->_lastSuggestionTime;
  if (lastSuggestionTime)
  {
    v7 = a4;
    v8 = a3;
    -[NSDate timeIntervalSinceNow](lastSuggestionTime, "timeIntervalSinceNow");
    TIStatisticsLogProactiveTimeOnScreen(v8, self->_lastTriggerForSuggestion, 0, v7);

    v9 = self->_lastSuggestionTime;
    self->_lastSuggestionTime = 0;

  }
}

- (void)suggestionAccepted:(id)a3 fieldType:(id)a4
{
  id v6;
  id v7;
  NSDate *lastSuggestionTime;
  NSDate *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  lastSuggestionTime = self->_lastSuggestionTime;
  if (lastSuggestionTime)
  {
    -[NSDate timeIntervalSinceNow](lastSuggestionTime, "timeIntervalSinceNow");
    TIStatisticsLogProactiveTimeOnScreen(v6, self->_lastTriggerForSuggestion, 1, v7);
    v9 = self->_lastSuggestionTime;
    self->_lastSuggestionTime = 0;

  }
  else
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: ERROR on proactive Time SHOULD HAVE HAD A LAST SUGGESTION TIME"), "-[TIProactiveQuickTypeManager suggestionAccepted:fieldType:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v11;
      _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

- (void)suggestionNotAccepted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSUInteger v13;
  NSString *v14;
  NSString *maxLengthProactiveCandidate;
  NSString *v16;
  NSString *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_maxLengthProactiveCandidate)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "candidate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "length");
            v13 = -[NSString length](self->_maxLengthProactiveCandidate, "length");

            if (v12 > v13)
            {
              objc_msgSend(v10, "candidate");
              v14 = (NSString *)objc_claimAutoreleasedReturnValue();
              maxLengthProactiveCandidate = self->_maxLengthProactiveCandidate;
              self->_maxLengthProactiveCandidate = v14;

            }
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    if (-[NSString length](self->_maxLengthProactiveCandidate, "length") >= 0x14)
    {
      -[NSString substringToIndex:](self->_maxLengthProactiveCandidate, "substringToIndex:", 20);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = self->_maxLengthProactiveCandidate;
      self->_maxLengthProactiveCandidate = v16;

    }
  }

}

- (id)searchForMeCardEmailAddresses
{
  void *v2;
  void *v3;

  -[TIProactiveQuickTypeManager inputContextPredictionManager](self, "inputContextPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchForMeCardEmailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6
{
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5867;
  v13 = __Block_byref_object_dispose__5868;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __139__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType___block_invoke;
  v8[3] = &unk_1EA1029F8;
  v8[4] = &v9;
  -[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsWithInput:withSecureCandidateRenderer:withRenderTraits:textContentType:async:completion:](self, "generateAndRenderProactiveSuggestionsWithInput:withSecureCandidateRenderer:withRenderTraits:textContentType:async:completion:", a3, a4, a5, a6, 0, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  dispatch_block_t v26;
  void *v27;
  dispatch_block_t v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  void *v39;
  _QWORD block[5];
  id v41;
  id v42;
  _QWORD aBlock[5];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "length"))
  {
    v22 = v16;
    v23 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke;
    aBlock[3] = &unk_1EA0FF3E8;
    aBlock[4] = self;
    v30 = v15;
    v44 = v15;
    v29 = v22;
    v45 = v22;
    v24 = v21;
    v46 = v24;
    v47 = v14;
    v48 = v17;
    v49 = v18;
    v25 = _Block_copy(aBlock);
    if (v9)
    {
      block[0] = v23;
      block[1] = 3221225472;
      block[2] = __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_2;
      block[3] = &unk_1EA107398;
      block[4] = self;
      v41 = v24;
      v42 = v25;
      v26 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
      TIDispatchAsync();

      v27 = v41;
    }
    else
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__5867;
      v38 = __Block_byref_object_dispose__5868;
      v39 = 0;
      v31[0] = v23;
      v31[1] = 3221225472;
      v31[2] = __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_4;
      v31[3] = &unk_1EA1070B8;
      v33 = &v34;
      v31[4] = self;
      v32 = v24;
      v28 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v31);
      TIDispatchSync();

      (*((void (**)(void *, uint64_t))v25 + 2))(v25, v35[5]);
      _Block_object_dispose(&v34, 8);
      v27 = v39;
    }

    v16 = v29;
    v15 = v30;
  }
  else
  {
    (*((void (**)(id, _QWORD))v18 + 2))(v18, 0);
  }

}

- (void)loggingProactiveEngagementMetric:(unint64_t)a3 withLocale:(id)a4 fieldType:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  switch(a3)
  {
    case 3uLL:
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Proactive suggestion %@ not selected by user and mildly matching user input!"), "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      v11 = kTIStatisticsZeroEngagementDescriptionMildlyMatchedToUserInput;
      break;
    case 2uLL:
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Proactive suggestion %@ not selected by user and moderately matching user input!"), "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      v11 = kTIStatisticsZeroEngagementDescriptionModeratelyMatchedToUserInput;
      break;
    case 1uLL:
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Proactive suggestion %@ not selected by user and exactly matching user input!"), "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      v11 = kTIStatisticsZeroEngagementDescriptionExactlyMatchedToUserInput;
      break;
    default:
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Proactive suggestion %@ not selected by user and zero matching user input!"), "-[TIProactiveQuickTypeManager loggingProactiveEngagementMetric:withLocale:fieldType:]", self->_maxLengthProactiveCandidate);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v16;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      v11 = &kTIStatisticsZeroEngagementDescriptionNotMatchedToUserInput;
      break;
  }

  v12 = (void *)-[__CFString copy](*v11, "copy");
  TIStatisticLogProactiveDescription(v8, self->_lastTriggerForSuggestion, v12, CFSTR("engagement"), v9);

}

- (unint64_t)matchProactiveCandidateToUserInput:(id)a3 userInput:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  float v8;
  double v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v8 = (float)(unint64_t)objc_msgSend(v6, "_editDistanceFrom:", v5);
    v9 = (float)((float)(v8 / (float)(unint64_t)objc_msgSend(v5, "length")) * 100.0);
    v10 = 3;
    if (v9 > 66.66)
      v10 = 4;
    if (v9 <= 33.33)
      v7 = 2;
    else
      v7 = v10;
  }

  return v7;
}

- (void)provideFeedbackForString:(id)a3 type:(unsigned __int8)a4 style:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v5 = a5;
  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  TIProactiveQuickTypeOSLogFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Sending feedback to Input Context, Type: %ud, "), "-[TIProactiveQuickTypeManager provideFeedbackForString:type:style:]", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v11;
    _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  -[TIProactiveQuickTypeManager inputContextPredictionManager](self, "inputContextPredictionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "provideFeedbackForString:type:style:", v8, v6, v5);

}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TIProactiveQuickTypeManager inputContextPredictionManager](self, "inputContextPredictionManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propogateMetrics:data:", v7, v6);

}

- (id)searchForMeCardRegions
{
  void *v2;
  void *v3;

  -[TIProactiveQuickTypeManager inputContextPredictionManager](self, "inputContextPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchForMeCardRegions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  TIGetProactiveQuickTypeSettingValue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3 & 1;
}

- (BOOL)isAutoPopupEnabled
{
  void *v2;
  unint64_t v3;

  TIGetProactiveQuickTypeSettingValue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return (v3 >> 1) & 1;
}

- (BOOL)isAutoCompleteEnabled
{
  void *v2;
  unint64_t v3;

  TIGetProactiveQuickTypeSettingValue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return (v3 >> 2) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxLengthProactiveCandidate, 0);
  objc_storeStrong((id *)&self->_lastSuggestionTime, 0);
  objc_storeStrong((id *)&self->_lastTriggerForSuggestion, 0);
  objc_storeStrong((id *)&self->_inputContextPredictionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "renderItems:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:", v16, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 40))
  {
    if (*(_QWORD *)(v5 + 48)
      && (unint64_t)objc_msgSend(*(id *)(a1 + 64), "length") >= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    {
      v6 = objc_msgSend(*(id *)(a1 + 64), "length") - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      if (v6 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "length"))
      {
        objc_msgSend(*(id *)(a1 + 64), "substringFromIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lowercaseString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(*(id *)(a1 + 32), "matchProactiveCandidateToUserInput:userInput:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v8);
        v10 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "localeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "loggingProactiveEngagementMetric:withLocale:fieldType:", v9, v11, *(_QWORD *)(a1 + 72));

        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = 0;

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(void **)(v14 + 24);
        *(_QWORD *)(v14 + 24) = 0;

      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = objc_msgSend(*(id *)(a1 + 64), "length") - 1;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

void __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inputContextPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastCachedResultWithInitialCharacters:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(id *)(a1 + 48);
  v4 = v3;
  TIDispatchAsync();

}

void __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inputContextPredictionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastCachedResultWithInitialCharacters:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __156__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType_async_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __139__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithInput_withSecureCandidateRenderer_withRenderTraits_textContentType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
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
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  NSObject *v56;
  int v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  BOOL v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  double v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *context;
  uint64_t v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  id v124;
  char objc;
  id obj;
  id obja;
  id objb;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  id v136;
  id v137;
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  id v142;
  id v143;
  _QWORD v144[4];
  id v145;
  id v146;
  id v147;
  _QWORD v148[5];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint8_t v164[128];
  uint8_t buf[4];
  void *v166;
  _QWORD v167[5];

  v167[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "usePQT2Flow") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", *MEMORY[0x1E0D43428]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "attributes");
    a3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "valueForKey:", *MEMORY[0x1E0D43400]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addToTypologyTrace:withTriggerSource:withTriggerType:withTriggerSubType:withPredictionResults:withFirstTrigger:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 48), v10, v3, v6, v8);
  }
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
  v12 = v11;
  v124 = v6;
  v129 = v7;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trigger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "triggerSourceType") == 3)
    {

      goto LABEL_16;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trigger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "triggerSourceType") == 2)
    {

    }
    else
    {
      v16 = *MEMORY[0x1E0D433E0];
      v167[0] = *MEMORY[0x1E0D433D8];
      v167[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "trigger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributedString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("subtype"));
      a3 = (void *)objc_claimAutoreleasedReturnValue();
      objc = objc_msgSend(v17, "containsObject:", a3);

      v6 = v124;
      v7 = v129;

      if ((objc & 1) == 0)
        goto LABEL_16;
    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "trigger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "triggerSourceType");

    objc_msgSend(v6, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "originatingBundleID");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v121 = *(id *)(a1 + 64);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "predictionAge");

    if (v26 == -1)
    {
      v119 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v27, "predictionAge");

    }
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trigger");
    v29 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "attributedString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("field"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      v34 = v32;
    }
    else
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "trigger");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "attributedString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("type"));
      v34 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[TIConnectionsMetricsTracker sharedInstance](TIConnectionsMetricsTracker, "sharedInstance");
    a3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "textInputTraits");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "textContentType");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v116) = v23 == 2;
    LOBYTE(v116) = v23 != 2;
    v3 = v121;
    objc_msgSend(a3, "trackPredictionEngagmentWithConversion:age:fieldType:resultType:fromBundleId:targetApp:linguistic:semantic:", 0, v119, v39, v34, obj, v121, v116);

    v6 = v124;
    v7 = v129;
  }
LABEL_16:
  if (v7)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Error returned from InputContext: %@, response time = %lf seconds"), "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]_block_invoke", v7, -v12);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v166 = v110;
      _os_log_debug_impl(&dword_1DA6F2000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "usePQT2Flow") & 1) == 0)
    {
      v159 = 0u;
      v160 = 0u;
      v157 = 0u;
      v158 = 0u;
      v41 = *(id *)(a1 + 40);
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v158;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v158 != v44)
              objc_enumerationMutation(v41);
            v46 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * i);
            if (objc_msgSend(v7, "code") == 5)
            {
              objc_msgSend(v7, "localizedDescription");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = *(void **)(a1 + 80);
              objc_msgSend(*(id *)(a1 + 72), "textInputTraits");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "textContentType");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              TIStatisticsLogProactiveSuggestedZeroDescription(v48, v46, v47, v50);

              v51 = *(void **)(a1 + 80);
              objc_msgSend(*(id *)(a1 + 72), "textInputTraits");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "textContentType");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              TIStatisticLogProactive(v51, v46, 1, v53, 0);

              v7 = v129;
            }
            else
            {
              v54 = *(void **)(a1 + 80);
              objc_msgSend(*(id *)(a1 + 72), "textInputTraits");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "textContentType");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              TIStatisticLogProactive(v54, v46, 2, v52, 0);
            }

          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v157, v164, 16);
        }
        while (v43);
      }

      v6 = v124;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();
    goto LABEL_103;
  }
  v55 = objc_msgSend(v6, "count");
  if (v55 >= 1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", 0);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v120 = 0;
    }
    while (1)
    {
      if (!_os_feature_enabled_impl() || objc_msgSend(*(id *)(a1 + 72), "autofillMode") != 4)
        goto LABEL_68;
      objc_msgSend(*(id *)(a1 + 72), "documentState");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "contextBeforeInput");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        objc_msgSend(*(id *)(a1 + 72), "documentState");
        a3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a3, "contextBeforeInput");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "length"))
          break;
      }
      v122 = v3;
      obja = a3;
      objc_msgSend(*(id *)(a1 + 72), "documentState");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "contextAfterInput");
      v72 = objc_claimAutoreleasedReturnValue();
      if (!v72)
      {

        a3 = obja;
        if (!v69)
        {

          v6 = v124;
LABEL_65:
          if ((objc_msgSend(*(id *)(a1 + 88), "disableHideMyEmail") & 1) == 0)
            objc_msgSend(*(id *)(a1 + 88), "setShouldOfferHideMyEmail:", 1);
          goto LABEL_68;
        }
        v70 = 1;
        goto LABEL_64;
      }
      v73 = (void *)v72;
      objc_msgSend(*(id *)(a1 + 72), "documentState");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "contextAfterInput");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v75, "length");
      v70 = v76 == 0;

      if (v69)
      {
        a3 = obja;
        v3 = v122;
LABEL_64:

        v6 = v124;
        if (v70)
          goto LABEL_65;
        goto LABEL_68;
      }

      v6 = v124;
      a3 = obja;
      v3 = v122;
      if (!v76)
        goto LABEL_65;
LABEL_68:
      if (!--v55)
      {
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel > 1)
        {
          TIOSLogFacility();
          v77 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
          {
            v111 = (void *)MEMORY[0x1E0CB3940];
            v112 = objc_msgSend(v6, "count");
            objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
            objc_msgSend(v111, "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: %lu results returned from InputContext, response time = %lf seconds"), "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]_block_invoke", v112, -v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v166 = v114;
            _os_log_debug_impl(&dword_1DA6F2000, v77, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        objc_msgSend(*(id *)(a1 + 32), "renderItems:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:", v6, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 112));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = (void *)objc_msgSend(v78, "mutableCopy");

        context = (void *)MEMORY[0x1DF0A2708]();
        if (objc_msgSend(*(id *)(a1 + 32), "usePQT2Flow"))
        {
          v155 = 0u;
          v156 = 0u;
          v153 = 0u;
          v154 = 0u;
          v79 = v6;
          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
          if (v80)
          {
            v81 = v80;
            v82 = *(_QWORD *)v154;
            do
            {
              for (j = 0; j != v81; ++j)
              {
                if (*(_QWORD *)v154 != v82)
                  objc_enumerationMutation(v79);
                v84 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * j);
                objc_msgSend(v84, "value");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v86 = objc_msgSend(v85, "length");

                if (v86)
                {
                  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v84, "value");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "provideFeedbackForString:type:style:", v88, 3, 1);

                }
              }
              v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v153, v163, 16);
            }
            while (v81);
          }

          +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "provideFeedbackForString:type:style:", &stru_1EA1081D0, 3, 1);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 120), "count"));
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_opt_new();
          v93 = v6;
          v94 = (void *)v92;
          v149 = 0u;
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          objb = v93;
          v95 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
          if (v95)
          {
            v96 = v95;
            v97 = *(_QWORD *)v150;
            do
            {
              for (k = 0; k != v96; ++k)
              {
                if (*(_QWORD *)v150 != v97)
                  objc_enumerationMutation(objb);
                v99 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * k);
                v100 = *(void **)(a1 + 120);
                v148[0] = MEMORY[0x1E0C809B0];
                v148[1] = 3221225472;
                v148[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_116;
                v148[3] = &unk_1EA0FF2F8;
                v148[4] = v99;
                v101 = objc_msgSend(v100, "indexOfObjectPassingTest:", v148);
                objc_msgSend(v99, "value");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "addObject:", v102);

                if (objc_msgSend(v90, "containsIndex:", v101))
                  v103 = v91;
                else
                  v103 = v90;
                objc_msgSend(v103, "addIndex:", v101);
              }
              v96 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v149, v162, 16);
            }
            while (v96);
          }

          v89 = v117;
          objc_msgSend(v117, "removeIndexes:", v90);
          objc_msgSend(v90, "removeIndexes:", v91);
          v104 = MEMORY[0x1E0C809B0];
          v144[0] = MEMORY[0x1E0C809B0];
          v144[1] = 3221225472;
          v144[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_2;
          v144[3] = &unk_1EA0FF320;
          v145 = *(id *)(a1 + 80);
          v146 = *(id *)(a1 + 40);
          v147 = *(id *)(a1 + 72);
          objc_msgSend(v117, "enumerateIndexesUsingBlock:", v144);
          v139[0] = v104;
          v139[1] = 3221225472;
          v139[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3;
          v139[3] = &unk_1EA0FF348;
          v140 = *(id *)(a1 + 80);
          v141 = *(id *)(a1 + 40);
          v142 = *(id *)(a1 + 72);
          v105 = v94;
          v143 = v105;
          objc_msgSend(v90, "enumerateIndexesUsingBlock:", v139);
          v134[0] = v104;
          v134[1] = 3221225472;
          v134[2] = __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_4;
          v134[3] = &unk_1EA0FF348;
          v135 = *(id *)(a1 + 80);
          v136 = *(id *)(a1 + 40);
          v137 = *(id *)(a1 + 72);
          v138 = v105;
          v106 = v105;
          objc_msgSend(v91, "enumerateIndexesUsingBlock:", v134);

          v6 = v124;
        }

        objc_autoreleasePoolPop(context);
        (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();
        v7 = v129;
        if (objc_msgSend(v123, "count") && v120)
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v107 = objc_claimAutoreleasedReturnValue();
          v108 = *(_QWORD *)(a1 + 32);
          v109 = *(void **)(v108 + 32);
          *(_QWORD *)(v108 + 32) = v107;

          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), v120);
        }

        goto LABEL_103;
      }
    }
    v70 = 0;
    goto LABEL_64;
  }
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: No suggestions returned from InputContext, response time = %lf seconds"), "-[TIProactiveQuickTypeManager generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:]_block_invoke_5", -v12);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v166 = v115;
      _os_log_debug_impl(&dword_1DA6F2000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  v57 = *(_DWORD *)(a1 + 144);
  v130 = 0u;
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v58 = *(id *)(a1 + 40);
  v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v130, v161, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v131;
    if (v12 * -1000.0 <= (double)v57)
      v62 = 1;
    else
      v62 = 3;
    do
    {
      for (m = 0; m != v60; ++m)
      {
        if (*(_QWORD *)v131 != v61)
          objc_enumerationMutation(v58);
        v64 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * m);
        v65 = *(void **)(a1 + 80);
        objc_msgSend(*(id *)(a1 + 72), "textInputTraits");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "textContentType");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        TIStatisticLogProactive(v65, v64, v62, v67, 0);

      }
      v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v130, v161, 16);
    }
    while (v60);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();
  v6 = v124;
  v7 = v129;
LABEL_103:

}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_123(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "inputContextPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(unsigned __int8 *)(a1 + 88);
  v8 = *(unsigned __int8 *)(a1 + 89);
  v9 = *(_DWORD *)(a1 + 80);
  v10 = *(_DWORD *)(a1 + 84);
  v16 = 0;
  objc_msgSend(v2, "searchWithTriggers:application:recipient:localeIdentifier:isResponseDenyListed:shouldDisableAutoCaps:timeoutInMilliseconds:resultLimit:error:", v3, v4, v5, v6, v7, v8, __PAIR64__(v10, v9), &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;

  v15 = *(id *)(a1 + 72);
  v13 = v12;
  v14 = v11;
  TIDispatchAsync();

}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3_125(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "inputContextPredictionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(unsigned __int8 *)(a1 + 96);
  v8 = *(unsigned __int8 *)(a1 + 97);
  v9 = *(_DWORD *)(a1 + 88);
  v10 = *(_DWORD *)(a1 + 92);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v2, "searchWithTriggers:application:recipient:localeIdentifier:isResponseDenyListed:shouldDisableAutoCaps:timeoutInMilliseconds:resultLimit:error:", v3, v4, v5, v6, v7, v8, __PAIR64__(v10, v9), &obj);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

}

uint64_t __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_2_124(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_116(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "attributedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticLogProactive(v3, v6, 1, v5, 0);

}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticsLogProactiveSuggestedOne(v3, v7, v5, v6);

}

void __341__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsForInput_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withIsResponseDenyListed_withShouldDisableAutoCaps_withAvailableApps_logBlock_async_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticLogProactive(v3, v6, 5, v5, *(void **)(a1 + 56));

}

void __277__TIProactiveQuickTypeManager_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_nextInputWillInsertAutospace_withAvailableApps_logBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __35__TIProactiveQuickTypeManager_init__block_invoke(uint64_t a1)
{
  id v2;

  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addActivityObserver:", *(_QWORD *)(a1 + 32));

}

+ (id)proactiveTriggerForTextContentType:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  TIProactiveTrigger *v6;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Creating a connections trigger for tagged text field: %@"), "+[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:]", v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "setValue:forKey:", CFSTR("triggerTypeConnections"), *MEMORY[0x1E0D43428]);
    objc_msgSend(v5, "setValue:forKey:", v3, CFSTR("textContentTypeTag"));
    v6 = -[TIProactiveTrigger initWithSourceType:attributes:]([TIProactiveTrigger alloc], "initWithSourceType:attributes:", 2, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)proactiveTriggerForTextContentType:(id)a3 withContextBeforeInput:(id)a4 autofillMode:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  TIProactiveTrigger *v13;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") | a5)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setValue:forKey:", CFSTR("triggerTypeConnections"), *MEMORY[0x1E0D43428]);
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v9, "setValue:forKey:", v7, CFSTR("textContentTypeTag"));
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("​"), &stru_1EA1081D0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      if (v10)
      {
        v11 = objc_msgSend(v10, "length");
        v12 = a5 - 4;
        if (v12 <= 2)
        {
          if (v11)
          {
            if (!objc_msgSend(v7, "length"))
              objc_msgSend(v9, "setValue:forKey:", **((_QWORD **)&unk_1EA0FF448 + v12), CFSTR("textContentTypeTag"));
            objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("contextBeforeInput"));
          }
        }
      }
    }
    v13 = -[TIProactiveTrigger initWithSourceType:attributes:]([TIProactiveTrigger alloc], "initWithSourceType:attributes:", 2, v9);

  }
  else
  {
    v13 = 0;
    v10 = v8;
  }

  return v13;
}

+ (id)buildSecureCandidateFrom:(id)a3 withSecureCandidateRenderer:(id)a4 input:(id)a5
{
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v27;
  __CFString *v28;
  __CFString *v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  id v41;
  __CFString *v42;
  NSObject *v43;
  _BOOL4 v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  id v51;
  __CFString *v52;
  __CFString *v53;
  NSObject *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v79;
  id v80;
  uint64_t v81;
  id v82;
  int v83;
  uint64_t v84;
  id v85;
  id obj;
  void *v87;
  __CFString *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  void *v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v82 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v85 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    v9 = 1;
    do
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "_string:matchesString:", v12, v14);

      v83 = (int)v10;
      if ((v10 & 1) == 0)
        break;
      ++v9;
    }
    while (v9 < objc_msgSend(v7, "count"));
  }
  else
  {
    v83 = 1;
  }
  objc_msgSend(v8, "_truncationSentinel");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = v7;
  v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
  if (v84)
  {
    v81 = *(_QWORD *)v96;
    v80 = v8;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v96 != v81)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v15);
        objc_msgSend(v16, "operationData");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = &stru_1EA1081D0;
        if (!v17)
        {
          objc_msgSend(v16, "value");
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v16, "label");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          v21 = objc_msgSend(v16, "shouldAggregate");

          if (v21)
          {
            objc_msgSend(v8, "localizedStringForKey:", CFSTR("LOCATION_AGGREGATED_NAME_AND_ADDRESS"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x1E0CB3940];
            v94 = 0;
            objc_msgSend(v16, "label");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "value");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@%@"), &v94, v24, v25);
            v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v27 = v94;
            v28 = &stru_1EA1081D0;
            if (v26)
              v28 = v26;
            v29 = v28;

            if (v27)
            {
              if (TICanLogMessageAtLevel_onceToken != -1)
                dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
              TIOSLogFacility();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: ERROR: invalid localized format for key LOCATION_AGGREGATED_NAME_AND_ADDRESS: %@"), "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v27);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v100 = v75;
                _os_log_debug_impl(&dword_1DA6F2000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

              }
            }

            v18 = v29;
          }
        }
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v72 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "value");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: Rendering results with value= %@"), "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v73);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v100 = v74;
            _os_log_debug_impl(&dword_1DA6F2000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        objc_msgSend(v8, "localizedStringForKey:", CFSTR("PARENTHESIZED_LABEL"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:", CFSTR("APP_CONNECTION_ATTRIBUTION"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(obj, "count") > 1)
          v32 = v83;
        else
          v32 = 0;
        v33 = objc_msgSend(v16, "flags");
        objc_msgSend(v16, "label");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "length"))
        {
          objc_msgSend(v16, "label");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("unlabeled"));

        }
        else
        {
          v36 = 1;
        }

        objc_msgSend(v16, "originatingBundleID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v37)
        {
          v39 = 0;
LABEL_48:
          v88 = 0;
          goto LABEL_49;
        }
        objc_msgSend(v16, "originatingBundleID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedApplicationNameWithBundleIdentifier:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
          goto LABEL_48;
        v93 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v89, CFSTR("%@"), &v93, v39);
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v41 = v93;
        v42 = &stru_1EA1081D0;
        if (v40)
          v42 = v40;
        v88 = v42;

        if (v41)
        {
          if (TICanLogMessageAtLevel_onceToken != -1)
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
          TIOSLogFacility();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: ERROR: invalid localized format for key APP_CONNECTION_ATTRIBUTION: %@"), "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v41);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v100 = v79;
            _os_log_debug_impl(&dword_1DA6F2000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }

LABEL_49:
        if (((v33 & 1) == 0) & ~v32 | v36 & 1)
        {
          v44 = 0;
          v45 = 0;
        }
        else
        {
          objc_msgSend(v16, "label");
          v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v45 = v55;
          v44 = v55 != 0;
          if ((v33 & 1) != 0 && v55)
          {
            v53 = v55;
            v45 = v53;
            goto LABEL_73;
          }
        }
        objc_msgSend(v16, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46 && v44)
        {
          v47 = (void *)MEMORY[0x1E0CB3940];
          v92 = 0;
          objc_msgSend(v16, "name");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringByAppendingString:", v87);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "stringWithValidatedFormat:validFormatSpecifiers:error:", v90, CFSTR("%@%@"), &v92, v49, v45);
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v51 = v92;
          v52 = &stru_1EA1081D0;
          if (v50)
            v52 = v50;
          v53 = v52;

          if (v51)
          {
            if (TICanLogMessageAtLevel_onceToken != -1)
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
            TIOSLogFacility();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              goto LABEL_93;
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        objc_msgSend(v16, "label");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56 && v39)
        {
          v57 = (void *)MEMORY[0x1E0CB3940];
          v91 = 0;
          objc_msgSend(v16, "label");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "stringByAppendingString:", v87);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithValidatedFormat:validFormatSpecifiers:error:", v90, CFSTR("%@%@"), &v91, v59, v88);
          v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v51 = v91;
          v61 = &stru_1EA1081D0;
          if (v60)
            v61 = v60;
          v53 = v61;

          if (v51)
          {
            if (TICanLogMessageAtLevel_onceToken != -1)
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
            TIOSLogFacility();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
LABEL_93:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s ProactiveQuickType:TI: ERROR: invalid localized format for key PARENTHESIZED_LABEL: %@"), "+[TIProactiveQuickTypeManager buildSecureCandidateFrom:withSecureCandidateRenderer:input:]", v51);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v100 = v76;
              _os_log_debug_impl(&dword_1DA6F2000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

            }
LABEL_71:

          }
LABEL_72:

          v8 = v80;
LABEL_73:
          objc_msgSend(v16, "value");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = -[__CFString isEqualToString:](v53, "isEqualToString:", v62);

          if (!v63)
            goto LABEL_75;
          goto LABEL_74;
        }
        objc_msgSend(v16, "label");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        if (v68 || !v39)
        {

        }
        else if (!objc_msgSend(v16, "itemType"))
        {
          v69 = v88;
          goto LABEL_90;
        }
        objc_msgSend(v16, "name");
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        if (v70)
        {
          objc_msgSend(v16, "name");
          v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v16, "label");
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v71)
          {
            v53 = 0;
            goto LABEL_74;
          }
          objc_msgSend(v16, "label");
          v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
LABEL_90:
        v53 = v69;
        if (v69)
          goto LABEL_73;
LABEL_74:

        v53 = &stru_1EA1081D0;
LABEL_75:
        objc_msgSend(v16, "value");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "flags") & 4) != 0)
        {
          objc_msgSend(v16, "label");
          v65 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "name");
          v66 = objc_claimAutoreleasedReturnValue();

          v53 = (__CFString *)v65;
          v64 = (void *)v66;
        }
        v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD8]), "initWithSecureHeader:secureContent:secureFormattedContent:input:truncationSentinel:", v53, v64, v18, v82, v87);
        if ((objc_msgSend(v85, "containsObject:", v67) & 1) == 0)
          objc_msgSend(v85, "addObject:", v67);

        ++v15;
      }
      while (v84 != v15);
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v101, 16);
      v84 = v77;
    }
    while (v77);
  }

  return v85;
}

void __48__TIProactiveQuickTypeManager_singletonInstance__block_invoke()
{
  TIProactiveQuickTypeManager *v0;
  void *v1;

  v0 = objc_alloc_init(TIProactiveQuickTypeManager);
  v1 = (void *)singletonInstance_singleton;
  singletonInstance_singleton = (uint64_t)v0;

}

- (TIProactiveQuickTypeManager)initWithICManager:(id)a3
{
  id v5;
  TIProactiveQuickTypeManager *v6;
  TIProactiveQuickTypeManager *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIProactiveQuickTypeManager;
  v6 = -[TIProactiveQuickTypeManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    -[TIProactiveQuickTypeManager _makeQueue](v6, "_makeQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_inputContextPredictionManager, a3);
    +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addActivityObserver:", v7);

  }
  return v7;
}

- (id)getLastSuggestionTime
{
  return self->_lastSuggestionTime;
}

+ (void)setSharedTIProactiveQuickTypeManager:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance_5998 != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance_5998, a3);
    v4 = v5;
  }

}

@end
