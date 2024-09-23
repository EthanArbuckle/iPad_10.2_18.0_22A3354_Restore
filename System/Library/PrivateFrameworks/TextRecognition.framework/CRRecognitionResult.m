@implementation CRRecognitionResult

- (CRRecognitionResult)init
{
  CRRecognitionResult *v2;
  uint64_t v3;
  NSMutableDictionary *detectorRecognizerResultMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRRecognitionResult;
  v2 = -[CRRecognitionResult init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    detectorRecognizerResultMap = v2->_detectorRecognizerResultMap;
    v2->_detectorRecognizerResultMap = (NSMutableDictionary *)v3;

    v2->_mapUpdateLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRRecognitionResult *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(CRRecognitionResult);
  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[CRRecognitionResult setDetectorRecognizerResultMap:](v4, "setDetectorRecognizerResultMap:", v6);

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CRMutableRecognitionResult *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(CRMutableRecognitionResult);
  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[CRRecognitionResult setDetectorRecognizerResultMap:](v4, "setDetectorRecognizerResultMap:", v6);

  return v4;
}

- (id)recognizedLineRegions
{
  void *v2;
  void *v3;
  void *v4;

  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)recognizedRegionsForDetectedLineRegion:(id)a3
{
  os_unfair_lock_s *p_mapUpdateLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_mapUpdateLock = &self->_mapUpdateLock;
  v5 = a3;
  os_unfair_lock_lock(p_mapUpdateLock);
  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_mapUpdateLock);
  objc_msgSend(v8, "recognizedTextRegions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)recognizedRegionsForDetectedLineRegions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_mapUpdateLock);
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[CRRecognitionResult _recognizedRegionsForDetectedLineRegion:](self, "_recognizedRegionsForDetectedLineRegion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_mapUpdateLock);
  return v5;
}

- (void)enumerateResultsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CRRecognitionResult_enumerateResultsUsingBlock___block_invoke;
  v7[3] = &unk_1E98DB4C8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __50__CRRecognitionResult_enumerateResultsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a3;
  objc_msgSend(v4, "detectedLineRegion");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recognizedTextRegions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v6, v5);
}

- (void)addRecognizedRegionPair:(id)a3
{
  os_unfair_lock_s *p_mapUpdateLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_mapUpdateLock = &self->_mapUpdateLock;
  v5 = a3;
  os_unfair_lock_lock(p_mapUpdateLock);
  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detectedLineRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);

  os_unfair_lock_unlock(p_mapUpdateLock);
}

- (id)_recognizedRegionsForDetectedLineRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CRRecognitionResult detectorRecognizerResultMap](self, "detectorRecognizerResultMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "recognizedTextRegions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSMutableDictionary)detectorRecognizerResultMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetectorRecognizerResultMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)detectedLineRegions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDetectedLineRegions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedLineRegions, 0);
  objc_storeStrong((id *)&self->_detectorRecognizerResultMap, 0);
}

@end
