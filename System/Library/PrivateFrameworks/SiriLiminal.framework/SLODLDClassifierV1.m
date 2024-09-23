@implementation SLODLDClassifierV1

- (SLODLDClassifierV1)initWithConfigFile:(id)a3 bnnsIrWeightPath:(id)a4
{
  id v6;
  id v7;
  SLODLDClassifierV1 *v8;
  uint64_t v9;
  id v10;
  CSFModelComputeBackend *odldClassifier;
  BOOL v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  SLODLDClassifierV1 *v16;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SLODLDClassifierV1;
  v8 = -[SLODLDClassifierV1 init](&v19, sel_init);
  if (!v8)
    goto LABEL_13;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BE28420], "provideComputeBackendWithModelFile:separateWeight:error:", v6, v7, &v18);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v18;
  odldClassifier = v8->_odldClassifier;
  v8->_odldClassifier = (CSFModelComputeBackend *)v9;

  if (v8->_odldClassifier)
    v12 = v10 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[SLODLDClassifierV1 initWithConfigFile:bnnsIrWeightPath:]";
      v22 = 2112;
      v23 = v10;
      v14 = "%s model init error: %@";
LABEL_11:
      _os_log_impl(&dword_213B50000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  -[SLODLDClassifierV1 _extractModelSpecs](v8, "_extractModelSpecs");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
LABEL_13:
    v16 = v8;
    goto LABEL_14;
  }
  v10 = (id)v15;
  v13 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SLODLDClassifierV1 initWithConfigFile:bnnsIrWeightPath:]";
    v22 = 2112;
    v23 = v10;
    v14 = "%s model init error with model specs extraction: %@";
    goto LABEL_11;
  }
LABEL_12:

  v16 = 0;
LABEL_14:

  return v16;
}

- (SLODLDClassifierV1)initWithConfigFile:(id)a3
{
  return -[SLODLDClassifierV1 initWithConfigFile:bnnsIrWeightPath:](self, "initWithConfigFile:bnnsIrWeightPath:", a3, 0);
}

- (float)processEncodedTokens:(id)a3
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
    v6 = "-[SLODLDClassifierV1 processEncodedTokens:]";
    _os_log_error_impl(&dword_213B50000, v3, OS_LOG_TYPE_ERROR, "%s Unable to process tokens without context", (uint8_t *)&v5, 0xCu);
  }
  return -1.0;
}

- (void)processEncodedTokens:(id)a3 withContext:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, float, float);
  void *v11;
  CSFModelComputeBackend *odldClassifier;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSArray *outputNodes;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _BYTE *v24;
  uint64_t *v25;
  uint64_t v26;
  float *v27;
  uint64_t v28;
  int v29;
  id v30;
  _BYTE buf[24];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD, float, float))a5;
  -[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:](self, "_constructFeatureDictionary:withCtx:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    odldClassifier = self->_odldClassifier;
    v30 = 0;
    -[CSFModelComputeBackend predictOutputWithInputs:errOut:](odldClassifier, "predictOutputWithInputs:errOut:", v11, &v30);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30;
    if (v14)
    {
      v15 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 processEncodedTokens:withContext:withCompletion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_impl(&dword_213B50000, v15, OS_LOG_TYPE_DEFAULT, "%s error when executing :%@", buf, 0x16u);
      }
      if (v10)
        v10[2](v10, -1.0, -1.0);
    }
    v16 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 processEncodedTokens:withContext:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_213B50000, v16, OS_LOG_TYPE_DEFAULT, "%s outputs from Odld classifier: %@", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LODWORD(v32) = -1082130432;
    v26 = 0;
    v27 = (float *)&v26;
    v28 = 0x2020000000;
    v29 = -1082130432;
    outputNodes = self->_outputNodes;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __70__SLODLDClassifierV1_processEncodedTokens_withContext_withCompletion___block_invoke;
    v22[3] = &unk_24D0C6108;
    v18 = v13;
    v23 = v18;
    v24 = buf;
    v25 = &v26;
    -[NSArray enumerateObjectsUsingBlock:](outputNodes, "enumerateObjectsUsingBlock:", v22);
    if (v10)
      v10[2](v10, *(float *)(*(_QWORD *)&buf[8] + 24), v27[6]);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v19 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      objc_msgSend(0, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 processEncodedTokens:withContext:withCompletion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      v32 = 0;
      _os_log_error_impl(&dword_213B50000, v20, OS_LOG_TYPE_ERROR, "%s Unable to create feature dict with error %@ from %@", buf, 0x20u);

    }
    if (v10)
      v10[2](v10, -1.0, -1.0);
  }

}

