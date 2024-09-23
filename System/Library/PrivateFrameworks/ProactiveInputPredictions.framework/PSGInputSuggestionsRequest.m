@implementation PSGInputSuggestionsRequest

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 responseKitConversationTurns:(id)a5 adaptationContextID:(id)a6 shouldDisableAutoCaps:(BOOL)a7 isResponseContextBlacklisted:(BOOL)a8 contextBeforeInput:(id)a9 markedText:(id)a10 selectedText:(id)a11 contextAfterInput:(id)a12 selectedRangeInMarkedText:(_NSRange)a13 localeIdentifier:(id)a14 bundleIdentifier:(id)a15 recipients:(id)a16 recipientNames:(id)a17 textContentType:(id)a18 availableApps:(id)a19 textualResponseLimit:(unint64_t)a20 structuredInfoLimit:(unint64_t)a21 totalSuggestionsLimit:(unint64_t)a22 initiatingProcess:(id)a23
{
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  PSGInputSuggestionsRequest *v36;
  PSGInputSuggestionsRequest *v37;
  BOOL v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v52;
  id v53;
  id v54;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;

  v65 = a3;
  v52 = a4;
  v26 = a4;
  v53 = a5;
  v61 = a5;
  v54 = a6;
  v60 = a6;
  v27 = a9;
  v28 = v26;
  v63 = a10;
  v64 = a11;
  v62 = a12;
  v29 = v65;
  v59 = a14;
  v30 = a15;
  v31 = a16;
  v32 = a17;
  v33 = a18;
  v34 = a19;
  v35 = a23;
  v66.receiver = self;
  v66.super_class = (Class)PSGInputSuggestionsRequest;
  v36 = -[PSGInputSuggestionsRequest init](&v66, sel_init);
  v37 = v36;
  if (v36)
  {
    v58 = v28;
    objc_storeStrong((id *)&v36->_responseContext, a3);
    objc_storeStrong((id *)&v37->_conversationTurns, v52);
    objc_storeStrong((id *)&v37->_responseKitConversationTurns, v53);
    objc_storeStrong((id *)&v37->_adaptationContextID, v54);
    v37->_shouldDisableAutoCaps = a7;
    v37->_isResponseContextBlacklisted = a8;
    objc_storeStrong((id *)&v37->_contextBeforeInput, a9);
    objc_storeStrong((id *)&v37->_markedText, a10);
    objc_storeStrong((id *)&v37->_selectedText, a11);
    objc_storeStrong((id *)&v37->_contextAfterInput, a12);
    v37->_selectedRangeInMarkedText = a13;
    v49 = v34;
    v50 = v33;
    v47 = v31;
    v48 = v35;
    if (objc_msgSend(v27, "length") || objc_msgSend(v64, "length"))
    {
      v38 = 0;
      v39 = a23;
      v40 = v65;
      v42 = a18;
      v41 = a19;
      v43 = a17;
    }
    else
    {
      v39 = a23;
      v40 = v65;
      v42 = a18;
      v41 = a19;
      v43 = a17;
      if (objc_msgSend(v63, "length"))
        v38 = 0;
      else
        v38 = objc_msgSend(v62, "length") == 0;
    }
    v37->_isDocumentEmpty = v38;
    objc_storeStrong((id *)&v37->_localeIdentifier, a14);
    objc_storeStrong((id *)&v37->_bundleIdentifier, a15);
    objc_storeStrong((id *)&v37->_recipients, a16);
    objc_storeStrong((id *)&v37->_recipientNames, v43);
    objc_storeStrong((id *)&v37->_textContentType, v42);
    objc_storeStrong((id *)&v37->_availableApps, v41);
    v44 = a20;
    if (a20 >= a22)
      v44 = a22;
    if (a21 >= a22)
      v45 = a22;
    else
      v45 = a21;
    v37->_textualResponseLimit = v44;
    v37->_structuredInfoLimit = v45;
    v37->_totalSuggestionsLimit = a22;
    objc_storeStrong((id *)&v37->_initiatingProcess, v39);
    v28 = v58;
    v33 = v50;
    v29 = v40;
    v31 = v47;
    v35 = v48;
    v34 = v49;
  }

  return v37;
}

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 responseKitConversationTurns:(id)a5 adaptationContextID:(id)a6 shouldDisableAutoCaps:(BOOL)a7 isResponseContextBlacklisted:(BOOL)a8 contextBeforeInput:(id)a9 markedText:(id)a10 selectedText:(id)a11 contextAfterInput:(id)a12 selectedRangeInMarkedText:(_NSRange)a13 localeIdentifier:(id)a14 bundleIdentifier:(id)a15 recipients:(id)a16 recipientNames:(id)a17 textContentType:(id)a18 availableApps:(id)a19 textualResponseLimit:(unint64_t)a20 structuredInfoLimit:(unint64_t)a21 totalSuggestionsLimit:(unint64_t)a22
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  PSGInputSuggestionsRequest *v28;
  id v30;
  uint64_t v31;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _BOOL4 v42;
  _BOOL4 v43;
  id v45;
  id v46;
  id v47;

  v42 = a7;
  v43 = a8;
  v31 = initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasOnceToken4;
  v40 = a19;
  v35 = a18;
  v39 = a17;
  v38 = a16;
  v23 = a15;
  v37 = a14;
  v36 = a12;
  v24 = a11;
  v25 = a10;
  v47 = a9;
  v46 = a6;
  v45 = a5;
  v26 = a4;
  v27 = a3;
  if (v31 != -1)
  {
    v30 = v27;
    dispatch_once(&initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasOnceToken4, &__block_literal_global_91);
    v27 = v30;
  }
  v34 = v27;
  v28 = -[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:", v27, v26, v45, v46, v42, v43, v47, v25, v24, v36, a13.location, a13.length, v37, v23,
          v38,
          v39,
          v35,
          v40,
          a20,
          a21,
          a22,
          initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasExprOnceResult);

  return v28;
}

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 adaptationContextID:(id)a5 shouldDisableAutoCaps:(BOOL)a6 isResponseContextBlacklisted:(BOOL)a7 contextBeforeInput:(id)a8 markedText:(id)a9 selectedText:(id)a10 contextAfterInput:(id)a11 selectedRangeInMarkedText:(_NSRange)a12 localeIdentifier:(id)a13 bundleIdentifier:(id)a14 recipients:(id)a15 textContentType:(id)a16 availableApps:(id)a17 textualResponseLimit:(unint64_t)a18 structuredInfoLimit:(unint64_t)a19
{
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _BOOL4 v46;
  _BOOL4 v47;
  PSGInputSuggestionsRequest *v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v46 = a6;
  v47 = a7;
  v57 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v22 = a4;
  v50 = a5;
  v49 = a8;
  v44 = a9;
  v43 = a10;
  v42 = a11;
  v41 = a13;
  v40 = a14;
  v39 = a15;
  v38 = a16;
  v37 = a17;
  v23 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        objc_msgSend(v29, "text");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = objc_alloc(MEMORY[0x1E0D197C0]);
          objc_msgSend(v29, "text");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "senderId");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timestamp");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(v31, "initWithText:senderID:timestamp:", v32, v33, v34);
          objc_msgSend(v23, "addObject:", v35);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v26);
  }

  v48 = -[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:", v51, v23, v24, v50, v46, v47, v49, v44, v43, v42, a12.location, a12.length, v41, v40,
          v39,
          0,
          v38,
          v37,
          a18,
          a19,
          3);

  return v48;
}

