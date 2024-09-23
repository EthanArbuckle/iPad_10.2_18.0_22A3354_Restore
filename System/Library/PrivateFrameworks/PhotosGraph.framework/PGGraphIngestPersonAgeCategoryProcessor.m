@implementation PGGraphIngestPersonAgeCategoryProcessor

- (PGGraphIngestPersonAgeCategoryProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPersonAgeCategoryProcessor *v6;
  PGGraphIngestPersonAgeCategoryProcessor *v7;
  PGGraphIngestPersonAgeCategoryProcessorHelper *v8;
  PGGraphIngestPersonAgeCategoryProcessorHelper *helper;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestPersonAgeCategoryProcessor;
  v6 = -[PGGraphIngestPersonAgeCategoryProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v8 = objc_alloc_init(PGGraphIngestPersonAgeCategoryProcessorHelper);
    helper = v7->_helper;
    v7->_helper = v8;

  }
  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasUpdatedPersonNodes");

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  PGGraphBuilder *graphBuilder;
  id v8;
  void *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint32_t denom;
  uint32_t numer;
  NSObject *v20;
  NSObject *v21;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  graphBuilder = self->_graphBuilder;
  v8 = a4;
  -[PGGraphBuilder graph](graphBuilder, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGGraphIngestPersonAgeCategoryProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v14 = mach_absolute_time();
  if (objc_msgSend(v6, "isResumingFullAnalysis"))
    objc_msgSend(v9, "personNodesIncludingMe:", 1);
  else
    objc_msgSend(v6, "insertedAndUpdatedPersonNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestPersonAgeCategoryProcessor processPersonAgeCategoryForPersonNodes:photoLibrary:withProgressBlock:](self, "processPersonAgeCategoryForPersonNodes:photoLibrary:withProgressBlock:", v15, v16, v8);

  v17 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v20 = v13;
  v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_END, v11, "PGGraphIngestPersonAgeCategoryProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "PGGraphIngestPersonAgeCategoryProcessor";
    v25 = 2048;
    v26 = (float)((float)((float)((float)(v17 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)processPersonAgeCategoryForPersonNodes:(id)a3 photoLibrary:(id)a4 withProgressBlock:(id)a5
{
  id v8;
  void (**v9)(void *, uint8_t *, double);
  double Current;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  double v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  NSObject *v41;
  __int128 v42;
  id v43;
  void *v44;
  id v45;
  id obj;
  id v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v47 = a4;
  v43 = a5;
  v9 = (void (**)(void *, uint8_t *, double))_Block_copy(v43);
  v44 = v8;
  if (v9)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v11 = 0.0;
    if (Current >= 0.01)
    {
      v12 = Current;
      v55[0] = 0;
      v9[2](v9, v55, 0.0);
      if (v55[0])
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          goto LABEL_58;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 90;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
        v13 = MEMORY[0x1E0C81028];
        goto LABEL_49;
      }
      v11 = v12;
    }
    v15 = objc_msgSend(v8, "count");
    if (!v15)
    {
      if (CFAbsoluteTimeGetCurrent() - v11 < 0.01)
        goto LABEL_58;
      v55[0] = 0;
      v9[2](v9, v55, 1.0);
      if (!v55[0] || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_58;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 95;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
      v13 = MEMORY[0x1E0C81028];
LABEL_49:
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_58;
    }
  }
  else
  {
    v14 = objc_msgSend(v8, "count");
    if (!v14)
      goto LABEL_58;
    v15 = v14;
    v11 = 0.0;
  }
  v45 = objc_alloc_init(MEMORY[0x1E0D77E18]);
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v15);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v8;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  if (!v16)
    goto LABEL_37;
  v18 = 0.9 / (double)v15;
  v49 = *(_QWORD *)v52;
  v19 = 0.0;
  *(_QWORD *)&v17 = 138477827;
  v42 = v17;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v52 != v49)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      v22 = (void *)MEMORY[0x1CAA4EB2C]();
      if (v9)
      {
        v23 = CFAbsoluteTimeGetCurrent();
        if (v23 - v11 >= 0.01)
        {
          v55[0] = 0;
          v9[2](v9, v55, v19);
          if (v55[0])
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 106;
              *(_WORD *)&buf[8] = 2080;
              *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            objc_autoreleasePoolPop(v22);

            goto LABEL_57;
          }
          v11 = v23;
        }
      }
      v24 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryFromBirthdayDateForPersonNode:](self->_helper, "ageCategoryFromBirthdayDateForPersonNode:", v21, v42);
      if (v24)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "loggingConnection");
        v26 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v21, "stringDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGGraphIngestPersonAgeCategoryProcessorHelper ageDescriptionFromAge:](self->_helper, "ageDescriptionFromAge:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          *(_QWORD *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v28;
          _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ classified as **%@** based on birthday year", buf, 0x16u);

        }
LABEL_32:

        goto LABEL_33;
      }
      v24 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryUsingFaceAttributesForPersonNode:photoLibrary:](self->_helper, "ageCategoryUsingFaceAttributesForPersonNode:photoLibrary:", v21, v47);
      if (v24)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "loggingConnection");
        v26 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v21, "stringDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGGraphIngestPersonAgeCategoryProcessorHelper ageDescriptionFromAge:](self->_helper, "ageDescriptionFromAge:", v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v31;
          _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ classified as **%@** based on face attributes", buf, 0x16u);

        }
        goto LABEL_32;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v60 = __Block_byref_object_copy__41061;
      v61 = __Block_byref_object_dispose__41062;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v62 = (id)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __113__PGGraphIngestPersonAgeCategoryProcessor_processPersonAgeCategoryForPersonNodes_photoLibrary_withProgressBlock___block_invoke;
      v50[3] = &unk_1E842E880;
      v50[4] = buf;
      objc_msgSend(v21, "enumerateMomentEdgesAndNodesUsingBlock:", v50);
      v24 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryFromAssetSamplingScenesForPersonNode:photoLibrary:curationSession:](self->_helper, "ageCategoryFromAssetSamplingScenesForPersonNode:photoLibrary:curationSession:", v21, v47, v45);
      if (!v24)
      {
        _Block_object_dispose(buf, 8);

        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "loggingConnection");
        v26 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v21, "stringDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v42;
          *(_QWORD *)&buf[4] = v37;
          _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ age range could not be classified", buf, 0xCu);

        }
        v24 = 0;
        goto LABEL_32;
      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "loggingConnection");
      v33 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v21, "stringDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGGraphIngestPersonAgeCategoryProcessorHelper ageDescriptionFromAge:](self->_helper, "ageDescriptionFromAge:", v24);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v55 = 138478083;
        v56 = v34;
        v57 = 2112;
        v58 = v35;
        _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ classified as %@ based on scenes", v55, 0x16u);

      }
      _Block_object_dispose(buf, 8);

