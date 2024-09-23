@implementation PGTitleSpec

- (PGTitleSpec)initWithFormat:(id)a3 titleCategory:(int64_t)a4
{
  id v7;
  PGTitleSpec *v8;
  PGTitleSpec *v9;
  NSArray *arguments;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGTitleSpec;
  v8 = -[PGTitleSpec init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_format, a3);
    v9->_titleCategory = a4;
    arguments = v9->_arguments;
    v9->_arguments = (NSArray *)MEMORY[0x1E0C9AA60];

    v9->_weekdayCriteria = 0;
  }

  return v9;
}

- (id)titleWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PGTitleSpec _canFulfillWeekdayCriteriaWithMomentNodes:](self, "_canFulfillWeekdayCriteriaWithMomentNodes:", v6))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_arguments, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_arguments;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "requiresInput", (_QWORD)v18)
            && !-[PGTitleSpec _resolveRequiredInputForArgument:](self, "_resolveRequiredInputForArgument:", v14))
          {
            goto LABEL_15;
          }
          objc_msgSend(v14, "_resolvedStringWithMomentNodes:argumentEvaluationContext:", v6, v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v15, "length"))
          {

LABEL_15:
            v16 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    -[PGTitleSpec _titleWithResolvedArguments:](self, "_titleWithResolvedArguments:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)titleWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PGTitleSpec _canFulfillWeekdayCriteriaWithMomentNodes:](self, "_canFulfillWeekdayCriteriaWithMomentNodes:", v8))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_arguments, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = self->_arguments;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v17, "requiresInput", (_QWORD)v21)
            && !-[PGTitleSpec _resolveRequiredInputForArgument:](self, "_resolveRequiredInputForArgument:", v17))
          {
            goto LABEL_15;
          }
          objc_msgSend(v17, "_resolvedStringWithMomentNodes:features:argumentEvaluationContext:", v8, v9, v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "length"))
          {

LABEL_15:
            v19 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }

    -[PGTitleSpec _titleWithResolvedArguments:](self, "_titleWithResolvedArguments:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_titleWithResolvedArguments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PGTitleSpec _appendArguments:toFormatString:](self, "_appendArguments:toFormatString:", v4, self->_format);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    if (!self->_hasSpecArgumentHandlingLineBreakBehavior)
    {
      if (self->_insertNonBreakableSpace)
      {
        objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
        v7 = objc_claimAutoreleasedReturnValue();

        +[PGCommonTitleUtility titleWithNoLineBreakSpaceForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithNoLineBreakSpaceForTitle:andUsedNames:", v7, v4);
        v8 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v7;
      }
      else
      {
        if (self->_hasLineBreak)
          goto LABEL_8;
        +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v5, v4);
        v8 = objc_claimAutoreleasedReturnValue();
      }

      v6 = (void *)v8;
    }
LABEL_8:
    +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, self->_titleCategory);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (BOOL)_resolveRequiredInputForArgument:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  id WeakRetained;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "inputVariable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "titleSpec:inputForArgument:", self, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v8 != 0;
    objc_msgSend(v4, "setInputVariable:", v8);

  }
  return v6;
}

- (id)_appendArguments:(id)a3 toFormatString:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  switch(objc_msgSend(v5, "count"))
  {
    case 0:
      v7 = v6;
      break;
    case 1:
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PFLocalizedStringWithValidatedFormat();
      v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_10:

      break;
    default:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loggingConnection");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v15 = 3;
        _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "Not able to resolve a string with more than %lu arguments. Please file a radar agains Photos Media Mining.", buf, 0xCu);
      }

      v7 = 0;
      break;
  }

  return v7;
}

- (BOOL)_canFulfillWeekdayCriteriaWithMomentNodes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  if (!self->_weekdayCriteria)
    return 1;
  +[PGTimeTitleUtility significantDateNodesFromMomentNodes:dateFormatterType:](PGTimeTitleUtility, "significantDateNodesFromMomentNodes:dateFormatterType:", a3, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(MEMORY[0x1E0D4B130], "dayOfWeekFromDate:", v6);
    v8 = v7 == objc_msgSend((id)objc_opt_class(), "_weekdayForWeekdayCriteria:", self->_weekdayCriteria);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGTitleSpec;
  -[PGTitleSpec description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_format);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)format
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setArguments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)hasLineBreak
{
  return self->_hasLineBreak;
}

- (void)setHasLineBreak:(BOOL)a3
{
  self->_hasLineBreak = a3;
}

- (unint64_t)weekdayCriteria
{
  return self->_weekdayCriteria;
}

- (void)setWeekdayCriteria:(unint64_t)a3
{
  self->_weekdayCriteria = a3;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (PGTitleSpecDelegate)delegate
{
  return (PGTitleSpecDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)insertNonBreakableSpace
{
  return self->_insertNonBreakableSpace;
}

- (void)setInsertNonBreakableSpace:(BOOL)a3
{
  self->_insertNonBreakableSpace = a3;
}

- (BOOL)hasSpecArgumentHandlingLineBreakBehavior
{
  return self->_hasSpecArgumentHandlingLineBreakBehavior;
}

- (void)setHasSpecArgumentHandlingLineBreakBehavior:(BOOL)a3
{
  self->_hasSpecArgumentHandlingLineBreakBehavior = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

+ (id)specWithFormat:(id)a3 titleCategory:(int64_t)a4
{
  id v5;
  PGTitleSpec *v6;

  v5 = a3;
  v6 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", v5, a4);

  return v6;
}

+ (int64_t)_weekdayForWeekdayCriteria:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return -1;
  else
    return qword_1CA8EC9E8[a3 - 1];
}

@end
