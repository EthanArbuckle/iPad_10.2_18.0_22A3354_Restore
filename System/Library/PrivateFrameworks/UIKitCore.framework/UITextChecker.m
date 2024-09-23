@implementation UITextChecker

+ (BOOL)grammarCheckingEnabled
{
  if (qword_1ECD7B3A8 != -1)
    dispatch_once(&qword_1ECD7B3A8, &__block_literal_global_411_0);
  return byte_1ECD7B2FA;
}

+ (NSArray)availableLanguages
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  getAppleSpellClass();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v3 = 0;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("ar"), CFSTR("ars"), CFSTR("bg_BG"), CFSTR("cs_CZ"), CFSTR("da_DK"), CFSTR("de_DE"), CFSTR("el_GR"), CFSTR("en_AU"), CFSTR("en_CA"), CFSTR("en_GB"), CFSTR("en_IN"), CFSTR("en_NZ"), CFSTR("en_SG"), CFSTR("en_US"), CFSTR("en_ZA"), CFSTR("es_ES"), CFSTR("es_MX"),
      CFSTR("fi_FI"),
      CFSTR("fr_FR"),
      CFSTR("ga_IE"),
      CFSTR("hi"),
      CFSTR("hu_HU"),
      CFSTR("it_IT"),
      CFSTR("nb_NO"),
      CFSTR("nl_NL"),
      CFSTR("nn"),
      CFSTR("pa"),
      CFSTR("pl_PL"),
      CFSTR("pt_BR"),
      CFSTR("pt_PT"),
      CFSTR("ro_RO"),
      CFSTR("ru_RU"),
      CFSTR("sv_SE"),
      CFSTR("te"),
      CFSTR("tr_TR"),
      CFSTR("uk_UA"),
      CFSTR("vi_VN"),
      0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  objc_msgSend(getAppleSpellClass(), "availableLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_6;
  v4 = v2;
  if (!objc_msgSend(v2, "count"))
    goto LABEL_6;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardGetCurrentInputMode();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    TIInputModeGetNormalizedIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "member:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "addObject:", v8);
        objc_msgSend(v5, "removeObject:", v8);
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = (id)UIKeyboardActiveInputModes;
  v11 = v10;
  if (v10)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          TIInputModeGetNormalizedIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "containsObject:", v16))
          {
            objc_msgSend(v6, "addObject:", v16);
            objc_msgSend(v5, "removeObject:", v16);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }
  }
  objc_msgSend(v5, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v17);

  return (NSArray *)v6;
}

+ (int64_t)uniqueSpellDocumentTag
{
  return uniqueSpellDocumentTag_nextSpellCheckerTag++;
}

- (id)_nameOfDictionaryForDocumentTag:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%10d->0x%10lx"), getpid(), a3);
}

- (void)_setLanguageDictionaryName:(id)a3
{
  objc_msgSend((id)qword_1ECD7B308, "replaceObjectAtIndex:withObject:", 1, a3);
}

- (void)_setDocumentDictionaryName:(id)a3
{
  objc_msgSend((id)qword_1ECD7B308, "replaceObjectAtIndex:withObject:", 2, a3);
}

- (void)initUserDictionaries
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;

  if (!qword_1ECD7B308)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECD7B308;
    qword_1ECD7B308 = v3;

    objc_msgSend((id)qword_1ECD7B308, "addObject:", *MEMORY[0x1E0CB2B58]);
    objc_msgSend((id)qword_1ECD7B308, "addObject:", CFSTR("en_US"));
    v5 = (void *)qword_1ECD7B308;
    -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if (!qword_1ECD7B310)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)qword_1ECD7B310;
    qword_1ECD7B310 = v7;

  }
  if (!qword_1ECD7B318)
  {
    v9 = dispatch_queue_create("com.apple.UITextChecker.dictionaries", 0);
    v10 = (void *)qword_1ECD7B318;
    qword_1ECD7B318 = (uint64_t)v9;

  }
}

- (void)initGlobalsWithAsynchronousLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a3;
  v5 = (void *)MEMORY[0x186DC9484](self, a2);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v7 = (void *)qword_1ECD7B300;
  qword_1ECD7B300 = (uint64_t)v6;

  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA998]), "initWithMaximumCapacity:", 512);
  v9 = (void *)qword_1ECD7B330;
  qword_1ECD7B330 = v8;

  -[UITextChecker initUserDictionaries](self, "initUserDictionaries");
  v10 = objc_alloc_init((Class)getAppleSpellClass());
  v11 = (void *)qword_1ECD7B320;
  qword_1ECD7B320 = (uint64_t)v10;

  objc_msgSend((id)qword_1ECD7B320, "spellServer:findMisspelledWordInString:language:wordCount:countOnly:correction:", 0, CFSTR("abcxyz"), self->_checkerWarmingLanguage, 0, 0, 0);
  if (v3)
    dispatch_sync(MEMORY[0x1E0C80D38], &__block_literal_global_580);
  else
    _MergedGlobals_7_12 = 1;
  objc_autoreleasePoolPop(v5);
}

void __52__UITextChecker_initGlobalsWithAsynchronousLoading___block_invoke()
{
  _MergedGlobals_7_12 = 1;
}

- (void)initPostEditingWithAsynchronousLoading:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v4 = (void *)MEMORY[0x186DC9484](self, a2);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v5 = (void *)qword_1ECD7B398;
  v15 = qword_1ECD7B398;
  if (!qword_1ECD7B398)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getTCPostEditorClass_block_invoke;
    v11[3] = &unk_1E16B14C0;
    v11[4] = &v12;
    __getTCPostEditorClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v12, 8);
  v7 = [v6 alloc];
  v8 = objc_msgSend(v7, "initWithChecker:", qword_1ECD7B320);
  v9 = (void *)qword_1ECD7B328;
  qword_1ECD7B328 = v8;

  v10 = (id)objc_msgSend((id)qword_1ECD7B328, "grammarDetailForString:range:language:", CFSTR("This is a test. This is another."), 16, 4, CFSTR("en"));
  if (v3)
    dispatch_sync(MEMORY[0x1E0C80D38], &__block_literal_global_55_2);
  else
    byte_1ECD7B2F9 = 1;
  objc_autoreleasePoolPop(v4);
}

void __56__UITextChecker_initPostEditingWithAsynchronousLoading___block_invoke()
{
  byte_1ECD7B2F9 = 1;
}

- (UITextChecker)init
{
  return (UITextChecker *)-[UITextChecker _initWithAsynchronousLoading:](self, "_initWithAsynchronousLoading:", 0);
}

- (id)_initWithAsynchronousLoading:(BOOL)a3
{
  UITextChecker *v4;
  void *v5;
  uint64_t v6;
  NSString *checkerWarmingLanguage;
  UITextChecker *v8;
  UITextChecker *v9;
  UITextChecker *v10;
  _QWORD v12[4];
  UITextChecker *v13;
  BOOL v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UITextChecker;
  v4 = -[UITextChecker init](&v15, sel_init);
  v4->_usdt = +[UITextChecker uniqueSpellDocumentTag](UITextChecker, "uniqueSpellDocumentTag");
  objc_msgSend((id)objc_opt_class(), "availableLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = objc_claimAutoreleasedReturnValue();
  checkerWarmingLanguage = v4->_checkerWarmingLanguage;
  v4->_checkerWarmingLanguage = (NSString *)v6;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__UITextChecker__initWithAsynchronousLoading___block_invoke;
  v12[3] = &unk_1E16B1B78;
  v14 = a3;
  v8 = v4;
  v9 = v8;
  v13 = v8;
  if (_initWithAsynchronousLoading__onceToken == -1)
  {
    v10 = v8;
  }
  else
  {
    dispatch_once(&_initWithAsynchronousLoading__onceToken, v12);
    v10 = v13;
  }

  return v9;
}

void __46__UITextChecker__initWithAsynchronousLoading___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  _QWORD *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  if (*(_BYTE *)(a1 + 40))
  {
    dispatch_get_global_queue(17, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__UITextChecker__initWithAsynchronousLoading___block_invoke_2;
    v7[3] = &unk_1E16B1B28;
    v3 = &v8;
    v8 = *(id *)(a1 + 32);
    v4 = v7;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "initGlobalsWithAsynchronousLoading:", 0);
    if (!+[UITextChecker grammarCheckingEnabled](UITextChecker, "grammarCheckingEnabled"))
      return;
    dispatch_get_global_queue(17, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__UITextChecker__initWithAsynchronousLoading___block_invoke_3;
    v5[3] = &unk_1E16B1B28;
    v3 = &v6;
    v6 = *(id *)(a1 + 32);
    v4 = v5;
  }
  dispatch_async(v2, v4);

}

uint64_t __46__UITextChecker__initWithAsynchronousLoading___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "initGlobalsWithAsynchronousLoading:", 1);
  result = +[UITextChecker grammarCheckingEnabled](UITextChecker, "grammarCheckingEnabled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "initPostEditingWithAsynchronousLoading:", 1);
  return result;
}

uint64_t __46__UITextChecker__initWithAsynchronousLoading___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initPostEditingWithAsynchronousLoading:", 1);
}

- (BOOL)_doneLoading
{
  return _MergedGlobals_7_12;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextChecker setIgnoredWords:](self, "setIgnoredWords:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UITextChecker;
  -[UITextChecker dealloc](&v3, sel_dealloc);
}

- (id)_checker
{
  if (_MergedGlobals_7_12)
    return (id)qword_1ECD7B320;
  else
    return 0;
}

