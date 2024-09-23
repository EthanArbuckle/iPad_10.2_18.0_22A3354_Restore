@implementation PGCustomFoodieAssetFilter

- (PGCustomFoodieAssetFilter)init
{
  PGCustomFoodieAssetFilter *v2;
  uint64_t v3;
  CLSSceneConfidenceThresholdHelper *foodScenesHelper;
  uint64_t v5;
  CLSSceneConfidenceThresholdHelper *drinkScenesHelper;
  uint64_t v7;
  CLSSceneConfidenceThresholdHelper *forbiddenScenesHelper;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PGCustomFoodieAssetFilter;
  v2 = -[PGCustomFoodieAssetFilter init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84EA3C0, 1);
    foodScenesHelper = v2->_foodScenesHelper;
    v2->_foodScenesHelper = (CLSSceneConfidenceThresholdHelper *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84EA3D8, 1);
    drinkScenesHelper = v2->_drinkScenesHelper;
    v2->_drinkScenesHelper = (CLSSceneConfidenceThresholdHelper *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E28]), "initWithSceneNames:thresholdType:", &unk_1E84EA3F0, 5);
    forbiddenScenesHelper = v2->_forbiddenScenesHelper;
    v2->_forbiddenScenesHelper = (CLSSceneConfidenceThresholdHelper *)v7;

  }
  return v2;
}

- (id)filteredAssetsFromAssets:(id)a3 curationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[PGCustomFoodieAssetFilter _passesWithAsset:curationContext:](self, "_passesWithAsset:curationContext:", v14, v7, (_QWORD)v16))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_passesWithAsset:(id)a3 curationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  void *v34;
  double v35;
  char v36;
  char v37;
  char v38;
  id v40;
  id v41;
  void *v42;
  id obj;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "curationModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userFeedbackCalculator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v6, v9);

  if ((v10 & 1) != 0
    || (objc_msgSend(v6, "clsFaceInformationSummary"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "numberOfFaces"),
        v11,
        v12)
    || !objc_msgSend(v8, "isShowcasingFoodWithAsset:", v6))
  {
    v38 = 0;
    goto LABEL_33;
  }
  -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_foodScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v8);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_drinkScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSSceneConfidenceThresholdHelper confidenceThresholdBySceneIdentifierWithCurationModel:](self->_forbiddenScenesHelper, "confidenceThresholdBySceneIdentifierWithCurationModel:", v8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "junkClassificationModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "foodOrDrinkNode");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v6, "clsSceneClassifications");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v47)
  {

    v38 = 0;
    goto LABEL_41;
  }
  v42 = v8;
  obj = v14;
  v40 = v6;
  v41 = v7;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v50;
  v19 = 0x1E0CB3000uLL;
LABEL_6:
  v20 = 0;
  while (1)
  {
    if (*(_QWORD *)v50 != v18)
      objc_enumerationMutation(obj);
    v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v20);
    if ((objc_msgSend(v8, "filterForFoodieWithClassification:", v21) & 1) != 0)
      goto LABEL_38;
    objc_msgSend(*(id *)(v19 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v21, "extendedSceneIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "confidence");
    v24 = v23;
    objc_msgSend(v48, "objectForKeyedSubscript:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "doubleValue");
      if (v24 >= v27)
        break;
    }
    if (v16)
    {
      v16 = 1;
      if ((v17 & 1) == 0)
        goto LABEL_14;
    }
    else
    {
      v32 = v18;
      objc_msgSend(v46, "objectForKeyedSubscript:", v22);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      v16 = 0;
      if (v33)
      {
        objc_msgSend(v33, "doubleValue");
        if (v24 >= v35)
          v16 = 1;
      }

      v18 = v32;
      v8 = v42;
      v19 = 0x1E0CB3000;
      if ((v17 & 1) == 0)
      {
LABEL_14:
        v17 = objc_msgSend(v44, "passesHighPrecisionWithSignal:", v21);
        if ((v15 & 1) != 0)
          goto LABEL_26;
        goto LABEL_15;
      }
    }
    v17 = 1;
    if ((v15 & 1) != 0)
    {
LABEL_26:
      v36 = 1;
      goto LABEL_27;
    }
LABEL_15:
    objc_msgSend(v45, "objectForKeyedSubscript:", v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v31 = 0;
    if (v28)
    {
      objc_msgSend(v28, "doubleValue");
      if (v24 >= v30)
        v31 = 1;
    }

    v36 = v31;
LABEL_27:
    v15 = v36;
    v37 = v16 & v36 & v17;

    if ((v37 & 1) != 0)
    {

      v15 = 1;
      v16 = 1;
      goto LABEL_36;
    }
    if (v47 == ++v20)
    {
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v47)
        goto LABEL_6;

      if ((v17 & 1) == 0)
        goto LABEL_39;
LABEL_36:
      v38 = v16 | v15 ^ 1;
      goto LABEL_40;
    }
  }

LABEL_38:
LABEL_39:
  v38 = 0;
LABEL_40:
  v6 = v40;
  v7 = v41;
LABEL_41:

LABEL_33:
  return v38;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenScenesHelper, 0);
  objc_storeStrong((id *)&self->_drinkScenesHelper, 0);
  objc_storeStrong((id *)&self->_foodScenesHelper, 0);
}

+ (NSString)name
{
  return (NSString *)CFSTR("CustomFoodie");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
