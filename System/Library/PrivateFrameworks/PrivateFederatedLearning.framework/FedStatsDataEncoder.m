@implementation FedStatsDataEncoder

- (FedStatsDataEncoder)initWithDataTypes:(id)a3 combinationTypes:(id)a4
{
  id v7;
  id v8;
  FedStatsDataEncoder *v9;
  FedStatsDataEncoder *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *typeConfiguration;
  FedStatsDataEncoder *v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)FedStatsDataEncoder;
  v9 = -[FedStatsDataEncoder init](&v43, sel_init);
  v10 = v9;
  if (v9)
  {
    v32 = v9;
    objc_storeStrong((id *)&v9->_dataTypes, a3);
    objc_msgSend(v8, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDBCEF0];
    v33 = v7;
    objc_msgSend(v7, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v12;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v19);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v8, "objectForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "typesInCombination");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v36;
            do
            {
              v26 = 0;
              do
              {
                if (*(_QWORD *)v36 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(v15, "removeObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26++));
              }
              while (v24 != v26);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            }
            while (v24);
          }

          objc_msgSend(v15, "removeObject:", v20);
          ++v19;
        }
        while (v19 != v17);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v17);
    }

    objc_msgSend(v15, "allObjects");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "arrayByAddingObjectsFromArray:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v10 = v32;
    typeConfiguration = v32->_typeConfiguration;
    v32->_typeConfiguration = (NSArray *)v29;

    v7 = v33;
  }

  return v10;
}

uint64_t __58__FedStatsDataEncoder_initWithDataTypes_combinationTypes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)createWithDataTypeContent:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v57;
  void *v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    if (a4)
    {
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 100, CFSTR("Missing data type content"));
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = 0;
    }
    goto LABEL_42;
  }
  v47 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v43 = v7;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (!v9)
    goto LABEL_16;
  v10 = v9;
  v11 = *(_QWORD *)v54;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v54 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
      objc_msgSend(v8, "objectForKey:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("dataType"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v32 = v47;
        if (!v47)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing data type specifier key \"%@\"), CFSTR("dataType"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 100;
        goto LABEL_35;
      }
      v16 = +[FedStatsDataTypeFactory dataTypeFromString:](FedStatsDataTypeFactory, "dataTypeFromString:", v15);
      if (v16 != 99)
      {
        if (v16 != -1)
        {
          +[FedStatsDataTypeFactory createFedStatsDataType:dataTypeParams:possibleError:](FedStatsDataTypeFactory, "createFedStatsDataType:dataTypeParams:possibleError:", v15, v14, v47);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(v48, "setValue:forKey:", v17, v13);

            goto LABEL_14;
          }
          if (v47)
          {
            v39 = objc_msgSend(*v47, "code");
            v40 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*v47, "localizedDescription");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringWithFormat:", CFSTR("Could not create data type \"%@\": %@"), v13, v33);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v39, v41);
            *v47 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_38;
          }
LABEL_39:
          v31 = 0;
LABEL_40:
          v7 = v43;
          v30 = v48;
          goto LABEL_41;
        }
        v32 = v47;
        if (!v47)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not supported"), v15);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 101;
LABEL_35:
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v34, v33);
        *v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_38:
        v7 = v43;
        v30 = v48;

        v31 = 0;
        goto LABEL_41;
      }
      objc_msgSend(v44, "addObject:", v13);
LABEL_14:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v10)
      continue;
    break;
  }
LABEL_16:

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v14 = v44;
  v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v19)
  {
    v20 = v19;
    v45 = *(_QWORD *)v50;
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v50 != v45)
          objc_enumerationMutation(v14);
        v22 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        v23 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v8, "objectForKey:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "dictionaryWithDictionary:", v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[FedStatsCombinationType kAvailableTypes](FedStatsCombinationType, "kAvailableTypes");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v25;
        v58 = v48;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addEntriesFromDictionary:", v26);

        +[FedStatsCombinationType createFromDict:possibleError:](FedStatsCombinationType, "createFromDict:possibleError:", v15, v47);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          if (v47)
          {
            v35 = objc_msgSend(*v47, "code");
            v36 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*v47, "localizedDescription");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringWithFormat:", CFSTR("Could not create data type \"%@\": %@"), v22, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v35, v38);
            *v47 = (id)objc_claimAutoreleasedReturnValue();

          }
          v31 = 0;
          v8 = v46;
          goto LABEL_40;
        }
        v28 = (void *)v27;
        objc_msgSend(v46, "setValue:forKey:", v27, v22);
        objc_msgSend(v48, "setValue:forKey:", v28, v22);

      }
      v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      if (v20)
        continue;
      break;
    }
  }

  v29 = objc_alloc((Class)a1);
  v30 = v48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v48);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v46;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v46);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithDataTypes:combinationTypes:", v14, v15);
  v7 = v43;
