@implementation CRNamedEntityRecognizer

- (CRNamedEntityRecognizer)initWithNameGazetteerURL:(id)a3 lastNameGazetteerURL:(id)a4
{
  id v6;
  id v7;
  CRNamedEntityRecognizer *v8;
  void *v9;
  uint64_t v10;
  NLGazetteer *nameGazetteer;
  uint64_t v12;
  NLGazetteer *lastNameGazetteer;
  uint64_t v14;
  NLTagger *tagger;
  uint64_t v16;
  NLTokenizer *tokenizer;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRNamedEntityRecognizer;
  v8 = -[CRNamedEntityRecognizer init](&v19, sel_init);
  if (v8)
  {
    v20[0] = *MEMORY[0x1E0CCE0C8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCE130]), "initWithContentsOfURL:error:", v6, 0);
    nameGazetteer = v8->_nameGazetteer;
    v8->_nameGazetteer = (NLGazetteer *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCE130]), "initWithContentsOfURL:error:", v7, 0);
    lastNameGazetteer = v8->_lastNameGazetteer;
    v8->_lastNameGazetteer = (NLGazetteer *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCE168]), "initWithTagSchemes:", v9);
    tagger = v8->_tagger;
    v8->_tagger = (NLTagger *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
    tokenizer = v8->_tokenizer;
    v8->_tokenizer = (NLTokenizer *)v16;

  }
  return v8;
}

- (id)_tokenizeString:(id)a3
{
  NLTokenizer *tokenizer;
  id v5;
  NLTokenizer *v6;
  uint64_t v7;
  void *v8;

  tokenizer = self->_tokenizer;
  v5 = a3;
  -[NLTokenizer setString:](tokenizer, "setString:", v5);
  v6 = self->_tokenizer;
  v7 = objc_msgSend(v5, "length");

  -[NLTokenizer tokensForRange:](v6, "tokensForRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLTokenizer setString:](self->_tokenizer, "setString:", &stru_1E98DC948);
  return v8;
}

- (id)_labelForString:(id)a3 useLastNameGazetteer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;

  v4 = a4;
  v6 = a3;
  if (qword_1ED0B46B8 != -1)
    dispatch_once(&qword_1ED0B46B8, &__block_literal_global_26);
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)_MergedGlobals_26, "containsObject:", v7) & 1) != 0)
  {
    v8 = CFSTR("PersonName");
  }
  else if ((objc_msgSend((id)qword_1ED0B46B0, "containsObject:", v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = 8;
    if (v4)
      v9 = 16;
    objc_msgSend(*(id *)((char *)&self->super.isa + v9), "labelForString:", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __64__CRNamedEntityRecognizer__labelForString_useLastNameGazetteer___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F800);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_26;
  _MergedGlobals_26 = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F818);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED0B46B0;
  qword_1ED0B46B0 = v2;

}

+ (id)_NLLanguageFromLocale:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED0B46C8;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED0B46C8, &__block_literal_global_20_0);
  objc_msgSend((id)qword_1ED0B46C0, "valueForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __49__CRNamedEntityRecognizer__NLLanguageFromLocale___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CCDF10];
  v7[0] = CFSTR("de-DE");
  v7[1] = CFSTR("en-US");
  v1 = *MEMORY[0x1E0CCDEF8];
  v8[0] = v0;
  v8[1] = v1;
  v2 = *MEMORY[0x1E0CCDF80];
  v7[2] = CFSTR("es-ES");
  v7[3] = CFSTR("fr-FR");
  v3 = *MEMORY[0x1E0CCDF08];
  v8[2] = v2;
  v8[3] = v3;
  v7[4] = CFSTR("it-IT");
  v7[5] = CFSTR("pt-BR");
  v4 = *MEMORY[0x1E0CCDF58];
  v8[4] = *MEMORY[0x1E0CCDF20];
  v8[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ED0B46C0;
  qword_1ED0B46C0 = v5;

}

- (id)_nameCandidateTokensFromString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  if (qword_1ED0B46D0 != -1)
    dispatch_once(&qword_1ED0B46D0, &__block_literal_global_22);
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2 || (unint64_t)objc_msgSend(v4, "count") > 4)
  {
    v5 = 0;
    goto LABEL_21;
  }
  v6 = (void *)objc_opt_new();
  if (!objc_msgSend(v4, "count"))
  {
LABEL_18:
    v5 = v6;
    goto LABEL_20;
  }
  v7 = 0;
  while (1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v7 < objc_msgSend(v4, "count") - 1 && objc_msgSend(v8, "length") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)) & 1) != 0)
      {
        v10 = objc_msgSend(v8, "characterAtIndex:", 1);

        if (v10 == 46)
          goto LABEL_17;
      }
      else
      {

      }
    }
    v11 = qword_1ED0B46D8;
    objc_msgSend(v8, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = objc_msgSend((id)v11, "containsObject:", v12);

    if ((v11 & 1) != 0)
      break;
    objc_msgSend(v6, "addObject:", v8);
LABEL_17:

    if (++v7 >= objc_msgSend(v4, "count"))
      goto LABEL_18;
  }

  v5 = 0;
