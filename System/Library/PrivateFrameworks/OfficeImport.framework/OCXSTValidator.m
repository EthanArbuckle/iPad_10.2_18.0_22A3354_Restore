@implementation OCXSTValidator

+ (id)validateIntegerValue:(int64_t)a3 minValue:(int64_t)a4 maxValue:(int64_t)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3 < a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (TSUDefaultCat_init_token == -1)
      return v10;
    v12 = &__block_literal_global_68;
    goto LABEL_11;
  }
  if (a3 > a5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (TSUDefaultCat_init_token == -1)
      return v10;
    v12 = &__block_literal_global_2;
LABEL_11:
    dispatch_once(&TSUDefaultCat_init_token, v12);
    return v10;
  }
  v10 = (void *)v8;
  return v10;
}

void __57__OCXSTValidator_validateIntegerValue_minValue_maxValue___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __57__OCXSTValidator_validateIntegerValue_minValue_maxValue___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

+ (BOOL)isValidValue:(id)a3 simpleType:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;

  v6 = a3;
  objc_msgSend(a1, "validator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend(v7, "simpleTypeMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TSUDynamicCast(v8, (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_opt_class();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v13, (uint64_t)v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_class();
    objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v16, (uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    if (v15 && v18)
    {
      v20 = objc_msgSend(v15, "compare:", v6);
      v21 = objc_msgSend(v18, "compare:", v6);
      v19 = (unint64_t)(v20 + 1) < 2 && v21 < 2;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)validator
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!+[OCXSTValidator validator]::validator)
  {
    v3 = objc_opt_new();
    v4 = (void *)+[OCXSTValidator validator]::validator;
    +[OCXSTValidator validator]::validator = v3;

  }
  objc_sync_exit(v2);

  return (id)+[OCXSTValidator validator]::validator;
}

+ (id)simpleType:(unint64_t)a3 integerValue:(int64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "simpleTypeMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v9, (uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_opt_class();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v14, (uint64_t)v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_opt_class();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v17, (uint64_t)v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && v19)
      {
        objc_msgSend(a1, "validateIntegerValue:minValue:maxValue:", a4, objc_msgSend(v16, "integerValue"), objc_msgSend(v19, "integerValue"));
        v20 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v20;
      }

    }
  }

  return v7;
}

+ (id)simpleType:(unint64_t)a3 stringValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "simpleTypeMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    TSUDynamicCast(v9, (uint64_t)v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_16;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v14);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "caseInsensitiveCompare:", v6, (_QWORD)v23))
          {
            v20 = v14;
            goto LABEL_18;
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (objc_msgSend(v14, "count"))
    {
      v18 = objc_opt_class();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      TSUDynamicCast(v18, (uint64_t)v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (TSUDefaultCat_init_token != -1)
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_6_4);
      }
      else
      {
LABEL_18:
        v21 = v7;
      }

    }
    else
    {
LABEL_16:
      v21 = v7;
    }

  }
  else
  {
    v21 = v7;
  }

  return v21;
}

void __41__OCXSTValidator_simpleType_stringValue___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simpleTypeMap, 0);
}

- (OCXSTValidator)init
{
  OCXSTValidator *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *simpleTypeMap;
  objc_super v7;
  _QWORD v8[11];
  _QWORD v9[12];

  v9[11] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)OCXSTValidator;
  v2 = -[OCXSTValidator init](&v7, sel_init);
  if (v2)
  {
    v8[0] = &unk_24F46A6D8;
    v8[1] = &unk_24F46A720;
    v9[0] = &unk_24F46A1E0;
    v9[1] = &unk_24F46A1F8;
    v8[2] = &unk_24F46A750;
    v8[3] = &unk_24F46A780;
    v9[2] = &unk_24F46A210;
    v9[3] = &unk_24F46A228;
    v8[4] = &unk_24F46A7C8;
    v8[5] = &unk_24F46A810;
    v9[4] = &unk_24F46A240;
    v9[5] = &unk_24F46A258;
    v8[6] = &unk_24F46A858;
    v8[7] = &unk_24F46A888;
    v9[6] = &unk_24F46A270;
    v9[7] = &unk_24F46A288;
    v8[8] = &unk_24F46A8B8;
    v8[9] = &unk_24F46A8E8;
    v9[8] = &unk_24F46A2A0;
    v9[9] = &unk_24F46A2B8;
    v8[10] = &unk_24F46A918;
    v9[10] = &unk_24F46A2D0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_new();
    simpleTypeMap = v2->_simpleTypeMap;
    v2->_simpleTypeMap = (NSMutableDictionary *)v4;

    -[NSMutableDictionary addEntriesFromDictionary:](v2->_simpleTypeMap, "addEntriesFromDictionary:", v3);
  }
  return v2;
}

- (id)simpleTypeMap
{
  return self->_simpleTypeMap;
}

@end