LABEL_41:

LABEL_42:
  return v31;
}

- (id)encodeToIndex:(id)a3 withType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  id *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[FedStatsDataEncoder dataTypes](self, "dataTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not valid"), v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v26);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v25 = 0;
      goto LABEL_24;
    }
    if (objc_msgSend(v11, "dataType") == 99)
    {
      v30 = a5;
      v29 = v11;
      objc_msgSend(v29, "typesInCombination");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setValue:forKey:", v20, v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v16);
      }

      v21 = (void *)objc_msgSend(v13, "copy");
      v32 = 0;
      v22 = v29;
      objc_msgSend(v29, "encodeToIndex:possibleError:", v21, &v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v32;

      a5 = v30;
    }
    else
    {
      objc_msgSend(v8, "objectForKey:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v11, "encodeToIndex:possibleError:", v22, &v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v31;
    }

    if (v23)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v11, "classCount"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsDataEncoderDimensionalResult resultWithIndex:dimensionality:](FedStatsDataEncoderDimensionalResult, "resultWithIndex:dimensionality:", v23, v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!a5)
      {
        v25 = 0;
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot encode data to \"%@\"), v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v24, v27);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  if (a5)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_25:

  return v25;
}

- (id)encodeToBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[FedStatsDataEncoder dataTypes](self, "dataTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend(v11, "dataType") == 99)
      {
        v27 = a5;
        v26 = v11;
        objc_msgSend(v26, "typesInCombination");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v29 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v8, "objectForKey:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setValue:forKey:", v20, v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v16);
        }

        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "encodeToOneHotVector:possibleError:", v21, v27);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v8, "objectForKey:", v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "encodeToOneHotVector:possibleError:", v24, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not valid"), v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v23);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v22 = 0;
    }

  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v22 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)decodeFromBitVector:(id)a3 withType:(id)a4 possibleError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[FedStatsDataEncoder dataTypes](self, "dataTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "decodeFromOneHotVector:possibleError:", v8, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The data type \"%@\" is not valid"), v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v13);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v12 = 0;
    }

  }
  else if (a5)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)encodeToBitVector:(id)a3 possibleError:(id *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  if (v31)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[FedStatsDataEncoder dataTypes](self, "dataTypes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v9 += objc_msgSend(v14, "classCount");

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v8);

      if (v9 > 0x186A0)
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Resulting dimensionality %lu is larger than max dimensionality %lu"), v9, 100000);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v15);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v33;
      while (2)
      {
        v23 = 0;
        v24 = v21;
        do
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v18);
          v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v23);
          -[FedStatsDataEncoder encodeToBitVector:withType:possibleError:](self, "encodeToBitVector:withType:possibleError:", v31, v25, a4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            if (a4)
            {
              v26 = objc_msgSend(*a4, "code");
              v27 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(*a4, "localizedDescription");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "stringWithFormat:", CFSTR("Error encoding \"%@\" type: %@"), v25, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v26, v29);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v16 = 0;
            goto LABEL_29;
          }
          objc_msgSend(v17, "appendData:", v21);
          ++v23;
          v24 = v21;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v20)
          continue;
        break;
      }

    }
    v16 = v17;
LABEL_29:

  }
  else
  {
    if (!a4)
    {
LABEL_14:
      v16 = 0;
      goto LABEL_30;
    }
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("Provided data is empty"));
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_30:

  return v16;
}

