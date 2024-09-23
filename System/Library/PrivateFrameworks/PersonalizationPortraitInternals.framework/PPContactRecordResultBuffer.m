@implementation PPContactRecordResultBuffer

- (PPContactRecordResultBuffer)init
{
  PPContactRecordResultBuffer *v2;
  uint64_t v3;
  NSMutableArray *records;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPContactRecordResultBuffer;
  v2 = -[PPContactRecordResultBuffer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    records = v2->_records;
    v2->_records = (NSMutableArray *)v3;

    v2->_loadingComplete = 0;
  }
  return v2;
}

- (NSMutableArray)records
{
  return self->_records;
}

- (BOOL)loadingComplete
{
  return self->_loadingComplete;
}

- (void)setLoadingComplete:(BOOL)a3
{
  self->_loadingComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
}

@end
