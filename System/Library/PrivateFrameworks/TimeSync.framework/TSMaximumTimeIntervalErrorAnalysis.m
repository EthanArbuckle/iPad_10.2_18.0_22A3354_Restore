@implementation TSMaximumTimeIntervalErrorAnalysis

- (TSMaximumTimeIntervalErrorAnalysis)initWithTimeErrorValues:(id)a3
{
  TSMaximumTimeIntervalErrorAnalysis *v3;
  TSMaximumTimeIntervalErrorAnalysis *v4;
  double *v5;
  double __B;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSMaximumTimeIntervalErrorAnalysis;
  v3 = -[TSTimeErrorAnalysis initWithTimeErrorValues:](&v8, sel_initWithTimeErrorValues_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_negativeTimeErrors = (double *)malloc_type_calloc(-[TSTimeErrorAnalysis numberOfErrors](v3, "numberOfErrors"), 8uLL, 0x100004000313F17uLL);
    v5 = (double *)malloc_type_calloc(-[TSTimeErrorAnalysis numberOfErrors](v4, "numberOfErrors"), 8uLL, 0x100004000313F17uLL);
    v4->_mtie = v5;
    if (v5 && v4->_negativeTimeErrors)
    {
      __B = -1.0;
      vDSP_vsmulD(-[TSTimeErrorAnalysis timeErrors](v4, "timeErrors"), 1, &__B, v4->_negativeTimeErrors, 1, -[TSTimeErrorAnalysis numberOfErrors](v4, "numberOfErrors"));
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)_performAnalysisFromWindowSize:(int64_t)a3 toWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  int64_t v9;
  size_t v10;
  double *v11;
  double *v12;
  double *v13;
  double *v14;
  const double *v15;
  int64_t v16;
  vDSP_Length v17;
  double __B;

  v9 = -[TSTimeErrorAnalysis numberOfErrors](self, "numberOfErrors");
  __B = -1.0;
  v10 = 8 * v9 - 1;
  v11 = (double *)malloc_type_malloc(v10, 0x403C03D0uLL);
  v12 = (double *)malloc_type_malloc(v10, 0x6CE58DF4uLL);
  v13 = (double *)malloc_type_malloc(v10, 0x666BAD40uLL);
  v14 = -[TSTimeErrorAnalysis timeErrors](self, "timeErrors");
  if (v11 && v12 && v13 && a3 <= a4)
  {
    v15 = v14;
    v16 = a3;
    v17 = v9 - a3 + 1;
    do
    {
      vDSP_vswmaxD(v15, 1, v11, 1, v17, a3);
      vDSP_vswmaxD(self->_negativeTimeErrors, 1, v12, 1, v17, a3);
      vDSP_vsmulD(v12, 1, &__B, v12, 1, v17);
      vDSP_vsubD(v12, 1, v11, 1, v13, 1, v17);
      vDSP_maxvD(v13, 1, &self->_mtie[v16], v17);
      a3 += a5;
      v16 += a5;
      v17 -= a5;
    }
    while (a3 <= a4);
  }
  free(v11);
  free(v12);
  free(v13);
}

- (NSArray)mtie
{
  void *v3;
  uint64_t i;
  TSMTIEValue *v5;
  double v6;
  TSMTIEValue *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TSTimeErrorAnalysis calculated](self, "calculated"))
    -[TSTimeErrorAnalysis performAnalysis](self, "performAnalysis");
  for (i = -[TSTimeErrorAnalysis lowestWindowSize](self, "lowestWindowSize");
        i <= -[TSTimeErrorAnalysis highestWindowSize](self, "highestWindowSize");
        i += -[TSTimeErrorAnalysis calculatedStepSize](self, "calculatedStepSize"))
  {
    v5 = [TSMTIEValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v7 = -[TSMTIEValue initWithObservationInterval:andMTIE:](v5, "initWithObservationInterval:andMTIE:", v6 * (double)i, self->_mtie[i]);
    objc_msgSend(v3, "addObject:", v7);

  }
  return (NSArray *)v3;
}

