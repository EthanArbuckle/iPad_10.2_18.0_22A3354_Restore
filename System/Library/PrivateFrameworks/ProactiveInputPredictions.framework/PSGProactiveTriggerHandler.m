@implementation PSGProactiveTriggerHandler

- (PSGProactiveTriggerHandler)initWithBroker:(id)a3 cache:(id)a4
{
  id v7;
  id v8;
  PSGProactiveTriggerHandler *v9;
  PSGProactiveTriggerHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PSGProactiveTriggerHandler;
  v9 = -[PSGProactiveTriggerHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_broker, a3);
    objc_storeStrong((id *)&v10->_cache, a4);
  }

  return v10;
}

- (BOOL)_handleOperationalTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipientNames:(id)a6 availableApps:(id)a7 limit:(unint64_t)a8 explanationSet:(id)a9 results:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  int v26;
  __CFString *v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  PSGOperationalPredictedItem *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  PSGOperationalPredictedItem *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  PSGOperationalPredictedItem *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  PSGOperationalPredictedItem *v85;
  __CFString *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  PSGOperationalPredictedItem *v96;
  NSObject *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  PSGStructuredInfoSuggestion *v103;
  void *v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  __CFString *v115;
  BOOL v116;
  void *v117;
  id v118;
  void *v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint8_t v125[128];
  uint8_t buf[4];
  const __CFString *v127;
  PSGOperationalPredictedItem *v128;
  PSGOperationalPredictedItem *v129;
  PSGOperationalPredictedItem *v130;
  PSGOperationalPredictedItem *v131;
  _QWORD v132[3];

  v132[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v118 = a4;
  v120 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a9;
  v18 = a10;
  objc_msgSend(v14, "triggerAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKey:", *MEMORY[0x1E0D43428]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "triggerAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "valueForKey:", *MEMORY[0x1E0D43400]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "triggerAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("pov"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "triggerAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", *MEMORY[0x1E0D433D0]);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v15, "count");
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D43378])
    && objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D432C0])
    && objc_msgSend((id)objc_opt_class(), "_isCurrentLocationSupportedPlatform"))
  {
    if (objc_msgSend(v16, "containsObject:", CFSTR("com.apple.messages.currentLocation")))
    {
      v112 = (void *)objc_opt_new();
      objc_msgSend(v112, "setObject:forKey:", CFSTR("com.apple.messages.currentLocation"), CFSTR("bundleID"));
      v26 = objc_msgSend(v117, "containsString:", CFSTR("mirrored"));
      v27 = CFSTR("currentLocation");
      if (v26)
        v27 = CFSTR("requestLocation");
      v115 = v27;
      v28 = objc_msgSend(v117, "containsString:", CFSTR("mirrored"));
      psg_default_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v28)
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBD27000, v29, OS_LOG_TYPE_INFO, "[PSGProactiveTriggerHandler] Preparing prediction for requesting location.", buf, 2u);
        }

        if (v25 < 2)
        {
          +[PSGUtilities sharedInstance](PSGUtilities, "sharedInstance");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "localizedStringForKey:withLocale:", CFSTR("REQUEST_LOCATION_BUTTON_CAPTION"), v118);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          _PASValidatedFormat(v88, v89, v90, v91, v92, v93, v94, v95, (uint64_t)CFSTR(""));
          v110 = objc_claimAutoreleasedReturnValue();

          v96 = -[PSGOperationalPredictedItem initWithItemIdentifier:value:bundleIdentifier:operationData:]([PSGOperationalPredictedItem alloc], "initWithItemIdentifier:value:bundleIdentifier:operationData:", v115, v110, v120, v112);
          v132[0] = v96;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v86 = v115;
          v34 = (void *)v110;
          v33 = v112;
          goto LABEL_39;
        }
        psg_default_log_handle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBD27000, v31, OS_LOG_TYPE_INFO, "[PSGProactiveTriggerHandler] Request location predictions are not allowed for group chats", buf, 2u);
        }
        v32 = 0;
        v33 = v112;
        v34 = v31;
      }
      else
      {
        if (v30)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DBD27000, v29, OS_LOG_TYPE_INFO, "[PSGProactiveTriggerHandler] Preparing prediction for sharing location.", buf, 2u);
        }

        +[PSGUtilities sharedInstance](PSGUtilities, "sharedInstance");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "localizedStringForKey:withLocale:", CFSTR("SEND_CURRENT_LOCATION_BUTTON_CAPTION"), v118);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        _PASValidatedFormat(v77, v78, v79, v80, v81, v82, v83, v84, (uint64_t)CFSTR(""));
        v109 = objc_claimAutoreleasedReturnValue();

        v33 = v112;
        v85 = -[PSGOperationalPredictedItem initWithItemIdentifier:value:bundleIdentifier:operationData:]([PSGOperationalPredictedItem alloc], "initWithItemIdentifier:value:bundleIdentifier:operationData:", v115, v109, v120, v112);
        v131 = v85;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v131, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)v109;
      }
      v86 = v115;
