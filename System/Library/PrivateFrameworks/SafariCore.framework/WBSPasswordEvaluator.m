@implementation WBSPasswordEvaluator

- (id)_initWithPasswordWordListCollection:(id)a3 passcodeWordListCollection:(id)a4
{
  id v7;
  id v8;
  WBSPasswordEvaluator *v9;
  WBSPasswordEvaluator *v10;
  WBSPasswordPatternMatcher *v11;
  WBSPasswordPatternMatcher *patternMatcher;
  WBSPasswordEvaluator *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSPasswordEvaluator;
  v9 = -[WBSPasswordEvaluator init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_passwordWordListCollection, a3);
    objc_storeStrong((id *)&v10->_passcodeWordListCollection, a4);
    v11 = objc_alloc_init(WBSPasswordPatternMatcher);
    patternMatcher = v10->_patternMatcher;
    v10->_patternMatcher = v11;

    v13 = v10;
  }

  return v10;
}

- (id)evaluatePassword:(id)a3
{
  id v4;
  WBSPasswordEvaluation *v5;
  WBSPasswordEvaluation *v6;
  void *v7;
  int v8;
  WBSPasswordPatternMatcher *patternMatcher;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  WBSPasswordPatternMatchSolver *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  WBSPasswordPatternMatchSolver *v20;
  WBSPasswordEvaluation *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  WBSPasswordPatternMatchSolver *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((unint64_t)(objc_msgSend(v4, "length") - 32) > 0xFFFFFFFFFFFFFFE0)
  {
    v7 = (void *)MEMORY[0x1B5E27154]();
    v8 = objc_msgSend((id)objc_opt_class(), "passwordLooksLikeDigitOnlyPasscode:", v4);
    patternMatcher = self->_patternMatcher;
    if (v8)
    {
      -[WBSPasswordPatternMatcher patternMatchesForPasscode:withWordListCollection:](patternMatcher, "patternMatchesForPasscode:withWordListCollection:", v4, self->_passcodeWordListCollection);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (!v11)
        goto LABEL_15;
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "guessesRequired");
            v18 = v17;
            -[WBSPasswordPatternMatchSolver guessesRequired](v13, "guessesRequired");
            if (v18 >= v19)
              continue;
          }
          v20 = v16;

          v13 = v20;
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v12);
      if (!v13)
LABEL_15:
        v13 = -[WBSPasswordPatternMatch initExhaustiveSearchPatternWithMatchedSubstring:range:]([WBSPasswordPatternMatch alloc], "initExhaustiveSearchPatternWithMatchedSubstring:range:", v4, 0, objc_msgSend(v4, "length"));
      v21 = [WBSPasswordEvaluation alloc];
      v28 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSPasswordPatternMatchSolver guessesRequired](v13, "guessesRequired");
      v6 = -[WBSPasswordEvaluation initWithEvaluationType:password:patternMatches:guessesRequired:](v21, "initWithEvaluationType:password:patternMatches:guessesRequired:", 1, v4, v22);

    }
    else
    {
      -[WBSPasswordPatternMatcher patternMatchesForPassword:withWordListCollection:](patternMatcher, "patternMatchesForPassword:withWordListCollection:", v4, self->_passwordWordListCollection);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WBSPasswordPatternMatchSolver initWithPassword:patternMatches:]([WBSPasswordPatternMatchSolver alloc], "initWithPassword:patternMatches:", v4, v10);
      -[WBSPasswordPatternMatchSolver optimalEvaluation](v13, "optimalEvaluation");
      v6 = (WBSPasswordEvaluation *)objc_claimAutoreleasedReturnValue();
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v5 = [WBSPasswordEvaluation alloc];
    v6 = -[WBSPasswordEvaluation initWithEvaluationType:password:patternMatches:guessesRequired:](v5, "initWithEvaluationType:password:patternMatches:guessesRequired:", 2, v4, MEMORY[0x1E0C9AA60], 0.0);
  }

  return v6;
}

+ (BOOL)passwordLooksLikeDigitOnlyPasscode:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB3500], "safari_asciiDigitCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", 0)))
    {
      v7 = 1;
      do
      {
        v8 = v7;
        if (v5 == v7)
          break;
        v9 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v7));
        v7 = v8 + 1;
      }
      while ((v9 & 1) != 0);
      v10 = v8 >= v5;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)standardPasswordEvaluator
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)a1);
  +[WBSPasswordWordListCollection commonPasswordWordListCollection](WBSPasswordWordListCollection, "commonPasswordWordListCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSPasswordWordListCollection commonPasscodeWordListCollection](WBSPasswordWordListCollection, "commonPasscodeWordListCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "_initWithPasswordWordListCollection:passcodeWordListCollection:", v3, v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternMatcher, 0);
  objc_storeStrong((id *)&self->_passcodeWordListCollection, 0);
  objc_storeStrong((id *)&self->_passwordWordListCollection, 0);
}

@end
