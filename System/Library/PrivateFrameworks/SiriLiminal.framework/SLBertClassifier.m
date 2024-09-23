@implementation SLBertClassifier

- (SLBertClassifier)initWithConfig:(id)a3 error:(id *)a4 locale:(id)a5
{
  id v8;
  id v9;
  SLBertClassifier *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *unkToken;
  void *v20;
  uint64_t v21;
  NSString *assetVersion;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL *p_shouldAppendLeadingText;
  void *v29;
  uint64_t v30;
  NSString *outputNodeName;
  NSString **p_outputNodeName;
  void *v33;
  uint64_t v34;
  NSArray *truncationTokenList;
  NSArray **p_truncationTokenList;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  int v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  MLModel *bertModel;
  NSObject *v47;
  NSArray *vocab;
  NSObject *v49;
  uint64_t v50;
  NSString *v51;
  uint64_t v52;
  SLBertClassifier *v53;
  void *v55;
  id v56;
  void *v57;
  id v58;
  objc_super v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  NSString *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v59.receiver = self;
  v59.super_class = (Class)SLBertClassifier;
  v10 = -[SLBertClassifier init](&v59, sel_init);
  if (!v10)
    goto LABEL_44;
  if (SLLogInitIfNeeded_once != -1)
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  objc_msgSend(MEMORY[0x24BE28430], "decodeJsonFromFile:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing config for Bert Classifier %@"), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD1540];
    v70 = CFSTR("reason");
    v71[0] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 108, v25);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);

      goto LABEL_15;
    }

  }
  if ((objc_msgSend(v9, "containsString:", CFSTR("en")) & 1) != 0)
    goto LABEL_9;
  v12 = (void *)MEMORY[0x24BDD1540];
  v68 = CFSTR("reason");
  v69 = CFSTR("Non en locales supported yet");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 110, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_9:
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("vocabFile"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v55 = (void *)v17;
    -[SLBertClassifier _readVocabFromFile:](v10, "_readVocabFromFile:", v17);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("unkToken"));
    v18 = objc_claimAutoreleasedReturnValue();
    unkToken = v10->_unkToken;
    v10->_unkToken = (NSString *)v18;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("version"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("version"));
      v21 = objc_claimAutoreleasedReturnValue();
      assetVersion = v10->_assetVersion;
      v10->_assetVersion = (NSString *)v21;
    }
    else
    {
      assetVersion = v10->_assetVersion;
      v10->_assetVersion = (NSString *)CFSTR("default");
    }
    v56 = v9;

    v10->_numLeadingTokens = 1;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("leadingText"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("leadingText"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_shouldAppendLeadingText = objc_msgSend(v27, "BOOLValue");
      p_shouldAppendLeadingText = &v10->_shouldAppendLeadingText;

    }
    else
    {
      v10->_shouldAppendLeadingText = 1;
      p_shouldAppendLeadingText = &v10->_shouldAppendLeadingText;
    }

    if (*p_shouldAppendLeadingText)
      v10->_numLeadingTokens = 3;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("outputNodeName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("outputNodeName"));
      v30 = objc_claimAutoreleasedReturnValue();
      p_outputNodeName = &v10->_outputNodeName;
      outputNodeName = v10->_outputNodeName;
      v10->_outputNodeName = (NSString *)v30;
    }
    else
    {
      p_outputNodeName = &v10->_outputNodeName;
      outputNodeName = v10->_outputNodeName;
      v10->_outputNodeName = 0;
    }

    v57 = v15;
    if (!*p_outputNodeName)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing output name for Bert Classifier %@"), v11);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x24BDD1540];
      v66 = CFSTR("reason");
      v67 = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 108, v39);
      v40 = (id)objc_claimAutoreleasedReturnValue();

      if (v40)
      {
        if (a4)
        {
          v40 = objc_retainAutorelease(v40);
          *a4 = v40;
        }
        v41 = 1;
LABEL_42:
        v9 = v56;

        if (v41)
          goto LABEL_43;
LABEL_44:
        v53 = v10;
        goto LABEL_45;
      }

      v15 = v57;
    }
    *(_OWORD *)&v10->_maxInputCharsPerWord = xmmword_213BAD490;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("truncationList"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("truncationList"));
      v34 = objc_claimAutoreleasedReturnValue();
      p_truncationTokenList = &v10->_truncationTokenList;
      truncationTokenList = v10->_truncationTokenList;
      v10->_truncationTokenList = (NSArray *)v34;
    }
    else
    {
      p_truncationTokenList = &v10->_truncationTokenList;
      truncationTokenList = v10->_truncationTokenList;
      v10->_truncationTokenList = (NSArray *)&unk_24D0CB3E8;
    }

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("modelFile"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v42);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v37);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
    objc_msgSend(v44, "setComputeUnits:", 0);
    v58 = 0;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v43, v44, &v58);
    v45 = objc_claimAutoreleasedReturnValue();
    v40 = v58;
    bertModel = v10->_bertModel;
    v10->_bertModel = (MLModel *)v45;

    if (v40)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v40);
      v41 = 1;
    }
    else
    {
      v47 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        vocab = v10->_vocab;
        v49 = v47;
        v50 = -[NSArray count](vocab, "count");
        v51 = v10->_unkToken;
        *(_DWORD *)buf = 136315650;
        v61 = "-[SLBertClassifier initWithConfig:error:locale:]";
        v62 = 2048;
        v63 = v50;
        v64 = 2112;
        v65 = v51;
        _os_log_impl(&dword_213B50000, v49, OS_LOG_TYPE_DEFAULT, "%s VocabList size: %lu UnkToken %@", buf, 0x20u);

        v47 = SLLogContextFacilityCoreSpeech;
      }
      v41 = 0;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v52 = (uint64_t)*p_truncationTokenList;
        *(_DWORD *)buf = 136315394;
        v61 = "-[SLBertClassifier initWithConfig:error:locale:]";
        v62 = 2112;
        v63 = v52;
        _os_log_impl(&dword_213B50000, v47, OS_LOG_TYPE_DEFAULT, "%s Truncation list: %@", buf, 0x16u);
        v41 = 0;
      }
    }

    goto LABEL_42;
  }
  if (a4)
  {
    v14 = objc_retainAutorelease(v14);
    *a4 = v14;
  }