- (PSGInputSuggestionsRequest)initWithResponseContext:(id)a3 conversationTurns:(id)a4 adaptationContextID:(id)a5 shouldDisableAutoCaps:(BOOL)a6 isResponseContextBlacklisted:(BOOL)a7 contextBeforeInput:(id)a8 markedText:(id)a9 selectedText:(id)a10 contextAfterInput:(id)a11 selectedRangeInMarkedText:(_NSRange)a12 localeIdentifier:(id)a13 bundleIdentifier:(id)a14 recipients:(id)a15 recipientNames:(id)a16 textContentType:(id)a17 availableApps:(id)a18 textualResponseLimit:(unint64_t)a19 structuredInfoLimit:(unint64_t)a20 totalSuggestionsLimit:(unint64_t)a21
{
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _BOOL4 v48;
  _BOOL4 v49;
  PSGInputSuggestionsRequest *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v48 = a6;
  v49 = a7;
  v60 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v24 = a4;
  v53 = a5;
  v52 = a8;
  v51 = a9;
  v46 = a10;
  v45 = a11;
  v44 = a13;
  v43 = a14;
  v42 = a15;
  v41 = a16;
  v40 = a17;
  v39 = a18;
  v25 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v26 = v24;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v56 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v31, "text");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v33 = objc_alloc(MEMORY[0x1E0D197C0]);
          objc_msgSend(v31, "text");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "senderId");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "timestamp");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v33, "initWithText:senderID:timestamp:", v34, v35, v36);
          objc_msgSend(v25, "addObject:", v37);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v28);
  }

  v50 = -[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:", v54, v25, v26, v53, v48, v49, v52, v51, v46, v45, a12.location, a12.length, v44, v43,
          v42,
          v41,
          v40,
          v39,
          a19,
          a20,
          a21);

  return v50;
}

