@implementation SLUresMitigator

- (SLUresMitigator)initWithConfig:(id)a3 error:(id *)a4
{
  return -[SLUresMitigator initWithConfig:bnnsIrPath:error:](self, "initWithConfig:bnnsIrPath:error:", a3, 0, a4);
}

- (SLUresMitigator)initWithConfig:(id)a3 bnnsIrPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  SLUresMitigator *v10;
  SLUresMitigatorConfigDecoder *v11;
  id v12;
  void *v13;
  NSObject *v14;
  SLUresMitigator *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  CSFModelComputeBackend *uresModel;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  NSString *version;
  uint64_t v32;
  NSDictionary *inputOpsMap;
  uint64_t v34;
  NSDictionary *outputMap;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  id v41;
  objc_super v42;
  const __CFString *v43;
  uint64_t v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v42.receiver = self;
  v42.super_class = (Class)SLUresMitigator;
  v10 = -[SLUresMitigator init](&v42, sel_init);
  if (!v10)
    goto LABEL_19;
  if (SLLogInitIfNeeded_once != -1)
    dispatch_once(&SLLogInitIfNeeded_once, &__block_literal_global);
  v41 = 0;
  v11 = -[SLUresMitigatorConfigDecoder initWithConfigFile:errOut:]([SLUresMitigatorConfigDecoder alloc], "initWithConfigFile:errOut:", v8, &v41);
  v12 = v41;
  if (v12)
  {
    v13 = v12;
    v14 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[SLUresMitigator initWithConfig:bnnsIrPath:error:]";
      v47 = 2112;
      v48 = (uint64_t)v13;
      _os_log_error_impl(&dword_213B50000, v14, OS_LOG_TYPE_ERROR, "%s SLUresMitigator config init with error: %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  -[SLUresMitigatorConfigDecoder getModelFile](v11, "getModelFile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v17 = v9;

    v16 = v17;
  }
  -[SLUresMitigatorConfigDecoder getBnnsIrWeightFile](v11, "getBnnsIrWeightFile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(MEMORY[0x24BE28420], "provideComputeBackendWithModelFile:separateWeight:error:", v16, v18, &v40);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v40;
  uresModel = v10->_uresModel;
  v10->_uresModel = (CSFModelComputeBackend *)v19;

  if (v10->_uresModel)
  {
    v22 = 0;
    if (!v20)
    {
LABEL_18:
      -[SLUresMitigatorConfigDecoder getVersion](v11, "getVersion");
      v30 = objc_claimAutoreleasedReturnValue();
      version = v10->_version;
      v10->_version = (NSString *)v30;

      -[SLUresMitigatorConfigDecoder getInputOpsMap](v11, "getInputOpsMap");
      v32 = objc_claimAutoreleasedReturnValue();
      inputOpsMap = v10->_inputOpsMap;
      v10->_inputOpsMap = (NSDictionary *)v32;

      -[SLUresMitigatorConfigDecoder getOutputMap](v11, "getOutputMap");
      v34 = objc_claimAutoreleasedReturnValue();
      outputMap = v10->_outputMap;
      v10->_outputMap = (NSDictionary *)v34;

      -[SLUresMitigatorConfigDecoder getSupportedInputOrigins](v11, "getSupportedInputOrigins");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLUresMitigator _createInputOriginThresholdMap:](v10, "_createInputOriginThresholdMap:", v36);

LABEL_19:
      v15 = v10;
      goto LABEL_20;
    }
  }
  v38 = v18;
  v23 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v20, "localizedDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("Unable to create model with error %@"), v24);
  v25 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDD1540];
  v43 = CFSTR("reason");
  v44 = v25;
  v39 = (void *)v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sl"), 106, v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[SLUresMitigator initWithConfig:bnnsIrPath:error:]";
    v47 = 2114;
    v48 = v25;
    _os_log_error_impl(&dword_213B50000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  v18 = v38;
  if (!a5)
  {

    goto LABEL_18;
  }
  v29 = objc_retainAutorelease(v22);
  *a5 = v29;

LABEL_8:
  v15 = 0;
LABEL_20:

  return v15;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SLUresMitigator dealloc]";
    _os_log_impl(&dword_213B50000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SLUresMitigator;
  -[SLUresMitigator dealloc](&v4, sel_dealloc);
}

