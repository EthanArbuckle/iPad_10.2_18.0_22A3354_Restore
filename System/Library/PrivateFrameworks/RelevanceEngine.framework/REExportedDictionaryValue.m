@implementation REExportedDictionaryValue

- (REExportedDictionaryValue)initWithDictionary:(id)a3
{
  id v5;
  REExportedDictionaryValue *v6;
  REExportedDictionaryValue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedDictionaryValue;
  v6 = -[REExportedDictionaryValue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (id)dictionaryValue
{
  return self->_dictionary;
}

- (unint64_t)propertyCount
{
  return -[NSDictionary count](self->_dictionary, "count");
}

- (unint64_t)type
{
  return 1;
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, void *))a3;
  if (v4)
  {
    -[NSDictionary allKeys](self->_dictionary, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke_2;
    v19[3] = &unk_24CF8BF30;
    v20 = &__block_literal_global_72;
    objc_msgSend(v6, "sortUsingComparator:", v19);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v12, (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke((uint64_t)v13, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v14, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v9);
    }

  }
}

id __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(v2, "description");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

uint64_t __55__REExportedDictionaryValue_enumerateValuesUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a3;
  v6(v5, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "compare:", v9);
  return v10;
}

- (id)exportedValueForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
