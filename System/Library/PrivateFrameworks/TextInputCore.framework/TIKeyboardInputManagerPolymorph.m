@implementation TIKeyboardInputManagerPolymorph

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __42__TIKeyboardInputManagerPolymorph_dealloc__block_invoke;
    v11 = &unk_1EA106A98;
    v12 = v5;
    v6 = v5;
    TIDispatchAsync();

  }
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerPolymorph;
  -[TIKeyboardInputManagerPolymorph dealloc](&v7, sel_dealloc);
}

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __73__TIKeyboardInputManagerPolymorph_syncToKeyboardState_completionHandler___block_invoke;
  v8[3] = &unk_1EA0FB1A0;
  v9 = a4;
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerPolymorph;
  v8[0] = MEMORY[0x1E0C809B0];
  v6 = v9;
  -[TIKeyboardInputManagerWrapper syncToKeyboardState:completionHandler:](&v7, sel_syncToKeyboardState_completionHandler_, a3, v8);

}

void __73__TIKeyboardInputManagerPolymorph_syncToKeyboardState_completionHandler___block_invoke(uint64_t a1)
{
  id v1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "touchWithReason:", 0);

}

- (void)setInputManagerForInputMode:(id)a3 withKeyboardState:(id)a4 class:(Class)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  TITypologyPreferences *v20;
  void *v21;
  TIKeyboardInputManagerLogger *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v8 = a4;
  +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isActiveInputManager:", v10))
  {
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isMemberOfClass:", a5) & 1) != 0)
    {
      -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inputMode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v26);

      if ((v14 & 1) != 0)
        goto LABEL_12;
      goto LABEL_7;
    }

  }
LABEL_7:
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cacheInputManager:", v15);

  objc_msgSend(v9, "inputManagerForInputMode:withKeyboardState:class:", v26, v8, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerWrapper setInputManager:](self, "setInputManager:", v16);

  -[TIKeyboardInputManagerWrapper cachedContextChangeTrigger](self, "cachedContextChangeTrigger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerWrapper cachedContextChangeTrigger](self, "cachedContextChangeTrigger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "changingContextWithTrigger:", v19);

    -[TIKeyboardInputManagerWrapper setCachedContextChangeTrigger:](self, "setCachedContextChangeTrigger:", 0);
  }
  v20 = objc_alloc_init(TITypologyPreferences);
  if (_typologyProfileOptInManager_onceToken != -1)
    dispatch_once(&_typologyProfileOptInManager_onceToken, &__block_literal_global_2161);
  -[TITypologyPreferences setTypologyProfileOptInManager:](v20, "setTypologyProfileOptInManager:", _typologyProfileOptInManager_optInManager);
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTypologyPreferences:", v20);

  v22 = -[TIKeyboardInputManagerLogger initWithTypologyPreferences:]([TIKeyboardInputManagerLogger alloc], "initWithTypologyPreferences:", v20);
  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setInputManagerLogger:", v22);

  -[TIKeyboardInputManagerWrapper inputManager](self, "inputManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configurationPropertyList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLogger setConfig:](v22, "setConfig:", v25);

LABEL_12:
}

void __42__TIKeyboardInputManagerPolymorph_dealloc__block_invoke(uint64_t a1)
{
  id v2;

  +[TIKeyboardInputManagerLoader sharedLoader](TIKeyboardInputManagerLoader, "sharedLoader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheInputManager:", *(_QWORD *)(a1 + 32));

}

- (void)handleKeyboardState:(id)a3 withInputEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerPolymorph;
  v6 = a4;
  v7 = a3;
  -[TIKeyboardInputManagerWrapper handleKeyboardState:withInputEvent:](&v8, sel_handleKeyboardState_withInputEvent_, v7, v6);
  -[TIKeyboardInputManagerPolymorph setInputManagerForKeyboardState:withInputEvent:](self, "setInputManagerForKeyboardState:withInputEvent:", v7, v6, v8.receiver, v8.super_class);

}

