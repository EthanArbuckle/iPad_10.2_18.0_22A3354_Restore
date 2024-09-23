@implementation POXSTimeDefinition

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
  if (valueFromString__onceToken != -1)
    dispatch_once(&valueFromString__onceToken, &__block_literal_global_0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)valueFromString__timeFormatters;
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
          objc_msgSend(v11, "components:fromDate:", 3178720, v10);
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

void __38__POXSTimeDefinition_valueFromString___block_invoke()
{
  id v0;
  void *v1;

  v0 = +[POXSDateFormatterFactory newTimeFormatters](POXSDateFormatterFactory, "newTimeFormatters");
  v1 = (void *)valueFromString__timeFormatters;
  valueFromString__timeFormatters = (uint64_t)v0;

}

- (id)stringFromValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF38]), "initWithName:", CFSTR("UTC"));
  if (objc_msgSend(v4, "isEqualToTimeZone:", v5))
  {
    v6 = 2;
LABEL_6:
    v7 = +[POXSDateFormatterFactory newTimeFormatterWithTimeZoneStyle:](POXSDateFormatterFactory, "newTimeFormatterWithTimeZoneStyle:", v6);
    goto LABEL_7;
  }
  if (!v4)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v7 = +[POXSDateFormatterFactory newTimeFormatterWithTimeZoneStyle:](POXSDateFormatterFactory, "newTimeFormatterWithTimeZoneStyle:", 1);
  objc_msgSend(v7, "setTimeZone:", v4);
LABEL_7:
  objc_msgSend(v7, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateFromComponents:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
