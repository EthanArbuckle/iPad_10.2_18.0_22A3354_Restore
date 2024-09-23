@implementation FedStatsCombinationType

- (FedStatsCombinationType)initWithCombinationSpec:(id)a3
{
  id v5;
  FedStatsCombinationType *v6;
  FedStatsCombinationType *v7;
  void *v8;
  uint64_t v9;
  NSArray *orderedKeys;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSDictionary *strides;
  FedStatsCombinationType *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FedStatsCombinationType;
  v6 = -[FedStatsCombinationType init](&v40, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_combinationSpec, a3);
    objc_msgSend(v5, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_1);
    v9 = objc_claimAutoreleasedReturnValue();
    orderedKeys = v7->_orderedKeys;
    v7->_orderedKeys = (NSArray *)v9;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[FedStatsCombinationType orderedKeys](v7, "orderedKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v37;
      v15 = 1;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v15 *= objc_msgSend(v17, "classCount");

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v13);
    }
    else
    {
      v15 = 1;
    }

    v35.receiver = v7;
    v35.super_class = (Class)FedStatsCombinationType;
    -[FedStatsBoundedULongType setBound:](&v35, sel_setBound_, v15 - 1);
    v7->_classCount = v15;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v30 = v7;
    -[FedStatsCombinationType orderedKeys](v7, "orderedKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v5, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v15 /= (unint64_t)objc_msgSend(v25, "classCount");

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v15);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v21);
    }

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v18);
    v27 = objc_claimAutoreleasedReturnValue();
    v7 = v30;
    strides = v30->_strides;
    v30->_strides = (NSDictionary *)v27;

  }
  return v7;
}

uint64_t __51__FedStatsCombinationType_initWithCombinationSpec___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)createFromDict:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id obj;
  objc_class *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("structure"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing key \"%@\"), CFSTR("structure"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 300;
LABEL_11:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v9, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v7, "count") <= 1)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The value of the key \"%@\" must have at least 2 elements"), CFSTR("structure"));
LABEL_10:
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 302;
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    v36 = (objc_class *)a1;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Every entry in the value of the key \"%@\" must be a string"), CFSTR("structure"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v31);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_12;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        if (v14)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "objectForKey:", CFSTR("availableTypes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        objc_msgSend(v17, "allValues");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v42;
          while (2)
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v42 != v21)
                objc_enumerationMutation(v18);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "conformsToProtocol:", &unk_254D37088) & 1) == 0)
              {
                v30 = v17;
                if (a4)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Every value in the \"%@\" dictionary must be a class conforming to %@"), CFSTR("availableTypes"), CFSTR("FedStatsDataTypeProtocol"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v33);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();

                }
LABEL_55:
                v10 = 0;
                goto LABEL_56;
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
            if (v20)
              continue;
            break;
          }
        }

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        obj = v12;
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v38;
          while (2)
          {
            for (k = 0; k != v24; ++k)
            {
              if (*(_QWORD *)v38 != v25)
                objc_enumerationMutation(obj);
              v27 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
              objc_msgSend(v17, "objectForKey:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, v27);

              objc_msgSend(v18, "objectForKeyedSubscript:", v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
              {
                v30 = v17;
                if (a4)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is no type defined for \"%@\"), v27);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 302, v34);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();

                }
                goto LABEL_55;
              }
            }
            v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
            if (v24)
              continue;
            break;
          }
        }
        v30 = v17;

        v10 = (void *)objc_msgSend([v36 alloc], "initWithCombinationSpec:", v18);
        goto LABEL_56;
      }
      v30 = v17;
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The value of the key \"%@\" must be a dictionary"), CFSTR("availableTypes"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 302;
        goto LABEL_48;
      }
    }
    else
    {
      v30 = 0;
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing key \"%@\"), CFSTR("availableTypes"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 300;
LABEL_48:
        +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", v32, v18);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

        goto LABEL_57;
      }
    }
    v10 = 0;
LABEL_57:

    goto LABEL_13;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The value of the key \"%@\" must be an array"), CFSTR("structure"));
    goto LABEL_10;
  }