- (void)resetAllLanguageModels
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  -[UITextChecker _checker](self, "_checker");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend((id)qword_1ECD7B300, "lock", v5);
      objc_msgSend(v5, "resetAllLanguageModels");
      objc_msgSend((id)qword_1ECD7B300, "unlock");
      v3 = v5;
    }
  }

}

- (void)releaseAllLexicons
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  -[UITextChecker _checker](self, "_checker");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend((id)qword_1ECD7B300, "lock", v5);
      objc_msgSend(v5, "releaseAllLexicons");
      objc_msgSend((id)qword_1ECD7B300, "unlock");
      v3 = v5;
    }
  }

}

+ (id)keyboardLanguages
{
  void *v2;
  void *v3;
  void *v4;
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "multilingualLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "multilingualLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "primaryLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "languageWithRegion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detectedLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "language");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "containsObject:", v13) & 1) == 0)
    {
      objc_msgSend(v6, "arrayByAddingObject:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:

      v6 = (void *)v14;
    }
  }
  else
  {
    if (v12 && (objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
    {
      objc_msgSend(v6, "arrayByAddingObject:", v12);
      v14 = objc_claimAutoreleasedReturnValue();
      v13 = 0;
      goto LABEL_13;
    }
    v13 = 0;
  }

  return v6;
}

- (int64_t)adjustOffsetToNextWordBoundaryInString:(id)a3 startingAt:(int64_t)a4
{
  id v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (a4 >= 1)
  {
    v7 = v6;
    v8 = v6 - a4;
    if (v6 > a4)
    {
      if (qword_1ECD7B340 != -1)
        dispatch_once(&qword_1ECD7B340, &__block_literal_global_146_2);
      if ((objc_msgSend((id)qword_1ECD7B338, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", a4)) & 1) == 0)
      {
        v9 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:range:", qword_1ECD7B338, 0, a4, v8);
        if (v10)
          a4 = v9;
        else
          a4 = v7;
      }
    }
  }

  return a4;
}

void __67__UITextChecker_adjustOffsetToNextWordBoundaryInString_startingAt___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B338;
  qword_1ECD7B338 = v0;

  v2 = (void *)qword_1ECD7B338;
  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formUnionWithCharacterSet:", v3);

}

- (_NSRange)_chunkAndCheckGrammarInString:(id)a3 language:(id)a4 usingChecker:(id)a5 details:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSUInteger v13;
  unint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  id v18;
  id v19;
  void *v20;
  NSUInteger v21;
  NSUInteger v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  NSUInteger v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  id v32;
  NSUInteger v33;
  NSUInteger v34;
  id *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _NSRange result;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = NSPageSize();
  v14 = objc_msgSend(v10, "length");
  v37 = v10;
  if (v13 <= v14)
  {
    v23 = v14;
    v35 = a6;
    v36 = v12;
    if (v14)
    {
      v24 = 0;
      v19 = 0;
      v25 = 0;
      v26 = v13;
      while (1)
      {
        if (v26 + v24 >= v23)
        {
          v27 = v37;
        }
        else
        {
          v27 = v37;
          v28 = objc_msgSend(v37, "paragraphRangeForRange:", v24, v26);
          if (v28 + v29 > v26 + v24)
            v26 = v28 + v29 - v24;
        }
        objc_msgSend(v27, "substringWithRange:", v24, v26);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = 0;
        v30 = objc_msgSend(v36, "spellServer:checkGrammarInString:language:details:", self, v20, v11, &v38);
        v22 = v31;
        v32 = v38;
        v19 = v32;
        if (v22)
        {
          if (v30 != 0x7FFFFFFFFFFFFFFFLL)
            break;
        }
        v24 += v26;
        if (v24 + v13 <= v23)
          v26 = v13;
        else
          v26 = v23 - v24;
        v25 = v20;
        if (v23 <= v24)
          goto LABEL_28;
      }
      if (v35)
        *v35 = objc_retainAutorelease(v32);
      v15 = v30 + v24;
      v12 = v36;
    }
    else
    {
      v20 = 0;
      v19 = 0;
LABEL_28:
      v12 = v36;
      v22 = 0;
      if (v35)
        *v35 = 0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    v39 = 0;
    v15 = objc_msgSend(v12, "spellServer:checkGrammarInString:language:details:", self, v10, v11, &v39);
    v17 = v16;
    v18 = v39;
    v19 = v18;
    v20 = 0;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      v21 = 0;
    else
      v21 = v17;
    if (v17)
      v22 = v21;
    else
      v22 = 0;
    if (!v17)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    if (a6 && v22)
    {
      v19 = objc_retainAutorelease(v18);
      v20 = 0;
      *a6 = v19;
      v22 = v21;
    }
  }

  v33 = v15;
  v34 = v22;
  result.length = v34;
  result.location = v33;
  return result;
}

- (_NSRange)_chunkAndFindMisspelledWordInString:(id)a3 languages:(id)a4 learnedDictionaries:(id)a5 wordCount:(int64_t *)a6 correction:(id *)a7 usingChecker:(id)a8
{
  id v12;
  NSUInteger v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v20;
  unint64_t v21;
  void *v22;
  NSUInteger v23;
  NSUInteger v24;
  void *v25;
  uint64_t v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger v29;
  uint64_t v30;
  id v32;
  id v33;
  uint64_t v34;
  _NSRange result;

  v12 = a3;
  v33 = a4;
  v32 = a8;
  v13 = NSPageSize();
  v14 = objc_msgSend(v12, "length");
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    *a6 = -1;
  v34 = 0;
  if (v13 <= v14)
  {
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14)
    {
      v21 = 0;
      v22 = 0;
      v23 = v13;
      while (1)
      {
        if (v23 && v21 + v23 < v14)
        {
          while ((objc_msgSend(v15, "characterIsMember:", objc_msgSend(v12, "characterAtIndex:", v21 - 1 + v23)) & 1) == 0)
          {
            if (!--v23)
            {
              if (v21 + v13 <= v14)
                v23 = v13;
              else
                v23 = v14 - v21;
              break;
            }
          }
        }
        else
        {
          if (v21 + v13 <= v14)
            v24 = v13;
          else
            v24 = v14 - v21;
          if (!v23)
            v23 = v24;
        }
        objc_msgSend(v12, "substringWithRange:", v21, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = objc_msgSend(v32, "spellServer:findMisspelledWordInString:languages:wordCount:countOnly:correction:", self, v25, v33, &v34, 0, a7);
        v20 = v27;
        if (a6)
          *a6 = (*a6 & ~((*a6 | v34) >> 63)) + v34;
        if (v27 && v26 != 0x7FFFFFFFFFFFFFFFLL)
          break;
        v21 += v23;
        if (v21 + v13 <= v14)
          v23 = v13;
        else
          v23 = v14 - v21;
        v22 = v25;
        if (v14 <= v21)
        {

          v20 = 0;
          v30 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_39;
        }
      }
      v30 = v26 + v21;

    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v16 = objc_msgSend(v32, "spellServer:findMisspelledWordInString:languages:wordCount:countOnly:correction:", self, v12, v33, &v34, 0, a7);
    v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || v17 == 0)
      v20 = 0;
    else
      v20 = v17;
    if (v17)
      v18 = v16;
    v30 = v18;
    if (a6)
      *a6 = v34;
  }
LABEL_39:

  v28 = v30;
  v29 = v20;
  result.length = v29;
  result.location = v28;
  return result;
}

- (_NSRange)rangeOfMisspelledWordInString:(id)a3 range:(_NSRange)a4 startingAt:(int64_t)a5 wrap:(BOOL)a6 languages:(id)a7
{
  _BOOL8 v8;
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  NSUInteger v21;
  NSUInteger v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  _NSRange result;

  v8 = a6;
  length = a4.length;
  location = a4.location;
  v13 = a3;
  v14 = a7;
  v15 = objc_msgSend(v13, "length");
  if (location || v15 != length)
  {
    v19 = (void *)MEMORY[0x186DC9484](v15);
    objc_msgSend(v13, "substringWithRange:", location, length);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (location + length < a5 && v8)
      v21 = 0;
    else
      v21 = a5 - location;
    if (a5 >= location)
      v22 = v21;
    else
      v22 = 0;
    v23 = -[UITextChecker checkSpellingOfString:startingAt:languages:wrap:correction:](self, "checkSpellingOfString:startingAt:languages:wrap:correction:", v20, v22, v14, v8, 0);
    v18 = v24;
    if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v16 = v23 + location;

    objc_autoreleasePoolPop(v19);
  }
  else
  {
    v16 = -[UITextChecker checkSpellingOfString:startingAt:languages:wrap:correction:](self, "checkSpellingOfString:startingAt:languages:wrap:correction:", v13, a5, v14, v8, 0);
    v18 = v17;
  }

  v25 = v16;
  v26 = v18;
  result.length = v26;
  result.location = v25;
  return result;
}

- (NSRange)rangeOfMisspelledWordInString:(NSString *)stringToCheck range:(NSRange)range startingAt:(NSInteger)startingOffset wrap:(BOOL)wrapFlag language:(NSString *)language
{
  _BOOL8 v8;
  NSUInteger length;
  NSUInteger location;
  NSString *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRange result;

  v8 = wrapFlag;
  length = range.length;
  location = range.location;
  v13 = stringToCheck;
  if (language)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", language);
    language = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v14 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v13, location, length, startingOffset, v8, language);
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 correction:(id *)a7
{
  _BOOL8 v8;
  id v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  v8 = a6;
  v12 = a3;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a5);
    a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = -[UITextChecker checkSpellingOfString:startingAt:languages:wrap:correction:](self, "checkSpellingOfString:startingAt:languages:wrap:correction:", v12, a4, a5, v8, a7);
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 languages:(id)a5 wrap:(BOOL)a6 correction:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSUInteger v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id *v28;
  NSUInteger v29;
  uint64_t v30;
  void *v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v34;
  id v35;
  void *context;
  void *contextb;
  void *contexta;
  uint64_t v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  _NSRange result;

  v8 = a6;
  v11 = a3;
  v12 = a5;
  v45 = -1;
  v42 = v11;
  v13 = objc_msgSend(v11, "length");
  v41 = v12;
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a7)
    *a7 = 0;
  v16 = 0;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  if (v13 && v14)
  {
    if ((objc_msgSend(v14, "isEqualToString:", &stru_1E16EDF20) & 1) != 0)
    {
      v16 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      goto LABEL_38;
    }
    v22 = (void *)MEMORY[0x186DC9484]();
    -[UITextChecker _checker](self, "_checker");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      contextb = v22;
      v39 = 0;
      v16 = 0;
      v19 = 0;
      v21 = 0;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
      objc_autoreleasePoolPop(contextb);
LABEL_35:
      if (a7)
      {
        v16 = objc_retainAutorelease(v16);
        *a7 = v16;
      }
      v18 = (void *)v39;
      goto LABEL_38;
    }
    v23 = -[UITextChecker adjustOffsetToNextWordBoundaryInString:startingAt:](self, "adjustOffsetToNextWordBoundaryInString:startingAt:", v42, a4);
    v24 = v23;
    if (v8)
    {
      if (v23 >= v13)
        v25 = 0;
      else
        v25 = v23;
      if (v23 > 0)
        v24 = v25;
      context = v22;
      if (v24 > 0)
      {
        objc_msgSend(v42, "substringFromIndex:", v24, v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "substringToIndex:", v24);
        v39 = objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
    }
    else
    {
      if (v23 >= 1 && v23 >= v13)
      {
        objc_autoreleasePoolPop(v22);
        v16 = 0;
        v18 = 0;
        v19 = 0;
        v21 = 0;
        v17 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_38;
      }
      context = v22;
      if (v23 > 0)
      {
        objc_msgSend(v42, "substringFromIndex:", v23, v22);
        v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
        v19 = v26;
        v39 = 0;
LABEL_24:
        objc_msgSend((id)qword_1ECD7B300, "lock", context);
        -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", v15);
        -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v27);

        if (a7)
          v28 = &v44;
        else
          v28 = 0;
        if (a7)
          v44 = 0;
        v17 = -[UITextChecker _chunkAndFindMisspelledWordInString:languages:learnedDictionaries:wordCount:correction:usingChecker:](self, "_chunkAndFindMisspelledWordInString:languages:learnedDictionaries:wordCount:correction:usingChecker:", v19, v41, qword_1ECD7B308, &v45, v28, v20);
        v21 = v29;
        v30 = v24;
        if (a7)
        {
          v16 = v44;
          if (!v21)
          {
LABEL_39:
            if (v39)
            {
              v45 = -1;
              if (a7)
                v43 = v16;
              v17 = -[UITextChecker _chunkAndFindMisspelledWordInString:languages:learnedDictionaries:wordCount:correction:usingChecker:](self, "_chunkAndFindMisspelledWordInString:languages:learnedDictionaries:wordCount:correction:usingChecker:");
              v21 = v34;
              if (a7)
              {
                v35 = v43;

                v16 = v35;
              }
            }
            goto LABEL_34;
          }
        }
        else
        {
          v16 = 0;
          if (!v29)
            goto LABEL_39;
        }
        v17 += v30;
LABEL_34:
        objc_msgSend((id)qword_1ECD7B300, "unlock");
        objc_autoreleasePoolPop(contexta);
        goto LABEL_35;
      }
    }
    v26 = v42;
    goto LABEL_23;
  }
LABEL_38:
  v31 = v18;

  v32 = v17;
  v33 = v21;
  result.length = v33;
  result.location = v32;
  return result;
}

