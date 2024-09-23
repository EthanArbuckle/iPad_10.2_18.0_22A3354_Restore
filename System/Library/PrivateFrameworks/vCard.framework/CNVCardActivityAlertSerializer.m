@implementation CNVCardActivityAlertSerializer

+ (id)serializeDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    v12 = *MEMORY[0x1E0D13848];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v14, (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 16))(v12, v14) & 1) == 0
          && ((*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v15) & 1) == 0)
        {
          if (objc_msgSend(v5, "length"))
            objc_msgSend(v5, "appendString:", CFSTR(","));
          objc_msgSend(a1, "serializeString:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v16);

          objc_msgSend(v5, "appendString:", CFSTR("="));
          objc_msgSend(a1, "serializeString:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v17);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v5;
}

+ (id)serializeString:(id)a3
{
  id v3;
  __objc2_class *v4;
  id v5;
  void *v6;

  v3 = a3;
  if (+[CNVCardActivityAlertQuotingSerializationStrategy strategyWouldAlterString:](CNVCardActivityAlertQuotingSerializationStrategy, "strategyWouldAlterString:", v3))
  {
    v4 = CNVCardActivityAlertQuotingSerializationStrategy;
  }
  else
  {
    if (!+[CNVCardActivityAlertEscapingSerializationStrategy strategyWouldAlterString:](CNVCardActivityAlertEscapingSerializationStrategy, "strategyWouldAlterString:", v3))
    {
      v5 = v3;
      goto LABEL_7;
    }
    v4 = CNVCardActivityAlertEscapingSerializationStrategy;
  }
  -[__objc2_class serializeString:](v4, "serializeString:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = v5;

  return v6;
}

@end
