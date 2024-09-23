@implementation PGGraphIngestPetProcessor

- (PGGraphIngestPetProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPetProcessor *v6;
  PGGraphIngestPetProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPetProcessor;
  v6 = -[PGGraphIngestPetProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v7->_petPrintClusteringEnabled = 1;
  }

  return v7;
}

- (id)initForTestingWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPetProcessor *v6;
  PGGraphIngestPetProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPetProcessor;
  v6 = -[PGGraphIngestPetProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v7->_petPrintClusteringEnabled = 0;
  }

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0
    || (objc_msgSend(v3, "hasPersonsToUpdate") & 1) != 0
    || (objc_msgSend(v3, "hasPersonsToDelete") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "momentUpdateTypes");
    v4 = (objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes") & v6) != 0;
  }

  return v4;
}

- (void)runPetIngestWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  double v5;
  double v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  double Current;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  uint64_t v25;
  uint32_t numer;
  uint32_t denom;
  NSObject *v28;
  NSObject *v29;
  double v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  PGPet *v45;
  void *v46;
  void *v47;
  PGPet *v48;
  int v49;
  int *v50;
  double v51;
  NSObject *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  uint64_t i;
  id v59;
  double v60;
  int *v61;
  double v62;
  id v63;
  id v64;
  PGGraphBuilder *graphBuilder;
  void *v66;
  NSObject *v67;
  const char *v68;
  uint32_t v69;
  uint64_t v70;
  uint32_t v71;
  uint32_t v72;
  NSObject *v73;
  NSObject *v74;
  __int128 v75;
  uint64_t v76;
  os_signpost_id_t spid;
  unint64_t v78;
  unsigned int v79;
  id obj;
  NSObject *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  char v90;
  void *v91;
  void (**v93)(void *, uint8_t *, double);
  _QWORD v94[4];
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  unsigned __int8 v104;
  _QWORD v105[5];
  mach_timebase_info info;
  uint8_t v107[4];
  _BYTE v108[18];
  _BYTE v109[128];
  uint8_t v110[128];
  _BYTE buf[24];
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v89 = a3;
  v82 = a4;
  v5 = 0.0;
  v93 = (void (**)(void *, uint8_t *, double))_Block_copy(v82);
  if (!v93 || (v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_generate(v7);
    v9 = v7;
    v10 = v9;
    spid = v8;
    v78 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestPetProcessor", ", buf, 2u);
    }
    v81 = v10;

    info = 0;
    mach_timebase_info(&info);
    v76 = mach_absolute_time();
    if (v93)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v5 >= 0.01)
      {
        v107[0] = 0;
        v93[2](v93, v107, 0.0);
        if (v107[0])
        {
          v12 = v10;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 120;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_106;
        }
        v5 = Current;
      }
    }
    v79 = objc_msgSend(v89, "isResumingFullAnalysis");
    if (v79)
    {
      -[PGGraphIngestPetProcessor _deleteAllPetNodesInGraph:](self, "_deleteAllPetNodesInGraph:", v91);
      -[PGGraphIngestPetProcessor _fetchAllVerifiedPetsInPhotosLibrary:](self, "_fetchAllVerifiedPetsInPhotosLibrary:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v89, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v91, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "petNodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unionSet:", v15);
      objc_msgSend(v89, "localIdentifiersOfPersonsToUpdate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unionSet:", v17);

      objc_msgSend(v89, "localIdentifiersOfPersonsToDelete");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unionSet:", v18);

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unionSet:", v15);
      objc_msgSend(v89, "localIdentifiersOfPersonsToUpdate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unionSet:", v20);

      -[PGGraphIngestPetProcessor _deletePetNodesWithLocalIdentifiers:inGraph:](self, "_deletePetNodesWithLocalIdentifiers:inGraph:", v16, v91);
      -[PGGraphIngestPetProcessor _fetchVerifiedPetsWithLocalIdentifiers:inPhotoLibrary:](self, "_fetchVerifiedPetsWithLocalIdentifiers:inPhotoLibrary:", v19, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v85 || !objc_msgSend(v85, "count"))
    {
      v25 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v28 = v81;
      v29 = v28;
      if (v78 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v29, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestPetProcessor", ", buf, 2u);
      }

      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        goto LABEL_105;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PGGraphIngestPetProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v25 - v76) * (float)numer) / (float)denom) / 1000000.0);
      v23 = "[Performance] %s: %f ms";
      v22 = v29;
      v24 = 22;
      goto LABEL_31;
    }
    if (v93)
    {
      v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v5 >= 0.01)
      {
        v107[0] = 0;
        v93[2](v93, v107, 0.2);
        if (v107[0])
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_105:

            v12 = v81;
LABEL_106:

            goto LABEL_107;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 155;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
          v22 = MEMORY[0x1E0C81028];
          v23 = "Cancelled at line %d in file %s";
          v24 = 18;
LABEL_31:
          _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);
          goto LABEL_105;
        }
        v5 = v21;
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v112 = __Block_byref_object_copy__11745;
    v113 = __Block_byref_object_dispose__11746;
    v114 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke;
    v105[3] = &unk_1E8429118;
    v105[4] = buf;
    objc_msgSend(v85, "enumerateObjectsUsingBlock:", v105);
    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs:photoLibrary:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v84);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      v30 = CFAbsoluteTimeGetCurrent();
      if (v30 - v5 >= 0.01)
      {
        v104 = 0;
        v93[2](v93, &v104, 0.3);
        if (v104)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v107 = 67109378;
            *(_DWORD *)v108 = 164;
            *(_WORD *)&v108[4] = 2080;
            *(_QWORD *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
          }
          goto LABEL_104;
        }
        v5 = v30;
      }
    }
    v31 = objc_msgSend(v85, "count");
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v31);
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = v85;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
    v34 = (double)v31;
    if (v32)
    {
      v90 = 0;
      v86 = *(_QWORD *)v101;
      v35 = 0.3;
      *(_QWORD *)&v33 = 67109378;
      v75 = v33;
      while (2)
      {
        v36 = 0;
        v37 = v5;
        v87 = v32;
        do
        {
          if (*(_QWORD *)v101 != v86)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v36);
          v39 = (void *)MEMORY[0x1CAA4EB2C]();
          v40 = -[PGGraphIngestPetProcessor _speciesForDetectionType:](self, "_speciesForDetectionType:", objc_msgSend(v38, "detectionType"));
          objc_msgSend(v38, "uuid");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v42, "count"))
          {
            +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v42, v91);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v38, "type");
            v45 = [PGPet alloc];
            objc_msgSend(v38, "localIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "name");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[PGPet initWithLocalIdentifier:petSpecies:name:isFavorite:momentNodes:ownerNodes:](v45, "initWithLocalIdentifier:petSpecies:name:isFavorite:momentNodes:ownerNodes:", v46, v40, v47, v44 == 1, v43, 0);

            objc_msgSend(v83, "addObject:", v48);
          }
          v35 = 0.2 / v34 + v35;
          if (v93 && (v5 = CFAbsoluteTimeGetCurrent(), v5 - v37 >= 0.01))
          {
            v104 = 0;
            v93[2](v93, &v104, v35);
            if (v104 | v90 & 1)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v107 = v75;
                *(_DWORD *)v108 = 182;
                *(_WORD *)&v108[4] = 2080;
                *(_QWORD *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
              }
              v49 = 0;
              v90 = 1;
            }
            else
            {
              v90 = 0;
              v49 = 1;
            }
          }
          else
          {
            v49 = 1;
            v5 = v37;
          }

          objc_autoreleasePoolPop(v39);
          if (!v49)
          {

            goto LABEL_103;
          }
          ++v36;
          v37 = v5;
        }
        while (v87 != v36);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v110, 16);
        if (v32)
          continue;
        break;
      }
    }
    else
    {
      v90 = 0;
      v35 = 0.3;
    }

    if (v93)
    {
      v50 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
      v51 = CFAbsoluteTimeGetCurrent();
      if (v51 - v5 >= 0.01)
      {
        v104 = 0;
        v93[2](v93, &v104, 0.5);
        if (v104 | v90 & 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v107 = 67109378;
            *(_DWORD *)v108 = 185;
            *(_WORD *)&v108[4] = 2080;
            *(_QWORD *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            v52 = MEMORY[0x1E0C81028];
LABEL_83:
            _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
            goto LABEL_103;
          }
          goto LABEL_103;
        }
        v90 = 0;
        v5 = v51;
      }
    }
    else
    {
      v50 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
    }
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v53 = v83;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
    if (v54)
    {
      v55 = *(_QWORD *)v97;
      v56 = *((double *)v50 + 72);
      v57 = 0.3 / v34;
      while (2)
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v97 != v55)
            objc_enumerationMutation(v53);
          v59 = -[PGGraphBuilder insertPet:](self->_graphBuilder, "insertPet:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i), v75);
          v35 = v57 + v35;
          if (v93)
          {
            v60 = CFAbsoluteTimeGetCurrent();
            if (v60 - v5 >= v56)
            {
              v104 = 0;
              v93[2](v93, &v104, v35);
              if (v104 | v90 & 1)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v107 = 67109378;
                  *(_DWORD *)v108 = 192;
                  *(_WORD *)&v108[4] = 2080;
                  *(_QWORD *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
                }

                goto LABEL_103;
              }
              v90 = 0;
              v5 = v60;
            }
          }
        }
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
        if (v54)
          continue;
        break;
      }
    }

    if (v93)
    {
      v61 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
      v62 = CFAbsoluteTimeGetCurrent();
      if (v62 - v5 >= 0.01)
      {
        v104 = 0;
        v93[2](v93, &v104, 0.8);
        if (v104 | v90 & 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v107 = 67109378;
            *(_DWORD *)v108 = 195;
            *(_WORD *)&v108[4] = 2080;
            *(_QWORD *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            v52 = MEMORY[0x1E0C81028];
            goto LABEL_83;
          }
LABEL_103:

LABEL_104:
          _Block_object_dispose(buf, 8);

          goto LABEL_105;
        }
        v90 = 0;
        v5 = v62;
      }
    }
    else
    {
      v61 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
    }
    v63 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke_249;
    v94[3] = &unk_1E8429140;
    v64 = v63;
    v95 = v64;
    +[PGImportantEntitiesPetProcessor processUserPetsInGraph:progressBlock:withProcessInferredPetNodeClosure:](PGImportantEntitiesPetProcessor, "processUserPetsInGraph:progressBlock:withProcessInferredPetNodeClosure:", v91, v82, v94);
    if (objc_msgSend(v64, "count"))
    {
      graphBuilder = self->_graphBuilder;
      objc_msgSend(v91, "meNode");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphBuilder insertOwner:forPets:](graphBuilder, "insertOwner:forPets:", v66, v64);

      v61 = &OBJC_IVAR____TtC11PhotosGraphP33_9DC9DF9C86728BDC9D73ADC3140142CF24FrequentLocationModifier_smallCountryStateLevelModifier;
    }
    -[PGGraphIngestPetProcessor _donatePetRelationshipsForPetNodes:isFullRebuild:progressBlock:](self, "_donatePetRelationshipsForPetNodes:isFullRebuild:progressBlock:", v64, v79, v82, v75);
    if (v93
      && CFAbsoluteTimeGetCurrent() - v5 >= *((double *)v61 + 72)
      && (v104 = 0, v93[2](v93, &v104, 1.0), v104 | v90 & 1))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_102:

        goto LABEL_103;
      }
      *(_DWORD *)v107 = 67109378;
      *(_DWORD *)v108 = 211;
      *(_WORD *)&v108[4] = 2080;
      *(_QWORD *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
      v67 = MEMORY[0x1E0C81028];
      v68 = "Cancelled at line %d in file %s";
      v69 = 18;
    }
    else
    {
      v70 = mach_absolute_time();
      v71 = info.numer;
      v72 = info.denom;
      v73 = v81;
      v74 = v73;
      if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)v107 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v74, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestPetProcessor", ", v107, 2u);
      }

      if (!os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        goto LABEL_102;
      *(_DWORD *)v107 = 136315394;
      *(_QWORD *)v108 = "PGGraphIngestPetProcessor";
      *(_WORD *)&v108[8] = 2048;
      *(double *)&v108[10] = (float)((float)((float)((float)(v70 - v76) * (float)v71) / (float)v72) / 1000000.0);
      v68 = "[Performance] %s: %f ms";
      v67 = v74;
      v69 = 22;
    }
    _os_log_impl(&dword_1CA237000, v67, OS_LOG_TYPE_INFO, v68, v107, v69);
    goto LABEL_102;
  }
  v107[0] = 0;
  v93[2](v93, v107, 0.0);
  if (!v107[0])
  {
    v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 113;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_107:

}

