@implementation TUISmartReplyGenerator

- (TUISmartReplyGenerator)init
{
  TUISmartReplyGenerator *v2;
  uint64_t v3;
  NSMutableArray *pendingCallbacks;
  uint64_t v5;
  NSMutableDictionary *acceptedCandidates;
  dispatch_queue_t v7;
  OS_dispatch_queue *generationQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUISmartReplyGenerator;
  v2 = -[TUISmartReplyGenerator init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingCallbacks = v2->_pendingCallbacks;
    v2->_pendingCallbacks = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    acceptedCandidates = v2->_acceptedCandidates;
    v2->_acceptedCandidates = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.TextInputUI.SmartReplyGenerator.Generation", 0);
    generationQueue = v2->_generationQueue;
    v2->_generationQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.TextInputUI.SmartReplyGenerator.Callback", MEMORY[0x1E0C80D50]);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (_TtC11TextInputUI18TUINetworkObserver)networkObserver
{
  _TtC11TextInputUI18TUINetworkObserver *networkObserver;
  _TtC11TextInputUI18TUINetworkObserver *v4;
  _TtC11TextInputUI18TUINetworkObserver *v5;

  networkObserver = self->_networkObserver;
  if (!networkObserver)
  {
    v4 = objc_alloc_init(_TtC11TextInputUI18TUINetworkObserver);
    v5 = self->_networkObserver;
    self->_networkObserver = v4;

    -[TUINetworkObserver setDelegate:](self->_networkObserver, "setDelegate:", self);
    networkObserver = self->_networkObserver;
  }
  return networkObserver;
}

- (_TtC11TextInputUI31TUITextCompositionClientWrapper)textCompositionClient
{
  _TtC11TextInputUI31TUITextCompositionClientWrapper *textCompositionClient;
  _TtC11TextInputUI31TUITextCompositionClientWrapper *v4;
  _TtC11TextInputUI31TUITextCompositionClientWrapper *v5;

  textCompositionClient = self->_textCompositionClient;
  if (!textCompositionClient)
  {
    v4 = objc_alloc_init(_TtC11TextInputUI31TUITextCompositionClientWrapper);
    v5 = self->_textCompositionClient;
    self->_textCompositionClient = v4;

    textCompositionClient = self->_textCompositionClient;
  }
  return textCompositionClient;
}

- (BOOL)_isGMAvailableForMessagesReply
{
  _BOOL4 v2;
  NSObject *v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = +[TUITextCompositionClientWrapper isGMAvailableForMessagesReply](_TtC11TextInputUI31TUITextCompositionClientWrapper, "isGMAvailableForMessagesReply");
  TUISmartReplyLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (v2)
      v4 = "YES";
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_18C785000, v3, OS_LOG_TYPE_DEFAULT, "Feature available for MessagesReply: %s", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)_isGMAvailableForMailReply
{
  _BOOL4 v2;
  NSObject *v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = +[TUITextCompositionClientWrapper isGMAvailableForMailReply](_TtC11TextInputUI31TUITextCompositionClientWrapper, "isGMAvailableForMailReply");
  TUISmartReplyLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (v2)
      v4 = "YES";
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_18C785000, v3, OS_LOG_TYPE_DEFAULT, "Feature available for MailReply: %s", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)_isGMAvailableForMailReplyLongFormBasic
{
  _BOOL4 v2;
  NSObject *v3;
  const char *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = +[TUITextCompositionClientWrapper isGMAvailableForMailReplyLongFormBasic](_TtC11TextInputUI31TUITextCompositionClientWrapper, "isGMAvailableForMailReplyLongFormBasic");
  TUISmartReplyLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "NO";
    if (v2)
      v4 = "YES";
    v6 = 136315138;
    v7 = v4;
    _os_log_impl(&dword_18C785000, v3, OS_LOG_TYPE_DEFAULT, "Feature available for MailReplyLongFormBasic: %s", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (BOOL)_queueOnly_isSmartReplyAvailableForClientAndType:(int64_t)a3
{
  if (-[TUISmartReplyGenerator isClientMessages](self, "isClientMessages"))
  {
    if (!a3)
      return -[TUISmartReplyGenerator _isGMAvailableForMessagesReply](self, "_isGMAvailableForMessagesReply");
    return 0;
  }
  if (!-[TUISmartReplyGenerator isClientMail](self, "isClientMail"))
    return 0;
  if (a3 != 1)
  {
    if (!a3)
      return -[TUISmartReplyGenerator _isGMAvailableForMailReply](self, "_isGMAvailableForMailReply");
    return 0;
  }
  return -[TUISmartReplyGenerator _isGMAvailableForMailReplyLongFormBasic](self, "_isGMAvailableForMailReplyLongFormBasic");
}

- (BOOL)contextHistoryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  double v13;
  BOOL v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  objc_msgSend(v4, "threadIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISmartReplyGenerator currentInputContextHistory](self, "currentInputContextHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8
    && (-[TUISmartReplyGenerator currentInputContextHistory](self, "currentInputContextHistory"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v4, "isEqual:", v9),
        v9,
        v10))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__938;
    v28 = __Block_byref_object_dispose__939;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    -[TUISmartReplyGenerator currentInputContextHistory](self, "currentInputContextHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke;
    v23[3] = &unk_1E24FAD58;
    v23[4] = &v24;
    objc_msgSend(v11, "enumerateAllContextEntriesWithEntryId:", v23);

    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__938;
    v21 = __Block_byref_object_dispose__939;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke_2;
    v16[3] = &unk_1E24FAD58;
    v16[4] = &v17;
    objc_msgSend(v4, "enumerateAllContextEntriesWithEntryId:", v16);
    objc_msgSend((id)v18[5], "timeIntervalSinceDate:", v25[5]);
    v14 = v13 != 0.0;
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (BOOL)hasPendingRequestForContext:(id)a3 historyDidChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "threadIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "threadIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISmartReplyGenerator pendingRequestThreadIdentifier](self, "pendingRequestThreadIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9) & !v4;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (-[TUISmartReplyGenerator shouldGenerateCandidatesForKeyboardState:](self, "shouldGenerateCandidatesForKeyboardState:", v6))
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    -[TUISmartReplyGenerator generationQueue](self, "generationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke;
    block[3] = &unk_1E24FAE20;
    block[4] = self;
    v12 = v8;
    v13 = v7;
    v10 = v8;
    dispatch_async(v9, block);

  }
  else if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (BOOL)_queueOnly_shouldAllowResponse:(id)a3
{
  BOOL v3;
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 1)
    goto LABEL_5;
  if (!v5)
  {
    v6 = objc_msgSend(v4, "contentWarning") + 1;
    if (v6 < 4)
    {
      v3 = (v6 & 0xF) == 1;
      goto LABEL_6;
    }
LABEL_5:
    v3 = ((objc_msgSend(v4, "contentWarning") + 1) & 0xFFFFFFFFFFFFFFFDLL) != 0;
  }
LABEL_6:

  return v3;
}

- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRequestToken:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  TUISmartReplyGenerator *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  -[TUISmartReplyGenerator generationQueue](self, "generationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__TUISmartReplyGenerator_candidateAccepted_keyboardState_candidateRequestToken___block_invoke;
  block[3] = &unk_1E24FBDA8;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

- (void)returnResults:(id)a3 requestIDStr:(id)a4 multiStageEntryPointCandidate:(id)a5 smartReplyType:(int64_t)a6 forCompletion:(id)a7 fromTimeout:(BOOL)a8
{
  _BOOL4 v8;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v68;
  void *v69;
  unint64_t v70;
  TUISmartReplyGenerator *v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD block[5];
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  id v97;
  __int16 v98;
  void *v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  __int16 v104;
  _BOOL4 v105;
  uint64_t v106;

  v8 = a8;
  v106 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v70 = (unint64_t)a5;
  v66 = a7;
  TUISmartReplyLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v71 = self;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "obscuredArrayDescription:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "stringForSmartReplyType:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_class();
    objc_msgSend((id)v70, "candidate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "obscuredStringDescription:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413315;
    v97 = v14;
    v98 = 2113;
    v99 = v16;
    v100 = 2112;
    v101 = v17;
    v102 = 2113;
    v103 = v20;
    v104 = 1024;
    v105 = v8;
    _os_log_impl(&dword_18C785000, v15, OS_LOG_TYPE_DEFAULT, "Returning new smart reply candidates for request (ID: %@): %{private}@ type: %@, entry point candidate: %{private}@, timeout: %d", buf, 0x30u);

    self = v71;
  }

  -[TUISmartReplyGenerator responseTimer](self, "responseTimer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TUISmartReplyGenerator responseTimer](self, "responseTimer");
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v22);

    -[TUISmartReplyGenerator setResponseTimer:](self, "setResponseTimer:", 0);
  }
  v65 = v14;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v63 = v13;
    v23 = v13;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v90 != v26)
            objc_enumerationMutation(v23);
          v28 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (v70 | a6)
            {
              v30 = 2;
            }
            else
            {
              v29 = -[TUISmartReplyGenerator isClientMail](v71, "isClientMail");
              v30 = 2;
              if (v29)
                v30 = 18;
            }
            if (a6 == 1)
              v32 = v30 | 0x40;
            else
              v32 = v30;
            objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:property:", v28, &stru_1E24FC6C0, v32, v63);
            v31 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", v28, &stru_1E24FC6C0);
            v31 = objc_claimAutoreleasedReturnValue();
          }
          v33 = (void *)v31;
          if (v70 && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v33, "setSmartReplySourceCandidate:", v70);
          objc_msgSend(v69, "addObject:", v33, v63);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
      }
      while (v25);
    }

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", 0, v69);
    v35 = 0;
    if ((unint64_t)a6 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:inlineCompletions:", v34, v69, 0, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v68 = (void *)v34;
    v36 = MEMORY[0x1E0C809B0];
    if (v66)
    {
      v37 = (void *)objc_msgSend(v66, "copy");
      -[TUISmartReplyGenerator callbackQueue](v71, "callbackQueue");
      v38 = objc_claimAutoreleasedReturnValue();
      block[0] = v36;
      block[1] = 3221225472;
      block[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke;
      block[3] = &unk_1E24FAE20;
      block[4] = v71;
      v88 = v37;
      v87 = v35;
      v39 = v37;
      dispatch_async(v38, block);

    }
    -[TUISmartReplyGenerator pendingCallbacks](v71, "pendingCallbacks", v63);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "copy");

    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v42 = v41;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v83 != v45)
            objc_enumerationMutation(v42);
          v47 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
          -[TUISmartReplyGenerator callbackQueue](v71, "callbackQueue");
          v48 = objc_claimAutoreleasedReturnValue();
          v79[0] = v36;
          v79[1] = 3221225472;
          v79[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_2;
          v79[3] = &unk_1E24FAE48;
          v81 = v47;
          v80 = v35;
          dispatch_async(v48, v79);

        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      }
      while (v44);
    }

    v13 = v64;
    v49 = v69;
  }
  else
  {
    -[TUISmartReplyGenerator callbackQueue](self, "callbackQueue");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_3;
    v77[3] = &unk_1E24FAD80;
    v78 = v66;
    dispatch_async(v50, v77);

    -[TUISmartReplyGenerator pendingCallbacks](self, "pendingCallbacks");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v54 = v53;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v74;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v74 != v57)
            objc_enumerationMutation(v54);
          v59 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k);
          -[TUISmartReplyGenerator callbackQueue](v71, "callbackQueue");
          v60 = objc_claimAutoreleasedReturnValue();
          v72[0] = v51;
          v72[1] = 3221225472;
          v72[2] = __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_4;
          v72[3] = &unk_1E24FAD80;
          v72[4] = v59;
          dispatch_async(v60, v72);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v93, 16);
      }
      while (v56);
    }

    v49 = v78;
  }

  -[TUISmartReplyGenerator setPendingRequestThreadIdentifier:](v71, "setPendingRequestThreadIdentifier:", 0);
  -[TUISmartReplyGenerator pendingCallbacks](v71, "pendingCallbacks");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "removeAllObjects");

  -[TUISmartReplyGenerator acceptedCandidates](v71, "acceptedCandidates");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "removeAllObjects");

}

