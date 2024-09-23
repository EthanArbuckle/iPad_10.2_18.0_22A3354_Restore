@implementation PRNLPLanguageModelState

- (PRNLPLanguageModelState)initWithLanguageModel:(id)a3 state:(id)a4
{
  PRNLPLanguageModelState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PRNLPLanguageModelState;
  v6 = -[PRNLPLanguageModelState init](&v8, sel_init);
  if (v6)
  {
    v6->_languageModel = (PRNLPLanguageModel *)a3;
    v6->_state = (NLLanguageModelState *)a4;
    v6->_cachedPredictionsDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v6;
}

- (BOOL)getConditionalProbabilityForString:(id)a3 probability:(double *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)-[NLLanguageModelState conditionalProbabilityForString:](self->_state, "conditionalProbabilityForString:", a3);
  if (v5)
  {
    v6 = v5;
    LODWORD(v5) = objc_msgSend(v5, "isValid");
    if ((_DWORD)v5)
    {
      objc_msgSend(v6, "log10Probability");
      if (a4)
        *(_QWORD *)a4 = v7;
      LOBYTE(v5) = 1;
    }
  }
  return (char)v5;
}

- (id)conditionalProbabilityDictionaryForStrings:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)-[NLLanguageModelState conditionalProbabilitiesForStrings:](self->_state, "conditionalProbabilitiesForStrings:", a3);
  v7 = objc_msgSend(a3, "count");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = objc_msgSend(a3, "objectAtIndex:", i);
      v11 = (void *)objc_msgSend(v6, "objectAtIndex:", i);
      if (objc_msgSend(v11, "isValid"))
      {
        objc_msgSend(v11, "log10Probability");
        objc_msgSend(v5, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), v10);
      }
    }
  }
  return v5;
}

- (void)enumeratePredictions:(unint64_t)a3 maxTokensPerPrediction:(unint64_t)a4 withBlock:(id)a5
{
  uint64_t v9;
  void *v10;
  NLLanguageModelState *state;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  unsigned __int8 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u/%u"), a3, a4);
  v10 = (void *)-[NSMutableDictionary objectForKey:](self->_cachedPredictionsDictionary, "objectForKey:", v9);
  if (!v10)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    state = self->_state;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __81__PRNLPLanguageModelState_enumeratePredictions_maxTokensPerPrediction_withBlock___block_invoke;
    v26[3] = &unk_1EA8CCDE0;
    v26[4] = v10;
    -[NLLanguageModelState enumeratePredictions:maximumTokensPerPrediction:withBlock:](state, "enumeratePredictions:maximumTokensPerPrediction:withBlock:", a3, a4, v26);
    -[NSMutableDictionary setObject:forKey:](self->_cachedPredictionsDictionary, "setObject:forKey:", v10, v9);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v23;
LABEL_5:
    v16 = 0;
    v17 = v14 + v13;
    while (1)
    {
      if (*(_QWORD *)v23 != v15)
        objc_enumerationMutation(v10);
      v18 = 0;
      v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v16);
      v21 = 0;
      if (v14 + v16 < a3)
      {
        v20 = objc_msgSend(v19, "prediction");
        objc_msgSend((id)objc_msgSend(v19, "probabilityInfo"), "log10Probability");
        (*((void (**)(id, uint64_t, unsigned __int8 *))a5 + 2))(a5, v20, &v21);
        v18 = v21;
      }
      if (v18 || v14 + v16 + 1 >= a3)
        break;
      if (v13 == ++v16)
      {
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v14 = v17;
        if (v13)
          goto LABEL_5;
        return;
      }
    }
  }
}

uint64_t __81__PRNLPLanguageModelState_enumeratePredictions_maxTokensPerPrediction_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRNLPLanguageModelState;
  -[PRNLPLanguageModelState dealloc](&v3, sel_dealloc);
}

- (PRNLPLanguageModel)languageModel
{
  return self->_languageModel;
}

@end
