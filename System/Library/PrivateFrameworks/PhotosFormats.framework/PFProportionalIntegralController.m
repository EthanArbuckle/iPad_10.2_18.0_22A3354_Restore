@implementation PFProportionalIntegralController

- (PFProportionalIntegralController)initWithSetPoint:(int64_t)a3
{
  PFProportionalIntegralController *v4;
  PFProportionalIntegralController *v5;
  uint64_t v6;
  NSMutableArray *statistics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFProportionalIntegralController;
  v4 = -[PFProportionalIntegralController init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_setPoint = a3;
    v4->_output = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    statistics = v5->_statistics;
    v5->_statistics = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)updateWithTimestamp:(double)a3 error:(int64_t)a4 feedback:(int64_t)a5
{
  uint64_t v6;
  int64_t v7;
  int64_t integralErrorMax;
  int64_t v9;
  int64_t outputMax;
  int64_t outputMin;

  if (a3 != 0.0 && a5 != 0)
  {
    if (!self->_outputReady)
      self->_outputReady = 1;
    v6 = (uint64_t)(self->_proportionalGain * (double)a4);
    v7 = self->_integralError + a4;
    self->_integralError = v7;
    integralErrorMax = self->_integralErrorMax;
    if (v7 > integralErrorMax || (integralErrorMax = self->_integralErrorMin, v7 < integralErrorMax))
    {
      self->_integralError = integralErrorMax;
      v7 = integralErrorMax;
    }
    v9 = self->_output - v6 - (uint64_t)(self->_integralGain * (double)v7);
    self->_output = v9;
    outputMax = self->_outputMax;
    if (outputMax)
    {
      if (outputMax < v9)
        v9 = self->_outputMax;
      self->_output = v9;
    }
    outputMin = self->_outputMin;
    if (outputMin)
    {
      if (outputMin > v9)
        v9 = self->_outputMin;
      self->_output = v9;
    }
    -[PFProportionalIntegralController addStatisticsSampleForTimestamp:error:feedback:](self, "addStatisticsSampleForTimestamp:error:feedback:");
  }
}

- (void)addStatisticsSampleForTimestamp:(double)a3 error:(int64_t)a4 feedback:(int64_t)a5
{
  NSMutableArray *statistics;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    statistics = self->_statistics;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_output);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_integralError);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_setPoint);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[5] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](statistics, "addObject:", v15);

  }
}

- (void)enumerateStatisticsMeasurementsWithHandler:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, double);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSMutableArray *obj;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *, double))a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_statistics;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v8);
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "integerValue");

      objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "integerValue");

      objc_msgSend(v9, "objectAtIndexedSubscript:", 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "integerValue");

      v24 = 0;
      v4[2](v4, v14, v16, v18, v20, v22, &v24, v12);
      if (v24)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)statisticsDescription
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("timestamp\toutput\tfeedback\terror\tintegralError\tsetPoint\n"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PFProportionalIntegralController_statisticsDescription__block_invoke;
  v6[3] = &unk_1E45A4370;
  v4 = v3;
  v7 = v4;
  -[PFProportionalIntegralController enumerateStatisticsMeasurementsWithHandler:](self, "enumerateStatisticsMeasurementsWithHandler:", v6);

  return v4;
}

- (int64_t)setPoint
{
  return self->_setPoint;
}

- (void)setSetPoint:(int64_t)a3
{
  self->_setPoint = a3;
}

- (int64_t)integralError
{
  return self->_integralError;
}

- (void)setIntegralError:(int64_t)a3
{
  self->_integralError = a3;
}

- (int64_t)integralErrorMin
{
  return self->_integralErrorMin;
}

- (void)setIntegralErrorMin:(int64_t)a3
{
  self->_integralErrorMin = a3;
}

- (int64_t)integralErrorMax
{
  return self->_integralErrorMax;
}

- (void)setIntegralErrorMax:(int64_t)a3
{
  self->_integralErrorMax = a3;
}

- (double)proportionalGain
{
  return self->_proportionalGain;
}

- (void)setProportionalGain:(double)a3
{
  self->_proportionalGain = a3;
}

- (double)integralGain
{
  return self->_integralGain;
}

- (void)setIntegralGain:(double)a3
{
  self->_integralGain = a3;
}

- (int64_t)output
{
  return self->_output;
}

- (void)setOutput:(int64_t)a3
{
  self->_output = a3;
}

- (int64_t)outputMin
{
  return self->_outputMin;
}

- (void)setOutputMin:(int64_t)a3
{
  self->_outputMin = a3;
}

- (int64_t)outputMax
{
  return self->_outputMax;
}

- (void)setOutputMax:(int64_t)a3
{
  self->_outputMax = a3;
}

- (NSMutableArray)statistics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStatistics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)outputReady
{
  return self->_outputReady;
}

- (void)setOutputReady:(BOOL)a3
{
  self->_outputReady = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

uint64_t __57__PFProportionalIntegralController_statisticsDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%f\t%ld\t%ld\t%ld\t%ld\t%ld\n"), *(_QWORD *)&a7, a2, a3, a4, a5, a6);
}

@end
