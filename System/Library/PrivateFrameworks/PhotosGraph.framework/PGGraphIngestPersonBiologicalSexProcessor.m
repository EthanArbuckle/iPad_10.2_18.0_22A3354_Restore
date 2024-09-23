@implementation PGGraphIngestPersonBiologicalSexProcessor

- (PGGraphIngestPersonBiologicalSexProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPersonBiologicalSexProcessor *v6;
  PGGraphIngestPersonBiologicalSexProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPersonBiologicalSexProcessor;
  v6 = -[PGGraphIngestPersonBiologicalSexProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

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
  PGGraphBuilder *graphBuilder;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  graphBuilder = self->_graphBuilder;
  v7 = a4;
  -[PGGraphBuilder graph](graphBuilder, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isResumingFullAnalysis"))
    objc_msgSend(v8, "personNodesIncludingMe:", 1);
  else
    objc_msgSend(v11, "insertedAndUpdatedPersonNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestPersonBiologicalSexProcessor processPersonBiologicalSexForPersonNodes:photoLibrary:withProgressBlock:](self, "processPersonBiologicalSexForPersonNodes:photoLibrary:withProgressBlock:", v9, v10, v7);

}

- (void)processPersonBiologicalSexForPersonNodes:(id)a3 photoLibrary:(id)a4 withProgressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  double Current;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  void (**v55)(void *, _BYTE *, double);
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  char v64;
  uint8_t buf[4];
  _BYTE v66[18];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v55 = (void (**)(void *, _BYTE *, double))_Block_copy(v10);
  if (!v55)
  {
    v15 = objc_msgSend(v8, "count");
    if (!v15)
      goto LABEL_48;
    v16 = v15;
    v48 = v10;
    v12 = 0.0;
    goto LABEL_11;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v12 = 0.0;
  if (Current >= 0.01)
  {
    v13 = Current;
    v64 = 0;
    v55[2](v55, &v64, 0.0);
    if (v64)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 76;
        *(_WORD *)&v66[4] = 2080;
        *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
        v14 = MEMORY[0x1E0C81028];
LABEL_53:
        _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_48;
      }
      goto LABEL_48;
    }
    v12 = v13;
  }
  v17 = objc_msgSend(v8, "count");
  if (v17)
  {
    v16 = v17;
    v48 = v10;
LABEL_11:
    v51 = v9;
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v49 = v8;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v61 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v25, "localIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "length"))
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v25, v26);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v22);
    }

    v27 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v19, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)v18;
    objc_msgSend(v27, "fetchPersonsWithLocalIdentifiers:options:", v28, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_alloc_init(MEMORY[0x1E0CB3748]);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v29;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    if (v54)
    {
      v30 = 1.0 / (double)v16;
      v53 = *(_QWORD *)v57;
      v31 = 0.0;
      v9 = v51;
      while (2)
      {
        for (j = 0; j != v54; ++j)
        {
          if (*(_QWORD *)v57 != v53)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          v34 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v33, "localIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = -[PGGraphIngestPersonBiologicalSexProcessor _sexForPersonNode:photoLibrary:](self, "_sexForPersonNode:photoLibrary:", v36, v9);
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "loggingConnection");
          v39 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v36, "debugDescription");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGGraphIngestPersonBiologicalSexProcessor _sexDescriptionForBiologicalSex:](self, "_sexDescriptionForBiologicalSex:", v37);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138478083;
            *(_QWORD *)v66 = v40;
            *(_WORD *)&v66[8] = 2112;
            *(_QWORD *)&v66[10] = v41;
            _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex]Person %{private}@ classified as %@", buf, 0x16u);

            v9 = v51;
          }

          -[PGGraphBuilder setBiologicalSex:onPersonNodeForIdentifier:](self->_graphBuilder, "setBiologicalSex:onPersonNodeForIdentifier:", v37, objc_msgSend(v36, "identifier"));
          v42 = -[PGGraphIngestPersonBiologicalSexProcessor _phBiologicalSexFromIngestBiologicalSex:](self, "_phBiologicalSexFromIngestBiologicalSex:", v37);
          if (objc_msgSend(v33, "sexType") != (_DWORD)v42)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setObject:forKey:", v43, v33);

          }
          v31 = v30 + v31;
          if (v55)
          {
            v44 = CFAbsoluteTimeGetCurrent();
            if (v44 - v12 >= 0.01)
            {
              v64 = 0;
              v55[2](v55, &v64, v31);
              if (v64)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v66 = 115;
                  *(_WORD *)&v66[4] = 2080;
                  *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                objc_autoreleasePoolPop(v34);
                v10 = v48;
                v8 = v49;
                v45 = v47;
                v46 = v50;
                goto LABEL_47;
              }
              v12 = v44;
            }
          }

          objc_autoreleasePoolPop(v34);
        }
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        if (v54)
          continue;
        break;
      }
    }
    else
    {
      v9 = v51;
    }

    v46 = v50;
    if (objc_msgSend(v50, "count"))
      -[PGGraphIngestPersonBiologicalSexProcessor _writeBiologicalSexByPerson:toPhotoLibrary:](self, "_writeBiologicalSexByPerson:toPhotoLibrary:", v50, v9);
    v10 = v48;
    v8 = v49;
    v45 = v47;
    if (v55)
    {
      if (CFAbsoluteTimeGetCurrent() - v12 >= 0.01)
      {
        v64 = 0;
        v55[2](v55, &v64, 1.0);
        if (v64)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v66 = 123;
            *(_WORD *)&v66[4] = 2080;
            *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_47:

    goto LABEL_48;
  }
  if (CFAbsoluteTimeGetCurrent() - v12 >= 0.01)
  {
    v64 = 0;
    v55[2](v55, &v64, 1.0);
    if (v64)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 81;
        *(_WORD *)&v66[4] = 2080;
        *(_QWORD *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
        v14 = MEMORY[0x1E0C81028];
        goto LABEL_53;
      }
    }
  }
