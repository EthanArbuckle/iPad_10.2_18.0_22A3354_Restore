@implementation PGFeatureExtractorCLIPprint

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("CLIPprint");
  return CFSTR("CLIPprint");
}

- (int64_t)featureLength
{
  return 768;
}

- (id)featureNames
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[PGFeatureExtractorCLIPprint featureLength](self, "featureLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGFeatureExtractorCLIPprint featureLength](self, "featureLength") >= 1)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%u"), CFSTR("CLIP"), v5 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:atIndexedSubscript:", v6, v4);

      v4 = v5;
    }
    while (-[PGFeatureExtractorCLIPprint featureLength](self, "featureLength") > v5++);
  }
  return v3;
}

- (id)_floatArrayFromSceneprint:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "elementType");
  if (v4 == 2)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D42A48]);
    objc_msgSend(v3, "descriptorData");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = objc_msgSend(v8, "bytes");

    objc_msgSend(v7, "appendDoubles:count:", v9, objc_msgSend(v3, "elementCount"));
  }
  else if (v4 == 1)
  {
    v5 = objc_alloc(MEMORY[0x1E0D42A20]);
    objc_msgSend(v3, "descriptorData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "initWithData:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGFeatureExtractorCLIPprint featureValuesForAssets:error:](self, "featureValuesForAssets:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)featureValuesForAssets:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_group_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  dispatch_time_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  PGFeatureExtractorCLIPprint *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__48769;
  v37 = __Block_byref_object_dispose__48770;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__48769;
  v31 = __Block_byref_object_dispose__48770;
  v32 = 0;
  v7 = dispatch_group_create();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __60__PGFeatureExtractorCLIPprint_featureValuesForAssets_error___block_invoke;
  v21 = &unk_1E8430298;
  v25 = &v27;
  v26 = &v33;
  v8 = v6;
  v22 = v8;
  v23 = self;
  v9 = v7;
  v24 = v9;
  v10 = _Block_copy(&v18);
  objc_msgSend(MEMORY[0x1E0D475C0], "analysisService", v18, v19, v20, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v9);
  v39 = *MEMORY[0x1E0D47638];
  v40[0] = &unk_1E84E48F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "requestSceneprintProcessingForAssets:withOptions:progressHandler:andCompletionHandler:", v8, v12, 0, v10);

  v14 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v9, v14);
  if (!v34[5])
    objc_msgSend(v11, "cancelRequest:", v13);
  if (a4)
  {
    v15 = (void *)v28[5];
    if (v15)
      *a4 = objc_retainAutorelease(v15);
  }
  v16 = (id)v34[5];

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v16;
}

void __60__PGFeatureExtractorCLIPprint_featureValuesForAssets_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  const __CFString *v35;
  _BYTE v36[128];
  uint64_t v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v12)
    {
      v13 = v12;
      obj = v7;
      v14 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v16, "localIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v23 = *(void **)(v22 + 40);
            *(_QWORD *)(v22 + 40) = 0;

            v7 = obj;
            if (!obj)
            {
              v24 = (void *)MEMORY[0x1E0CB35C8];
              v34 = *MEMORY[0x1E0CB2D50];
              v35 = CFSTR("Media Analysis returned nil for asset sceneprint with no error.");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorCLIPprint"), 3, v25);
              v7 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v7);
            goto LABEL_17;
          }
          objc_msgSend(*(id *)(a1 + 40), "_floatArrayFromSceneprint:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          objc_msgSend(v16, "localIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v13)
          continue;
        break;
      }
      v7 = obj;
    }
  }
  else
  {
    if (!v6)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0CB2D50];
      v38[0] = CFSTR("Media Analysis returned nil result with no error.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureExtractorCLIPprint"), 2, v27);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = v7;
    v11 = *(id *)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v7;
  }
LABEL_17:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end
