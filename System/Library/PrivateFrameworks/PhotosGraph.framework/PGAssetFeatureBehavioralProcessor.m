@implementation PGAssetFeatureBehavioralProcessor

- (PGAssetFeatureBehavioralProcessor)initWithGoldAssets:(id)a3 loggingConnection:(id)a4
{
  return -[PGAssetFeatureBehavioralProcessor initWithGoldAssets:persistedData:loggingConnection:](self, "initWithGoldAssets:persistedData:loggingConnection:", a3, MEMORY[0x1E0C9AA70], a4);
}

- (PGAssetFeatureBehavioralProcessor)initWithGoldAssets:(id)a3 persistedData:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGAssetFeatureBehavioralProcessor *v12;
  PGAssetFeatureBehavioralProcessor *v13;
  uint64_t v14;
  NSDictionary *personFeatures;
  uint64_t v16;
  NSDictionary *sceneFeatures;
  void *v18;
  double v19;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PGAssetFeatureBehavioralProcessor;
  v12 = -[PGAssetFeatureBehavioralProcessor init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_goldAssets, a3);
    objc_msgSend(v10, "objectForKeyedSubscript:", PGAssetFeatureBehavioralProcessorPeopleFeaturesKey);
    v14 = objc_claimAutoreleasedReturnValue();
    personFeatures = v13->_personFeatures;
    v13->_personFeatures = (NSDictionary *)v14;

    objc_msgSend(v10, "objectForKeyedSubscript:", PGAssetFeatureBehavioralProcessorSceneFeaturesKey);
    v16 = objc_claimAutoreleasedReturnValue();
    sceneFeatures = v13->_sceneFeatures;
    v13->_sceneFeatures = (NSDictionary *)v16;

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("normalizer"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v13->_similarityScoreNormalizer = v19;

    objc_storeStrong((id *)&v13->_loggingConnection, a5);
  }

  return v13;
}

