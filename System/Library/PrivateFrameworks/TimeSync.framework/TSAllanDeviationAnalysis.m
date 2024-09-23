@implementation TSAllanDeviationAnalysis

- (TSAllanDeviationAnalysis)initWithTimeErrorValues:(id)a3
{
  TSAllanDeviationAnalysis *v3;
  TSAllanDeviationAnalysis *v4;
  double *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSAllanDeviationAnalysis;
  v3 = -[TSTimeErrorAnalysis initWithTimeErrorValues:](&v7, sel_initWithTimeErrorValues_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = (double *)malloc_type_calloc(-[TSTimeErrorAnalysis numberOfErrors](v3, "numberOfErrors"), 8uLL, 0x100004000313F17uLL);
    v4->_adev = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (int64_t)analysisLimit
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[TSTimeErrorAnalysis numberOfErrors](self, "numberOfErrors");
  v3 = v2 - 1;
  if (v2 < 1)
    v3 = v2;
  return (v3 >> 1) - 1;
}

- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;
  const double *v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  const double *v19;
  int64_t v20;
  double *__B;
  double __C;

  v8 = -[TSTimeErrorAnalysis numberOfErrors](self, "numberOfErrors");
  __B = -[TSTimeErrorAnalysis timeErrors](self, "timeErrors");
  v9 = (double *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
  -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
  v11 = v10;
  -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
  if (v9)
  {
    v13 = a4;
    if (a3 <= a4)
    {
      v14 = v11 * v12;
      v15 = &__B[a3];
      v16 = 2 * a3;
      v17 = v8 - 2 * a3;
      v18 = 2 * a5;
      v19 = &__B[2 * a3];
      do
      {
        v20 = v13;
        vDSP_vsubD(v15, 1, v19, 1, v9, 1, v17);
        vDSP_vsubD(v15, 1, v9, 1, v9, 1, v17);
        vDSP_vaddD(v9, 1, __B, 1, v9, 1, v17);
        __C = 0.0;
        vDSP_svesqD(v9, 1, &__C, v17);
        v13 = v20;
        self->_adev[a3] = sqrt(__C / (v14 * (double)(v16 * a3) * (double)v17));
        a3 += a5;
        v15 += a5;
        v17 -= v18;
        v19 += 2 * a5;
        v16 += v18;
      }
      while (a3 <= v20);
    }
  }
  free(v9);
}

- (NSArray)adev
{
  void *v3;
  uint64_t i;
  TSADEVValue *v5;
  double v6;
  TSADEVValue *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TSTimeErrorAnalysis calculated](self, "calculated"))
    -[TSTimeErrorAnalysis performAnalysis](self, "performAnalysis");
  for (i = -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize");
        i <= -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize");
        i += -[TSTimeErrorAnalysis calculatedStepSize](self, "calculatedStepSize"))
  {
    v5 = [TSADEVValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v7 = -[TSADEVValue initWithObservationInterval:andADEV:](v5, "initWithObservationInterval:andADEV:", v6 * (double)i, self->_adev[i]);
    objc_msgSend(v3, "addObject:", v7);

  }
  return (NSArray *)v3;
}

- (id)adevFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  void *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  TSAllanDeviationAnalysis *v13;
  int64_t v14;
  TSADEVValue *v15;
  double v16;
  TSADEVValue *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 2)
    a3 = 2;
  if (-[TSAllanDeviationAnalysis analysisLimit](self, "analysisLimit") < a4)
    a4 = -[TSAllanDeviationAnalysis analysisLimit](self, "analysisLimit");
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
    v15 = [TSADEVValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v17 = -[TSADEVValue initWithObservationInterval:andADEV:](v15, "initWithObservationInterval:andADEV:", v16 * (double)a3, self->_adev[a3]);
    objc_msgSend(v9, "addObject:", v17);

    a3 += a5;
  }
  return v9;
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return -[TSTimeErrorAnalysis exportAnalysisToDirectoryURL:withFilename:](self, "exportAnalysisToDirectoryURL:withFilename:", a3, CFSTR("adev.csv"));
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
    if (-[TSAllanDeviationAnalysis analysisLimit](self, "analysisLimit") < a6)
      a6 = -[TSAllanDeviationAnalysis analysisLimit](self, "analysisLimit");
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
      fwrite("window size,observation interval,adev\n", 0x26uLL, 1uLL, v17);
      for (; a5 < a6; a5 += a7)
      {
        -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
        fprintf(v19, "%ld,%.9f,%.18f\n", a5, v20 * (double)a5 / 1000000000.0, self->_adev[a5]);
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

  free(self->_adev);
  v3.receiver = self;
  v3.super_class = (Class)TSAllanDeviationAnalysis;
  -[TSTimeErrorAnalysis dealloc](&v3, sel_dealloc);
}

+ (id)variableName
{
  return CFSTR("adev");
}

+ (id)plotYLabel
{
  return CFSTR("ADEV");
}

+ (id)plotTitle
{
  return CFSTR("Allan Deviation");
}

+ (id)plotSize
{
  return CFSTR("f1.set_size_inches(9.5, 10.7)");
}

@end
