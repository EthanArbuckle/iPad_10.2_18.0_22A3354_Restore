@implementation PGGraphIngestPrefetchEventProcessor

- (PGGraphIngestPrefetchEventProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPrefetchEventProcessor *v6;
  PGGraphIngestPrefetchEventProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPrefetchEventProcessor;
  v6 = -[PGGraphIngestPrefetchEventProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (CLSDeviceIs2GBOrLess() & 1) == 0
    && ((objc_msgSend(v3, "hasMomentsToInsert") & 1) != 0 || (objc_msgSend(v3, "momentUpdateTypes") & 0x1F) != 0);

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  id v18;
  void *v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint32_t denom;
  uint32_t numer;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  id v29;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  double v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestPrefetchEventProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v27 = mach_absolute_time();
  objc_msgSend(v6, "momentsToProcessForMomentUpdateTypes:includeMomentsToIngest:", 31, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingDescriptors:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loggingConnection");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v17;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] About to process %d Moments", buf, 8u);
  }

  if (objc_msgSend(v14, "count"))
  {
    v29 = 0;
    -[PGGraphIngestPrefetchEventProcessor prefetchEventsWithSortedMomentNodes:locationsToPrefetch:progressBlock:](self, "prefetchEventsWithSortedMomentNodes:locationsToPrefetch:progressBlock:", v14, &v29, v28);
    v18 = v29;
    if (v18)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v18, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v32) = v21;
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] There are %d additional locations to prefetch", buf, 8u);
      }

      objc_msgSend(v6, "setAdditionalLocationsToPrefetch:", v18);
    }
  }
  else
  {
    v18 = 0;
  }
  v22 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v25 = v10;
  v26 = v25;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v26, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPrefetchEventProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "PGGraphIngestPrefetchEventProcessor";
    v33 = 2048;
    v34 = (float)((float)((float)((float)(v22 - v27) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)prefetchEventsWithSortedMomentNodes:(id)a3 locationsToPrefetch:(id *)a4 progressBlock:(id)a5
{
  id v7;
  double v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  char v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  int v39;
  void *v40;
  NSObject *v41;
  double Current;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  double v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void (**v62)(void *, uint8_t *, double);
  _QWORD v63[4];
  id v64;
  void (**v65)(void *, uint8_t *, double);
  _BYTE *v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  double v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  uint8_t v79[4];
  int v80;
  __int16 v81;
  const char *v82;
  _BYTE buf[24];
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v7 = a5;
  v75 = 0;
  v76 = &v75;
  v77 = 0x2020000000;
  v78 = 0;
  v71 = 0;
  v72 = (double *)&v71;
  v73 = 0x2020000000;
  v74 = 0;
  v62 = (void (**)(void *, uint8_t *, double))_Block_copy(v7);
  v53 = v7;
  if (!v62
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v72[3] < 0.01)
    || (v72[3] = v8,
        v79[0] = 0,
        v62[2](v62, v79, 0.0),
        v9 = *((_BYTE *)v76 + 24) | v79[0],
        (*((_BYTE *)v76 + 24) = v9) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v59 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endDate");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v58;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v57;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] First Moment starts at %@, Last Moment ends at %@", buf, 0x16u);
    }

    v56 = 0;
    if (!v58 || !v57)
      goto LABEL_43;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1577880000.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 31557600.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "laterDate:", v58);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "earlierDate:", v57);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "timeIntervalSinceDate:", v16);
    v60 = v16;
    v49 = v14;
    v50 = v15;
    if (v17 >= 0.0)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "loggingConnection");
      v41 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2112;
        v84 = v58;
        v85 = 2112;
        v86 = v57;
        _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_DEFAULT, "[IngestPrefetchEventProcessor] prefetchStartDate [%@] is later date than prefetchEndDate [%@] because firstMomentUniversalStartDate was %@ and lastMomentUniversalEndDate was %@.", buf, 0x2Au);
      }

      if (v62)
      {
        Current = CFAbsoluteTimeGetCurrent();
        v43 = v16;
        if (Current - v72[3] >= 0.01)
        {
          v72[3] = Current;
          v79[0] = 0;
          v62[2](v62, v79, 1.0);
          v44 = *((_BYTE *)v76 + 24) | v79[0];
          *((_BYTE *)v76 + 24) = v44;
          if (v44)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = 92;
              *(_WORD *)&buf[8] = 2080;
              *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
        v56 = 0;
        v39 = 1;
LABEL_42:

        if (v39)
        {
LABEL_52:

          goto LABEL_53;
        }
LABEL_43:
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "loggingConnection");
        v46 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v56;
          _os_log_impl(&dword_1CA237000, v46, OS_LOG_TYPE_INFO, "[IngestPrefetchEventProcessor] Prefetched %d events in all", buf, 8u);
        }

        if (a4)
          *a4 = objc_retainAutorelease(v59);
        if (v62)
        {
          v47 = CFAbsoluteTimeGetCurrent();
          if (v47 - v72[3] >= 0.01)
          {
            v72[3] = v47;
            v79[0] = 0;
            v62[2](v62, v79, 1.0);
            v48 = *((_BYTE *)v76 + 24) | v79[0];
            *((_BYTE *)v76 + 24) = v48;
            if (v48)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = 151;
                *(_WORD *)&buf[8] = 2080;
                *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }
        goto LABEL_52;
      }
      v56 = 0;
      v39 = 1;
    }
    else
    {
      objc_msgSend(v16, "timeIntervalSinceDate:", v51);
      v19 = v18;
      -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v54)
        __assert_rtn("-[PGGraphIngestPrefetchEventProcessor prefetchEventsWithSortedMomentNodes:locationsToPrefetch:progressBlock:]", "PGGraphIngestPrefetchEventProcessor.m", 99, "serviceManager != nil");
      v20 = v51;
      v56 = 0;
      v21 = MEMORY[0x1E0C81028];
      v55 = v20;
      while (v20 && objc_msgSend(v20, "compare:", v16) == -1)
      {
        v22 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingMonths:toDate:", 6, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "earlierDate:", v60);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "timeIntervalSinceDate:", v55);
        v26 = v25 / v19;
        if (v62
          && (v27 = CFAbsoluteTimeGetCurrent(), v27 - v72[3] >= 0.01)
          && (v72[3] = v27,
              v79[0] = 0,
              v62[2](v62, v79, v26),
              v28 = *((_BYTE *)v76 + 24) | v79[0],
              (*((_BYTE *)v76 + 24) = v28) != 0))
        {
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 110;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
            _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v29 = 1;
        }
        else
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v84 = 0;
          objc_msgSend(v20, "dateByAddingTimeInterval:", -0.001);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dateByAddingTimeInterval:", 0.001);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate >= %@) AND (startDate <= %@)"), v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "filteredArrayUsingPredicate:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __109__PGGraphIngestPrefetchEventProcessor_prefetchEventsWithSortedMomentNodes_locationsToPrefetch_progressBlock___block_invoke;
          v63[3] = &unk_1E8428480;
          v64 = v59;
          v66 = buf;
          v65 = v62;
          v67 = &v71;
          v70 = v26;
          v69 = 0x3F847AE147AE147BLL;
          v68 = &v75;
          objc_msgSend(v54, "prefetchEventsFromUniversalDate:toUniversalDate:forAssetCollectionsSortedByStartDate:usingBlock:", v20, v24, v33, v63);
          if (*((_BYTE *)v76 + 24))
          {
            v29 = 1;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v79 = 67109378;
              v80 = 134;
              v81 = 2080;
              v82 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
              _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v79, 0x12u);
            }
          }
          else
          {
            +[PGLogging sharedLogging](PGLogging, "sharedLogging");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "loggingConnection");
            v35 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
              *(_DWORD *)v79 = 67109120;
              v80 = v36;
              _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "[IngestPrefetchEventProcessor] Prefetched %d events", v79, 8u);
            }

            v37 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
            v38 = v24;

            v29 = 0;
            v56 += v37;
            v20 = v38;
          }

          _Block_object_dispose(buf, 8);
        }

        objc_autoreleasePoolPop(v22);
        v16 = v60;
        if (v29)
        {
          v39 = 1;
          goto LABEL_39;
        }
      }
      v39 = 0;
LABEL_39:

    }
    v43 = v60;
    goto LABEL_42;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 70;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchEventProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_53:
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __109__PGGraphIngestPrefetchEventProcessor_prefetchEventsWithSortedMomentNodes_locationsToPrefetch_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double Current;
  uint64_t v17;

  v5 = a2;
  if (v5)
  {
    v6 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v5, "geoLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x1E0C9E368]);
      objc_msgSend(v7, "coordinate");
      v10 = v9;
      v12 = v11;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v8, "initWithCenter:radius:identifier:", v14, v10, v12, 10.0);

      objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
    }

    objc_autoreleasePoolPop(v6);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  if (*(_QWORD *)(a1 + 40))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (Current - *(double *)(v17 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v17 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 80));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        *a3 = 1;
    }
  }

}

@end
