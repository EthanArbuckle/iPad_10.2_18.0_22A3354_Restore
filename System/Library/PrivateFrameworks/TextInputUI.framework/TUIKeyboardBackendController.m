@implementation TUIKeyboardBackendController

void __46__TUIKeyboardBackendController_sharedInstance__block_invoke()
{
  TUIKeyboardBackendController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [TUIKeyboardBackendController alloc];
  +[TUIKeyboardInputManagerMux sharedInstance](TUIKeyboardInputManagerMux, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[TUIKeyboardBackendController initWithInputManagerMux:](v0, "initWithInputManagerMux:", v3);
  v2 = (void *)sharedInstance___instance_6471;
  sharedInstance___instance_6471 = v1;

}

- (void)setInputManager:(id)a3
{
  objc_storeStrong((id *)&self->_inputManager, a3);
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncToKeyboardState:completionHandler:", v10, v6);

  -[TUIKeyboardBackendController candidateMultiplexer](self, "candidateMultiplexer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TUIKeyboardBackendController candidateMultiplexer](self, "candidateMultiplexer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "syncToKeyboardState:", v10);

  }
}

- (TUIKeyboardInputManagerMux)inputManager
{
  return self->_inputManager;
}

- (void)applicationWillEnterForeground
{
  self->_applicationIsInBackground = 0;
  -[TUIKeyboardBackendController _restoreSupplementalLexiconsIfNeeded](self, "_restoreSupplementalLexiconsIfNeeded");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6470 != -1)
    dispatch_once(&sharedInstance_onceToken_6470, &__block_literal_global_5);
  return (id)sharedInstance___instance_6471;
}