- (PSGInputSuggestionsRequest)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  PSGInputSuggestionsRequest *v60;
  PSGInputSuggestionsRequest *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v87;
  id obj;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v4;
  objc_msgSend(v6, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v4, CFSTR("ctx"), v3, 0, CFSTR("PSGErrorDomain"), 3, v7);
  v87 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D81610];
  v9 = (void *)MEMORY[0x1DF0B9950]();
  v83 = v5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), v5, 0);
  objc_autoreleasePoolPop(v9);
  psg_default_log_handle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v10, CFSTR("cvt"), v3, 0, CFSTR("PSGErrorDomain"), 3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v90;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v90 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
        v19 = objc_alloc(MEMORY[0x1E0D87C00]);
        objc_msgSend(v18, "text");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "senderID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timestamp");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v19, "initWithString:senderID:timestamp:", v20, v21, v22);

        if (!v23)
        {
          v60 = 0;
          v62 = obj;
          v63 = obj;
          v61 = self;
          v59 = (void *)v87;
          goto LABEL_17;
        }
        objc_msgSend(v13, "addObject:", v23);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
      if (v15)
        continue;
      break;
    }
  }

  v24 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("aci"), v3, 0, CFSTR("PSGErrorDomain"), 3, v25);
  v76 = objc_claimAutoreleasedReturnValue();

  v73 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("dac"));
  v72 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("rcb"));
  v26 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("cbi"), v3, 0, CFSTR("PSGErrorDomain"), 3, v27);
  v75 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("mkt"), v3, 0, CFSTR("PSGErrorDomain"), 3, v29);
  v74 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("stt"), v3, 0, CFSTR("PSGErrorDomain"), 3, v31);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("cai"), v3, 0, CFSTR("PSGErrorDomain"), 3, v33);
  v81 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("loc"));
  v70 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("len"));
  v34 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("lid"), v3, 0, CFSTR("PSGErrorDomain"), 3, v35);
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("bid"), v3, 0, CFSTR("PSGErrorDomain"), 3, v37);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0D81610];
  v39 = (void *)MEMORY[0x1DF0B9950]();
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v85, v83, 0);
  objc_autoreleasePoolPop(v39);
  psg_default_log_handle();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v40, CFSTR("rts"), v3, 0, CFSTR("PSGErrorDomain"), 3, v41);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0D81610];
  v43 = (void *)MEMORY[0x1DF0B9950]();
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v85, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v43);
  psg_default_log_handle();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v44, CFSTR("rns"), v3, 0, CFSTR("PSGErrorDomain"), 3, v45);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("tct"), v3, 0, CFSTR("PSGErrorDomain"), 3, v47);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = (void *)MEMORY[0x1E0D81610];
  v49 = (void *)MEMORY[0x1DF0B9950]();
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v85, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v49);
  psg_default_log_handle();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v50, CFSTR("app"), v3, 0, CFSTR("PSGErrorDomain"), 3, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("txtl"));
  v53 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("strl"));
  v54 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("tsgl"));
  v55 = (void *)MEMORY[0x1E0D81610];
  psg_default_log_handle();
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v85, CFSTR("ipr"), v3, 1, CFSTR("PSGErrorDomain"), 3, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    objc_msgSend(v3, "error");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = (void *)v87;
    if (!v58)
    {
      v68 = v54;
      v67 = v53;
      v65 = (void *)v74;
      v64 = (void *)v75;
      v63 = (void *)v76;
      v61 = objc_retain(-[PSGInputSuggestionsRequest initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:](self, "initWithResponseContext:conversationTurns:responseKitConversationTurns:adaptationContextID:shouldDisableAutoCaps:isResponseContextBlacklisted:contextBeforeInput:markedText:selectedText:contextAfterInput:selectedRangeInMarkedText:localeIdentifier:bundleIdentifier:recipients:recipientNames:textContentType:availableApps:textualResponseLimit:structuredInfoLimit:totalSuggestionsLimit:initiatingProcess:", v87, obj, v13, v76, v73, v72, v75, v74, v82, v81, v71, v70, v80,
                v79,
                v84,
                v78,
                v77,
                v52,
                v69,
                v67,
                v68,
                v57));
      v60 = v61;
      goto LABEL_16;
    }
    v60 = 0;
    v61 = self;
  }
  else
  {
    v60 = 0;
    v61 = self;
    v59 = (void *)v87;
  }
  v64 = (void *)v75;
  v63 = (void *)v76;
  v65 = (void *)v74;