LABEL_39:

LABEL_44:
      v116 = 1;
      goto LABEL_45;
    }
LABEL_43:
    objc_msgSend(v17, "pushInternalExplanationCode:", 2);
    v32 = 0;
    goto LABEL_44;
  }
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D87C30]))
  {
    if (objc_msgSend(v16, "containsObject:", CFSTR("com.apple.messages.surf")))
    {
      v113 = v22;
      v35 = v20;
      v36 = v17;
      v37 = v16;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKey:", CFSTR("com.apple.messages.surf"), CFSTR("bundleID"));
      objc_msgSend(v119, "objectForKey:", CFSTR("Currency"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(v38, "setObject:forKey:", v39, CFSTR("Currency"));
        v40 = -[PSGOperationalPredictedItem initWithItemIdentifier:value:bundleIdentifier:operationData:]([PSGOperationalPredictedItem alloc], "initWithItemIdentifier:value:bundleIdentifier:operationData:", CFSTR("surf"), CFSTR("Pay"), v120, v38);
        v130 = v40;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v130, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = 0;
      }

      v116 = 1;
      v16 = v37;
      v17 = v36;
      v20 = v35;
      v22 = v113;
      goto LABEL_45;
    }
    goto LABEL_43;
  }
  if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D87C40]))
  {
    if (objc_msgSend(v16, "containsObject:", CFSTR("com.apple.messages.photos")))
    {
      v41 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v14, "triggerAttributes");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dictionaryWithDictionary:", v42);
      v106 = v16;
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "setObject:forKey:", CFSTR("com.apple.messages.photos"), CFSTR("bundleID"));
      +[PSGUtilities sharedInstance](PSGUtilities, "sharedInstance");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:withLocale:", CFSTR("CHOOSE_PHOTOS_CAPTION"), v118);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      _PASValidatedFormat(v45, v46, v47, v48, v49, v50, v51, v52, (uint64_t)CFSTR(""));
      v53 = v22;
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = -[PSGOperationalPredictedItem initWithItemIdentifier:value:bundleIdentifier:operationData:]([PSGOperationalPredictedItem alloc], "initWithItemIdentifier:value:bundleIdentifier:operationData:", CFSTR("choosePhotos"), v54, v120, v43);
      v129 = v55;
      v116 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v129, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = v53;
      v56 = v120;
      v57 = v118;

      v16 = v106;
      goto LABEL_46;
    }
    goto LABEL_43;
  }
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("event")))
  {
    v56 = v120;
    v57 = v118;
    if (!objc_msgSend(v22, "isEqualToString:", CFSTR("traveling home"))
      || !objc_msgSend((id)objc_opt_class(), "_isCheckInSupportedPlatform"))
    {
      v116 = 0;
      v32 = 0;
      goto LABEL_46;
    }
    psg_default_log_handle();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBD27000, v58, OS_LOG_TYPE_DEFAULT, "SafetyMonitor: text input has a match", buf, 2u);
    }

    if (objc_msgSend(v16, "containsObject:", CFSTR("com.apple.SafetyMonitorApp.SafetyMonitorMessages")))
    {
      v108 = v17;
      v59 = v16;
      v60 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v14, "triggerAttributes");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "dictionaryWithDictionary:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = (void *)objc_msgSend(CFSTR("com.apple.SafetyMonitorApp.SafetyMonitorMessages"), "copy");
      objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, CFSTR("bundleID"));

      +[PSGUtilities sharedInstance](PSGUtilities, "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "localizedStringForKey:withLocale:", CFSTR("START_CHECK_IN_SESSION_CAPTION"), v118);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      _PASValidatedFormat(v65, v66, v67, v68, v69, v70, v71, v72, (uint64_t)CFSTR(""));
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = -[PSGOperationalPredictedItem initWithItemIdentifier:value:bundleIdentifier:operationData:]([PSGOperationalPredictedItem alloc], "initWithItemIdentifier:value:bundleIdentifier:operationData:", CFSTR("start check-in"), v73, v120, v62);
      v128 = v74;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      psg_default_log_handle();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DBD27000, v75, OS_LOG_TYPE_DEFAULT, "SafetyMonitor: predicted item formed", buf, 2u);
      }

      v116 = 1;
      v16 = v59;
      v17 = v108;
      goto LABEL_45;
    }
    psg_default_log_handle();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v127 = CFSTR("com.apple.SafetyMonitorApp.SafetyMonitorMessages");
      _os_log_impl(&dword_1DBD27000, v97, OS_LOG_TYPE_DEFAULT, "SafetyMonitor: ignoring the trigger -- %@ not supported", buf, 0xCu);
    }

    goto LABEL_43;
  }
  v116 = 0;
  v32 = 0;