- (void)preprocessWithProgressBlock:(id)a3
{
  id v4;
  void (**v5)(void *, uint8_t *, double);
  double v6;
  double v7;
  OS_os_log *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  double Current;
  void *v14;
  void *v15;
  uint64_t v16;
  uint32_t denom;
  uint32_t numer;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[5];
  _QWORD v24[5];
  mach_timebase_info info;
  uint8_t v26[4];
  _BYTE v27[18];
  uint8_t buf[8];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(void *, uint8_t *, double))_Block_copy(v4);
  v6 = 0.0;
  if (!v5 || (v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    v8 = self->_loggingConnection;
    v9 = os_signpost_id_generate((os_log_t)v8);
    v10 = v8;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "BehavioralSemanticMap", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v21 = mach_absolute_time();
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke;
    v24[3] = &unk_1E8432820;
    v24[4] = self;
    -[PGAssetFeatureBehavioralProcessor personAndSceneFeaturesFromGoldAssetsUsingBlock:](self, "personAndSceneFeaturesFromGoldAssetsUsingBlock:", v24);
    if (v5)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v6 >= 0.01)
      {
        v26[0] = 0;
        v5[2](v5, v26, 0.5);
        if (v26[0])
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 76;
            LOWORD(v29) = 2080;
            *(_QWORD *)((char *)&v29 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/UserBehavior/PGAssetFeatureBehavioralProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_27:

          goto LABEL_28;
        }
        v6 = Current;
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v29 = buf;
    *((_QWORD *)&v29 + 1) = 0x2020000000;
    v30 = 0;
    -[NSSet allObjects](self->_goldAssets, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGAssetFeatureBehavioralProcessor _semanticScoreByAssetUUIDForAssets:normalize:](self, "_semanticScoreByAssetUUIDForAssets:normalize:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke_159;
    v23[3] = &unk_1E8432848;
    v23[4] = buf;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v23);
    self->_similarityScoreNormalizer = *(double *)(v29 + 24);
    v16 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v19 = v11;
    v20 = v19;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_END, v9, "BehavioralSemanticMap", ", v26, 2u);
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v26 = 136315394;
      *(_QWORD *)v27 = "BehavioralSemanticMap";
      *(_WORD *)&v27[8] = 2048;
      *(double *)&v27[10] = (float)((float)((float)((float)(v16 - v21) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v26, 0x16u);
    }
    if (v5)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v22 = 0;
        v5[2](v5, (uint8_t *)&v22, 1.0);
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v26 = 67109378;
            *(_DWORD *)v27 = 93;
            *(_WORD *)&v27[4] = 2080;
            *(_QWORD *)&v27[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/UserBehavior/PGAssetFeatureBehavioralProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v26, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(buf, 8);
    goto LABEL_27;
  }
  v26[0] = 0;
  v5[2](v5, v26, 0.0);
  if (!v26[0])
  {
    v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 67;
    LOWORD(v29) = 2080;
    *(_QWORD *)((char *)&v29 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/UserBehavior/PGAssetFeatureBehavioralProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_28:

}

- (id)semanticScoreByAssetUUIDForAssets:(id)a3
{
  return -[PGAssetFeatureBehavioralProcessor _semanticScoreByAssetUUIDForAssets:normalize:](self, "_semanticScoreByAssetUUIDForAssets:normalize:", a3, 1);
}

- (float)semanticScoreForAsset:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGAssetFeatureBehavioralProcessor _semanticScoreByAssetUUIDForAssets:normalize:](self, "_semanticScoreByAssetUUIDForAssets:normalize:", v6, 1, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  return v11;
}

- (id)_semanticScoreByAssetUUIDForAssets:(id)a3 normalize:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  float v23;
  float v24;
  void *v25;
  uint64_t v26;
  double similarityScoreNormalizer;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  float v36;
  float v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  id obj;
  uint64_t v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v45 = a4;
  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "verifiedPersonLocalIdentifiersByAssetUUIDWithAssets:", v5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CD1620]);
    v41 = v7;
    v40 = (void *)objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v5, v7, *MEMORY[0x1E0CD1B90], 0, 0, 1);
    objc_msgSend(MEMORY[0x1E0CD1750], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v42 = v5;
    obj = v5;
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v49)
    {
      v44 = *(_QWORD *)v63;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v63 != v44)
            objc_enumerationMutation(obj);
          v53 = v9;
          v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v9);
          v52 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v10, "uuid");
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "localIdentifier");
          v12 = objc_claimAutoreleasedReturnValue();
          v51 = (void *)v11;
          objc_msgSend(v47, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v59;
            v17 = 0.0;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v59 != v16)
                  objc_enumerationMutation(v13);
                -[NSDictionary objectForKeyedSubscript:](self->_personFeatures, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i));
                v19 = objc_claimAutoreleasedReturnValue();
                v20 = (void *)v19;
                if (v19)
                  v21 = (void *)v19;
                else
                  v21 = &unk_1E84E4C40;
                v22 = v21;

                objc_msgSend(v22, "floatValue");
                v24 = v23;

                v17 = v17 + v24;
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            }
            while (v15);
          }
          else
          {
            v17 = 0.0;
          }
          v50 = (void *)v12;
          objc_msgSend(v46, "objectForKeyedSubscript:", v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          if (v26)
          {
            v28 = v26;
            v29 = *(_QWORD *)v55;
            do
            {
              for (j = 0; j != v28; ++j)
              {
                if (*(_QWORD *)v55 != v29)
                  objc_enumerationMutation(v25);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "extendedSceneIdentifier"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary objectForKeyedSubscript:](self->_sceneFeatures, "objectForKeyedSubscript:", v31);
                v32 = objc_claimAutoreleasedReturnValue();
                v33 = (void *)v32;
                if (v32)
                  v34 = (void *)v32;
                else
                  v34 = &unk_1E84E4C40;
                v35 = v34;

                objc_msgSend(v35, "floatValue");
                v37 = v36;

                v17 = v17 + v37;
              }
              v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            }
            while (v28);
          }
          if (v45)
          {
            similarityScoreNormalizer = self->_similarityScoreNormalizer;
            *(float *)&similarityScoreNormalizer = similarityScoreNormalizer;
            v17 = v17 / *(float *)&similarityScoreNormalizer;
          }
          *(float *)&similarityScoreNormalizer = v17;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", similarityScoreNormalizer);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v38, v51);

          objc_autoreleasePoolPop(v52);
          v9 = v53 + 1;
        }
        while (v53 + 1 != v49);
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      }
      while (v49);
    }

    v7 = v41;
    v5 = v42;
  }
  else
  {
    v48 = (id)MEMORY[0x1E0C9AA70];
  }

  return v48;
}