- (BOOL)shouldGenerateCandidatesForKeyboardState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextBeforeInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    goto LABEL_16;
  objc_msgSend(v4, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextAfterInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
    goto LABEL_16;
  if (-[TUISmartReplyGenerator isClientMail](self, "isClientMail"))
  {
    -[TUISmartReplyGenerator networkObserver](self, "networkObserver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isNetworkAvailable");

    if ((v12 & 1) == 0)
    {
      TUISmartReplyLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v18 = "Cancelled smart reply generation due to no network access";
        goto LABEL_12;
      }
LABEL_15:

LABEL_16:
      v16 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(v4, "inputContextHistory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    TUISmartReplyLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      v18 = "Cancelled smart reply generation due to nil ICH";
LABEL_12:
      _os_log_impl(&dword_18C785000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  objc_msgSend(v4, "inputContextHistory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TUISmartReplyGenerator _staging_inputContextHistory_IsValid:](self, "_staging_inputContextHistory_IsValid:", v14);

  if (!v15)
  {
    TUISmartReplyLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "inputContextHistory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "debugDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138477827;
      v23 = v20;
      _os_log_impl(&dword_18C785000, v17, OS_LOG_TYPE_DEFAULT, "Cancelled smart reply generation due to invalid ICH %{private}@", (uint8_t *)&v22, 0xCu);

    }
    goto LABEL_15;
  }
  v16 = 1;
LABEL_17:

  return v16;
}

- (BOOL)_staging_inputContextHistory_IsValid:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "validateForSmartReplyGeneration");
  else
    v4 = 1;

  return v4;
}

- (void)syncToKeyboardState:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[TUISmartReplyGenerator generationQueue](self, "generationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__TUISmartReplyGenerator_syncToKeyboardState___block_invoke;
  block[3] = &unk_1E24FC1F8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)setCurrentKeyboardState:(id)a3
{
  objc_storeStrong((id *)&self->_currentKeyboardState, a3);
}

- (TIInputContextHistory)currentInputContextHistory
{
  void *v2;
  void *v3;

  -[TUISmartReplyGenerator currentKeyboardState](self, "currentKeyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputContextHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIInputContextHistory *)v3;
}

- (id)createTimerWithDelay:(unint64_t)a3 onQueue:(id)a4 handler:(id)a5
{
  id v7;
  NSObject *v8;
  dispatch_time_t v9;

  v7 = a5;
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)a4);
  if (v8)
  {
    v9 = dispatch_time(0, 1000000000 * a3);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

- (int64_t)generatedCandidateType
{
  return 2;
}

- (int64_t)candidateSourceType
{
  return 2;
}

- (BOOL)isEnabledForCurrentKeyboardState
{
  int v3;

  if (-[TUISmartReplyGenerator isClientMessages](self, "isClientMessages")
    || (v3 = -[TUISmartReplyGenerator isClientMail](self, "isClientMail")) != 0)
  {
    LOBYTE(v3) = _os_feature_enabled_impl();
  }
  return v3;
}

- (BOOL)isClientMessages
{
  void *v2;
  void *v3;
  char v4;

  -[TUISmartReplyGenerator currentKeyboardState](self, "currentKeyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.MobileSMS"));

  return v4;
}

- (BOOL)isClientMail
{
  void *v2;
  void *v3;
  char v4;

  -[TUISmartReplyGenerator currentKeyboardState](self, "currentKeyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("com.apple.mobilemail"));

  return v4;
}

- (void)didObserveNetworkAvailabilityChange:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v3 = a3;
  v6 = *MEMORY[0x1E0C80C00];
  TUISmartReplyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_debug_impl(&dword_18C785000, v4, OS_LOG_TYPE_DEBUG, "Observed network availbility: %d", (uint8_t *)v5, 8u);
  }

}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (id)cachedSmartReplyCandidate
{
  return self->_cachedSmartReplyCandidate;
}

