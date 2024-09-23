@implementation SiriNLUInternalTypesConverter

+ (id)convertToSubwordEmbeddingResponse:(id)a3
{
  id v3;
  SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse);
    objc_msgSend(v3, "subwordTokenChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse setSubwordTokenChain:](v4, "setSubwordTokenChain:", v5);

    objc_msgSend(v3, "subwordEmbeddingTensorOutputs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingResponse setSubwordTokenEmbedding:](v4, "setSubwordTokenEmbedding:", v7);

  }
  else
  {
    loggerContext(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "+[SiriNLUInternalTypesConverter convertToSubwordEmbeddingResponse:]";
      _os_log_impl(&dword_1C1D3C000, v8, OS_LOG_TYPE_INFO, "%s [WARN]: Input EmbeddingResponse to convertToSubwordEmbeddingResponse function is nil, and therefore returning nil", (uint8_t *)&v10, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

@end
