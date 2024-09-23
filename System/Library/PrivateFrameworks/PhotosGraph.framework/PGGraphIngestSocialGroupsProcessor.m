@implementation PGGraphIngestSocialGroupsProcessor

- (PGGraphIngestSocialGroupsProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestSocialGroupsProcessor *v6;
  PGGraphIngestSocialGroupsProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestSocialGroupsProcessor;
  v6 = -[PGGraphIngestSocialGroupsProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isResumingFullAnalysis") & 1) != 0
    || (objc_msgSend(v4, "hasDeletedMomentNodes") & 1) != 0
    || (objc_msgSend(v4, "hasDeletedPersonNodes") & 1) != 0
    || (v5 = objc_msgSend(v4, "momentUpdateTypes"),
        (objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes") & v5) != 0)
    || (objc_msgSend(v4, "hasSocialGroupsToInsert") & 1) != 0
    || (objc_msgSend(v4, "hasSocialGroupsToUpdate") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    if (-[PGGraphBuilder isSharedLibraryEnabled](self->_graphBuilder, "isSharedLibraryEnabled"))
    {
      -[PGGraphBuilder graph](self->_graphBuilder, "graph");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "meNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "insertedMomentNodes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "collection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            -[PGGraphBuilder momentNodesWhereMeIsPresent](self->_graphBuilder, "momentNodesWhereMeIsPresent");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "intersectsCollection:", v15);

          }
          else
          {
            v17 = 1;
          }
          objc_msgSend(v15, "personNodes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19 && (v17 & 1) != 0)
          {
            v6 = 1;
            goto LABEL_26;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }
    v6 = 0;
LABEL_26:

  }
  return v6;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  PGGraphBuilder *graphBuilder;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint32_t denom;
  uint32_t numer;
  NSObject *v40;
  NSObject *v41;
  char *v42;
  os_signpost_id_t spid;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  double v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  graphBuilder = self->_graphBuilder;
  v8 = a3;
  -[PGGraphBuilder loggingConnection](graphBuilder, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestSocialGroupsProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v13 = mach_absolute_time();
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "isResumingFullAnalysis");

  -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v44 = v13;
    v45 = v10 - 1;
    spid = v10;
    v17 = (void *)MEMORY[0x1E0D42A58];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v53[3] = &unk_1E8435028;
    v47 = v6;
    v18 = v6;
    v54 = v18;
    objc_msgSend(v17, "progressReporterWithProgressBlock:", v53);
    v52 = 0;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGSocialGroupsPromoter ingestUserVerifiedSocialGroupsFromPhotoLibrary:intoGraph:progressReporter:error:](PGSocialGroupsPromoter, "ingestUserVerifiedSocialGroupsFromPhotoLibrary:intoGraph:progressReporter:error:", v16, v14);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = 0;
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();

    v48 = (void *)v19;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v57 = (const char *)v19;
        _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[PGGraphIngestSocialGroupsProcessor] Ingested user-verified social groups from database into graph with UUIDs %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "localizedDescription");
      v42 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v42;
      _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Error ingesting user-verified social groups from database into graph: %@", buf, 0xCu);

    }
    -[PGGraphIngestSocialGroupsProcessor processSocialGroups:graph:progressBlock:](self, "processSocialGroups:graph:progressBlock:", v15, v14, v18);
    v25 = (void *)MEMORY[0x1E0D42A58];
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke_154;
    v50[3] = &unk_1E8435028;
    v51 = v18;
    objc_msgSend(v25, "progressReporterWithProgressBlock:", v50);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v20;
    +[PGSocialGroupsPromoter promoteSocialGroupsInGraph:photoLibrary:maxNumberOfElectedSocialGroups:progressReporter:persistGroups:error:](PGSocialGroupsPromoter, "promoteSocialGroupsInGraph:photoLibrary:maxNumberOfElectedSocialGroups:progressReporter:persistGroups:error:", v14, v27, +[PGSocialGroupsElector defaultNumberOfElectedSocialGroups](PGSocialGroupsElector, "defaultNumberOfElectedSocialGroups"), v26, 1, &v49);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v49;

    v29 = objc_msgSend(v28, "newAutomaticSocialGroupsToCreateCount");
    v30 = objc_msgSend(v28, "currentAutomaticSocialGroupsToModifyCount");
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "loggingConnection");
    v32 = objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "loggingConnection");
        v35 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = objc_msgSend(v28, "socialGroupsSkippedBecauseNoCommonAssetsCount");
          *(_DWORD *)buf = 134217984;
          v57 = (const char *)v36;
          _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "[PGGraphIngestSocialGroupsProcessor] Skipped persisting %ld social groups in graph to database because they have no assets of all members", buf, 0xCu);
        }

        v37 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v40 = v12;
        v41 = v40;
        v6 = v47;
        if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v41, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestSocialGroupsProcessor", ", buf, 2u);
        }

        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v57 = "PGGraphIngestSocialGroupsProcessor";
          v58 = 2048;
          v59 = (float)((float)((float)((float)(v37 - v44) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        goto LABEL_25;
      }
      -[NSObject localizedDescription](v24, "localizedDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v57 = (const char *)v29;
      v58 = 2048;
      v59 = *(double *)&v30;
      v60 = 2112;
      v61 = v33;
      _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[PGGraphIngestSocialGroupsProcessor] Successfully promoted %ld new automatic social groups in graph to database and modified order of %ld automatic social groups: %@", buf, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      -[NSObject localizedDescription](v24, "localizedDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v57 = (const char *)v29;
      v58 = 2048;
      v59 = *(double *)&v30;
      v60 = 2112;
      v61 = v33;
      _os_log_error_impl(&dword_1CA237000, v32, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Error promoting %ld new automatic social groups in graph to database and modifying order of %ld automatic social groups: %@", buf, 0x20u);
    }

    goto LABEL_17;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "loggingConnection");
  v24 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Skipping social group ingest and generation due to nil photoLibrary! Returning...", buf, 2u);
  }
LABEL_25:

}

