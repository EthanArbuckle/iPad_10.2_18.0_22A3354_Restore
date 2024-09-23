@implementation PGMomentFeatureSpecificationFactory

- (PGMomentFeatureSpecificationFactory)initWithSceneTaxonomy:(id)a3 loggingConnection:(id)a4
{
  id v7;
  id v8;
  PGMomentFeatureSpecificationFactory *v9;
  PGMomentFeatureSpecificationFactory *v10;
  NSObject **p_loggingConnection;
  void *v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  CSUCLIPTextEncoderV3 *CLIPTextEncoder;
  NSObject *v20;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PGMomentFeatureSpecificationFactory;
  v9 = -[PGMomentFeatureSpecificationFactory init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneTaxonomy, a3);
    p_loggingConnection = (NSObject **)&v10->_loggingConnection;
    objc_storeStrong((id *)&v10->_loggingConnection, a4);
    v22 = 0;
    objc_msgSend(MEMORY[0x1E0D188A0], "CLIPTextEncoderV3ConfigurationForRevision:error:", objc_msgSend(MEMORY[0x1E0D781F8], "requiredCSUCLIPTextEncoderRevision"), &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;
    if (v13)
    {
      v14 = *p_loggingConnection;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412290;
      v25 = v13;
      v15 = "[PGMomentFeatureSpecificationFactory] CLIP model CSUCLIPTextEncoderV3Configuration creation failed with error %@";
      v16 = v14;
      v17 = 12;
    }
    else
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18898]), "initWithConfiguration:", v12);
      CLIPTextEncoder = v10->_CLIPTextEncoder;
      v10->_CLIPTextEncoder = (CSUCLIPTextEncoderV3 *)v18;

      if (v10->_CLIPTextEncoder)
        goto LABEL_8;
      v20 = *p_loggingConnection;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      *(_WORD *)buf = 0;
      v15 = "[PGMomentFeatureSpecificationFactory] CLIP model from CSUCLIPTextEncoderV3 is nil";
      v16 = v20;
      v17 = 2;
    }
    _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (id)allSupportedFeatureTypes
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 5);
  objc_msgSend(v2, "addIndex:", 7);
  objc_msgSend(v2, "addIndex:", 8);
  objc_msgSend(v2, "addIndex:", 13);
  objc_msgSend(v2, "addIndex:", 9);
  objc_msgSend(v2, "addIndex:", 10);
  objc_msgSend(v2, "addIndex:", 11);
  objc_msgSend(v2, "addIndex:", 12);
  return v2;
}

- (id)specificationsForFeatureType:(unint64_t)a3 progressReporter:(id)a4
{
  id v6;
  id v7;
  NSObject *loggingConnection;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v15[16];

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  switch(a3)
  {
    case 0uLL:
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Attempting to get specification for unknown feature type", v15, 2u);
      }
      break;
    case 1uLL:
      -[PGMomentFeatureSpecificationFactory _peopleSpecification](self, "_peopleSpecification");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 2uLL:
      -[PGMomentFeatureSpecificationFactory _socialGroupSpecification](self, "_socialGroupSpecification");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 3uLL:
      -[PGMomentFeatureSpecificationFactory _beachROISpecification](self, "_beachROISpecification");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4uLL:
      -[PGMomentFeatureSpecificationFactory _mountainROISpecification](self, "_mountainROISpecification");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 5uLL:
      -[PGMomentFeatureSpecificationFactory _natureROISpecification](self, "_natureROISpecification");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 6uLL:
      -[PGMomentFeatureSpecificationFactory _urbanROISpecification](self, "_urbanROISpecification");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 7uLL:
      -[PGMomentFeatureSpecificationFactory _waterROISpecification](self, "_waterROISpecification");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 8uLL:
      -[PGMomentFeatureSpecificationFactory _petSpecification](self, "_petSpecification");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v11 = (void *)v10;
      if (!v10)
        goto LABEL_24;
      goto LABEL_23;
    case 9uLL:
      -[PGMomentFeatureSpecificationFactory _trendsSpecifications](self, "_trendsSpecifications");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[PGMomentFeatureSpecificationFactory _trendsSpecifications](self, "_trendsSpecifications");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v13);

      }
      break;
    case 0xAuLL:
      -[PGMomentFeatureSpecificationFactory _CLIPTrendsSpecificationsWithProgress:](self, "_CLIPTrendsSpecificationsWithProgress:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v7, "addObjectsFromArray:", v11);
      goto LABEL_24;
    case 0xBuLL:
      -[PGMomentFeatureSpecificationFactory _petPersonSpecification](self, "_petPersonSpecification");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 0xCuLL:
      -[PGMomentFeatureSpecificationFactory _excitementAudioSpecification](self, "_excitementAudioSpecification");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 0xDuLL:
      -[PGMomentFeatureSpecificationFactory _foodSpecification](self, "_foodSpecification");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_22:
      v11 = (void *)v9;
LABEL_23:
      objc_msgSend(v7, "addObject:", v11);
LABEL_24:

      break;
    default:
      break;
  }

  return v7;
}