- (void)setCachedSmartReplyCandidate:(id)a3
{
  objc_storeStrong(&self->_cachedSmartReplyCandidate, a3);
}

- (void)setCurrentInputContextHistory:(id)a3
{
  objc_storeStrong((id *)&self->_currentInputContextHistory, a3);
}

- (TIKeyboardState)currentKeyboardState
{
  return self->_currentKeyboardState;
}

- (OS_dispatch_source)responseTimer
{
  return self->_responseTimer;
}

- (void)setResponseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_responseTimer, a3);
}

- (NSString)pendingRequestThreadIdentifier
{
  return self->_pendingRequestThreadIdentifier;
}

- (void)setPendingRequestThreadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequestThreadIdentifier, a3);
}

- (NSMutableArray)pendingCallbacks
{
  return self->_pendingCallbacks;
}

- (void)setPendingCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCallbacks, a3);
}

- (NSMutableDictionary)acceptedCandidates
{
  return self->_acceptedCandidates;
}

- (void)setAcceptedCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedCandidates, a3);
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_storeStrong((id *)&self->_acceptedCandidates, 0);
  objc_storeStrong((id *)&self->_pendingCallbacks, 0);
  objc_storeStrong((id *)&self->_pendingRequestThreadIdentifier, 0);
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_currentKeyboardState, 0);
  objc_storeStrong((id *)&self->_currentInputContextHistory, 0);
  objc_storeStrong(&self->_cachedSmartReplyCandidate, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_textCompositionClient, 0);
}