- (void)_restoreSupplementalLexiconsIfNeeded
{
  NSHashTable *v3;
  NSHashTable *supplementalLexicons;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_applicationIsInBackground && self->_needsRestoreSupplementalLexicons)
  {
    self->_needsRestoreSupplementalLexicons = 0;
    v3 = self->_supplementalLexicons;
    supplementalLexicons = self->_supplementalLexicons;
    self->_supplementalLexicons = 0;

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v3;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[TUIKeyboardBackendController addUISupplementalLexicon:](self, "addUISupplementalLexicon:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (TUIKeyboardBackendController)init
{
  void *v3;
  void *v4;
  TUIKeyboardBackendController *v5;

  +[TUIKeyboardInputManagerMux sharedInstance](TUIKeyboardInputManagerMux, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    -[TUIKeyboardBackendController configuredMultiplexer](self, "configuredMultiplexer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = -[TUIKeyboardBackendController initWithInputManagerMux:candidateMux:](self, "initWithInputManagerMux:candidateMux:", v3, v4);

  return v5;
}

- (TUIKeyboardBackendController)initWithInputManagerMux:(id)a3
{
  id v4;
  void *v5;
  TUIKeyboardBackendController *v6;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[TUIKeyboardBackendController configuredMultiplexer](self, "configuredMultiplexer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[TUIKeyboardBackendController initWithInputManagerMux:candidateMux:](self, "initWithInputManagerMux:candidateMux:", v4, v5);

  return v6;
}

- (id)configuredMultiplexer
{
  TUIKeyboardCandidateMultiplexer *v2;
  TUIMathCompletionGenerator *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TUITextEffectsGenerator *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(TUIKeyboardCandidateMultiplexer);
  -[TUIKeyboardCandidateMultiplexer setEnableKbdSource:](v2, "setEnableKbdSource:", 1);
  if (_os_feature_enabled_impl()
    && ((_os_feature_enabled_impl() & 1) != 0 || dyld_program_sdk_at_least()))
  {
    v3 = objc_alloc_init(TUIMathCompletionGenerator);
    -[TUIMathCompletionGenerator setEnabled:](v3, "setEnabled:", 1);
    -[TUIKeyboardCandidateMultiplexer addGenerator:](v2, "addGenerator:", v3);

  }
  if (objc_msgSend((id)objc_opt_class(), "_isSmartReplyEnabled"))
  {
    TUISmartReplyLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[TUIKeyboardBackendController configuredMultiplexer]";
      _os_log_impl(&dword_18C785000, v4, OS_LOG_TYPE_DEFAULT, "%s Backend controller is installing the smart reply generator", (uint8_t *)&v12, 0xCu);
    }

    +[TUISmartReplyGenerator sharedInstance](TUISmartReplyGenerator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnabled:", 1);
    -[TUIKeyboardCandidateMultiplexer addGenerator:](v2, "addGenerator:", v5);

  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "primaryLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TUITextEffectsGenerator initWithLocale:]([TUITextEffectsGenerator alloc], "initWithLocale:", v9);
    -[TUITextEffectsGenerator setEnabled:](v10, "setEnabled:", 0);
    -[TUIKeyboardCandidateMultiplexer addGenerator:](v2, "addGenerator:", v10);

  }
  return v2;
}

- (TUIKeyboardBackendController)initWithInputManagerMux:(id)a3 candidateMux:(id)a4
{
  id v7;
  id v8;
  TUIKeyboardBackendController *v9;
  TUIKeyboardBackendController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIKeyboardBackendController;
  v9 = -[TUIKeyboardBackendController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputManager, a3);
    objc_storeStrong((id *)&v10->_candidateMultiplexer, a4);
    -[TUIKeyboardInputManagerMux setCandidateMultiplexer:](v10->_inputManager, "setCandidateMultiplexer:", v10->_candidateMultiplexer);
  }

  return v10;
}

- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performHitTestForTouchEvents:keyboardState:continuation:", v10, v9, v8);

}

- (void)skipHitTestForTouchEvents:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "skipHitTestForTouchEvents:keyboardState:", v7, v6);

}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  length = a4.length;
  location = a4.location;
  v15 = a8;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "smartSelectionForTextInDocument:inRange:language:tokenizedRanges:options:completion:", v18, location, length, v17, v16, a7, v15);

}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v16, "acceptedCandidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0DBDBE8];
    objc_msgSend(v10, "candidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "candidateWithCandidate:forInput:property:", v12, v13, objc_msgSend(v10, "candidateProperty"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAcceptedCandidate:", v14);

  }
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleKeyboardInput:keyboardState:completionHandler:", v16, v9, v8);

}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generateAutocorrectionsWithKeyboardState:completionHandler:", v7, v6);

}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  NSUInteger length;
  NSUInteger v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  id v28;
  id location;

  length = a4.length;
  v9 = a4.location;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[TUIKeyboardBackendController candidateMultiplexer](self, "candidateMultiplexer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[TUIKeyboardBackendController candidateReceiver](self, "candidateReceiver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKeyboardBackendController candidateMultiplexer](self, "candidateMultiplexer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCandidateReceiver:", v15);

    -[TUIKeyboardBackendController candidateMultiplexer](self, "candidateMultiplexer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "generateCandidatesForKeyboardState:requestToken:", v11, v12);

  }
  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __119__TUIKeyboardBackendController_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke;
  v25 = &unk_1E24FBB98;
  objc_copyWeak(&v28, &location);
  v26 = v12;
  v27 = v13;
  v18 = v13;
  v19 = v12;
  v20 = _Block_copy(&v22);
  -[TUIKeyboardBackendController inputManager](self, "inputManager", v22, v23, v24, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:", v11, v9, length, v19, v20);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);

}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  id v14;

  length = a4.length;
  location = a4.location;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "generateCandidatesWithKeyboardState:candidateRange:requestToken:completionHandler:", v13, location, length, v12, v11);

}

- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleAcceptedCandidate:keyboardState:completionHandler:", v10, v9, v8);

}

- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateReplacementsForString:keyLayout:continuation:", v10, v9, v8);

}

- (void)candidateAccepted:(id)a3 keyboardState:(id)a4 candidateRquestToken:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[TUIKeyboardBackendController candidateMultiplexer](self, "candidateMultiplexer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "candidateAccepted:keyboardState:candidateRequestToken:", v13, v12, v11);

  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textAccepted:completionHandler:", v13, v10);

}

- (void)setOriginalInput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOriginalInput:", v4);

}

- (void)textAccepted:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textAccepted:completionHandler:", v7, v6);

}

- (void)candidateRejected:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "candidateRejected:", v4);

}

- (void)lastAcceptedCandidateCorrected
{
  id v2;

  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastAcceptedCandidateCorrected");

}

- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logDiscoverabilityEvent:userInfo:", v4, v6);

}