LABEL_45:
  v56 = v120;
  v57 = v118;
LABEL_46:
  if (objc_msgSend(v32, "count"))
  {
    v111 = v17;
    v114 = v22;
    v105 = v20;
    v107 = v16;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v98 = v32;
    v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
    if (v99)
    {
      v100 = v99;
      v101 = *(_QWORD *)v122;
      do
      {
        for (i = 0; i != v100; ++i)
        {
          if (*(_QWORD *)v122 != v101)
            objc_enumerationMutation(v98);
          v103 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:]([PSGStructuredInfoSuggestion alloc], "initWithProactiveTrigger:portraitItem:operationalItem:", v14, 0, *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * i));
          objc_msgSend(v18, "addObject:", v103);

        }
        v100 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v121, v125, 16);
      }
      while (v100);
    }

    v56 = v120;
    v16 = v107;
    v17 = v111;
    v20 = v105;
    v22 = v114;
  }

  return v116;
}

- (id)_handlePortraitTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipients:(id)a6 limit:(unint64_t)a7 timeoutSeconds:(double)a8 explanationSet:(id)a9 results:(id)a10
{
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  dispatch_semaphore_t v30;
  NSObject *v31;
  PPQuickTypeBroker *broker;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  PSGStructuredInfoSuggestion *v47;
  NSObject *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  NSObject *v60;
  uint8_t *v61;
  uint8_t v62[8];
  uint8_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  _BYTE v68[128];
  const __CFString *v69;
  id v70;
  uint8_t buf[4];
  id v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v50 = a4;
  v52 = a5;
  v53 = a6;
  v51 = a9;
  v18 = a10;
  objc_msgSend(v17, "triggerCategory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v19, "isEqualToString:", CFSTR("TaggedTextFieldContactsAutocomplete"));

  if (!(_DWORD)a6)
  {
    v28 = (void *)MEMORY[0x1E0D70C20];
    objc_msgSend(v17, "triggerAttributes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "quickTypeQueryFromLMTokens:localeIdentifier:recipients:bundleIdentifier:", v29, v50, v53, v52);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "triggerSourceType") == 1 || objc_msgSend(v17, "triggerSourceType") == 4)
      objc_msgSend(v27, "setTimeoutSeconds:", &unk_1EA3F4830);
LABEL_7:
    *(_QWORD *)v62 = 0;
    v63 = v62;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__292;
    v66 = __Block_byref_object_dispose__293;
    v67 = 0;
    v30 = dispatch_semaphore_create(0);
    psg_default_log_handle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBD27000, v31, OS_LOG_TYPE_DEFAULT, "Kicking off Portrait XPC", buf, 2u);
    }

    broker = self->_broker;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke;
    v58[3] = &unk_1EA3F0D38;
    v61 = v62;
    v33 = v51;
    v59 = v33;
    v34 = v30;
    v60 = v34;
    -[PPQuickTypeBroker quickTypeItemsWithQuery:limit:completion:](broker, "quickTypeItemsWithQuery:limit:completion:", v27, a7, v58);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "triggerAttributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D432C8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v35, "isEqual:", v37);

    if (v38)
    {
      psg_default_log_handle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1DBD27000, v39, OS_LOG_TYPE_DEBUG, "Handling a priming token. Skip waiting for async call.", buf, 2u);
      }

      objc_msgSend(v33, "pushInternalExplanationCode:", 3);
      goto LABEL_13;
    }
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v34, a8) == 1)
    {
      v41 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%.3f"), *(_QWORD *)&a8);
      psg_default_log_handle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v41;
        _os_log_error_impl(&dword_1DBD27000, v42, OS_LOG_TYPE_ERROR, "Portrait timeout (threshold: %@ s)", buf, 0xCu);
      }

      objc_msgSend(v33, "pushInternalExplanationCode:", 1);
      v43 = (void *)MEMORY[0x1E0CB35C8];
      v69 = CFSTR("thresholdSecs");
      v70 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("PSGErrorDomain"), 1, v44);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!objc_msgSend(*((id *)v63 + 5), "count"))
      {
LABEL_13:
        v40 = 0;
LABEL_27:

        _Block_object_dispose(v62, 8);
        v21 = v27;
        goto LABEL_28;
      }
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v41 = *((id *)v63 + 5);
      v40 = (void *)objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      if (v40)
      {
        v45 = *(_QWORD *)v55;
        do
        {
          v46 = 0;
          do
          {
            if (*(_QWORD *)v55 != v45)
              objc_enumerationMutation(v41);
            v47 = -[PSGStructuredInfoSuggestion initWithProactiveTrigger:portraitItem:operationalItem:]([PSGStructuredInfoSuggestion alloc], "initWithProactiveTrigger:portraitItem:operationalItem:", v17, *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)v46), 0);
            objc_msgSend(v18, "addObject:", v47);

            v46 = (char *)v46 + 1;
          }
          while (v40 != v46);
          v40 = (void *)objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        }
        while (v40);
      }
    }

    goto LABEL_27;
  }
  objc_msgSend(v17, "triggerAttributes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SearchField"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "unsignedIntegerValue");
  objc_msgSend(v17, "triggerAttributes");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("SearchTerm"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
  {
    v25 = (void *)MEMORY[0x1E0D70C20];
    v73[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "quickTypeQueryWithType:subtype:semanticTag:fields:time:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 1, 12, 0, v22, 0, 0, 0, v26, v50, v52, v53);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setTimeoutSeconds:", &unk_1EA3F4820);
    goto LABEL_7;
  }
  psg_default_log_handle();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v62 = 0;
    _os_log_fault_impl(&dword_1DBD27000, v49, OS_LOG_TYPE_FAULT, "Search term not specified for Contacts Autocomplete trigger.", v62, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PSGErrorDomain"), 2, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  return v40;
}

- (id)handleTrigger:(id)a3 localeIdentifier:(id)a4 bundleIdentifier:(id)a5 recipients:(id)a6 recipientNames:(id)a7 availableApps:(id)a8 timeoutSeconds:(double)a9 fetchLimit:(unint64_t)a10 maxSuggestions:(unint64_t)a11 explanationSet:(id)a12 error:(id *)a13
{
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  PSGProactiveTrigger **p_lastTrigger;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  char v43;
  __CFString *v44;
  NSObject *v45;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  _BOOL4 v50;
  os_log_t log;
  NSObject *loga;
  void *v53;
  void *v54;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v56 = a7;
  v57 = a8;
  v58 = a12;
  objc_msgSend(v20, "triggerAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", *MEMORY[0x1E0D43428]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "triggerAttributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D43400]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = v25;
  v54 = v27;
  if ((objc_msgSend(v25, "isEqualToString:", CFSTR("triggerTypeConnections")) & 1) != 0
    || (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D433E0]) & 1) != 0
    || objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D433D8]))
  {
    psg_default_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v60 = (uint64_t)v20;
      _os_log_impl(&dword_1DBD27000, v28, OS_LOG_TYPE_INFO, "Skip structured info cache lookup for %@", buf, 0xCu);
    }
    v29 = v23;
    goto LABEL_7;
  }
  -[PSGStructuredInfoSuggestionCache searchWithTrigger:localeIdentifier:maxSuggestions:](self->_cache, "searchWithTrigger:localeIdentifier:maxSuggestions:", v20, v21, a11);
  v28 = objc_claimAutoreleasedReturnValue();
  if (-[NSObject count](v28, "count"))
  {
    psg_default_log_handle();
    v42 = objc_claimAutoreleasedReturnValue();
    v29 = v23;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v60 = -[NSObject count](v28, "count");
      _os_log_impl(&dword_1DBD27000, v42, OS_LOG_TYPE_INFO, "Returning %tu item(s) from structured info cache.", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_lastTrigger, a3);
    v28 = v28;
    v41 = v28;
LABEL_28:
    v32 = v56;
    goto LABEL_39;
  }
  +[PSGStructuredInfoSuggestionCache emptySuggestionsPlaceholder](PSGStructuredInfoSuggestionCache, "emptySuggestionsPlaceholder");
  v49 = objc_claimAutoreleasedReturnValue();

  psg_default_log_handle();
  loga = objc_claimAutoreleasedReturnValue();
  v50 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
  v29 = v23;
  if (v28 == v49)
  {
    if (v50)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBD27000, loga, OS_LOG_TYPE_INFO, "Returning nil since we get empty placeholder from structured info cache.", buf, 2u);
    }

    objc_storeStrong((id *)&self->_lastTrigger, a3);
    v41 = 0;
    goto LABEL_28;
  }
  if (v50)
  {
    *(_DWORD *)buf = 138412290;
    v60 = (uint64_t)v20;
    _os_log_impl(&dword_1DBD27000, loga, OS_LOG_TYPE_INFO, "Cache lookup returns nothing for %@", buf, 0xCu);
  }