- (void)processInputFeats:(id)a3 completion:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  -[SLUresMitigator _processInputFeats:](self, "_processInputFeats:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, v6);

}

- (void)_createInputOriginThresholdMap:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *thresholdMap;
  NSObject *v7;
  NSMutableDictionary *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  NSMutableDictionary *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  thresholdMap = self->_thresholdMap;
  self->_thresholdMap = v5;

  if (v4)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__SLUresMitigator__createInputOriginThresholdMap___block_invoke;
    v9[3] = &unk_24D0C6418;
    v9[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_thresholdMap;
      *(_DWORD *)buf = 136315394;
      v11 = "-[SLUresMitigator _createInputOriginThresholdMap:]";
      v12 = 2114;
      v13 = v8;
      _os_log_impl(&dword_213B50000, v7, OS_LOG_TYPE_DEFAULT, "%s Threshold map: %{public}@", buf, 0x16u);
    }
  }

}

- (id)_processInputFeats:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *inputOpsMap;
  uint64_t v11;
  id v12;
  id v13;
  CSFModelComputeBackend *uresModel;
  void *v15;
  id v16;
  NSDictionary *outputMap;
  NSMutableDictionary *thresholdMap;
  void *v19;
  float v20;
  float v21;
  NSObject *v22;
  __CFString *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  NSString *version;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SLUresMitigatorResult *v40;
  double v41;
  SLUresMitigatorResult *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  __CFString *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _BYTE *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  double *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  float *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[6];
  _QWORD v84[6];
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  double v88;
  _BYTE v89[24];
  int v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "speechPackage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "speechPackage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLASRFeatureExtractor extractASRFaturesFrom:](SLASRFeatureExtractor, "extractASRFaturesFrom:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v4, "inputOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    inputOpsMap = self->_inputOpsMap;
    v11 = MEMORY[0x24BDAC760];
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __38__SLUresMitigator__processInputFeats___block_invoke;
    v77[3] = &unk_24D0C6440;
    v12 = v7;
    v78 = v12;
    v13 = v4;
    v79 = v13;
    v52 = v9;
    v80 = v52;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inputOpsMap, "enumerateKeysAndObjectsUsingBlock:", v77);
    uresModel = self->_uresModel;
    v76 = 0;
    -[CSFModelComputeBackend predictOutputWithInputs:errOut:](uresModel, "predictOutputWithInputs:errOut:", v52, &v76);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v76;
    v51 = v16;
    if (!v15 || v16)
    {
      v44 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v16, "localizedDescription");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithFormat:", CFSTR("Failed to get output with error %@"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v89 = 136315394;
        *(_QWORD *)&v89[4] = "-[SLUresMitigator _processInputFeats:]";
        *(_WORD *)&v89[12] = 2114;
        *(_QWORD *)&v89[14] = v46;
        _os_log_error_impl(&dword_213B50000, v47, OS_LOG_TYPE_ERROR, "%s %{public}@", v89, 0x16u);
      }

      v42 = 0;
    }
    else
    {
      *(_QWORD *)v89 = 0;
      *(_QWORD *)&v89[8] = v89;
      *(_QWORD *)&v89[16] = 0x2020000000;
      v90 = 0;
      v72 = 0;
      v73 = &v72;
      v74 = 0x2020000000;
      v75 = 0;
      v68 = 0;
      v69 = (float *)&v68;
      v70 = 0x2020000000;
      v71 = -1082130432;
      v64 = 0;
      v65 = &v64;
      v66 = 0x2020000000;
      v67 = -1082130432;
      v60 = 0;
      v61 = (double *)&v60;
      v62 = 0x2020000000;
      v63 = 0;
      outputMap = self->_outputMap;
      v53[0] = v11;
      v53[1] = 3221225472;
      v53[2] = __38__SLUresMitigator__processInputFeats___block_invoke_289;
      v53[3] = &unk_24D0C6468;
      v54 = v15;
      v55 = v89;
      v56 = &v60;
      v57 = &v72;
      v58 = &v68;
      v59 = &v64;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](outputMap, "enumerateKeysAndObjectsUsingBlock:", v53);
      thresholdMap = self->_thresholdMap;
      objc_msgSend(v13, "inputOrigin");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](thresholdMap, "objectForKeyedSubscript:", v19);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        objc_msgSend(v50, "floatValue");
        v21 = v20;
        v69[6] = v20;
        *((_BYTE *)v73 + 24) = *(float *)(*(_QWORD *)&v89[8] + 24) < v20;
        v22 = SLLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v86 = "-[SLUresMitigator _processInputFeats:]";
          v87 = 2048;
          v88 = v21;
          _os_log_impl(&dword_213B50000, v22, OS_LOG_TYPE_DEFAULT, "%s Using software configured threshold: %.3f", buf, 0x16u);
        }
      }
      if (*((_BYTE *)v73 + 24))
        v23 = CFSTR("requestMitigated");
      else
        v23 = CFSTR("requestNotMitigated");
      v49 = v23;
      v83[0] = CFSTR("score");
      LODWORD(v24) = *(_DWORD *)(*(_QWORD *)&v89[8] + 24);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v25;
      v84[1] = v49;
      v83[1] = CFSTR("decision");
      v83[2] = CFSTR("decisionValue");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v61[3]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v84[2] = v26;
      v83[3] = CFSTR("threshold");
      *(float *)&v27 = v69[6];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v84[3] = v28;
      v83[4] = CFSTR("speakerIDthreshold");
      LODWORD(v29) = *((_DWORD *)v65 + 6);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v83[5] = CFSTR("assetVersion");
      version = self->_version;
      v84[4] = v30;
      v84[5] = version;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v81[0] = CFSTR("numAsrRecords");
      v33 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v12, "latticePathMaxScores");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = v35;
      v81[1] = CFSTR("numTokensTopPath");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v12, "topLatticePathTokenCount"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v82[1] = v36;
      v81[2] = CFSTR("trailingSilenceDuration");
      v37 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v12, "trailingSilence");
      objc_msgSend(v37, "numberWithFloat:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v82[2] = v38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = [SLUresMitigatorResult alloc];
      LODWORD(v41) = *(_DWORD *)(*(_QWORD *)&v89[8] + 24);
      v42 = -[SLUresMitigatorResult initWithScore:decision:decisionLevel:detailedResults:extractedFeats:](v40, "initWithScore:decision:decisionLevel:detailedResults:extractedFeats:", *((unsigned __int8 *)v73 + 24), v32, v39, v41, v61[3]);

      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(&v64, 8);
      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v72, 8);
      _Block_object_dispose(v89, 8);
    }

  }
  else
  {
    v43 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v89 = 136315394;
      *(_QWORD *)&v89[4] = "-[SLUresMitigator _processInputFeats:]";
      *(_WORD *)&v89[12] = 2114;
      *(_QWORD *)&v89[14] = CFSTR("Missing input origin");
      _os_log_error_impl(&dword_213B50000, v43, OS_LOG_TYPE_ERROR, "%s %{public}@", v89, 0x16u);
    }
    v42 = 0;
  }

  return v42;
}

