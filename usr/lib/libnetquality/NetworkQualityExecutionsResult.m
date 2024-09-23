@implementation NetworkQualityExecutionsResult

- (NetworkQualityExecutionsResult)init
{
  NetworkQualityExecutionsResult *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NetworkQualityExecutionsResult;
  v2 = -[NetworkQualityResult init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityExecutionsResult setWorkingLatencyResults:](v2, "setWorkingLatencyResults:", v3);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityExecutionsResult setIdleLatencyResults:](v2, "setIdleLatencyResults:", v4);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NetworkQualityExecutionsResult setMutableOtherValues:](v2, "setMutableOtherValues:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[NetworkQualityExecutionsResult setMutableURLSessionMetrics:](v2, "setMutableURLSessionMetrics:", v6);

  }
  return v2;
}

- (NSMutableDictionary)workingLatencyResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (void)setWorkingLatencyResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSMutableDictionary)idleLatencyResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setIdleLatencyResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSMutableDictionary)mutableOtherValues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setMutableOtherValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSMutableDictionary)mutableURLSessionMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMutableURLSessionMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableURLSessionMetrics, 0);
  objc_storeStrong((id *)&self->_mutableOtherValues, 0);
  objc_storeStrong((id *)&self->_idleLatencyResults, 0);
  objc_storeStrong((id *)&self->_workingLatencyResults, 0);
}

@end