- (_NSRange)checkGrammarOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 details:(id *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  NSUInteger v20;
  void *v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  NSUInteger v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
  void *context;
  void *contexta;
  id *v40;
  id v42;
  _NSRange result;

  v8 = a6;
  v11 = a3;
  v12 = a5;
  v13 = objc_msgSend(v11, "length");
  v14 = v13;
  if (a7)
    *a7 = 0;
  v15 = 0;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v12)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_42;
  }
  v40 = a7;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  if (v13)
  {
    if ((objc_msgSend(v12, "isEqualToString:", &stru_1E16EDF20) & 1) != 0)
    {
      v15 = 0;
      v17 = 0;
      v18 = 0;
      v19 = 0;
LABEL_7:
      v20 = 0;
      goto LABEL_42;
    }
    v21 = (void *)MEMORY[0x186DC9484]();
    -[UITextChecker _checker](self, "_checker");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      v37 = 0;
      contexta = v21;
      v15 = 0;
      v18 = 0;
      v20 = 0;
      objc_autoreleasePoolPop(contexta);
LABEL_39:
      if (v40)
      {
        v15 = objc_retainAutorelease(v15);
        *v40 = v15;
      }
      v17 = (void *)v37;
      goto LABEL_42;
    }
    if (v8)
    {
      context = v21;
      if (v14 <= a4)
        v22 = 0;
      else
        v22 = a4;
      if (a4 <= 0)
        v23 = a4;
      else
        v23 = v22;
      if (v23 > 0)
      {
        v24 = objc_msgSend(v11, "paragraphRangeForRange:", v23, 0);
        v26 = v25;
        v27 = v23 - v24;
        objc_msgSend(v11, "substringFromIndex:", v24);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "substringToIndex:", v24 + v26);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_27;
      }
    }
    else
    {
      if (a4 >= 1 && v14 <= a4)
      {
        objc_autoreleasePoolPop(v21);
        v15 = 0;
        v17 = 0;
        v18 = 0;
        goto LABEL_7;
      }
      context = v21;
      if (a4 > 0)
      {
        v24 = objc_msgSend(v11, "paragraphRangeForRange:", a4, 0);
        v27 = a4 - v24;
        objc_msgSend(v11, "substringFromIndex:", v24);
        v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:
        v37 = 0;
LABEL_27:
        objc_msgSend((id)qword_1ECD7B300, "lock");
        -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", v12);
        -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v28);

        v15 = 0;
        while (1)
        {
          v42 = v15;
          v16 = -[UITextChecker _chunkAndCheckGrammarInString:language:usingChecker:details:](self, "_chunkAndCheckGrammarInString:language:usingChecker:details:", v18, v12, v19, &v42);
          v20 = v29;
          v30 = v42;

          v15 = v30;
          if (!v20)
            break;
          v31 = v16 + v20;
          if (objc_msgSend(v15, "count") && v31 > v27)
          {
            v16 += v24;
            break;
          }
          v32 = objc_msgSend(v18, "length");
          if (v32 <= v31)
          {

            v15 = 0;
            v20 = 0;
            v16 = 0x7FFFFFFFFFFFFFFFLL;
            break;
          }
          if (v27 >= v31)
            v27 -= v31;
          else
            v27 = 0;
          v24 += v31;
          objc_msgSend(v11, "substringWithRange:", v24, v32 - v31);
          v33 = objc_claimAutoreleasedReturnValue();

          v18 = (id)v33;
        }
        objc_msgSend((id)qword_1ECD7B300, "unlock");
        objc_autoreleasePoolPop(context);
        goto LABEL_39;
      }
    }
    v18 = v11;
    v24 = 0;
    v27 = 0;
    goto LABEL_26;
  }
LABEL_42:
  v34 = v17;

  v35 = v16;
  v36 = v20;
  result.length = v36;
  result.location = v35;
  return result;
}

+ (BOOL)grammarCheckingEnabledForLanguage:(id)a3
{
  id v3;
  char v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (qword_1ECD7B3A8 != -1)
    dispatch_once(&qword_1ECD7B3A8, &__block_literal_global_411_0);
  v4 = 0;
  if (v3 && byte_1ECD7B2FA)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("en"));

  }
  return v4;
}

+ (id)postEditor
{
  if (byte_1ECD7B2F9)
    return (id)qword_1ECD7B328;
  else
    return 0;
}

- (id)postEditor
{
  return +[UITextChecker postEditor](UITextChecker, "postEditor");
}

- (int64_t)requestGrammarCheckingOfString:(id)a3 range:(_NSRange)a4 language:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  unint64_t v14;
  int64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  int64_t v24;

  length = a4.length;
  location = a4.location;
  v13 = a7;
  do
  {
    v14 = __ldaxr(&qword_1ECD7B3B0);
    v15 = v14 + 1;
  }
  while (__stlxr(v14 + 1, &qword_1ECD7B3B0));
  if (length >= 0x400)
    length = 1024;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  -[UITextChecker postEditor](self, "postEditor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __89__UITextChecker_requestGrammarCheckingOfString_range_language_options_completionHandler___block_invoke;
  v22[3] = &unk_1E16E7440;
  v23 = v13;
  v24 = v15;
  v20 = v13;
  objc_msgSend(v19, "requestCheckingOfString:range:language:options:completionHandler:", v18, location, length, v17, v16, v22);

  return v15;
}

