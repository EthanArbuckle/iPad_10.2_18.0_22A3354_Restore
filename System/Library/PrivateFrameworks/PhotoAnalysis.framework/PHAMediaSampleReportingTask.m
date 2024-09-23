@implementation PHAMediaSampleReportingTask

- (NSString)name
{
  return (NSString *)CFSTR("PHAMediaSampleReportingTask");
}

- (double)period
{
  return 86400.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int)priority
{
  return 0;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  void *v4;

  objc_msgSend(a3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PHAMediaSampleReportingTask shouldRunWithPhotoLibrary:](self, "shouldRunWithPhotoLibrary:", v4);

  return (char)self;
}

- (BOOL)shouldRunWithPhotoLibrary:(id)a3
{
  return 1;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "workingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "analytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = -[PHAMediaSampleReportingTask runWithPhotoLibrary:analytics:progressReporter:error:](self, "runWithPhotoLibrary:analytics:progressReporter:error:", v11, v12, v8, a5);
  return (char)a5;
}

- (BOOL)runWithPhotoLibrary:(id)a3 analytics:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  os_log_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = os_log_create("com.apple.PhotosGraph", "metrics");
  if (PFOSVariantHasInternalDiagnostics())
    v13 = 2;
  else
    v13 = 500;
  if (arc4random_uniform(v13) == 1)
  {
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1480], "assetPropertySetsToFetch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFetchPropertySets:", v15);

    objc_msgSend(v14, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(v14, "setIsExclusivePredicate:", 1);
    objc_msgSend(v14, "setChunkSizeForFetch:", 1);
    objc_msgSend(v14, "setCacheSizeForFetch:", 1);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isCancelledWithProgress:", 0.5))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v29[0] = 91;
        LOWORD(v29[1]) = 2080;
        *(_QWORD *)((char *)&v29[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotoAnalysis/Framework/Storytelling/Tasks/AnalyticsTasks/PHAMediaSampleReportingTask.m";
        _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a6 && !*a6)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v18 = objc_msgSend(v16, "count");
      if (v18
        && (objc_msgSend(v16, "objectAtIndexedSubscript:", arc4random_uniform(v18)),
            (v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v20 = (void *)v19;
        v21 = v12;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v20, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v29 = v22;
          _os_log_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_INFO, "[PHAMediaSampleReportingTask] Reporting asset uuid: %@", buf, 0xCu);

        }
        v26 = *MEMORY[0x1E0D09828];
        v27 = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.mediaSample"), v23);

      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_ERROR, "[PHAMediaSampleReportingTask] Media sample report: random asset is nil", buf, 2u);
        }
        v20 = 0;
      }
      v24 = objc_msgSend(v11, "isCancelledWithProgress:", 1.0);
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v29[0] = 109;
          LOWORD(v29[1]) = 2080;
          *(_QWORD *)((char *)&v29[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotoAnalysis/Framework/Storytelling/Tasks/AnalyticsTasks/PHAMediaSampleReportingTask.m";
          _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        if (a6 && !*a6)
        {
          objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v17 = v24 ^ 1;

    }
  }
  else
  {
    v17 = 1;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v29 = v13;
      _os_log_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_INFO, "[PHAMediaSampleReportingTask] Skip media sample reporting, reporting rate: %lu", buf, 0xCu);
    }
  }

  return v17;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAMediaSampleReportingTask timeoutFatal:]", "PHAMediaSampleReportingTask.m", 115, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAMediaSampleReportingTask is stuck", v3, 2u);
  }
}

@end
