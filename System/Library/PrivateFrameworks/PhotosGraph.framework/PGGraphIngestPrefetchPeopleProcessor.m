@implementation PGGraphIngestPrefetchPeopleProcessor

- (PGGraphIngestPrefetchPeopleProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPrefetchPeopleProcessor *v6;
  PGGraphIngestPrefetchPeopleProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPrefetchPeopleProcessor;
  v6 = -[PGGraphIngestPrefetchPeopleProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  return objc_msgSend(a3, "hasMomentsToInsert");
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  void (**v5)(void *, mach_timebase_info *, double);
  double v6;
  double Current;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  mach_timebase_info v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v23[18];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(a4);
  v6 = 0.0;
  if (v5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v5[2](v5, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v23 = 46;
          *(_WORD *)&v23[4] = 2080;
          *(_QWORD *)&v23[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchPeopleProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_21;
      }
      v6 = Current;
    }
  }
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestPrefetchPeopleProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v12 = mach_absolute_time();
  v13 = objc_alloc(MEMORY[0x1E0D4B168]);
  -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithPhotoLibrary:maximumNumberOfPeople:", v14, 128);
  -[PGGraphBuilder setFocusPeopleIngestCache:](self->_graphBuilder, "setFocusPeopleIngestCache:", v15);

  v16 = mach_absolute_time();
  v17 = info;
  v18 = v11;
  v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestPrefetchPeopleProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v23 = "PGGraphIngestPrefetchPeopleProcessor";
    *(_WORD *)&v23[8] = 2048;
    *(double *)&v23[10] = (float)((float)((float)((float)(v16 - v12) * (float)v17.numer) / (float)v17.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (v5)
  {
    if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
    {
      v20 = 0;
      v5[2](v5, (mach_timebase_info *)&v20, 1.0);
      if (v20)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v23 = 54;
          *(_WORD *)&v23[4] = 2080;
          *(_QWORD *)&v23[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchPeopleProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

@end
