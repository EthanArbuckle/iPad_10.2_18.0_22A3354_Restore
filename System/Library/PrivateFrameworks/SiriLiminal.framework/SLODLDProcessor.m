@implementation SLODLDProcessor

- (SLODLDProcessor)initWithConfigFile:(id)a3 error:(id *)a4
{
  id v6;
  SLODLDProcessor *v7;
  NSObject *v8;
  SLODLDConfigDecoder *v9;
  SLODLDConfigDecoder *config;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SLODLDProcessor *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SLODLDProcessor;
  v7 = -[SLODLDProcessor init](&v20, sel_init);
  if (!v7)
  {
LABEL_17:
    v17 = v7;
    goto LABEL_18;
  }
  if (SLLogInitIfNeeded_once != -1)
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  v8 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SLODLDProcessor initWithConfigFile:error:]";
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_213B50000, v8, OS_LOG_TYPE_INFO, "%s Reading from configFile %@", buf, 0x16u);
  }
  v9 = -[SLODLDConfigDecoder initWithConfigFile:]([SLODLDConfigDecoder alloc], "initWithConfigFile:", v6);
  config = v7->_config;
  v7->_config = v9;

  if (!v7->_config)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to decode config file %@"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLUtils createErrorWithMsg:code:](SLUtils, "createErrorWithMsg:code:", v14, 111);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a4)
      *a4 = objc_retainAutorelease(v15);

    goto LABEL_13;
  }
  -[SLODLDProcessor _setupPipelineComponentsUsingConfig:](v7, "_setupPipelineComponentsUsingConfig:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!a4 || !v11)
  {
    v18 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[SLODLDProcessor initWithConfigFile:error:]";
      _os_log_impl(&dword_213B50000, v18, OS_LOG_TYPE_DEFAULT, "%s Created ODLD Processor Pipelines", buf, 0xCu);
    }

    goto LABEL_17;
  }
  v13 = objc_retainAutorelease(v11);
  *a4 = v13;

