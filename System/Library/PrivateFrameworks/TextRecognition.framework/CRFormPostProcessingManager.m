@implementation CRFormPostProcessingManager

+ (id)postProcessingManagerWithDefaultSequence
{
  CRFormPostProcessingManager *v2;
  void *v3;
  void *v4;
  void *v5;
  CRFormFilterSurfacedFieldsStep *v6;
  void *v7;
  void *v8;
  CRFormFilterSurfacedFieldsStep *v9;
  void *v10;
  void *v11;
  CRFormPostProcessingManager *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[13];

  v18[12] = *MEMORY[0x1E0C80C00];
  v2 = [CRFormPostProcessingManager alloc];
  v16 = (void *)objc_opt_new();
  v18[0] = v16;
  v15 = (void *)objc_opt_new();
  v18[1] = v15;
  v14 = (void *)objc_opt_new();
  v18[2] = v14;
  v17 = (void *)objc_opt_new();
  v18[3] = v17;
  v3 = (void *)objc_opt_new();
  v18[4] = v3;
  v4 = (void *)objc_opt_new();
  v18[5] = v4;
  v5 = (void *)objc_opt_new();
  v18[6] = v5;
  v6 = -[CRFormFilterSurfacedFieldsStep initWithAssignGlobalOrder:]([CRFormFilterSurfacedFieldsStep alloc], "initWithAssignGlobalOrder:", 0);
  v18[7] = v6;
  v7 = (void *)objc_opt_new();
  v18[8] = v7;
  v8 = (void *)objc_opt_new();
  v18[9] = v8;
  v9 = -[CRFormFilterSurfacedFieldsStep initWithAssignGlobalOrder:]([CRFormFilterSurfacedFieldsStep alloc], "initWithAssignGlobalOrder:", 1);
  v18[10] = v9;
  v10 = (void *)objc_opt_new();
  v18[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRFormPostProcessingManager initWithSequence:](v2, "initWithSequence:", v11);

  return v12;
}

- (CRFormPostProcessingManager)initWithStep:(id)a3
{
  id v4;
  void *v5;
  CRFormPostProcessingManager *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRFormPostProcessingManager initWithSequence:](self, "initWithSequence:", v5);

  return v6;
}

- (CRFormPostProcessingManager)initWithSequence:(id)a3
{
  id v5;
  CRFormPostProcessingManager *v6;
  CRFormPostProcessingManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRFormPostProcessingManager;
  v6 = -[CRFormPostProcessingManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sequence, a3);

  return v7;
}

+ (void)logFieldStatistics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__CRFormPostProcessingManager_logFieldStatistics___block_invoke_2;
  v9[3] = &unk_1E98D9E10;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "enumerateFieldsInFields:filter:block:", v3, &__block_literal_global_3, v9);
  CROSLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v6, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEBUG, "CRFormPostProcessorStep running with fields per source = %@", buf, 0xCu);

  }
}

uint64_t __50__CRFormPostProcessingManager_logFieldStatistics___block_invoke()
{
  return 1;
}

void __50__CRFormPostProcessingManager_logFieldStatistics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[CRFormUtilities debugDescriptionForField:](CRFormUtilities, "debugDescriptionForField:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CROSLogForCategory(6);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138477827;
    v11 = v4;
    _os_log_impl(&dword_1D4FB8000, v5, OS_LOG_TYPE_DEBUG, "%{private}@", (uint8_t *)&v10, 0xCu);
  }

  while (1)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v6 >= objc_msgSend(v3, "fieldSource") + 1)
      break;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", &unk_1E9926580);
  }
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "fieldSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "intValue") + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v9, objc_msgSend(v3, "fieldSource"));

}

- (id)process:(id)a3 document:(id)a4 options:(id)a5
{
  -[CRFormPostProcessingManager process:externalFields:document:options:](self, "process:externalFields:document:options:", a3, MEMORY[0x1E0C9AA60], a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)process:(id)a3 externalFields:(id)a4 document:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  CROSLogForCategory(6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v29 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_DEBUG, "CRFormPostProcessorStep running with %ld fields.", buf, 0xCu);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = self->_sequence;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      v19 = v10;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "process:externalFields:document:options:", v19, v11, v12, v13, (_QWORD)v23);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        ++v18;
        v19 = v10;
      }
      while (v16 != v18);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  CROSLogForCategory(6);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v21;
    _os_log_impl(&dword_1D4FB8000, v20, OS_LOG_TYPE_DEBUG, "CRFormPostProcessorStep completed with %ld fields.", buf, 0xCu);
  }

  return v10;
}

+ (void)enumerateAllFieldsInFields:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__CRFormPostProcessingManager_enumerateAllFieldsInFields_block___block_invoke;
  v7[3] = &unk_1E98D9E38;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __64__CRFormPostProcessingManager_enumerateAllFieldsInFields_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)enumerateFieldsInFields:(id)a3 filter:(id)a4 block:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__CRFormPostProcessingManager_enumerateFieldsInFields_filter_block___block_invoke;
  v11[3] = &unk_1E98D9E60;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v11);

}

void __68__CRFormPostProcessingManager_enumerateFieldsInFields_filter_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)enumerateDetectedFields:(id)a3 block:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "enumerateFieldsInFields:filter:block:", v6, &__block_literal_global_24, v5);

}

BOOL __61__CRFormPostProcessingManager_enumerateDetectedFields_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fieldSource") == 1;
}

+ (void)enumerateContourBasedDetectedFields:(id)a3 block:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "enumerateFieldsInFields:filter:block:", v6, &__block_literal_global_25, v5);

}

BOOL __73__CRFormPostProcessingManager_enumerateContourBasedDetectedFields_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fieldSource") == 2;
}

+ (void)enumerateTextBasedDetectedFields:(id)a3 block:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "enumerateFieldsInFields:filter:block:", v6, &__block_literal_global_26_0, v5);

}

BOOL __70__CRFormPostProcessingManager_enumerateTextBasedDetectedFields_block___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fieldSource") == 3;
}

+ (void)enumerateExternalFields:(id)a3 block:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "enumerateFieldsInFields:filter:block:", v6, &__block_literal_global_27, v5);

}

BOOL __61__CRFormPostProcessingManager_enumerateExternalFields_block___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "fieldSource") == 4 || objc_msgSend(v2, "fieldSource") == 5;

  return v3;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_storeStrong((id *)&self->_sequence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