- (id)momentNodesForPerson:(id)a3 inPhotoLibrary:(id)a4 withGraph:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CD1670];
  objc_msgSend(a3, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchMomentsForPersonsWithLocalIdentifiers:options:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "uuid", (_QWORD)v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", v14, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (unint64_t)_speciesForDetectionType:(signed __int16)a3
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint64_t v9;
  uint64_t v10;

  switch(a3)
  {
    case 0:
    case 2:
      result = 0;
      break;
    case 1:
      v9 = v3;
      v10 = v4;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "loggingConnection");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "Received person's face when expected animal's face", v8, 2u);
      }

      result = 0;
      break;
    case 3:
      result = 2;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (id)_fetchAllVerifiedPetsInPhotosLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedPetDetectionTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludedDetectionTypes:", v4);

  objc_msgSend(v3, "setPersonContext:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fetchVerifiedPetsWithLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "supportedPetDetectionTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIncludedDetectionTypes:", v8);

    objc_msgSend(v7, "setPersonContext:", 1);
    v9 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v5, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchPersonsWithLocalIdentifiers:options:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_deletePetNodesWithLocalIdentifiers:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "count"))
  {
    +[PGGraphPetNodeCollection petNodesForLocalIdentifiers:inGraph:](PGGraphPetNodeCollection, "petNodesForLocalIdentifiers:inGraph:", v8, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v7, "removeNodes:", v6);
    objc_msgSend(v5, "executeGraphChangeRequest:", v7);

  }
}

