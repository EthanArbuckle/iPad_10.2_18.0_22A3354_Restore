@implementation PGMeaningPartsOfDayCriteria

+ (id)criteriaKey
{
  return CFSTR("PartsOfDay");
}

+ (id)criteriaWithDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positiveSignificantPartsOfDay"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPositiveSignificantPartsOfDayStrings:", v6);
  objc_msgSend(a1, "_partsOfDayAsNumbersFromStrings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPositiveSignificantPartsOfDay:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("negativeSignificantPartsOfDay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNegativeSignificantPartsOfDayStrings:", v8);
  objc_msgSend(a1, "_partsOfDayAsNumbersFromStrings:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNegativeSignificantPartsOfDay:", v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("positivePartsOfDay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPositivePartsOfDayStrings:", v10);
  objc_msgSend(a1, "_partsOfDayAsNumbersFromStrings:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPositivePartsOfDay:", v11);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("negativePartsOfDay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setNegativePartsOfDayStrings:", v12);
  objc_msgSend(a1, "_partsOfDayAsNumbersFromStrings:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNegativePartsOfDay:", v13);

  return v5;
}

+ (id)_partsOfDayAsNumbersFromStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "_partsOfDayNumbersByString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

+ (id)_partsOfDayNumbersByString
{
  return &unk_1E84EB608;
}

- (BOOL)passesForMomentNode:(id)a3 momentNodeCache:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a4;
  v6 = objc_msgSend(v5, "significantPartsOfDay");
  -[PGMeaningPartsOfDayCriteria positiveSignificantPartsOfDay](self, "positiveSignificantPartsOfDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningPartsOfDayCriteria negativeSignificantPartsOfDay](self, "negativeSignificantPartsOfDay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PGMeaningPartsOfDayCriteria _passesPartsOfDayWithMomentNodePartsOfDay:positivePartsOfDay:negativePartsOfDay:](self, "_passesPartsOfDayWithMomentNodePartsOfDay:positivePartsOfDay:negativePartsOfDay:", v6, v7, v8);

  if ((_DWORD)v6)
  {
    v9 = objc_msgSend(v5, "partsOfDay");
    -[PGMeaningPartsOfDayCriteria positivePartsOfDay](self, "positivePartsOfDay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMeaningPartsOfDayCriteria negativePartsOfDay](self, "negativePartsOfDay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PGMeaningPartsOfDayCriteria _passesPartsOfDayWithMomentNodePartsOfDay:positivePartsOfDay:negativePartsOfDay:](self, "_passesPartsOfDayWithMomentNodePartsOfDay:positivePartsOfDay:negativePartsOfDay:", v9, v10, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)passesForAssets:(id)a3
{
  return 1;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  PGMeaningPartsOfDayCriteria *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_partsOfDayNumbersByString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningPartsOfDayCriteria positiveSignificantPartsOfDayStrings](self, "positiveSignificantPartsOfDayStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  -[PGMeaningPartsOfDayCriteria negativeSignificantPartsOfDayStrings](self, "negativeSignificantPartsOfDayStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    v11 = 1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loggingConnection");
          v16 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v13;
            _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid significant part of day \"%@\", buf, 0xCu);
          }

          v11 = 0;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 1;
  }

  -[PGMeaningPartsOfDayCriteria positivePartsOfDayStrings](v30, "positivePartsOfDayStrings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningPartsOfDayCriteria negativePartsOfDayStrings](v30, "negativePartsOfDayStrings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
        objc_msgSend(v3, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "loggingConnection");
          v28 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v25;
            _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[MEANING CRITERIA] Invalid part of day \"%@\", buf, 0xCu);
          }

          v11 = 0;
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v22);
  }

  return v11 & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningPartsOfDayCriteria positiveSignificantPartsOfDayStrings](self, "positiveSignificantPartsOfDayStrings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMeaningPartsOfDayCriteria negativeSignificantPartsOfDayStrings](self, "negativeSignificantPartsOfDayStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendFormat:", CFSTR("positiveSignificantPartsOfDay: %@\n"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("negativeSignificantPartsOfDay: %@\n"), v7);
  -[PGMeaningPartsOfDayCriteria positivePartsOfDayStrings](self, "positivePartsOfDayStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGMeaningPartsOfDayCriteria negativePartsOfDayStrings](self, "negativePartsOfDayStrings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "appendFormat:", CFSTR("positivePartsOfDay: %@\n"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("negativePartsOfDay: %@\n"), v11);

  return (NSString *)v3;
}

- (BOOL)_passesPartsOfDayWithMomentNodePartsOfDay:(unint64_t)a3 positivePartsOfDay:(id)a4 negativePartsOfDay:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
LABEL_5:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "unsignedIntegerValue") & a3) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v11)
            goto LABEL_5;
          goto LABEL_11;
        }
      }

      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v8;
      v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (!v15)
      {
        v14 = 1;
        goto LABEL_22;
      }
      v16 = v15;
      v17 = *(_QWORD *)v21;
