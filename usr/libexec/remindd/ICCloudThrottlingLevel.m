@implementation ICCloudThrottlingLevel

- (ICCloudThrottlingLevel)initWithBatchInterval:(double)a3 numberOfBatches:(unint64_t)a4
{
  ICCloudThrottlingLevel *v6;
  ICCloudThrottlingLevel *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICCloudThrottlingLevel;
  v6 = -[ICCloudThrottlingLevel init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    -[ICCloudThrottlingLevel setBatchInterval:](v6, "setBatchInterval:", a3);
    -[ICCloudThrottlingLevel setNumberOfBatches:](v7, "setNumberOfBatches:", a4);
  }
  return v7;
}

- (id)description
{
  double v3;

  -[ICCloudThrottlingLevel batchInterval](self, "batchInterval");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<batchInterval=%d numberOfBatches=%d>"), (int)v3, -[ICCloudThrottlingLevel numberOfBatches](self, "numberOfBatches"));
}

- (double)batchInterval
{
  return self->_batchInterval;
}

- (void)setBatchInterval:(double)a3
{
  self->_batchInterval = a3;
}

- (unint64_t)numberOfBatches
{
  return self->_numberOfBatches;
}

- (void)setNumberOfBatches:(unint64_t)a3
{
  self->_numberOfBatches = a3;
}

@end