LABEL_13:
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)_setupPipelineComponentsUsingConfig:(id)a3
{
  id v4;
  uint64_t v5;
  SLODLDPreProcessingComponent *v6;
  SLODLDPreProcessingComponent *preprocessor;
  NSObject *v8;
  SLODLDPreProcessingComponent *v9;
  uint64_t v10;
  SLODLDTokenizerComponent *v11;
  SLODLDTokenizerComponent *tokenizer;
  NSObject *v13;
  SLODLDTokenizerComponent *v14;
  void *v15;
  void *v16;
  SLODLDClassifierV1 *v17;
  SLODLDClassifierV1 *v18;
  void *v19;
  SLODLDClassifierV1 *v20;
  NSObject *v21;
  SLODLDClassifierV1 *model;
  void *v23;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  SLODLDPreProcessingComponent *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "getPreProcessorType");
  -[SLODLDProcessor _getPreprocessorForType:withConfig:](self, "_getPreprocessorForType:withConfig:", v5, v4);
  v6 = (SLODLDPreProcessingComponent *)objc_claimAutoreleasedReturnValue();
  preprocessor = self->_preprocessor;
  self->_preprocessor = v6;

  v8 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_preprocessor;
    v25 = 136315650;
    v26 = "-[SLODLDProcessor _setupPipelineComponentsUsingConfig:]";
    v27 = 2048;
    v28 = v5;
    v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_213B50000, v8, OS_LOG_TYPE_DEFAULT, "%s PreProcessorType: %lu PreProcessor %@", (uint8_t *)&v25, 0x20u);
  }
  v10 = objc_msgSend(v4, "getTokenizerType");
  -[SLODLDProcessor _getTokenizerForType:withConfig:](self, "_getTokenizerForType:withConfig:", v10, v4);
  v11 = (SLODLDTokenizerComponent *)objc_claimAutoreleasedReturnValue();
  tokenizer = self->_tokenizer;
  self->_tokenizer = v11;

  v13 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_tokenizer;
    v25 = 136315650;
    v26 = "-[SLODLDProcessor _setupPipelineComponentsUsingConfig:]";
    v27 = 2048;
    v28 = v10;
    v29 = 2112;
    v30 = v14;
    _os_log_impl(&dword_213B50000, v13, OS_LOG_TYPE_DEFAULT, "%s TokenizerType: %lu Tokenizer %@", (uint8_t *)&v25, 0x20u);
  }
  if (self->_tokenizer)
  {
    objc_msgSend(v4, "getBertModelFile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getOdldModelBnnsIrWeightFile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [SLODLDClassifierV1 alloc];
    if (v16)
      v18 = -[SLODLDClassifierV1 initWithConfigFile:bnnsIrWeightPath:](v17, "initWithConfigFile:bnnsIrWeightPath:", v15, v16);
    else
      v18 = -[SLODLDClassifierV1 initWithConfigFile:](v17, "initWithConfigFile:", v15);
    v20 = v18;
    if (v18)
      objc_storeStrong((id *)&self->_model, v18);
    v21 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      model = self->_model;
      v25 = 136315394;
      v26 = "-[SLODLDProcessor _setupPipelineComponentsUsingConfig:]";
      v27 = 2112;
      v28 = (uint64_t)model;
      _os_log_impl(&dword_213B50000, v21, OS_LOG_TYPE_DEFAULT, "%s Classifier %@", (uint8_t *)&v25, 0x16u);
    }
    if (self->_model)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create ODLD model"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[SLUtils createErrorWithMsg:code:](SLUtils, "createErrorWithMsg:code:", v23, 113);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create tokenizer"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLUtils createErrorWithMsg:code:](SLUtils, "createErrorWithMsg:code:", v15, 112);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)processInputUtterance:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315138;
    v6 = "-[SLODLDProcessor processInputUtterance:]";
    _os_log_error_impl(&dword_213B50000, v3, OS_LOG_TYPE_ERROR, "%s Unimplemented method called", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

- (id)getEncodedTokensForUtt:(id)a3
{
  id v4;
  id v5;
  SLODLDPreProcessingComponent *preprocessor;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 || !objc_msgSend(0, "length"))
  {
    v5 = v4;
    preprocessor = self->_preprocessor;
    if (preprocessor)
    {
      -[SLODLDPreProcessingComponent applyPreprocessingOnUtt:](preprocessor, "applyPreprocessingOnUtt:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    -[SLODLDTokenizerComponent encodeUtterance:](self->_tokenizer, "encodeUtterance:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[SLODLDProcessor getEncodedTokensForUtt:]";
      _os_log_error_impl(&dword_213B50000, v9, OS_LOG_TYPE_ERROR, "%s Empty input", (uint8_t *)&v11, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (id)processInputContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SLODLDClassifierV1 *model;
  id v8;
  NSObject *v9;
  float v10;
  float v11;
  float v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "inputUtt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLODLDProcessor getEncodedTokensForUtt:](self, "getEncodedTokensForUtt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__589;
  v22 = __Block_byref_object_dispose__590;
  v23 = 0;
  model = self->_model;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __39__SLODLDProcessor_processInputContext___block_invoke;
  v15[3] = &unk_24D0C6290;
  v17 = &v18;
  v15[4] = self;
  v8 = v6;
  v16 = v8;
  -[SLODLDClassifierV1 processEncodedTokens:withContext:withCompletion:](model, "processEncodedTokens:withContext:withCompletion:", v8, v4, v15);
  v9 = (id)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)v19[5], "odldScore");
    v11 = v10;
    objc_msgSend((id)v19[5], "outputAnchor");
    *(_DWORD *)buf = 136315650;
    v25 = "-[SLODLDProcessor processInputContext:]";
    v26 = 2048;
    v27 = v11;
    v28 = 2048;
    v29 = v12;
    _os_log_impl(&dword_213B50000, v9, OS_LOG_TYPE_DEFAULT, "%s output %f, social score %f", buf, 0x20u);
  }

  v13 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)_getPreprocessorForType:(unint64_t)a3 withConfig:(id)a4
{
  id v4;
  SLRegexMatcher *v5;
  void *v6;
  SLRegexMatcher *v7;

  if (a3 == 1)
  {
    v4 = a4;
    v5 = [SLRegexMatcher alloc];
    objc_msgSend(v4, "getRegexMapConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[SLRegexMatcher initWithConfigFile:](v5, "initWithConfigFile:", v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_getTokenizerForType:(unint64_t)a3 withConfig:(id)a4
{
  id v4;
  uint64_t v5;
  SLSentencePieceModule *v6;
  void *v7;
  SLSentencePieceModule *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a3 == 1)
  {
    v4 = a4;
    v5 = objc_msgSend(v4, "isSPMModelMmapable");
    v6 = [SLSentencePieceModule alloc];
    objc_msgSend(v4, "getSPMModelFile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SLSentencePieceModule initWithConfigFile:isModelMmap:](v6, "initWithConfigFile:isModelMmap:", v7, v5);

    objc_msgSend(v4, "getSPMEncoderOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[SLSentencePieceModule setSPMEncoderOptions:](v8, "setSPMEncoderOptions:", v9);
      v11 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315650;
        v14 = "-[SLODLDProcessor _getTokenizerForType:withConfig:]";
        v15 = 2112;
        v16 = v9;
        v17 = 2048;
        v18 = v10;
        _os_log_impl(&dword_213B50000, v11, OS_LOG_TYPE_DEFAULT, "%s Setting SPM encoder options %@ with status %ld", (uint8_t *)&v13, 0x20u);
      }
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (SLODLDConfigDecoder)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (SLODLDPreProcessingComponent)preprocessor
{
  return self->_preprocessor;
}

- (void)setPreprocessor:(id)a3
{
  objc_storeStrong((id *)&self->_preprocessor, a3);
}

- (SLODLDTokenizerComponent)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizer, a3);
}

- (SLODLDClassifierV1)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_preprocessor, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

void __39__SLODLDProcessor_processInputContext___block_invoke(_QWORD *a1, float a2, float a3)
{
  SLODLDProcessorResult *v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = [SLODLDProcessorResult alloc];
  objc_msgSend(*(id *)(a1[4] + 8), "getConfigVersion");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a2;
  *(float *)&v8 = a3;
  v9 = -[SLODLDProcessorResult initWithScore:withVersion:tokens:features:outputEmb:outputAnchor:](v6, "initWithScore:withVersion:tokens:features:outputEmb:outputAnchor:", v12, a1[5], 0, 0, v7, v8);
  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

@end