uint64_t __89__UITextChecker_requestGrammarCheckingOfString_range_language_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

- (id)finalResultsFromCheckingString:(id)a3 range:(_NSRange)a4 language:(id)a5 options:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  -[UITextChecker postEditor](self, "postEditor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if (length >= 0x400)
      v16 = 1024;
    else
      v16 = length;
    objc_msgSend(v14, "finalResultsFromCheckingString:range:language:options:", v11, location, v16, v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)grammarAlternativesForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UITextChecker *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ECD7B3B8 != -1)
    dispatch_once(&qword_1ECD7B3B8, &__block_literal_global_429);
  if (byte_1ECD7B2FB)
  {
    v33 = self;
    v37 = v5;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageWithRegion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "contextBeforeInput");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedText");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = v10;
    objc_msgSend(v10, "contextAfterInput");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = &stru_1E16EDF20;
    if (v11)
      v15 = v11;
    else
      v15 = &stru_1E16EDF20;
    if (v12)
      v16 = v12;
    else
      v16 = &stru_1E16EDF20;
    v34 = (void *)v13;
    if (v13)
      v14 = (const __CFString *)v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v15, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");
    v19 = objc_msgSend(v4, "length");
    v20 = -[__CFString length](v11, "length");
    v21 = -[__CFString length](v12, "length");
    v36 = v8;
    objc_msgSend(v8, "smartPunctuationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    if (v20 >= v19)
      v23 = v20 - v19;
    else
      v23 = 0;
    v24 = v21 + v20;
    if (v24 + v19 < v18)
      v18 = v24 + v19;
    while (v18 > v23 + v22)
    {
      v25 = objc_msgSend(v17, "rangeOfString:options:range:", v4, 0, v23 + v22, v18 - (v23 + v22));
      if (!v26)
        break;
      v23 = v25;
      v22 = v26;
      if (v25 <= v20 && v24 <= v25 + v26)
      {
        -[UITextChecker postEditor](v33, "postEditor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "grammarDetailForString:range:language:", v17, v23, v22, v39);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          _detailByApplyingSmartQuotes((uint64_t)v28, v38);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKey:", CFSTR("NSGrammarCorrections"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v30, "count"))
              {
                v31 = (void *)objc_msgSend(objc_alloc((Class)off_1E1679D20), "initWithPrimaryString:alternativeStrings:", v4, v30);
                objc_msgSend(v37, "addObject:", v31);

              }
            }
          }

        }
        break;
      }
    }

    v5 = v37;
  }

  return v5;
}

- (id)grammarGuessesForRange:(_NSRange)a3 inString:(id)a4 language:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextChecker postEditor](self, "postEditor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "length");
  if (v12)
  {
    if (length)
    {
      v14 = v13;
      v15 = location + length;
      if (location + length <= v13)
      {
        if (+[UITextChecker grammarCheckingEnabledForLanguage:](UITextChecker, "grammarCheckingEnabledForLanguage:", v10))
        {
          +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "smartPunctuationController");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v16, "autocorrectionPreferenceForTraits");
          v17 = v9;
          if (!location && length == v14)
          {
            v47 = v11;
            v48 = v10;
            v50 = v16;
            objc_msgSend(v16, "keyboardState");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "documentState");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "contextBeforeInput");
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "selectedText");
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v46 = v19;
            objc_msgSend(v19, "contextAfterInput");
            v22 = objc_claimAutoreleasedReturnValue();
            v23 = &stru_1E16EDF20;
            if (v20)
              v24 = v20;
            else
              v24 = &stru_1E16EDF20;
            if (v21)
              v25 = v21;
            else
              v25 = &stru_1E16EDF20;
            if (v22)
              v23 = (const __CFString *)v22;
            v43 = (void *)v22;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v24, v25, v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "length");
            v45 = v20;
            v28 = -[__CFString length](v20, "length");
            v44 = v21;
            v29 = -[__CFString length](v21, "length");
            v30 = 0;
            if (v28 >= length)
              location = v28 - length;
            else
              location = 0;
            v31 = v29 + v28;
            if (v29 + v28 + length < v27)
              v27 = v29 + v28 + length;
            while (v27 > location + v30)
            {
              v32 = objc_msgSend(v26, "rangeOfString:options:range:", v17, 0, location + v30, v27 - (location + v30));
              if (!v33)
                break;
              location = v32;
              v30 = v33;
              if (v32 <= v28 && v31 <= v32 + v33)
              {
                v34 = v26;

                length = v30;
                v17 = v34;
                goto LABEL_26;
              }
            }
            location = 0;
LABEL_26:

            v15 = location + length;
            v11 = v47;
            v10 = v48;
            v16 = v50;
          }
          if (v15 <= objc_msgSend(v17, "length"))
          {
            objc_msgSend(v12, "grammarDetailForString:range:language:", v17, location, length, v10);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v35;
            if (v35)
            {
              v51 = v16;
              _detailByApplyingSmartQuotes(v35, v52);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectForKey:", CFSTR("NSGrammarCorrections"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (objc_msgSend(v38, "count"))
                    objc_msgSend(v11, "addObjectsFromArray:", v38);
                }
              }

              v16 = v51;
            }
            if (v49 && !objc_msgSend(v11, "count"))
            {
              objc_msgSend(v12, "reversionForString:range:language:", v17, location, length, v10);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              if (v39)
              {
                v40 = v39;
                _stringByApplyingSmartQuotes(v39, v52);
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                if (v41 && (objc_msgSend(v11, "containsObject:", v41) & 1) == 0)
                  objc_msgSend(v11, "addObject:", v41);
              }
              else
              {
                v41 = 0;
              }

            }
          }

        }
      }
    }
  }

  return v11;
}

- (void)recordResponse:(unint64_t)a3 toGrammarDetailInAnnotatedString:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  length = a5.length;
  location = a5.location;
  v20 = a4;
  -[UITextChecker postEditor](self, "postEditor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 || !length || location + length > objc_msgSend(v20, "length"))
    goto LABEL_27;
  objc_msgSend(v20, "attribute:atIndex:effectiveRange:", CFSTR("NSGrammarCorrections"), location, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v10 = 0;
    }
  }
  objc_msgSend(v20, "attribute:atIndex:effectiveRange:", CFSTR("NSGrammarIssueType"), location, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v11 = 0;
    }
  }
  objc_msgSend(v20, "attribute:atIndex:effectiveRange:", CFSTR("NSGrammarTargetPair"), location, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v12 = 0;
    }
  }
  objc_msgSend(v20, "attribute:atIndex:effectiveRange:", CFSTR("NSGrammarConfidenceScore"), location, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v13 = 0;
    }
  }
  objc_msgSend(v20, "attribute:atIndex:effectiveRange:", CFSTR("NSGrammarLanguage"), location, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_20;

  }
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentInputMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "languageWithRegion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  if (v10)
  {
    v18 = objc_msgSend(v10, "count");
    if (v11)
    {
      if (v13 && v18 && v15)
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v10, CFSTR("NSGrammarCorrections"), v13, CFSTR("NSGrammarConfidenceScore"), v11, CFSTR("NSGrammarIssueType"), v12, CFSTR("NSGrammarTargetPair"), 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recordResponse:toGrammarDetail:language:", a3, v19, v15);

      }
    }
  }

LABEL_27:
}

+ (id)grammarAutocorrectionForWord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_textChoicesAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v3 && v5)
  {
    if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
    {
      objc_msgSend(v5, "candidateForFinalString:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && objc_msgSend((id)_recentGrammarCandidates, "containsObject:", v7))
        v6 = v7;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

+ (void)handleGrammarCorrectionEntries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_textChoicesAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v3;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDBE8]), "initWithCandidate:forInput:", v12, v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "setConfidence:", 2);
          v14 = objc_alloc(MEMORY[0x1E0DBDB70]);
          v15 = (void *)objc_msgSend(v14, "initWithAutocorrection:alternateCorrections:", v13, MEMORY[0x1E0C9AA60]);
          objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addList:forCandidate:", v16, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    v3 = v17;
  }

}

+ (void)noteWordTerminator:(id)a3 replacement:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length"))
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v6, "string");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextChecker postEditor](UITextChecker, "postEditor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ECD7B350 != -1)
    dispatch_once(&qword_1ECD7B350, &__block_literal_global_175_0);
  objc_msgSend(v12, "inputDelegateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasAsyncCapableInputDelegate");

  if (v13)
  {
    if (v9)
    {
      objc_msgSend(v9, "rangeOfCharacterFromSet:", qword_1ECD7B348);
      if (v16)
      {
        if ((objc_msgSend(a1, "grammarCheckingEnabledForLanguage:", v11) & v15) == 1)
        {
          objc_msgSend(v12, "keyboardState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "documentState");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "contextBeforeInput");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");
          v21 = v20;
          if (v19)
          {
            if (v20)
            {
              objc_msgSend(v19, "rangeOfCharacterFromSet:options:range:", qword_1ECD7B348, 12, 0, v20);
              if (!v22)
              {
                objc_msgSend(v19, "stringByAppendingString:", v9);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                v21 = objc_msgSend(v23, "length");
                v19 = v23;
              }
            }
          }
          if (v19 && v21 >= 0xA)
          {
            v28[0] = CFSTR("InsertionPoint");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28[1] = CFSTR("ControlRepeatedAutocorrections");
            v29[0] = v27;
            v29[1] = MEMORY[0x1E0C9AAA0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
            v24 = v18;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (id)objc_msgSend(v13, "resultsFromCheckingString:range:language:options:", v19, 0, v21, v11, v25);

            v18 = v24;
          }

        }
      }
    }
  }

}

void __48__UITextChecker_noteWordTerminator_replacement___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".!?։۔।።᙮‼‽⁇⁈⁉。！．？｡"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7B348;
  qword_1ECD7B348 = v0;

}

