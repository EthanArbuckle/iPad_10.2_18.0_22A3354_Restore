@implementation TSTimeErrorAnalysis

- (TSTimeErrorAnalysis)initWithTimeErrorValues:(id)a3
{
  id v4;
  TSTimeErrorAnalysis *v5;
  int64_t v6;
  double *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TSTimeErrorAnalysis;
  v5 = -[TSTimeErrorAnalysis init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "count");
    v5->_numberOfErrors = v6;
    if (v6 < 1)
    {

      v5 = 0;
    }
    else
    {
      v5->_timestamps = (double *)malloc_type_calloc(v6, 8uLL, 0x100004000313F17uLL);
      v5->_timeErrors = (double *)malloc_type_calloc(v5->_numberOfErrors, 8uLL, 0x100004000313F17uLL);
      v7 = (double *)malloc_type_calloc(v5->_numberOfErrors, 8uLL, 0x100004000313F17uLL);
      if (v7 && v5->_timestamps && v5->_timeErrors)
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "timestamp");

        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = v4;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = 0;
          v14 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v10);
              v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
              v5->_timestamps[v13] = (double)(unint64_t)(objc_msgSend(v16, "timestamp", (_QWORD)v18) - v9);
              v5->_timeErrors[v13++] = (double)objc_msgSend(v16, "error");
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          }
          while (v12);
        }

        vDSP_vsubD(v5->_timestamps, 1, (const double *)v5->_timestamps + 1, 1, v7, 1, v5->_numberOfErrors - 1);
        vDSP_meanvD(v7, 1, &v5->_averagePeriod, v5->_numberOfErrors - 1);
      }
      else
      {

        v5 = 0;
      }
      free(v7);
    }
  }

  return v5;
}

+ (id)keyPathsForValuesAffectingAnalysisLimit
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("numberOfErrors"));
}

- (int64_t)analysisLimit
{
  return -[TSTimeErrorAnalysis numberOfErrors](self, "numberOfErrors") - 1;
}

- (int64_t)threadingLimit
{
  return 250000;
}

- (int64_t)threadingSegment
{
  return 25000;
}

- (void)performAnalysis
{
  -[TSTimeErrorAnalysis performAnalysisWithThreadingOption:](self, "performAnalysisWithThreadingOption:", 0);
}

- (void)performAnalysisWithThreadingOption:(int64_t)a3
{
  -[TSTimeErrorAnalysis performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:withThreadingOption:](self, "performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:withThreadingOption:", 2, -[TSTimeErrorAnalysis analysisLimit](self, "analysisLimit"), 1, a3);
}

- (void)performAnalysisFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  -[TSTimeErrorAnalysis performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:withThreadingOption:](self, "performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:withThreadingOption:", a3, a4, a5, 0);
}

