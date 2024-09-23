@implementation WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor

+ (id)_correctionsSchema
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_schemaWithExpectedClass:errorCode:isOptional:", objc_opt_class(), 2, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_schemaWithExpectedClass:errorCode:isOptional:", objc_opt_class(), 1, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("version");
  objc_msgSend(a1, "_schemaWithExpectedClass:errorCode:isOptional:", objc_opt_class(), 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v3;
  v26[1] = CFSTR("origins");
  v24[0] = CFSTR("origin");
  v24[1] = CFSTR("corrections");
  v25[0] = v19;
  v22[1] = CFSTR("corrections");
  v23[0] = v18;
  v22[0] = CFSTR("fingerprint");
  +[WBSParsecSchema schemaWithExpectedClass:](WBSParsecSchema, "schemaWithExpectedClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecSchema schemaForDictionaryWithStructure:](WBSParsecSchema, "schemaForDictionaryWithStructure:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecSchema schemaForArrayWithElementSchema:](WBSParsecSchema, "schemaForArrayWithElementSchema:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecSchema schemaForDictionaryWithStructure:](WBSParsecSchema, "schemaForDictionaryWithStructure:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecSchema schemaForArrayWithElementSchema:](WBSParsecSchema, "schemaForArrayWithElementSchema:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = CFSTR("correction_sets");
  +[WBSParsecSchema schemaForDictionaryWithStructure:](WBSParsecSchema, "schemaForDictionaryWithStructure:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecSchema schemaForArrayWithElementSchema:](WBSParsecSchema, "schemaForArrayWithElementSchema:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariShared.FormAutoFillParsecCrowdsourcedCorrectionsErrorDomain"), 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecSchema schemaForDictionaryWithStructure:associatedError:](WBSParsecSchema, "schemaForDictionaryWithStructure:associatedError:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_schemaWithExpectedClass:(Class)a3 errorCode:(int64_t)a4 isOptional:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a5;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SafariShared.FormAutoFillParsecCrowdsourcedCorrectionsErrorDomain"), a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSParsecSchema schemaWithExpectedClass:associatedError:isOptional:](WBSParsecSchema, "schemaWithExpectedClass:associatedError:isOptional:", a3, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor)initWithCorrectionsStore:(id)a3
{
  id v5;
  WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor *v6;
  WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor *v7;
  WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor;
  v6 = -[WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_correctionsStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)getLastCorrectionsRetrievalURLStringWithResultHandler:(id)a3
{
  id v4;
  WBSFormAutoFillCorrectionsStore *correctionsStore;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  correctionsStore = self->_correctionsStore;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke;
  v7[3] = &unk_1E4B39520;
  v8 = v4;
  v6 = v4;
  -[WBSFormAutoFillCorrectionsStore getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:](correctionsStore, "getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:", v7);

}

void __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke_2;
  v6[3] = &unk_1E4B2B998;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __111__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_getLastCorrectionsRetrievalURLStringWithResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setCorrectionsWithJSONData:(id)a3 retrievalURLString:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  WBSFormAutoFillCorrectionsStore *correctionsStore;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor setCorrectionsWithJSONData:retrievalURLString:].cold.1(buf, objc_msgSend(v6, "length"), v8);

  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend((id)objc_opt_class(), "_correctionsSchema");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  correctionsStore = self->_correctionsStore;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke;
  v16[3] = &unk_1E4B39598;
  objc_copyWeak(&v20, &location);
  v13 = v10;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v15 = v11;
  v19 = v15;
  -[WBSFormAutoFillCorrectionsStore getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:](correctionsStore, "getLastCrowdsourcedCorrectionsRetrievalURLStringWithCompletionHandler:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained && a1[4] != v3 && (objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2;
    v6[3] = &unk_1E4B39570;
    objc_copyWeak(&v10, a1 + 7);
    v7 = a1[5];
    v8 = a1[6];
    v9 = a1[4];
    dispatch_async(v5, v6);

    objc_destroyWeak(&v10);
  }

}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id v5;
  WBSFormAutoFillClassificationToCorrectionsTransformer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WBSFormAutoFillCorrectionSet *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id *WeakRetained;
  void *v29;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t i;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v26 = a1;
    v2 = *(_QWORD *)(a1 + 32);
    v51 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v2, 0, &v51);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v51;
    if (v27)
    {
      v3 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_3(v3, v27);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 1;
      v4 = *(void **)(v26 + 40);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_20;
      v44[3] = &unk_1E4B39548;
      v5 = v29;
      v45 = v5;
      v46 = &v47;
      objc_msgSend(v4, "validateObject:withErrorHandler:", v5, v44);
      if (*((_BYTE *)v48 + 24))
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correction_sets"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count") == 1)
        {
          v24 = WeakRetained[1];
          v6 = objc_alloc_init(WBSFormAutoFillClassificationToCorrectionsTransformer);
          objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("origins"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          obj = v8;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
          if (v33)
          {
            v31 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v33; ++i)
              {
                if (*(_QWORD *)v41 != v31)
                  objc_enumerationMutation(obj);
                v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("origin"), v24);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("corrections"));
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = 0u;
                v39 = 0u;
                v36 = 0u;
                v37 = 0u;
                v12 = v10;
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
                if (v13)
                {
                  v14 = *(_QWORD *)v37;
                  do
                  {
                    for (j = 0; j != v13; ++j)
                    {
                      if (*(_QWORD *)v37 != v14)
                        objc_enumerationMutation(v12);
                      v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("fingerprint"));
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("corrections"));
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      -[WBSFormAutoFillClassificationToCorrectionsTransformer reverseTransformedValue:](v6, "reverseTransformedValue:", v18);
                      v19 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);
                    }
                    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
                  }
                  while (v13);
                }

                v20 = -[WBSFormAutoFillCorrectionSet initWithDomain:fingerprintsToClassifications:]([WBSFormAutoFillCorrectionSet alloc], "initWithDomain:fingerprintsToClassifications:", v34, v11);
                objc_msgSend(v32, "addObject:", v20);

              }
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
            }
            while (v33);
          }

          objc_msgSend(v24, "replaceCrowdsourcedCorrectionSetsWithCorrectionSets:retrievalURLString:completionHandler:", v32, *(_QWORD *)(v26 + 48), 0);
        }
        else
        {
          v23 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_1(v23);
        }

      }
      _Block_object_dispose(&v47, 8);
    }
    else
    {
      v21 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_2((uint64_t)v29, v21, v22);
    }

  }
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_20_cold_1(v4, v3, a1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionsStore, 0);
}

- (void)setCorrectionsWithJSONData:(os_log_t)log retrievalURLString:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_1A3D90000, log, OS_LOG_TYPE_DEBUG, "Setting cloud AutoFill corrections with JSON data of length %lu", buf, 0xCu);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Versions count is not 1 in correctionsDictionary", v1, 2u);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138477827;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Corrections JSON data is not of kind dictionary: %{private}@", (uint8_t *)&v3);
}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_2_cold_3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, v3, v5, "JSON deserialization failed with error: %{public}@", (uint8_t *)&v6);

}

void __103__WBSFormAutoFillParsecCrowdsourcedCorrectionsProcessor_setCorrectionsWithJSONData_retrievalURLString___block_invoke_20_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a3 + 32);
  v8 = 138543619;
  v9 = v6;
  v10 = 2113;
  v11 = v7;
  _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Failed to validate cloud AutoFill corrections: %{public}@, %{private}@", (uint8_t *)&v8, 0x16u);

}

@end