+ (void)noteTextReplacement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  int v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  void *v55;
  id v56;

  v56 = a3;
  objc_msgSend(v56, "replacementText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "originalText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[UITextChecker postEditor](UITextChecker, "postEditor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v5 == 0;
  else
    v10 = 1;
  v11 = v10 || v4 == 0;
  if (!v11 && objc_msgSend(a1, "grammarCheckingEnabledForLanguage:", v7))
  {
    v49 = v4;
    objc_msgSend(v8, "keyboardState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "documentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v8;
    objc_msgSend(v8, "smartPunctuationController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contextBeforeInput");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectedText");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v46 = v13;
    objc_msgSend(v13, "contextAfterInput");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = &stru_1E16EDF20;
    if (v14)
      v18 = v14;
    else
      v18 = &stru_1E16EDF20;
    if (v15)
      v19 = v15;
    else
      v19 = &stru_1E16EDF20;
    v52 = (void *)v16;
    if (v16)
      v17 = (const __CFString *)v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v18, v19, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    v22 = objc_msgSend(v20, "length");
    v23 = objc_msgSend(v5, "length");
    v54 = v14;
    v24 = -[__CFString length](v14, "length");
    v53 = v15;
    v25 = -[__CFString length](v15, "length");
    v26 = 0;
    if (v24 >= v23)
      v27 = v24 - v23;
    else
      v27 = 0;
    v28 = v25 + v24;
    if (v25 + v24 + v23 >= v22)
      v29 = v22;
    else
      v29 = v25 + v24 + v23;
    v7 = v21;
    do
    {
      if (v29 <= v27 + v26
        || (v30 = objc_msgSend(v20, "rangeOfString:options:range:", v5, 0, v27 + v26, v29 - (v27 + v26)), !v31))
      {
        v35 = 0;
        v8 = v47;
        v4 = v49;
        v36 = v46;
        goto LABEL_47;
      }
      v27 = v30;
      v26 = v31;
    }
    while (v30 > v24 || v28 > v30 + v31);
    objc_msgSend(v9, "grammarDetailForString:range:language:", v20, v30, v31, v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32
      && (v33 = v32,
          objc_msgSend(v32, "objectForKey:", CFSTR("NSGrammarCorrections")),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v34,
          v32 = v33,
          v34))
    {
      v35 = 0;
      v8 = v47;
      v4 = v49;
      v36 = v46;
    }
    else
    {
      v44 = v32;
      objc_msgSend(v9, "reversionForString:range:language:", v20, v27, v26, v7);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_msgSend(v20, "stringByReplacingCharactersInRange:withString:", v27, v26, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "grammarDetailForString:range:language:", v37, v27, objc_msgSend(v35, "length"), v7);
        v38 = objc_claimAutoreleasedReturnValue();

        v32 = (void *)v38;
        v8 = v47;
        v4 = v49;
      }
      else
      {
        v8 = v47;
        v4 = v49;
        v32 = v44;
      }
      v36 = v46;
      if (!v32)
        goto LABEL_47;
    }
    v45 = v32;
    _detailByApplyingSmartQuotes((uint64_t)v32, v55);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKey:", CFSTR("NSGrammarCorrections"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40 && objc_msgSend(v40, "count"))
    {
      if (v35)
      {
        v48 = objc_msgSend(v4, "isEqualToString:", v35);
        objc_msgSend(v8, "inputDelegateManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v41, "hasAsyncCapableInputDelegate");

        if (v50)
        {
          if (v48)
            v42 = 5;
          else
            v42 = 3;
          goto LABEL_45;
        }
      }
      else
      {
        objc_msgSend(v40, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v4, "isEqual:", v43);

        if (v51)
        {
          v42 = 1;
LABEL_45:
          objc_msgSend(v9, "recordResponse:toGrammarDetail:language:", v42, v45, v7);
        }
      }
    }

LABEL_47:
  }

}

+ (void)performFinalGrammarChecking
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;

  if (qword_1ECD7B3C0 != -1)
    dispatch_once(&qword_1ECD7B3C0, &__block_literal_global_433);
  if (byte_1ECD7B2FC == 1)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "inputDelegateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textInputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v6)
    {
      v5 = objc_opt_respondsToSelector();
      v4 = v6;
      if ((v5 & 1) != 0)
      {
        objc_msgSend(v6, "performFinalGrammarChecking");
        v4 = v6;
      }
    }

  }
}

- (id)checkString:(id)a3 range:(_NSRange)a4 types:(unint64_t)a5 languages:(id)a6 options:(id)a7
{
  __int16 v9;
  NSUInteger length;
  NSUInteger location;
  id v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  UIExtendedCorrectionCheckingResult *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  int v62;
  id v63;
  void *v64;
  id obj;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v9 = a5;
  length = a4.length;
  location = a4.location;
  v93 = *MEMORY[0x1E0C80C00];
  v59 = a3;
  v13 = a6;
  v57 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  v58 = v13;
  objc_msgSend(v13, "firstObject");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (location < location + length)
  {
    v14 = location;
    do
    {
      v15 = -[UITextChecker rangeOfMisspelledWordInString:range:startingAt:wrap:languages:](self, "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", v59, location, length, v14, 0, v58);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v17 = v16;
      if (!v16)
        break;
      v18 = v15;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3930]), "initWithRange:", v15, v16);
      objc_msgSend(v63, "addObject:", v19);
      v14 = v18 + v17;

    }
    while (v14 < location + length);
  }
  if (+[UITextChecker grammarCheckingEnabledForLanguage:](UITextChecker, "grammarCheckingEnabledForLanguage:", v61))
  {
    -[UITextChecker postEditor](self, "postEditor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v20;
    if ((v9 & 0x200) != 0)
    {
      v22 = objc_msgSend(v20, "autocorrectionPreferenceForTraits") == 0;
      v20 = v56;
      v21 = !v22;
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v20, "smartPunctuationController");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (length >= 0x400)
      v23 = 1024;
    else
      v23 = length;
    objc_msgSend(v60, "resultsFromCheckingString:range:language:options:", v59, location, v23, v61, v57);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
    if (v67)
    {
      v66 = *(_QWORD *)v79;
      v62 = v21;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v79 != v66)
            objc_enumerationMutation(obj);
          v68 = v24;
          v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v24);
          v26 = objc_msgSend(v25, "resultType");
          if (v26 == 512)
          {
            if (v21)
            {
              _resultByApplyingSmartQuotesToResult(v25, v64);
              v28 = (id)objc_claimAutoreleasedReturnValue();
              v29 = obj;
              v30 = v28;
              v31 = objc_msgSend(v30, "range");
              v76 = v32;
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              v89 = 0u;
              v72 = v29;
              v33 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
              v69 = v30;
              v73 = v30;
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v87;
                v73 = v30;
                v70 = *(_QWORD *)v87;
                do
                {
                  v36 = 0;
                  v71 = v34;
                  do
                  {
                    if (*(_QWORD *)v87 != v35)
                      objc_enumerationMutation(v72);
                    v37 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v36);
                    v38 = objc_msgSend(v37, "range");
                    v40 = v39;
                    if (objc_msgSend(v37, "resultType") == 4)
                    {
                      objc_msgSend(v37, "grammarDetails");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = 0u;
                      v83 = 0u;
                      v84 = 0u;
                      v85 = 0u;
                      v77 = v41;
                      v42 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
                      if (v42)
                      {
                        v43 = v42;
                        v74 = v40;
                        v75 = v36;
                        v44 = *(_QWORD *)v83;
                        while (2)
                        {
                          for (i = 0; i != v43; ++i)
                          {
                            if (*(_QWORD *)v83 != v44)
                              objc_enumerationMutation(v77);
                            v46 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
                            if ((objc_opt_respondsToSelector() & 1) != 0)
                            {
                              objc_msgSend(v46, "objectForKey:", CFSTR("NSGrammarRange"));
                              v47 = (void *)objc_claimAutoreleasedReturnValue();
                              if (v47 && (objc_opt_respondsToSelector() & 1) != 0)
                              {
                                v48 = objc_msgSend(v47, "rangeValue");
                                v50 = v49;
                              }
                              else
                              {
                                v50 = 0;
                                v48 = 0x7FFFFFFFFFFFFFFFLL;
                              }

                            }
                            else
                            {
                              v50 = 0;
                              v48 = 0x7FFFFFFFFFFFFFFFLL;
                            }
                            if (v31 == v48 + v38 && v76 == v50)
                            {
                              v51 = [UIExtendedCorrectionCheckingResult alloc];
                              objc_msgSend(v69, "replacementString");
                              v52 = (void *)objc_claimAutoreleasedReturnValue();
                              v53 = -[UIExtendedCorrectionCheckingResult initWithRange:replacementString:sentenceRange:detail:](v51, "initWithRange:replacementString:sentenceRange:detail:", v31, v76, v52, v38, v74, v46);

                              v73 = (void *)v53;
                              goto LABEL_52;
                            }
                          }
                          v43 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
                          if (v43)
                            continue;
                          break;
                        }
LABEL_52:
                        v35 = v70;
                        v34 = v71;
                        v36 = v75;
                      }

                    }
                    ++v36;
                  }
                  while (v36 != v34);
                  v34 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
                }
                while (v34);
              }

              v21 = v62;
              v27 = v73;
              if (v73)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v73, "detail");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "recordResponse:toGrammarDetail:language:", 4, v54, v61);

                }