LABEL_12:
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)encodeToIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id *v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    -[FedStatsCombinationType orderedKeys](self, "orderedKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The combination type requires the key \"%@\" to be in the value dictionary"), v12);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, v26);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_27;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v9)
          continue;
        break;
      }
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[FedStatsCombinationType orderedKeys](self, "orderedKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v33)
    {
      v30 = a4;
      v14 = 0;
      v32 = *(_QWORD *)v36;
      while (2)
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v36 != v32)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
          -[FedStatsCombinationType combinationSpec](self, "combinationSpec");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 0;
          objc_msgSend(v18, "encodeToIndex:possibleError:", v19, &v34);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v34;

          if (!v20)
          {
            if (v30)
            {
              v27 = objc_msgSend(*v30, "code");
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error with \"%@\" value in the encoder."), v16);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[FedStatsError errorWithCode:underlyingError:description:](FedStatsError, "errorWithCode:underlyingError:description:", v27, v21, v28);
              *v30 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_27;
          }
          -[FedStatsCombinationType strides](self, "strides");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v16);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "unsignedLongValue");
          v14 += objc_msgSend(v20, "unsignedLongValue") * v24;

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v33)
          continue;
        break;
      }
    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 401, CFSTR("The combination type encoder requires a dictionary to process."));
    v25 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_27:
    v25 = 0;
  }

  return v25;
}

- (id)decodeFromIndex:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id obj;
  FedStatsCombinationType *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v27 = CFSTR("The decoder can only work with a valid number type");
LABEL_16:
      +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 500, v27);
      v26 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
LABEL_17:
    v26 = 0;
    goto LABEL_22;
  }
  v8 = objc_msgSend(v6, "unsignedLongValue");
  if (v8 >= -[FedStatsCombinationType classCount](self, "classCount"))
  {
    if (a4)
    {
      v27 = CFSTR("The decoder requires a number less than the class count");
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v33 = v7;
  v9 = objc_msgSend(v7, "unsignedLongValue");
  v10 = (void *)MEMORY[0x24BDBCED8];
  -[FedStatsCombinationType orderedKeys](self, "orderedKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[FedStatsCombinationType orderedKeys](self, "orderedKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v37)
  {
    v35 = self;
    v36 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[FedStatsCombinationType strides](self, "strides");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedLongValue");

        v39 = v16;
        v17 = v9 / v16;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9 / v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FedStatsCombinationType combinationSpec](self, "combinationSpec");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v13);
        v20 = v9;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = a4;
        objc_msgSend(v21, "decodeFromIndex:possibleError:", v18, a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setValue:forKey:", v23, v13);

        objc_msgSend(v38, "objectForKey:", v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          if (v22)
          {
            v28 = v22;
            v29 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(*v22, "localizedDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("Could not decode \"%@\" value in the combination: %@"), v13, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 500, v31);
            *v28 = (id)objc_claimAutoreleasedReturnValue();

          }
          v26 = 0;
          v7 = v33;
          v25 = v38;
          goto LABEL_21;
        }
        v9 = v20 - v17 * v39;

        a4 = v22;
        self = v35;
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v37)
        continue;
      break;
    }
  }

  v25 = v38;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v33;
LABEL_21:

LABEL_22:
  return v26;
}

+ (id)kAvailableTypes
{
  return CFSTR("availableTypes");
}

- (int64_t)dataType
{
  return 99;
}

- (unint64_t)classCount
{
  return self->_classCount;
}

- (id)sampleForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCED8];
  -[FedStatsCombinationType orderedKeys](self, "orderedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[FedStatsCombinationType orderedKeys](self, "orderedKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v19 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        -[FedStatsCombinationType strides](self, "strides");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "unsignedLongValue");

        -[FedStatsCombinationType combinationSpec](self, "combinationSpec");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sampleForIndex:", a3 / v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v16, v10);

        a3 %= v13;
        ++v9;
      }
      while (v8 != v9);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v20;
}

- (NSDictionary)combinationSpec
{
  return self->_combinationSpec;
}

- (void)setCombinationSpec:(id)a3
{
  objc_storeStrong((id *)&self->_combinationSpec, a3);
}

- (NSDictionary)strides
{
  return self->_strides;
}

- (void)setStrides:(id)a3
{
  objc_storeStrong((id *)&self->_strides, a3);
}

- (NSArray)orderedKeys
{
  return self->_orderedKeys;
}

- (void)setOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_orderedKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_strides, 0);
  objc_storeStrong((id *)&self->_combinationSpec, 0);
}

@end
