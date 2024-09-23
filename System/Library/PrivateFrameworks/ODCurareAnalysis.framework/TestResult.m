@implementation TestResult

- (TestResult)initWithTestRan:(BOOL)a3 testSkippedReason:(id)a4 pValue:(id)a5 rejectNullHypothesis:(id)a6 sampleSize:(int64_t)a7 numSuccesses:(int64_t)a8 minTimestamp:(id)a9 maxTimestamp:(id)a10
{
  _BOOL8 v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TestResult *v21;
  TestResult *v22;
  objc_super v24;

  v14 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = a10;
  v24.receiver = self;
  v24.super_class = (Class)TestResult;
  v21 = -[TestResult init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    -[TestResult setTestRan:](v21, "setTestRan:", v14);
    -[TestResult setTestSkippedReason:](v22, "setTestSkippedReason:", v16);
    -[TestResult setPValue:](v22, "setPValue:", v17);
    -[TestResult setRejectNullHypothesis:](v22, "setRejectNullHypothesis:", v18);
    -[TestResult setSampleSize:](v22, "setSampleSize:", a7);
    -[TestResult setNumSuccesses:](v22, "setNumSuccesses:", a8);
    -[TestResult setMinTimestamp:](v22, "setMinTimestamp:", v19);
    -[TestResult setMaxTimestamp:](v22, "setMaxTimestamp:", v20);
  }

  return v22;
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
  _BOOL4 v13;
  void *v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TestResult pValue](self, "pValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%f"), v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TestResult pValue](self, "pValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

    v6 = CFSTR("(null)");
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[TestResult rejectNullHypothesis](self, "rejectNullHypothesis");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v9, "BOOLValue"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[TestResult rejectNullHypothesis](self, "rejectNullHypothesis");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {

    v10 = CFSTR("(null)");
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = -[TestResult testRan](self, "testRan");
  -[TestResult testSkippedReason](self, "testSkippedReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[TestResult sampleSize](self, "sampleSize");
  v16 = -[TestResult numSuccesses](self, "numSuccesses");
  -[TestResult minTimestamp](self, "minTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TestResult maxTimestamp](self, "maxTimestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("TestResult:\n testRan=%d\n testSkippedReason=%@\n pValue=%@\n rejectNullHypothesis=%@\n sampleSize=%ld\n numSuccesses=%ld\n minTimestamp=%@\n maxTimestamp=%@"), v13, v14, v6, v10, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
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

- (NSNumber)pValue
{
  return self->_pValue;
}

- (void)setPValue:(id)a3
{
  objc_storeStrong((id *)&self->_pValue, a3);
}

- (NSNumber)rejectNullHypothesis
{
  return self->_rejectNullHypothesis;
}

- (void)setRejectNullHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->_rejectNullHypothesis, a3);
}

- (int64_t)sampleSize
{
  return self->_sampleSize;
}

- (void)setSampleSize:(int64_t)a3
{
  self->_sampleSize = a3;
}

- (int64_t)numSuccesses
{
  return self->_numSuccesses;
}

- (void)setNumSuccesses:(int64_t)a3
{
  self->_numSuccesses = a3;
}

- (NSDate)minTimestamp
{
  return self->_minTimestamp;
}

- (void)setMinTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_minTimestamp, a3);
}

- (NSDate)maxTimestamp
{
  return self->_maxTimestamp;
}

- (void)setMaxTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_maxTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTimestamp, 0);
  objc_storeStrong((id *)&self->_minTimestamp, 0);
  objc_storeStrong((id *)&self->_rejectNullHypothesis, 0);
  objc_storeStrong((id *)&self->_pValue, 0);
  objc_storeStrong((id *)&self->_testSkippedReason, 0);
}

@end
