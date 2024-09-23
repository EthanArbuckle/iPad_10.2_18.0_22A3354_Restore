@implementation WBSCyclerIterationCounter

- (WBSCyclerIterationCounter)init
{
  WBSCyclerIterationCounter *v2;
  WBSCyclerIterationCounter *v3;
  WBSCyclerIterationCounter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBSCyclerIterationCounter;
  v2 = -[WBSCyclerIterationCounter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_iterationCount = 0;
    v2->_maximumIterationCount = 0;
    v4 = v2;
  }

  return v3;
}

- (WBSCyclerIterationCounter)initWithMaximumIterationCount:(unint64_t)a3
{
  WBSCyclerIterationCounter *v4;
  WBSCyclerIterationCounter *v5;
  WBSCyclerIterationCounter *v6;

  v4 = -[WBSCyclerIterationCounter init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_maximumIterationCount = a3;
    v6 = v4;
  }

  return v5;
}

- (void)incrementIterationCount
{
  ++self->_iterationCount;
}

- (BOOL)hasReachedMaximumIterationCount
{
  unint64_t maximumIterationCount;

  maximumIterationCount = self->_maximumIterationCount;
  return maximumIterationCount && self->_iterationCount >= maximumIterationCount;
}

- (unint64_t)iterationCount
{
  return self->_iterationCount;
}

- (unint64_t)maximumIterationCount
{
  return self->_maximumIterationCount;
}

@end
