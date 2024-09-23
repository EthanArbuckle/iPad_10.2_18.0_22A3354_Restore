@implementation CLSCurationModel_v3

+ (id)baseSpecificationWithSpecification:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  CLSCurationModelSpecification *v11;
  objc_super v13;

  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___CLSCurationModel_v3;
  v3 = a3;
  objc_msgSendSuper2(&v13, sel_baseSpecificationWithSpecification_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "sceneAnalysisVersion", v13.receiver, v13.super_class);

  v6 = objc_msgSend(v4, "sceneAnalysisVersion");
  v7 = objc_msgSend(MEMORY[0x24BE726C0], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v7)
    v6 = v7;
  v8 = objc_msgSend(MEMORY[0x24BE726E0], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v8)
    v6 = v8;
  v9 = objc_msgSend(MEMORY[0x24BE726C8], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v9)
    v6 = v9;
  v10 = objc_msgSend(MEMORY[0x24BE726D0], "baseSceneAnalysisVersionWithSceneAnalysisVersion:", v5);
  if (v6 <= v10)
    v6 = v10;
  v11 = -[CLSCurationModelSpecification initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:]([CLSCurationModelSpecification alloc], "initWithSceneAnalysisVersion:mediaAnalysisVersion:faceAnalysisVersion:", v6, objc_msgSend(v4, "mediaAnalysisVersion"), objc_msgSend(v4, "faceAnalysisVersion"));

  return v11;
}

- (CLSCurationModel_v3)initWithCurationModelSpecification:(id)a3
{
  id v4;
  CLSCurationModel_v3 *v5;
  uint64_t v6;
  uint64_t v7;
  CLSNSFWModel *nsfwModel;
  uint64_t v9;
  CLSTabooEventModel *tabooEventModel;
  uint64_t v11;
  CLSPotentialLandmarkModel *potentialLandmarkModel;
  uint64_t v13;
  CLSSDModel *sdModel;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CLSCurationModel_v3;
  v5 = -[CLSCurationModel_v1 initWithCurationModelSpecification:](&v17, sel_initWithCurationModelSpecification_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "sceneAnalysisVersion");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE726C0]), "initWithSceneAnalysisVersion:", v6);
    nsfwModel = v5->_nsfwModel;
    v5->_nsfwModel = (CLSNSFWModel *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE726E0]), "initWithSceneAnalysisVersion:", v6);
    tabooEventModel = v5->_tabooEventModel;
    v5->_tabooEventModel = (CLSTabooEventModel *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE726C8]), "initWithSceneAnalysisVersion:", v6);
    potentialLandmarkModel = v5->_potentialLandmarkModel;
    v5->_potentialLandmarkModel = (CLSPotentialLandmarkModel *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE726D0]), "initWithSceneAnalysisVersion:", v6);
    sdModel = v5->_sdModel;
    v5->_sdModel = (CLSSDModel *)v13;

    -[CLSCurationModel_v1 junkClassificationModel](v5, "junkClassificationModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_r14j9IsAvailable = (unint64_t)objc_msgSend(v15, "version") > 0x27;

  }
  return v5;
}

- (BOOL)isTragicFailureWithImageAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (self->_r14j9IsAvailable)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "clsSceneClassifications", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    v8 = 0.0;
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v12, "extendedSceneIdentifier") == 2147483631)
          {
            objc_msgSend(v12, "confidence");
            v8 = v13;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

    -[CLSCurationModel_v1 junkClassificationModel](self, "junkClassificationModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tragicFailureNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v15, "passesHighPrecisionWithConfidence:", v8) & 1) != 0)
    {
      v16 = 1;
    }
    else if (objc_msgSend(v15, "passesHighRecallWithConfidence:", v8))
    {
      v16 = objc_msgSend(v5, "clsIsBlurry");
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)CLSCurationModel_v3;
    v16 = -[CLSCurationModel_v1 isTragicFailureWithImageAsset:](&v22, sel_isTragicFailureWithImageAsset_, v4);
  }

  return v16;
}