- (void)processSocialGroups:(BOOL)a3 graph:(id)a4 progressBlock:(id)a5
{
  _BOOL4 v6;
  void (**v7)(void *, int *, double);
  double Current;
  char v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void (**v17)(void *, int *, double);
  id v18;
  id v19;
  id v20;
  id v21;
  PGGraphSocialGroupNodeCollection *v22;
  uint64_t v23;
  void *v24;
  PGGraphSocialGroupEdgeCollection *v25;
  uint64_t v26;
  void (**v27)(void *, int *, double);
  void (**v28)(void *, int *, double);
  double v29;
  char v30;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  char v39;
  _QWORD v40[4];
  void (**v41)(void *, int *, double);
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  _QWORD v45[4];
  void (**v46)(void *, int *, double);
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  void (**v55)(void *, int *, double);
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *p_buf;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  double *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  int v69;
  int v70;
  __int16 v71;
  const char *v72;
  uint64_t buf;
  __int128 v74;
  char v75;
  uint64_t v76;

  v6 = a3;
  v76 = *MEMORY[0x1E0C80C00];
  v38 = a4;
  v34 = a5;
  v7 = (void (**)(void *, int *, double))_Block_copy(v34);
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v61 = 0;
  v62 = (double *)&v61;
  v63 = 0x2020000000;
  v64 = 0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v62[3] >= 0.01)
    {
      v62[3] = Current;
      LOBYTE(v69) = 0;
      v7[2](v7, &v69, 0.0);
      v9 = *((_BYTE *)v66 + 24) | v69;
      *((_BYTE *)v66 + 24) = v9;
      if (v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 0x8704000202;
          LOWORD(v74) = 2080;
          *(_QWORD *)((char *)&v74 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        goto LABEL_31;
      }
    }
  }
  +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", v38, self);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphSocialGroupNodeCollection userVerifiedSocialGroupNodesInGraph:](PGGraphSocialGroupNodeCollection, "userVerifiedSocialGroupNodesInGraph:", v38);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "collectionBySubtracting:", v10);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v10;
  if (v6)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v11, "removeNodes:", v35);
    objc_msgSend(v38, "executeGraphChangeRequest:", v11);
    v12 = 0;
    v13 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v12 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  v13 = objc_alloc_init(MEMORY[0x1E0D429B0]);
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "elementIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unionWithIdentifierSet:", v14);

    +[PGGraphEdgeCollection edgesToNodes:](PGGraphSocialGroupEdgeCollection, "edgesToNodes:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "elementIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unionWithIdentifierSet:", v15);

    goto LABEL_10;
  }
