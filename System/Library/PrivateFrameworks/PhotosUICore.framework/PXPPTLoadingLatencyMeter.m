@implementation PXPPTLoadingLatencyMeter

- (PXPPTLoadingLatencyMeter)initWithOutputType:(id)a3
{
  id v4;
  PXPPTLoadingLatencyMeter *v5;
  PXPPTLoadingLatencyMeter *v6;
  uint64_t v7;
  NSString *outputType;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPPTLoadingLatencyMeter;
  v5 = -[PXPPTLoadingLatencyMeter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lowQualityResults.totalValue = 0.0;
    v5->_lowQualityResults.count = 0;
    v5->_highQualityResults.totalValue = 0.0;
    v5->_highQualityResults.count = 0;
    v5->_lowQualityResults.minValue = 3.40282347e38;
    v5->_lowQualityResults.maxValue = 0.0;
    v5->_highQualityResults.minValue = 3.40282347e38;
    v5->_highQualityResults.maxValue = 0.0;
    objc_msgSend(v4, "capitalizedString");
    v7 = objc_claimAutoreleasedReturnValue();
    outputType = v6->_outputType;
    v6->_outputType = (NSString *)v7;

  }
  return v6;
}

- (void)reportLatency:(double)a3 forOutputQuality:(int64_t)a4
{
  $2E2882BF66C2819973B33399A2E1A600 *p_highQualityResults;
  $2E2882BF66C2819973B33399A2E1A600 *p_mediumQualityResults;
  $2E2882BF66C2819973B33399A2E1A600 *p_lowQualityResults;

  p_highQualityResults = &self->_highQualityResults;
  p_mediumQualityResults = &self->_mediumQualityResults;
  p_lowQualityResults = &self->_lowQualityResults;
  if (a4)
    p_lowQualityResults = 0;
  if (a4 != 1)
    p_mediumQualityResults = p_lowQualityResults;
  if (a4 != 2)
    p_highQualityResults = p_mediumQualityResults;
  if (p_highQualityResults->minValue > a3)
    p_highQualityResults->minValue = a3;
  if (p_highQualityResults->maxValue < a3)
    p_highQualityResults->maxValue = a3;
  ++p_highQualityResults->count;
  p_highQualityResults->totalValue = p_highQualityResults->totalValue + a3;
}

- ($78FA2DCC9A9B4AE6DCC3A2946DFE0BC9)measurementsForOutputQuality:(SEL)a3
{
  $78FA2DCC9A9B4AE6DCC3A2946DFE0BC9 *v4;
  __int128 v5;

  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  if ((unint64_t)a4 <= 2)
  {
    v4 = &self[a4];
    v5 = *(_OWORD *)&v4->var3;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v4->var1;
    *(_OWORD *)&retstr->var2 = v5;
  }
  return self;
}

- (NSDictionary)measurementsDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPPTLoadingLatencyMeter _measurementsDictionaryForOutputQuality:](self, "_measurementsDictionaryForOutputQuality:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[PXPPTLoadingLatencyMeter _measurementsDictionaryForOutputQuality:](self, "_measurementsDictionaryForOutputQuality:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  -[PXPPTLoadingLatencyMeter _measurementsDictionaryForOutputQuality:](self, "_measurementsDictionaryForOutputQuality:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v7;
}

- (id)_measurementsDictionaryForOutputQuality:(int64_t)a3
{
  -[PXPPTLoadingLatencyMeter measurementsForOutputQuality:](self, "measurementsForOutputQuality:");
  return MEMORY[0x1E0C9AA70];
}

- (NSString)measurementsUnit
{
  return self->_measurementsUnit;
}

- (void)setMeasurementsUnit:(id)a3
{
  objc_storeStrong((id *)&self->_measurementsUnit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurementsUnit, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
}

+ (PXPPTLoadingLatencyMeter)sharedInstance
{
  return (PXPPTLoadingLatencyMeter *)(id)instance;
}

+ (void)startMeasurementsForOutputType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithOutputType:", v4);

  v6 = (void *)instance;
  instance = v5;

}

+ (void)stopMeasurements
{
  void *v2;

  v2 = (void *)instance;
  instance = 0;

}

@end