LABEL_33:
      -[PGGraphBuilder setAgeCategory:onPersonNodeForIdentifier:](self->_graphBuilder, "setAgeCategory:onPersonNodeForIdentifier:", v24, objc_msgSend(v21, "identifier"));
      objc_msgSend(v21, "localIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v39, v38);

      }
      objc_autoreleasePoolPop(v22);
      v19 = v18 + v19;
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    if (v16)
      continue;
    break;
  }
LABEL_37:

  if (!v9)
  {
    -[PGGraphIngestPersonAgeCategoryProcessor _updatePhotoLibrary:withAgeCategoryByPersonLocalIdentifier:](self, "_updatePhotoLibrary:withAgeCategoryByPersonLocalIdentifier:", v47, v48);
    goto LABEL_57;
  }
  v40 = CFAbsoluteTimeGetCurrent();
  if (v40 - v11 >= 0.01)
  {
    v55[0] = 0;
    v9[2](v9, v55, 0.9);
    if (v55[0])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 151;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
        v41 = MEMORY[0x1E0C81028];
        goto LABEL_56;
      }
      goto LABEL_57;
    }
    v11 = v40;
  }
  -[PGGraphIngestPersonAgeCategoryProcessor _updatePhotoLibrary:withAgeCategoryByPersonLocalIdentifier:](self, "_updatePhotoLibrary:withAgeCategoryByPersonLocalIdentifier:", v47, v48);
  if (CFAbsoluteTimeGetCurrent() - v11 >= 0.01)
  {
    v55[0] = 0;
    v9[2](v9, v55, 1.0);
    if (v55[0])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 155;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
        v41 = MEMORY[0x1E0C81028];
LABEL_56:
        _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
  }
LABEL_57:

LABEL_58:
}

- (void)_updatePhotoLibrary:(id)a3 withAgeCategoryByPersonLocalIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v7, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v6;
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchPersonsWithLocalIdentifiers:options:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v36 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v18, "localIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            v21 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageTypeFromAgeCategory:](self->_helper, "ageTypeFromAgeCategory:", objc_msgSend(v20, "unsignedIntegerValue"));
            if ((_DWORD)v21 != objc_msgSend(v18, "ageType"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v18);

            }
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v15);
    }

    v23 = v12;
    v24 = objc_msgSend(v12, "count");
    v6 = v31;
    if (v24)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __102__PGGraphIngestPersonAgeCategoryProcessor__updatePhotoLibrary_withAgeCategoryByPersonLocalIdentifier___block_invoke;
      v33[3] = &unk_1E8435668;
      v25 = v23;
      v34 = v25;
      v32 = 0;
      v26 = objc_msgSend(v31, "performChangesAndWait:error:", v33, &v32);
      v27 = v32;
      if ((v26 & 1) == 0)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "loggingConnection");
        v29 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v25, "allKeys");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v40 = v30;
          v41 = 2112;
          v42 = v27;
          _os_log_error_impl(&dword_1CA237000, v29, OS_LOG_TYPE_ERROR, "[PersonAgeCategoryProcessor] Error setting the age type of persons: %{private}@, error: %@", buf, 0x16u);

        }
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

uint64_t __102__PGGraphIngestPersonAgeCategoryProcessor__updatePhotoLibrary_withAgeCategoryByPersonLocalIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_41051);
}

void __102__PGGraphIngestPersonAgeCategoryProcessor__updatePhotoLibrary_withAgeCategoryByPersonLocalIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CD16D8];
  v5 = a3;
  objc_msgSend(v4, "changeRequestForPerson:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LOWORD(a2) = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v6, "setAgeType:", (unsigned __int16)a2);
}

void __113__PGGraphIngestPersonAgeCategoryProcessor_processPersonAgeCategoryForPersonNodes_photoLibrary_withProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((unint64_t)objc_msgSend(a2, "numberOfAssets") >= 2)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v10, "universalStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "earlierDate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

@end