LABEL_11:
  v16 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  buf = 0;
  *(_QWORD *)&v74 = &buf;
  *((_QWORD *)&v74 + 1) = 0x2020000000;
  v75 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke;
  v50[3] = &unk_1E842C200;
  v17 = v7;
  v55 = v17;
  v56 = &v61;
  p_buf = &buf;
  v59 = 0x3F847AE147AE147BLL;
  v57 = &v65;
  v60 = v6;
  v18 = v38;
  v51 = v18;
  v33 = v12;
  v52 = v33;
  v19 = v13;
  v53 = v19;
  v20 = v16;
  v54 = v20;
  objc_msgSend(v18, "enumerateSocialGroupsWithBlock:includeInvalidGroups:", v50, 1);
  if (*((_BYTE *)v66 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v69 = 67109378;
      v70 = 207;
      v71 = 2080;
      v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v69, 0x12u);
    }
  }
  else
  {
    if (!v6)
    {
      v21 = v35;
      if (objc_msgSend(v33, "count"))
      {
        v22 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphSocialGroupNodeCollection alloc], "initWithGraph:elementIdentifiers:", v18, v33);
        objc_msgSend(v21, "collectionBySubtracting:", v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v21 = (id)v23;
      }
      if (objc_msgSend(v21, "count"))
        objc_msgSend(v20, "removeNodes:", v21);
      +[PGGraphEdgeCollection edgesInGraph:](PGGraphSocialGroupEdgeCollection, "edgesInGraph:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        v25 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphSocialGroupEdgeCollection alloc], "initWithGraph:elementIdentifiers:", v18, v19);
        objc_msgSend(v24, "collectionBySubtracting:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v26;
      }
      if (objc_msgSend(v24, "count"))
        objc_msgSend(v20, "removeEdges:", v24);

    }
    objc_msgSend(v18, "executeGraphChangeRequest:", v20);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_173;
    v45[3] = &unk_1E8434F30;
    v27 = v17;
    v46 = v27;
    v47 = &v61;
    v48 = &v65;
    v49 = 0x3F847AE147AE147BLL;
    objc_msgSend(v32, "insertOwnerPetToRelevantSocialGroups:progressBlock:", v18, v45);
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2_174;
    v40[3] = &unk_1E8434F30;
    v28 = v27;
    v41 = v28;
    v42 = &v61;
    v43 = &v65;
    v44 = 0x3F847AE147AE147BLL;
    objc_msgSend(v32, "insertAggregateSocialGroupsIntoGraph:progressBlock:", v18, v40);
    if (v7)
    {
      v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v62[3] >= 0.01)
      {
        v62[3] = v29;
        v39 = 0;
        v28[2](v28, (int *)&v39, 1.0);
        v30 = *((_BYTE *)v66 + 24) | v39;
        *((_BYTE *)v66 + 24) = v30;
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v69 = 67109378;
            v70 = 241;
            v71 = 2080;
            v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v69, 0x12u);
          }
        }
      }
    }

  }
  _Block_object_dispose(&buf, 8);

LABEL_31:
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

}