- (id)_trendsSpecifications
{
  __objc2_class **v2;
  uint64_t i;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  PGAssetCollectionFeatureDefinition *v28;
  void *v29;
  void *v30;
  PGAssetCollectionFeatureDefinition *v31;
  PGAssetCollectionFeatureSpecification *v32;
  void *v33;
  PGAssetCollectionFeatureSpecification *v34;
  NSObject *loggingConnection;
  id obj;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  PGAssetCollectionFeatureDefinition *v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PGTrendsMemoryGenerator trendsConfigurations](PGTrendsMemoryGenerator, "trendsConfigurations");
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v44;
    v2 = off_1E83FB000;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v4, "featureLabel");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "positiveScenes");
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)v6;
        v8 = (void *)MEMORY[0x1E0C9AA60];
        if (v6)
          v9 = (void *)v6;
        else
          v9 = (void *)MEMORY[0x1E0C9AA60];
        v10 = v9;

        objc_msgSend(v4, "secondaryPositiveScenes");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (void *)v11;
        else
          v13 = v8;
        v14 = v13;

        objc_msgSend(v4, "positiveDominantScenes");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = v8;
        v18 = v17;

        objc_msgSend(v4, "positiveSemDevScenes");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          v21 = (void *)v19;
        else
          v21 = v8;
        v22 = v21;

        objc_msgSend(v4, "negativeScenes");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (void *)v23;
        else
          v25 = v8;
        v26 = v25;

        v42 = v22;
        v27 = (void *)objc_msgSend(objc_alloc(v2[56]), "initWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:", v10, &__block_literal_global_46130, v14, v18, &__block_literal_global_46130, v22, v26, self->_sceneTaxonomy);

        if (v27)
        {
          v28 = [PGAssetCollectionFeatureDefinition alloc];
          -[__objc2_class name](v2[56], "name");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v29;
          v49 = v27;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v28, "initWithAssetFilterByName:", v30);

          v32 = [PGAssetCollectionFeatureSpecification alloc];
          v47 = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v32, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 9, v5, v33, 1, 1);

          objc_msgSend(v38, "addObject:", v34);
          v2 = off_1E83FB000;

        }
        else
        {
          loggingConnection = self->_loggingConnection;
          if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v5;
            _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Trend configuration '%@' has an invalid scene asset filter, disabling", buf, 0xCu);
          }
        }

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v40);
  }

  return v38;
}

