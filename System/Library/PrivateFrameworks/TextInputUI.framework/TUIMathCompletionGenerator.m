@implementation TUIMathCompletionGenerator

- (TUIMathCompletionGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIMathCompletionGenerator;
  return -[TUIMathCompletionGenerator init](&v3, sel_init);
}

- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  TUIMathCompletionGenerator *v28;
  id v29;
  void (**v30)(id, _QWORD);
  _QWORD v31[3];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "documentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextBeforeInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "documentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contextAfterInput");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[TUIMathCompletionGenerator endsWithExpressionTriggerCharacter:](self, "endsWithExpressionTriggerCharacter:", v9))goto LABEL_7;
  -[TUIMathCompletionGenerator expressionMatchForLocation:inTextStorage:](self, "expressionMatchForLocation:inTextStorage:", objc_msgSend(v9, "length"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
LABEL_6:

LABEL_7:
    v7[2](v7, 0);
    goto LABEL_8;
  }
  v14 = objc_msgSend(v12, "range");
  objc_msgSend(v9, "substringWithRange:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIMathCompletionGenerator normalizeExpressionString:](self, "normalizeExpressionString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "length"))
  {

    goto LABEL_6;
  }
  v23 = (void *)MEMORY[0x1E0D09EC0];
  v31[0] = *MEMORY[0x1E0D09E70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v24;
  v31[1] = *MEMORY[0x1E0D09E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v22;
  v31[2] = CFSTR("CalculateKeyAllowCurrencyConversions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __76__TUIMathCompletionGenerator_generateCandidatesForKeyboardState_completion___block_invoke;
  v25[3] = &unk_1E24FB700;
  v30 = v7;
  v26 = v11;
  v27 = v16;
  v28 = self;
  v29 = v6;
  v20 = v16;
  v21 = (id)objc_msgSend(v23, "evaluate:options:resultHandler:", v17, v19, v25);

LABEL_8:
}

- (void)syncToKeyboardState:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v12;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v12, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mathExpressionCompletionType");

    if (v8 == 1)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueForPreferenceKey:", *MEMORY[0x1E0DBE300]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "BOOLValue");

    }
    -[TUIMathCompletionGenerator setEnabled:](self, "setEnabled:", v9);
    v6 = v12;
  }

}

- (BOOL)textBeginsWithPrediction:(id)a3 prediction:(id)a4
{
  return objc_msgSend(a3, "hasPrefix:", a4);
}

- (BOOL)endsWithExpressionTriggerCharacter:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(&unk_1E25177E0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(&unk_1E25177E0);
        if ((objc_msgSend(v3, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(&unk_1E25177E0, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (id)normalizeExpressionString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[TUIMathCompletionGenerator endsWithExpressionTriggerCharacter:](self, "endsWithExpressionTriggerCharacter:", v4)&& objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)expressionMatches:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  length = a4.length;
  location = a4.location;
  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D09EC0];
  v13 = *MEMORY[0x1E0D09EB8];
  v7 = (void *)MEMORY[0x1E0CB3B18];
  v8 = a3;
  objc_msgSend(v7, "valueWithRange:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scan:options:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)expressionMatchForLocation:(int64_t)a3 inTextStorage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v6 = a4;
  objc_msgSend(v6, "getLineStart:end:contentsEnd:forRange:", 0, 0, 0, 0, 0);
  -[TUIMathCompletionGenerator expressionMatches:range:](self, "expressionMatches:range:", v6, 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "range");
  v10 = 0;
  if (v9 + v11 == a3)
    v10 = v8;

  return v10;
}

- (int64_t)generatedCandidateType
{
  return 3;
}

- (int64_t)candidateSourceType
{
  return 1;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

void __76__TUIMathCompletionGenerator_generateCandidatesForKeyboardState_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
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
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && !objc_msgSend(v5, "isTrivial"))
  {
    objc_msgSend(v5, "formattedResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(*(id *)(a1 + 32), "length");
    v9 = (void *)MEMORY[0x1E0DBDBE8];
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithUnchangedInput:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", v7, &stru_1E24FC6C0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", v10, 0);
      v13 = *(void **)(a1 + 48);
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "formattedResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = objc_msgSend(v13, "textBeginsWithPrediction:prediction:", v14, v15);

      v16 = (void *)MEMORY[0x1E0DBDB48];
      if ((_DWORD)v14)
      {
        objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:inlineCompletions:", v12, 0, 0, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        goto LABEL_14;
      }
      v30[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v16;
      v24 = v12;
      v25 = v21;
      v26 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), *(_QWORD *)(a1 + 40), v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "candidateWithCandidate:forInput:property:", v18, *(_QWORD *)(a1 + 40), 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", v7, *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", v10, 0);
      v19 = objc_msgSend(*(id *)(a1 + 56), "inlineCompletionEnabled");
      v20 = (void *)MEMORY[0x1E0DBDB48];
      if (v19)
      {
        v29 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "listWithCorrections:predictions:emojiList:inlineCompletions:", v12, 0, v21, v22);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        goto LABEL_13;
      }
      v27 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v20;
      v24 = v12;
      v25 = 0;
      v26 = v21;
    }
    objc_msgSend(v23, "listWithCorrections:predictions:emojiList:inlineCompletions:", v24, v25, v26, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_14:

}

@end