- (void)setInputManagerForKeyboardState:(id)a3 withInputEvent:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIInputMode inputModeWithIdentifier:isSiriMode:](TIInputMode, "inputModeWithIdentifier:isSiriMode:", v5, TIISTypetoSiriMode());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE308]);

  if ((_DWORD)v6 && (objc_msgSend(v8, "isSiriMode") & 1) == 0)
    v10 = objc_msgSend(v8, "multilingualInputManagerClass");
  else
    v10 = objc_msgSend(v8, "inputManagerClass");
  v11 = v10;
  if (objc_msgSend(v23, "hardwareKeyboardMode"))
  {
    objc_msgSend(v8, "languageWithRegion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ja_JP"));

    if (v13)
    {
      objc_msgSend(v23, "inputMode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetComponentsFromIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", CFSTR("hw"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("KANA"));

      if (v17)
        v18 = CFSTR("ja_JP-Kana");
      else
        v18 = CFSTR("ja_JP-Romaji");
      +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v19, "inputManagerClass");
      v8 = v19;
    }
  }
  objc_msgSend(v8, "languageWithRegion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("ars"));

  if (v21)
  {
    +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", CFSTR("ar"));
    v22 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v22;
  }
  -[TIKeyboardInputManagerPolymorph setInputManagerForInputMode:withKeyboardState:class:](self, "setInputManagerForInputMode:withKeyboardState:class:", v8, v23, v11);

}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const void *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  os_signpost_id_t v26;
  os_signpost_id_t v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  os_signpost_id_t v32;
  os_signpost_id_t v33;
  objc_super v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  kdebug_trace();
  kac_get_log();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (const void *)((unint64_t)self ^ 0x64);
  v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 0x64));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.polymorph.keyboardInput", ", buf, 2u);
    }
  }

  objc_msgSend(v8, "touchEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "pathIndex");

  objc_msgSend(v8, "touchEvent");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17
    && (v18 = (void *)v17,
        objc_msgSend(v9, "layoutState"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "userInterfaceIdiom"),
        v19,
        v18,
        v20 == 1))
  {
    objc_msgSend(v8, "touchEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "stage");

    if (v22 == 5)
    {
LABEL_15:
      objc_msgSend(v8, "touchEvent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "stage");

      if (v29 == 5 || !v29)
      {
        +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "restTouchEndWithPathIndex:", v16);

      }
      goto LABEL_18;
    }
    if (v22 != 4)
    {
      v24 = 1;
      goto LABEL_11;
    }
    +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "restTouchStartWithPathIndex:", v16);
    v24 = 1;
  }
  else
  {
    +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "restResetTouches");
    v24 = 0;
  }

LABEL_11:
  kdebug_trace();
  kac_get_log();
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = os_signpost_id_make_with_pointer(v25, (const void *)((unint64_t)self ^ 0x65));
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v27 = v26;
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "kbdManager.polymorph.keyboardInput.super", ", buf, 2u);
    }
  }

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __87__TIKeyboardInputManagerPolymorph_handleKeyboardInput_keyboardState_completionHandler___block_invoke;
  v35[3] = &unk_1EA0FB178;
  v35[4] = self;
  v36 = v10;
  v34.receiver = self;
  v34.super_class = (Class)TIKeyboardInputManagerPolymorph;
  -[TIKeyboardInputManagerWrapper handleKeyboardInput:keyboardState:completionHandler:](&v34, sel_handleKeyboardInput_keyboardState_completionHandler_, v8, v9, v35);

  if (v24)
    goto LABEL_15;
LABEL_18:
  kdebug_trace();
  kac_get_log();
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = os_signpost_id_make_with_pointer(v31, v12);
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v33 = v32;
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v31, OS_SIGNPOST_INTERVAL_END, v33, "kbdManager.polymorph.keyboardInput", ", buf, 2u);
    }
  }

}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const void *v9;
  os_signpost_id_t v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  objc_super v24;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  kdebug_trace();
  kac_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)((unint64_t)self ^ 0x66);
  v10 = os_signpost_id_make_with_pointer(v8, (const void *)((unint64_t)self ^ 0x66));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdManager.polymorph.skipHitTest", ", buf, 2u);
    }
  }

  v12 = objc_msgSend(v6, "pathIndex");
  if (v6
    && (v13 = v12,
        objc_msgSend(v7, "layoutState"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "userInterfaceIdiom"),
        v14,
        v15 == 1))
  {
    v16 = objc_msgSend(v6, "stage");
    if (v16 != 5)
    {
      if (v16 == 4)
      {
        +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "restTouchStartWithPathIndex:", v13);

      }
      else
      {
        v24.receiver = self;
        v24.super_class = (Class)TIKeyboardInputManagerPolymorph;
        -[TIKeyboardInputManagerWrapper skipHitTestForTouchEvent:keyboardState:](&v24, sel_skipHitTestForTouchEvent_keyboardState_, v6, v7);
      }
    }
    v19 = objc_msgSend(v6, "stage");
    if (v19 == 5 || !v19)
    {
      +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "restTouchEndWithPathIndex:", v13);

    }
  }
  else
  {
    +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "restResetTouches");

    v24.receiver = self;
    v24.super_class = (Class)TIKeyboardInputManagerPolymorph;
    -[TIKeyboardInputManagerWrapper skipHitTestForTouchEvent:keyboardState:](&v24, sel_skipHitTestForTouchEvent_keyboardState_, v6, v7);
  }
  kdebug_trace();
  kac_get_log();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = os_signpost_id_make_with_pointer(v21, v9);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v23 = v22;
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v21, OS_SIGNPOST_INTERVAL_END, v23, "kbdManager.polymorph.skipHitTest", ", buf, 2u);
    }
  }

}

void __87__TIKeyboardInputManagerPolymorph_handleKeyboardInput_keyboardState_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, id);
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, id))(v5 + 16);
  v7 = a3;
  v8 = a2;
  v6(v5, v8, v7);
  +[TITypingAssertion sharedTypingAssertion](TITypingAssertion, "sharedTypingAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "touchWithReason:", 1);

  kdebug_trace();
  kac_get_log();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, (const void *)(*(_QWORD *)(a1 + 32) ^ 0x65));

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v10, OS_SIGNPOST_INTERVAL_END, v11, "kbdManager.polymorph.keyboardInput.super", ", v12, 2u);
  }

}

@end
