@implementation PXSearchResultsAssetCurationObject

- (PXSearchResultsAssetCurationObject)initWithAsset:(id)a3 sceneClassifications:(id)a4 searchQuerySceneIdentifiers:(id)a5 sceneTaxonomyProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PXSearchResultsAssetCurationObject *v15;
  PXSearchResultsAssetCurationObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  float v20;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PXSearchResultsAssetCurationObject;
  v15 = -[PXSearchResultsAssetCurationObject init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_asset, a3);
    objc_msgSend(v11, "sceneAnalysisProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "sceneAnalysisVersion");

    objc_msgSend(v14, "searchIndexSceneTaxonomyForSceneAnalysisVersion:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      +[PXSearchResultsAssetCurationObject _calculateDominantSceneScoreWithSceneClassifications:searchQuerySceneIdentifiers:sceneTaxonomy:](PXSearchResultsAssetCurationObject, "_calculateDominantSceneScoreWithSceneClassifications:searchQuerySceneIdentifiers:sceneTaxonomy:", v12, v13, v19);
    }
    else
    {
      PLSearchUIAssetCurationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v25 = v18;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_INFO, "Could not open scene taxonomy for version %i. Top Asset curation for dominant objects may be degraded.", buf, 8u);
      }

      v20 = 0.0;
    }
    v16->_preCalculatedDominantSceneScore = v20;

  }
  return v16;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (float)preCalculatedDominantSceneScore
{
  return self->_preCalculatedDominantSceneScore;
}

- (void)setPreCalculatedDominantSceneScore:(float)a3
{
  self->_preCalculatedDominantSceneScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

+ (float)_calculateDominantSceneScoreWithSceneClassifications:(id)a3 searchQuerySceneIdentifiers:(id)a4 sceneTaxonomy:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  uint64_t j;
  void *v25;
  id v26;
  void *v27;
  float v28;
  double v29;
  double v30;
  double v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  uint64_t k;
  float v44;
  float v45;
  float v46;
  NSObject *v47;
  os_signpost_id_t v48;
  os_signpost_id_t v49;
  id v51;
  id v52;
  id obj;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t v70[128];
  uint8_t buf[4];
  uint64_t v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v56 = a5;
  if (objc_msgSend(v8, "count"))
  {
    PLPhotosSearchGetLog();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v51 = a1;
    v11 = os_signpost_id_make_with_pointer(v10, a1);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PXSearchResultsAssetCurationObject - Calculate Dominant Scene Score", " enableTelemetry=YES ", buf, 2u);
      }
    }

    v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v52 = v9;
    obj = v9;
    v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    if (v57)
    {
      v54 = *(_QWORD *)v67;
      v13 = *MEMORY[0x1E0C9D820];
      v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      do
      {
        for (i = 0; i != v57; ++i)
        {
          if (*(_QWORD *)v67 != v54)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "sceneTaxonomyDetectorNodeSceneIDsFromSceneID:sceneTaxonomy:", objc_msgSend(v16, "integerValue"), v56);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v63;
            v23 = 0.0;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v63 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "stringValue");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v8;
                +[PXSearchResultsAssetCurationObject _sceneClassificationForSceneIdentifier:sceneClassifications:](PXSearchResultsAssetCurationObject, "_sceneClassificationForSceneIdentifier:sceneClassifications:", objc_msgSend(v25, "longLongValue"), v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                v28 = 0.0;
                if (v27)
                {
                  objc_msgSend(v27, "boundingBox");
                  if (v13 != v30 || v14 != v29)
                  {
                    objc_msgSend(v27, "boundingBox");
                    v28 = v32 * v33;
                  }
                }

                if (v28 > v23)
                  v23 = v28;
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
            }
            while (v21);
          }
          else
          {
            v23 = 0.0;
          }

          *(float *)&v34 = v23;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "addObject:", v35);

        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      }
      while (v57);
    }

    PLPhotosSearchGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(v55, "count");
      *(_DWORD *)buf = 134217984;
      v72 = v37;
      _os_log_impl(&dword_1A6789000, v36, OS_LOG_TYPE_DEFAULT, "PXSearchResultsAssetCurationObject: able to calculate %li dominant scene scores for the current asset", buf, 0xCu);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v38 = v55;
    v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v59;
      v42 = 0.0;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v59 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * k), "floatValue");
          v42 = v42 + v44;
        }
        v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v40);
    }
    else
    {
      v42 = 0.0;
    }

    v46 = (float)(unint64_t)-[NSObject count](v38, "count");
    PLPhotosSearchGetLog();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    v48 = os_signpost_id_make_with_pointer(v47, v51);
    if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v49 = v48;
      if (os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v47, OS_SIGNPOST_INTERVAL_END, v49, "PXSearchResultsAssetCurationObject - Calculate Dominant Scene Score", " enableTelemetry=YES ", buf, 2u);
      }
    }
    v45 = v42 / v46;

    v9 = v52;
  }
  else
  {
    PLSearchUIAssetCurationGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    v45 = 0.0;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v38, OS_LOG_TYPE_INFO, "PXSearchResultsAssetCurationObject: no scene classification objects available for asset", buf, 2u);
    }
  }

  return v45;
}

+ (id)_sceneClassificationForSceneIdentifier:(unint64_t)a3 sceneClassifications:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  float v14;
  double v15;
  double v16;
  float v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v11, "extendedSceneIdentifier") == a3)
        {
          objc_msgSend(v11, "boundingBox");
          v14 = v12 * v13;
          objc_msgSend(v8, "boundingBox");
          v17 = v15 * v16;
          if (v14 > v17)
          {
            v18 = v11;

            v8 = v18;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