LABEL_15:

LABEL_43:
  v53 = 0;
LABEL_45:

  return v53;
}

- (id)processSpeechPackage:(id)a3
{
  void *v4;
  void *v5;

  +[SLASRFeatureExtractor getBestSpeechRecognitionTextFromPackage:](SLASRFeatureExtractor, "getBestSpeechRecognitionTextFromPackage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLBertClassifier processInputText:](self, "processInputText:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)processInputText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SLBertClassifier _normalizeText:](self, "_normalizeText:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLBertClassifier _wordPieceTokenizer:](self, "_wordPieceTokenizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLBertClassifier _createInputIdsAndRunModel:](self, "_createInputIdsAndRunModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_readVocabFromFile:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *vocab;
  NSArray *v10;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", a3, 4, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  vocab = self->_vocab;
  self->_vocab = v8;

  v10 = self->_vocab;
  self->_vocab = v7;

}

- (id)_normalizeText:(id)a3
{
  id v4;
  NSArray *truncationTokenList;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__491;
  v13 = __Block_byref_object_dispose__492;
  objc_msgSend(v4, "lowercaseString");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  truncationTokenList = self->_truncationTokenList;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__SLBertClassifier__normalizeText___block_invoke;
  v8[3] = &unk_24D0C6240;
  v8[4] = self;
  v8[5] = &v9;
  -[NSArray enumerateObjectsUsingBlock:](truncationTokenList, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_createInputIdsAndRunModel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  double v18;
  unint64_t v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id v28;
  MLModel *bertModel;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SLBertClassifierResult *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  _QWORD v58[4];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  id v62;
  _QWORD v63[5];

  v63[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v63[0] = &unk_24D0CB338;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_maxNumTokens);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v63, 2);
  v6 = objc_claimAutoreleasedReturnValue();

  v56 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", v6, 65568, &v56);
  v8 = v56;
  v55 = v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", v6, 65568, &v55);
  v10 = v55;

  v54 = v10;
  v45 = (void *)v6;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", v6, 65568, &v54);
  v12 = v54;

  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __47__SLBertClassifier__createInputIdsAndRunModel___block_invoke;
  v49[3] = &unk_24D0C6268;
  v49[4] = self;
  v13 = v4;
  v50 = v13;
  v14 = v7;
  v51 = v14;
  v15 = v11;
  v52 = v15;
  v16 = v9;
  v53 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v49);
  v46 = v13;
  v17 = objc_msgSend(v13, "count");
  if (v17 < self->_maxNumTokens)
  {
    v19 = v17;
    do
    {
      LODWORD(v18) = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:atIndexedSubscript:", v20, v19);

      LODWORD(v21) = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v22, v19);

      LODWORD(v23) = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:atIndexedSubscript:", v24, v19);

      ++v19;
    }
    while (v19 < self->_maxNumTokens);
  }
  v25 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    v61 = 2112;
    v62 = v46;
    _os_log_impl(&dword_213B50000, v25, OS_LOG_TYPE_DEFAULT, "%s Tokens: %@", buf, 0x16u);
    v25 = SLLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    v61 = 2112;
    v62 = v14;
    _os_log_impl(&dword_213B50000, v25, OS_LOG_TYPE_DEFAULT, "%s inputIds: %@", buf, 0x16u);
    v25 = SLLogContextFacilityCoreSpeech;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    v61 = 2112;
    v62 = v16;
    _os_log_impl(&dword_213B50000, v25, OS_LOG_TYPE_DEFAULT, "%s attnMask: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v14, CFSTR("minibatch_input_ids"));
  objc_msgSend(v26, "setObject:forKey:", v16, CFSTR("minibatch_attention_mask"));
  objc_msgSend(v26, "setObject:forKey:", v15, CFSTR("minibatch_token_type_ids"));
  v48 = v12;
  v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v26, &v48);
  v28 = v48;

  bertModel = self->_bertModel;
  v47 = v28;
  v43 = (void *)v27;
  -[MLModel predictionFromFeatures:error:](bertModel, "predictionFromFeatures:error:", v27, &v47);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v47;

  v42 = v30;
  objc_msgSend(v30, "featureValueForName:", self->_outputNodeName);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "multiArrayValue");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SLBertClassifier _createInputIdsAndRunModel:]";
    v61 = 2112;
    v62 = v31;
    _os_log_impl(&dword_213B50000, v32, OS_LOG_TYPE_DEFAULT, "%s output: %@", buf, 0x16u);
  }
  objc_msgSend(v31, "convert1dMLMultiArrayToNSArray");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convert1dMLMultiArrayToNSArray");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convert1dMLMultiArrayToNSArray");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convert1dMLMultiArrayToNSArray");
  v40 = v31;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = CFSTR("outputTokens");
  v57[1] = CFSTR("attnMask");
  v58[0] = v46;
  v58[1] = v34;
  v57[2] = CFSTR("inputIds");
  v57[3] = CFSTR("tokenTypeIds");
  v58[2] = v35;
  v58[3] = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[SLBertClassifierResult initWithScore:assetVersion:extractedFeats:]([SLBertClassifierResult alloc], "initWithScore:assetVersion:extractedFeats:", v33, self->_assetVersion, v37);

  return v38;
}