LABEL_59:
                objc_msgSend(v63, "addObject:", v27);

              }
            }
          }
          else if (v26 == 4)
          {
            if (qword_1ECD7B3B8 != -1)
              dispatch_once(&qword_1ECD7B3B8, &__block_literal_global_429);
            if (byte_1ECD7B2FB)
            {
              _resultByApplyingSmartQuotesToResult(v25, v64);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (v27)
                goto LABEL_59;
            }
          }
          v24 = v68 + 1;
        }
        while (v68 + 1 != v67);
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      }
      while (v67);
    }

  }
  return v63;
}

- (id)correctionForWordRange:(_NSRange)a3 inString:(id)a4 language:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v20;
  id v22;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "length");
  if (location || length != v11)
  {
    objc_msgSend(v9, "substringWithRange:", location, length);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v9;
  }
  v13 = v12;
  v22 = 0;
  v14 = -[UITextChecker checkSpellingOfString:startingAt:language:wrap:correction:](self, "checkSpellingOfString:startingAt:language:wrap:correction:", v12, 0, v10, 0, &v22);
  v16 = v15;
  v17 = v22;
  v18 = v17;
  if (v16 != length || v14 != 0)
    v17 = 0;
  v20 = v17;

  return v20;
}

- (NSArray)guessesForWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language
{
  NSUInteger length;
  NSUInteger location;
  NSString *v9;
  NSString *v10;
  id v11;
  unint64_t v12;
  void *v14;
  void *v15;
  void *v16;

  length = range.length;
  location = range.location;
  v9 = string;
  v10 = language;
  if (!v9)
    goto LABEL_7;
  v11 = 0;
  if (!-[NSString isEqualToString:](v9, "isEqualToString:", &stru_1E16EDF20))
  {
    if (length)
    {
      v12 = -[NSString length](v9, "length");
      v11 = 0;
      if (v10)
      {
        if (location + length <= v12)
        {
          if (-[NSString isEqualToString:](v10, "isEqualToString:", &stru_1E16EDF20))
          {
LABEL_7:
            v11 = 0;
            goto LABEL_8;
          }
          -[UITextChecker _checker](self, "_checker");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend((id)qword_1ECD7B300, "lock");
            -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", v10);
            -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v15);

            objc_msgSend(v14, "spellServer:suggestGuessesForWordRange:inString:language:", self, location, length, v9, v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)qword_1ECD7B300, "unlock");
          }
          else
          {
            v16 = 0;
          }
          v11 = v16;

        }
      }
    }
  }
LABEL_8:

  return (NSArray *)v11;
}

- (NSArray)completionsForPartialWordRange:(NSRange)range inString:(NSString *)string language:(NSString *)language
{
  NSUInteger length;
  NSUInteger location;
  NSString *v9;
  NSString *v10;
  id v11;
  unint64_t v12;
  void *v14;
  void *v15;
  void *v16;

  length = range.length;
  location = range.location;
  v9 = string;
  v10 = language;
  if (!v9)
    goto LABEL_7;
  v11 = 0;
  if (!-[NSString isEqualToString:](v9, "isEqualToString:", &stru_1E16EDF20))
  {
    if (length)
    {
      v12 = -[NSString length](v9, "length");
      v11 = 0;
      if (v10)
      {
        if (location + length <= v12)
        {
          if (-[NSString isEqualToString:](v10, "isEqualToString:", &stru_1E16EDF20))
          {
LABEL_7:
            v11 = 0;
            goto LABEL_8;
          }
          -[UITextChecker _checker](self, "_checker");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend((id)qword_1ECD7B300, "lock");
            -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", v10);
            -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v15);

            objc_msgSend(v14, "spellServer:suggestCompletionsForPartialWordRange:inString:language:", self, location, length, v9, v10);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)qword_1ECD7B300, "unlock");
          }
          else
          {
            v16 = 0;
          }
          v11 = v16;

        }
      }
    }
  }
LABEL_8:

  return (NSArray *)v11;
}

- (id)suggestWordInLanguage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_1E16EDF20) & 1) == 0)
  {
    -[UITextChecker _checker](self, "_checker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend((id)qword_1ECD7B300, "lock");
      -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", v5);
      -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v8);

      objc_msgSend(v7, "spellServer:suggestWordWithLengthInRange:language:", self, 4, 3, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1ECD7B300, "unlock");
    }
    else
    {
      v9 = 0;
    }
    v6 = v9;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)canChangeCaseOfFirstLetterInString:(id)a3 toUpperCase:(BOOL)a4 language:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "isEqualToString:", &stru_1E16EDF20) & 1) == 0
    && (-[UITextChecker _checker](self, "_checker"), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v12 = (void *)v11;
    objc_msgSend((id)qword_1ECD7B300, "lock");
    -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", v10);
    -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v13);

    v14 = objc_msgSend(v12, "spellServer:canChangeCaseOfFirstLetterInString:toUpperCase:language:", self, v8, v6, v10);
    objc_msgSend((id)qword_1ECD7B300, "unlock");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)stringForInputString:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "isEqualToString:", &stru_1E16EDF20) & 1) == 0)
  {
    -[UITextChecker _checker](self, "_checker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend((id)qword_1ECD7B300, "lock");
      -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", v8);
      -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v11);

      objc_msgSend(v10, "spellServer:stringForInputString:language:", self, v6, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)qword_1ECD7B300, "unlock");
    }
    else
    {
      v12 = 0;
    }
    v9 = v12;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)alternativesForPinyinInputString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[UITextChecker _checker](self, "_checker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend((id)qword_1ECD7B300, "lock");
    -[UITextChecker _setLanguageDictionaryName:](self, "_setLanguageDictionaryName:", CFSTR("en"));
    -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextChecker _setDocumentDictionaryName:](self, "_setDocumentDictionaryName:", v6);

    objc_msgSend(v5, "spellServer:alternativesForPinyinInputString:language:", self, v4, CFSTR("en"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECD7B300, "unlock");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)bestLanguageForString:(id)a3 fromAlternatives:(id)a4 currentLanguage:(id)a5 insertionPointIndex:(unint64_t)a6 scriptForBestLanguage:(id *)a7
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  unint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  int v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  id v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  id v70;
  id v71;
  id v72;
  id v73;
  id v75;
  id v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  uint64_t *v94;
  uint64_t *v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  void (*v101)(uint64_t);
  id v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v71 = a4;
  v73 = a5;
  v77 = v10;
  v11 = objc_msgSend(v10, "length");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  v97 = 0;
  v98 = &v97;
  v99 = 0x3032000000;
  v100 = __Block_byref_object_copy__212;
  v101 = __Block_byref_object_dispose__212;
  v102 = 0;
  v15 = objc_alloc(MEMORY[0x1E0CB3730]);
  v16 = *MEMORY[0x1E0CB2CF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0CB2CF8], *MEMORY[0x1E0CB2D20], 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithTagSchemes:options:", v17, 0);

  objc_msgSend(v18, "setString:", v10);
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __114__UITextChecker_bestLanguageForString_fromAlternatives_currentLanguage_insertionPointIndex_scriptForBestLanguage___block_invoke;
  v89[3] = &unk_1E16E7468;
  v90 = v18;
  v94 = &v103;
  v76 = v12;
  v91 = v76;
  v95 = &v97;
  v96 = a6;
  v75 = v13;
  v92 = v75;
  v72 = v14;
  v93 = v72;
  v70 = v90;
  objc_msgSend(v90, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v11, v16, 14, v89);
  v19 = (void *)v98[5];
  v98[5] = 0;

  if (!v104[3])
  {
    v79 = 0;
    v80 = 0;
    v22 = 0;
    v31 = 0;
    v78 = 0;
    goto LABEL_29;
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v20 = v76;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v85, v108, 16);
  if (!v21)
  {
    v79 = 0;
    v80 = 0;
    v22 = 0;
    v78 = 0;
    goto LABEL_17;
  }
  v79 = 0;
  v80 = 0;
  v22 = 0;
  v78 = 0;
  v23 = *(_QWORD *)v86;
  do
  {
    for (i = 0; i != v21; ++i)
    {
      if (*(_QWORD *)v86 != v23)
        objc_enumerationMutation(v20);
      v25 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
      if ((objc_msgSend(v25, "isEqualToString:", CFSTR("und")) & 1) == 0)
      {
        objc_msgSend(v20, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "unsignedIntegerValue");

        if (v27 <= v22)
        {
          v29 = v27;
          v28 = v25;
          if (v27 <= v79)
            continue;
        }
        else
        {
          v28 = v78;

          v80 = v28;
          v29 = v22;
          v22 = v27;
          v78 = v25;
        }
        v30 = v25;

        v79 = v29;
        v80 = v28;
      }
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v85, v108, 16);
  }
  while (v21);
LABEL_17:

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v32 = v75;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
  if (v33)
  {
    v34 = 0;
    v31 = 0;
    v35 = *(_QWORD *)v82;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v82 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
        objc_msgSend(v32, "objectForKey:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "unsignedIntegerValue");

        if (v39 > v34)
        {
          v40 = v37;

          v34 = v39;
          v31 = v40;
        }
      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v81, v107, 16);
    }
    while (v33);
  }
  else
  {
    v31 = 0;
  }