- (id)encodeToIndex:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 != 1)
  {
    if (a4)
    {
      v23 = CFSTR("This API is only available for single type in encoding schema");
      v24 = 900;
LABEL_19:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v24, v23);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
LABEL_23:
    v20 = 0;
    goto LABEL_27;
  }
  if (!v6)
  {
    if (a4)
    {
      v23 = CFSTR("Provided data is empty");
      v24 = 401;
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  v31 = a4;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[FedStatsDataEncoder dataTypes](self, "dataTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[FedStatsDataEncoder dataTypes](self, "dataTypes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "dataType") == 99)
        {

        }
        else
        {
          objc_msgSend(v6, "objectForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            if (v31)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Provided data does not contain a value for \"%@\"), v14);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 200, v25);
              *v31 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_23;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  -[FedStatsDataEncoder encodeToIndex:withType:error:](self, "encodeToIndex:withType:error:", v6, v19, &v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v32;

  if (v20)
  {
    v22 = v20;
  }
  else if (v31)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Cannot encode data to \"%@\"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v21, v29);
    *v31 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_27:

  return v20;
}

- (id)decodeFromBitVector:(id)a3 possibleError:(id *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v6 = (void *)MEMORY[0x24BDBCED8];
  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[FedStatsDataEncoder typeConfiguration](self, "typeConfiguration");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v25)
  {
    v8 = 0;
    v24 = *(_QWORD *)v29;
LABEL_3:
    v9 = 0;
    while (1)
    {
      v10 = a4;
      if (*(_QWORD *)v29 != v24)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v9);
      -[FedStatsDataEncoder dataTypes](self, "dataTypes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "classCount");
      objc_msgSend(v26, "subdataWithRange:", v8, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      -[FedStatsDataEncoder decodeFromBitVector:withType:possibleError:](self, "decodeFromBitVector:withType:possibleError:", v15, v11, &v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v27;
      if (v16)
        break;
      if (!v10)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The decoder for \"%@\" failed"), v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = v10;
      +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 500, v17, v18);
      *v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
      if (!v16)
      {

        v20 = 0;
        v19 = v23;
        goto LABEL_19;
      }
      if (v25 == ++v9)
      {
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v25)
          goto LABEL_3;
        goto LABEL_17;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v23, "addEntriesFromDictionary:", v16);
    else
      objc_msgSend(v23, "setValue:forKey:", v16, v11);
    v8 += v14;
LABEL_13:
    a4 = v10;
    goto LABEL_14;
  }
LABEL_17:

  v19 = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v20;
}

+ (id)encodeDataArray:(id)a3 dataTypeContent:(id)a4 resultType:(unint64_t *)a5 errorOut:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint8_t v42;
  _BYTE v43[15];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54;
  _BYTE v55[3];
  uint64_t v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (!v10)
  {
    if (a6)
    {
      v26 = CFSTR("encodeDataArray missing data type content");
LABEL_22:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 400, v26);
      v15 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
LABEL_23:
    v15 = 0;
    goto LABEL_44;
  }
  if (!v9)
  {
    if (a6)
    {
      v26 = CFSTR("encodeDataArray missing data array");
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  v53 = 0;
  +[FedStatsDataEncoder createWithDataTypeContent:possibleError:](FedStatsDataEncoder, "createWithDataTypeContent:possibleError:", v10, &v53);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v53;
  v13 = v12;
  if (v11)
  {
    v38 = v12;
    v39 = v10;
    v40 = v9;
    +[FedStatsDataSampler pickSamplesFrom:length:](FedStatsDataSampler, "pickSamplesFrom:length:", v9, 20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "typeConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    v37 = v14;
    if (v17 < 2)
    {
      *a5 = 1;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v27 = v14;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v45 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            if (v32)
            {
              v41 = 0;
              objc_msgSend(v11, "encodeToIndex:error:", v32, &v41);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = v41;
              if (v33)
              {
                objc_msgSend(v15, "addObject:", v33);
              }
              else
              {
                +[FedStatsLog logger](FedStatsLog, "logger");
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                  +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:].cold.3(&v54, v34, &v56, v35);

              }
            }
            else
            {
              +[FedStatsLog logger](FedStatsLog, "logger");
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:].cold.2(&v42, v43, v34);
            }

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
        }
        while (v29);
      }
    }
    else
    {
      *a5 = 2;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v18 = v14;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v50;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v50 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
            v48 = 0;
            objc_msgSend(v11, "encodeToBitVector:possibleError:", v23, &v48);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
            {
              objc_msgSend(v15, "addObject:", v24);
            }
            else
            {
              +[FedStatsLog logger](FedStatsLog, "logger");
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:].cold.1(&v54, v55, v25);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        }
        while (v20);
      }
    }

    v10 = v39;
    v9 = v40;
    v13 = v38;
  }
  else if (a6)
  {
    +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 302, v12, CFSTR("encodeDataArray encoder construction failed"));
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