- (void)performAnalysisFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5 withThreadingOption:(int64_t)a6
{
  uint64_t v11;
  int64_t numberOfErrors;
  void *v13;
  intptr_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;
  const char *v19;
  dispatch_queue_t v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;
  NSObject *v25;
  dispatch_semaphore_t v26;
  dispatch_group_t v27;
  int64_t v28;
  dispatch_queue_t v29;
  int64_t v30;
  int64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  TSTimeErrorAnalysis *v38;
  uint64_t v39;
  _QWORD block[4];
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  TSTimeErrorAnalysis *v44;
  int64_t v45;
  int64_t v46;
  uint64_t v47;

  v11 = mach_absolute_time();
  if (a3 <= 2)
    a3 = 2;
  if (-[TSTimeErrorAnalysis analysisLimit](self, "analysisLimit") < a4)
    a4 = -[TSTimeErrorAnalysis analysisLimit](self, "analysisLimit");
  if (a6 != 1
    && (a6
     || (numberOfErrors = self->_numberOfErrors,
         numberOfErrors < -[TSTimeErrorAnalysis threadingLimit](self, "threadingLimit")))
    || (objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "activeProcessorCount"),
        v13,
        v14 == 1))
  {
    -[TSTimeErrorAnalysis _performAnalysisFromWindowSize:toWindowSize:stepSize:](self, "_performAnalysisFromWindowSize:toWindowSize:stepSize:", a3, a4, a5);
  }
  else
  {
    v39 = a5;
    v37 = v11;
    v15 = (void *)MEMORY[0x1E0CB3940];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.timesync.%@.parallel"), v17);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    v20 = dispatch_queue_create(v19, MEMORY[0x1E0C80D50]);

    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("com.apple.timesync.%@.sequence"), v23);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25 = dispatch_queue_create((const char *)objc_msgSend(v24, "UTF8String"), 0);

    v26 = dispatch_semaphore_create(v14);
    v27 = dispatch_group_create();
    v28 = (a4 - a3 + 1) / v14;
    if (-[TSTimeErrorAnalysis threadingSegment](self, "threadingSegment") < v28)
      v28 = -[TSTimeErrorAnalysis threadingSegment](self, "threadingSegment");
    v29 = v20;
    if (v39 >= 2)
      v28 = v28 / v39 * v39 - v28 + 2 * v28;
    v38 = self;
    if (a3 < a4 - 1)
    {
      v30 = v28;
      v31 = a3;
      do
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke;
        block[3] = &unk_1E694B018;
        v41 = v26;
        v32 = v26;
        v33 = v25;
        v34 = v27;
        v42 = v34;
        v43 = v29;
        v44 = v38;
        v45 = v31;
        v46 = v30;
        v47 = v39;
        v35 = v34;
        v25 = v33;
        v26 = v32;
        dispatch_group_async(v35, v25, block);
        v31 = v30 + 1;
        if (v30 + v28 >= a4)
          v30 = a4;
        else
          v30 += v28;

      }
      while (v31 < a4 - 1);
    }
    dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

    v11 = v37;
    self = v38;
    a5 = v39;
  }
  v36 = mach_absolute_time();
  self->_calculated = 1;
  self->_lowestWindowSize = a3;
  self->_highestWindowSize = a4;
  self->_calculatedStepSize = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[TSAudioTimeErrorCalculator calculateTimeErrorFromStartOffset:toEndOffset:withThreadingOption:].cold.1(v36, v11);
}