- (id)_CLIPTrendsSpecificationsWithProgress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  OS_os_log *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char v36;
  NSObject *v37;
  _UNKNOWN **v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  PGSceneAssetFilter *v43;
  void *v44;
  uint64_t v45;
  PGAssetCollectionFeatureDefinition *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  PGAssetCollectionFeatureDefinition *v51;
  PGAssetCollectionFeatureSpecification *v52;
  void *v53;
  PGAssetCollectionFeatureSpecification *v54;
  NSObject *loggingConnection;
  NSObject *v56;
  uint64_t v57;
  uint32_t numer;
  uint32_t denom;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  id v63;
  NSObject *v64;
  uint64_t v66;
  os_signpost_id_t spid;
  uint64_t v68;
  unint64_t v69;
  void *v70;
  NSObject *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  void *context;
  void *v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v92[18];
  PGAssetCollectionFeatureDefinition *v93;
  _QWORD v94[2];
  _QWORD v95[2];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v92 = 219;
      *(_WORD *)&v92[4] = 2080;
      *(_QWORD *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Memories/PGMomentFeatureSpecificationFactory.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    goto LABEL_58;
  }
  if (self->_CLIPTextEncoder)
  {
    v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[PGCLIPTrendsMemoryGenerator CLIPTrendsConfigurations](PGCLIPTrendsMemoryGenerator, "CLIPTrendsConfigurations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (v6)
    {
      v7 = v6;
      v8 = self->_loggingConnection;
      v9 = os_signpost_id_generate((os_log_t)v8);
      v10 = v8;
      v11 = v10;
      v69 = v9 - 1;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CLIPTrendsMomentFeatureSpecifications", ", buf, 2u);
      }
      spid = v9;
      v71 = v11;

      info = 0;
      mach_timebase_info(&info);
      v68 = mach_absolute_time();
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v70 = v5;
      v12 = v5;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
      if (v13)
      {
        v14 = v13;
        v15 = 1.0 / (double)v7;
        v16 = *(_QWORD *)v87;
        v17 = 0.0;
        v75 = v12;
        v76 = v4;
        v78 = *(_QWORD *)v87;
LABEL_11:
        v18 = 0;
        v77 = v14;
        while (1)
        {
          if (*(_QWORD *)v87 != v16)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v19, "featureLabel");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "positiveQueries");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v21)
          {
            if (objc_msgSend(v22, "count"))
              break;
          }
LABEL_47:

          objc_autoreleasePoolPop(v20);
          if (++v18 == v14)
          {
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v97, 16);
            if (v14)
              goto LABEL_11;
            goto LABEL_49;
          }
        }
        v80 = v21;
        v81 = v23;
        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v19, "useAveragedEmbeddingAsNumber");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "BOOLValue");

        context = v20;
        if (v26)
        {
          objc_msgSend(MEMORY[0x1E0D781F8], "encodeTextAverage:textEncoder:", v81, self->_CLIPTextEncoder);
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            loggingConnection = self->_loggingConnection;
            v38 = &off_1E83F9000;
            if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "[PGMomentFeatureSpecificationFactory] CLIP text encoder failed", buf, 2u);
            }
            v28 = 0;
            v36 = 1;
            goto LABEL_34;
          }
          v28 = (id)v27;
          objc_msgSend(v24, "addObject:", v27);
        }
        else
        {
          v84 = 0u;
          v85 = 0u;
          v82 = 0u;
          v83 = 0u;
          v28 = v81;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v83;
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v83 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0D781F8], "encodeText:textEncoder:", v33, self->_CLIPTextEncoder);
                v34 = objc_claimAutoreleasedReturnValue();
                if (!v34)
                {
                  v37 = self->_loggingConnection;
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v92 = v33;
                    _os_log_error_impl(&dword_1CA237000, v37, OS_LOG_TYPE_ERROR, "[PGMomentFeatureSpecificationFactory] CLIP text encoder failed for text query %@", buf, 0xCu);
                  }
                  v36 = 1;
                  goto LABEL_32;
                }
                v35 = (void *)v34;
                objc_msgSend(v24, "addObject:", v34);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v82, v96, 16);
              if (v30)
                continue;
              break;
            }
            v36 = 0;
LABEL_32:
            v12 = v75;
            v4 = v76;
            v14 = v77;
            goto LABEL_33;
          }
        }
        v36 = 0;
LABEL_33:
        v38 = &off_1E83F9000;