LABEL_44:
  return v15;
}

+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  BOOL v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint8_t buf[4];
  void *v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;
  _QWORD v94[4];

  v94[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v14)
  {
    v16 = objc_msgSend(v14, "length");
    if (v16 >= objc_msgSend(CFSTR("fedstats:"), "length")
      && (objc_msgSend(v15, "substringToIndex:", objc_msgSend(CFSTR("fedstats:"), "length")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("fedstats:")),
          v17,
          (v18 & 1) != 0))
    {
      v19 = v15;
    }
    else
    {
      objc_msgSend(CFSTR("fedstats:"), "stringByAppendingString:", v15);
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;
    +[FedStatsLog logger](FedStatsLog, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.3((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

    v85 = 0;
    v86 = 0;
    +[FedStatsDataEncoder encodeDataArray:dataTypeContent:resultType:errorOut:](FedStatsDataEncoder, "encodeDataArray:dataTypeContent:resultType:errorOut:", v11, v12, &v86, &v85);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v85;
    if (!v28)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", 401, v29, CFSTR("encodeDataArrayAndRecord failed at encoding"));
        v34 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = 0;
      }
      goto LABEL_61;
    }
    +[FedStatsLog logger](FedStatsLog, "logger");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.2(v30, v31, v32);

    v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2CBA0]), "initWithKey:", v20);
    if (!v76)
    {
      if (a7)
      {
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 600, CFSTR("encodeDataArrayAndRecord failed at recorder allocation"));
        v34 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = 0;
      }
      goto LABEL_60;
    }
    if (objc_msgSend(v13, "count"))
    {
      v33 = v13;
    }
    else
    {
      v93 = *MEMORY[0x24BE2CBF0];
      v94[0] = &stru_24D0DB420;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1);
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v75 = v33;
    if (!objc_msgSend(v28, "count"))
      goto LABEL_26;
    if (v86 == 1)
    {
      v69 = v29;
      v73 = v11;
      v74 = v20;
      v70 = v15;
      v71 = v13;
      v72 = v12;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v36 = v28;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v82;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v82 != v39)
              objc_enumerationMutation(v36);
            v41 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            objc_msgSend(v41, "dimensionality");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKey:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            if (v43)
            {
              objc_msgSend(v41, "index");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "arrayByAddingObject:", v44);
            }
            else
            {
              v45 = (void *)MEMORY[0x24BDBCE30];
              objc_msgSend(v41, "index");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "arrayWithObject:", v44);
            }
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "dimensionality");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKey:", v46, v47);

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
        }
        while (v38);
      }

      v79 = 0u;
      v80 = 0u;
      v77 = 0u;
      v78 = 0u;
      v48 = v35;
      v49 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v78;
        v52 = *MEMORY[0x24BE2CBC8];
        v53 = *MEMORY[0x24BE2CBD0];
        do
        {
          for (j = 0; j != v50; ++j)
          {
            if (*(_QWORD *)v78 != v51)
              objc_enumerationMutation(v48);
            v55 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
            +[FedStatsLog logger](FedStatsLog, "logger");
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v55;
              _os_log_debug_impl(&dword_213C25000, v56, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord recording with dimension = \"%@\", buf, 0xCu);
            }

            v57 = (void *)objc_msgSend(v75, "mutableCopy");
            v87 = v52;
            v88 = v55;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setObject:forKey:", v58, v53);

            -[NSObject objectForKey:](v48, "objectForKey:", v55);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v76, "record:metadata:", v59, v57);

            if ((v60 & 1) == 0)
            {
              +[FedStatsLog logger](FedStatsLog, "logger");
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v90 = v74;
                _os_log_debug_impl(&dword_213C25000, v61, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord failed to record numbers for key '%@'", buf, 0xCu);
              }

            }
          }
          v50 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
        }
        while (v50);
      }

      v34 = 1;
      v12 = v72;
      v11 = v73;
      v15 = v70;
      v13 = v71;
      v20 = v74;
      v29 = v69;
    }
    else if (v86 == 2)
    {
      if ((objc_msgSend(v76, "recordBitVectors:metadata:", v28, v75) & 1) != 0)
      {
LABEL_26:
        v34 = 1;
LABEL_59:

LABEL_60:
LABEL_61:

        goto LABEL_62;
      }
      +[FedStatsLog logger](FedStatsLog, "logger");
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:].cold.1((uint64_t)v20, v48, v62, v63, v64, v65, v66, v67);
      v34 = 1;
    }
    else
    {
      if (!a7)
      {
        v34 = 0;
        goto LABEL_59;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported result type \"%lu\" in data encoder"), v86);
      v48 = objc_claimAutoreleasedReturnValue();
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v48);
      v34 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_59;
  }
  if (a7)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 400, CFSTR("encodeDataArrayAndRecord missing collection ID key"));
    v34 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
