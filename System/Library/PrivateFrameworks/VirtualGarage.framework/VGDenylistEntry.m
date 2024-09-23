@implementation VGDenylistEntry

- (VGDenylistEntry)initWithModelId:(id)a3 firmwareIds:(id)a4 years:(id)a5 models:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  VGDenylistEntry *v15;
  VGDenylistEntry *v16;
  uint64_t v17;
  NSArray *firmwareIds;
  uint64_t v19;
  NSArray *years;
  uint64_t v21;
  NSArray *models;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VGDenylistEntry;
  v15 = -[VGDenylistEntry init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelId, a3);
    if (v12)
    {
      v17 = objc_msgSend(v12, "copy");
      firmwareIds = v16->_firmwareIds;
      v16->_firmwareIds = (NSArray *)v17;
    }
    else
    {
      firmwareIds = v16->_firmwareIds;
      v16->_firmwareIds = (NSArray *)MEMORY[0x24BDBD1A8];
    }

    if (v13)
    {
      v19 = objc_msgSend(v13, "copy");
      years = v16->_years;
      v16->_years = (NSArray *)v19;
    }
    else
    {
      years = v16->_years;
      v16->_years = (NSArray *)MEMORY[0x24BDBD1A8];
    }

    if (v14)
    {
      v21 = objc_msgSend(v14, "copy");
      models = v16->_models;
      v16->_models = (NSArray *)v21;
    }
    else
    {
      models = v16->_models;
      v16->_models = (NSArray *)MEMORY[0x24BDBD1A8];
    }

  }
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  VGDenylistEntry *v4;
  VGDenylistEntry *v5;
  NSNumber *modelId;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSArray *firmwareIds;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int v15;
  NSArray *years;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  int v20;
  NSArray *models;
  NSArray *v22;
  id v23;
  void *v24;
  char v25;

  v4 = (VGDenylistEntry *)a3;
  if (v4 == self)
  {
    v25 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      modelId = v5->_modelId;
      v7 = self->_modelId;
      v8 = modelId;
      if (v7 | v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend((id)v7, "isEqual:", v8);

        if (!v10)
          goto LABEL_13;
      }
      firmwareIds = v5->_firmwareIds;
      v12 = self->_firmwareIds;
      v13 = firmwareIds;
      if (v12 | v13)
      {
        v14 = (void *)v13;
        v15 = objc_msgSend((id)v12, "isEqual:", v13);

        if (!v15)
          goto LABEL_13;
      }
      years = v5->_years;
      v17 = self->_years;
      v18 = years;
      if (v17 | v18
        && (v19 = (void *)v18,
            v20 = objc_msgSend((id)v17, "isEqual:", v18),
            v19,
            (id)v17,
            !v20))
      {
LABEL_13:
        v25 = 0;
      }
      else
      {
        models = self->_models;
        v22 = v5->_models;
        v23 = models;
        v24 = v23;
        if ((unint64_t)v23 | (unint64_t)v22)
          v25 = objc_msgSend(v23, "isEqual:", v22);
        else
          v25 = 1;

      }
    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

- (BOOL)isSupersetOfEntry:(id)a3
{
  void **v4;
  NSNumber *modelId;
  char v6;

  v4 = (void **)a3;
  modelId = self->_modelId;
  if ((!modelId || -[NSNumber isEqualToNumber:](modelId, "isEqualToNumber:", v4[1]))
    && __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(v4[2], self->_firmwareIds)
    && __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(v4[3], self->_years))
  {
    v6 = __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(v4[4], self->_models);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __37__VGDenylistEntry_isSupersetOfEntry___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "count") || objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isSubsetOfSet:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)description
{
  uint64_t v3;
  NSArray *v4;
  NSArray *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  NSArray *v22;
  void *v23;
  NSArray *v24;
  NSArray *v25;
  void *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  __CFString *v35;
  void *v36;
  void *v37;
  NSArray *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  NSArray *v42;
  NSArray *v43;
  NSArray *v44;
  void *v45;
  NSArray *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  id v53;
  __CFString *v54;
  void *v55;
  void *v56;
  NSArray *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  NSArray *v61;
  void *v62;
  NSArray *v64;
  NSArray *v65;
  __CFString *v66;
  __CFString *v67;
  NSNumber *modelId;
  uint64_t v69;
  void *v70;
  VGDenylistEntry *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v70 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  modelId = self->_modelId;
  v69 = v3;
  v4 = self->_firmwareIds;
  v5 = v4;
  v71 = self;
  if (v4)
  {
    if (-[NSArray count](v4, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v65 = v5;
      v7 = v5;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v73 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            if (v12)
            {
              v13 = (void *)MEMORY[0x24BDD17C8];
              v14 = v12;
              objc_msgSend(v13, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v14);
              v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v15 = CFSTR("<nil>");
            }
            objc_msgSend(v6, "addObject:", v15);

          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v9);
      }

      -[NSArray componentsJoinedByString:](v7, "componentsJoinedByString:", CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x24BDD17C8];
      v18 = v7;
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ [%@]"), v19, v16);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      self = v71;
      v5 = v65;
    }
    else
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = v5;
      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ (empty)"), v23);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = CFSTR("<nil>");
  }

  v24 = self->_years;
  v25 = v24;
  if (v24)
  {
    if (-[NSArray count](v24, "count"))
    {
      v66 = v20;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v25, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v64 = v25;
      v27 = v25;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v73;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v73 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
            if (v32)
            {
              v33 = (void *)MEMORY[0x24BDD17C8];
              v34 = v32;
              objc_msgSend(v33, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v34);
              v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v35 = CFSTR("<nil>");
            }
            objc_msgSend(v26, "addObject:", v35);

          }
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v29);
      }

      -[NSArray componentsJoinedByString:](v27, "componentsJoinedByString:", CFSTR(", "));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BDD17C8];
      v38 = v27;
      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "stringWithFormat:", CFSTR("%@ [%@]"), v39, v36);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

      self = v71;
      v25 = v64;
      v20 = v66;
    }
    else
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      v42 = v25;
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v42);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@ (empty)"), v26);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v40 = CFSTR("<nil>");
  }

  v43 = self->_models;
  v44 = v43;
  if (v43)
  {
    if (-[NSArray count](v43, "count"))
    {
      v67 = v20;
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](v44, "count"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v46 = v44;
      v47 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v73;
        do
        {
          for (k = 0; k != v48; ++k)
          {
            if (*(_QWORD *)v73 != v49)
              objc_enumerationMutation(v46);
            v51 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * k);
            if (v51)
            {
              v52 = (void *)MEMORY[0x24BDD17C8];
              v53 = v51;
              objc_msgSend(v52, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v53);
              v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v54 = CFSTR("<nil>");
            }
            objc_msgSend(v45, "addObject:", v54);

          }
          v48 = -[NSArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
        }
        while (v48);
      }

      -[NSArray componentsJoinedByString:](v46, "componentsJoinedByString:", CFSTR(", "));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)MEMORY[0x24BDD17C8];
      v57 = v46;
      objc_msgSend(v56, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "stringWithFormat:", CFSTR("%@ [%@]"), v58, v55);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();

      self = v71;
      v20 = v67;
    }
    else
    {
      v60 = (void *)MEMORY[0x24BDD17C8];
      v61 = v44;
      objc_msgSend(v60, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v61);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "stringWithFormat:", CFSTR("%@ (empty)"), v45);
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v59 = CFSTR("<nil>");
  }

  objc_msgSend(v70, "stringWithFormat:", CFSTR("<%@:%p, modelId: %@, firmwareIds: %@, years: %@, models: %@>"), v69, self, modelId, v20, v40, v59);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_models, 0);
  objc_storeStrong((id *)&self->_years, 0);
  objc_storeStrong((id *)&self->_firmwareIds, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
}

@end