- (id)mtieFromStartWindowSize:(int64_t)a3 toEndWindowSize:(int64_t)a4 stepSize:(int64_t)a5
{
  void *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  TSMaximumTimeIntervalErrorAnalysis *v13;
  int64_t v14;
  TSMTIEValue *v15;
  double v16;
  TSMTIEValue *v17;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 <= 2)
    a3 = 2;
  if (-[TSTimeErrorAnalysis analysisLimit](self, "analysisLimit") < a4)
    a4 = -[TSTimeErrorAnalysis analysisLimit](self, "analysisLimit") - 1;
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
    v15 = [TSMTIEValue alloc];
    -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
    v17 = -[TSMTIEValue initWithObservationInterval:andMTIE:](v15, "initWithObservationInterval:andMTIE:", v16 * (double)a3, self->_mtie[a3]);
    objc_msgSend(v9, "addObject:", v17);

    a3 += a5;
  }
  return v9;
}

- (BOOL)exportAnalysisToDirectoryURL:(id)a3
{
  return -[TSTimeErrorAnalysis exportAnalysisToDirectoryURL:withFilename:](self, "exportAnalysisToDirectoryURL:withFilename:", a3, CFSTR("mtie.csv"));
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
    if (-[TSTimeErrorAnalysis analysisLimit](self, "analysisLimit") < a6)
      a6 = -[TSTimeErrorAnalysis analysisLimit](self, "analysisLimit");
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
      fwrite("window size,observation interval,mtie\n", 0x26uLL, 1uLL, v17);
      for (; a5 < a6; a5 += a7)
      {
        -[TSTimeErrorAnalysis averagePeriod](self, "averagePeriod");
        fprintf(v19, "%ld,%.9f,%.3f\n", a5, v20 * (double)a5 / 1000000000.0, self->_mtie[a5]);
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
  return -[TSTimeErrorAnalysis exportTimeErrorsToDirectoryURL:withFilename:](self, "exportTimeErrorsToDirectoryURL:withFilename:", a3, CFSTR("time_error_mtie.csv"));
}

- (void)dealloc
{
  objc_super v3;

  free(self->_negativeTimeErrors);
  free(self->_mtie);
  v3.receiver = self;
  v3.super_class = (Class)TSMaximumTimeIntervalErrorAnalysis;
  -[TSTimeErrorAnalysis dealloc](&v3, sel_dealloc);
}

+ (id)variableName
{
  return CFSTR("mtie");
}

+ (id)plotYLabel
{
  return CFSTR("MTIE (ns)");
}

+ (id)plotTitle
{
  return CFSTR("MTIE Masks");
}

+ (id)plotYLimits:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.set_ylim([10,1000000000])"), a3);
}

+ (id)plotSize
{
  return CFSTR("f1.set_size_inches(9.5, 13)");
}

+ (id)additionalScriptInitialization
{
  return CFSTR("def looseMTIE(x):\n\tif x < 0.01:\n\t\treturn float(x) * 1000000000\n\telif 0.01 <= x:\n\t\treturn 0.01 * 1000000000\n\treturn math.nan\n\ndef tightMTIE(x):\n\tif x < 0.00001:\n\t\treturn float(x) * 1000000000\n\telse:\n\t\treturn 0.00001 * 1000000000\n\treturn math.nan\n\ndef gPTP7HopMTIE(x):\n\tif x < 0.4069:\n\t\treturn 407\n\telif x < 1:\n\t\treturn float(x) * 1000\n\telse:\n\t\treturn 1000\n\treturn math.nan\n\ndef gPTP1HopMTIE(x):\n\treturn 160\n\nvLooseMTIE = np.vectorize(looseMTIE)\nvTightMTIE = np.vectorize(tightMTIE)\nvGPTP7HopMTIE = np.vectorize(gPTP7HopMTIE)\nvGPTP1HopMTIE = np.vectorize(gPTP1HopMTIE)\n");
}

+ (id)additionalScriptRecords
{
  return CFSTR("looseMask = vLooseMTIE(tau)\ntightMask = vTightMTIE(tau)\ngPTP7HopMask = vGPTP7HopMTIE(tau)\ngPTP1HopMask = vGPTP1HopMTIE(tau)\n");
}

+ (id)additionalScriptPlots:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("l2, = %@.plot(tau, looseMask, 'g-', label='Audio Group')\nl3, = %@.plot(tau, tightMask, 'b-', label='Audio Cluster')\nl4, = %@.plot(tau, gPTP7HopMask, '-', color='#9a0eea', label='gPTP 7 Hop')\nl5, = %@.plot(tau, gPTP1HopMask, '-', color='#fac205', label='gPTP 1 Hop')\nax1.legend(loc='best', fontsize='x-small')\n"), a3, a3, a3, a3);
}

@end