- (void)insertOwnerPetToRelevantSocialGroups:(id)a3 progressBlock:(id)a4
{
  id v6;
  PGGraphBuilder *graphBuilder;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void (**v14)(void *, _BYTE *, double);
  double v15;
  double Current;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  int64_t v23;
  void *v24;
  PGGraphSocialGroupNode *v25;
  PGGraphSocialGroupNode *v26;
  void *v27;
  void *v28;
  PGGraphSocialGroupNode *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint32_t denom;
  uint32_t numer;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t spid;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  id v52;
  id v53;
  _QWORD v54[4];
  PGGraphSocialGroupNode *v55;
  id v56;
  _QWORD v57[4];
  PGGraphSocialGroupNode *v58;
  id v59;
  char v60;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v63[18];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  graphBuilder = self->_graphBuilder;
  v8 = a4;
  -[PGGraphBuilder loggingConnection](graphBuilder, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SocialGroupPets", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v13 = mach_absolute_time();
  v14 = (void (**)(void *, _BYTE *, double))_Block_copy(v8);

  v15 = 0.0;
  if (v14)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v60 = 0;
      v14[2](v14, &v60, 0.0);
      if (v60)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v63 = 247;
          *(_WORD *)&v63[4] = 2080;
          *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_32;
      }
      v15 = Current;
    }
  }
  objc_msgSend(v6, "meNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "collection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ownedPetNodes");
    v20 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v20, "count"))
    {
      v46 = v10 - 1;
      spid = v10;
      v45 = v13;
      v21 = objc_alloc_init(MEMORY[0x1E0D42A30]);
      if (-[NSObject count](v20, "count"))
      {
        -[NSObject array](v20, "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = +[PGGraphSocialGroupNode identifierForMemberNodes:](PGGraphSocialGroupNode, "identifierForMemberNodes:", v22);
        +[PGGraphSocialGroupNodeCollection socialGroupNodeForSocialGroupIdentifier:inGraph:](PGGraphSocialGroupNodeCollection, "socialGroupNodeForSocialGroupIdentifier:inGraph:", v23, v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PGGraphSocialGroupNode initWithSocialGroupIdentifier:importance:]([PGGraphSocialGroupNode alloc], "initWithSocialGroupIdentifier:importance:", v23, 1.0);
        if (objc_msgSend(v24, "count"))
        {
          objc_msgSend(v24, "anyNode");
          v26 = (PGGraphSocialGroupNode *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v21, "addNode:", v25);
          v57[0] = MEMORY[0x1E0C809B0];
          v57[1] = 3221225472;
          v57[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke;
          v57[3] = &unk_1E842C228;
          v26 = v25;
          v58 = v26;
          v59 = v21;
          objc_msgSend(v22, "enumerateObjectsUsingBlock:", v57);

          v25 = v58;
        }

        -[NSObject momentNodes](v20, "momentNodes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_2;
        v54[3] = &unk_1E84352A0;
        v55 = v26;
        v56 = v21;
        v29 = v26;
        objc_msgSend(v28, "enumerateNodesUsingBlock:", v54);

      }
      +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphSocialGroupNodeCollection userVerifiedSocialGroupNodesInGraph:](PGGraphSocialGroupNodeCollection, "userVerifiedSocialGroupNodesInGraph:", v6);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "collectionBySubtracting:");
      v31 = v21;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0D429D8];
      +[PGGraphSocialGroupNode momentOfSocialGroup](PGGraphSocialGroupNode, "momentOfSocialGroup");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v30;
      objc_msgSend(v33, "adjacencyWithSources:relation:targetsClass:", v30, v34, objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_3;
      v49[3] = &unk_1E842C278;
      v50 = v35;
      v20 = v20;
      v51 = v20;
      v36 = v6;
      v52 = v36;
      v37 = v31;
      v53 = v37;
      v38 = v35;
      objc_msgSend(v32, "enumerateImportancesUsingBlock:", v49);
      objc_msgSend(v36, "executeGraphChangeRequest:", v37);
      if (v14 && CFAbsoluteTimeGetCurrent() - v15 >= 0.01 && (v60 = 0, v14[2](v14, &v60, 1.0), v60))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v63 = 339;
          *(_WORD *)&v63[4] = 2080;
          *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        v39 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v42 = v12;
        v43 = v42;
        if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v43, OS_SIGNPOST_INTERVAL_END, spid, "SocialGroupPets", ", buf, 2u);
        }

        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v63 = "SocialGroupPets";
          *(_WORD *)&v63[8] = 2048;
          *(double *)&v63[10] = (float)((float)((float)((float)(v39 - v45) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
      }

    }
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "loggingConnection");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Error found a nil Me Node", buf, 2u);
    }
  }

LABEL_32:
}

- (void)insertAggregateSocialGroupsIntoGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void (**v11)(void *, _BYTE *, double);
  double v12;
  uint8_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double Current;
  uint8_t v31;
  id v32;
  void (**v33)(void *, _BYTE *, double);
  id v34;
  id v35;
  double v36;
  uint8_t v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  uint64_t v41;
  uint32_t denom;
  uint32_t numer;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  os_signpost_id_t spid;
  unint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id aBlock;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t *v63;
  uint8_t *v64;
  uint64_t v65;
  _QWORD v66[4];
  id v67;
  char v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  uint64_t v72;
  uint8_t buf[8];
  uint8_t *v74;
  uint64_t v75;
  char v76;
  mach_timebase_info info;
  uint8_t v78[4];
  _BYTE v79[18];
  _QWORD v80[5];

  v80[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  aBlock = a4;
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  spid = v8;
  v48 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SocialGroupAggregation", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v46 = mach_absolute_time();
  v11 = (void (**)(void *, _BYTE *, double))_Block_copy(aBlock);
  *(_QWORD *)buf = 0;
  v74 = buf;
  v75 = 0x2020000000;
  v76 = 0;
  v69 = 0;
  v70 = (double *)&v69;
  v71 = 0x2020000000;
  v72 = 0;
  if (!v11
    || (v12 = CFAbsoluteTimeGetCurrent(), v12 - v70[3] < 0.01)
    || (v70[3] = v12, v68 = 0, v11[2](v11, &v68, 0.0), v13 = v74[24] | v68, (v74[24] = v13) == 0))
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v6);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", v6);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke;
    v66[3] = &unk_1E8431D48;
    v50 = v14;
    v67 = v50;
    objc_msgSend(v52, "enumerateSocialGroupIdentifiersUsingBlock:", v66);
    v15 = objc_alloc(MEMORY[0x1E0D429E0]);
    +[PGGraphFrequentLocationNode momentOfFrequentLocation](PGGraphFrequentLocationNode, "momentOfFrequentLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v16;
    +[PGGraphMomentNode socialGroupInMoment](PGGraphMomentNode, "socialGroupInMoment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v80[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v15, "initWithSteps:", v18);

    objc_msgSend(MEMORY[0x1E0D429D8], "adjacencyWithSources:relation:targetsClass:", v54, v51, objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphFrequentLocationNode momentOfFrequentLocation](PGGraphFrequentLocationNode, "momentOfFrequentLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "adjacencyWithSources:relation:targetsClass:", v54, v21, objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0D429D8];
    objc_msgSend(v19, "targets");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphSocialGroupNode momentOfSocialGroup](PGGraphSocialGroupNode, "momentOfSocialGroup");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "adjacencyWithSources:relation:targetsClass:", v23, v24, objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0D429D8];
    objc_msgSend(v19, "targets");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphSocialGroupNode memberOfSocialGroup](PGGraphSocialGroupNode, "memberOfSocialGroup");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "adjacencyWithSources:relation:targetsClass:", v27, v28, objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v70[3] >= 0.01)
      {
        v70[3] = Current;
        v68 = 0;
        v11[2](v11, &v68, 0.2);
        v31 = v74[24] | v68;
        v74[24] = v31;
        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v78 = 67109378;
            *(_DWORD *)v79 = 364;
            *(_WORD *)&v79[4] = 2080;
            *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v78, 0x12u);
          }
          goto LABEL_26;
        }
      }
    }
    v32 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_190;
    v55[3] = &unk_1E842C2F0;
    v33 = v11;
    v62 = v33;
    v63 = &v69;
    v64 = buf;
    v65 = 0x3F847AE147AE147BLL;
    v56 = v49;
    v57 = v25;
    v58 = v29;
    v34 = v6;
    v59 = v34;
    v60 = v50;
    v35 = v32;
    v61 = v35;
    objc_msgSend(v19, "enumerateTargetsBySourceWithBlock:", v55);
    objc_msgSend(v34, "executeGraphChangeRequest:", v35);
    if (v11
      && (v36 = CFAbsoluteTimeGetCurrent(), v36 - v70[3] >= 0.01)
      && (v70[3] = v36, v68 = 0, v33[2](v33, &v68, 1.0), v37 = v74[24] | v68, (v74[24] = v37) != 0))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      *(_DWORD *)v78 = 67109378;
      *(_DWORD *)v79 = 435;
      *(_WORD *)&v79[4] = 2080;
      *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
      v38 = MEMORY[0x1E0C81028];
      v39 = "Cancelled at line %d in file %s";
      v40 = 18;
    }
    else
    {
      v41 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v44 = v10;
      v45 = v44;
      if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)v78 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v45, OS_SIGNPOST_INTERVAL_END, spid, "SocialGroupAggregation", ", v78, 2u);
      }

      if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        goto LABEL_25;
      *(_DWORD *)v78 = 136315394;
      *(_QWORD *)v79 = "SocialGroupAggregation";
      *(_WORD *)&v79[8] = 2048;
      *(double *)&v79[10] = (float)((float)((float)((float)(v41 - v46) * (float)numer) / (float)denom) / 1000000.0);
      v39 = "[Performance] %s: %f ms";
      v38 = v45;
      v40 = 22;
    }
    _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, v39, v78, v40);
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v78 = 67109378;
    *(_DWORD *)v79 = 346;
    *(_WORD *)&v79[4] = 2080;
    *(_QWORD *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v78, 0x12u);
  }
