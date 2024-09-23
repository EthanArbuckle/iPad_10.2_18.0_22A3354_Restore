@implementation BKPaginationAbortJob

+ (id)jobName
{
  return CFSTR("Abort-Previous");
}

- (BKPaginationAbortJob)init
{
  BKPaginationAbortJob *v2;
  BKPaginationAbortJob *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKPaginationAbortJob;
  v2 = -[BKJob init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[BKJob setSentinel:](v2, "setSentinel:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKPaginationAbortJob jobName](BKPaginationAbortJob, "jobName"));
    -[BKJob setName:](v3, "setName:", v4);

  }
  return v3;
}

@end
