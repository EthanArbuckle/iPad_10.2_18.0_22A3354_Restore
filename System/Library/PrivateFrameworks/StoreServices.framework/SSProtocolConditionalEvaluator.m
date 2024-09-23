@implementation SSProtocolConditionalEvaluator

- (SSProtocolConditionalEvaluator)init
{
  return -[SSProtocolConditionalEvaluator initWithDictionary:conditionalContext:](self, "initWithDictionary:conditionalContext:", 0, 0);
}

- (SSProtocolConditionalEvaluator)initWithDictionary:(id)a3
{
  return -[SSProtocolConditionalEvaluator initWithDictionary:conditionalContext:](self, "initWithDictionary:conditionalContext:", a3, 0);
}

- (SSProtocolConditionalEvaluator)initWithDictionary:(id)a3 conditionalContext:(id)a4
{
  SSProtocolConditionalEvaluator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSProtocolConditionalEvaluator;
  v6 = -[SSProtocolConditionalEvaluator init](&v8, sel_init);
  if (v6)
  {
    v6->_context = (SSProtocolConditionalContext *)objc_msgSend(a4, "copy");
    v6->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSProtocolConditionalEvaluator;
  -[SSProtocolConditionalEvaluator dealloc](&v3, sel_dealloc);
}

+ (id)defaultConditionalContext
{
  id v2;

  pthread_mutex_lock(&__DefaultContextLock);
  v2 = (id)__DefaultContext;
  pthread_mutex_unlock(&__DefaultContextLock);
  return v2;
}

+ (void)setDefaultConditionalContext:(id)a3
{
  pthread_mutex_lock(&__DefaultContextLock);
  if ((id)__DefaultContext != a3)
  {

    __DefaultContext = objc_msgSend(a3, "copy");
  }
  pthread_mutex_unlock(&__DefaultContextLock);
}

- (id)dictionaryByEvaluatingConditions
{
  return -[SSProtocolConditionalEvaluator _dictionaryByEvaluatingWithForcedValue:](self, "_dictionaryByEvaluatingWithForcedValue:", -1);
}

- (id)dictionaryByRemovingConditions
{
  return -[SSProtocolConditionalEvaluator _dictionaryByEvaluatingWithForcedValue:](self, "_dictionaryByEvaluatingWithForcedValue:", 1);
}

- (id)_arrayByEvaluatingChildrenOfArray:(id)a3 withForcedValue:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        v12 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = -[SSProtocolConditionalEvaluator _dictionaryByEvaluatingDictionary:withForcedValue:](self, "_dictionaryByEvaluatingDictionary:withForcedValue:", v12, a4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          v13 = -[SSProtocolConditionalEvaluator _arrayByEvaluatingChildrenOfArray:withForcedValue:](self, "_arrayByEvaluatingChildrenOfArray:withForcedValue:", v12, a4);
        }
        v12 = v13;
LABEL_11:
        objc_msgSend(v7, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  return v7;
}

- (BOOL)_checkConditions:(id)a3 withOperator:(id)a4
{
  int v6;
  BOOL v7;
  char v8;
  SSProtocolConditionalContext *context;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = -[SSProtocolConditionalEvaluator _logicalOperatorForString:](self, "_logicalOperatorForString:", a4);
  if (objc_msgSend(a3, "count"))
    v7 = v6 == 0;
  else
    v7 = 1;
  v8 = v7;
  context = self->_context;
  if (!context)
    context = (SSProtocolConditionalContext *)objc_msgSend((id)objc_opt_class(), "defaultConditionalContext");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(a3);
        v14 = +[SSProtocolCondition newConditionWithDictionary:](SSProtocolCondition, "newConditionWithDictionary:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        v15 = v14;
        if (v14)
        {
          if (v6 == 1)
          {
            if ((v8 & 1) != 0)
            {
              v8 = 1;
              goto LABEL_22;
            }
          }
          else
          {
            if (v6)
              goto LABEL_22;
            if ((v8 & 1) == 0)
            {
              v8 = 0;
              goto LABEL_22;
            }
          }
          v8 = objc_msgSend(v14, "evaluateWithContext:", context);
        }
LABEL_22:

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  return v8 & 1;
}

- (id)_dictionaryByEvaluatingChildrenOfDictionary:(id)a3 withForcedValue:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(a3);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(a3, "objectForKey:", v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = -[SSProtocolConditionalEvaluator _dictionaryByEvaluatingDictionary:withForcedValue:](self, "_dictionaryByEvaluatingDictionary:withForcedValue:", v13, a4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          v14 = -[SSProtocolConditionalEvaluator _arrayByEvaluatingChildrenOfArray:withForcedValue:](self, "_arrayByEvaluatingChildrenOfArray:withForcedValue:", v13, a4);
        }
        v13 = (uint64_t)v14;
LABEL_11:
        objc_msgSend(v7, "setObject:forKey:", v13, v12);
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  return v7;
}

- (id)_dictionaryByEvaluatingDictionary:(id)a3 withForcedValue:(int64_t)a4
{
  SSProtocolConditionalEvaluator *v5;
  id v6;

  v5 = -[SSProtocolConditionalEvaluator initWithDictionary:conditionalContext:]([SSProtocolConditionalEvaluator alloc], "initWithDictionary:conditionalContext:", a3, self->_context);
  v6 = -[SSProtocolConditionalEvaluator _dictionaryByEvaluatingWithForcedValue:](v5, "_dictionaryByEvaluatingWithForcedValue:", a4);

  if (v6)
    return v6;
  else
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (id)_dictionaryByEvaluatingWithForcedValue:(int64_t)a3
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  NSDictionary *v9;
  const __CFString *v10;
  NSDictionary *dictionary;
  NSDictionary *v12;
  NSDictionary *v13;
  SSProtocolConditionalEvaluator *v14;

  v5 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("conditions"));
  v6 = -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("operator"));
  if (!v5 || ((v7 = v6, (unint64_t)objc_msgSend(v5, "count") >= 2) ? (v8 = v7 == 0) : (v8 = 0), v8))
  {
    dictionary = self->_dictionary;
  }
  else
  {
    if (a3 == 1
      || a3 == -1
      && -[SSProtocolConditionalEvaluator _checkConditions:withOperator:](self, "_checkConditions:withOperator:", v5, v7))
    {
      v9 = self->_dictionary;
      v10 = CFSTR("content");
    }
    else
    {
      v9 = self->_dictionary;
      v10 = CFSTR("alt-content");
    }
    dictionary = -[NSDictionary objectForKey:](v9, "objectForKey:", v10);
  }
  v12 = dictionary;
  if (!v12
    || (v13 = v12, v12 != self->_dictionary)
    && (v14 = -[SSProtocolConditionalEvaluator initWithDictionary:conditionalContext:]([SSProtocolConditionalEvaluator alloc], "initWithDictionary:conditionalContext:", v12, self->_context), v13 = -[SSProtocolConditionalEvaluator _dictionaryByEvaluatingWithForcedValue:](v14, "_dictionaryByEvaluatingWithForcedValue:", a3), v14, !v13))
  {
    v13 = self->_dictionary;
  }
  return -[SSProtocolConditionalEvaluator _dictionaryByEvaluatingChildrenOfDictionary:withForcedValue:](self, "_dictionaryByEvaluatingChildrenOfDictionary:withForcedValue:", v13, a3);
}

- (int)_logicalOperatorForString:(id)a3
{
  uint64_t v4;
  char i;
  char v6;

  v4 = 0;
  for (i = 1; ; i = 0)
  {
    v6 = i;
    if ((objc_msgSend(a3, "isEqualToString:", __LogicalOperatorNames[v4]) & 1) != 0)
      break;
    v4 = 1;
    if ((v6 & 1) == 0)
    {
      LODWORD(v4) = 0;
      return v4;
    }
  }
  return v4;
}

@end