LABEL_27:
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(buf, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_190(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  double Current;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PGGraphSocialGroupNode *v19;
  PGGraphSocialGroupNodeCollection *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  PGGraphMomentNodeCollection *v28;
  PGGraphSocialGroupNode *v29;
  PGGraphPersonNodeCollection *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id obj;
  uint64_t v40;
  _QWORD v41[4];
  PGGraphSocialGroupNode *v42;
  id v43;
  _QWORD v44[5];
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  double *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  v37 = a3;
  v40 = a1;
  if (*(_QWORD *)(a1 + 80)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v8 + 24) = Current,
        LOBYTE(v66) = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(0.5),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "targetsForSources:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "intersectingTargetsWith:", v36);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v11 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v12 = objc_alloc_init(MEMORY[0x1E0D429B0]);
    v66 = 0;
    v67 = (double *)&v66;
    v68 = 0x2020000000;
    v69 = 0;
    v62 = 0;
    v63 = (int *)&v62;
    v64 = 0x2020000000;
    v65 = 0;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_2;
    v53[3] = &unk_1E842C2A0;
    v32 = v9;
    v54 = v32;
    v55 = *(id *)(v40 + 40);
    v56 = *(id *)(v40 + 48);
    v13 = v10;
    v57 = v13;
    v33 = v11;
    v58 = v33;
    v34 = v12;
    v59 = v34;
    v60 = &v66;
    v61 = &v62;
    objc_msgSend(v37, "enumerateImportancesUsingBlock:", v53);
    v35 = v13;
    if ((unint64_t)objc_msgSend(v13, "count") >= 3)
    {
      v30 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphPersonNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(v40 + 56), v13);
      -[MAElementCollection array](v30, "array");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[PGGraphSocialGroupNode identifierForMemberNodes:](PGGraphSocialGroupNode, "identifierForMemberNodes:");
      v15 = *(void **)(v40 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v15, "containsObject:", v16);

      if ((v15 & 1) == 0)
      {
        v17 = *(void **)(v40 + 64);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v18);

        v19 = -[PGGraphSocialGroupNode initWithSocialGroupIdentifier:importance:]([PGGraphSocialGroupNode alloc], "initWithSocialGroupIdentifier:importance:", v14, v67[3] / (double)v63[6]);
        objc_msgSend(*(id *)(v40 + 72), "addNode:", v19);
        v20 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphSocialGroupNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(v40 + 56), v34);
        v51 = 0u;
        v52 = 0u;
        v50 = 0u;
        v49 = 0u;
        obj = v31;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v70, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v50 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              objc_msgSend(v24, "collection");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphBelongsToEdgeCollection, "edgesFromNodes:toNodes:", v25, v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v45 = 0;
              v46 = (double *)&v45;
              v47 = 0x2020000000;
              v48 = 0;
              v44[0] = MEMORY[0x1E0C809B0];
              v44[1] = 3221225472;
              v44[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_3;
              v44[3] = &unk_1E842C2C8;
              v44[4] = &v45;
              objc_msgSend(v26, "enumerateEdgesUsingBlock:", v44);
              v27 = -[PGGraphBelongsToEdge initFromMemberNode:toSocialGroupNode:importance:]([PGGraphBelongsToEdge alloc], "initFromMemberNode:toSocialGroupNode:importance:", v24, v19, v46[3] / (double)(unint64_t)objc_msgSend(v26, "count"));
              objc_msgSend(*(id *)(v40 + 72), "addEdge:", v27);

              _Block_object_dispose(&v45, 8);
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v70, 16);
          }
          while (v21);
        }

        v28 = -[MAElementCollection initWithGraph:elementIdentifiers:]([PGGraphMomentNodeCollection alloc], "initWithGraph:elementIdentifiers:", *(_QWORD *)(v40 + 56), v33);
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_4;
        v41[3] = &unk_1E84352A0;
        v29 = v19;
        v42 = v29;
        v43 = *(id *)(v40 + 72);
        -[MANodeCollection enumerateNodesUsingBlock:](v28, "enumerateNodesUsingBlock:", v41);

      }
    }

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);

  }
}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", a2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "targetsForSourceIdentifier:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)(unint64_t)objc_msgSend(v16, "count");
  if (v7 / (double)(unint64_t)objc_msgSend(v6, "count") >= 0.3)
  {
    objc_msgSend(*(id *)(a1 + 48), "targetsForSourceIdentifier:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(*(id *)(a1 + 56), "count")
      || (v10 = *(void **)(a1 + 56),
          objc_msgSend(v9, "elementIdentifiers"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v10) = objc_msgSend(v10, "intersectsIdentifierSet:", v11),
          v11,
          (_DWORD)v10))
    {
      v12 = *(void **)(a1 + 56);
      objc_msgSend(v9, "elementIdentifiers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unionWithIdentifierSet:", v13);

      v14 = *(void **)(a1 + 64);
      objc_msgSend(v16, "elementIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unionWithIdentifierSet:", v15);

      objc_msgSend(*(id *)(a1 + 72), "addIdentifier:", a2);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                              + 24)
                                                                  + a3;
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    }

  }
}