LABEL_34:

        v17 = v15 + v17;
        if (objc_msgSend(v4, "isCancelledWithProgress:", v17))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v92 = 269;
            *(_WORD *)&v92[4] = 2080;
            *(_QWORD *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/PGMomentFeatureSpecificationFactory.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          objc_autoreleasePoolPop(context);
          v63 = 0;
          v5 = v70;
          v60 = v71;
          goto LABEL_69;
        }
        if ((v36 & 1) == 0)
        {
          objc_msgSend(v19, "cosineSimilarityThresholdByVersion");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(objc_alloc((Class)v38[299]), "initWithPositiveQueryEmbeddings:cosineSimilarityThresholdByVersion:", v24, v39);
          if (v40)
          {
            v74 = v39;
            objc_msgSend(v19, "positiveScenes");
            v41 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "negativeScenes");
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = [PGSceneAssetFilter alloc];
            v66 = v42;
            v73 = (void *)v42;
            v44 = (void *)v41;
            v45 = -[PGSceneAssetFilter initWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:](v43, "initWithPositiveScenes:positiveSceneCustomSignalModelBlock:secondaryPositiveScenes:positiveDominantScenes:positiveDominantSceneCustomSignalModelBlock:positiveSemDevScenes:negativeScenes:sceneTaxonomy:", v41, &__block_literal_global_143, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], &__block_literal_global_143, MEMORY[0x1E0C9AA60], v66, self->_sceneTaxonomy);
            v46 = [PGAssetCollectionFeatureDefinition alloc];
            objc_msgSend(v38[299], "name");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v94[0] = v47;
            v95[0] = v40;
            v48 = (void *)v45;
            +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v94[1] = v49;
            v95[1] = v45;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v46, "initWithAssetFilterByName:", v50);

            v52 = [PGAssetCollectionFeatureSpecification alloc];
            v93 = v51;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v52, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 10, v80, v53, 1, 1);

            if (v54)
              objc_msgSend(v72, "addObject:", v54);

            v39 = v74;
            v12 = v75;
            v4 = v76;
          }
          else
          {
            v56 = self->_loggingConnection;
            if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v92 = v80;
              _os_log_fault_impl(&dword_1CA237000, v56, OS_LOG_TYPE_FAULT, "Trend configuration '%@' has an invalid CLIP asset filter, disabling", buf, 0xCu);
            }
          }

          v14 = v77;
        }

        v16 = v78;
        v20 = context;
        v21 = v80;
        v23 = v81;
        goto LABEL_47;
      }
