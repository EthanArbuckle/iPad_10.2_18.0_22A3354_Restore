@implementation PRWordLanguageModel

- (PRWordLanguageModel)initWithLocalization:(id)a3 appIdentifier:(id)a4 lexicon:(id)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  PRWordLanguageModel *v19;
  objc_super v21;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", a3);
  v10 = (void *)MEMORY[0x1E0C99E08];
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
  v12 = (void *)objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x1E0CCDFF0], v9, *MEMORY[0x1E0CCE000], 0);
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E0CCDFE0], 0);
  if (_kSuppressAdaptation)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v15 = *MEMORY[0x1E0CCDFD8];
    objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x1E0CCDFD8]);
    objc_msgSend(v13, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0), v15);
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CCE140], "languageModelWithOptions:error:", v12, 0);
  v17 = (void *)objc_msgSend(v16, "sessionWithOptions:", v13);
  v18 = (void *)objc_msgSend(v16, "tokenIDConverter");
  v21.receiver = self;
  v21.super_class = (Class)PRWordLanguageModel;
  v19 = -[PRWordLanguageModel init](&v21, sel_init);
  if (v19)
  {
    v19->_localization = (NSString *)objc_msgSend(a3, "copy");
    v19->_appIdentifier = (NSString *)objc_msgSend(a4, "copy");
    v19->_model = (NLLanguageModel *)v16;
    v19->_session = (NLLMLanguageModelSession *)v17;
    v19->_converter = (NLTokenIDConverter *)v18;
    v19->_lexicon = (PRLexicon *)a5;
  }

  return v19;
}

+ (id)languageModelWithLocalization:(id)a3 appIdentifier:(id)a4 lexicon:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithLocalization:appIdentifier:lexicon:", a3, a4, a5);
}

+ (void)performMaintenance
{
  objc_msgSend(MEMORY[0x1E0CCE138], "performMaintenance");
}

+ (void)setLogLevel:(int64_t)a3
{
  objc_msgSend(MEMORY[0x1E0CCE138], "setLogLevel:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRWordLanguageModel;
  -[PRWordLanguageModel dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRWordLanguageModel;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@(%@"), -[PRWordLanguageModel description](&v6, sel_description), self->_localization);
  v4 = v3;
  if (self->_appIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR(":%@"), self->_appIdentifier);
  if (self->_session)
    objc_msgSend(v4, "appendFormat:", CFSTR(":%@"), self->_session);
  if (self->_lexicon)
    objc_msgSend(v4, "appendFormat:", CFSTR("+%@"), self->_lexicon);
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return v4;
}

- (id)localization
{
  return self->_localization;
}

- (id)appIdentifier
{
  return self->_appIdentifier;
}

- (unsigned)tokenIDForString:(id)a3
{
  return -[NLTokenIDConverter tokenIDForString:](self->_converter, "tokenIDForString:", a3);
}

- (id)stringForTokenID:(unsigned int)a3
{
  if (a3 < 0x1F4)
    return 0;
  else
    return (id)-[NLTokenIDConverter stringForTokenID:](self->_converter, "stringForTokenID:");
}

- (BOOL)getConditionalProbabilityForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5 probability:(double *)a6
{
  void *v7;
  void *v8;
  uint64_t v9;

  v7 = (void *)-[NLLMLanguageModelSession conditionalProbabilityForTokenID:contextTokenIDs:length:](self->_session, "conditionalProbabilityForTokenID:contextTokenIDs:length:", *(_QWORD *)&a3, a4, a5);
  if (v7)
  {
    v8 = v7;
    LODWORD(v7) = objc_msgSend(v7, "isValid");
    if ((_DWORD)v7)
    {
      objc_msgSend(v8, "log10Probability");
      if (a6)
        *(_QWORD *)a6 = v9;
      LOBYTE(v7) = 1;
    }
  }
  return (char)v7;
}

- (BOOL)getUnigramProbabilityForString:(id)a3 probability:(double *)a4
{
  return -[PRLexicon getProbabilityForString:probability:](self->_lexicon, "getProbabilityForString:probability:", a3, a4);
}

- (float)usageCountForTokenID:(unsigned int)a3
{
  float result;

  -[NLLMLanguageModelSession usageCountForTokenID:](self->_session, "usageCountForTokenID:", *(_QWORD *)&a3);
  return result;
}

- (id)_descriptionForTokenSequence:(const unsigned int *)a3 length:(unint64_t)a4
{
  void *v7;
  uint64_t v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  if (a4)
  {
    v8 = 0;
    do
    {
      if (v8)
        objc_msgSend(v7, "appendString:", CFSTR(" "));
      objc_msgSend(v7, "appendFormat:", CFSTR("%u <%@>"), a3[v8], -[PRWordLanguageModel stringForTokenID:](self, "stringForTokenID:", a3[v8]));
      ++v8;
    }
    while (a4 != v8);
  }
  return v7;
}

- (BOOL)tokenSequenceIsBlocklisted:(const unsigned int *)a3 length:(unint64_t)a4
{
  return -[NLLMLanguageModelSession blocklistStatusForTokenIDs:length:matchType:](self->_session, "blocklistStatusForTokenIDs:length:matchType:", a3, a4, 2) != 0;
}

- (void)enumerateCompletionsForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
  -[PRLexicon enumerateCompletionsForPrefix:maxCompletions:withBlock:](self->_lexicon, "enumerateCompletionsForPrefix:maxCompletions:withBlock:", a3, a4, a5);
}

- (void)enumerateCompletionEntriesForPrefix:(id)a3 maxCompletions:(unint64_t)a4 withBlock:(id)a5
{
  -[PRLexicon enumerateCompletionEntriesForPrefix:maxCompletions:withBlock:](self->_lexicon, "enumerateCompletionEntriesForPrefix:maxCompletions:withBlock:", a3, a4, a5);
}

- (void)enumeratePredictionsForContext:(const unsigned int *)a3 length:(unint64_t)a4 maxPredictions:(unint64_t)a5 maxTokensPerPrediction:(unint64_t)a6 withBlock:(id)a7
{
  NLLMLanguageModelSession *session;
  _QWORD v8[7];
  _QWORD v9[4];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  session = self->_session;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__PRWordLanguageModel_enumeratePredictionsForContext_length_maxPredictions_maxTokensPerPrediction_withBlock___block_invoke;
  v8[3] = &unk_1EA8CCD90;
  v8[5] = v9;
  v8[6] = a5;
  v8[4] = a7;
  -[NLLMLanguageModelSession enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:](session, "enumeratePredictionsForContextTokenIDs:length:maximumPredictions:maximumTokensPerPrediction:withBlock:", a3, a4, a5, a6, v8);
  _Block_object_dispose(v9, 8);
}

_QWORD *__109__PRWordLanguageModel_enumeratePredictionsForContext_length_maxPredictions_maxTokensPerPrediction_withBlock___block_invoke(_QWORD *result, void *a2, _BYTE *a3)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unsigned __int8 v12;

  v4 = result;
  v12 = 0;
  v5 = *(_QWORD *)(result[5] + 8);
  v6 = *(_QWORD *)(v5 + 24);
  if (v6 >= result[6])
  {
    *(_QWORD *)(v5 + 24) = v6 + 1;
    goto LABEL_5;
  }
  v8 = result[4];
  v9 = objc_msgSend(a2, "tokenIDs");
  v10 = objc_msgSend(a2, "tokenIDLength");
  objc_msgSend((id)objc_msgSend(a2, "probabilityInfo"), "log10Probability");
  result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned __int8 *))(v8 + 16))(v8, v9, v10, &v12);
  v11 = v12;
  ++*(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24);
  if (!v11)
  {
LABEL_5:
    if (*(_QWORD *)(*(_QWORD *)(v4[5] + 8) + 24) < v4[6])
      return result;
  }
  *a3 = 1;
  return result;
}

