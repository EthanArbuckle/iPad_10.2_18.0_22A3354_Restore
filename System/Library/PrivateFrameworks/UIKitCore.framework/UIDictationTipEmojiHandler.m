@implementation UIDictationTipEmojiHandler

- (UIDictationTipEmojiHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDictationTipEmojiHandler;
  return -[UIDictationTipEmojiHandler init](&v3, sel_init);
}

- (id)replaceEmojiInStringWithEmojiDictationCommand:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  if ((objc_msgSend(v3, "_containsEmoji") & 1) != 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v18 = 0;
    v19 = &v18;
    v20 = 0x3010000000;
    v22 = 0;
    v23 = 0;
    v21 = &unk_18685B0AF;
    v5 = objc_msgSend(v3, "length");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__UIDictationTipEmojiHandler_replaceEmojiInStringWithEmojiDictationCommand___block_invoke;
    v14[3] = &unk_1E16BFF98;
    v17 = &v18;
    v6 = v4;
    v15 = v6;
    v7 = v3;
    v16 = v7;
    objc_msgSend(v7, "_enumerateEmojiTokensInRange:block:", 0, v5, v14);
    v8 = v19[4];
    v9 = objc_msgSend(v7, "length");
    objc_msgSend(v7, "substringWithRange:", v8, v9 - v19[4]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v10);

    v11 = v16;
    v12 = v6;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v12 = v3;
  }

  return v12;
}

void __76__UIDictationTipEmojiHandler_replaceEmojiInStringWithEmojiDictationCommand___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v8, a3 - v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v11 + 32) = a3 + a4;
  *(_QWORD *)(v11 + 40) = 0;
  v12 = &off_1E167A000;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentInputMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictationLanguage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2050000000;
    v16 = (void *)_MergedGlobals_1001;
    v41 = _MergedGlobals_1001;
    if (!_MergedGlobals_1001)
    {
      v33 = MEMORY[0x1E0C809B0];
      v34 = 3221225472;
      v35 = __getEMFEmojiLocaleDataClass_block_invoke;
      v36 = &unk_1E16B14C0;
      v37 = &v38;
      __getEMFEmojiLocaleDataClass_block_invoke((uint64_t)&v33);
      v16 = (void *)v39[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v38, 8);
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentInputMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictationLanguage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emojiLocaleDataWithLocaleIdentifier:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = &off_1E167A000;
  }
  else
  {
    v21 = 0;
  }

  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v22 = (void *)qword_1ECD7D458;
  v41 = qword_1ECD7D458;
  if (!qword_1ECD7D458)
  {
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __getEMFEmojiTokenClass_block_invoke;
    v36 = &unk_1E16B14C0;
    v37 = &v38;
    __getEMFEmojiTokenClass_block_invoke((uint64_t)&v33);
    v22 = (void *)v39[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v38, 8);
  objc_msgSend(v7, "string");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "emojiTokenWithString:localeData:", v24, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "nameForType:", 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v12[476], "sharedInputModeController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "currentInputMode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictationLanguage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    _UILocalizedStringWithLocale(CFSTR("added emoji name"), (uint64_t)CFSTR("add in emoji word"), CFSTR("%@ emoji"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v30, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v31);

  }
  else
  {
    v32 = *(void **)(a1 + 32);
    objc_msgSend(v25, "string");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "appendString:", v30);
  }

}

@end
