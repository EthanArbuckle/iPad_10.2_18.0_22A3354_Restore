@implementation SDLipMovementVAD

- (SDLipMovementVAD)initWithModelFile:(id)a3
{
  id v5;
  SDLipMovementVAD *v6;
  SDLipMovementVAD *v7;
  NSMutableArray *v8;
  NSMutableArray *lipMovementDataArray;
  id v10;
  void *v11;
  MLPredictionOptions *v12;
  MLPredictionOptions *options;
  uint64_t v14;
  id v15;
  MLModel *lipMovementVADModel;
  SDLipMovementVAD *v17;
  NSObject *v18;
  void *v19;
  NSObject *v21;
  void *v22;
  id v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SDLipMovementVAD;
  v6 = -[SDLipMovementVAD init](&v24, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  if (!v5)
  {
    v18 = SDLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SDLipMovementVAD initWithModelFile:]";
      _os_log_error_impl(&dword_21347E000, v18, OS_LOG_TYPE_ERROR, "%s No path found for lip movement model.", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v6->_framesToNextPrediction = 15;
  v6->_visualSpeechProbability = 0.0;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  lipMovementDataArray = v7->_lipMovementDataArray;
  v7->_lipMovementDataArray = v8;

  objc_storeStrong((id *)&v7->_configFile, a3);
  -[SDLipMovementVAD setupBlendshapeIndexArray](v7, "setupBlendshapeIndexArray");
  v10 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
  objc_msgSend(v10, "setComputeUnits:", 0);
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7->_configFile);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (MLPredictionOptions *)objc_alloc_init(MEMORY[0x24BDC0018]);
  options = v7->_options;
  v7->_options = v12;

  v23 = 0;
  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", v11, v10, &v23);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v23;
  lipMovementVADModel = v7->_lipMovementVADModel;
  v7->_lipMovementVADModel = (MLModel *)v14;

  if (!v7->_lipMovementVADModel || v15)
  {
    v19 = (void *)SDLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      v21 = v19;
      objc_msgSend(v15, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v26 = "-[SDLipMovementVAD initWithModelFile:]";
      v27 = 2114;
      v28 = v11;
      v29 = 2114;
      v30 = v22;
      _os_log_error_impl(&dword_21347E000, v21, OS_LOG_TYPE_ERROR, "%s Failed to load LipMovementVAD model from %{public}@ with error: %{public}@", buf, 0x20u);

    }
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }

LABEL_6:
  v17 = v7;
LABEL_13:

  return v17;
}

- (void)setupBlendshapeIndexArray
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *blendshapeLocationToIndexMap;
  _QWORD v6[6];

  v6[5] = 0;
  CVAFaceTrackingCopySemantics();
  objc_msgSend(0, "objectForKeyedSubscript:", *MEMORY[0x24BE05988]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableDictionary *)objc_opt_new();
  blendshapeLocationToIndexMap = self->_blendshapeLocationToIndexMap;
  self->_blendshapeLocationToIndexMap = v4;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SDLipMovementVAD_setupBlendshapeIndexArray__block_invoke;
  v6[3] = &unk_24CFD2888;
  v6[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

- (void)addFaceTrackingData:(id)a3 atMachAbsTime:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSMutableArray *lipMovementDataArray;
  LipMovementData *v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE05A28]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE05978]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE05980]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && objc_msgSend(v10, "length") == 204)
  {
    v11 = objc_msgSend(objc_retainAutorelease(v10), "bytes");
    for (i = 0; i != 204; i += 4)
    {
      LODWORD(v12) = *(_DWORD *)(v11 + i);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

    }
  }
  else
  {
    if (v6)
    {
      v15 = SDLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315394;
        v24 = "-[SDLipMovementVAD addFaceTrackingData:atMachAbsTime:]";
        v25 = 2114;
        v26 = v10;
        _os_log_impl(&dword_21347E000, v15, OS_LOG_TYPE_DEFAULT, "%s Received nonnul metadata object from AppleCVA, but nil blendshapes or unexpected amount of blendshapes. Blendshape object: %{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
    if (-[NSMutableArray count](self->_lipMovementDataArray, "count"))
    {
      for (j = 0; j != 51; ++j)
      {
        -[NSMutableArray lastObject](self->_lipMovementDataArray, "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "blendshapes");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndex:", j);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v19);
      }
    }
    else
    {
      v20 = 51;
      do
      {
        objc_msgSend(v7, "addObject:", &unk_24CFD3ED0);
        --v20;
      }
      while (v20);
    }
  }
  lipMovementDataArray = self->_lipMovementDataArray;
  v22 = -[LipMovementData initWithBlendshape:andTime:]([LipMovementData alloc], "initWithBlendshape:andTime:", v7, a4);
  -[NSMutableArray addObject:](lipMovementDataArray, "addObject:", v22);

  --self->_framesToNextPrediction;
  if (-[NSMutableArray count](self->_lipMovementDataArray, "count") == 16)
    -[NSMutableArray removeObjectAtIndex:](self->_lipMovementDataArray, "removeObjectAtIndex:", 0);
  if (-[NSMutableArray count](self->_lipMovementDataArray, "count") == 15 && !self->_framesToNextPrediction)
  {
    self->_framesToNextPrediction = 6;
    -[SDLipMovementVAD runModel](self, "runModel");
  }

}

