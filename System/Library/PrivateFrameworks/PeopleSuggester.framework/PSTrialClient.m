@implementation PSTrialClient

void __22___PSTrialClient_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "_PSTrialClient: Namespace updated", v3, 2u);
    }

    objc_msgSend(WeakRetained, "updateFactors");
  }

}

void __31___PSTrialClient_updateFactors__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = (void *)a2[1];
  v4 = a2;
  objc_msgSend(v3, "refresh");
  objc_msgSend(*(id *)(a1 + 32), "recipe");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = (id)v4[3];
  v4[3] = 0;

}

void __30___PSTrialClient_rankingModel__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30[8];

  v3 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3[3]);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v4 = v3[1];
    if (v4)
    {
      objc_msgSend(v4, "levelForFactor:withNamespaceName:", CFSTR("psSuggestionsRankingModel.mlmodelc"), CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"));
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject directoryValue](v5, "directoryValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 1);
        v8 = objc_claimAutoreleasedReturnValue();
        +[_PSLogging rewriteChannel](_PSLogging, "rewriteChannel");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __30___PSTrialClient_rankingModel__block_invoke_cold_4((uint64_t)v8, v9);

        objc_msgSend(*(id *)(a1 + 32), "loadCoreMLModel:config:", v8, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v30[0] = 0;
            _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_DEFAULT, "_PSTrialClient: Loaded model successfully", (uint8_t *)v30, 2u);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          __30___PSTrialClient_rankingModel__block_invoke_cold_3(v15, v23, v24, v25, v26, v27, v28, v29);
        }

        objc_storeStrong(v3 + 3, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          __30___PSTrialClient_rankingModel__block_invoke_cold_2(v8, v16, v17, v18, v19, v20, v21, v22);
      }

    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        __30___PSTrialClient_rankingModel__block_invoke_cold_1(v5);
    }

  }
}

void __24___PSTrialClient_recipe__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  objc_msgSend(*(id *)(a2 + 8), "levelForFactor:withNamespaceName:", CFSTR("psRecipe"), CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v3, "fileValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:isDirectory:", v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 1, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    else
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __24___PSTrialClient_recipe__block_invoke_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);

    }
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __24___PSTrialClient_recipe__block_invoke_cold_1(v9, v14, v15, v16, v17, v18, v19, v20);
  }

}

void __36___PSTrialClient_getTrialExperiment__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 8), "experimentIdentifiersWithNamespaceName:", CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __31___PSTrialClient_objectForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __30___PSTrialClient_rankingModel__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A07F4000, log, OS_LOG_TYPE_FAULT, "_PSTrialClient is nil", v1, 2u);
}

void __30___PSTrialClient_rankingModel__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, a1, a3, "_PSTrialClient: Directory path is nil for Factor %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __30___PSTrialClient_rankingModel__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, a1, a3, "_PSTrialClient: Loaded model is nil for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __30___PSTrialClient_rankingModel__block_invoke_cold_4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_DEBUG, "_PSTrialClient: Using CoreML model from %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __24___PSTrialClient_recipe__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a1, a3, "_PSTrialClient: File path is nil for Factor %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24___PSTrialClient_recipe__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a1, a3, "_PSTrialClient: File missing for Factor %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