- (BOOL)avoidIfPossibleForKeyAssetWithSignals:(id)a3 statistics:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  CLSTabooEventModel *tabooEventModel;
  void *v15;
  unsigned int var1;
  void *v17;
  unsigned int var2;
  void *v19;
  unsigned int var3;
  void *v21;
  unsigned int var4;
  void *v23;
  unsigned int var5;
  BOOL v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_r14j9IsAvailable)
  {
    -[CLSCurationModel_v1 junkClassificationModel](self, "junkClassificationModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "tragicFailureNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v8, "passesHighRecallWithSignal:", v13))
        {
          ++a4->var0;
LABEL_36:
          v25 = 1;
          goto LABEL_37;
        }
        tabooEventModel = self->_tabooEventModel;
        if (tabooEventModel)
        {
          -[CLSTabooEventModel bloodNode](tabooEventModel, "bloodNode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "passesHighRecallWithSignal:", v13) & 1) != 0)
          {
            var1 = a4->var1;
            a4->var1 = var1 + 1;

            if (var1 != -1)
              goto LABEL_36;
          }
          else
          {

          }
          -[CLSTabooEventModel funeralNode](self->_tabooEventModel, "funeralNode");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "passesHighRecallWithSignal:", v13) & 1) != 0)
          {
            var2 = a4->var2;
            a4->var2 = var2 + 1;

            if (var2 != -1)
              goto LABEL_36;
          }
          else
          {

          }
          -[CLSTabooEventModel hospitalNode](self->_tabooEventModel, "hospitalNode");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "passesHighRecallWithSignal:", v13) & 1) != 0)
          {
            var3 = a4->var3;
            a4->var3 = var3 + 1;

            if (var3 != -1)
              goto LABEL_36;
          }
          else
          {

          }
          -[CLSTabooEventModel vehicleCrashNode](self->_tabooEventModel, "vehicleCrashNode");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "passesHighRecallWithSignal:", v13) & 1) != 0)
          {
            var4 = a4->var4;
            a4->var4 = var4 + 1;

            if (var4 != -1)
              goto LABEL_36;
          }
          else
          {

          }
          -[CLSTabooEventModel warNode](self->_tabooEventModel, "warNode");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v23, "passesHighRecallWithSignal:", v13) & 1) != 0)
          {
            var5 = a4->var5;
            a4->var5 = var5 + 1;

            if (var5 != -1)
              goto LABEL_36;
          }
          else
          {

          }
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v25 = 0;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_37:

  return v25;
}

- (BOOL)avoidIfPossibleForKeyAssetWithProcessedSignals:(id)a3 statistics:(id *)a4
{
  int v5;

  v5 = objc_msgSend(a3, "isRecallinglyNSFWExplicit");
  if (v5)
    ++a4->var0;
  return v5;
}

- (BOOL)avoidIfPossibleForKeyAssetWithAsset:(id)a3 statistics:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  if (objc_msgSend(v6, "isPhoto") && objc_msgSend(v6, "clsHasPoorResolution"))
  {
    ++a4->var11;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CLSCurationModel_v3;
    if (!-[CLSCurationModel_v1 avoidIfPossibleForKeyAssetWithAsset:statistics:](&v12, sel_avoidIfPossibleForKeyAssetWithAsset_statistics_, v6, a4))
    {
      objc_msgSend(v6, "clsProcessedSignals");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[CLSCurationModel_v3 avoidIfPossibleForKeyAssetWithProcessedSignals:statistics:](self, "avoidIfPossibleForKeyAssetWithProcessedSignals:statistics:", v7, &a4->var13);

      if (!v8)
      {
        objc_msgSend(v6, "clsSceneClassifications");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[CLSCurationModel_v3 avoidIfPossibleForKeyAssetWithSignals:statistics:](self, "avoidIfPossibleForKeyAssetWithSignals:statistics:", v10, &a4->var14);

        goto LABEL_8;
      }
    }
  }
  v9 = 1;
LABEL_8:

  return v9;
}

- (BOOL)hasPoorResolutionWithAsset:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = a3;
  if (objc_msgSend(v3, "isPhoto"))
    v4 = 480;
  else
    v4 = 600;
  v5 = objc_msgSend(v3, "pixelWidth");
  v6 = objc_msgSend(v3, "pixelHeight");

  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  return v7 < v4;
}