uint64_t __46__TUISmartReplyGenerator_syncToKeyboardState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentKeyboardState:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(*(id *)(a1 + 32), "isEnabledForCurrentKeyboardState"));
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "pendingCallbacks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v2, "addObject:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __124__TUISmartReplyGenerator_returnResults_requestIDStr_multiStageEntryPointCandidate_smartReplyType_forCompletion_fromTimeout___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__TUISmartReplyGenerator_candidateAccepted_keyboardState_candidateRequestToken___block_invoke(id *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(a1[4], "candidateProperty") & 0x10) != 0)
  {
    objc_msgSend(a1[5], "acceptedCandidates");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeAllObjects");

    v3 = a1[4];
    objc_msgSend(a1[5], "acceptedCandidates");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "inputContextHistory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "threadIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, v5);

  }
}

void __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  NSObject *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
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
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  _QWORD v71[5];
  id v72;
  id v73;
  id v74;
  id v75;
  _BOOL8 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  _BOOL8 v84;
  _QWORD block[4];
  id v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  const __CFString *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "acceptedCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "inputContextHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(a1[4], "isClientMail"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6 != 0;
  if ((objc_msgSend(a1[4], "_queueOnly_isSmartReplyAvailableForClientAndType:", v7) & 1) != 0)
  {
    objc_msgSend(a1[4], "textCompositionClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "generateRequestToken");

    v68 = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v9);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    TUISmartReplyLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v69 = v5;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[5];
      if (v11)
        v12 = CFSTR("not nil");
      else
        v12 = CFSTR("nil");
      objc_msgSend(v11, "inputContextHistory");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "inputContextHistory");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "threadIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_class();
      objc_msgSend(v5, "candidate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "obscuredStringDescription:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_opt_class();
      objc_msgSend(a1[5], "inputContextHistory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "mostRecentNonSenderTextEntry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "obscuredStringDescription:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413571;
      v88 = v70;
      v89 = 2112;
      v90 = v12;
      v91 = 2048;
      v92 = v65;
      v93 = 2113;
      v94 = v13;
      v95 = 2113;
      v96 = v16;
      v97 = 2113;
      v98 = v20;
      _os_log_impl(&dword_18C785000, v10, OS_LOG_TYPE_DEFAULT, "Preparing smart reply candidate generation request (ID: %@) for state: (%@),  context: <TIInputContextHistory: %p, id: %{private}@>, candidate: %{private}@, lastEntry: %{private}@", buf, 0x3Eu);

      v7 = v6 != 0;
    }

    TUISmartReplyLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1[5], "inputContextHistory");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "mostRecentTextEntryLogString");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v88 = v64;
      _os_log_debug_impl(&dword_18C785000, v21, OS_LOG_TYPE_DEBUG, "   Supplemental privacy lastEntry: %{private}@", buf, 0xCu);

    }
    v22 = a1[4];
    objc_msgSend(a1[5], "inputContextHistory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "contextHistoryDidChange:", v23);

    if (a1[6]
      && (v25 = a1[4],
          objc_msgSend(a1[5], "inputContextHistory"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v25) = objc_msgSend(v25, "hasPendingRequestForContext:historyDidChange:", v26, v24),
          v26,
          (_DWORD)v25))
    {
      TUISmartReplyLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v88 = v70;
        _os_log_impl(&dword_18C785000, v27, OS_LOG_TYPE_DEFAULT, "Ignored smart reply candidate generation request (ID: %@) due to pending request", buf, 0xCu);
      }

      objc_msgSend(a1[4], "pendingCallbacks");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = a1[6];
      v30 = (void *)v28;
      v31 = (id)objc_msgSend(v29, "copy");
      objc_msgSend(v30, "addObject:", v31);
      v5 = v69;
    }
    else
    {
      objc_msgSend(a1[4], "setCurrentKeyboardState:", a1[5]);
      v35 = objc_alloc(MEMORY[0x1E0DBDA90]);
      objc_msgSend(a1[4], "currentInputContextHistory");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v35, "initWithTIInputContextHistory:", v36);

      if (a1[6])
      {
        objc_msgSend(a1[4], "responseTimer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          objc_msgSend(a1[4], "responseTimer");
          v38 = objc_claimAutoreleasedReturnValue();
          dispatch_source_cancel(v38);

          objc_msgSend(a1[4], "setResponseTimer:", 0);
        }
        v39 = a1[4];
        objc_msgSend(v39, "generationQueue");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_19;
        v77[3] = &unk_1E24FADA8;
        v41 = v70;
        v42 = a1[4];
        v43 = a1[5];
        v78 = v41;
        v79 = v42;
        v83 = v68;
        v84 = v7;
        v80 = v43;
        v81 = v6;
        v82 = a1[6];
        objc_msgSend(v39, "createTimerWithDelay:onQueue:handler:", 5, v40, v77);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[4], "setResponseTimer:", v44);

      }
      TUISmartReplyLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[4], "currentInputContextHistory");
        v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_opt_class();
        objc_msgSend(v6, "candidate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "obscuredStringDescription:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412803;
        v88 = v70;
        v89 = 2048;
        v90 = v46;
        v91 = 2113;
        v92 = v49;
        _os_log_impl(&dword_18C785000, v45, OS_LOG_TYPE_DEFAULT, "Smart reply generation requested (ID: %@) for context: <TIInputContextHistory %p>, entryPoint: %{private}@", buf, 0x20u);

      }
      objc_msgSend(a1[4], "currentInputContextHistory");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "threadIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "setPendingRequestThreadIdentifier:", v51);

      if (!v6)
      {
        objc_msgSend(a1[5], "clientIdentifier");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "inputContextHistory");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "threadIdentifier");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:](TUIInputAnalytics, "didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:", 0, v52, v70, v54, 0);

      }
      v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v68);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0DBDAD8]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", getpid());
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v56, *MEMORY[0x1E0DBDAC8]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1[5], "autocapitalizationEnabled"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v57, *MEMORY[0x1E0DBDAD0]);

      objc_msgSend(a1[4], "textCompositionClient");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "clientIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "currentInputContextHistory");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "threadIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v69;
      objc_msgSend(v69, "candidate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_22;
      v71[3] = &unk_1E24FADF8;
      v71[4] = a1[4];
      v72 = v70;
      v73 = a1[5];
      v76 = v6 != 0;
      v74 = v6;
      v75 = a1[6];
      v30 = (void *)v67;
      objc_msgSend(v58, "requestSmartRepliesWithInputContextHistory:shortForm:clientID:threadIdentifier:candidateString:options:completion:", v67, v6 == 0, v59, v61, v62, v31, v71);

    }
  }
  else
  {
    TUISmartReplyLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "stringForSmartReplyType:", v6 != 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v88 = v33;
      _os_log_impl(&dword_18C785000, v32, OS_LOG_TYPE_DEFAULT, "Feature unavailable for client and reply type %{public}@", buf, 0xCu);

    }
    objc_msgSend(a1[4], "callbackQueue");
    v34 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_11;
    block[3] = &unk_1E24FAD80;
    v86 = a1[6];
    dispatch_async(v34, block);

  }
}