LABEL_16:

  v62 = obj;
LABEL_17:

  return v60;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *responseContext;
  id v5;

  responseContext = self->_responseContext;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", responseContext, CFSTR("ctx"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conversationTurns, CFSTR("cvt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adaptationContextID, CFSTR("aci"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldDisableAutoCaps, CFSTR("dac"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isResponseContextBlacklisted, CFSTR("rcb"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextBeforeInput, CFSTR("cbi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_markedText, CFSTR("mkt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedText, CFSTR("stt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextAfterInput, CFSTR("cai"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_selectedRangeInMarkedText.location, CFSTR("loc"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_selectedRangeInMarkedText.length, CFSTR("len"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localeIdentifier, CFSTR("lid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipients, CFSTR("rts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientNames, CFSTR("rns"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_textContentType, CFSTR("tct"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableApps, CFSTR("app"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_textualResponseLimit, CFSTR("txtl"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_structuredInfoLimit, CFSTR("strl"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_totalSuggestionsLimit, CFSTR("tsgl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initiatingProcess, CFSTR("ipr"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;

  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = -[NSString copyWithZone:](self->_responseContext, "copyWithZone:", a3);
    v7 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v6;

    v8 = -[NSArray copyWithZone:](self->_conversationTurns, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v8;

    v10 = -[NSArray copyWithZone:](self->_responseKitConversationTurns, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v10;

    v12 = -[NSString copyWithZone:](self->_adaptationContextID, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v12;

    *(_BYTE *)(v5 + 8) = self->_shouldDisableAutoCaps;
    *(_BYTE *)(v5 + 9) = self->_isResponseContextBlacklisted;
    v14 = -[NSString copyWithZone:](self->_contextBeforeInput, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v14;

    v16 = -[NSString copyWithZone:](self->_markedText, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v16;

    v18 = -[NSString copyWithZone:](self->_selectedText, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v18;

    v20 = -[NSString copyWithZone:](self->_contextAfterInput, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v20;

    *(_NSRange *)(v5 + 160) = self->_selectedRangeInMarkedText;
    *(_BYTE *)(v5 + 10) = self->_isDocumentEmpty;
    v22 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v22;

    v24 = -[NSString copyWithZone:](self->_bundleIdentifier, "copyWithZone:", a3);
    v25 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v24;

    v26 = -[NSArray copyWithZone:](self->_recipients, "copyWithZone:", a3);
    v27 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v26;

    v28 = -[NSSet copyWithZone:](self->_recipientNames, "copyWithZone:", a3);
    v29 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v28;

    v30 = -[NSString copyWithZone:](self->_textContentType, "copyWithZone:", a3);
    v31 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v30;

    v32 = -[NSSet copyWithZone:](self->_availableApps, "copyWithZone:", a3);
    v33 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v32;

    *(_QWORD *)(v5 + 120) = self->_textualResponseLimit;
    *(_QWORD *)(v5 + 128) = self->_structuredInfoLimit;
    *(_QWORD *)(v5 + 136) = self->_totalSuggestionsLimit;
    objc_storeStrong((id *)(v5 + 152), self->_initiatingProcess);
  }
  return (id)v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id *v4;
  id *v5;
  NSString *responseContext;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSArray *conversationTurns;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  char v15;
  NSUInteger v16;
  NSString *adaptationContextID;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSString *contextBeforeInput;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  NSString *markedText;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  char v31;
  NSString *selectedText;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;
  NSString *contextAfterInput;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  char v41;
  char v42;
  NSString *localeIdentifier;
  NSString *v44;
  NSString *v45;
  NSString *v46;
  char v47;
  NSString *bundleIdentifier;
  NSString *v49;
  NSString *v50;
  NSString *v51;
  char v52;
  NSArray *recipients;
  NSArray *v54;
  NSArray *v55;
  NSArray *v56;
  char v57;
  NSSet *recipientNames;
  NSSet *v59;
  NSSet *v60;
  NSSet *v61;
  char v62;
  NSString *textContentType;
  NSString *v64;
  NSString *v65;
  NSString *v66;
  char v67;
  NSSet *availableApps;
  NSSet *v69;
  NSSet *v70;
  NSSet *v71;
  char v72;
  NSString *v73;
  NSString *v74;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_65;
  responseContext = self->_responseContext;
  v7 = (NSString *)v4[2];
  if (responseContext == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = responseContext;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_65;
  }
  conversationTurns = self->_conversationTurns;
  v12 = (NSArray *)v5[3];
  if (conversationTurns == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = conversationTurns;
    v15 = -[NSArray isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_65;
  }
  v16 = -[NSArray count](self->_responseKitConversationTurns, "count");
  if (v16 != objc_msgSend(v5[18], "count"))
    goto LABEL_65;
  adaptationContextID = self->_adaptationContextID;
  v18 = (NSString *)v5[4];
  if (adaptationContextID == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = adaptationContextID;
    v21 = -[NSString isEqual:](v20, "isEqual:", v19);

    if ((v21 & 1) == 0)
      goto LABEL_65;
  }
  if (self->_shouldDisableAutoCaps != *((unsigned __int8 *)v5 + 8)
    || self->_isResponseContextBlacklisted != *((unsigned __int8 *)v5 + 9))
  {
    goto LABEL_65;
  }
  contextBeforeInput = self->_contextBeforeInput;
  v23 = (NSString *)v5[5];
  if (contextBeforeInput == v23)
  {

  }
  else
  {
    v24 = v23;
    v25 = contextBeforeInput;
    v26 = -[NSString isEqual:](v25, "isEqual:", v24);

    if ((v26 & 1) == 0)
      goto LABEL_65;
  }
  markedText = self->_markedText;
  v28 = (NSString *)v5[6];
  if (markedText == v28)
  {

  }
  else
  {
    v29 = v28;
    v30 = markedText;
    v31 = -[NSString isEqual:](v30, "isEqual:", v29);

    if ((v31 & 1) == 0)
      goto LABEL_65;
  }
  selectedText = self->_selectedText;
  v33 = (NSString *)v5[7];
  if (selectedText == v33)
  {

  }
  else
  {
    v34 = v33;
    v35 = selectedText;
    v36 = -[NSString isEqual:](v35, "isEqual:", v34);

    if ((v36 & 1) == 0)
      goto LABEL_65;
  }
  contextAfterInput = self->_contextAfterInput;
  v38 = (NSString *)v5[8];
  if (contextAfterInput == v38)
  {

  }
  else
  {
    v39 = v38;
    v40 = contextAfterInput;
    v41 = -[NSString isEqual:](v40, "isEqual:", v39);

    if ((v41 & 1) == 0)
      goto LABEL_65;
  }
  v42 = 0;
  if ((id)self->_selectedRangeInMarkedText.location == v5[20] && (id)self->_selectedRangeInMarkedText.length == v5[21])
  {
    if (self->_isDocumentEmpty == *((unsigned __int8 *)v5 + 10))
    {
      localeIdentifier = self->_localeIdentifier;
      v44 = (NSString *)v5[9];
      if (localeIdentifier == v44)
      {

      }
      else
      {
        v45 = v44;
        v46 = localeIdentifier;
        v47 = -[NSString isEqual:](v46, "isEqual:", v45);

        if ((v47 & 1) == 0)
          goto LABEL_65;
      }
      bundleIdentifier = self->_bundleIdentifier;
      v49 = (NSString *)v5[10];
      if (bundleIdentifier == v49)
      {

      }
      else
      {
        v50 = v49;
        v51 = bundleIdentifier;
        v52 = -[NSString isEqual:](v51, "isEqual:", v50);

        if ((v52 & 1) == 0)
          goto LABEL_65;
      }
      recipients = self->_recipients;
      v54 = (NSArray *)v5[11];
      if (recipients == v54)
      {

      }
      else
      {
        v55 = v54;
        v56 = recipients;
        v57 = -[NSArray isEqual:](v56, "isEqual:", v55);

        if ((v57 & 1) == 0)
          goto LABEL_65;
      }
      recipientNames = self->_recipientNames;
      v59 = (NSSet *)v5[12];
      if (recipientNames == v59)
      {

      }
      else
      {
        v60 = v59;
        v61 = recipientNames;
        v62 = -[NSSet isEqual:](v61, "isEqual:", v60);

        if ((v62 & 1) == 0)
          goto LABEL_65;
      }
      textContentType = self->_textContentType;
      v64 = (NSString *)v5[13];
      if (textContentType == v64)
      {

      }
      else
      {
        v65 = v64;
        v66 = textContentType;
        v67 = -[NSString isEqual:](v66, "isEqual:", v65);

        if ((v67 & 1) == 0)
          goto LABEL_65;
      }
      availableApps = self->_availableApps;
      v69 = (NSSet *)v5[14];
      if (availableApps == v69)
      {

      }
      else
      {
        v70 = v69;
        v71 = availableApps;
        v72 = -[NSSet isEqual:](v71, "isEqual:", v70);

        if ((v72 & 1) == 0)
          goto LABEL_65;
      }
      if ((id)self->_textualResponseLimit != v5[15]
        || (id)self->_structuredInfoLimit != v5[16]
        || (id)self->_totalSuggestionsLimit != v5[17])
      {
        goto LABEL_65;
      }
      v73 = self->_initiatingProcess;
      v74 = v73;
      if (v73 == v5[19])
        v42 = 1;
      else
        v42 = -[NSString isEqual:](v73, "isEqual:");

      goto LABEL_66;
    }
LABEL_65:
    v42 = 0;
  }
LABEL_66:

  return v42;
}

- (BOOL)isEqual:(id)a3
{
  PSGInputSuggestionsRequest *v4;
  PSGInputSuggestionsRequest *v5;
  BOOL v6;

  v4 = (PSGInputSuggestionsRequest *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PSGInputSuggestionsRequest isEqualToRequest:](self, "isEqualToRequest:", v5);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v3 = -[NSString hash](self->_responseContext, "hash");
  v4 = -[NSArray hash](self->_conversationTurns, "hash") - v3 + 32 * v3;
  v5 = -[NSArray count](self->_responseKitConversationTurns, "count") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_adaptationContextID, "hash");
  v7 = self->_shouldDisableAutoCaps - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  v8 = self->_isResponseContextBlacklisted - v7 + 32 * v7;
  v9 = -[NSString hash](self->_contextBeforeInput, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_markedText, "hash") - v9 + 32 * v9;
  v11 = -[NSString hash](self->_selectedText, "hash") - v10 + 32 * v10;
  v12 = -[NSString hash](self->_contextAfterInput, "hash");
  v13 = self->_selectedRangeInMarkedText.location - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  v14 = self->_selectedRangeInMarkedText.length - v13 + 32 * v13;
  v15 = self->_isDocumentEmpty - v14 + 32 * v14;
  v16 = -[NSString hash](self->_localeIdentifier, "hash") - v15 + 32 * v15;
  v17 = -[NSString hash](self->_bundleIdentifier, "hash") - v16 + 32 * v16;
  v18 = -[NSArray hash](self->_recipients, "hash") - v17 + 32 * v17;
  v19 = -[NSSet hash](self->_recipientNames, "hash") - v18 + 32 * v18;
  v20 = -[NSString hash](self->_textContentType, "hash") - v19 + 32 * v19;
  v21 = -[NSSet hash](self->_availableApps, "hash");
  v22 = self->_textualResponseLimit - (v21 - v20 + 32 * v20) + 32 * (v21 - v20 + 32 * v20);
  v23 = self->_structuredInfoLimit - v22 + 32 * v22;
  v24 = self->_totalSuggestionsLimit - v23 + 32 * v23;
  return -[NSString hash](self->_initiatingProcess, "hash") - v24 + 32 * v24;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSSet *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PSGInputSuggestionsRequest ctx_sz:%tu cvt:("), -[NSString length](self->_responseContext, "length"));
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = self->_conversationTurns;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v44;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v10), "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v11);

        objc_msgSend(v5, "appendString:", CFSTR("; "));
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(") aci:%@ dac:%d rcb:%d cbi_sz:%tu mkt_sz:%tu stt_sz:%tu cai_sz:%tu mkt_range:{%tu, %tu} lid:%@ bid:%@ rts:("), self->_adaptationContextID, self->_shouldDisableAutoCaps, self->_isResponseContextBlacklisted, -[NSString length](self->_contextBeforeInput, "length"), -[NSString length](self->_markedText, "length"), -[NSString length](self->_selectedText, "length"), -[NSString length](self->_contextAfterInput, "length"), self->_selectedRangeInMarkedText.location, self->_selectedRangeInMarkedText.length, self->_localeIdentifier, self->_bundleIdentifier);
  objc_msgSend(v5, "appendString:", v12);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = self->_recipients;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v5, "appendString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v17));
        objc_msgSend(v5, "appendString:", CFSTR("; "));
        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v15);
  }

  objc_msgSend(v5, "appendString:", CFSTR(") rns:("));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v18 = self->_recipientNames;
  v19 = -[NSSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v5, "appendString:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v22));
        objc_msgSend(v5, "appendString:", CFSTR("; "));
        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
    }
    while (v20);
  }

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(") tct:%@ app:("), self->_textContentType);
  objc_msgSend(v5, "appendString:", v23);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = self->_availableApps;
  v25 = -[NSSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v5, "appendString:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v28));
        objc_msgSend(v5, "appendString:", CFSTR("; "));
        ++v28;
      }
      while (v26 != v28);
      v26 = -[NSSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v31, v47, 16);
    }
    while (v26);
  }

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(") txtl:%tu strl:%tu tsgl:%tu ipr:%@>"), self->_textualResponseLimit, self->_structuredInfoLimit, self->_totalSuggestionsLimit, self->_initiatingProcess);
  objc_msgSend(v5, "appendString:", v29);

  return v5;
}

- (NSString)responseContext
{
  return self->_responseContext;
}

- (NSArray)conversationTurns
{
  return self->_conversationTurns;
}

- (NSString)adaptationContextID
{
  return self->_adaptationContextID;
}

- (BOOL)shouldDisableAutoCaps
{
  return self->_shouldDisableAutoCaps;
}

- (BOOL)isResponseContextBlacklisted
{
  return self->_isResponseContextBlacklisted;
}

- (NSString)contextBeforeInput
{
  return self->_contextBeforeInput;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (NSString)contextAfterInput
{
  return self->_contextAfterInput;
}

- (_NSRange)selectedRangeInMarkedText
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_selectedRangeInMarkedText.length;
  location = self->_selectedRangeInMarkedText.location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)isDocumentEmpty
{
  return self->_isDocumentEmpty;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (NSSet)recipientNames
{
  return self->_recipientNames;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (NSSet)availableApps
{
  return self->_availableApps;
}

- (unint64_t)textualResponseLimit
{
  return self->_textualResponseLimit;
}

- (unint64_t)structuredInfoLimit
{
  return self->_structuredInfoLimit;
}

- (unint64_t)totalSuggestionsLimit
{
  return self->_totalSuggestionsLimit;
}

- (NSArray)responseKitConversationTurns
{
  return self->_responseKitConversationTurns;
}

- (NSString)initiatingProcess
{
  return self->_initiatingProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatingProcess, 0);
  objc_storeStrong((id *)&self->_responseKitConversationTurns, 0);
  objc_storeStrong((id *)&self->_availableApps, 0);
  objc_storeStrong((id *)&self->_textContentType, 0);
  objc_storeStrong((id *)&self->_recipientNames, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_contextAfterInput, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_contextBeforeInput, 0);
  objc_storeStrong((id *)&self->_adaptationContextID, 0);
  objc_storeStrong((id *)&self->_conversationTurns, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
}

void __412__PSGInputSuggestionsRequest_initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1DF0B9950]();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasExprOnceResult;
  initWithResponseContext_conversationTurns_responseKitConversationTurns_adaptationContextID_shouldDisableAutoCaps_isResponseContextBlacklisted_contextBeforeInput_markedText_selectedText_contextAfterInput_selectedRangeInMarkedText_localeIdentifier_bundleIdentifier_recipients_recipientNames_textContentType_availableApps_textualResponseLimit_structuredInfoLimit_totalSuggestionsLimit___pasExprOnceResult = v2;

  objc_autoreleasePoolPop(v0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