LABEL_49:

      v57 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v60 = v71;
      v61 = v71;
      v62 = v61;
      if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v62, OS_SIGNPOST_INTERVAL_END, spid, "CLIPTrendsMomentFeatureSpecifications", ", buf, 2u);
      }

      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v92 = "CLIPTrendsMomentFeatureSpecifications";
        *(_WORD *)&v92[8] = 2048;
        *(double *)&v92[10] = (float)((float)((float)((float)(v57 - v68) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v62, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (objc_msgSend(v4, "isCancelledWithProgress:", 1.0))
      {
        v5 = v70;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v92 = 302;
          *(_WORD *)&v92[4] = 2080;
          *(_QWORD *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/PGMomentFeatureSpecificationFactory.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v63 = 0;
      }
      else
      {
        v63 = v72;
        v5 = v70;
      }
LABEL_69:

    }
    else
    {
      v64 = self->_loggingConnection;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v64, OS_LOG_TYPE_ERROR, "[PGMomentFeatureSpecificationFactory] No CLIP Trends configurations returned", buf, 2u);
      }
      if (objc_msgSend(v4, "isCancelledWithProgress:", 1.0)
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v92 = 231;
        *(_WORD *)&v92[4] = 2080;
        *(_QWORD *)&v92[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Memories/PGMomentFeatureSpecificationFactory.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v63 = 0;
    }

    goto LABEL_71;
  }
LABEL_58:
  v63 = 0;
LABEL_71:

  return v63;
}

- (id)_petSpecification
{
  PGSceneAssetFilter *v3;
  PGAssetCollectionFeatureDefinition *v4;
  void *v5;
  void *v6;
  PGAssetCollectionFeatureDefinition *v7;
  PGAssetCollectionFeatureSpecification *v8;
  void *v9;
  PGAssetCollectionFeatureSpecification *v10;
  NSObject *loggingConnection;
  uint8_t v13[16];
  PGAssetCollectionFeatureDefinition *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PGSceneAssetFilter initWithPositiveScenes:negativeScenes:sceneTaxonomy:]([PGSceneAssetFilter alloc], "initWithPositiveScenes:negativeScenes:sceneTaxonomy:", &unk_1E84EA228, &unk_1E84EA240, self->_sceneTaxonomy);
  if (v3)
  {
    v4 = [PGAssetCollectionFeatureDefinition alloc];
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v4, "initWithAssetFilterByName:", v6);

    v8 = [PGAssetCollectionFeatureSpecification alloc];
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v8, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 8, CFSTR("Pet"), v9, 1, 1);

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Pet specification has an invalid scene asset filter, disabling", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_beachROISpecification
{
  PGSceneAssetFilter *v3;
  PGSceneAssetFilter *v4;
  PGAssetCollectionFeatureDefinition *v5;
  void *v6;
  void *v7;
  PGAssetCollectionFeatureDefinition *v8;
  PGAssetCollectionFeatureSpecification *v9;
  void *v10;
  PGAssetCollectionFeatureSpecification *v11;
  NSObject *loggingConnection;
  uint8_t v14[16];
  PGAssetCollectionFeatureDefinition *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = [PGSceneAssetFilter alloc];
  v4 = -[PGSceneAssetFilter initWithPositiveScenes:negativeScenes:sceneTaxonomy:](v3, "initWithPositiveScenes:negativeScenes:sceneTaxonomy:", &unk_1E84EA258, MEMORY[0x1E0C9AA60], self->_sceneTaxonomy);
  if (v4)
  {
    v5 = [PGAssetCollectionFeatureDefinition alloc];
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    v17[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v5, "initWithAssetFilterByName:", v7);

    v9 = [PGAssetCollectionFeatureSpecification alloc];
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v9, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 3, 0, v10, 1, 1);

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Beach ROI specification has an invalid scene asset filter, disabling", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_urbanROISpecification
{
  PGSceneAssetFilter *v3;
  PGSceneAssetFilter *v4;
  PGAssetCollectionFeatureDefinition *v5;
  void *v6;
  void *v7;
  PGAssetCollectionFeatureDefinition *v8;
  PGAssetCollectionFeatureSpecification *v9;
  void *v10;
  PGAssetCollectionFeatureSpecification *v11;
  NSObject *loggingConnection;
  uint8_t v14[16];
  PGAssetCollectionFeatureDefinition *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = [PGSceneAssetFilter alloc];
  v4 = -[PGSceneAssetFilter initWithPositiveScenes:negativeScenes:sceneTaxonomy:](v3, "initWithPositiveScenes:negativeScenes:sceneTaxonomy:", &unk_1E84EA270, MEMORY[0x1E0C9AA60], self->_sceneTaxonomy);
  if (v4)
  {
    v5 = [PGAssetCollectionFeatureDefinition alloc];
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    v17[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v5, "initWithAssetFilterByName:", v7);

    v9 = [PGAssetCollectionFeatureSpecification alloc];
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v9, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 6, 0, v10, 1, 1);

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Urban ROI specification has an invalid scene asset filter, disabling", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_waterROISpecification
{
  PGSceneAssetFilter *v3;
  PGAssetCollectionFeatureDefinition *v4;
  void *v5;
  void *v6;
  PGAssetCollectionFeatureDefinition *v7;
  PGAssetCollectionFeatureSpecification *v8;
  void *v9;
  PGAssetCollectionFeatureSpecification *v10;
  NSObject *loggingConnection;
  uint8_t v13[16];
  PGAssetCollectionFeatureDefinition *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PGSceneAssetFilter initWithPositiveScenes:negativeScenes:sceneTaxonomy:]([PGSceneAssetFilter alloc], "initWithPositiveScenes:negativeScenes:sceneTaxonomy:", &unk_1E84EA288, &unk_1E84EA2A0, self->_sceneTaxonomy);
  if (v3)
  {
    v4 = [PGAssetCollectionFeatureDefinition alloc];
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v4, "initWithAssetFilterByName:", v6);

    v8 = [PGAssetCollectionFeatureSpecification alloc];
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v8, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 7, 0, v9, 1, 1);

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Water ROI specification has an invalid scene asset filter, disabling", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)_mountainROISpecification
{
  PGSceneAssetFilter *v3;
  PGSceneAssetFilter *v4;
  PGAssetCollectionFeatureDefinition *v5;
  void *v6;
  void *v7;
  PGAssetCollectionFeatureDefinition *v8;
  PGAssetCollectionFeatureSpecification *v9;
  void *v10;
  PGAssetCollectionFeatureSpecification *v11;
  NSObject *loggingConnection;
  uint8_t v14[16];
  PGAssetCollectionFeatureDefinition *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = [PGSceneAssetFilter alloc];
  v4 = -[PGSceneAssetFilter initWithPositiveScenes:negativeScenes:sceneTaxonomy:](v3, "initWithPositiveScenes:negativeScenes:sceneTaxonomy:", &unk_1E84EA2B8, MEMORY[0x1E0C9AA60], self->_sceneTaxonomy);
  if (v4)
  {
    v5 = [PGAssetCollectionFeatureDefinition alloc];
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v6;
    v17[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v5, "initWithAssetFilterByName:", v7);

    v9 = [PGAssetCollectionFeatureSpecification alloc];
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v9, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 4, 0, v10, 1, 1);

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Mountain ROI specification has an invalid scene asset filter, disabling", v14, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_natureROISpecification
{
  PGSceneAssetFilter *v3;
  PGAssetCollectionFeatureDefinition *v4;
  void *v5;
  void *v6;
  PGAssetCollectionFeatureDefinition *v7;
  PGAssetCollectionFeatureSpecification *v8;
  void *v9;
  PGAssetCollectionFeatureSpecification *v10;
  NSObject *loggingConnection;
  uint8_t v13[16];
  PGAssetCollectionFeatureDefinition *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PGSceneAssetFilter initWithPositiveScenes:negativeScenes:sceneTaxonomy:]([PGSceneAssetFilter alloc], "initWithPositiveScenes:negativeScenes:sceneTaxonomy:", &unk_1E84EA2D0, &unk_1E84EA2E8, self->_sceneTaxonomy);
  if (v3)
  {
    v4 = [PGAssetCollectionFeatureDefinition alloc];
    +[PGSceneAssetFilter name](PGSceneAssetFilter, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v4, "initWithAssetFilterByName:", v6);

    v8 = [PGAssetCollectionFeatureSpecification alloc];
    v14 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v8, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 5, 0, v9, 1, 1);

  }
  else
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_FAULT, "Nature ROI specification has an invalid scene asset filter, disabling", v13, 2u);
    }
    v10 = 0;
  }

  return v10;
}

