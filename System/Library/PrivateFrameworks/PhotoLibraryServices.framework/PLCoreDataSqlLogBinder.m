@implementation PLCoreDataSqlLogBinder

- (PLCoreDataSqlLogBinder)init
{
  PLCoreDataSqlLogBinder *v2;
  NSMutableArray *v3;
  NSMutableArray *bindValues;
  uint64_t v5;
  NSRegularExpression *selectRegex;
  uint64_t v7;
  NSRegularExpression *bindRegex;
  PLCoreDataSqlLogBinder *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLCoreDataSqlLogBinder;
  v2 = -[PLCoreDataSqlLogBinder init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bindValues = v2->_bindValues;
    v2->_bindValues = v3;

    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("sql: (SELECT.*)$"), 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    selectRegex = v2->_selectRegex;
    v2->_selectRegex = (NSRegularExpression *)v5;

    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:details: SQLite |sql:)?bind\\[(\\d+)\\] = (\\([^\\)]+\\))?(.*)$"), 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    bindRegex = v2->_bindRegex;
    v2->_bindRegex = (NSRegularExpression *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)addLogLine:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSString *v9;
  NSString *selectString;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  -[NSRegularExpression firstMatchInString:options:range:](self->_selectRegex, "firstMatchInString:options:range:", v16, 0, 0, objc_msgSend(v16, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "rangeAtIndex:", 1);
    objc_msgSend(v16, "substringWithRange:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSString *)objc_msgSend(v8, "copy");
    selectString = self->_selectString;
    self->_selectString = v9;

LABEL_3:
    goto LABEL_4;
  }
  -[NSRegularExpression firstMatchInString:options:range:](self->_bindRegex, "firstMatchInString:options:range:", v16, 0, 0, objc_msgSend(v16, "length"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_5;
  v5 = v11;
  objc_msgSend(v11, "rangeAtIndex:", 3);
  if (v12)
  {
    v13 = objc_msgSend(v5, "rangeAtIndex:", 3);
    objc_msgSend(v16, "substringWithRange:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v8 = (void *)v15;
      -[NSMutableArray addObject:](self->_bindValues, "addObject:", v15);
      goto LABEL_3;
    }
  }
LABEL_4:

LABEL_5:
}

- (void)setSelectString:(id)a3 bindValueStrings:(id)a4
{
  id v6;
  NSString *v7;
  NSString *selectString;
  NSMutableArray *v9;
  NSMutableArray *bindValues;

  v6 = a4;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  selectString = self->_selectString;
  self->_selectString = v7;

  v9 = (NSMutableArray *)objc_msgSend(v6, "copy");
  bindValues = self->_bindValues;
  self->_bindValues = v9;

}

- (NSString)boundSql
{
  PLCoreDataSqlLogBinder *v2;
  void *v3;
  uint64_t v4;
  NSString *selectString;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;

  v2 = self;
  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  if (v2)
  {
    v4 = -[NSMutableArray count](v2->_bindValues, "count");
    selectString = v2->_selectString;
    if (v4)
    {
      -[NSString componentsSeparatedByString:](selectString, "componentsSeparatedByString:", CFSTR("?"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

      if (objc_msgSend(v7, "count") == v4 + 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != v4; ++i)
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v10);

          -[NSMutableArray objectAtIndexedSubscript:](v2->_bindValues, "objectAtIndexedSubscript:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v11);

        }
        objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendString:", v12);

        v2 = (PLCoreDataSqlLogBinder *)objc_msgSend(v8, "copy");
      }
      else
      {
        v14 = (__CFString *)v2->_selectString;
        if (!v14)
          v14 = &stru_1E36789C0;
        v2 = v14;
      }

    }
    else
    {
      v13 = &stru_1E36789C0;
      if (selectString)
        v13 = (__CFString *)v2->_selectString;
      v2 = v13;
    }
  }
  objc_autoreleasePoolPop(v3);
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bindRegex, 0);
  objc_storeStrong((id *)&self->_selectRegex, 0);
  objc_storeStrong((id *)&self->_bindValues, 0);
  objc_storeStrong((id *)&self->_selectString, 0);
}

+ (id)stringFromBindVariable:(id)a3 withTypePrefix:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  char v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  if (!objc_msgSend(v5, "hasObjectValue"))
  {
    v10 = objc_msgSend(v5, "int64");

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%qd"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("(int64)");
      if (v4)
        goto LABEL_18;
      goto LABEL_14;
    }
LABEL_8:
    v12 = &stru_1E36789C0;
    v11 = CFSTR("nil");
    if (v4)
      goto LABEL_18;
    goto LABEL_14;
  }
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_8;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x1E0CB3940];
  if ((isKindOfClass & 1) != 0)
  {
    v18 = objc_msgSend(v6, "length");
    v9 = CFSTR("<NSData len=%tu>");
LABEL_16:
    objc_msgSend(v8, "stringWithFormat:", v9, v18);
LABEL_17:
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v12 = &stru_1E36789C0;
    if (v4)
      goto LABEL_18;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v6);
    goto LABEL_17;
  }
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();
  v8 = (void *)MEMORY[0x1E0CB3940];
  if ((v13 & 1) == 0)
  {
    v18 = (uint64_t)v6;
    v9 = CFSTR("%@");
    goto LABEL_16;
  }
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%f"), v14);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v12 = CFSTR("(timestamp)");
  if (v4)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v12, v11);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_14:
  v15 = v11;
LABEL_19:
  v16 = v15;

  return v16;
}

+ (id)bindSelectString:(id)a3 bindValueStrings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PLCoreDataSqlLogBinder *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  v8 = objc_alloc_init(PLCoreDataSqlLogBinder);
  -[PLCoreDataSqlLogBinder setSelectString:bindValueStrings:](v8, "setSelectString:bindValueStrings:", v5, v6);
  -[PLCoreDataSqlLogBinder boundSql](v8, "boundSql");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v9;
}

@end
