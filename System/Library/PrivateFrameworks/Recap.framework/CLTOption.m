@implementation CLTOption

- (CLTOption)init
{
  CLTOption *v2;
  uint64_t v3;
  NSArray *shorthands;
  uint64_t v5;
  NSArray *longforms;
  uint64_t v7;
  NSMutableArray *consumedArguments;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLTOption;
  v2 = -[CLTOption init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    shorthands = v2->_shorthands;
    v2->_shorthands = (NSArray *)v3;

    v5 = objc_opt_new();
    longforms = v2->_longforms;
    v2->_longforms = (NSArray *)v5;

    v7 = objc_opt_new();
    consumedArguments = v2->_consumedArguments;
    v2->_consumedArguments = (NSMutableArray *)v7;

  }
  return v2;
}

- (void)addShorthand:(id)a3
{
  -[NSArray addObject:](self->_shorthands, "addObject:", a3);
}

- (void)addLongform:(id)a3
{
  -[NSArray addObject:](self->_longforms, "addObject:", a3);
}

- (NSString)lefthandHelp
{
  NSString *lefthandHelp;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  NSString *argumentHelp;
  void *v25;
  NSString *v26;
  NSString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  lefthandHelp = self->_lefthandHelp;
  if (!lefthandHelp)
  {
    v4 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[CLTOption shorthands](self, "shorthands");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(CFSTR("-"), "stringByAppendingString:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[CLTOption maxAllowedOccurencies](self, "maxAllowedOccurencies") >= 2)
          {
            objc_msgSend(&stru_1E4FC2788, "stringByPaddingToLength:withString:startingAtIndex:", -[CLTOption maxAllowedOccurencies](self, "maxAllowedOccurencies") - 1, v10, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("[%@]"), v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v13;
          }
          objc_msgSend(v4, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v7);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[CLTOption longforms](self, "longforms");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          v20 = CFSTR("--");
          if (!objc_msgSend(v4, "count"))
          {
            objc_msgSend(CFSTR("    "), "stringByAppendingString:", CFSTR("--"));
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v21);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = self->_lefthandHelp;
    self->_lefthandHelp = v22;

    if (-[NSString length](self->_argumentHelp, "length"))
    {
      argumentHelp = self->_argumentHelp;
      v37[0] = self->_lefthandHelp;
      v37[1] = argumentHelp;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR(" "));
      v26 = (NSString *)objc_claimAutoreleasedReturnValue();
      v27 = self->_lefthandHelp;
      self->_lefthandHelp = v26;

    }
    lefthandHelp = self->_lefthandHelp;
  }
  return lefthandHelp;
}

- (BOOL)consumeArgument:(id)a3
{
  id v4;
  int v5;
  void *v6;
  unint64_t v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  v5 = -[CLTOption maxConsumedArguments](self, "maxConsumedArguments");
  -[CLTOption consumedArguments](self, "consumedArguments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = 0;
  if (v4 && v7 < v5)
  {
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("-"))
      && (!self->_allowsNegativeNumbersAsArguments
       || (unint64_t)objc_msgSend(v4, "length") < 2
       || objc_msgSend(v4, "characterAtIndex:", 1) < 0x30
       || objc_msgSend(v4, "characterAtIndex:", 1) > 0x39))
    {
      v8 = 0;
    }
    else
    {
      -[CLTOption consumedArguments](self, "consumedArguments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

      v8 = 1;
    }
  }

  return v8;
}

- (NSArray)consumedOrDefaultArguments
{
  NSArray *v3;

  if (-[NSMutableArray count](self->_consumedArguments, "count"))
    v3 = (NSArray *)-[NSMutableArray copy](self->_consumedArguments, "copy");
  else
    v3 = self->_defaultArguments;
  return v3;
}

- (NSNumber)numberValue
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[NSMutableArray count](self->_consumedArguments, "count");
  v4 = 88;
  if (v3 == 1)
    v4 = 80;
  objc_msgSend(*(id *)((char *)&self->super.isa + v4), "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)numberValue_formatter;
    if (!numberValue_formatter)
    {
      v7 = objc_opt_new();
      v8 = (void *)numberValue_formatter;
      numberValue_formatter = v7;

      objc_msgSend((id)numberValue_formatter, "setNumberStyle:", 1);
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)numberValue_formatter, "setLocale:", v9);

      v6 = (void *)numberValue_formatter;
    }
    objc_msgSend(v6, "numberFromString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (NSNumber *)v10;
}

- (NSArray)shorthands
{
  return self->_shorthands;
}

- (NSArray)longforms
{
  return self->_longforms;
}

- (id)triggerAction
{
  return self->_triggerAction;
}

- (void)setTriggerAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)righthandHelp
{
  return self->_righthandHelp;
}

- (void)setRighthandHelp:(id)a3
{
  objc_storeStrong((id *)&self->_righthandHelp, a3);
}

- (NSString)argumentHelp
{
  return self->_argumentHelp;
}

- (void)setArgumentHelp:(id)a3
{
  objc_storeStrong((id *)&self->_argumentHelp, a3);
}

- (int)occurencies
{
  return self->_occurencies;
}

- (void)setOccurencies:(int)a3
{
  self->_occurencies = a3;
}

- (int)maxAllowedOccurencies
{
  return self->_maxAllowedOccurencies;
}

- (void)setMaxAllowedOccurencies:(int)a3
{
  self->_maxAllowedOccurencies = a3;
}

- (int)minConsumedArguments
{
  return self->_minConsumedArguments;
}

- (void)setMinConsumedArguments:(int)a3
{
  self->_minConsumedArguments = a3;
}

- (int)maxConsumedArguments
{
  return self->_maxConsumedArguments;
}

- (void)setMaxConsumedArguments:(int)a3
{
  self->_maxConsumedArguments = a3;
}

- (BOOL)allowsNegativeNumbersAsArguments
{
  return self->_allowsNegativeNumbersAsArguments;
}

- (void)setAllowsNegativeNumbersAsArguments:(BOOL)a3
{
  self->_allowsNegativeNumbersAsArguments = a3;
}

- (NSMutableArray)consumedArguments
{
  return self->_consumedArguments;
}

- (void)setConsumedArguments:(id)a3
{
  objc_storeStrong((id *)&self->_consumedArguments, a3);
}

- (NSArray)defaultArguments
{
  return self->_defaultArguments;
}

- (void)setDefaultArguments:(id)a3
{
  objc_storeStrong((id *)&self->_defaultArguments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultArguments, 0);
  objc_storeStrong((id *)&self->_consumedArguments, 0);
  objc_storeStrong((id *)&self->_argumentHelp, 0);
  objc_storeStrong((id *)&self->_righthandHelp, 0);
  objc_storeStrong(&self->_triggerAction, 0);
  objc_storeStrong((id *)&self->_lefthandHelp, 0);
  objc_storeStrong((id *)&self->_longforms, 0);
  objc_storeStrong((id *)&self->_shorthands, 0);
}

@end
