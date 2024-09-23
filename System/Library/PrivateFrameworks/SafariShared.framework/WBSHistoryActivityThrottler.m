@implementation WBSHistoryActivityThrottler

- (WBSHistoryActivityThrottler)initWithLimitPerSecond:(unint64_t)a3
{
  WBSHistoryActivityThrottler *v4;
  WBSHistoryActivityThrottler *v5;
  uint64_t v6;
  NSMutableArray *activityTimes;
  WBSHistoryActivityThrottler *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryActivityThrottler;
  v4 = -[WBSHistoryActivityThrottler init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_activityLimitPerSecond = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    activityTimes = v5->_activityTimes;
    v5->_activityTimes = (NSMutableArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)shouldRecordHistoryVisitAtTime:(double)a3
{
  unint64_t v5;
  NSMutableArray *activityTimes;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v5 = -[NSMutableArray count](self->_activityTimes, "count");
  activityTimes = self->_activityTimes;
  if (v5 < self->_activityLimitPerSecond)
    goto LABEL_4;
  -[NSMutableArray firstObject](self->_activityTimes, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (a3 - v9 >= 1.0)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_activityTimes, "removeObjectAtIndex:", 0, a3 - v9);
    activityTimes = self->_activityTimes;
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](activityTimes, "addObject:", v10);

    return 1;
  }
  return 0;
}

- (unint64_t)activityLimitPerSecond
{
  return self->_activityLimitPerSecond;
}

- (void)setActivityLimitPerSecond:(unint64_t)a3
{
  self->_activityLimitPerSecond = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTimes, 0);
}

@end
