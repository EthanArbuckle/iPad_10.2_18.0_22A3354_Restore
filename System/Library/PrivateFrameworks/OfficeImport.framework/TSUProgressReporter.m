@implementation TSUProgressReporter

- (TSUProgressReporter)initWithTotalUnitCount:(int64_t)a3
{
  TSUProgressReporter *v4;
  uint64_t v5;
  NSProgress *progress;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSUProgressReporter;
  v4 = -[TSUProgressReporter init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
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