LABEL_29:
  if ((objc_msgSend(v31, "isEqualToString:", CFSTR("Cyrl")) & 1) != 0)
  {
LABEL_30:
    v41 = 0;
    v42 = 0;
    goto LABEL_87;
  }
  v43 = v73;
  v44 = v78;
  v45 = objc_msgSend(v44, "length");
  if (!v43 || !v44 || (v46 = v45, !objc_msgSend(v43, "hasPrefix:", v44)))
  {

    goto LABEL_39;
  }
  if (objc_msgSend(v43, "length") <= v46)
  {

LABEL_60:
    v42 = v43;
    objc_msgSend(v72, "objectForKey:", v44);
    v62 = objc_claimAutoreleasedReturnValue();
    goto LABEL_86;
  }
  v47 = objc_msgSend(v43, "characterAtIndex:", v46);

  if (v47 == 95 || v47 == 45)
    goto LABEL_60;
LABEL_39:
  v48 = (void *)v98[5];
  v49 = v43;
  v50 = v48;
  v51 = objc_msgSend(v50, "length");
  if (!v43 || !v50 || (v52 = v51, !objc_msgSend(v49, "hasPrefix:", v50)))
  {

    goto LABEL_47;
  }
  if (objc_msgSend(v49, "length") <= v52)
  {

LABEL_62:
    v42 = v49;
    objc_msgSend(v72, "objectForKey:", v98[5]);
    v62 = objc_claimAutoreleasedReturnValue();
    goto LABEL_86;
  }
  v53 = objc_msgSend(v49, "characterAtIndex:", v52);

  if (v53 == 95 || v53 == 45)
    goto LABEL_62;
LABEL_47:
  v54 = v49;
  v55 = v80;
  v56 = objc_msgSend(v55, "length");
  if (!v43 || !v55 || (v57 = v56, !objc_msgSend(v54, "hasPrefix:", v55)))
  {

    goto LABEL_55;
  }
  if (objc_msgSend(v54, "length") <= v57)
  {

  }
  else
  {
    v58 = objc_msgSend(v54, "characterAtIndex:", v57);

    if (v58 != 95 && v58 != 45)
      goto LABEL_55;
  }
  if ((double)v79 * 4.0 > (double)(unint64_t)v104[3] || (double)v79 + (double)v79 > (double)v22)
    goto LABEL_30;
LABEL_55:
  v59 = (void *)v98[5];
  if (v59 && (objc_msgSend(v59, "isEqualToString:", v44) & 1) == 0)
  {
    v60 = objc_msgSend(v71, "containsObject:", v98[5]);
    v61 = (void *)v98[5];
    if (v60)
    {
      v42 = v61;
      goto LABEL_73;
    }
    alternativesMatchingLanguage(v71, v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "containsObject:", v98[5]))
    {
      v64 = (id)v98[5];
      goto LABEL_71;
    }
    if (objc_msgSend(v63, "count"))
    {
      objc_msgSend(v63, "objectAtIndex:", 0);
      v64 = (id)objc_claimAutoreleasedReturnValue();
LABEL_71:
      v42 = v64;
    }
    else
    {
      v42 = 0;
    }

LABEL_73:
    if (v42)
    {
      objc_msgSend(v72, "objectForKey:", v98[5]);
      v62 = objc_claimAutoreleasedReturnValue();
      goto LABEL_86;
    }
  }
  if ((double)v22 + (double)v22 <= (double)(unint64_t)v104[3])
    goto LABEL_30;
  if (objc_msgSend(v71, "containsObject:", v44))
  {
    v42 = v44;
    goto LABEL_84;
  }
  alternativesMatchingLanguage(v71, v44);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v65, "containsObject:", v54))
  {
    v66 = v54;
    goto LABEL_82;
  }
  if (objc_msgSend(v65, "count"))
  {
    objc_msgSend(v65, "objectAtIndex:", 0);
    v66 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:
    v42 = v66;
  }
  else
  {
    v42 = 0;
  }

LABEL_84:
  if (v42)
  {
    objc_msgSend(v72, "objectForKey:", v44);
    v62 = objc_claimAutoreleasedReturnValue();
LABEL_86:
    v41 = (void *)v62;
  }
  else
  {
    v41 = 0;
  }
LABEL_87:
  if (a7)
    *a7 = objc_retainAutorelease(v41);
  v67 = v93;
  v68 = v42;

  _Block_object_dispose(&v97, 8);
  _Block_object_dispose(&v103, 8);

  return v68;
}

void __114__UITextChecker_bestLanguageForString_fromAlternatives_currentLanguage_insertionPointIndex_scriptForBestLanguage___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "tagAtIndex:scheme:tokenRange:sentenceRange:", a3, *MEMORY[0x1E0CB2D20], 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += a4;
  if (v17)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, v17);

    v12 = *(_QWORD *)(a1 + 80);
    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (a3 < v12 || !*(_QWORD *)(v13 + 40))
        objc_storeStrong((id *)(v13 + 40), a2);
    }

  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, v8);

    if (v17)
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v8);

  }
}

+ (id)bestLanguageForString:(id)a3 fromAlternatives:(id)a4 currentLanguage:(id)a5
{
  return (id)objc_msgSend(a1, "bestLanguageForString:fromAlternatives:currentLanguage:insertionPointIndex:scriptForBestLanguage:", a3, a4, a5, 0x7FFFFFFFFFFFFFFFLL, 0);
}

+ (__CFSet)createDictHashTable:(BOOL)a3
{
  void (__cdecl *v3)(CFAllocatorRef, const void *);
  CFSetCallBacks v5;

  memset(&v5, 0, 32);
  v3 = (void (__cdecl *)(CFAllocatorRef, const void *))ReallyFree;
  if (!a3)
    v3 = 0;
  v5.equal = (CFSetEqualCallBack)strIsEqualNoCase;
  v5.hash = (CFSetHashCallBack)strHashNoCase;
  v5.release = v3;
  return CFSetCreateMutable(0, 0, &v5);
}

+ (id)openUserDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_semaphore_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  char *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  __CFSet *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v4 = a3;
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB2B58]))
  {
    v6 = (void *)MEMORY[0x186DC9484]();
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__212;
    v43 = __Block_byref_object_dispose__212;
    v44 = 0;
    v7 = dispatch_semaphore_create(0);
    if (v7)
    {
      connectionToRemoteDataServer();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __dataWithContentsOfUserDictionary_block_invoke;
      v37[3] = &unk_1E16BB768;
      v10 = v7;
      v38 = v10;
      objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v37);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v34[0] = v9;
        v34[1] = 3221225472;
        v34[2] = __dataWithContentsOfUserDictionary_block_invoke_2;
        v34[3] = &unk_1E16E74E8;
        v36 = &v39;
        v12 = v10;
        v35 = v12;
        objc_msgSend(v11, "requestTextCheckerLocalDictionaryWithCompletionHandler:", v34);
        v13 = dispatch_time(0, 3000000000);
        if (dispatch_semaphore_wait(v12, v13))
        {
          NSLog(CFSTR("%s requested data from com.apple.TextInput.rdt but timed out after %d seconds"), "dataWithContentsOfUserDictionary", 3);

          v14 = 0;
LABEL_11:

          _Block_object_dispose(&v39, 8);
          v16 = objc_retainAutorelease(v14);
          v17 = (char *)objc_msgSend(v16, "bytes");
          v18 = objc_msgSend(v16, "length");
          if (v17)
            v19 = v18 == 0;
          else
            v19 = 1;
          if (!v19)
          {
            v20 = v18;
            v31 = v16;
            v32 = v6;
            v33 = v5;
            v21 = (__CFSet *)objc_msgSend(a1, "createDictHashTable:", 0);
            v22 = MEMORY[0x186DC7F6C](0);
            if (v20 >= 1)
            {
              v23 = (unint64_t)&v17[v20];
              v24 = -1;
              v25 = 1;
              do
              {
                if (!(v24 + 100 * (v25 / 0x64)))
                {
                  MEMORY[0x186DC7F54](v22);
                  v22 = MEMORY[0x186DC7F6C](0);
                }
                v26 = strchr(v17, 10);
                if (!v26)
                  v26 = &v17[strlen(v17)];
                if (*v17 != 35)
                {
                  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v17, v26 - v17, 4, 0);
                  if (v27)
                  {
                    v28 = (void *)v27;
                    if (CFSetGetValue(v21, v17))
                      CFSetRemoveValue(v21, v17);
                    else
                      CFSetSetValue(v21, v17);

                  }
                }
                v17 = v26 + 1;
                --v24;
                ++v25;
              }
              while ((unint64_t)(v26 + 1) < v23);
            }
            MEMORY[0x186DC7F54](v22);
            v6 = v32;
            v5 = v33;
            v16 = v31;
            if (v21)
            {
              v29 = objc_msgSend(objc_allocWithZone((Class)UITextCheckerDictionaryEntry), "init");
              if (v29)
              {
                v15 = (_QWORD *)v29;
                *(_QWORD *)(v29 + 8) = v21;
                objc_storeStrong((id *)(v29 + 16), v31);
                v15[3] = v20;
LABEL_33:
                objc_autoreleasePoolPop(v6);

                goto LABEL_34;
              }
              CFRelease(v21);
            }
          }

          v16 = 0;
          v15 = 0;
          goto LABEL_33;
        }

      }
    }
    v14 = (id)v40[5];
    goto LABEL_11;
  }
  v15 = 0;