- (id)defaultPeopleAssetFilter
{
  return -[PGPeopleAssetFilter initWithMaximumNumberOfOtherFacesPresent:]([PGPeopleAssetFilter alloc], "initWithMaximumNumberOfOtherFacesPresent:", 4);
}

- (id)_peopleSpecification
{
  PGAssetCollectionFeatureDefinition *v3;
  void *v4;
  void *v5;
  void *v6;
  PGAssetCollectionFeatureDefinition *v7;
  PGAssetCollectionFeatureSpecification *v8;
  void *v9;
  PGAssetCollectionFeatureSpecification *v10;
  PGAssetCollectionFeatureDefinition *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = [PGAssetCollectionFeatureDefinition alloc];
  +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  -[PGMomentFeatureSpecificationFactory defaultPeopleAssetFilter](self, "defaultPeopleAssetFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v3, "initWithAssetFilterByName:", v6);

  v8 = [PGAssetCollectionFeatureSpecification alloc];
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v8, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 1, 0, v9, 1, 0);

  return v10;
}

- (id)_socialGroupSpecification
{
  PGSocialGroupAssetFilter *v2;
  PGAssetCollectionFeatureDefinition *v3;
  void *v4;
  void *v5;
  PGAssetCollectionFeatureDefinition *v6;
  PGAssetCollectionFeatureSpecification *v7;
  void *v8;
  PGAssetCollectionFeatureSpecification *v9;
  PGAssetCollectionFeatureDefinition *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PGSocialGroupAssetFilter);
  v3 = [PGAssetCollectionFeatureDefinition alloc];
  +[PGSocialGroupAssetFilter name](PGSocialGroupAssetFilter, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v13[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v3, "initWithAssetFilterByName:", v5);

  v7 = [PGAssetCollectionFeatureSpecification alloc];
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v7, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 2, 0, v8, 0, 0);

  return v9;
}