LABEL_20:

LABEL_21:
  return v5;
}

void __58__CRNamedEntityRecognizer__nameCandidateTokensFromString___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E993F830);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0B46D8;
  qword_1ED0B46D8 = v0;

}

- (double)personNameScoreForStringWithGazetteers:(id)a3 locale:(id)a4 useLastNameGazetteer:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRNamedEntityRecognizer _nameCandidateTokensFromString:](self, "_nameCandidateTokensFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      v14 = -1.0;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[CRNamedEntityRecognizer _labelForString:useLastNameGazetteer:](self, "_labelForString:useLastNameGazetteer:", v16, 0, (_QWORD)v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {

          }
          else
          {
            if (!v5)
              goto LABEL_17;
            objc_msgSend(v10, "lastObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16 != v18)
            {

              goto LABEL_17;
            }
            -[CRNamedEntityRecognizer _labelForString:useLastNameGazetteer:](self, "_labelForString:useLastNameGazetteer:", v16, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              goto LABEL_17;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }
    v14 = 1.0;
LABEL_17:

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (double)personNameScoreForStringWithTagger:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NLTagger *tagger;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  -[CRNamedEntityRecognizer _nameCandidateTokensFromString:](self, "_nameCandidateTokensFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_NLLanguageFromLocale:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (!self->_tagger || !v9)
      goto LABEL_7;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLTagger setString:](self->_tagger, "setString:", v11);
    -[NLTagger setLanguage:range:](self->_tagger, "setLanguage:range:", v10, 0, objc_msgSend(v11, "length"));
    tagger = self->_tagger;
    v13 = objc_msgSend(v11, "length");
    v14 = *MEMORY[0x1E0CCE0C8];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __69__CRNamedEntityRecognizer_personNameScoreForStringWithTagger_locale___block_invoke;
    v21[3] = &unk_1E98DB0A8;
    v21[4] = &v22;
    -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](tagger, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v13, 0, v14, 0, v21);
    v15 = v23[3];
    v16 = objc_msgSend(v8, "count");
    v17 = 3;
    if (v16 > 3)
      v17 = v16;
    v18 = v17 - 1;

    _Block_object_dispose(&v22, 8);
    v19 = 1.0;
    if (v15 < v18)
LABEL_7:
      v19 = -1.0;

  }
  else
  {
    v19 = -1.0;
  }

  return v19;
}

uint64_t __69__CRNamedEntityRecognizer_personNameScoreForStringWithTagger_locale___block_invoke(uint64_t result, uint64_t a2)
{
  if (*MEMORY[0x1E0CCE080] == a2)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_storeStrong((id *)&self->_lastNameGazetteer, 0);
  objc_storeStrong((id *)&self->_nameGazetteer, 0);
}

@end