double __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "importance");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphSocialGroupEdge initFromMomentNode:toSocialGroupNode:]([PGGraphSocialGroupEdge alloc], "initFromMomentNode:toSocialGroupNode:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphBelongsToEdge initFromMemberNode:toSocialGroupNode:importance:]([PGGraphBelongsToEdge alloc], "initFromMemberNode:toSocialGroupNode:importance:", v3, *(_QWORD *)(a1 + 32), 1.0);

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphSocialGroupEdge initFromMomentNode:toSocialGroupNode:]([PGGraphSocialGroupEdge alloc], "initFromMomentNode:toSocialGroupNode:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_3(uint64_t a1, uint64_t a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PGGraphSocialGroupNodeCollection *v10;
  uint64_t v11;
  void *v12;
  PGGraphSocialGroupNodeCollection *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  PGGraphSocialGroupNode *v19;
  uint64_t v20;
  id v21;
  PGGraphSocialGroupNode *v22;
  PGGraphSocialGroupNode *v23;
  id v24;
  _QWORD v25[4];
  PGGraphSocialGroupNode *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  PGGraphSocialGroupNodeCollection *v31;
  PGGraphSocialGroupNode *v32;
  id v33;

  objc_msgSend(*(id *)(a1 + 32), "targetsForSourceIdentifier:", a2);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "petNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionByIntersecting:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "momentNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionByIntersecting:", v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [PGGraphSocialGroupNodeCollection alloc];
    v11 = *(_QWORD *)(a1 + 48);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
    v13 = -[MAElementCollection initWithGraph:elementIdentifiers:](v10, "initWithGraph:elementIdentifiers:", v11, v12);

    v14 = (double)(unint64_t)objc_msgSend(v9, "count");
    if ((double)(unint64_t)objc_msgSend(v24, "count") * 0.3 <= v14)
    {
      -[PGGraphSocialGroupNodeCollection memberNodes](v13, "memberNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "collectionByFormingUnionWith:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[PGGraphSocialGroupNode identifierForMemberNodes:](PGGraphSocialGroupNode, "identifierForMemberNodes:", v17);

      v19 = -[PGGraphSocialGroupNode initWithSocialGroupIdentifier:importance:]([PGGraphSocialGroupNode alloc], "initWithSocialGroupIdentifier:importance:", v18, a3);
      objc_msgSend(*(id *)(a1 + 56), "addNode:", v19);
      v20 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_4;
      v28[3] = &unk_1E842C250;
      v29 = v24;
      v21 = v9;
      v30 = v21;
      v31 = v13;
      v22 = v19;
      v32 = v22;
      v33 = *(id *)(a1 + 56);
      objc_msgSend(v16, "enumerateNodesUsingBlock:", v28);
      v25[0] = v20;
      v25[1] = 3221225472;
      v25[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_6;
      v25[3] = &unk_1E84352A0;
      v26 = v22;
      v27 = *(id *)(a1 + 56);
      v23 = v22;
      objc_msgSend(v21, "enumerateNodesUsingBlock:", v25);

    }
  }

}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  PGGraphSocialGroupMemberNodeCollection *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "label");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v4 == CFSTR("Pet"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "count");
      v8 = (double)(v9 / objc_msgSend(*(id *)(a1 + 32), "count"));
    }
    else
    {
      v8 = 0.0;
    }
  }
  else
  {
    v5 = -[MANodeCollection initWithNode:]([PGGraphSocialGroupMemberNodeCollection alloc], "initWithNode:", v3);
    +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphBelongsToEdgeCollection, "edgesFromNodes:toNodes:", v5, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = (double *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    if (objc_msgSend(v6, "count"))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_5;
      v11[3] = &unk_1E84345A0;
      v11[4] = &v12;
      objc_msgSend(v6, "enumerateImportancesUsingBlock:", v11);
      v7 = v13[3];
      v8 = v7 / (double)(unint64_t)objc_msgSend(v6, "count");
    }
    else
    {
      v8 = 0.0;
    }
    _Block_object_dispose(&v12, 8);

  }
  v10 = -[PGGraphBelongsToEdge initFromMemberNode:toSocialGroupNode:importance:]([PGGraphBelongsToEdge alloc], "initFromMemberNode:toSocialGroupNode:importance:", v3, *(_QWORD *)(a1 + 56), v8);
  objc_msgSend(*(id *)(a1 + 64), "addEdge:", v10);

}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphSocialGroupEdge initFromMomentNode:toSocialGroupNode:]([PGGraphSocialGroupEdge alloc], "initFromMomentNode:toSocialGroupNode:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

double __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_5(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, float a5)
{
  id v9;
  id v10;
  id v11;
  double Current;
  uint64_t v13;
  int64_t v14;
  void *v15;
  PGGraphSocialGroupNode *v16;
  PGGraphMomentNodeCollection *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  PGGraphSocialGroupMemberNodeCollection *v26;
  void *v27;
  PGGraphSocialGroupNode *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  PGGraphMomentNodeCollection *v44;
  PGGraphSocialGroupNode *v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  char v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (*(_QWORD *)(a1 + 64)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
        Current - *(double *)(v13 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v13 + 24) = Current,
        v53 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(0.5),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                               + 24)) != 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  }
  else
  {
    v14 = +[PGGraphSocialGroupNode identifierForMemberNodes:](PGGraphSocialGroupNode, "identifierForMemberNodes:", v9);
    if (*(_BYTE *)(a1 + 104))
    {
      v15 = 0;
    }
    else
    {
      +[PGGraphSocialGroupNodeCollection socialGroupNodeForSocialGroupIdentifier:inGraph:](PGGraphSocialGroupNodeCollection, "socialGroupNodeForSocialGroupIdentifier:inGraph:", v14, *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v37 = v11;
    v38 = v10;
    v36 = v15;
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "anyNode");
      v16 = (PGGraphSocialGroupNode *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "addIdentifier:", -[MANode identifier](v16, "identifier"));
      v17 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v11, *(_QWORD *)(a1 + 32));
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphSocialGroupEdgeCollection, "edgesFromNodes:toNodes:", v17, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(a1 + 48);
      objc_msgSend(v18, "elementIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unionWithIdentifierSet:", v20);

      +[MANodeCollection sourceNodesOfEdges:](PGGraphMomentNodeCollection, "sourceNodesOfEdges:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v23 = (void *)MEMORY[0x1E0CB3880];
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2;
      v51[3] = &unk_1E842C188;
      v52 = v21;
      v35 = v21;
      objc_msgSend(v23, "predicateWithBlock:", v51);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredArrayUsingPredicate:", v24);
      v25 = (id)objc_claimAutoreleasedReturnValue();

      v26 = -[MAElementCollection initWithArray:graph:]([PGGraphSocialGroupMemberNodeCollection alloc], "initWithArray:graph:", v9, *(_QWORD *)(a1 + 32));
      +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphBelongsToEdgeCollection, "edgesFromNodes:toNodes:", v26, v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v22;
      v47[1] = 3221225472;
      v47[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_3;
      v47[3] = &unk_1E842C1B0;
      v48 = v9;
      v49 = v38;
      v50 = *(id *)(a1 + 32);
      objc_msgSend(v27, "enumerateEdgesUsingBlock:", v47);

    }
    else
    {
      v28 = -[PGGraphSocialGroupNode initWithSocialGroupIdentifier:importance:]([PGGraphSocialGroupNode alloc], "initWithSocialGroupIdentifier:importance:", v14, a5);
      objc_msgSend(*(id *)(a1 + 56), "addNode:", v28);
      v25 = v11;
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_4;
      v43[3] = &unk_1E842C1D8;
      v44 = (PGGraphMomentNodeCollection *)v10;
      v16 = v28;
      v45 = v16;
      v46 = *(id *)(a1 + 56);
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v43);

      v17 = v44;
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = v25;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(v29);
          v34 = -[PGGraphSocialGroupEdge initFromMomentNode:toSocialGroupNode:]([PGGraphSocialGroupEdge alloc], "initFromMomentNode:toSocialGroupNode:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), v16);
          objc_msgSend(*(id *)(a1 + 56), "addEdge:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
      }
      while (v31);
    }

    v11 = v37;
    v10 = v38;
  }

}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.33 + 0.33);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2_174(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.33 + 0.66);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsNode:", a2) ^ 1;
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10 = v3;
  objc_msgSend(v3, "memberNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    +[PGGraphBelongsToEdge setImportance:onBelongsToEdgeForIdentifier:inGraph:](PGGraphBelongsToEdge, "setImportance:onBelongsToEdgeForIdentifier:inGraph:", objc_msgSend(v10, "identifier"), *(_QWORD *)(a1 + 48), v9);
  }

}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = -[PGGraphBelongsToEdge initFromMemberNode:toSocialGroupNode:importance:]([PGGraphBelongsToEdge alloc], "initFromMemberNode:toSocialGroupNode:importance:", v6, *(_QWORD *)(a1 + 40), v9);
  objc_msgSend(*(id *)(a1 + 48), "addEdge:", v10);

}

uint64_t __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5);
}

uint64_t __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke_154(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5 + 0.5);
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 8;
}

@end