- (void)enumerateEntriesForString:(id)a3 withBlock:(id)a4
{
  PRLexicon *lexicon;
  _QWORD v5[5];

  lexicon = self->_lexicon;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__PRWordLanguageModel_enumerateEntriesForString_withBlock___block_invoke;
  v5[3] = &unk_1EA8CCDB8;
  v5[4] = a4;
  -[PRLexicon enumerateEntriesForString:usingBlock:](lexicon, "enumerateEntriesForString:usingBlock:", a3, v5);
}

uint64_t __59__PRWordLanguageModel_enumerateEntriesForString_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
    *a5 = 1;
  return result;
}

- (BOOL)addTokenForString:(id)a3 tokenID:(unsigned int *)a4
{
  return -[NLLMLanguageModelSession addTokenForString:tokenID:](self->_session, "addTokenForString:tokenID:", a3, a4);
}

- (BOOL)getFirstDynamicTokenID:(unsigned int *)a3 lastDynamicTokenID:(unsigned int *)a4
{
  return -[NLLMLanguageModelSession getFirstDynamicTokenID:lastDynamicTokenID:](self->_session, "getFirstDynamicTokenID:lastDynamicTokenID:", a3, a4);
}

- (BOOL)shouldAdaptToTokenSequence:(const unsigned int *)a3 length:(unint64_t)a4
{
  return -[NLLMLanguageModelSession shouldAdaptToTokenIDs:length:](self->_session, "shouldAdaptToTokenIDs:length:", a3, a4);
}

- (void)incrementUsageCountForTokenID:(unsigned int)a3 context:(const unsigned int *)a4 length:(unint64_t)a5
{
  -[NLLMLanguageModelSession adaptToTokenID:contextTokenIDs:length:](self->_session, "adaptToTokenID:contextTokenIDs:length:", *(_QWORD *)&a3, a4, a5);
}

- (void)recordWithDifferentialPrivacy:(id)a3
{
  -[NLLMLanguageModelSession recordWithDifferentialPrivacy:](self->_session, "recordWithDifferentialPrivacy:", a3);
}

- (void)reset
{
  -[NLLMLanguageModelSession reset](self->_session, "reset");
}

- (void)flushDynamicData
{
  -[NLLMLanguageModelSession flushDynamicData](self->_session, "flushDynamicData");
}

- (void)applyExponentialDecay
{
  -[NLLMLanguageModelSession applyExponentialDecay](self->_session, "applyExponentialDecay");
}

- (void)pruneToSize:(unint64_t)a3
{
  -[NLLMLanguageModelSession pruneToSize:](self->_session, "pruneToSize:", a3);
}

@end