LABEL_48:

}

- (void)_writeBiologicalSexByPerson:(id)a3 toPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__PGGraphIngestPersonBiologicalSexProcessor__writeBiologicalSexByPerson_toPhotoLibrary___block_invoke;
  v12[3] = &unk_1E8435668;
  v6 = v5;
  v13 = v6;
  v11 = 0;
  v7 = objc_msgSend(a4, "performChangesAndWait:error:", v12, &v11);
  v8 = v11;
  if ((v7 & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "Error setting the sex of a PHPerson: %@", buf, 0xCu);
    }

  }
}

- (unsigned)_phBiologicalSexFromIngestBiologicalSex:(unint64_t)a3
{
  if (a3 == 2)
    return 1;
  else
    return 2 * (a3 == 1);
}

- (unint64_t)_sexForPersonNode:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[PGGraphIngestFaceAttributeConveniences sampledAssetsWithSingleFaceForPersonLocalIdentifier:photoLibrary:numberOfYearsBack:sampleSize:fetchPropertySets:](PGGraphIngestFaceAttributeConveniences, "sampledAssetsWithSingleFaceForPersonLocalIdentifier:photoLibrary:numberOfYearsBack:sampleSize:fetchPropertySets:", v7, v6, 100, 200, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 > 2)
    {
      objc_msgSend(v6, "librarySpecificFetchOptions");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("sexType != %lu"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setPredicate:](v12, "setPredicate:", v15);
      v16 = *MEMORY[0x1E0CD1B88];
      v26[0] = *MEMORY[0x1E0CD1B78];
      v26[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setFetchPropertySets:](v12, "setFetchPropertySets:", v17);

      objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAssets:options:", v8, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      if (v19 > 2)
      {
        v24 = (void *)objc_opt_class();
        objc_msgSend(v5, "stringDescription");
        v22 = objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v24, "sexForFaces:personDescription:", v18, v22);
      }
      else
      {
        v20 = v19;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "loggingConnection");
        v22 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "stringDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v28 = v23;
          v29 = 2048;
          v30 = v20;
          _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex]Person %{private}@ doesn't have enough singleton face assets with sex classification: %lu", buf, 0x16u);

        }
        v14 = 0;
      }

    }
    else
    {
      v10 = v9;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "stringDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v28 = v13;
        v29 = 2048;
        v30 = v10;
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex] Person %{private}@ doesn't have enough singleton face assets: %lu", buf, 0x16u);

      }
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_sexDescriptionForBiologicalSex:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unspecified BiologicalSex");
  if (a3 == 1)
    v3 = CFSTR("Female");
  if (a3 == 2)
    return CFSTR("Male");
  else
    return (id)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __88__PGGraphIngestPersonBiologicalSexProcessor__writeBiologicalSexByPerson_toPhotoLibrary___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  unsigned __int16 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "unsignedIntegerValue");
        objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setSexType:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

+ (unint64_t)sexForFaces:(id)a3 personDescription:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "sexType") == 2)
          ++v10;
      }
      v9 += v8;
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v8);
    v13 = (double)v10 / (double)v9;
  }
  else
  {
    v13 = NAN;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "loggingConnection");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478339;
    v23 = v6;
    v24 = 2048;
    v25 = v13;
    v26 = 2048;
    v27 = 1.0 - v13;
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex]Person %{private}@ femaleRatio:%0.2f maleRatio: %0.2f", buf, 0x20u);
  }

  if (v13 >= 0.75)
  {
    v16 = 1;
  }
  else if (1.0 - v13 >= 0.75)
  {
    v16 = 2;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