intptr_t __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(NSObject **)(a1 + 40);
  v3 = *(NSObject **)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke_2;
  v5[3] = &unk_1E694AFF0;
  v5[4] = *(_QWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 80);
  dispatch_group_async(v2, v3, v5);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __103__TSTimeErrorAnalysis_performAnalysisFromStartWindowSize_toEndWindowSize_stepSize_withThreadingOption___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performAnalysisFromWindowSize:toWindowSize:stepSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return -[TSTimeErrorAnalysis exportAnalysisToDirectoryURL:withFilename:](self, "exportAnalysisToDirectoryURL:withFilename:", a3, CFSTR("analysis.csv"));
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4
{
  return -[TSTimeErrorAnalysis exportAnalysisToDirectoryURL:withFilename:fromStartWindowSize:toEndWindowSize:stepSize:](self, "exportAnalysisToDirectoryURL:withFilename:fromStartWindowSize:toEndWindowSize:stepSize:", a3, a4, 2, self->_numberOfErrors, 1);
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7
{
  return 0;
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3
{
  return -[TSTimeErrorAnalysis exportTimeErrorsToDirectoryURL:withFilename:](self, "exportTimeErrorsToDirectoryURL:withFilename:", a3, CFSTR("time_error_analysis.csv"));
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3 withFilename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  FILE *v11;
  BOOL v12;
  FILE *v13;
  int64_t v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isFileURL"))
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    v11 = fopen((const char *)objc_msgSend(v10, "UTF8String"), "w");
    v12 = v11 != 0;
    if (v11)
    {
      v13 = v11;
      fwrite("index,time,error\n", 0x11uLL, 1uLL, v11);
      if (self->_numberOfErrors >= 1)
      {
        v14 = 0;
        do
        {
          fprintf(v13, "%ld,%.9f,%.12f\n", v14, self->_timestamps[v14], self->_timeErrors[v14]);
          ++v14;
        }
        while (v14 < self->_numberOfErrors);
      }
      fclose(v13);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_timestamps);
  free(self->_timeErrors);
  v3.receiver = self;
  v3.super_class = (Class)TSTimeErrorAnalysis;
  -[TSTimeErrorAnalysis dealloc](&v3, sel_dealloc);
}

+ (id)generatePythonScriptWithOutputPath:(id)a3 fileName:(id)a4 titleName:(id)a5 plotPath:(id)a6 showPlot:(BOOL)a7
{
  id v11;
  id v12;
  void *v13;
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
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  void *v31;

  v29 = a7;
  v11 = a3;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB37A0];
  v14 = a5;
  v15 = a4;
  objc_msgSend(v13, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "variableName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "additionalScriptInitialization");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("#!/usr/bin/env python3\n\nimport numpy as np\nimport matplotlib.pyplot as plt\nimport os\nimport sys\n\n%@\n"), v18);

  v30 = v12;
  v31 = v11;
  if (v11)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@/%@'"), v11, v15);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("os.path.split(sys.argv[0])[0]+'/%@'"), v15, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "additionalScriptRecords");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("%@Records = np.recfromtxt(%@, dtype=None, delimiter=',', names=True, encoding='utf-8')\n\ntau = %@Records.observation_interval\n%@ = %@Records.%@\n\n%@\n"), v17, v19, v17, v17, v17, v17, v20);

  objc_msgSend(v17, "uppercaseString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "additionalScriptPlots:", CFSTR("ax1"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "plotYLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "plotTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "plotYLimits:", CFSTR("ax1"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendFormat:", CFSTR("f1, ax1 = plt.subplots()\nl1, = ax1.plot(tau, %@, 'r-', label='%@')\n%@\nax1.set_ylabel('%@')\nax1.set_xlabel('Observation Interval (s)')\nax1.set_title('%@ - %@')\nax1.set_xscale('log')\nax1.set_yscale('log')\n%@\nax1.set_aspect(1)\nax1.grid(True)\n\nplt.subplots_adjust(left=0.05, right=0.97, bottom=0.05, top=0.97)\n"), v17, v21, v22, v23, v24, v14, v25);

  if (v30)
  {
    objc_msgSend(a1, "plotSize");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR("\n%@\n\nf1.savefig('%@')\n"), v26, v30);

  }
  if (v29)
    objc_msgSend(v16, "appendString:", CFSTR("\nplt.show()\n"));

  return v16;
}

+ (id)variableName
{
  return &stru_1E694C148;
}

+ (id)plotYLabel
{
  return CFSTR("REPLACE LABEL");
}

+ (id)plotTitle
{
  return CFSTR("REPLACE TITLE");
}

+ (id)plotYLimits:(id)a3
{
  return &stru_1E694C148;
}

+ (id)plotSize
{
  return &stru_1E694C148;
}

+ (id)additionalScriptInitialization
{
  return &stru_1E694C148;
}

+ (id)additionalScriptRecords
{
  return &stru_1E694C148;
}

+ (id)additionalScriptPlots:(id)a3
{
  return &stru_1E694C148;
}

- (int64_t)numberOfErrors
{
  return self->_numberOfErrors;
}

- (double)timestamps
{
  return self->_timestamps;
}

- (double)timeErrors
{
  return self->_timeErrors;
}

- (double)averagePeriod
{
  return self->_averagePeriod;
}

- (BOOL)calculated
{
  return self->_calculated;
}

- (int64_t)lowestWindowSize
{
  return self->_lowestWindowSize;
}

- (int64_t)highestWindowSize
{
  return self->_highestWindowSize;
}

- (int64_t)calculatedStepSize
{
  return self->_calculatedStepSize;
}

@end
