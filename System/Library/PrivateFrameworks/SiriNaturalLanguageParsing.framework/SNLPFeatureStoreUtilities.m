@implementation SNLPFeatureStoreUtilities

+ (BOOL)insertToFeatureStoreWithNLv4SpanResponse:(id)a3 interactionIdentifier:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v5, v6, CFSTR("NLv4SpanResponseAsJSON"));

  return v7;
}

+ (BOOL)insertToFeatureStoreWithNLv4ContextResponse:(id)a3 interactionIdentifier:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v5, v6, CFSTR("NLv4ContextResponseAsJSON"));

  return v7;
}

+ (BOOL)insertToFeatureStoreWithNLv4AssertVersion:(id)a3 interactionIdentifier:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v5, v6, CFSTR("NLv4AssetVersionAsJSON"));

  return v7;
}

+ (BOOL)insertToFeatureStoreWithNLv4ExecutedHandcraftedRules:(id)a3 interactionIdentifier:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v5, v6, CFSTR("NLv4ExecutedHandcraftedRulesAsJSON"));

  return v7;
}

+ (BOOL)insertToFeatureStoreWithITFMSpanResponse:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  +[SNLPITFMModelInfo stringForModelType:](SNLPITFMModelInfo, "stringForModelType:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-ITFMSpanResponseAsJSON"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v7, v8, v10);

  return v11;
}

+ (BOOL)insertToFeatureStoreWithITFMContextResponse:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  +[SNLPITFMModelInfo stringForModelType:](SNLPITFMModelInfo, "stringForModelType:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-ITFMContextResponseAsJSON"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v7, v8, v10);

  return v11;
}

+ (BOOL)insertToFeatureStoreWithITFMAssertVersion:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  +[SNLPITFMModelInfo stringForModelType:](SNLPITFMModelInfo, "stringForModelType:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-ITFMAssetVersionAsJSON"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v7, v8, v10);

  return v11;
}

+ (BOOL)insertToFeatureStoreWithITFMExecutedHandcraftedRules:(id)a3 interactionIdentifier:(id)a4 itfmModelType:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  +[SNLPITFMModelInfo stringForModelType:](SNLPITFMModelInfo, "stringForModelType:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-ITFMExecutedHandcraftedRulesAsJSON"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v7, v8, v10);

  return v11;
}

+ (BOOL)insertToFeatureStoreWithSSUEncodingResult:(id)a3 interactionIdentifier:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithProtobufObject:interactionIdentifier:streamIdentifier:", v5, v6, CFSTR("SSUEncodingResultAsJSON"));

  return v7;
}

+ (id)_jsonStringFromProtobufObject:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v10;

  objc_msgSend(a3, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (!v4)
  {
    v6 = SNLPOSLoggerForCategory(0);
    v7 = (id)objc_msgSend(v5, "localizedDescription");
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);

  return v8;
}

+ (BOOL)_insertToFeatureStoreWithProtobufObject:(id)a3 interactionIdentifier:(id)a4 streamIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "_jsonStringFromProtobufObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "_insertToFeatureStoreWithJSONString:interactionIdentifier:streamIdentifier:", v10, v8, v9);

  return v11;
}

+ (BOOL)_insertToFeatureStoreWithJSONString:(id)a3 interactionIdentifier:(id)a4 streamIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (+[SNLPFeatureFlagUtilities isSNLPFeatureStoreEnabled](SNLPFeatureFlagUtilities, "isSNLPFeatureStoreEnabled"))
  {
    SNLPOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1C2196000, v10, OS_LOG_TYPE_DEBUG, "Inserting FeatureStore entry with interactionIdentifier=%@, streamIdentifier=%@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D20F70], "getWithStreamId:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D20F68]), "initWithJsonStr:interactionId:dataVersion:", v7, v8, 1);
    v19 = 0;
    v13 = objc_msgSend(v11, "insert:error:", v12, &v19);
    v14 = v19;
    if ((v13 & 1) == 0)
    {
      v15 = SNLPOSLoggerForCategory(0);
      v16 = (id)objc_msgSend(v14, "localizedDescription");
    }

  }
  else
  {
    v17 = SNLPOSLoggerForCategory(0);
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)itfmModelTypeForSNLPComponent:(const int *)a3
{
  unint64_t result;
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  result = *(unsigned int *)a3;
  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result == 4)
    {
      return 2;
    }
    else
    {
      v5 = SNLPOSLoggerForCategory(0);
      v6 = *a3;
      if (v6 >= 8)
      {
        SNLPOSLoggerForCategory(4);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = 136315394;
          v9 = "<UNDEFINED_COMPONENT>";
          v10 = 2048;
          v11 = v6;
          _os_log_impl(&dword_1C2196000, v7, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", (uint8_t *)&v8, 0x16u);
        }

      }
      return 0;
    }
  }
  return result;
}

@end