- (void)_deleteAllPetNodesInGraph:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v4, "removeNodes:", v5);
  objc_msgSend(v3, "executeGraphChangeRequest:", v4);

}

- (void)_donatePetRelationshipsForPetNodes:(id)a3 isFullRebuild:(BOOL)a4 progressBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(void *, mach_timebase_info *, double);
  double v10;
  double Current;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  PGGraphPetRelationshipDonator *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  dispatch_time_t v21;
  intptr_t v22;
  _BOOL4 v23;
  double v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  unsigned __int8 v32;
  _QWORD v33[4];
  NSObject *v34;
  NSObject *v35;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v38[18];
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = a5;
  v9 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v8);
  v10 = 0.0;
  if (v9)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v9[2](v9, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v38 = 284;
          *(_WORD *)&v38[4] = 2080;
          *(_QWORD *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_35;
      }
      v10 = Current;
    }
  }
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphIngestPetProcessorRelationshipDonation", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v30 = mach_absolute_time();
  v16 = objc_alloc_init(PGGraphPetRelationshipDonator);
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __92__PGGraphIngestPetProcessor__donatePetRelationshipsForPetNodes_isFullRebuild_progressBlock___block_invoke;
  v33[3] = &unk_1E8429168;
  v18 = v15;
  v34 = v18;
  v19 = v17;
  v35 = v19;
  -[PGGraphPetRelationshipDonator donateWithPetNodes:isRebuild:completionHandler:](v16, "donateWithPetNodes:isRebuild:completionHandler:", v31, v6, v33);
  v20 = 0;
  while (1)
  {
    ++v20;
    v21 = dispatch_time(0, 10000000000);
    v22 = dispatch_group_wait(v19, v21);
    v23 = v22 != 0;
    if (!v22)
    {
      v24 = v10;
LABEL_18:
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "PGGraphIngestPetProcessor - finished relationhip inference donation", buf, 2u);
      }
      v10 = v24;
      goto LABEL_24;
    }
    if (v20 == 3)
      break;
    if (v9)
    {
      v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v10 >= 0.01)
      {
        buf[0] = 0;
        v9[2](v9, (mach_timebase_info *)buf, 0.5);
        v10 = v24;
        if (buf[0])
          goto LABEL_18;
      }
    }
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "PGGraphIngestPetProcessor - timed out waiting for relationship inference donation to complete", buf, 2u);
  }
  v23 = 0;
LABEL_24:
  v25 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v28 = v18;
  v29 = v28;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v29, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphIngestPetProcessorRelationshipDonation", ", buf, 2u);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v38 = "PGGraphIngestPetProcessorRelationshipDonation";
    *(_WORD *)&v38[8] = 2048;
    *(double *)&v38[10] = (float)((float)((float)((float)(v25 - v30) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (v9)
  {
    if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
    {
      v32 = 0;
      v9[2](v9, (mach_timebase_info *)&v32, 1.0);
      if (v32 | v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v38 = 327;
          *(_WORD *)&v38[4] = 2080;
          *(_QWORD *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_35:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __92__PGGraphIngestPetProcessor__donatePetRelationshipsForPetNodes_isFullRebuild_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_error_impl(&dword_1CA237000, v4, OS_LOG_TYPE_ERROR, "PGGraphIngestPetProcessor - inferred pet relationship donation failed: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_INFO))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1CA237000, v4, OS_LOG_TYPE_INFO, "PGGraphIngestPetProcessor - inferred pet relationship donation succeeded", (uint8_t *)&v5, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke_249(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 8;
}

+ (id)supportedPetDetectionTypes
{
  return &unk_1E84E9730;
}

@end
