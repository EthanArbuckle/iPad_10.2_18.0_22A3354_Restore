@implementation TIStaticLanguageLikelihoodModel

- (TIStaticLanguageLikelihoodModel)initWithPrimaryInputMode:(id)a3 secondaryInputMode:(id)a4 secondaryLanguageWeight:(float)a5
{
  id v9;
  id v10;
  TIStaticLanguageLikelihoodModel *v11;
  TIStaticLanguageLikelihoodModel *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIStaticLanguageLikelihoodModel;
  v11 = -[TIStaticLanguageLikelihoodModel init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryInputMode, a3);
    objc_storeStrong((id *)&v12->_secondaryInputMode, a4);
    v12->_secondaryLanguageWeight = a5;
  }

  return v12;
}

- (id)rankedLanguagesForRecipient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIStaticLanguageLikelihoodModel primaryInputMode](self, "primaryInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "normalizedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguage();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v8);
    -[TIStaticLanguageLikelihoodModel secondaryInputMode](self, "secondaryInputMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "normalizedIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetLanguage();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addObject:", v12);
    }

  }
  return v4;
}

- (float)_priorProbabilityForLanguage:(id)a3 recipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;

  v5 = a3;
  -[TIStaticLanguageLikelihoodModel primaryInputMode](self, "primaryInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetLanguage();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", v5))
  {
    -[TIStaticLanguageLikelihoodModel primaryLanguageWeight](self, "primaryLanguageWeight");
    v10 = v9;
  }
  else
  {
    -[TIStaticLanguageLikelihoodModel secondaryInputMode](self, "secondaryInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "normalizedIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguage();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0.0;
    if (objc_msgSend(v13, "isEqualToString:", v5))
    {
      -[TIStaticLanguageLikelihoodModel secondaryLanguageWeight](self, "secondaryLanguageWeight");
      v10 = v14;
    }

  }
  return v10;
}

- (void)priorProbabilityForLanguages:(id)a3 recipient:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, char *);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, char *))a5;
  v20 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v17;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v13)
        objc_enumerationMutation(v11);
      v15 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14);
      -[TIStaticLanguageLikelihoodModel _priorProbabilityForLanguage:recipient:](self, "_priorProbabilityForLanguage:recipient:", v15, v9, (_QWORD)v16);
      v10[2](v10, v15, &v20);
      if (v20)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v12)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  return 0.0;
}

- (unint64_t)emojiUsageCountForApp:(id)a3 lastEmojiCountUpdateTime:(double *)a4
{
  return 0;
}

- (float)primaryLanguageWeight
{
  float v2;

  -[TIStaticLanguageLikelihoodModel secondaryLanguageWeight](self, "secondaryLanguageWeight");
  return 1.0 - v2;
}

- (TIInputMode)primaryInputMode
{
  return self->_primaryInputMode;
}

- (TIInputMode)secondaryInputMode
{
  return self->_secondaryInputMode;
}

- (float)secondaryLanguageWeight
{
  return self->_secondaryLanguageWeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryInputMode, 0);
  objc_storeStrong((id *)&self->_primaryInputMode, 0);
}

@end