LABEL_34:

  return v15;
}

+ (id)_dictionaryEntryForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v4 = v3;
  v5 = 0;
  v16 = __Block_byref_object_copy__212;
  v17 = __Block_byref_object_dispose__212;
  v6 = qword_1ECD7B318;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v18 = 0;
  if (qword_1ECD7B310)
    v7 = qword_1ECD7B318 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__UITextChecker__dictionaryEntryForName___block_invoke;
    v10[3] = &unk_1E16BACE0;
    v12 = &v13;
    v11 = v3;
    dispatch_sync(v6, v10);

    v5 = (void *)v14[5];
  }
  v8 = v5;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __41__UITextChecker__dictionaryEntryForName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)qword_1ECD7B310, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)_setDictionaryEntry:(id)a3 forName:(id)a4
{
  id v5;
  NSObject *v6;
  BOOL v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v8 = a3;
  v5 = a4;
  v6 = qword_1ECD7B318;
  if (qword_1ECD7B310)
    v7 = qword_1ECD7B318 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__UITextChecker__setDictionaryEntry_forName___block_invoke;
    block[3] = &unk_1E16B1B50;
    v10 = v8;
    v11 = v5;
    dispatch_sync(v6, block);

  }
}

uint64_t __45__UITextChecker__setDictionaryEntry_forName___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return objc_msgSend((id)qword_1ECD7B310, "setObject:forKey:", v1, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend((id)qword_1ECD7B310, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

+ (id)dictionaryInfo:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v7;

  v4 = a3;
  if (!v4)
    v4 = (id)*MEMORY[0x1E0CB2B58];
  objc_msgSend(a1, "_dictionaryEntryForName:", v4);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "openUserDictionary:", v4);
    v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (v5
      || (v5 = (_QWORD *)objc_msgSend(objc_allocWithZone((Class)UITextCheckerDictionaryEntry), "init")) != 0
      && (v7 = objc_msgSend(a1, "createDictHashTable:", 1), (v5[1] = v7) != 0))
    {
      objc_msgSend(a1, "_setDictionaryEntry:forName:", v5, v4);
    }
  }

  return v5;
}

+ (BOOL)_learnWord:(id)a3 inDictionary:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  CFMutableSetRef *v11;
  const __CFSet *v12;
  BOOL v13;
  char *v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  if (!v7)
    v7 = (id)*MEMORY[0x1E0CB2B58];
  objc_msgSend(a1, "dictionaryInfo:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (CFMutableSetRef *)v10;
  if (v10 && (v12 = *(const __CFSet **)(v10 + 8)) != 0 && !CFSetGetValue(v12, v9))
  {
    v15 = strdup(v9);
    CFSetSetValue(v11[1], v15);
    appendWordToDictionary(v8, v7);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)_forgetWord:(id)a3 inDictionary:(id)a4
{
  id v6;
  id v7;
  id v8;
  const void *v9;
  uint64_t v10;
  CFMutableSetRef *v11;
  const __CFSet *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v9 = (const void *)objc_msgSend(v8, "UTF8String");
  if (!v7)
    v7 = (id)*MEMORY[0x1E0CB2B58];
  objc_msgSend(a1, "dictionaryInfo:", v7);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (CFMutableSetRef *)v10;
  if (v10 && (v12 = *(const __CFSet **)(v10 + 8)) != 0 && CFSetGetValue(v12, v9))
  {
    CFSetRemoveValue(v11[1], v9);
    appendWordToDictionary(v8, v7);
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)_isWord:(id)a3 inDictionary:(id)a4
{
  id v6;
  const void *v7;
  uint64_t v8;
  void *v9;
  const __CFSet *v10;
  BOOL v11;

  v6 = a4;
  v7 = (const void *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (!v6)
    v6 = (id)*MEMORY[0x1E0CB2B58];
  objc_msgSend(a1, "dictionaryInfo:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v11 = v8 && (v10 = *(const __CFSet **)(v8 + 8)) != 0 && CFSetGetValue(v10, v7) != 0;

  return v11;
}

+ (id)_wordsInDictionary:(id)a3
{
  uint64_t v3;
  CFSetRef *v4;
  const __CFSet *v5;
  CFIndex Count;
  CFIndex v7;
  void *v8;
  const void **v9;
  const void **v10;
  uint64_t i;
  const char *v12;
  char *v13;
  id v14;
  size_t v15;
  void *v16;
  void *v17;

  objc_msgSend(a1, "dictionaryInfo:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (CFSetRef *)v3;
  if (v3 && (v5 = *(const __CFSet **)(v3 + 8)) != 0 && (Count = CFSetGetCount(v5), Count >= 1))
  {
    v7 = Count;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (const void **)NSZoneMalloc(0, 8 * v7);
    if (v9)
    {
      v10 = v9;
      CFSetGetValues(v4[1], v9);
      for (i = 0; i != v7; ++i)
      {
        v12 = (const char *)v10[i];
        if (v12)
        {
          v13 = strchr((char *)v10[i], 10);
          v14 = objc_alloc(MEMORY[0x1E0CB3940]);
          if (v13)
            v15 = v13 - v12;
          else
            v15 = strlen(v12);
          v16 = (void *)objc_msgSend(v14, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v12, v15, 4, 0);
          objc_msgSend(v8, "addObject:", v16);

        }
      }
      NSZoneFree(0, v10);
    }
  }
  else
  {
    v8 = 0;
  }
  v17 = (void *)objc_msgSend(v8, "copy");

  return v17;
}

+ (void)_setWords:(id)a3 inDictionary:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CFMutableSetRef *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const void *v15;
  char *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  objc_msgSend(a1, "dictionaryInfo:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(a1, "_setDictionaryEntry:forName:", 0, v6);

  }
  if (v17)
  {
    v9 = objc_msgSend(v17, "count");
    if (v9)
    {
      v10 = 0;
      v11 = 0;
      v12 = v9 - 1;
      v13 = v17;
      do
      {
        if (v10
          || (objc_msgSend(a1, "dictionaryInfo:", v6),
              v10 = (CFMutableSetRef *)objc_claimAutoreleasedReturnValue(),
              v13 = v17,
              v10))
        {
          if (v10[1])
          {
            objc_msgSend(v13, "objectAtIndex:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              v11 = objc_retainAutorelease(v14);
              v15 = (const void *)objc_msgSend(v11, "UTF8String");
              if (CFSetGetValue(v10[1], v15))
              {
                CFSetRemoveValue(v10[1], v15);
              }
              else
              {
                v16 = strdup((const char *)v15);
                CFSetSetValue(v10[1], v16);
              }
            }
            else
            {
              v11 = 0;
            }
            v13 = v17;
          }
        }
        --v12;
      }
      while (v12 != -1);

    }
  }

}

- (void)ignoreWord:(NSString *)wordToIgnore
{
  NSString *v4;
  void *v5;
  id v6;

  v4 = wordToIgnore;
  v5 = (void *)objc_opt_class();
  -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_learnWord:inDictionary:", v4, v6);

}

- (NSArray)ignoredWords
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_wordsInDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setIgnoredWords:(NSArray *)ignoredWords
{
  NSArray *v4;
  void *v5;
  id v6;

  v4 = ignoredWords;
  v5 = (void *)objc_opt_class();
  -[UITextChecker _nameOfDictionaryForDocumentTag:](self, "_nameOfDictionaryForDocumentTag:", self->_usdt);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setWords:inDictionary:", v4, v6);

}

+ (void)learnWord:(NSString *)word
{
  objc_msgSend(a1, "_learnWord:inDictionary:", word, 0);
}

+ (BOOL)hasLearnedWord:(NSString *)word
{
  return objc_msgSend(a1, "_isWord:inDictionary:", word, 0);
}

+ (void)unlearnWord:(NSString *)word
{
  objc_msgSend(a1, "_forgetWord:inDictionary:", word, 0);
}

- (BOOL)isWordInUserDictionaries:(id)a3 caseSensitive:(BOOL)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t *v25;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (id)qword_1ECD7B308;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend((id)objc_opt_class(), "_isWord:inDictionary:", v4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(v4, "lowercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v9;
  v10 = (id)qword_1ECD7B330;
  objc_sync_enter(v10);
  objc_msgSend((id)qword_1ECD7B330, "objectForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  if (v5)
  {
    LOBYTE(v11) = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    v4 = v4;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v13 = dispatch_semaphore_create(0);
    if (v13)
    {
      connectionToRemoteDataServer();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __stringIsExemptFromChecker_block_invoke;
      v26[3] = &unk_1E16BB768;
      v16 = v13;
      v27 = v16;
      objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v23[0] = v15;
        v23[1] = 3221225472;
        v23[2] = __stringIsExemptFromChecker_block_invoke_2;
        v23[3] = &unk_1E16BD888;
        v25 = &v28;
        v18 = v16;
        v24 = v18;
        objc_msgSend(v17, "string:isExemptFromTextCheckerWithCompletionHandler:", v4, v23);
        dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);

      }
    }
    v11 = *((_BYTE *)v29 + 24) != 0;

    _Block_object_dispose(&v28, 8);
    setCachedExemptionForString(v4, v11);
    v5 = 0;
  }
LABEL_12:

  return v11;
}

+ (void)setString:(id)a3 isExemptFromChecker:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    setCachedExemptionForString(v5, v4);
    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkerWarmingLanguage, 0);
}

@end