- (BOOL)_isCharPunctuation:(unsigned __int16)a3
{
  BOOL result;

  result = 1;
  if ((a3 - 33) >= 0xF
    && ((a3 - 91) > 0x23 || ((1 << (a3 - 91)) & 0xF0000003FLL) == 0))
  {
    return (a3 - 58) < 7;
  }
  return result;
}

- (id)_splitOnPunctuation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v10, "length"))
        {
          v11 = 0;
          do
          {
            v12 = 0;
            while (1)
            {
              v13 = v11 + v12;
              if (-[SLBertClassifier _isCharPunctuation:](self, "_isCharPunctuation:", objc_msgSend(v10, "characterAtIndex:", v11 + v12)))
              {
                break;
              }
              ++v12;
              if (v11 + v12 >= (unint64_t)objc_msgSend(v10, "length"))
              {
                if (v12)
                {
                  objc_msgSend(v10, "substringWithRange:", v11, v12);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v16);

                }
                goto LABEL_18;
              }
            }
            objc_msgSend(v10, "substringWithRange:", v11, v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
              objc_msgSend(v5, "addObject:", v14);
            objc_msgSend(v10, "substringWithRange:", v13, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v15);
            v11 = v13 + 1;

          }
          while (v13 + 1 < (unint64_t)objc_msgSend(v10, "length"));
        }
