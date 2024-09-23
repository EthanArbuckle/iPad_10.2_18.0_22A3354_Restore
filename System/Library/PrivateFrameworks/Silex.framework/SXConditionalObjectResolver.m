@implementation SXConditionalObjectResolver

- (SXConditionalObjectResolver)initWithConditionValidator:(id)a3 objectMerger:(id)a4
{
  id v7;
  id v8;
  SXConditionalObjectResolver *v9;
  SXConditionalObjectResolver *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXConditionalObjectResolver;
  v9 = -[SXConditionalObjectResolver init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditionValidator, a3);
    objc_storeStrong((id *)&v10->_objectMerger, a4);
  }

  return v10;
}

- (id)resolveObjects:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(obj);
        v26 = v9;
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        objc_msgSend(v28, "addObject:", v10);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v10, "conditional");
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v30)
        {
          v29 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v37 != v29)
                objc_enumerationMutation(v27);
              v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              v32 = 0u;
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v31 = v12;
              objc_msgSend(v12, "conditions");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v33;
                while (2)
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v33 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
                    objc_msgSend(v18, "types");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v8, "unionSet:", v19);

                    if (-[SXConditionValidating validateCondition:context:](self->_conditionValidator, "validateCondition:context:", v18, v7))
                    {
                      objc_msgSend(v28, "addObject:", v31);
                      goto LABEL_21;
                    }
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                  if (v15)
                    continue;
                  break;
                }
              }
LABEL_21:

            }
            v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v30);
        }

        v9 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v25);
  }

  -[SXJSONObjectMerger mergeObjects:](self->_objectMerger, "mergeObjects:", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SXResolvedObject initWitObject:conditionTypes:]([SXResolvedObject alloc], "initWitObject:conditionTypes:", v20, v8);

  return v21;
}

- (SXJSONObjectMerger)objectMerger
{
  return self->_objectMerger;
}

- (SXConditionValidating)conditionValidator
{
  return self->_conditionValidator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionValidator, 0);
  objc_storeStrong((id *)&self->_objectMerger, 0);
}

@end
