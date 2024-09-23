@implementation PSFeaturePreprocessor

void __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke_2;
  v9[3] = &unk_1E4400C50;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);
}

void __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0D020D0]);
    v7 = v13;
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0D020D0]);
    v7 = 0;
    goto LABEL_8;
  }
  v8 = objc_msgSend(CFSTR("true"), "compare:options:", v13, 3);
  if (!v8 || !objc_msgSend(CFSTR("false"), "compare:options:", v13, 3))
  {
    v11 = objc_alloc(MEMORY[0x1E0D020D0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 == 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, 0, 0, v12, 0);

    goto LABEL_10;
  }
  v6 = objc_alloc(MEMORY[0x1E0D020D0]);
  v7 = 0;
  v9 = v13;
LABEL_9:
  v10 = (void *)objc_msgSend(v6, "initWithIntValue:doubleValue:stringValue:BOOLValue:timeBucketValue:", 0, v7, v9, 0, 0);
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v5);

}

void __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2;
  v11[3] = &unk_1E4400CA0;
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v12 = v7;
  v9 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v9);
}

void __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 48), "oneHotEncodedFeatureNameForFeatureName:featureValue:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E442AF28, v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "getNumberFromVirtualFeatureValue:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = 138412803;
        v13 = v6;
        v14 = 2112;
        v15 = v8;
        v16 = 2113;
        v17 = v11;
        _os_log_debug_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_DEBUG, "Feature value %@ produced encoded value %@ for candidate %{private}@", (uint8_t *)&v12, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v5);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2_cold_1((uint64_t)v5, v10);

    }
  }

}

void __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Feature %@ unexpectedly produced a nil value", (uint8_t *)&v2, 0xCu);
}

@end
