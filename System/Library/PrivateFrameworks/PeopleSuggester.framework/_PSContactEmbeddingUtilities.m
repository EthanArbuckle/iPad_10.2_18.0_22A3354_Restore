@implementation _PSContactEmbeddingUtilities

+ (id)loadModelFromUrlResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("mlmodelc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v6 = (void *)getMLModelClass_softClass_3;
  v18 = getMLModelClass_softClass_3;
  if (!getMLModelClass_softClass_3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __getMLModelClass_block_invoke_3;
    v14[3] = &unk_1E43FEA00;
    v14[4] = &v15;
    __getMLModelClass_block_invoke_3((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v15, 8);
  v13 = 0;
  objc_msgSend(v7, "modelWithContentsOfURL:error:", v5, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v9)
  {
    +[_PSLogging contactEmbeddingChannel](_PSLogging, "contactEmbeddingChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[_PSContactEmbeddingUtilities loadModelFromUrlResource:].cold.1(v5, (uint64_t)v9, v10);

    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

+ (id)prepareFeatureInputFromFeatureDict:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "modelFeatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v7 = (void *)getMLMultiArrayClass_softClass_0;
  v25 = getMLMultiArrayClass_softClass_0;
  if (!getMLMultiArrayClass_softClass_0)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getMLMultiArrayClass_block_invoke_0;
    v21[3] = &unk_1E43FEA00;
    v21[4] = &v22;
    __getMLMultiArrayClass_block_invoke_0((uint64_t)v21);
    v7 = (void *)v23[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v22, 8);
  v9 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v12 = (void *)objc_msgSend(v9, "initWithShape:dataType:error:", v11, 65600, &v20);
  v13 = v20;

  if (v13)
  {
    +[_PSLogging contactEmbeddingChannel](_PSLogging, "contactEmbeddingChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[_PSContactEmbeddingUtilities prepareFeatureInputFromFeatureDict:].cold.1((uint64_t)v13, v14);

  }
  else
  {
    if (!v6)
    {
LABEL_12:
      v15 = v12;
      goto LABEL_13;
    }
    v16 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        break;
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v18, v16);

      if (v6 == ++v16)
        goto LABEL_12;
    }
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)modelFeatures
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;

  +[_PSConfig contactEmbeddingConfig](_PSConfig, "contactEmbeddingConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("_PSContactEmbeddingFeatures"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[_PSLogging contactEmbeddingChannel](_PSLogging, "contactEmbeddingChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[_PSContactEmbeddingUtilities modelFeatures].cold.1(v7);

    objc_msgSend(a1, "modelFeaturesBackup");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v6;

  return v8;
}

+ (id)modelFeaturesBackup
{
  return &unk_1E442C838;
}

+ (void)loadModelFromUrlResource:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1A07F4000, a3, OS_LOG_TYPE_ERROR, "Error loading compiled CoreML Model from path %@ : %@", (uint8_t *)&v6, 0x16u);

}

+ (void)prepareFeatureInputFromFeatureDict:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Error while creating input MultiArray : %@", (uint8_t *)&v2, 0xCu);
}

+ (void)modelFeatures
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "Error while trying to fetch ordered features from plist.", v1, 2u);
}

@end
