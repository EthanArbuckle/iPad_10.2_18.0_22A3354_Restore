@implementation SAOnBehalfOfMultiple

- (SAOnBehalfOfMultiple)init
{
  SAOnBehalfOfMultiple *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *proximateProcesses;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAOnBehalfOfMultiple;
  v2 = -[SAOnBehalfOfMultiple init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    proximateProcesses = v2->_proximateProcesses;
    v2->_proximateProcesses = v3;

  }
  return v2;
}

- (id)displayString
{
  void *v1;
  SEL v2;
  void *v3;
  id v4;
  SEL v5;
  const char *v6;
  uint64_t v7;
  unsigned int *v8;
  const char *v9;
  unsigned int *v10;
  SEL v11;
  void *v12;
  id v13;
  SEL v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int *v20;
  const char *v21;
  unsigned int *v22;
  const char *v23;
  id v24;
  unsigned int *v25;
  uint64_t v26;
  const char *v27;
  id v28;
  SEL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  id v34;
  uint64_t v35;
  const char *v36;
  id v37;
  SEL v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v45;
  void *context;
  id obj;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if (!a1[2])
    return 0;
  v1 = a1;
  context = (void *)MEMORY[0x1BCCCC288]();
  objc_msgSend(objc_getProperty(v1, v2, 16, 1), "keysSortedByValueUsingComparator:", &__block_literal_global_177);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v50 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(objc_getProperty(v1, v5, 16, 1), "count"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v3;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v51)
  {
    v48 = v1;
    v49 = *(_QWORD *)v56;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v56 != v49)
          objc_enumerationMutation(obj);
        objc_msgSend(objc_getProperty(v1, v6, 16, 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v7));
        v8 = (unsigned int *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        if (v8)
        {
          v52 = v7;
          objc_msgSend(objc_getProperty(v8, v9, 24, 1), "sortUsingSelector:", sel_compare_);
          objc_msgSend(objc_getProperty(v10, v11, 32, 1), "keysSortedByValueUsingComparator:", &__block_literal_global_11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v54 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(objc_getProperty(v10, v14, 32, 1), "count"));
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v53 = v12;
          v15 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
          if (v15)
          {
            v17 = v15;
            v18 = *(_QWORD *)v60;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v60 != v18)
                  objc_enumerationMutation(v53);
                objc_msgSend(objc_getProperty(v10, v16, 32, 1), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v19));
                v20 = (unsigned int *)objc_claimAutoreleasedReturnValue();
                v22 = v20;
                if (v20)
                {
                  objc_msgSend(objc_getProperty(v20, v21, 24, 1), "sortUsingSelector:", sel_compare_);
                  v24 = objc_alloc(MEMORY[0x1E0CB3940]);
                  v25 = v10;
                  v26 = v22[2];
                  if ((_DWORD)v26 == 1)
                    v27 = "";
                  else
                    v27 = "s";
                  v28 = objc_getProperty(v22, v23, 16, 1);
                  objc_msgSend(objc_getProperty(v22, v29, 24, 1), "componentsJoinedByString:", CFSTR(", "));
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = v26;
                  v10 = v25;
                  v31 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%u sample%s originated by %@ [%@]"), v45, v27, v28, v30);

                }
                else
                {
                  v31 = 0;
                }
                objc_msgSend(v54, "addObject:", v31);

                ++v19;
              }
              while (v17 != v19);
              v32 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
              v17 = v32;
            }
            while (v32);
          }

          v34 = objc_alloc(MEMORY[0x1E0CB3940]);
          v35 = v10[2];
          if ((_DWORD)v35 == 1)
            v36 = "";
          else
            v36 = "s";
          v37 = objc_getProperty(v10, v33, 16, 1);
          objc_msgSend(objc_getProperty(v10, v38, 24, 1), "componentsJoinedByString:", CFSTR(", "));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "componentsJoinedByString:", CFSTR(", "));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("%u sample%s %@ [%@] (%@)"), v35, v36, v37, v39, v40);

          v1 = v48;
          v7 = v52;
        }
        else
        {
          v41 = 0;
        }
        objc_msgSend(v50, "addObject:", v41);

        ++v7;
      }
      while (v7 != v51);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      v51 = v42;
    }
    while (v42);
  }

  objc_msgSend(v50, "componentsJoinedByString:", CFSTR(", "));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v43;
}

uint64_t __37__SAOnBehalfOfMultiple_displayString__block_invoke(uint64_t a1, void *a2, void *a3)
{
  _DWORD *v4;
  unsigned int *v5;
  const char *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  id Property;
  const char *v14;
  id v15;
  id v16;

  v4 = a2;
  v5 = a3;
  v7 = v5;
  if (v4)
  {
    v8 = v4[2];
    if (v5)
    {
LABEL_3:
      v9 = v5[2];
      goto LABEL_4;
    }
  }
  else
  {
    v8 = 0;
    if (v5)
      goto LABEL_3;
  }
  v9 = 0;
LABEL_4:
  if (v8 < v9)
  {
    v10 = 1;
    goto LABEL_16;
  }
  if (v4)
  {
    v11 = v4[2];
    if (v5)
    {
LABEL_8:
      v12 = v5[2];
      goto LABEL_9;
    }
  }
  else
  {
    v11 = 0;
    if (v5)
      goto LABEL_8;
  }
  v12 = 0;
LABEL_9:
  if (v11 <= v12)
  {
    if (v4)
      Property = objc_getProperty(v4, v6, 16, 1);
    else
      Property = 0;
    v15 = Property;
    if (v7)
      v16 = objc_getProperty(v7, v14, 16, 1);
    else
      v16 = 0;
    v10 = objc_msgSend(v15, "compare:", v16);

  }
  else
  {
    v10 = -1;
  }
LABEL_16:

  return v10;
}