- (void)runModel
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSMutableDictionary *blendshapeLocationToIndexMap;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  MLModel *lipMovementVADModel;
  MLPredictionOptions *options;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  float v38;
  float v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  float v47;
  float v48;
  id WeakRetained;
  void *v50;
  void *v51;
  id v52;
  char v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  SDLipMovementVAD *v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  double v78;
  _QWORD v79[5];

  v79[3] = *MEMORY[0x24BDAC8D0];
  v70 = 0;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_24CFD4138, 65568, &v70);
  v62 = v70;
  objc_msgSend(&unk_24CFD4150, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 >= 1)
  {
    v5 = 0;
    v6 = &unk_24CFD4168;
    v7 = 0x254B9C000uLL;
    v8 = &unk_24CFD3ED0;
    v9 = 0x24BDD1000uLL;
    v10 = 0x24BDBC000uLL;
    v66 = self;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      if (v12 >= 1)
      {
        v13 = 0;
        do
        {
          blendshapeLocationToIndexMap = self->_blendshapeLocationToIndexMap;
          objc_msgSend(*(id *)(v7 + 2760), "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](blendshapeLocationToIndexMap, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray objectAtIndex:](self->_lipMovementDataArray, "objectAtIndex:", v5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "blendshapes");
          v18 = v6;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndex:", (int)objc_msgSend(v16, "intValue"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v79[0] = v8;
          objc_msgSend(*(id *)(v9 + 1760), "numberWithInt:", v5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v79[1] = v21;
          objc_msgSend(*(id *)(v9 + 1760), "numberWithInt:", v13);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v79[2] = v22;
          objc_msgSend(*(id *)(v10 + 3632), "arrayWithObjects:count:", v79, 3);
          v23 = v9;
          v24 = v5;
          v25 = v8;
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v18;
          self = v66;
          v7 = 0x254B9C000;
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v20, v26);

          ++v13;
          objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v27, "intValue");

          v8 = v25;
          v5 = v24;
          v9 = v23;
          v10 = 0x24BDBC000;
        }
        while (v13 < (int)v16);
      }
      ++v5;
      objc_msgSend(&unk_24CFD4150, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "intValue");

    }
    while (v5 < v29);
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKey:", v67, CFSTR("input_1"));
  v69 = 0;
  v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFF80]), "initWithDictionary:error:", v30, &v69);
  v64 = v69;
  v65 = (void *)v31;
  lipMovementVADModel = self->_lipMovementVADModel;
  options = self->_options;
  v68 = v62;
  -[MLModel predictionFromFeatures:options:error:](lipMovementVADModel, "predictionFromFeatures:options:error:", v31, options, &v68);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v68;

  if (v35)
  {
    v36 = SDLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "-[SDLipMovementVAD runModel]";
      v73 = 2114;
      v74 = *(double *)&v35;
      _os_log_error_impl(&dword_21347E000, v36, OS_LOG_TYPE_ERROR, "%s Error when running inference for LipMovementVAD: %{public}@", buf, 0x16u);
    }
  }
  v63 = v35;
  objc_msgSend(v34, "featureValueForName:", CFSTR("Identity_1"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "multiArrayValue");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKeyedSubscript:", &unk_24CFD4180);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "floatValue");
  v39 = v38;

  v40 = v39;
  self->_visualSpeechProbability = v39;
  objc_msgSend(v34, "featureValueForName:", CFSTR("Identity"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "multiArrayValue");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", &unk_24CFD4198);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "floatValue");
  v45 = v44;

  objc_msgSend(v42, "objectForKeyedSubscript:", &unk_24CFD41B0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "floatValue");
  v48 = v47;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v50 = WeakRetained;
    v51 = v30;
    v52 = objc_loadWeakRetained((id *)&self->_delegate);
    v53 = objc_opt_respondsToSelector();

    v30 = v51;
    if ((v53 & 1) != 0)
    {
      -[NSMutableArray firstObject](self->_lipMovementDataArray, "firstObject");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "absMachTime");

      -[NSMutableArray lastObject](self->_lipMovementDataArray, "lastObject");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "absMachTime");

      v58 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v58, "didUpdateVisualSpeechProbability:from:to:", v55, v57, self->_visualSpeechProbability);

      v30 = v51;
    }
  }
  v59 = SDLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)SDLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v72 = "-[SDLipMovementVAD runModel]";
    v73 = 2048;
    v74 = v40;
    v75 = 2048;
    v76 = v48;
    v77 = 2048;
    v78 = v45;
    _os_log_impl(&dword_21347E000, v59, OS_LOG_TYPE_DEFAULT, "%s LipMovementVAD ran prediction, output is: %f. Probability of speech: %f, Probability of no speech: %f", buf, 0x2Au);
  }

}

- (void)reset
{
  -[NSMutableArray removeAllObjects](self->_lipMovementDataArray, "removeAllObjects");
}

- (double)visualSpeechProbability
{
  return self->_visualSpeechProbability;
}

- (LipMovementVADDelegate)delegate
{
  return (LipMovementVADDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blendshapeLocationToIndexMap, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_lipMovementVADModel, 0);
  objc_storeStrong((id *)&self->_configFile, 0);
  objc_storeStrong((id *)&self->_lipMovementDataArray, 0);
}

void __45__SDLipMovementVAD_setupBlendshapeIndexArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v7, v6);

}

@end
