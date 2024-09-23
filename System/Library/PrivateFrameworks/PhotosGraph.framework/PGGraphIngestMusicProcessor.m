@implementation PGGraphIngestMusicProcessor

- (PGGraphIngestMusicProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestMusicProcessor *v6;
  PGGraphIngestMusicProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestMusicProcessor;
  v6 = -[PGGraphIngestMusicProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  return 0;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  PGGraphBuilder *graphBuilder;
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  mach_timebase_info v14;
  NSObject *v15;
  NSObject *v16;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  graphBuilder = self->_graphBuilder;
  v6 = a4;
  -[PGGraphBuilder graph](graphBuilder, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MusicIngestProcessing", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v12 = mach_absolute_time();
  -[PGGraphIngestMusicProcessor processMusicForGraph:progressBlock:](self, "processMusicForGraph:progressBlock:", v7, v6);

  v13 = mach_absolute_time();
  v14 = info;
  v15 = v11;
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_END, v9, "MusicIngestProcessing", ", buf, 2u);
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "MusicIngestProcessing";
    v20 = 2048;
    v21 = (float)((float)((float)((float)(v13 - v12) * (float)v14.numer) / (float)v14.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)processMusicForGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  double v11;
  char v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  id v27;
  double Current;
  char v29;
  double v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  double *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint8_t v66[128];
  uint8_t buf[4];
  int v68;
  __int16 v69;
  const char *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v37 = _Block_copy(v7);
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v58 = 0;
  v59 = (double *)&v58;
  v60 = 0x2020000000;
  v61 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke;
  v56[3] = &unk_1E8434AB0;
  v10 = v8;
  v57 = v10;
  objc_msgSend(v6, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("Performer"), 900, v56);
  v52 = 0;
  v53 = (double *)&v52;
  v54 = 0x2020000000;
  v55 = 0x3FB999999999999ALL;
  v34 = v7;
  v35 = v10;
  if (v37
    && (v11 = CFAbsoluteTimeGetCurrent(), v11 - v59[3] >= 0.01)
    && (v59[3] = v11,
        v51 = 0,
        (*((void (**)(void *, char *, double))v37 + 2))(v37, &v51, v53[3]),
        v12 = *((_BYTE *)v63 + 24) | v51,
        (*((_BYTE *)v63 + 24) = v12) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v68 = 106;
      v69 = 2080;
      v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestMusicProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    v36 = objc_alloc_init(MEMORY[0x1E0D4B200]);
    objc_msgSend(v36, "setConversionOptions:", objc_msgSend((id)objc_opt_class(), "nowPlayingStreamConverterOptions"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v9;
    v42[1] = 3221225472;
    v42[2] = __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke_156;
    v42[3] = &unk_1E8428D28;
    v42[4] = self;
    v14 = v6;
    v43 = v14;
    v44 = v10;
    v15 = v13;
    v45 = v15;
    v47 = &v52;
    v16 = v37;
    v46 = v16;
    v48 = &v58;
    v49 = &v62;
    v50 = 0x3F847AE147AE147BLL;
    objc_msgSend(v36, "enumerateSessionsWithBlock:", v42);
    v33 = v15;
    if (*((_BYTE *)v63 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v68 = 122;
        v69 = 2080;
        v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/Ingest Processing/PGGraphIngestMusicProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "musicSessionDateSortDescriptors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortedArrayUsingDescriptors:", v17);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v32;
      v19 = objc_msgSend(v32, "count");
      if (v19)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v20 = v32;
        v21 = 0;
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v66, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v39;
          while (2)
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v39 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              if (v21)
                v26 = (id)objc_msgSend(v14, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("NEXT_SESSION"), v21, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), 1000, 0);
              v27 = v25;

              v21 = v27;
              v53[3] = 0.1 / (double)v19 + v53[3];
              if (v37)
              {
                Current = CFAbsoluteTimeGetCurrent();
                if (Current - v59[3] >= 0.01)
                {
                  v59[3] = Current;
                  v51 = 0;
                  (*((void (**)(id, char *, double))v16 + 2))(v16, &v51, v53[3]);
                  v29 = *((_BYTE *)v63 + 24) | v51;
                  *((_BYTE *)v63 + 24) = v29;
                  if (v29)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      v68 = 141;
                      v69 = 2080;
                      v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestMusicProcessor.m";
                      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    v18 = v32;
                    goto LABEL_31;
                  }
                }
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v66, 16);
            if (v22)
              continue;
            break;
          }
        }

        v18 = v32;
      }
      if (v37)
      {
        v30 = CFAbsoluteTimeGetCurrent();
        if (v30 - v59[3] >= 0.01)
        {
          v59[3] = v30;
          v51 = 0;
          (*((void (**)(id, char *, double))v16 + 2))(v16, &v51, 1.0);
          v31 = *((_BYTE *)v63 + 24) | v51;
          *((_BYTE *)v63 + 24) = v31;
          if (v31)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v68 = 145;
              v69 = 2080;
              v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Ingest/Ingest Processing/PGGraphIngestMusicProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
LABEL_31:

    }
  }
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

}

- (id)_ingestStreamEventSession:(id)a3 graph:(id)a4 performerNodesByName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  PGGraphBuilder *graphBuilder;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id obj;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  const __CFString *v71;
  void *v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v51 = a5;
  objc_msgSend(v8, "localStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", 86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v13);
  v49 = (void *)v14;
  +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v14, v9);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localStartDate");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localEndDate");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v15;
  -[PGGraphBuilder insertMusicSessionNodeWithLocalStartDate:localEndDate:](self->_graphBuilder, "insertMusicSessionNodeWithLocalStartDate:localEndDate:", v15);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v50 = v8;
  objc_msgSend(v8, "events");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v68;
    v52 = *(_QWORD *)v68;
    do
    {
      v19 = 0;
      v54 = v17;
      do
      {
        if (*(_QWORD *)v68 != v18)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v19), "metadata");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "title");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21 && objc_msgSend(v21, "length"))
        {
          graphBuilder = self->_graphBuilder;
          objc_msgSend(v20, "durationInSeconds");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v58 = v22;
          -[PGGraphBuilder insertMusicTrackWithTrackTitle:durationInSeconds:](graphBuilder, "insertMusicTrackWithTrackTitle:durationInSeconds:", v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (id)objc_msgSend(v9, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PLAYS_TRACK"), v53, v25, 1000, 0);
          objc_msgSend(v20, "album");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "length"))
          {
            -[PGGraphBuilder insertMusicAlbumNodeWithAlbumTitle:](self->_graphBuilder, "insertMusicAlbumNodeWithAlbumTitle:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (id)objc_msgSend(v9, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("HAS_TRACK"), v28, v25, 1000, 0);

          }
          v57 = v27;
          v59 = v20;
          objc_msgSend(v20, "genres");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v64;
            do
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v64 != v33)
                  objc_enumerationMutation(v30);
                -[PGGraphBuilder insertMusicGenreNodeWithGenreName:](self->_graphBuilder, "insertMusicGenreNodeWithGenreName:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = (id)objc_msgSend(v9, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("GENRE"), v25, v35, 1001, 0);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            }
            while (v32);
          }
          v20 = v59;
          objc_msgSend(v59, "artist");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "length"))
          {
            v71 = CFSTR("name");
            v72 = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "lowercaseString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectForKeyedSubscript:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v39)
            {
              objc_msgSend(v9, "addUniqueNodeWithLabel:domain:properties:didCreate:", CFSTR("Performer"), 1000, v55, 0);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v40 = (id)objc_msgSend(v9, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("PERFORMED_BY_ARTIST"), v39, v25, 1000, 0);

          }
          v17 = v54;
          v18 = v52;
          v22 = v58;
        }

        ++v19;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    }
    while (v17);
  }

  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __84__PGGraphIngestMusicProcessor__ingestStreamEventSession_graph_performerNodesByName___block_invoke;
  v60[3] = &unk_1E84352A0;
  v61 = v9;
  v41 = v53;
  v62 = v41;
  v42 = v9;
  objc_msgSend(v48, "enumerateNodesUsingBlock:", v60);
  v43 = v62;
  v44 = v41;

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

id __84__PGGraphIngestMusicProcessor__ingestStreamEventSession_graph_performerNodesByName___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", CFSTR("MUSIC_SESSION"), a2, *(_QWORD *)(a1 + 40), 1000, 0);
}

void __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v4, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  }
}

void __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke_156(uint64_t a1, uint64_t a2, _BYTE *a3, double a4)
{
  void *v7;
  double Current;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "_ingestStreamEventSession:graph:performerNodesByName:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a4 * 0.8 + 0.1;
  if (*(_QWORD *)(a1 + 64))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
        *a3 = 1;
    }
  }

}

+ (unint64_t)nowPlayingStreamConverterOptions
{
  return objc_msgSend(MEMORY[0x1E0D4B1F8], "defaultOptions") | 0x38;
}

@end