LABEL_18:
        ;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)_wordPieceTokenizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", CFSTR("[CLS]"));
  if (self->_shouldAppendLeadingText)
  {
    objc_msgSend(v5, "addObject:", CFSTR("empty"));
    objc_msgSend(v5, "addObject:", CFSTR("[SEP]"));
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SLBertClassifier _splitOnPunctuation:](self, "_splitOnPunctuation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    v22 = *(_QWORD *)v27;
    v23 = v5;
    do
    {
      v12 = 0;
      v24 = v10;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);
        if (objc_msgSend(v13, "length") <= self->_maxInputCharsPerWord)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            v15 = 0;
            while (1)
            {
              v16 = objc_msgSend(v13, "length");
              if (v15 >= v16)
                break;
              v17 = v16;
              while (1)
              {
                objc_msgSend(v13, "substringWithRange:", v15, v17 - v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  objc_msgSend(CFSTR("##"), "stringByAppendingString:", v18);
                  v19 = objc_claimAutoreleasedReturnValue();

                  v18 = (void *)v19;
                }
                if (-[NSArray containsObject:](self->_vocab, "containsObject:", v18))
                  break;
                --v17;

                if (v15 >= v17)
                  goto LABEL_22;
              }
              if (!v18)
                break;
              objc_msgSend(v14, "addObject:", v18);

              v15 = v17;
              if (v17 >= objc_msgSend(v13, "length"))
                goto LABEL_21;
            }
LABEL_22:
            v5 = v23;
            objc_msgSend(v23, "addObject:", self->_unkToken);
          }
          else
          {
LABEL_21:
            v5 = v23;
            objc_msgSend(v23, "addObjectsFromArray:", v14);
          }

          v11 = v22;
          v10 = v24;
        }
        else
        {
          objc_msgSend(v5, "addObject:", self->_unkToken);
        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "addObject:", CFSTR("[SEP]"));
  return v5;
}

- (NSArray)vocab
{
  return self->_vocab;
}

- (void)setVocab:(id)a3
{
  objc_storeStrong((id *)&self->_vocab, a3);
}

- (NSString)unkToken
{
  return self->_unkToken;
}

- (void)setUnkToken:(id)a3
{
  objc_storeStrong((id *)&self->_unkToken, a3);
}

- (unint64_t)maxInputCharsPerWord
{
  return self->_maxInputCharsPerWord;
}

- (void)setMaxInputCharsPerWord:(unint64_t)a3
{
  self->_maxInputCharsPerWord = a3;
}

- (unint64_t)maxNumTokens
{
  return self->_maxNumTokens;
}

