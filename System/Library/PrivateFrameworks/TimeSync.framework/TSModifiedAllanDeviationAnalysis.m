@implementation TSModifiedAllanDeviationAnalysis

- (TSModifiedAllanDeviationAnalysis)initWithTimeErrorValues:(id)a3
{
  TSModifiedAllanDeviationAnalysis *v3;
  TSModifiedAllanDeviationAnalysis *v4;
  double *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSModifiedAllanDeviationAnalysis;
  v3 = -[TSTimeErrorAnalysis initWithTimeErrorValues:](&v7, sel_initWithTimeErrorValues_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (double *)malloc_type_calloc(-[TSTimeErrorAnalysis numberOfErrors](v3, "numberOfErrors"), 8uLL, 0x100004000313F17uLL);
    v4->_madev = v5;
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
  return -[TSModifiedAllanDeviationAnalysis threadingLimit](self, "threadingLimit") / 10;
}

- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  const double *v17;
  double *v18;
  double *v19;
  TSModifiedAllanDeviationAnalysis *v20;
  double *v23;
  uint64_t v24;
  double __C;

  v7 = -[TSTimeErrorAnalysis numberOfErrors](self, "numberOfErrors");
  v19 = -[TSTimeErrorAnalysis timeErrors](self, "timeErrors");
  v8 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  v23 = (double *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
  -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
  v10 = v9;
  v20 = self;
  -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
  if (v8 && v23 && a3 <= a4)
  {
    v12 = v10 * v11;
    v13 = v7 - 3 * a3 + 1;
    v14 = 2 * a3;
    v15 = a3;
    do
    {
      v24 = -3 * a3 + v7;
      if (v24 >= 0)
      {
        v16 = 0;
        v17 = v19;
        v18 = v23;
        do
        {
          vDSP_vsubD(&v17[v15], 1, &v17[v14], 1, v8, 1, a3 - 1);
          vDSP_vsubD(&v17[v15], 1, v8, 1, v8, 1, a3 - 1);
          vDSP_vaddD(v8, 1, v17, 1, v8, 1, a3 - 1);
          vDSP_svesqD(v8, 1, v18, a3 - 1);
          ++v16;
          ++v18;
          ++v17;
        }
        while (v13 != v16);
      }
      __C = 0.0;
      vDSP_svesqD(v23, 1, &__C, v24 + 1);
      v20->_madev[a3] = sqrt(__C / (v12 * (double)(2 * a3 * a3 * a3 * a3) * (double)(v24 + 1)));
      a3 += a5;
      v13 -= 3 * a5;
      v14 += 2 * a5;
      v15 += a5;
    }
    while (a3 <= a4);
  }
  free(v8);
  free(v23);
}

- (NSArray)madev
{
  void *v3;
  uint64_t i;
  TSMADEVValue *v5;
  double v6;
  TSMADEVValue *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TSTimeErrorAnalysis calculated](self, "calculated"))
    -[TSTimeErrorAnalysis performAnalysis](self, "performAnalysis");
  for (i = -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize");
        i <= -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize");
        i += -[TSTimeErrorAnalysis calculatedStepSize](self, "calculatedStepSize"))
  {
    v5 = [TSMADEVValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v7 = -[TSMADEVValue initWithObservationInterval:andMADEV:](v5, "initWithObservationInterval:andMADEV:", v6 * (double)i, self->_madev[i]);
    objc_msgSend(v3, "addObject:", v7);

  }
  return (NSArray *)v3;
}

- (id)madevFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  void *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  TSModifiedAllanDeviationAnalysis *v13;
  int64_t v14;
  TSMADEVValue *v15;
  double v16;
  TSMADEVValue *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 2)
    a3 = 2;
  if (-[TSModifiedAllanDeviationAnalysis analysisLimit](self, "analysisLimit") < a4)
    a4 = -[TSModifiedAllanDeviationAnalysis analysisLimit](self, "analysisLimit");
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
    v15 = [TSMADEVValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v17 = -[TSMADEVValue initWithObservationInterval:andMADEV:](v15, "initWithObservationInterval:andMADEV:", v16 * (double)a3, self->_madev[a3]);
    objc_msgSend(v9, "addObject:", v17);

    a3 += a5;
  }
  return v9;
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return -[TSTimeErrorAnalysis exportAnalysisToDirectoryURL:withFilename:](self, "exportAnalysisToDirectoryURL:withFilename:", a3, CFSTR("madev.csv"));
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
    if (-[TSModifiedAllanDeviationAnalysis analysisLimit](self, "analysisLimit") < a6)
      a6 = -[TSModifiedAllanDeviationAnalysis analysisLimit](self, "analysisLimit");
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
      fwrite("window size,observation interval,madev\n", 0x27uLL, 1uLL, v17);
      for (; a5 < a6; a5 += a7)
      {
        -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
        fprintf(v19, "%ld,%.9f,%.18f\n", a5, v20 * (double)a5 / 1000000000.0, self->_madev[a5]);
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

  free(self->_madev);
  v3.receiver = self;
  v3.super_class = (Class)TSModifiedAllanDeviationAnalysis;
  -[TSTimeErrorAnalysis dealloc](&v3, sel_dealloc);
}

+ (id)variableName
{
  return CFSTR("madev");
}

+ (id)plotYLabel
{
  return CFSTR("MADEV");
}

+ (id)plotTitle
{
  return CFSTR("Modified Allan Deviation");
}

+ (id)plotSize
{
  return CFSTR("f1.set_size_inches(9.5, 10.7)");
}

@end
