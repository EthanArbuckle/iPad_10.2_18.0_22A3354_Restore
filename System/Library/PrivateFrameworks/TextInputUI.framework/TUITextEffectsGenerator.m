@implementation TUITextEffectsGenerator

- (TUITextEffectsGenerator)initWithLocale:(id)a3
{
  NSLocale *v4;
  TUITextEffectsGenerator *v5;
  NSLocale *locale;
  NSLocale *v7;
  uint64_t v8;
  TESLocaleData *localeData;
  objc_super v11;

  v4 = (NSLocale *)a3;
  v11.receiver = self;
  v11.super_class = (Class)TUITextEffectsGenerator;
  v5 = -[TUITextEffectsGenerator init](&v11, sel_init);
  locale = v5->_locale;
  v5->_locale = v4;
  v7 = v4;

  objc_msgSend(MEMORY[0x1E0D1F280], "localeDataWithLocale:", v5->_locale);
  v8 = objc_claimAutoreleasedReturnValue();
  localeData = v5->_localeData;
  v5->_localeData = (TESLocaleData *)v8;

  return v5;
}

- (int64_t)candidateSourceType
{
  return 3;
}

- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, _BYTE *);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(a3, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextBeforeInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length") || -[TUITextEffectsGenerator _endsWithWhitespace:](self, "_endsWithWhitespace:", v8))
    goto LABEL_11;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5649;
  v43 = __Block_byref_object_dispose__5650;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5649;
  v37 = __Block_byref_object_dispose__5650;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  -[TUITextEffectsGenerator localeData](self, "localeData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "length");
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __73__TUITextEffectsGenerator_generateCandidatesForKeyboardState_completion___block_invoke;
  v24 = &unk_1E24FBA18;
  v25 = v8;
  v26 = &v39;
  v27 = &v33;
  v28 = &v29;
  objc_msgSend(v9, "enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:", v25, 0, v10, 6, &v21);

  v11 = v40[5];
  if (!v11)
    goto LABEL_7;
  if (v34[5])
  {
    objc_msgSend(MEMORY[0x1E0DBDD18], "candidateWithCandidate:forInput:forTextEffectName:", v11, v40[5], v21, v22, v23, v24);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (*((_BYTE *)v30 + 24))
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", v12, 0);
      v15 = (void *)MEMORY[0x1E0DBDB48];
      v16 = v14;
      v17 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0DBDB48];
      v45[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      v16 = 0;
      v17 = v14;
    }
    objc_msgSend(v15, "listWithCorrections:predictions:emojiList:inlineCompletions:", v16, v17, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v20);
    v18 = 0;
  }
  else
  {
LABEL_7:
    v18 = 1;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  if (v18)
LABEL_11:
    v6[2](v6, 0);

}

- (BOOL)_endsWithWhitespace:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "longCharacterIsMember:", objc_msgSend(v3, "_lastLongCharacter"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)generatedCandidateType
{
  return 3;
}

- (id)supportedTextEffectNames
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC4458], "animationNamesForDomain:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)syncToKeyboardState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v9, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsTextAnimationsType");

    v8 = v7 == 2;
  }
  else
  {
    v8 = 0;
  }
  -[TUITextEffectsGenerator setEnabled:](self, "setEnabled:", v8);
  -[TUITextEffectsGenerator _updateTESLocaleDataIfNeeded](self, "_updateTESLocaleDataIfNeeded");

}

- (void)_updateTESLocaleDataIfNeeded
{
  NSLocale *v3;
  TESLocaleData *v4;
  TESLocaleData *localeData;
  NSLocale *v6;

  -[TUITextEffectsGenerator _keyboardPrimaryLanguageLocale](self, "_keyboardPrimaryLanguageLocale");
  v3 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  if (self->_locale != v3)
  {
    v6 = v3;
    objc_storeStrong((id *)&self->_locale, v3);
    v4 = (TESLocaleData *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F280]), "initWithLocale:", self->_locale);
    localeData = self->_localeData;
    self->_localeData = v4;

    v3 = v6;
  }

}

- (id)_keyboardPrimaryLanguageLocale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "primaryLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (TESLocaleData)localeData
{
  return self->_localeData;
}

- (void)setLocaleData:(id)a3
{
  objc_storeStrong((id *)&self->_localeData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeData, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

void __73__TUITextEffectsGenerator_generateCandidatesForKeyboardState_completion___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = objc_msgSend(v14, "matchRange");
  v7 = v6
     + _isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext(v5, v6, *(void **)(a1 + 32));
  if (v7 + v5 == objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(MEMORY[0x1E0D1F280], "animationNameForTextEffectType:", objc_msgSend(v14, "effectType"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v14, "suggestionBehavior") == 2;
    *a3 = 1;
  }

}

@end