LABEL_62:

  return v34;
}

+ (BOOL)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 metadata:(id)a5 baseKey:(id)a6 errorOut:(id *)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v11 = (void *)MEMORY[0x24BDBCE30];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", v16, v14, v13, v12, a7, v18, v19);

  return (char)a7;
}

+ (BOOL)encodeDataArrayAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  return +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:metadata:baseKey:errorOut:", a3, a4, MEMORY[0x24BDBD1B8], a5, a6);
}

+ (BOOL)encodeDataAndRecord:(id)a3 dataTypeContent:(id)a4 baseKey:(id)a5 errorOut:(id *)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v9 = (void *)MEMORY[0x24BDBCE30];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = +[FedStatsDataEncoder encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:](FedStatsDataEncoder, "encodeDataArrayAndRecord:dataTypeContent:baseKey:errorOut:", v13, v11, v10, a6, v15, v16);

  return (char)a6;
}

+ (BOOL)record:(id)a3 metadata:(id)a4 baseKey:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x24BE2CBA0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithKey:", v8);

  LOBYTE(v8) = objc_msgSend(v11, "record:metadata:", v10, v9);
  return (char)v8;
}

- (NSDictionary)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(id)a3
{
  objc_storeStrong((id *)&self->_dataTypes, a3);
}

- (NSArray)typeConfiguration
{
  return self->_typeConfiguration;
}

- (void)setTypeConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_typeConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeConfiguration, 0);
  objc_storeStrong((id *)&self->_dataTypes, 0);
}

+ (void)encodeDataArray:(NSObject *)a3 dataTypeContent:resultType:errorOut:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_213C25000, a3, (uint64_t)a3, "Cannot process data point, skipping...", a1);
}

+ (void)encodeDataArray:(NSObject *)a3 dataTypeContent:resultType:errorOut:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_213C25000, a3, (uint64_t)a3, "Non-dictionary or nil in the input, skipping...", a1);
}

+ (void)encodeDataArray:(uint8_t *)a1 dataTypeContent:(void *)a2 resultType:(_QWORD *)a3 errorOut:(NSObject *)a4 .cold.3(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_213C25000, a4, OS_LOG_TYPE_DEBUG, "Cannot process data point: '%@', skipping", a1, 0xCu);

}

+ (void)encodeDataArrayAndRecord:(uint64_t)a3 dataTypeContent:(uint64_t)a4 metadata:(uint64_t)a5 baseKey:(uint64_t)a6 errorOut:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_213C25000, a2, a3, "encodeDataArrayAndRecord failed to record bit vectors for key '%@'", a5, a6, a7, a8, 2u);
}

+ (void)encodeDataArrayAndRecord:(uint64_t)a3 dataTypeContent:metadata:baseKey:errorOut:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_213C25000, a1, a3, "encodeDataArrayAndRecord encoded data array, recording", v3);
}

+ (void)encodeDataArrayAndRecord:(uint64_t)a3 dataTypeContent:(uint64_t)a4 metadata:(uint64_t)a5 baseKey:(uint64_t)a6 errorOut:(uint64_t)a7 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_213C25000, a2, a3, "encodeDataArrayAndRecord with baseKey = \"%@\", a5, a6, a7, a8, 2u);
}

@end
