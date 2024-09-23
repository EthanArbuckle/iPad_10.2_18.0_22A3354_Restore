@implementation POXSDateDefinition

- (id)valueFromString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (valueFromString__onceToken_0 != -1)
    dispatch_once(&valueFromString__onceToken_0, &__block_literal_global_2);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)valueFromString__dateFormatters;
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "dateFromString:", v3, (_QWORD)v13);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          objc_msgSend(v8, "calendar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "components:fromDate:", 3178750, v10);
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

void __38__POXSDateDefinition_valueFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = +[POXSDateFormatterFactory newDateFormatters](POXSDateFormatterFactory, "newDateFormatters");
  v1 = (void *)valueFromString__dateFormatters;
  valueFromString__dateFormatters = (uint64_t)v0;

}

- (id)stringFromValue:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = stringFromValue__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&stringFromValue__onceToken, &__block_literal_global_1);
  objc_msgSend((id)stringFromValue__dateFormatter, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)stringFromValue__dateFormatter, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __38__POXSDateDefinition_stringFromValue___block_invoke()
{
  id v0;
  void *v1;

  v0 = +[POXSDateFormatterFactory newDateFormatter](POXSDateFormatterFactory, "newDateFormatter");
  v1 = (void *)stringFromValue__dateFormatter;
  stringFromValue__dateFormatter = (uint64_t)v0;

}

@end
