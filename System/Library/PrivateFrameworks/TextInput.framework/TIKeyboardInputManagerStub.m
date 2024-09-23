@implementation TIKeyboardInputManagerStub

+ (void)setArrayClassesForSelectorsInInterface:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_generateReplacementsForString_keyLayout_continuation_, 0, 1);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_skipHitTestForTouchEvents_keyboardState_, 0, 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_performHitTestForTouchEvents_keyboardState_continuation_, 0, 0);
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_smartSelectionForTextInDocument_inRange_language_tokenizedRanges_options_completion_, 3, 0);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_stickerWithIdentifier_stickerRoles_completionHandler_, 0, 1);

}

uint64_t __45__TIKeyboardInputManagerStub_serverInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE048DD8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)serverInterface_result;
  serverInterface_result = v2;

  return objc_msgSend(*(id *)(a1 + 32), "setArrayClassesForSelectorsInInterface:", serverInterface_result);
}

+ (id)serverInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__TIKeyboardInputManagerStub_serverInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, block);
  return (id)serverInterface_result;
}

- (id)keyboardConfiguration
{
  TIKeyboardConfiguration *v2;
  TIKeyboardInputManagerState *v3;

  v2 = objc_alloc_init(TIKeyboardConfiguration);
  v3 = objc_alloc_init(TIKeyboardInputManagerState);
  -[TIKeyboardConfiguration setInputManagerState:](v2, "setInputManagerState:", v3);

  return v2;
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  if (a4)
  {
    v6 = a4;
    -[TIKeyboardInputManagerStub keyboardConfiguration](self, "keyboardConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);

  }
}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, TIKeyboardOutput *, void *);
  TIKeyboardOutput *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  if (a5)
  {
    v13 = v7;
    v8 = (void (**)(id, TIKeyboardOutput *, void *))a5;
    v9 = objc_alloc_init(TIKeyboardOutput);
    objc_msgSend(v13, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v13, "string");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardOutput setInsertionText:](v9, "setInsertionText:", v11);

    }
    else if (objc_msgSend(v13, "isBackspace"))
    {
      -[TIKeyboardOutput setDeletionCount:](v9, "setDeletionCount:", 1);
    }
    -[TIKeyboardInputManagerStub keyboardConfiguration](self, "keyboardConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v9, v12);

    v7 = v13;
  }

}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  return &stru_1E243B990;
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 requestToken:(id)a5 completionHandler:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;

  if (a5)
  {
    v7 = a5;
    -[TIKeyboardInputManagerStub keyboardConfiguration](self, "keyboardConfiguration");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a5 + 2))(v7, v8, 0);

  }
}

- (void)generateReplacementsForString:(id)a3 keyLayout:(id)a4 continuation:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)generateRefinementsForCandidate:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (v8)
  {
    objc_msgSend(v7, "keyLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -1;
    if (v12 && v9)
    {
      objc_msgSend(v7, "keyLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "location");
      v10 = objc_msgSend(v11, "keyContainingPoint:");

    }
    v8[2](v8, v10);
  }

}

- (void)performHitTestForTouchEvents:(id)a3 keyboardState:(id)a4 continuation:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "lastObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerStub performHitTestForTouchEvent:keyboardState:continuation:](self, "performHitTestForTouchEvent:keyboardState:continuation:", v10, v9, v8);

}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  if (a8)
    (*((void (**)(void))a8 + 2))();
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  -[TIKeyboardInputManagerStub adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:](self, "adjustPhraseBoundaryInForwardDirection:granularity:keyboardState:completionHandler:", a3, 0, a4, a5);
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 keyboardState:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;

  if (a6)
  {
    v8 = a6;
    -[TIKeyboardInputManagerStub keyboardConfiguration](self, "keyboardConfiguration");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a6 + 2))(v8, v9);

  }
}

- (void)textAccepted:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  if (a4)
  {
    v6 = a4;
    -[TIKeyboardInputManagerStub keyboardConfiguration](self, "keyboardConfiguration");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a4 + 2))(v6, v7);

  }
}

- (void)writeTypologyLogWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)addSupplementalLexicon:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id))a4 + 2))(a4);
}

- (void)stickerWithIdentifier:(id)a3 stickerRoles:(id)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

@end