LABEL_7:
  objc_msgSend(v20, "triggerCategory");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28 != CFSTR("TaggedTextFieldContactsAutocomplete"))
  {
LABEL_8:

    goto LABEL_10;
  }
  p_lastTrigger = &self->_lastTrigger;
  -[PSGProactiveTrigger triggerCategory](self->_lastTrigger, "triggerCategory");
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v31 != CFSTR("TaggedTextFieldContactsAutocomplete"))
  {
LABEL_10:
    v28 = objc_opt_new();
    v32 = v56;
    if (!-[PSGProactiveTriggerHandler _handleOperationalTrigger:localeIdentifier:bundleIdentifier:recipientNames:availableApps:limit:explanationSet:results:](self, "_handleOperationalTrigger:localeIdentifier:bundleIdentifier:recipientNames:availableApps:limit:explanationSet:results:", v20, v21, v22, v56, v57, a10, v58, v28))
    {
      -[PSGProactiveTriggerHandler _handlePortraitTrigger:localeIdentifier:bundleIdentifier:recipients:limit:timeoutSeconds:explanationSet:results:](self, "_handlePortraitTrigger:localeIdentifier:bundleIdentifier:recipients:limit:timeoutSeconds:explanationSet:results:", v20, v21, v22, v29, a10, v58, a9, v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (a13 && v33)
        *a13 = objc_retainAutorelease(v33);

    }
    if (!-[NSObject count](v28, "count"))
    {
      objc_msgSend(v20, "triggerCategory");
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v35 == CFSTR("TaggedTextFieldContactsAutocomplete"))
      {
        v43 = objc_msgSend(v58, "hasContactsServingError");

        if ((v43 & 1) == 0)
        {
          -[PSGStructuredInfoSuggestionCache addEmptyPlaceholderForTrigger:localeIdentifier:](self->_cache, "addEmptyPlaceholderForTrigger:localeIdentifier:", v20, v21);
LABEL_35:
          objc_storeStrong((id *)&self->_lastTrigger, a3);
          if (-[NSObject count](v28, "count") <= a11)
          {
            v45 = v28;
            v28 = v45;
          }
          else
          {
            -[NSObject subarrayWithRange:](v28, "subarrayWithRange:", 0);
            v45 = objc_claimAutoreleasedReturnValue();
          }
          v41 = v45;
          goto LABEL_39;
        }
      }
      else
      {

      }
    }
    if (-[NSObject count](v28, "count") && objc_msgSend(v20, "triggerSourceType") != 5)
    {
      -[PSGStructuredInfoSuggestionCache addStructuredInfoSuggestions:localeIdentifier:](self->_cache, "addStructuredInfoSuggestions:localeIdentifier:", v28, v21);
    }
    else
    {
      objc_msgSend(v20, "triggerCategory");
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v44 != CFSTR("TaggedTextFieldContactsAutocomplete"))
        -[PSGStructuredInfoSuggestionCache invalidate](self->_cache, "invalidate");
    }
    goto LABEL_35;
  }
  log = v22;
  objc_msgSend(v20, "triggerAttributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSGProactiveTrigger getSearchTerm:](PSGProactiveTrigger, "getSearchTerm:", v36);
  v28 = objc_claimAutoreleasedReturnValue();

  -[PSGProactiveTrigger triggerAttributes](*p_lastTrigger, "triggerAttributes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSGProactiveTrigger getSearchTerm:](PSGProactiveTrigger, "getSearchTerm:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)-[NSObject length](v28, "length") < 3
    || !objc_msgSend(v38, "length")
    || !-[NSObject hasPrefix:](v28, "hasPrefix:", v38))
  {
    psg_default_log_handle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = -[NSObject length](v28, "length");
      *(_DWORD *)buf = 134217984;
      v60 = v48;
      _os_log_impl(&dword_1DBD27000, v47, OS_LOG_TYPE_DEFAULT, "Contacts Autocomplete query name length: %tu", buf, 0xCu);
    }

    v22 = log;
    v29 = v23;
    goto LABEL_8;
  }
  v39 = v38;
  psg_default_log_handle();
  v40 = objc_claimAutoreleasedReturnValue();
  v29 = v23;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DBD27000, v40, OS_LOG_TYPE_INFO, "Skipping Portrait XPC: no cached results for long Contacts Autocomplete query.", buf, 2u);
  }

  objc_msgSend(v58, "pushInternalExplanationCode:", 6);
  objc_storeStrong((id *)p_lastTrigger, a3);

  v41 = 0;
  v22 = log;
  v32 = v56;
  v25 = v53;