- (id)_extractModelSpecs
{
  NSDictionary *v3;
  NSDictionary *inputSpecs;
  NSDictionary *v5;
  void *v6;
  NSArray *v7;
  NSArray *outputNodes;
  NSArray *v9;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[CSFModelComputeBackend getExpectedInputTensors](self->_odldClassifier, "getExpectedInputTensors");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  inputSpecs = self->_inputSpecs;
  self->_inputSpecs = v3;

  v5 = self->_inputSpecs;
  if (v5 && -[NSDictionary count](v5, "count"))
  {
    -[CSFModelComputeBackend getExpectedOutputTensors](self->_odldClassifier, "getExpectedOutputTensors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    outputNodes = self->_outputNodes;
    self->_outputNodes = v7;

    v9 = self->_outputNodes;
    if (v9 && -[NSArray count](v9, "count"))
      return 0;
    v15 = objc_alloc(MEMORY[0x24BDD1540]);
    v16 = *MEMORY[0x24BDD0FC8];
    v17 = CFSTR("cannot get outputNodes");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 117, v12);
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BDD1540]);
    v18 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cannot get shape for input"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 117, v13);

  }
  return v14;
}

- (id)_createDataBufferForTensor:(id)a3 withData:(id)a4 properties:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(MEMORY[0x24BE28428], "getRankOfTensor:", v8);
  if (v10 < 0
    || (v11 = v10,
        objc_msgSend(v9, "shape"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "count"),
        v12,
        v11 != v13))
  {
    v17 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SLODLDClassifierV1 _createDataBufferForTensor:withData:properties:]";
      v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_213B50000, v17, OS_LOG_TYPE_ERROR, "%s Invalid or mismatched shape for tensor: %@", buf, 0x16u);
    }
    v16 = 0;
  }
  else
  {
    v20 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28418]), "initWithInputArray:name:properties:errOut:", v8, v7, v9, &v20);
    v15 = v20;
    if (v15 || !v14)
    {
      v18 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[SLODLDClassifierV1 _createDataBufferForTensor:withData:properties:]";
        v23 = 2112;
        v24 = v7;
        _os_log_error_impl(&dword_213B50000, v18, OS_LOG_TYPE_ERROR, "%s Unable to create data buffer for tensor: %@", buf, 0x16u);
      }
      v16 = 0;
    }
    else
    {
      v16 = v14;
    }

  }
  return v16;
}

- (id)_constructFeatureDictionary:(id)a3 withCtx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SLODLDInputTokenParams *v10;
  SLODLDInputTokenParams *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  SLODLDInputTokenParams *v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *v23;
  NSObject *v24;
  NSDictionary *inputSpecs;
  NSObject *v26;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  SLODLDInputTokenParams *v31;
  SLODLDInputTokenParams *v32;
  id v33;
  SLODLDClassifierV1 *v34;
  _QWORD *v35;
  _QWORD *v36;
  _BYTE *v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  _BYTE v46[20];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSDictionary objectForKeyedSubscript:](self->_inputSpecs, "objectForKeyedSubscript:", CFSTR("minibatch_input_ids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shape");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SLODLDInputTokenParams initWithShape:]([SLODLDInputTokenParams alloc], "initWithShape:", v9);
  v11 = v10;
  if (v10)
  {
    v43 = 0;
    -[SLODLDInputTokenParams populateWithTokens:error:](v10, "populateWithTokens:error:", v6, &v43);
    v12 = v43;
    if (v12)
    {
      v13 = v12;
      v14 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_error_impl(&dword_213B50000, v14, OS_LOG_TYPE_ERROR, "%s Unable to populate current token parameters with error: %@", buf, 0x16u);
      }
      v15 = 0;
      goto LABEL_22;
    }
    v17 = -[SLODLDInputTokenParams initWithShape:]([SLODLDInputTokenParams alloc], "initWithShape:", v9);
    objc_msgSend(v7, "prevTokens");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count") == 0;

    if (!v19)
    {
      if (!v17)
      {
        v26 = SLLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
          _os_log_error_impl(&dword_213B50000, v26, OS_LOG_TYPE_ERROR, "%s Unable to create previous token params", buf, 0xCu);
        }
        v13 = 0;
        goto LABEL_20;
      }
      objc_msgSend(v7, "prevTokens");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      -[SLODLDInputTokenParams populateWithTokens:error:](v17, "populateWithTokens:error:", v20, &v42);
      v13 = v42;

      v21 = (void *)SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
      {
        v28 = v21;
        objc_msgSend(v7, "prevTokens");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[SLODLDInputTokenParams mlAttnMask](v17, "mlAttnMask");
        v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        -[SLODLDInputTokenParams mlInputIds](v17, "mlInputIds");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2112;
        v45 = v22;
        *(_WORD *)v46 = 2112;
        *(_QWORD *)&v46[2] = v23;
        *(_WORD *)&v46[10] = 2112;
        *(_QWORD *)&v46[12] = v13;
        _os_log_impl(&dword_213B50000, v28, OS_LOG_TYPE_INFO, "%s Setting prevtoks %@, paramAttnMask %@,  paraIpids %@ with error: %@", buf, 0x34u);

      }
      if (v13)
      {
        v24 = SLLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v13;
          _os_log_error_impl(&dword_213B50000, v24, OS_LOG_TYPE_ERROR, "%s Unable to populate previous token parameters with error: %@", buf, 0x16u);
        }
