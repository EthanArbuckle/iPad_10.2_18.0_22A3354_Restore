@implementation PLUtilityAsset

- (void)_prepareForRecycle
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_sceneAnalysisVersion = 0;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_sceneClassifications;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "_prepareForRecycle", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_sceneClassifications, "removeAllObjects");
}

- (PLUtilityAsset)init
{
  PLUtilityAsset *v2;
  PLUtilityAsset *v3;
  uint64_t v4;
  NSMutableSet *sceneClassifications;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLUtilityAsset;
  v2 = -[PLUtilityAsset init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_sceneAnalysisVersion = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();
    sceneClassifications = v3->_sceneClassifications;
    v3->_sceneClassifications = (NSMutableSet *)v4;

    *(_WORD *)&v3->_isAIImageFromGenerativePlayground = 0;
  }
  return v3;
}

- (int64_t)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (void)setSceneAnalysisVersion:(int64_t)a3
{
  self->_sceneAnalysisVersion = a3;
}

- (NSMutableSet)sceneClassifications
{
  return self->_sceneClassifications;
}

- (void)setSceneClassifications:(id)a3
{
  objc_storeStrong((id *)&self->_sceneClassifications, a3);
}

- (BOOL)isAIImageFromGenerativePlayground
{
  return self->_isAIImageFromGenerativePlayground;
}

- (void)setIsAIImageFromGenerativePlayground:(BOOL)a3
{
  self->_isAIImageFromGenerativePlayground = a3;
}

- (BOOL)hasQRCodeData
{
  return self->_hasQRCodeData;
}

- (void)setHasQRCodeData:(BOOL)a3
{
  self->_hasQRCodeData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneClassifications, 0);
}

+ (id)utilityAssetFromManagedAsset:(id)a3 usingPool:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PLUtilityAsset *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  PLUtilityAssetClassification *v24;
  void *v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLUtilityAsset.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "_dequeueRecylableAsset");
      v10 = (PLUtilityAsset *)objc_claimAutoreleasedReturnValue();
      if (v10)
        goto LABEL_5;
    }
  }
  v10 = objc_alloc_init(PLUtilityAsset);
LABEL_5:
  objc_msgSend(v7, "mediaAnalysisAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "characterRecognitionAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "machineReadableCodeData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUtilityAsset setHasQRCodeData:](v10, "setHasQRCodeData:", v13 != 0);

  objc_msgSend(v7, "extendedAttributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "generativeAIType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUtilityAsset setIsAIImageFromGenerativePlayground:](v10, "setIsAIImageFromGenerativePlayground:", objc_msgSend(v15, "intValue") == 1);

  objc_msgSend(v7, "additionalAttributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLUtilityAsset setSceneAnalysisVersion:](v10, "setSceneAnalysisVersion:", (int)objc_msgSend(v16, "sceneAnalysisVersion"));

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "additionalAttributes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sceneClassifications");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v22);
        if (!v9
          || (objc_msgSend(v9, "_dequeueRecylableClassification"),
              (v24 = (PLUtilityAssetClassification *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v24 = objc_alloc_init(PLUtilityAssetClassification);
        }
        -[PLUtilityAssetClassification setSceneIdentifier:](v24, "setSceneIdentifier:", objc_msgSend(v23, "sceneIdentifier"));
        objc_msgSend(v23, "confidence");
        -[PLUtilityAssetClassification setConfidence:](v24, "setConfidence:");
        -[PLUtilityAssetClassification setPackedBoundingBox:](v24, "setPackedBoundingBox:", objc_msgSend(v23, "packedBoundingBoxRect"));
        -[PLUtilityAssetClassification setClassificationType:](v24, "setClassificationType:", (int)objc_msgSend(v23, "classificationType"));
        -[PLUtilityAsset sceneClassifications](v10, "sceneClassifications");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v24);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v20);
  }

  return v10;
}

@end