- (BOOL)isUtilityForMemoriesWithProcessedSignals:(id)a3
{
  return objc_msgSend(a3, "isNSFWExplicit");
}

- (BOOL)isUtilityForMemoriesWithAsset:(id)a3 userFeedbackCalculator:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSCurationModel_v3;
  if (-[CLSCurationModel_v1 isUtilityForMemoriesWithAsset:userFeedbackCalculator:](&v10, sel_isUtilityForMemoriesWithAsset_userFeedbackCalculator_, v6, a4))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v6, "clsProcessedSignals");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CLSCurationModel_v3 isUtilityForMemoriesWithProcessedSignals:](self, "isUtilityForMemoriesWithProcessedSignals:", v8);

  }
  return v7;
}

- (BOOL)isJunkWithJunkClassification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  unsigned __int8 v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if (self->_r14j9IsAvailable)
  {
    -[CLSCurationModel_v1 junkClassificationModel](self, "junkClassificationModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receiptOrDocumentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "passesWithSignal:", v4);

    if ((v7 & 1) != 0
      || (objc_msgSend(v5, "screenshotNode"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "passesWithSignal:", v4),
          v8,
          (v9 & 1) != 0))
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "textDocumentNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "passesWithSignal:", v4);

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CLSCurationModel_v3;
    v10 = -[CLSCurationModel_v1 isJunkWithJunkClassification:](&v13, sel_isJunkWithJunkClassification_, v4);
  }

  return v10;
}