LABEL_14:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "unsignedIntegerValue", (_QWORD)v20) & a3) != 0)
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          v14 = 1;
          if (v16)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
    }
LABEL_11:
    v14 = 0;
LABEL_22:

  }
  else
  {
    v14 = 1;
  }

  return v14;
}

- (NSArray)positiveSignificantPartsOfDay
{
  return self->_positiveSignificantPartsOfDay;
}

- (void)setPositiveSignificantPartsOfDay:(id)a3
{
  objc_storeStrong((id *)&self->_positiveSignificantPartsOfDay, a3);
}

- (NSArray)positiveSignificantPartsOfDayStrings
{
  return self->_positiveSignificantPartsOfDayStrings;
}

- (void)setPositiveSignificantPartsOfDayStrings:(id)a3
{
  objc_storeStrong((id *)&self->_positiveSignificantPartsOfDayStrings, a3);
}

- (NSArray)negativeSignificantPartsOfDay
{
  return self->_negativeSignificantPartsOfDay;
}

- (void)setNegativeSignificantPartsOfDay:(id)a3
{
  objc_storeStrong((id *)&self->_negativeSignificantPartsOfDay, a3);
}

- (NSArray)negativeSignificantPartsOfDayStrings
{
  return self->_negativeSignificantPartsOfDayStrings;
}

- (void)setNegativeSignificantPartsOfDayStrings:(id)a3
{
  objc_storeStrong((id *)&self->_negativeSignificantPartsOfDayStrings, a3);
}

- (NSArray)positivePartsOfDay
{
  return self->_positivePartsOfDay;
}

- (void)setPositivePartsOfDay:(id)a3
{
  objc_storeStrong((id *)&self->_positivePartsOfDay, a3);
}

- (NSArray)positivePartsOfDayStrings
{
  return self->_positivePartsOfDayStrings;
}

- (void)setPositivePartsOfDayStrings:(id)a3
{
  objc_storeStrong((id *)&self->_positivePartsOfDayStrings, a3);
}

- (NSArray)negativePartsOfDay
{
  return self->_negativePartsOfDay;
}

- (void)setNegativePartsOfDay:(id)a3
{
  objc_storeStrong((id *)&self->_negativePartsOfDay, a3);
}

- (NSArray)negativePartsOfDayStrings
{
  return self->_negativePartsOfDayStrings;
}

- (void)setNegativePartsOfDayStrings:(id)a3
{
  objc_storeStrong((id *)&self->_negativePartsOfDayStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativePartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_negativePartsOfDay, 0);
  objc_storeStrong((id *)&self->_positivePartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_positivePartsOfDay, 0);
  objc_storeStrong((id *)&self->_negativeSignificantPartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_negativeSignificantPartsOfDay, 0);
  objc_storeStrong((id *)&self->_positiveSignificantPartsOfDayStrings, 0);
  objc_storeStrong((id *)&self->_positiveSignificantPartsOfDay, 0);
}

@end
