@implementation CRMutableRecognitionResult

- (void)addRecognizedRegions:(id)a3 detectedRegion:(id)a4
{
  os_unfair_lock_s *p_mapUpdateLock;
  id v7;
  id v8;
  CRDetectedRecognizedRegionPair *v9;
  void *v10;
  void *v11;

  p_mapUpdateLock = &self->super._mapUpdateLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_mapUpdateLock);
  v9 = -[CRDetectedRecognizedRegionPair initWithDetectedRegion:recognizedRegions:]([CRDetectedRecognizedRegionPair alloc], "initWithDetectedRegion:recognizedRegions:", v7, v8);

  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);
  os_unfair_lock_unlock(p_mapUpdateLock);
}

- (void)addContentsOfRecognitionResult:(id)a3 shouldOverwriteExistingHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->super._mapUpdateLock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "detectorRecognizerResultMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __92__CRMutableRecognitionResult_addContentsOfRecognitionResult_shouldOverwriteExistingHandler___block_invoke;
  v21[3] = &unk_1E98DB4F0;
  v21[4] = self;
  v10 = v7;
  v23 = v10;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v21);

  os_unfair_lock_unlock(&self->super._mapUpdateLock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        -[CRRecognitionResult addRecognizedRegionPair:](self, "addRecognizedRegionPair:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    }
    while (v14);
  }

}

void __92__CRMutableRecognitionResult_addContentsOfRecognitionResult_shouldOverwriteExistingHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "detectorRecognizerResultMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_3;
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "detectorRecognizerResultMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recognizedTextRegions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recognizedTextRegions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *, void *))(v8 + 16))(v8, v11, v12);

  if ((_DWORD)v8)
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

@end
