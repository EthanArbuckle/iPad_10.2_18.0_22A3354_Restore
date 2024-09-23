@implementation _PSFeaturePreprocessor

+ (id)rawDataToCandidateFeatureDict:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56___PSFeaturePreprocessor_rawDataToCandidateFeatureDict___block_invoke;
  v7[3] = &unk_1E4400C78;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

+ (id)oneHotEncodedFeatureNameForFeatureName:(id)a3 featureValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (objc_msgSend(v6, "timeBucketValue"))
  {
    objc_msgSend(v6, "timeBucketValue");
    BMMLSEVirtualFeatureStoreFeatureFeatureValuetimeBucketAsString();
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v6, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  objc_msgSend(v6, "stringValue");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v9;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@_%@"), v5, v9);

LABEL_8:
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[_PSFeaturePreprocessor oneHotEncodedFeatureNameForFeatureName:featureValue:].cold.1((uint64_t)v5, (uint64_t)v8, v11);

  return v8;
}

+ (id)getNumberFromVirtualFeatureValue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasIntValue"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "intValue"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "hasDoubleValue"))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hasBoolValue"))
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
LABEL_8:

  return v6;
}

+ (id)encodeFeatureVectors:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[16];

  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "Encoding feature dictionary", buf, 2u);
  }

  v6 = (void *)objc_opt_new();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47___PSFeaturePreprocessor_encodeFeatureVectors___block_invoke;
  v13 = &unk_1E4400CC8;
  v15 = a1;
  v7 = v6;
  v14 = v7;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v10);

  +[_PSLogging generalChannel](_PSLogging, "generalChannel", v10, v11, v12, v13);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v8, OS_LOG_TYPE_DEFAULT, "Finished encoding feature dictionary", buf, 2u);
  }

  return v7;
}

+ (void)oneHotEncodedFeatureNameForFeatureName:(os_log_t)log featureValue:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1A07F4000, log, OS_LOG_TYPE_DEBUG, "Feature name %@ produced one-hot feature name %@", (uint8_t *)&v3, 0x16u);
}

@end