- (void)personAndSceneFeaturesFromGoldAssetsUsingBlock:(id)a3
{
  void (**v4)(_QWORD, void *, void *);
  NSUInteger v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t n;
  uint64_t v59;
  unint64_t v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void (**v68)(_QWORD, void *, void *);
  void *v69;
  void *v70;
  void *v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  _QWORD v100[2];
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD, void *, void *))a3;
  v5 = -[NSSet count](self->_goldAssets, "count");
  if (v5)
  {
    v6 = v5;
    v68 = v4;
    -[NSSet allObjects](self->_goldAssets, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = v7;
    objc_msgSend(MEMORY[0x1E0CD1390], "verifiedPersonLocalIdentifiersByAssetUUIDWithAssets:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v95;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v95 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v91;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v91 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * j));
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
            }
            while (v18);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v22 = v10;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
    v24 = v6;
    if (v23)
    {
      v25 = v23;
      v26 = *(_QWORD *)v87;
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v87 != v26)
            objc_enumerationMutation(v22);
          v28 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * k);
          v29 = objc_msgSend(v22, "countForObject:", v28);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v29 / (double)v6);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, v28);

        }
        v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
      }
      while (v25);
    }
    v67 = v21;

    v31 = objc_alloc(MEMORY[0x1E0CD1620]);
    v66 = (void *)objc_msgSend(v31, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v71, v70, *MEMORY[0x1E0CD1B90], 0, 0, 1);
    objc_msgSend(MEMORY[0x1E0CD1750], "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "librarySpecificFetchOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0CD19F0];
    v100[0] = *MEMORY[0x1E0CD1A50];
    v100[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFetchPropertySets:", v35);

    v36 = (void *)MEMORY[0x1E0CD1390];
    v69 = v32;
    objc_msgSend(v32, "allKeys");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v33;
    objc_msgSend(v36, "fetchAssetsWithLocalIdentifiers:options:", v37, v33);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_alloc_init(MEMORY[0x1E0D77E18]);
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v38, "count"));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v38;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v83;
      do
      {
        for (m = 0; m != v42; ++m)
        {
          if (*(_QWORD *)v83 != v43)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * m);
          objc_msgSend(v39, "curationModelForAsset:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "localIdentifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v46, v47);

        }
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
      }
      while (v42);
    }

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __84__PGAssetFeatureBehavioralProcessor_personAndSceneFeaturesFromGoldAssetsUsingBlock___block_invoke;
    v77[3] = &unk_1E8432870;
    v64 = v40;
    v78 = v64;
    v63 = v50;
    v79 = v63;
    v62 = v49;
    v80 = v62;
    v51 = v48;
    v81 = v51;
    objc_msgSend(v69, "enumerateKeysAndObjectsUsingBlock:", v77);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v53 = v51;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v74;
      v57 = (double)v24;
      do
      {
        for (n = 0; n != v55; ++n)
        {
          if (*(_QWORD *)v74 != v56)
            objc_enumerationMutation(v53);
          v59 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * n);
          v60 = objc_msgSend(v53, "countForObject:", v59);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v60 / v57);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v61, v59);

        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
      }
      while (v55);
    }

    v4 = v68;
    v68[2](v68, v67, v52);

  }
  else
  {
    v4[2](v4, (void *)MEMORY[0x1E0C9AA70], (void *)MEMORY[0x1E0C9AA70]);
  }

}

- (id)dataToPersist
{
  NSDictionary *sceneFeatures;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6[0] = PGAssetFeatureBehavioralProcessorPeopleFeaturesKey;
  v6[1] = PGAssetFeatureBehavioralProcessorSceneFeaturesKey;
  sceneFeatures = self->_sceneFeatures;
  v7[0] = self->_personFeatures;
  v7[1] = sceneFeatures;
  v6[2] = CFSTR("normalizer");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_similarityScoreNormalizer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)goldAssets
{
  return self->_goldAssets;
}

- (void)setGoldAssets:(id)a3
{
  objc_storeStrong((id *)&self->_goldAssets, a3);
}

- (NSDictionary)personFeatures
{
  return self->_personFeatures;
}

- (void)setPersonFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_personFeatures, a3);
}

- (NSDictionary)sceneFeatures
{
  return self->_sceneFeatures;
}

- (void)setSceneFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_sceneFeatures, a3);
}

- (double)similarityScoreNormalizer
{
  return self->_similarityScoreNormalizer;
}

- (void)setSimilarityScoreNormalizer:(double)a3
{
  self->_similarityScoreNormalizer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneFeatures, 0);
  objc_storeStrong((id *)&self->_personFeatures, 0);
  objc_storeStrong((id *)&self->_goldAssets, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __84__PGAssetFeatureBehavioralProcessor_personAndSceneFeaturesFromGoldAssetsUsingBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *context;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v25 = v5;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sceneModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "extendedSceneIdentifier");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v12, "extendedSceneIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v14);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v18 = v15;
        }
        else
        {
          objc_msgSend(v26, "taxonomyNodeForSceneIdentifier:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v18, v14);
          objc_msgSend(v18, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v18, "isIndexed"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = (void *)MEMORY[0x1E0C9AAA0];
          }
          objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v17, v14);

        }
        if (objc_msgSend(v17, "BOOLValue"))
        {
          objc_msgSend(v12, "confidence");
          v21 = v20;
          objc_msgSend(v18, "graphHighPrecisionThreshold");
          if (v21 >= v22)
            objc_msgSend(a1[7], "addObject:", v14);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  objc_autoreleasePoolPop(context);
}

void __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setPersonFeatures:", v6);

  v7 = (id)objc_msgSend(v5, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setSceneFeatures:", v7);

}

uint64_t __65__PGAssetFeatureBehavioralProcessor_preprocessWithProgressBlock___block_invoke_159(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  float v5;
  double v6;
  uint64_t v7;

  result = objc_msgSend(a3, "floatValue");
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(double *)(v7 + 24) < v6)
    *(double *)(v7 + 24) = v6;
  return result;
}

@end