- (void)setMaxNumTokens:(unint64_t)a3
{
  self->_maxNumTokens = a3;
}

- (MLModel)bertModel
{
  return self->_bertModel;
}

- (void)setBertModel:(id)a3
{
  objc_storeStrong((id *)&self->_bertModel, a3);
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (BOOL)shouldAppendLeadingText
{
  return self->_shouldAppendLeadingText;
}

- (void)setShouldAppendLeadingText:(BOOL)a3
{
  self->_shouldAppendLeadingText = a3;
}

- (unint64_t)numLeadingTokens
{
  return self->_numLeadingTokens;
}

- (void)setNumLeadingTokens:(unint64_t)a3
{
  self->_numLeadingTokens = a3;
}

- (NSString)outputNodeName
{
  return self->_outputNodeName;
}

- (void)setOutputNodeName:(id)a3
{
  objc_storeStrong((id *)&self->_outputNodeName, a3);
}

- (NSArray)truncationTokenList
{
  return self->_truncationTokenList;
}

- (void)setTruncationTokenList:(id)a3
{
  objc_storeStrong((id *)&self->_truncationTokenList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationTokenList, 0);
  objc_storeStrong((id *)&self->_outputNodeName, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_bertModel, 0);
  objc_storeStrong((id *)&self->_unkToken, 0);
  objc_storeStrong((id *)&self->_vocab, 0);
}

void __47__SLBertClassifier__createInputIdsAndRunModel___block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(*(id *)(a1[4] + 16), "indexOfObject:", a2);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315138;
      v26 = "-[SLBertClassifier _createInputIdsAndRunModel:]_block_invoke";
      _os_log_impl(&dword_213B50000, v9, OS_LOG_TYPE_DEFAULT, "%s Token not found, using unk token", (uint8_t *)&v25, 0xCu);
    }
    v7 = objc_msgSend(*(id *)(a1[4] + 16), "indexOfObject:", *(_QWORD *)(a1[4] + 24));
  }
  v10 = a1[4];
  if (*(_BYTE *)(v10 + 8))
  {
    if (*(_QWORD *)(v10 + 64) <= a3)
      v11 = 1.0;
    else
      v11 = 0.0;
  }
  else
  {
    v11 = 1.0;
  }
  if (*(_QWORD *)(v10 + 40) <= a3)
  {
    *a4 = 1;
    v20 = (void *)SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)a1[5];
      v22 = v20;
      v23 = objc_msgSend(v21, "count");
      v24 = *(_QWORD *)(a1[4] + 40);
      v25 = 136315650;
      v26 = "-[SLBertClassifier _createInputIdsAndRunModel:]_block_invoke";
      v27 = 2048;
      v28 = v23;
      v29 = 2048;
      v30 = v24;
      _os_log_impl(&dword_213B50000, v22, OS_LOG_TYPE_DEFAULT, "%s Num Tokens - %lu  exceeded model input length - %lu", (uint8_t *)&v25, 0x20u);

    }
  }
  else
  {
    v12 = (void *)a1[6];
    *(float *)&v8 = (float)v7;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:atIndexedSubscript:", v13, a3);

    v14 = (void *)a1[7];
    *(float *)&v15 = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:atIndexedSubscript:", v16, a3);

    v17 = (void *)a1[8];
    LODWORD(v18) = 1.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:atIndexedSubscript:", v19, a3);

  }
}

void __35__SLBertClassifier__normalizeText___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v6 = objc_msgSend(v12, "length");
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length") > v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "substringWithRange:", 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "characterIsMember:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "characterAtIndex:", v6)) & 1) != 0|| objc_msgSend(*(id *)(a1 + 32), "_isCharPunctuation:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "characterAtIndex:", v6)))
    {
      if (objc_msgSend(v7, "isEqualToString:", v12))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "substringWithRange:", v6, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length") - v6);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        *a4 = 1;
      }
    }

  }
}

@end