LABEL_39:

  return v41;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTrigger, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_broker, 0);
}

void __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  psg_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v14 = objc_msgSend(v5, "count");
    v15 = 2048;
    v16 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1DBD27000, v7, OS_LOG_TYPE_DEFAULT, "Portrait XPC returns %tu item(s) and %tu explanation(s)", buf, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke_60;
  v11[3] = &unk_1EA3F0D10;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v6, "enumerateWithBlock:", v11);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __142__PSGProactiveTriggerHandler__handlePortraitTrigger_localeIdentifier_bundleIdentifier_recipients_limit_timeoutSeconds_explanationSet_results___block_invoke_60(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  psg_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D70C10], "stringFromExplanation:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DBD27000, v4, OS_LOG_TYPE_DEFAULT, "Portrait Exp Code: %@", (uint8_t *)&v7, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "pushPortraitExplanationCode:", a2);
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_350 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_350, &__block_literal_global_351);
  return (id)sharedInstance__pasExprOnceResult_352;
}

+ (BOOL)_isCurrentLocationSupportedPlatform
{
  return 1;
}

+ (BOOL)_isCheckInSupportedPlatform
{
  return 1;
}

void __44__PSGProactiveTriggerHandler_sharedInstance__block_invoke()
{
  void *v0;
  PSGProactiveTriggerHandler *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  v1 = [PSGProactiveTriggerHandler alloc];
  objc_msgSend(MEMORY[0x1E0D70C08], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSGStructuredInfoSuggestionCache sharedInstance](PSGStructuredInfoSuggestionCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSGProactiveTriggerHandler initWithBroker:cache:](v1, "initWithBroker:cache:", v2, v3);
  v5 = (void *)sharedInstance__pasExprOnceResult_352;
  sharedInstance__pasExprOnceResult_352 = v4;

  objc_autoreleasePoolPop(v0);
}

@end