LABEL_20:
        v15 = 0;
        goto LABEL_21;
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    *(_QWORD *)v46 = __Block_byref_object_dispose_;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    *(_QWORD *)&v46[8] = objc_claimAutoreleasedReturnValue();
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy_;
    v40[4] = __Block_byref_object_dispose_;
    v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy_;
    v38[4] = __Block_byref_object_dispose_;
    v39 = 0;
    inputSpecs = self->_inputSpecs;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __58__SLODLDClassifierV1__constructFeatureDictionary_withCtx___block_invoke;
    v30[3] = &unk_24D0C6130;
    v35 = v38;
    v31 = v11;
    v32 = v17;
    v33 = v7;
    v34 = self;
    v36 = v40;
    v37 = buf;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inputSpecs, "enumerateKeysAndObjectsUsingBlock:", v30);
    v15 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);

    _Block_object_dispose(buf, 8);
    v13 = 0;
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  v16 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]";
    _os_log_error_impl(&dword_213B50000, v16, OS_LOG_TYPE_ERROR, "%s Unable to create current token params", buf, 0xCu);
  }
  v15 = 0;
LABEL_23:

  return v15;
}

- (CSFModelComputeBackend)odldClassifier
{
  return self->_odldClassifier;
}

- (void)setOdldClassifier:(id)a3
{
  objc_storeStrong((id *)&self->_odldClassifier, a3);
}

- (NSArray)outputNodes
{
  return self->_outputNodes;
}

- (void)setOutputNodes:(id)a3
{
  objc_storeStrong((id *)&self->_outputNodes, a3);
}

- (NSDictionary)inputSpecs
{
  return self->_inputSpecs;
}

- (void)setInputSpecs:(id)a3
{
  objc_storeStrong((id *)&self->_inputSpecs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputSpecs, 0);
  objc_storeStrong((id *)&self->_outputNodes, 0);
  objc_storeStrong((id *)&self->_odldClassifier, 0);
}

void __58__SLODLDClassifierV1__constructFeatureDictionary_withCtx___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_attention_mask")))
  {
    objc_msgSend(*(id *)(a1 + 32), "mlAttnMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = (void **)v36;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_input_ids")))
  {
    objc_msgSend(*(id *)(a1 + 32), "mlInputIds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v35;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_token_type_ids")))
  {
    objc_msgSend(*(id *)(a1 + 32), "mlTypeIds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v34;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_padding_mask")))
  {
    objc_msgSend(*(id *)(a1 + 32), "mlPadMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v33;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_prev_attention_mask")))
  {
    objc_msgSend(*(id *)(a1 + 40), "mlAttnMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v32;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_prev_input_ids")))
  {
    objc_msgSend(*(id *)(a1 + 40), "mlInputIds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v31;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_prev_token_type_ids")))
  {
    objc_msgSend(*(id *)(a1 + 40), "mlTypeIds");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v30;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_prev_padding_mask")))
  {
    objc_msgSend(*(id *)(a1 + 40), "mlPadMask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v29;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_input_origin")))
  {
    objc_msgSend(*(id *)(a1 + 48), "inputOrigin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v28;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("minibatch_anchor_social_score")))
      goto LABEL_22;
    objc_msgSend(*(id *)(a1 + 48), "inputAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = &v27;
  }
  objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

LABEL_22:
  objc_msgSend(*(id *)(a1 + 56), "_createDataBufferForTensor:withData:properties:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setObject:forKey:", v18, v7);
  }
  else
  {
    v19 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v21 = 136315650;
      v22 = "-[SLODLDClassifierV1 _constructFeatureDictionary:withCtx:]_block_invoke";
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v20;
      _os_log_error_impl(&dword_213B50000, v19, OS_LOG_TYPE_ERROR, "%s Unbale to create input buffer for tensor: %@ with value: %@", (uint8_t *)&v21, 0x20u);
    }
    *a4 = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "removeAllObjects");
  }

}

void __70__SLODLDClassifierV1_processEncodedTokens_withContext_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertDataToArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("output_prob")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("minibatch_score_odld")))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = a1 + 40;
  }
  else
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("minibatch_score_social")))
      goto LABEL_5;
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = a1 + 48;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24) = v6;

LABEL_5:
}

@end
