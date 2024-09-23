@implementation TSTimeDeviationAnalysis

- (TSTimeDeviationAnalysis)initWithTimeErrorValues:(id)a3
{
  TSTimeDeviationAnalysis *v3;
  TSTimeDeviationAnalysis *v4;
  double *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSTimeDeviationAnalysis;
  v3 = -[TSTimeErrorAnalysis initWithTimeErrorValues:](&v7, sel_initWithTimeErrorValues_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (double *)malloc_type_calloc(-[TSTimeErrorAnalysis numberOfErrors](v3, "numberOfErrors"), 8uLL, 0x100004000313F17uLL);
    v4->_tdev = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (int64_t)analysisLimit
{
  return -[TSTimeErrorAnalysis numberOfErrors](self, "numberOfErrors") / 3 - 1;
}

- (int64_t)threadingLimit
{
  return 10000;
}

- (int64_t)threadingSegment
{
  return -[TSTimeDeviationAnalysis threadingLimit](self, "threadingLimit") / 10;
}

- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v7;
  double *v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  const double *v13;
  double *v14;
  double *v15;
  TSTimeDeviationAnalysis *v16;
  double *v19;
  uint64_t v20;
  double __C;

  v7 = -[TSTimeErrorAnalysis numberOfErrors](self, "numberOfErrors");
  v16 = self;
  v15 = -[TSTimeErrorAnalysis timeErrors](self, "timeErrors");
  v8 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  v19 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  if (v8 && v19 && a3 <= a4)
  {
    v9 = v7 - 3 * a3 + 1;
    v10 = 2 * a3;
    v11 = a3;
    do
    {
      v20 = -3 * a3 + v7;
      if (v20 >= 0)
      {
        v12 = 0;
        v13 = v15;
        v14 = v19;
        do
        {
          vDSP_vsubD(&v13[v11], 1, &v13[v10], 1, v8, 1, a3 - 1);
          vDSP_vsubD(&v13[v11], 1, v8, 1, v8, 1, a3 - 1);
          vDSP_vaddD(v8, 1, v13, 1, v8, 1, a3 - 1);
          vDSP_svesqD(v8, 1, v14, a3 - 1);
          ++v12;
          ++v14;
          ++v13;
        }
        while (v9 != v12);
      }
      __C = 0.0;
      vDSP_svesqD(v19, 1, &__C, v20 + 1);
      v16->_tdev[a3] = sqrt(__C / (double)(6 * a3 * a3 * (v20 + 1)));
      a3 += a5;
      v9 -= 3 * a5;
      v10 += 2 * a5;
      v11 += a5;
    }
    while (a3 <= a4);
  }
  free(v8);
  free(v19);
}

- (NSArray)tdev
{
  void *v3;
  uint64_t i;
  TSTDEVValue *v5;
  double v6;
  TSTDEVValue *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TSTimeErrorAnalysis calculated](self, "calculated"))
    -[TSTimeErrorAnalysis performAnalysis](self, "performAnalysis");
  for (i = -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize");
        i <= -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize");
        i += -[TSTimeErrorAnalysis calculatedStepSize](self, "calculatedStepSize"))
  {
    v5 = [TSTDEVValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v7 = -[TSTDEVValue initWithObservationInterval:andTDEV:](v5, "initWithObservationInterval:andTDEV:", v6 * (double)i, self->_tdev[i]);
    objc_msgSend(v3, "addObject:", v7);

  }
  return (NSArray *)v3;
}

- (id)tdevFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  void *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  TSTimeDeviationAnalysis *v13;
  int64_t v14;
  TSTDEVValue *v15;
  double v16;
  TSTDEVValue *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 2)
    a3 = 2;
  if (-[TSTimeDeviationAnalysis analysisLimit](self, "analysisLimit") < a4)
    a4 = -[TSTimeDeviationAnalysis analysisLimit](self, "analysisLimit");
  if (!-[TSTimeErrorAnalysis calculated](self, "calculated"))
  {
    v13 = self;
    v14 = a3;
    v12 = a4;
LABEL_15:
    -[TSTimeErrorAnalysis performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:](v13, "performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:", v14, v12, a5);
    goto LABEL_16;
  }
  if (a3 < -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize")
    || a4 > -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize")
    || -[TSTimeErrorAnalysis calculatedStepSize](self, "calculatedStepSize") != a5)
  {
    v10 = a3;
    if (a3 >= -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize"))
      v10 = -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize");
    v11 = -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize");
    v12 = a4;
    if (a4 <= v11)
      v12 = -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize");
    v13 = self;
    v14 = v10;
    goto LABEL_15;
  }
LABEL_16:
  while (a3 <= a4)
  {
    v15 = [TSTDEVValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v17 = -[TSTDEVValue initWithObservationInterval:andTDEV:](v15, "initWithObservationInterval:andTDEV:", v16 * (double)a3, self->_tdev[a3]);
    objc_msgSend(v9, "addObject:", v17);

    a3 += a5;
  }
  return v9;
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return -[TSTimeErrorAnalysis exportAnalysisToDirectoryURL:withFilename:](self, "exportAnalysisToDirectoryURL:withFilename:", a3, CFSTR("tdev.csv"));
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3 withFilename:(id)a4 fromStartWindowSize:(int64_t)a5 toEndWindowSize:(int64_t)a6 stepSize:(int64_t)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  FILE *v17;
  BOOL v18;
  FILE *v19;
  double v20;

  v12 = a3;
  v13 = a4;
  if (objc_msgSend(v12, "isFileURL"))
  {
    if (a5 <= 2)
      a5 = 2;
    if (-[TSTimeDeviationAnalysis analysisLimit](self, "analysisLimit") < a6)
      a6 = -[TSTimeDeviationAnalysis analysisLimit](self, "analysisLimit");
    if (!-[TSTimeErrorAnalysis calculated](self, "calculated")
      || a5 < -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize")
      || a6 > -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize")
      || -[TSTimeErrorAnalysis calculatedStepSize](self, "calculatedStepSize") != a7)
    {
      -[TSTimeErrorAnalysis performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:](self, "performAnalysisFromStartWindowSize:toEndWindowSize:stepSize:", a5, a6, a7);
    }
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_retainAutorelease(v15);
    v17 = fopen((const char *)objc_msgSend(v16, "UTF8String"), "w");
    v18 = v17 != 0;
    if (v17)
    {
      v19 = v17;
      fwrite("window size,observation interval,tdev\n", 0x26uLL, 1uLL, v17);
      for (; a5 < a6; a5 += a7)
      {
        -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
        fprintf(v19, "%ld,%.9f,%.18f\n", a5, v20 * (double)a5 / 1000000000.0, self->_tdev[a5]);
      }
      fclose(v19);
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)exportTimeErrorsToDirectoryURL:(id)a3
{
  return -[TSTimeErrorAnalysis exportTimeErrorsToDirectoryURL:withFilename:](self, "exportTimeErrorsToDirectoryURL:withFilename:", a3, CFSTR("time_error_adev.csv"));
}

- (void)dealloc
{
  objc_super v3;

  free(self->_tdev);
  v3.receiver = self;
  v3.super_class = (Class)TSTimeDeviationAnalysis;
  -[TSTimeErrorAnalysis dealloc](&v3, sel_dealloc);
}

+ (id)variableName
{
  return CFSTR("tdev");
}

+ (id)plotYLabel
{
  return CFSTR("TDEV");
}

+ (id)plotTitle
{
  return CFSTR("Time Deviation");
}

+ (id)plotSize
{
  return CFSTR("f1.set_size_inches(9.5, 10.7)");
}

@end
