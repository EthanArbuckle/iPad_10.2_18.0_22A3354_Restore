@implementation CRLProgressReporter

- (CRLProgressReporter)initWithTotalUnitCount:(int64_t)a3
{
  CRLProgressReporter *v4;
  uint64_t v5;
  NSProgress *progress;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLProgressReporter;
  v4 = -[CRLProgressReporter init](&v8, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", a3));
    progress = v4->_progress;
    v4->_progress = (NSProgress *)v5;

  }
  return v4;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

@end