uint64_t __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  TUISmartReplyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_18C785000, v2, OS_LOG_TYPE_DEFAULT, "Smart reply generation timed out for request (ID: %@)", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "textCompositionClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelRequestWithToken:", *(_QWORD *)(a1 + 72));

  v5 = *(_QWORD *)(a1 + 80);
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "inputContextHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "threadIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:](TUIInputAnalytics, "didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:", 3, v6, v7, v9, 0);

    v5 = *(_QWORD *)(a1 + 80);
  }
  return objc_msgSend(*(id *)(a1 + 40), "returnResults:requestIDStr:multiStageEntryPointCandidate:smartReplyType:forCompletion:fromTimeout:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), v5, *(_QWORD *)(a1 + 64), 1);
}

void __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "generationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_2;
  block[3] = &unk_1E24FADD0;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 72);
  v12 = v5;
  v15 = v6;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v7 = v3;
  dispatch_async(v4, block);

}

void __72__TUISmartReplyGenerator_generateCandidatesForKeyboardState_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  TUISmartReplyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v39 = *(__CFString **)(a1 + 40);
    v4 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "srResponse");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responseTexts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "obscuredArrayDescription:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 40), "contentWarning");
    objc_msgSend(*(id *)(a1 + 56), "inputContextHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "inputContextHistory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "threadIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413571;
    v41 = v3;
    v42 = 2048;
    v43 = v39;
    v44 = 2113;
    v45 = v7;
    v46 = 2048;
    v47 = v8;
    v48 = 2048;
    v49 = v9;
    v50 = 2113;
    v51 = v11;
    _os_log_impl(&dword_18C785000, v2, OS_LOG_TYPE_DEFAULT, "Smart reply generation response for (ID: %@): <TUISmartReplyResponse %p> with text: %{private}@ (contentWarning: %ld) for context: <TIInputContextHistory %p, threadId: %{private}@>", buf, 0x3Eu);

  }
  objc_msgSend(*(id *)(a1 + 40), "srResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  TUISmartReplyLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 40), "threadIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "currentInputContextHistory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "threadIdentifier");
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v41 = v36;
    v42 = 2113;
    v43 = v38;
    _os_log_debug_impl(&dword_18C785000, v13, OS_LOG_TYPE_DEBUG, "srResponse.threadIdentifier=\"%{private}@\" self.currentInputContextHistory.threadIdentifier=\"%{private}@\", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "threadIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "currentInputContextHistory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "threadIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", v16))
  {

LABEL_7:
    if (*(_QWORD *)(a1 + 80))
      goto LABEL_18;
    objc_msgSend(v12, "responseTexts");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17
      && (v18 = (void *)v17,
          objc_msgSend(v12, "responseTexts"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "count"),
          v19,
          v18,
          v20))
    {
      objc_msgSend(*(id *)(a1 + 56), "clientIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "inputContextHistory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "threadIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 40);
      v23 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "clientIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 56), "inputContextHistory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "threadIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 40);
      v23 = 2;
    }
    +[TUIInputAnalytics didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:](TUIInputAnalytics, "didHandleSmartReplyAnalyticsEventOfType:withBundleId:withInputContextHistoryRequestId:withMsgOrMailThreadId:withSmartReplyResponse:", v23, v14, v21, v16, v22);
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 40), "threadIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "isEqualToString:", &stru_1E24FC6C0))
  {
    objc_msgSend(*(id *)(a1 + 48), "currentInputContextHistory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "threadIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      goto LABEL_18;
    goto LABEL_7;
  }

LABEL_17:
LABEL_18:
  if (objc_msgSend(*(id *)(a1 + 48), "_queueOnly_shouldAllowResponse:", *(_QWORD *)(a1 + 40)))
  {
    v27 = *(void **)(a1 + 48);
    objc_msgSend(v12, "responseTexts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "returnResults:requestIDStr:multiStageEntryPointCandidate:smartReplyType:forCompletion:fromTimeout:", v28, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), 0);

  }
  else
  {
    TUISmartReplyLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *(void **)(a1 + 32);
      v31 = objc_msgSend(*(id *)(a1 + 40), "type");
      v32 = CFSTR("Long");
      if (!v31)
        v32 = CFSTR("Short");
      v33 = v32;
      v34 = objc_msgSend(*(id *)(a1 + 40), "contentWarning");
      if ((unint64_t)(v34 + 1) > 3)
        v35 = CFSTR("None");
      else
        v35 = off_1E24FAE68[v34 + 1];
      *(_DWORD *)buf = 138412802;
      v41 = v30;
      v42 = 2112;
      v43 = v33;
      v44 = 2112;
      v45 = v35;
      _os_log_impl(&dword_18C785000, v29, OS_LOG_TYPE_DEFAULT, "Smart reply generation response for (ID: %@): suppressing response for replyType=%@ contentWarning=%@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "returnResults:requestIDStr:multiStageEntryPointCandidate:smartReplyType:forCompletion:fromTimeout:", 0, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), 1);
  }

}

void __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (v5 > 0.0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);

}

void __50__TUISmartReplyGenerator_contextHistoryDidChange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  if (v5 > 0.0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_958);
  return (id)sharedInstance_sharedInstance;
}

+ (id)stringForSmartReplyType:(int64_t)a3
{
  if (a3)
    return CFSTR("long");
  else
    return CFSTR("short");
}

+ (id)obscuredArrayDescription:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend((id)objc_opt_class(), "obscuredStringDescription:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)obscuredStringDescription:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Privacy Hash: %lu>"), objc_msgSend(v4, "hash"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("<empty_string>");
    }
  }
  else
  {
    v5 = CFSTR("<nil_string>");
  }

  return v5;
}

void __40__TUISmartReplyGenerator_sharedInstance__block_invoke()
{
  TUISmartReplyGenerator *v0;
  void *v1;

  v0 = objc_alloc_init(TUISmartReplyGenerator);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

@end
