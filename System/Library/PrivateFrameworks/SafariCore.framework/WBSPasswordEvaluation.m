@implementation WBSPasswordEvaluation

- (WBSPasswordEvaluation)initWithEvaluationType:(int64_t)a3 password:(id)a4 patternMatches:(id)a5 guessesRequired:(double)a6
{
  id v10;
  id v11;
  WBSPasswordEvaluation *v12;
  WBSPasswordEvaluation *v13;
  uint64_t v14;
  NSString *password;
  uint64_t v16;
  NSArray *patternMatches;
  WBSPasswordEvaluation *v18;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSPasswordEvaluation;
  v12 = -[WBSPasswordEvaluation init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_evaluationType = a3;
    v14 = objc_msgSend(v10, "copy");
    password = v13->_password;
    v13->_password = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    patternMatches = v13->_patternMatches;
    v13->_patternMatches = (NSArray *)v16;

    v13->_guessesRequired = a6;
    v18 = v13;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  WBSPasswordEvaluation *v4;
  WBSPasswordEvaluation *v5;
  BOOL v6;

  v4 = (WBSPasswordEvaluation *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_evaluationType == v5->_evaluationType
        && -[NSString isEqual:](self->_password, "isEqual:", v5->_password)
        && -[NSArray isEqualToArray:](self->_patternMatches, "isEqualToArray:", v5->_patternMatches)
        && self->_guessesRequired == v5->_guessesRequired;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t evaluationType;
  NSUInteger v4;

  evaluationType = self->_evaluationType;
  v4 = -[NSString hash](self->_password, "hash") ^ evaluationType;
  return v4 ^ -[NSArray hash](self->_patternMatches, "hash") ^ (unint64_t)self->_guessesRequired;
}

- (unint64_t)strength
{
  int64_t evaluationType;
  double guessesRequired;
  double v5;

  evaluationType = self->_evaluationType;
  if (evaluationType == 1)
  {
    guessesRequired = self->_guessesRequired;
    v5 = 1000.0;
  }
  else
  {
    if (evaluationType)
      return 3;
    guessesRequired = self->_guessesRequired;
    if (guessesRequired < 1000000.0)
      return 0;
    v5 = 99999999.0;
  }
  if (guessesRequired < v5)
    return 1;
  else
    return 2;
}

- (BOOL)userShouldBeShownPassiveWarning
{
  return -[WBSPasswordEvaluation strength](self, "strength") < 2;
}

- (BOOL)userShouldBeShownActiveWarning
{
  return -[WBSPasswordEvaluation strength](self, "strength") == 0;
}

- (double)guessesRequired
{
  double result;

  result = 0.0;
  if (self->_evaluationType != 2)
    return self->_guessesRequired;
  return result;
}

- (unint64_t)_userFeedbackLengthScoreForPatternMatch:(id)a3
{
  id v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "type") == 3;
  objc_msgSend(v3, "range");
  v6 = v5;

  return v6 << v4;
}

- (WBSPasswordPatternMatch)bestPatternMatchForUserFeedback
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[NSArray safari_filterObjectsUsingBlock:](self->_patternMatches, "safari_filterObjectsUsingBlock:", &__block_literal_global_40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__WBSPasswordEvaluation_bestPatternMatchForUserFeedback__block_invoke_2;
  v6[3] = &unk_1E649DE80;
  v6[4] = self;
  objc_msgSend(v3, "safari_reduceObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WBSPasswordPatternMatch *)v4;
}

BOOL __56__WBSPasswordEvaluation_bestPatternMatchForUserFeedback__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;
  unint64_t v9;

  v2 = a2;
  v3 = objc_msgSend(v2, "type");
  if (v3)
  {
    if (v3 == 4)
    {
      objc_msgSend(v2, "range");
      v8 = v9 > 2;
    }
    else if (v3 == 3)
    {
      objc_msgSend(v2, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safari_numberForKey:", CFSTR("WordListGuessesRequired"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      v7 = v6;

      v8 = v7 <= 100000.0;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __56__WBSPasswordEvaluation_bestPatternMatchForUserFeedback__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v6)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "_userFeedbackLengthScoreForPatternMatch:", v5);
    v9 = objc_msgSend(*(id *)(a1 + 32), "_userFeedbackLengthScoreForPatternMatch:", v6);
    v7 = v5;
    if (v8 <= v9)
    {
      v7 = v6;
      if (v9 <= v8)
      {
        objc_msgSend(v5, "guessesRequired");
        v11 = v10;
        objc_msgSend(v6, "guessesRequired");
        if (v11 >= v12)
          v7 = v6;
        else
          v7 = v5;
      }
    }
  }
  v13 = v7;

  return v13;
}

- (id)_bestPatternMatchOfType:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_patternMatches;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (_QWORD)v16) == a3)
        {
          if (!v7 || (objc_msgSend(v7, "guessesRequired"), v12 = v11, objc_msgSend(v10, "guessesRequired"), v12 > v13))
          {
            v14 = v10;

            v7 = v14;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldShowUserFeedbackStringsForWordListPatternMatch:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_numberForKey:", CFSTR("WordListGuessesRequired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6 <= 100000.0;
}

- (id)_passwordFeedbackStringWithPasswordVisibility:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v29;

  -[WBSPasswordEvaluation bestPatternMatchForUserFeedback](self, "bestPatternMatchForUserFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "type") != 3
      || !-[WBSPasswordEvaluation _shouldShowUserFeedbackStringsForWordListPatternMatch:](self, "_shouldShowUserFeedbackStringsForWordListPatternMatch:", v6))
    {
LABEL_39:
      if (objc_msgSend(v6, "type") == 2)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = CFSTR("This password uses a sequence, “%@”, which makes it easy to guess.");
LABEL_43:
        _WBSLocalizedString(v25, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "matchedSubstring");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", v26, v27);
        v9 = objc_claimAutoreleasedReturnValue();

LABEL_44:
        goto LABEL_45;
      }
      if (objc_msgSend(v6, "type") == 1)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = CFSTR("This password uses a pattern found on a keyboard, “%@”, which makes it easy to guess.");
        goto LABEL_43;
      }
      if (objc_msgSend(v6, "type") == 4)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString(CFSTR("This password repeats part of the password, which makes it easy to guess."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", v26);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
      goto LABEL_7;
    }
    objc_msgSend(v6, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3 == 2)
    {
      v9 = 1;
    }
    else if (a3)
    {
      v9 = 0;
    }
    else
    {
      v9 = objc_msgSend(v7, "safari_BOOLForKey:", CFSTR("IsSensitive"));
    }
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("WordListIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("FirstSubstitutedCharacter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_stringForKey:", CFSTR("FirstSubstitutionCharacter"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("EnglishLexicon")))
      {
        v14 = CFSTR("This password is based on a common word, which makes it easy to guess.");
LABEL_33:
        _WBSLocalizedString(v14, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_37:
        v19 = 0;
LABEL_38:

        if (!v19)
          goto LABEL_45;
        goto LABEL_39;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("CommonPasswords")))
      {
        v14 = CFSTR("This password is based on a common password, which makes it easy to guess.");
        goto LABEL_33;
      }
    }
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("EnglishLexicon")))
    {
      objc_msgSend(v6, "range");
      if (v15 == -[NSString length](self->_password, "length")
        && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubstitutionVariations")),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v16,
            !v16))
      {
        if ((_DWORD)v9)
        {
          v14 = CFSTR("This password is a common word, which makes it easy to guess.");
          goto LABEL_33;
        }
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = CFSTR("This password is a common word, “%@”, which makes it easy to guess.");
      }
      else
      {
        if ((_DWORD)v9)
        {
          v14 = CFSTR("This password contains a common word, which makes it easy to guess.");
          goto LABEL_33;
        }
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = CFSTR("This password contains a common word, “%@”, which makes it easy to guess.");
      }
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("CommonPasswords")))
      {
        v19 = 1;
        goto LABEL_38;
      }
      objc_msgSend(v6, "range");
      if (v17 == -[NSString length](self->_password, "length")
        && (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubstitutionVariations")),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v18,
            !v18))
      {
        if ((_DWORD)v9)
        {
          v14 = CFSTR("Many people use this password, which makes it easy to guess.");
          goto LABEL_33;
        }
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = CFSTR("Many people use the password “%@”, which makes it easy to guess.");
      }
      else
      {
        if ((_DWORD)v9)
        {
          v14 = CFSTR("This password contains a common password, which makes it easy to guess.");
          goto LABEL_33;
        }
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = CFSTR("This password contains a common password, “%@”, which makes it easy to guess.");
      }
    }
    _WBSLocalizedString(v21, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matchedSubstring");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v22, v23);
    v9 = objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
LABEL_7:
  _WBSLocalizedString(CFSTR("This password is easy to guess."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_45:

  return (id)v9;
}

- (id)userFeedbackStringWithPasswordVisibility:(unint64_t)a3
{
  void *v5;

  if (-[WBSPasswordEvaluation userShouldBeShownPassiveWarning](self, "userShouldBeShownPassiveWarning"))
  {
    if (self->_evaluationType)
      _WBSLocalizedString(CFSTR("This password is easy to guess."), &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    else
      -[WBSPasswordEvaluation _passwordFeedbackStringWithPasswordVisibility:](self, "_passwordFeedbackStringWithPasswordVisibility:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)compactDescriptionWithPasswordColumnWidth:(unint64_t)a3 includePatternMatches:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = -[WBSPasswordEvaluation strength](self, "strength");
  if (v8 > 3)
    v9 = 0;
  else
    v9 = off_1E649DEA0[v8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%-*s | %12lg | %@"), a3, -[NSString UTF8String](self->_password, "UTF8String"), *(_QWORD *)&self->_guessesRequired, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  if (v4)
  {
    objc_msgSend(v7, "addObject:", &stru_1E64A2498);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_patternMatches;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "compactDescriptionWithMatchedStringColumnWidth:", a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("\n"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)password
{
  return self->_password;
}

- (NSArray)patternMatches
{
  return self->_patternMatches;
}

- (int64_t)evaluationType
{
  return self->_evaluationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternMatches, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