- (BOOL)filterForFoodieWithClassification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  char v10;
  void *v11;

  v4 = a3;
  -[CLSCurationModel_v1 junkClassificationModel](self, "junkClassificationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medicalReferenceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "passesWithSignal:", v4);

  if ((v7 & 1) != 0
    || (-[CLSTabooEventModel bloodNode](self->_tabooEventModel, "bloodNode"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "passesHighRecallWithSignal:", v4),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 1;
  }
  else
  {
    -[CLSTabooEventModel hospitalNode](self->_tabooEventModel, "hospitalNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "passesHighRecallWithSignal:", v4);

  }
  return v10;
}

- (id)processedSignalsFromSignals:(id)a3
{
  id v4;
  CLSAssetProcessedSignals *v5;
  CLSAssetProcessedSignals *v6;
  id v7;
  CLSAssetProcessedSignals *v8;
  CLSAssetProcessedSignals *v9;
  _QWORD v11[4];
  id v12;
  CLSAssetProcessedSignals *v13;

  v4 = a3;
  v5 = objc_alloc_init(CLSAssetProcessedSignals);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__CLSCurationModel_v3_processedSignalsFromSignals___block_invoke;
  v11[3] = &unk_2514802D8;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  -[CLSCurationModel_v3 enumerateClassificationBasedSignalModelsUsingBlock:](self, "enumerateClassificationBasedSignalModelsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

- (BOOL)isShowcasingFoodWithSceneClassification:(id)a3
{
  CLSSDModel *sdModel;
  id v4;
  void *v5;
  char v6;

  sdModel = self->_sdModel;
  v4 = a3;
  -[CLSSDModel foodDrinkNode](sdModel, "foodDrinkNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "passesWithSignal:", v4);

  return v6;
}

- (void)enumerateSignalModelsUsingBlock:(id)a3
{
  id v4;
  id v5;
  uint64_t *v6;
  CLSNSFWModel *nsfwModel;
  CLSTabooEventModel *tabooEventModel;
  CLSPotentialLandmarkModel *potentialLandmarkModel;
  CLSSDModel *sdModel;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__CLSCurationModel_v3_enumerateSignalModelsUsingBlock___block_invoke;
  v12[3] = &unk_251480458;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  v11.receiver = self;
  v11.super_class = (Class)CLSCurationModel_v3;
  -[CLSCurationModel_v1 enumerateSignalModelsUsingBlock:](&v11, sel_enumerateSignalModelsUsingBlock_, v12);
  v6 = v16;
  if (!*((_BYTE *)v16 + 24))
  {
    nsfwModel = self->_nsfwModel;
    if (!nsfwModel
      || ((*((void (**)(id, CLSNSFWModel *, uint64_t *))v5 + 2))(v5, nsfwModel, v16 + 3),
          v6 = v16,
          !*((_BYTE *)v16 + 24)))
    {
      tabooEventModel = self->_tabooEventModel;
      if (!tabooEventModel
        || ((*((void (**)(id, CLSTabooEventModel *, uint64_t *))v5 + 2))(v5, tabooEventModel, v6 + 3),
            v6 = v16,
            !*((_BYTE *)v16 + 24)))
      {
        potentialLandmarkModel = self->_potentialLandmarkModel;
        if (!potentialLandmarkModel
          || ((*((void (**)(id, CLSPotentialLandmarkModel *, uint64_t *))v5 + 2))(v5, potentialLandmarkModel, v6 + 3), v6 = v16, !*((_BYTE *)v16 + 24)))
        {
          sdModel = self->_sdModel;
          if (sdModel)
            (*((void (**)(id, CLSSDModel *, uint64_t *))v5 + 2))(v5, sdModel, v6 + 3);
        }
      }
    }
  }

  _Block_object_dispose(&v15, 8);
}

- (void)enumerateClassificationBasedSignalModelsUsingBlock:(id)a3
{
  id v4;
  id v5;
  uint64_t *v6;
  CLSNSFWModel *nsfwModel;
  CLSTabooEventModel *tabooEventModel;
  CLSPotentialLandmarkModel *potentialLandmarkModel;
  CLSSDModel *sdModel;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__CLSCurationModel_v3_enumerateClassificationBasedSignalModelsUsingBlock___block_invoke;
  v12[3] = &unk_251480480;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  v11.receiver = self;
  v11.super_class = (Class)CLSCurationModel_v3;
  -[CLSCurationModel_v1 enumerateClassificationBasedSignalModelsUsingBlock:](&v11, sel_enumerateClassificationBasedSignalModelsUsingBlock_, v12);
  v6 = v16;
  if (!*((_BYTE *)v16 + 24))
  {
    nsfwModel = self->_nsfwModel;
    if (!nsfwModel
      || ((*((void (**)(id, CLSNSFWModel *, uint64_t *))v5 + 2))(v5, nsfwModel, v16 + 3),
          v6 = v16,
          !*((_BYTE *)v16 + 24)))
    {
      tabooEventModel = self->_tabooEventModel;
      if (!tabooEventModel
        || ((*((void (**)(id, CLSTabooEventModel *, uint64_t *))v5 + 2))(v5, tabooEventModel, v6 + 3),
            v6 = v16,
            !*((_BYTE *)v16 + 24)))
      {
        potentialLandmarkModel = self->_potentialLandmarkModel;
        if (!potentialLandmarkModel
          || ((*((void (**)(id, CLSPotentialLandmarkModel *, uint64_t *))v5 + 2))(v5, potentialLandmarkModel, v6 + 3), v6 = v16, !*((_BYTE *)v16 + 24)))
        {
          sdModel = self->_sdModel;
          if (sdModel)
            (*((void (**)(id, CLSSDModel *, uint64_t *))v5 + 2))(v5, sdModel, v6 + 3);
        }
      }
    }
  }

  _Block_object_dispose(&v15, 8);
}

- (CLSNSFWModel)nsfwModel
{
  return (CLSNSFWModel *)objc_getProperty(self, a2, 120, 1);
}

- (CLSTabooEventModel)tabooEventModel
{
  return (CLSTabooEventModel *)objc_getProperty(self, a2, 128, 1);
}

- (CLSPotentialLandmarkModel)potentialLandmarkModel
{
  return (CLSPotentialLandmarkModel *)objc_getProperty(self, a2, 136, 1);
}

- (CLSSDModel)sdModel
{
  return (CLSSDModel *)objc_getProperty(self, a2, 144, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sdModel, 0);
  objc_storeStrong((id *)&self->_potentialLandmarkModel, 0);
  objc_storeStrong((id *)&self->_tabooEventModel, 0);
  objc_storeStrong((id *)&self->_nsfwModel, 0);
}

@end
