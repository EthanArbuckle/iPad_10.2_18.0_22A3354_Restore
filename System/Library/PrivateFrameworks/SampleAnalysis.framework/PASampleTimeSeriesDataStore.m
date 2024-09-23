@implementation PASampleTimeSeriesDataStore

- (PASampleTimeSeriesDataStore)initWithSampleStore:(id)a3
{
  id v5;
  PASampleTimeSeriesDataStore *v6;
  PASampleTimeSeriesDataStore *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PASampleTimeSeriesDataStore;
  v6 = -[PASampleTimeSeriesDataStore init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sampleStore, a3);

  return v7;
}

- (SASampleStore)sampleStore
{
  return (SASampleStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSampleStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleStore, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  -[SASampleStore encodeWithCoder:](self->_sampleStore, "encodeWithCoder:", a3);
}

- (PASampleTimeSeriesDataStore)initWithCoder:(id)a3
{
  id v4;
  PASampleTimeSeriesDataStore *v5;
  SASampleStore *v6;
  SASampleStore *sampleStore;
  PASampleTimeSeriesDataStore *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PASampleTimeSeriesDataStore;
  v5 = -[PASampleTimeSeriesDataStore init](&v10, sel_init);
  if (v5)
  {
    v6 = -[SASampleStore initWithCoder:]([SASampleStore alloc], "initWithCoder:", v4);
    if (!v6)
    {
      v8 = 0;
      goto LABEL_6;
    }
    sampleStore = v5->_sampleStore;
    v5->_sampleStore = v6;

  }
  v8 = v5;
LABEL_6:

  return v8;
}

@end
