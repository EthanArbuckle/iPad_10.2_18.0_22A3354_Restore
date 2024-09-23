@implementation STKUSSDFilter

+ (NSMutableDictionary)cachedExpressions
{
  if (cachedExpressions_onceToken != -1)
    dispatch_once(&cachedExpressions_onceToken, &__block_literal_global_3);
  return (NSMutableDictionary *)(id)cachedExpressions___cachedExpressions;
}

void __34__STKUSSDFilter_cachedExpressions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)cachedExpressions___cachedExpressions;
  cachedExpressions___cachedExpressions = (uint64_t)v0;

}

- (STKUSSDFilter)initWithAlwaysFilteredPatterns:(id)a3 sometimesFilteredPatterns:(id)a4
{
  id v6;
  id v7;
  STKUSSDFilter *v8;
  uint64_t v9;
  NSArray *alwaysFilteredPatterns;
  uint64_t v11;
  NSArray *sometimesFilteredPatterns;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STKUSSDFilter;
  v8 = -[STKUSSDFilter init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    alwaysFilteredPatterns = v8->_alwaysFilteredPatterns;
    v8->_alwaysFilteredPatterns = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    sometimesFilteredPatterns = v8->_sometimesFilteredPatterns;
    v8->_sometimesFilteredPatterns = (NSArray *)v11;

  }
  return v8;
}

- (BOOL)shouldFilterString:(id)a3 coalescable:(BOOL *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  double Current;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  BOOL v24;
  BOOL v25;
  void *v27;
  void *v28;
  float v29;
  float v30;
  float v31;
  BOOL v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
LABEL_23:
    v24 = 0;
    v25 = 1;
    if (!a4)
      goto LABEL_25;
LABEL_24:
    *a4 = v24;
    goto LABEL_25;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[STKUSSDFilter alwaysFilteredPatterns](self, "alwaysFilteredPatterns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (!v8)
    goto LABEL_10;
  v9 = v8;
  v10 = *(_QWORD *)v38;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v38 != v10)
        objc_enumerationMutation(v7);
      -[STKUSSDFilter _matchesInString:forPattern:](self, "_matchesInString:forPattern:", v6, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {

        goto LABEL_23;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v9)
      continue;
    break;
  }
LABEL_10:

  Current = CFAbsoluteTimeGetCurrent();
  -[STKUSSDFilter lastWarningTime](self, "lastWarningTime");
  v16 = Current - v15;
  v33 = 0u;
  v34 = 0u;
  if (v16 >= 0.0)
    v17 = v16;
  else
    v17 = -v16;
  v35 = 0uLL;
  v36 = 0uLL;
  -[STKUSSDFilter sometimesFilteredPatterns](self, "sometimesFilteredPatterns", (_QWORD)v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v34;
LABEL_15:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v20)
        objc_enumerationMutation(v18);
      -[STKUSSDFilter _matchesInString:forPattern:](self, "_matchesInString:forPattern:", v6, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v21));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
        break;

      if (v19 == ++v21)
      {
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v19)
          goto LABEL_15;
        goto LABEL_21;
      }
    }
    if (v17 < 300.0)
    {
LABEL_35:
      -[STKUSSDFilter setLastWarningTime:](self, "setLastWarningTime:", Current);
      v23 = 0;
      LODWORD(v19) = 1;
    }
    else
    {
      if (objc_msgSend(v22, "count") == 2)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v30 = v29;
        objc_msgSend(v28, "floatValue");
        v32 = v30 > 4.99 || v31 < 2.0;
        if (v32 || v31 < 5.01 && v17 > 180.0)
        {

          goto LABEL_35;
        }

      }
      LODWORD(v19) = 0;
      v23 = 1;
    }

    goto LABEL_39;
  }
LABEL_21:
  v23 = 0;
LABEL_39:

  v24 = (_DWORD)v19 != 0;
  v25 = v23 != 0;
  if (a4)
    goto LABEL_24;
LABEL_25:

  return v25;
}

- (void)reset
{
  id v2;

  -[STKUSSDFilter setLastWarningTime:](self, "setLastWarningTime:", 2.22507386e-308);
  objc_msgSend((id)objc_opt_class(), "cachedExpressions");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_matchesInString:(id)a3 forPattern:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "cachedExpressions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v23 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1798]), "initWithPattern:options:error:", v6, 0, &v23);
    v9 = v23;
    v10 = v9;
    if (!v8 || v9)
    {
      STKUSSDLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = v6;
        v26 = 2114;
        v27 = v10;
        _os_log_impl(&dword_216439000, v11, OS_LOG_TYPE_ERROR, "Invalid USSD filter regular expression pattern: /%{public}@/ %{public}@", buf, 0x16u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "cachedExpressions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, v6);

  }
  v13 = objc_msgSend(v5, "length");
  objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "numberOfRanges");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "range") && v13 == v17 && v15 >= 2)
  {
    for (i = 1; i != v15; ++i)
    {
      v19 = objc_msgSend(v14, "rangeAtIndex:", i);
      objc_msgSend(v5, "substringWithRange:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v21);

    }
  }

  return v16;
}

- (NSArray)alwaysFilteredPatterns
{
  return self->_alwaysFilteredPatterns;
}

- (NSArray)sometimesFilteredPatterns
{
  return self->_sometimesFilteredPatterns;
}

- (double)lastWarningTime
{
  return self->_lastWarningTime;
}

- (void)setLastWarningTime:(double)a3
{
  self->_lastWarningTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sometimesFilteredPatterns, 0);
  objc_storeStrong((id *)&self->_alwaysFilteredPatterns, 0);
}

@end