- (id)_petPersonSpecification
{
  id v2;
  PGAssetCollectionFeatureDefinition *v3;
  void *v4;
  void *v5;
  PGAssetCollectionFeatureDefinition *v6;
  PGAssetCollectionFeatureSpecification *v7;
  void *v8;
  PGAssetCollectionFeatureSpecification *v9;
  PGAssetCollectionFeatureDefinition *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGPeopleAssetFilter initForPetWithMaximumNumberOfOtherFacesPresent:]([PGPeopleAssetFilter alloc], "initForPetWithMaximumNumberOfOtherFacesPresent:", -1);
  v3 = [PGAssetCollectionFeatureDefinition alloc];
  +[PGPeopleAssetFilter name](PGPeopleAssetFilter, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  v13[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v3, "initWithAssetFilterByName:", v5);

  v7 = [PGAssetCollectionFeatureSpecification alloc];
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v7, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 11, 0, v8, 0, 0);

  return v9;
}

- (id)_excitementAudioSpecification
{
  id v2;
  PGAudioAssetFilter *v3;
  PGAssetCollectionFeatureDefinition *v4;
  void *v5;
  void *v6;
  PGAssetCollectionFeatureDefinition *v7;
  PGAssetCollectionFeatureSpecification *v8;
  void *v9;
  PGAssetCollectionFeatureSpecification *v10;
  PGAssetCollectionFeatureDefinition *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v2, "addIndex:", 8);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 1);
  v3 = -[PGAudioAssetFilter initWithAudioClassifications:]([PGAudioAssetFilter alloc], "initWithAudioClassifications:", v2);
  v4 = [PGAssetCollectionFeatureDefinition alloc];
  +[PGAudioAssetFilter name](PGAudioAssetFilter, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v4, "initWithAssetFilterByName:", v6);

  v8 = [PGAssetCollectionFeatureSpecification alloc];
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v8, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 12, CFSTR("ExcitementAudio"), v9, 1, 1);

  return v10;
}

- (id)_foodSpecification
{
  PGAssetCollectionFeatureDefinition *v2;
  void *v3;
  PGCustomFoodieAssetFilter *v4;
  void *v5;
  PGAssetCollectionFeatureDefinition *v6;
  PGAssetCollectionFeatureSpecification *v7;
  void *v8;
  PGAssetCollectionFeatureSpecification *v9;
  PGAssetCollectionFeatureDefinition *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = [PGAssetCollectionFeatureDefinition alloc];
  +[PGCustomFoodieAssetFilter name](PGCustomFoodieAssetFilter, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v3;
  v4 = objc_alloc_init(PGCustomFoodieAssetFilter);
  v13[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PGAssetCollectionFeatureDefinition initWithAssetFilterByName:](v2, "initWithAssetFilterByName:", v5);

  v7 = [PGAssetCollectionFeatureSpecification alloc];
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGAssetCollectionFeatureSpecification initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:](v7, "initWithFeatureType:featureLabel:featureDefinitions:shouldRunAtMomentIngest:shouldCreateFeatureNodeIfNeeded:", 13, CFSTR("Food"), v8, 1, 1);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CLIPTextEncoder, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

uint64_t __77__PGMomentFeatureSpecificationFactory__CLIPTrendsSpecificationsWithProgress___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trendsSceneModel");
}

uint64_t __60__PGMomentFeatureSpecificationFactory__trendsSpecifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "trendsSceneModel");
}

@end