- (void)addProximateName:(uint64_t)a3 proximatePid:(void *)a4 originName:(int)a5 originPid:(int)a6 count:
{
  const char *v10;
  id v11;
  const char *v12;
  SAProximateProcess *v13;
  id v14;
  uint64_t v15;
  NSString *name;
  NSMutableArray *v17;
  NSMutableArray *pids;
  NSMutableDictionary *v19;
  NSMutableDictionary *originProcesses;
  char v21;
  SEL v22;
  id Property;
  void *v24;
  id v25;
  void *v26;
  char v27;
  const char *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  const char *v34;
  SAOriginProcess *v35;
  id v36;
  uint64_t v37;
  NSString *v38;
  NSMutableArray *v39;
  NSMutableArray *v40;
  const char *v41;
  id v42;
  id v43;
  id v44;
  char v45;
  void *v46;
  id v47;
  void *v48;
  char v49;
  const char *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  int v56;
  unsigned int v57;
  id v58;
  objc_super v59;

  HIDWORD(v55) = a5;
  v58 = a2;
  v11 = a4;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v10, 16, 1), "objectForKeyedSubscript:", v58);
    v13 = (SAProximateProcess *)objc_claimAutoreleasedReturnValue();
    LODWORD(v55) = a6;
    if (v13)
      goto LABEL_7;
    v13 = [SAProximateProcess alloc];
    v14 = v58;
    if (v13)
    {
      v59.receiver = v13;
      v59.super_class = (Class)SAProximateProcess;
      v13 = (SAProximateProcess *)objc_msgSendSuper2(&v59, sel_init);
      if (v13)
      {
        v15 = objc_msgSend(v14, "copy");
        name = v13->_name;
        v13->_name = (NSString *)v15;

        v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        pids = v13->_pids;
        v13->_pids = v17;

        v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        originProcesses = v13->_originProcesses;
        v13->_originProcesses = v19;

      }
    }

    v21 = 1;
    objc_msgSend(objc_getProperty(a1, v22, 16, 1), "setObject:forKeyedSubscript:", v13, v14);
    if (v13)
    {
LABEL_7:
      Property = objc_getProperty(v13, v12, 24, 1);
      v21 = 0;
    }
    else
    {
      Property = 0;
    }
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = Property;
    objc_msgSend(v24, "numberWithInt:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "containsObject:", v26);

    if ((v27 & 1) == 0)
    {
      if ((v21 & 1) != 0)
        v29 = 0;
      else
        v29 = objc_getProperty(v13, v28, 24, 1);
      v30 = (void *)MEMORY[0x1E0CB37E8];
      v31 = v29;
      objc_msgSend(v30, "numberWithInt:", a3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObject:", v32);

    }
    if ((v21 & 1) != 0)
      v33 = 0;
    else
      v33 = objc_getProperty(v13, v28, 32, 1);
    objc_msgSend(v33, "objectForKeyedSubscript:", v11, v55);
    v35 = (SAOriginProcess *)objc_claimAutoreleasedReturnValue();
    if (v35)
      goto LABEL_21;
    v35 = [SAOriginProcess alloc];
    v36 = v11;
    if (v35)
    {
      v59.receiver = v35;
      v59.super_class = (Class)SAOriginProcess;
      v35 = (SAOriginProcess *)objc_msgSendSuper2(&v59, sel_init);
      if (v35)
      {
        v37 = objc_msgSend(v36, "copy");
        v38 = v35->_name;
        v35->_name = (NSString *)v37;

        v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v40 = v35->_pids;
        v35->_pids = v39;

      }
    }

    v42 = (v21 & 1) != 0 ? 0 : objc_getProperty(v13, v41, 32, 1);
    objc_msgSend(v42, "setObject:forKeyedSubscript:", v35, v36);
    if (v35)
    {
LABEL_21:
      v43 = v11;
      v44 = objc_getProperty(v35, v34, 24, 1);
      v45 = 0;
    }
    else
    {
      v43 = v11;
      v44 = 0;
      v45 = 1;
    }
    v46 = (void *)MEMORY[0x1E0CB37E8];
    v47 = v44;
    objc_msgSend(v46, "numberWithInt:", v57);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "containsObject:", v48);

    if ((v49 & 1) == 0)
    {
      if ((v45 & 1) != 0)
        v51 = 0;
      else
        v51 = objc_getProperty(v35, v50, 24, 1);
      v52 = (void *)MEMORY[0x1E0CB37E8];
      v53 = v51;
      objc_msgSend(v52, "numberWithInt:", v57);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addObject:", v54);

    }
    a1[2] += v56;
    if ((v21 & 1) == 0)
      v13->_count += v56;
    if ((v45 & 1) == 0)
      v35->_count += v56;

    v11 = v43;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximateProcesses, 0);
}

@end
