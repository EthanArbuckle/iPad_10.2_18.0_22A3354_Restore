@implementation PGGraphIngestEventLabelingProcessor

- (PGGraphIngestEventLabelingProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestEventLabelingProcessor *v6;
  PGGraphIngestEventLabelingProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestEventLabelingProcessor;
  v6 = -[PGGraphIngestEventLabelingProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  __int16 v16;
  __int16 v17;

  v4 = a3;
  if (+[PGEventLabelingConfiguration isEventLabelingEnabled](PGEventLabelingConfiguration, "isEventLabelingEnabled"))
  {
    -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
    objc_msgSend(v5, "urlForApplicationDataFolderIdentifier:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphBuilder eventLabelingFeaturesCache](self->_graphBuilder, "eventLabelingFeaturesCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCacheEmptyAtGraphServiceURL:", v7);

    if ((objc_msgSend(v4, "hasMomentsToInsert") & 1) == 0)
      v6 = objc_msgSend(v4, "hasMomentsToUpdate");
    if ((v9 & v6) == 1)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v17 = 0;
        v12 = "[PGGraphIngestEventLabelingProcessor] GraphUpdate has moments to insert or update, but processor will not "
              "run due to missing feature cache.";
        v13 = (uint8_t *)&v17;
LABEL_14:
        _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
      }
    }
    else
    {
      if (((v9 | v6) & 1) != 0)
      {
LABEL_11:

        goto LABEL_12;
      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v16 = 0;
        v12 = "[PGGraphIngestEventLabelingProcessor] Found features in the event labeling cache, but processor will not r"
              "un because the GraphUpdate does not have moments to insert or update.";
        v13 = (uint8_t *)&v16;
        goto LABEL_14;
      }
    }

    goto LABEL_11;
  }
  LOBYTE(v6) = 0;
LABEL_12:

  return v6;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  PGGraphBuilder *graphBuilder;
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PGGraphBuilder *v17;
  BOOL v18;
  char *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint32_t denom;
  uint32_t numer;
  NSObject *v25;
  NSObject *v26;
  id v27;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  graphBuilder = self->_graphBuilder;
  v7 = a4;
  v8 = a3;
  -[PGGraphBuilder loggingConnection](graphBuilder, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestEventLabelingProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v13 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v15, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = self->_graphBuilder;
  v27 = 0;
  v18 = +[PGEventProcessor processPGGraphForMomentNodes:graphBuilder:progressReporter:error:](PGEventProcessor, "processPGGraphForMomentNodes:graphBuilder:progressReporter:error:", v16, v17, v14, &v27);
  v19 = (char *)v27;
  if (!v18)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "loggingConnection");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "[PGGraphIngestEventLabelingProcessor] Error processing events: %@", buf, 0xCu);
    }

  }
  v22 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v25 = v12;
  v26 = v25;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v26, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestEventLabelingProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "PGGraphIngestEventLabelingProcessor";
    v31 = 2048;
    v32 = (float)((float)((float)((float)(v22 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 31;
}

@end
