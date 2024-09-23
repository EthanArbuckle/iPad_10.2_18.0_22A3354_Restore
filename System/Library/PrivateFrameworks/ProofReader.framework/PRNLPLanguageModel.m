@implementation PRNLPLanguageModel

- (id)modelOptionsForLocale:(id)a3 type:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  switch(a4)
  {
    case 1:
      v5 = (void *)MEMORY[0x1E0C99D80];
      v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      self = (id)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, *MEMORY[0x1E0CCDFF0], a3, *MEMORY[0x1E0CCE000], 0, v18, v19, v20, v21);
      break;
    case 2:
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = *MEMORY[0x1E0CCDF40];
      v9 = *MEMORY[0x1E0CCDFE8];
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      self = (id)objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x1E0CCDFF0], a3, *MEMORY[0x1E0CCE000], 0, v20, v21);
      break;
    case 3:
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = *MEMORY[0x1E0CCDF40];
      v13 = *MEMORY[0x1E0CCDFE8];
      v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v15 = *MEMORY[0x1E0CCDFF0];
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v17 = (_QWORD *)MEMORY[0x1E0CCE008];
      goto LABEL_6;
    case 4:
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = *MEMORY[0x1E0CCDF40];
      v13 = *MEMORY[0x1E0CCDFE8];
      v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v15 = *MEMORY[0x1E0CCDFF0];
      v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v17 = (_QWORD *)MEMORY[0x1E0CCDFF8];
LABEL_6:
      self = (id)objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, v13, v14, v15, v16, *v17, a3, *MEMORY[0x1E0CCE000], 0);
      break;
    default:
      return self;
  }
  return self;
}

- (PRNLPLanguageModel)initWithLocalization:(id)a3 type:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  PRNLPLanguageModel *v14;
  objc_super v16;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", a3);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[PRNLPLanguageModel modelOptionsForLocale:type:](self, "modelOptionsForLocale:type:", v7, a4));
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (_kSuppressAdaptation)
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v11 = *MEMORY[0x1E0CCDFD8];
    objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x1E0CCDFD8]);
    objc_msgSend(v9, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0), v11);
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0CCE140], "languageModelWithOptions:error:", v8, 0);
  v13 = (void *)objc_msgSend(v12, "sessionWithOptions:", v9);
  v16.receiver = self;
  v16.super_class = (Class)PRNLPLanguageModel;
  v14 = -[PRNLPLanguageModel init](&v16, sel_init);
  if (v14)
  {
    v14->_localization = (NSString *)objc_msgSend(a3, "copy");
    v14->_modelType = a4;
    v14->_model = (NLLanguageModel *)v12;
    v14->_session = (NLLanguageModelSession *)v13;
    v14->_cachedStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14->_cachedContextsRecycleQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  return v14;
}

+ (PRNLPLanguageModel)languageModelWithLocalization:(id)a3 type:(int64_t)a4
{
  return (PRNLPLanguageModel *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithLocalization:type:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRNLPLanguageModel;
  -[PRNLPLanguageModel dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRNLPLanguageModel;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@(%@"), -[PRNLPLanguageModel description](&v6, sel_description), self->_localization);
  v4 = v3;
  if (self->_session)
    objc_msgSend(v3, "appendFormat:", CFSTR(":%@"), self->_session);
  objc_msgSend(v4, "appendString:", CFSTR(")"));
  return v4;
}

- (BOOL)getConditionalProbabilityForString:(id)a3 context:(id)a4 probability:(double *)a5
{
  void *v6;
  void *v7;
  uint64_t v8;

  v6 = (void *)-[NLLanguageModelSession conditionalProbabilityForString:context:](self->_session, "conditionalProbabilityForString:context:", a3, a4);
  if (v6)
  {
    v7 = v6;
    LODWORD(v6) = objc_msgSend(v6, "isValid");
    if ((_DWORD)v6)
    {
      objc_msgSend(v7, "log10Probability");
      if (a5)
        *(_QWORD *)a5 = v8;
      LOBYTE(v6) = 1;
    }
  }
  return (char)v6;
}

- (BOOL)stringIsBlocklisted:(id)a3
{
  return -[NLLanguageModelSession blocklistStatusForString:matchType:](self->_session, "blocklistStatusForString:matchType:", a3, 2) != 0;
}

- (id)stateWithContext:(id)a3
{
  PRNLPLanguageModelState *v5;
  void *v6;
  NSMutableArray *cachedContextsRecycleQueue;
  void *v8;
  id v9;

  v5 = (PRNLPLanguageModelState *)(id)-[NSMutableDictionary objectForKey:](self->_cachedStates, "objectForKey:");
  if (!v5)
  {
    v6 = (void *)-[NLLanguageModelSession stateWithOptions:](self->_session, "stateWithOptions:", MEMORY[0x1E0C9AA70]);
    objc_msgSend(v6, "addContext:", a3);
    v5 = -[PRNLPLanguageModelState initWithLanguageModel:state:]([PRNLPLanguageModelState alloc], "initWithLanguageModel:state:", self, v6);
    while (-[NSMutableDictionary count](self->_cachedStates, "count"))
    {
      if (-[NSMutableArray count](self->_cachedContextsRecycleQueue, "count"))
        cachedContextsRecycleQueue = self->_cachedContextsRecycleQueue;
      else
        cachedContextsRecycleQueue = (NSMutableArray *)-[NSMutableDictionary allKeys](self->_cachedStates, "allKeys");
      v8 = (void *)-[NSMutableArray firstObject](cachedContextsRecycleQueue, "firstObject");
      v9 = v8;
      -[NSMutableDictionary removeObjectForKey:](self->_cachedStates, "removeObjectForKey:", v8);
      -[NSMutableArray removeObject:](self->_cachedContextsRecycleQueue, "removeObject:", v8);

    }
    -[NSMutableDictionary setObject:forKey:](self->_cachedStates, "setObject:forKey:", v5, a3);
    -[NSMutableArray addObject:](self->_cachedContextsRecycleQueue, "addObject:", a3);
  }
  return v5;
}

- (NSString)localization
{
  return self->_localization;
}

- (int64_t)modelType
{
  return self->_modelType;
}

@end