- (void)writeTypologyLogWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeTypologyLogWithCompletionHandler:", v4);

}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;

  v7 = *(_QWORD *)&a4;
  v8 = a3;
  v10 = a6;
  v11 = a5;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:", v8, v7, v11, v10);

}

- (void)addUISupplementalLexicon:(id)a3
{
  id v4;
  NSHashTable *supplementalLexicons;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[5];

  v4 = a3;
  supplementalLexicons = self->_supplementalLexicons;
  if (!supplementalLexicons)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_supplementalLexicons;
    self->_supplementalLexicons = v6;

    supplementalLexicons = self->_supplementalLexicons;
  }
  -[NSHashTable addObject:](supplementalLexicons, "addObject:", v4);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke;
  aBlock[3] = &unk_1E24FC068;
  aBlock[4] = self;
  v8 = _Block_copy(aBlock);
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("_internal"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSupplementalLexicon:completionHandler:", v10, v8);

}

- (void)removeUISupplementalLexicon:(id)a3
{
  NSHashTable *supplementalLexicons;
  id v5;
  void *v6;
  id v7;

  supplementalLexicons = self->_supplementalLexicons;
  v5 = a3;
  -[NSHashTable removeObject:](supplementalLexicons, "removeObject:", v5);
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("_internal"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeSupplementalLexiconWithIdentifier:", objc_msgSend(v6, "identifier"));
}

- (void)applicationDidEnterBackground
{
  self->_applicationIsInBackground = 1;
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acceptingCandidateWithTrigger:", v4);

}

- (void)changingContextWithTrigger:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changingContextWithTrigger:", v4);

}

- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[TUIKeyboardBackendController inputManager](self, "inputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[TUIKeyboardBackendController inputManager](self, "inputManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stickerWithIdentifier:stickerRoles:completionHandler:", v13, v8, v9);

  }
}

- (NSHashTable)supplementalLexicons
{
  return self->_supplementalLexicons;
}

- (TUIKeyboardCandidateReceiver)candidateReceiver
{
  return (TUIKeyboardCandidateReceiver *)objc_loadWeakRetained((id *)&self->_candidateReceiver);
}

- (void)setCandidateReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_candidateReceiver, a3);
}

- (OS_dispatch_source)supplementalLexiconWatchdog
{
  return self->_supplementalLexiconWatchdog;
}

- (void)setSupplementalLexiconWatchdog:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalLexiconWatchdog, a3);
}

- (TUIKeyboardCandidateMultiplexer)candidateMultiplexer
{
  return (TUIKeyboardCandidateMultiplexer *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCandidateMultiplexer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateMultiplexer, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
  objc_destroyWeak((id *)&self->_candidateReceiver);
  objc_storeStrong((id *)&self->_supplementalLexicons, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconWatchdog, 0);
}

void __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  dispatch_source_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD handler[5];

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "processIdentifier");

      v5 = dispatch_source_create(MEMORY[0x1E0C80DB0], v4, 0x80000000uLL, MEMORY[0x1E0C80D38]);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 8);
      *(_QWORD *)(v6 + 8) = v5;

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 8);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke_2;
      handler[3] = &unk_1E24FC068;
      handler[4] = v8;
      dispatch_source_set_event_handler(v9, handler);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
    }
  }
}

uint64_t __57__TUIKeyboardBackendController_addUISupplementalLexicon___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_restoreSupplementalLexiconsIfNeeded");
}

void __119__TUIKeyboardBackendController_generateAutocorrectionsWithKeyboardState_candidateRange_requestToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "candidateMultiplexer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receiveExternalAutocorrectionUpdate:requestToken:", v7, *(_QWORD *)(a1 + 32));

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

}

+ (BOOL)_isSmartReplyEnabled
{
  if (_isSmartReplyEnabled_onceToken != -1)
    dispatch_once(&_isSmartReplyEnabled_onceToken, &__block_literal_global_6473);
  return _isSmartReplyEnabled_enabled;
}

uint64_t __52__TUIKeyboardBackendController__isSmartReplyEnabled__block_invoke()
{
  char v0;
  char v1;
  uint64_t result;

  v0 = MGGetBoolAnswer();
  v1 = _os_feature_enabled_impl();
  result = _os_feature_enabled_impl();
  _isSmartReplyEnabled_enabled = v0 & (v1 | result);
  return result;
}

@end
