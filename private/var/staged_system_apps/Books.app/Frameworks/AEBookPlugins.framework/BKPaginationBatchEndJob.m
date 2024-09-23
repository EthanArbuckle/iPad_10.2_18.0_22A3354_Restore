@implementation BKPaginationBatchEndJob

+ (id)jobName
{
  return CFSTR("Batch-End");
}

- (BKPaginationBatchEndJob)init
{
  BKPaginationBatchEndJob *v2;
  BKPaginationBatchEndJob *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPaginationBatchEndJob;
  v2 = -[BKJob init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[BKJob setSentinel:](v2, "setSentinel:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationBatchEndJob jobName](BKPaginationBatchEndJob, "jobName"));
    -[BKJob setName:](v3, "setName:", v4);

  }
  return v3;
}

@end
