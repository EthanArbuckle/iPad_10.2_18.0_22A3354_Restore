@implementation TwoSampleTestResult

- (TwoSampleTestResult)initWithTestRan:(BOOL)a3 testSkippedReason:(id)a4 testStatistic:(id)a5 rejectNullHypothesis:(id)a6 sampleSize1:(int64_t)a7 numSuccesses1:(int64_t)a8 minTimestamp1:(id)a9 maxTimestamp1:(id)a10 sampleSize2:(int64_t)a11 numSuccesses2:(int64_t)a12 minTimestamp2:(id)a13 maxTimestamp2:(id)a14
{
  _BOOL8 v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  TwoSampleTestResult *v24;
  TwoSampleTestResult *v25;
  id v28;
  id v29;
  objc_super v30;

  v17 = a3;
  v29 = a4;
  v28 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v22 = a13;
  v23 = a14;
  v30.receiver = self;
  v30.super_class = (Class)TwoSampleTestResult;
  v24 = -[TwoSampleTestResult init](&v30, sel_init);
  v25 = v24;
  if (v24)
  {
    -[TwoSampleTestResult setTestRan:](v24, "setTestRan:", v17);
    -[TwoSampleTestResult setTestSkippedReason:](v25, "setTestSkippedReason:", v29);
    -[TwoSampleTestResult setTestStatistic:](v25, "setTestStatistic:", v28);
    -[TwoSampleTestResult setRejectNullHypothesis:](v25, "setRejectNullHypothesis:", v19);
    -[TwoSampleTestResult setSampleSize1:](v25, "setSampleSize1:", a7);
    -[TwoSampleTestResult setNumSuccesses1:](v25, "setNumSuccesses1:", a8);
    -[TwoSampleTestResult setMinTimestamp1:](v25, "setMinTimestamp1:", v20);
    -[TwoSampleTestResult setMaxTimestamp1:](v25, "setMaxTimestamp1:", v21);
    -[TwoSampleTestResult setSampleSize2:](v25, "setSampleSize2:", a11);
    -[TwoSampleTestResult setNumSuccesses2:](v25, "setNumSuccesses2:", a12);
    -[TwoSampleTestResult setMinTimestamp2:](v25, "setMinTimestamp2:", v22);
    -[TwoSampleTestResult setMaxTimestamp2:](v25, "setMaxTimestamp2:", v23);
  }

  return v25;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v23;
  void *v24;
  __CFString *v25;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TwoSampleTestResult testStatistic](self, "testStatistic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f"), v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TwoSampleTestResult testStatistic](self, "testStatistic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

    v6 = CFSTR("(null)");
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[TwoSampleTestResult rejectNullHypothesis](self, "rejectNullHypothesis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v9, "BOOLValue"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TwoSampleTestResult rejectNullHypothesis](self, "rejectNullHypothesis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v6;
  if (!v11)
  {

    v10 = CFSTR("(null)");
  }
  v24 = (void *)MEMORY[0x24BDD17C8];
  v23 = -[TwoSampleTestResult testRan](self, "testRan");
  -[TwoSampleTestResult testSkippedReason](self, "testSkippedReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TwoSampleTestResult sampleSize1](self, "sampleSize1");
  v14 = -[TwoSampleTestResult numSuccesses1](self, "numSuccesses1");
  -[TwoSampleTestResult minTimestamp1](self, "minTimestamp1");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TwoSampleTestResult maxTimestamp1](self, "maxTimestamp1");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TwoSampleTestResult sampleSize2](self, "sampleSize2");
  v18 = -[TwoSampleTestResult numSuccesses2](self, "numSuccesses2");
  -[TwoSampleTestResult minTimestamp2](self, "minTimestamp2");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TwoSampleTestResult maxTimestamp2](self, "maxTimestamp2");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("TwoSampleTestResult:\n testRan=%d\n testSkippedReason=%@\n testStatistic=%@\n rejectNullHypothesis=%@\n sampleSize1=%ld\n numSuccesses1=%ld\n minTimestamp1=%@\n maxTimestamp1=%@\n sampleSize2=%ld\n numSuccesses2=%ld\n minTimestamp2=%@\n maxTimestamp2=%@\n"), v23, v12, v25, v10, v13, v14, v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)testRan
{
  return self->_testRan;
}

- (void)setTestRan:(BOOL)a3
{
  self->_testRan = a3;
}

- (NSString)testSkippedReason
{
  return self->_testSkippedReason;
}

- (void)setTestSkippedReason:(id)a3
{
  objc_storeStrong((id *)&self->_testSkippedReason, a3);
}

- (NSNumber)testStatistic
{
  return self->_testStatistic;
}

- (void)setTestStatistic:(id)a3
{
  objc_storeStrong((id *)&self->_testStatistic, a3);
}

- (NSNumber)rejectNullHypothesis
{
  return self->_rejectNullHypothesis;
}

- (void)setRejectNullHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->_rejectNullHypothesis, a3);
}

- (int64_t)sampleSize1
{
  return self->_sampleSize1;
}

- (void)setSampleSize1:(int64_t)a3
{
  self->_sampleSize1 = a3;
}

- (int64_t)numSuccesses1
{
  return self->_numSuccesses1;
}

- (void)setNumSuccesses1:(int64_t)a3
{
  self->_numSuccesses1 = a3;
}

- (NSDate)minTimestamp1
{
  return self->_minTimestamp1;
}

- (void)setMinTimestamp1:(id)a3
{
  objc_storeStrong((id *)&self->_minTimestamp1, a3);
}

- (NSDate)maxTimestamp1
{
  return self->_maxTimestamp1;
}

- (void)setMaxTimestamp1:(id)a3
{
  objc_storeStrong((id *)&self->_maxTimestamp1, a3);
}

- (int64_t)sampleSize2
{
  return self->_sampleSize2;
}

- (void)setSampleSize2:(int64_t)a3
{
  self->_sampleSize2 = a3;
}

- (int64_t)numSuccesses2
{
  return self->_numSuccesses2;
}

- (void)setNumSuccesses2:(int64_t)a3
{
  self->_numSuccesses2 = a3;
}

- (NSDate)minTimestamp2
{
  return self->_minTimestamp2;
}

- (void)setMinTimestamp2:(id)a3
{
  objc_storeStrong((id *)&self->_minTimestamp2, a3);
}

- (NSDate)maxTimestamp2
{
  return self->_maxTimestamp2;
}

- (void)setMaxTimestamp2:(id)a3
{
  objc_storeStrong((id *)&self->_maxTimestamp2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTimestamp2, 0);
  objc_storeStrong((id *)&self->_minTimestamp2, 0);
  objc_storeStrong((id *)&self->_maxTimestamp1, 0);
  objc_storeStrong((id *)&self->_minTimestamp1, 0);
  objc_storeStrong((id *)&self->_rejectNullHypothesis, 0);
  objc_storeStrong((id *)&self->_testStatistic, 0);
  objc_storeStrong((id *)&self->_testSkippedReason, 0);
}

@end