- (CSFModelComputeBackend)uresModel
{
  return self->_uresModel;
}

- (void)setUresModel:(id)a3
{
  objc_storeStrong((id *)&self->_uresModel, a3);
}

- (NSDictionary)inputOpsMap
{
  return self->_inputOpsMap;
}

- (void)setInputOpsMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputOpsMap, a3);
}

- (NSDictionary)outputMap
{
  return self->_outputMap;
}

- (void)setOutputMap:(id)a3
{
  objc_storeStrong((id *)&self->_outputMap, a3);
}

- (NSMutableDictionary)thresholdMap
{
  return self->_thresholdMap;
}

- (void)setThresholdMap:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdMap, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_thresholdMap, 0);
  objc_storeStrong((id *)&self->_outputMap, 0);
  objc_storeStrong((id *)&self->_inputOpsMap, 0);
  objc_storeStrong((id *)&self->_uresModel, 0);
}

void __38__SLUresMitigator__processInputFeats___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void **v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("numAsrRecords")))
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1[4], "latticePathMaxScores");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v9;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = (void **)v66;
LABEL_3:
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
    goto LABEL_16;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("topPathScores")))
  {
    objc_msgSend(a1[4], "topLatticePathScores");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("latticeMaxScores")))
  {
    objc_msgSend(a1[4], "latticePathMaxScores");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("latticeMinScores")))
  {
    objc_msgSend(a1[4], "latticePathMinScores");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("latticeMeanScores")))
  {
    objc_msgSend(a1[4], "latticePathMeanScores");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("latticeVarScores")))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("topPathNumTokens")))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1[4], "topLatticePathTokenCount"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v8;
        v26 = (void *)MEMORY[0x24BDBCE30];
        v27 = &v65;
      }
      else
      {
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("acousticFTMScore")))
        {
          v28 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(a1[5], "acousticFTMScores");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "floatValue");
          objc_msgSend(v28, "numberWithFloat:");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v9;
          v10 = (void *)MEMORY[0x24BDBCE30];
          v11 = &v64;
          goto LABEL_3;
        }
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("lrnnScores")))
        {
          objc_msgSend(a1[5], "lrnnScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v63;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("lrnnThreshold")))
        {
          objc_msgSend(a1[5], "lrnnThreshold");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v62;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("snr")))
        {
          v29 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(a1[4], "snr");
          objc_msgSend(v29, "numberWithFloat:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v61;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("trailingSilence")))
        {
          v30 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(a1[4], "trailingSilence");
          objc_msgSend(v30, "numberWithFloat:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v60;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("inputOrigin")))
        {
          objc_msgSend(a1[5], "inputOrigin");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v59;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("timeFromPrevQuery")))
        {
          v31 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(a1[5], "timeSinceLastQuery");
          objc_msgSend(v31, "numberWithDouble:");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v58;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("speakerIdScore")))
        {
          objc_msgSend(a1[5], "speakerIDScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v57;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("airpodsConnectedState")))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[5], "isAirpodsConnected"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v56;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("boronActivityScore")))
        {
          objc_msgSend(a1[5], "boronScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v55;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("acousticSpeechActivityScore")))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[5], "didDetectSpeechActivity"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v54;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("attSiriPrevOutputState")))
        {
          objc_msgSend(a1[5], "prevStageOutput");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v53;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("multiModalDecisionStage")))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1[5], "decisionStage"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v52;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("eosLikelihood")))
        {
          objc_msgSend(a1[5], "eosLikelihood");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v51;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("visualGazeScore")))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[5], "didDetectGazeAtOrb"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v50;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("visualAttentionScore")))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[5], "didDetectAttention"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v49;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("visualSpeechActivityScore")))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1[5], "didDetectVisualActivity"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v48;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("nldaScore")))
        {
          objc_msgSend(a1[5], "nldaScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v47;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("confidenceScoreASR")))
        {
          objc_msgSend(a1[5], "confidenceScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v46;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("checkerScore")))
        {
          objc_msgSend(a1[5], "checkerScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v45;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("phsScore")))
        {
          objc_msgSend(a1[5], "phsScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v44;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("embeddingScore")))
        {
          objc_msgSend(a1[5], "embeddingScore");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v43;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("externalLrnnScale")))
        {
          objc_msgSend(a1[5], "externalLrnnScale");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v42;
        }
        else
        {
          if (!objc_msgSend(v5, "isEqualToString:", CFSTR("externalLrnnOffset")))
          {
            v40 = &unk_24D0CB350;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v40, 1);
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
          objc_msgSend(a1[5], "externalLrnnOffset");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v8;
          v26 = (void *)MEMORY[0x24BDBCE30];
          v27 = &v41;
        }
      }
      objc_msgSend(v26, "arrayWithObjects:count:", v27, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
    objc_msgSend(a1[4], "latticePathVarScores");
    v13 = objc_claimAutoreleasedReturnValue();
  }
LABEL_15:
  v12 = (void *)v13;
LABEL_16:
  objc_msgSend(v6, "valueForKey:", CFSTR("name"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("shape"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    objc_msgSend(v12, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v35 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
    v36 = 2114;
    v37 = v14;
    v38 = 2114;
    v39 = v18;
    _os_log_impl(&dword_213B50000, v17, OS_LOG_TYPE_DEFAULT, "%s AttFeature: %{public}@ --> %{public}@", buf, 0x20u);

  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BE28440], "propertyWithShape:dataType:", v15, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x24BE28418]);
    v33 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v22 = (void *)objc_msgSend(v20, "initWithInputArray:name:properties:errOut:", v21, v14, v19, &v32);
    v23 = v32;

    if (!v22 || v23)
    {
      v25 = SLLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v35 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
        v36 = 2112;
        v37 = v23;
        v38 = 2114;
        v39 = v14;
        _os_log_error_impl(&dword_213B50000, v25, OS_LOG_TYPE_ERROR, "%s Failed to convert array to MLMultiArray with error: %@, not using feature %{public}@ for inference", buf, 0x20u);
      }
    }
    else
    {
      objc_msgSend(a1[6], "setObject:forKey:", v22, v14);
    }

  }
  else
  {
    v24 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
      v36 = 2114;
      v37 = v14;
      _os_log_error_impl(&dword_213B50000, v24, OS_LOG_TYPE_ERROR, "%s Value for feature: %{public}@ isn't set, abort model run", buf, 0x16u);
    }
  }

}

void __38__SLUresMitigator__processInputFeats___block_invoke_289(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a3, "valueForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertDataToArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(MEMORY[0x24BE28428], "getRankOfTensor:", v8);
  if (v9 > 0)
  {
    objc_msgSend(v8, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 == 2)
    {
      objc_msgSend(v10, "firstObject");
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("mitigatorScore")))
    {
      objc_msgSend(v11, "floatValue");
      v14 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("mitigatorDecision")))
      {
        objc_msgSend(v11, "doubleValue");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v16;
        if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < 2.22044605e-16)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        goto LABEL_7;
      }
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("mitigatorThreshold")))
      {
        objc_msgSend(v11, "floatValue");
        v14 = *(_QWORD *)(a1 + 64);
      }
      else
      {
        if (!objc_msgSend(v5, "isEqualToString:", CFSTR("speakerIDThreshold")))
          goto LABEL_7;
        objc_msgSend(v11, "floatValue");
        v14 = *(_QWORD *)(a1 + 72);
      }
    }
    *(_DWORD *)(*(_QWORD *)(v14 + 8) + 24) = v13;
LABEL_7:

    goto LABEL_10;
  }
  v15 = SLLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315394;
    v18 = "-[SLUresMitigator _processInputFeats:]_block_invoke";
    v19 = 2048;
    v20 = v9;
    _os_log_impl(&dword_213B50000, v15, OS_LOG_TYPE_DEFAULT, "%s Invalid output shape: %lu", (uint8_t *)&v17, 0x16u);
  }
LABEL_10:

}

void __50__SLUresMitigator__createInputOriginThresholdMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("threshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("modelIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKey:", v7, v8);
  }
  else
  {
    v9 = SLLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)SLLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[SLUresMitigator _createInputOriginThresholdMap:]_block_invoke";
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_213B50000, v9, OS_LOG_TYPE_ERROR, "%s Invalid config for %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }

}

+ (id)getTranscriptionForSpeechPackage:(id)a3
{
  return +[SLASRFeatureExtractor getBestSpeechRecognitionTextFromPackage:](SLASRFeatureExtractor, "getBestSpeechRecognitionTextFromPackage:", a3);
}

@end
