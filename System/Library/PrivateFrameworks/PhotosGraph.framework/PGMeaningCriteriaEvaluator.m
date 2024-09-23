@implementation PGMeaningCriteriaEvaluator

- (PGMeaningCriteriaEvaluator)initWithDictionary:(id)a3 meaningCriteriaInfo:(id)a4 serviceManager:(id)a5
{
  id v8;
  id v9;
  PGMeaningCriteriaEvaluator *v10;
  PGMeaningCriteriaEvaluator *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id *p_meaningSceneCriteria;
  void *v24;
  int v25;
  void *v26;
  int v27;
  uint64_t v28;
  NSArray *allMeaningCriteriaArray;
  id v31;
  PGMeaningCriteriaEvaluator *v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33 = a5;
  v39.receiver = self;
  v39.super_class = (Class)PGMeaningCriteriaEvaluator;
  v10 = -[PGMeaningCriteriaEvaluator init](&v39, sel_init);
  v11 = v10;
  if (v10)
  {
    v31 = v9;
    objc_storeStrong((id *)&v10->_meaningCriteriaInfo, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v32 = v11;
    objc_msgSend((id)objc_opt_class(), "_allMeaningCriteriaClassArray");
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (!v13)
      goto LABEL_19;
    v14 = v13;
    v15 = *(_QWORD *)v36;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
        objc_msgSend(v17, "criteriaKey", v31);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v17, "criteriaWithDictionary:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v12, "addObject:", v20);
          +[PGMeaningSceneCriteria criteriaKey](PGMeaningSceneCriteria, "criteriaKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v18, "isEqualToString:", v21);

          if (v22)
          {
            p_meaningSceneCriteria = (id *)&v32->_meaningSceneCriteria;
            goto LABEL_12;
          }
          +[PGMeaningActionCriteria criteriaKey](PGMeaningActionCriteria, "criteriaKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v18, "isEqualToString:", v24);

          if (v25)
          {
            p_meaningSceneCriteria = (id *)&v32->_meaningActionCriteria;
LABEL_12:
            objc_storeStrong(p_meaningSceneCriteria, v20);
          }
          else
          {
            +[PGMeaningDurationCriteria criteriaKey](PGMeaningDurationCriteria, "criteriaKey");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v18, "isEqualToString:", v26);

            if (v27)
              objc_msgSend(v20, "setServiceManager:", v33);
          }

        }
        ++v16;
      }
      while (v14 != v16);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v14 = v28;
      if (!v28)
      {
LABEL_19:
        v11 = v32;
        allMeaningCriteriaArray = v32->_allMeaningCriteriaArray;
        v32->_allMeaningCriteriaArray = v12;

        v9 = v31;
        break;
      }
    }
  }

  return v11;
}

- (NSString)meaningLabel
{
  void *v2;
  void *v3;

  -[PGMeaningCriteriaEvaluator meaningCriteriaInfo](self, "meaningCriteriaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "meaningLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)allCriteriaPassForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_allMeaningCriteriaArray;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "passesForMomentNode:momentNodeCache:", v6, v7, (_QWORD)v15))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)allCriteriaPassForAssets:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_allMeaningCriteriaArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "passesForAssets:", v4, (_QWORD)v12))
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)allCriteriaIsValid
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t i;
  BOOL v9;
  void *v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  PGMeaningCriteriaEvaluator *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = self->_allMeaningCriteriaArray;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = CFSTR("FAILED");
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isValid", (_QWORD)v13))
        {
          v9 = 0;
          goto LABEL_12;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      if (v5)
        continue;
      break;
    }
    v9 = 1;
    v7 = CFSTR("PASSED");
  }
  else
  {
    v7 = CFSTR("PASSED");
    v9 = 1;
  }
LABEL_12:

  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] PGMeaningCriteria %@ validation: \n%@", buf, 0x16u);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PGMeaningCriteriaEvaluator meaningCriteriaInfo](self, "meaningCriteriaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v3, "meaningLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("=== %@Criteria%d ===\n\n"), v5, objc_msgSend(v3, "criteriaNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "version");
  objc_msgSend(v6, "appendFormat:", CFSTR("version: %f\n\n"), v7);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_allMeaningCriteriaArray;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend((id)objc_opt_class(), "criteriaKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("*%@*\n"), v14);

        objc_msgSend(v13, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v6;
}

- (PGMeaningCriteriaInfo)meaningCriteriaInfo
{
  return self->_meaningCriteriaInfo;
}

- (void)setMeaningCriteriaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_meaningCriteriaInfo, a3);
}

- (PGMeaningSceneCriteria)meaningSceneCriteria
{
  return self->_meaningSceneCriteria;
}

- (void)setMeaningSceneCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_meaningSceneCriteria, a3);
}

- (PGMeaningActionCriteria)meaningActionCriteria
{
  return self->_meaningActionCriteria;
}

- (void)setMeaningActionCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_meaningActionCriteria, a3);
}

- (NSArray)allMeaningCriteriaArray
{
  return self->_allMeaningCriteriaArray;
}

- (void)setAllMeaningCriteriaArray:(id)a3
{
  objc_storeStrong((id *)&self->_allMeaningCriteriaArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMeaningCriteriaArray, 0);
  objc_storeStrong((id *)&self->_meaningActionCriteria, 0);
  objc_storeStrong((id *)&self->_meaningSceneCriteria, 0);
  objc_storeStrong((id *)&self->_meaningCriteriaInfo, 0);
  objc_storeStrong((id *)&self->_meaningLabel, 0);
}

+ (id)meaningCriteriaEvaluatorsForMeaningLabel:(id)a3 withDictionary:(id)a4 serviceManager:(id)a5
{
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  PGMeaningCriteriaInfo *v22;
  PGMeaningCriteriaEvaluator *v23;
  id obj;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v7 = a4;
  v26 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("criteria"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "loggingConnection");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v34 = v12;
    v35 = 2112;
    v36 = v27;
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Creating %d criteria evaluators for meaning \"%@\", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v11;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    v19 = 1;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v22 = objc_alloc_init(PGMeaningCriteriaInfo);
        -[PGMeaningCriteriaInfo setMeaningLabel:](v22, "setMeaningLabel:", v27);
        -[PGMeaningCriteriaInfo setCriteriaNumber:](v22, "setCriteriaNumber:", v19 + i);
        -[PGMeaningCriteriaInfo setVersion:](v22, "setVersion:", v10);
        v23 = -[PGMeaningCriteriaEvaluator initWithDictionary:meaningCriteriaInfo:serviceManager:]([PGMeaningCriteriaEvaluator alloc], "initWithDictionary:meaningCriteriaInfo:serviceManager:", v21, v22, v26);
        objc_msgSend(v15, "addObject:", v23);

      }
      v19 += i;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v17);
  }

  return v15;
}

+ (id)_allMeaningCriteriaClassArray
{
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
