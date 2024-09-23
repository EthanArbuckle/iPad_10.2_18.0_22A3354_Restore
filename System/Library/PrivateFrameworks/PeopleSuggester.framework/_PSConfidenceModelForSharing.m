@implementation _PSConfidenceModelForSharing

- (_PSConfidenceModelForSharing)init
{
  _PSConfidenceModelForSharing *v2;
  _PSConfidenceModelDriver *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PSConfidenceModelForSharing;
  v2 = -[_PSConfidenceModelForSharing init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_PSConfidenceModelDriver);
    -[_PSConfidenceModelForSharing setConfidenceModelDriver:](v2, "setConfidenceModelDriver:", v3);

  }
  return v2;
}

- (_PSConfidenceModelForSharing)initWithConfig:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PSConfidenceModelForSharing;
  return -[_PSConfidenceModelForSharing init](&v4, sel_init, a3);
}

- (BOOL)addEventForModel:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[_PSConfidenceModelForSharing confidenceModelDriver](self, "confidenceModelDriver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "addEventForModel:forUseCaseKey:event:", v6, CFSTR("sharesheet"), v7);

  if ((v9 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[_PSConfidenceModelForSharing confidenceModelDriver](self, "confidenceModelDriver");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerModelKey:forUseCaseKey:confidenceWindowSize:minimumInstanceCount:", v6, CFSTR("sharesheet"), 10, 3);

    -[_PSConfidenceModelForSharing confidenceModelDriver](self, "confidenceModelDriver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "addEventForModel:forUseCaseKey:event:", v6, CFSTR("sharesheet"), v7);

  }
  return v10;
}

- (double)getConfidenceForModel:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[_PSConfidenceModelForSharing confidenceModelDriver](self, "confidenceModelDriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getConfidenceForModel:forUseCaseKey:", v4, CFSTR("sharesheet"));
  v7 = v6;

  return v7;
}

- (BOOL)findObjectWithID:(id)a3 inArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "isEqualToString:", v5, (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)getConfidenceRankedModelKeysGivenKeysToSort:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  scoredModel *v13;
  void *v14;
  scoredModel *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSObject *v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PSConfidenceModelForSharing confidenceModelDriver](self, "confidenceModelDriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "confidenceModelDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v6;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sharesheet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (-[_PSConfidenceModelForSharing findObjectWithID:inArray:](self, "findObjectWithID:inArray:", v12, v4))
        {
          v13 = [scoredModel alloc];
          -[_PSConfidenceModelForSharing confidenceModelDriver](self, "confidenceModelDriver");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "getConfidenceForModel:forUseCaseKey:", v12, CFSTR("sharesheet"));
          v15 = -[scoredModel initWithModelKey:score:](v13, "initWithModelKey:score:", v12);

          objc_msgSend(v29, "addObject:", v15);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 0, sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingDescriptors:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v18;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "modelKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v22);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[_PSConfidenceModelForSharing getConfidenceRankedModelKeysGivenKeysToSort:].cold.1((uint64_t)v20, v26);

  return v19;
}

- (_PSConfidenceModelDriver)confidenceModelDriver
{
  return self->_confidenceModelDriver;
}

- (void)setConfidenceModelDriver:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceModelDriver, a3);
}

- (BOOL)_PSConfidenceModelInUse
{
  return self->__PSConfidenceModelInUse;
}

- (void)set_PSConfidenceModelInUse:(BOOL)a3
{
  self->__PSConfidenceModelInUse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceModelDriver, 0);
}

- (void)getConfidenceRankedModelKeysGivenKeysToSort:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "sortedScoredModelArray: %@", (uint8_t *)&v2, 0xCu);
}

@end
