@implementation PXStoryProducerMonitor

- (PXStoryProducerMonitor)init
{
  return -[PXStoryProducerMonitor initWithStoryQueue:](self, "initWithStoryQueue:", 0);
}

- (PXStoryProducerMonitor)initWithStoryQueue:(id)a3
{
  id v4;
  PXStoryProducerMonitor *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *storyQueue;
  OS_dispatch_queue *v8;
  id v9;
  double v10;
  uint64_t v11;
  PXUpdater *updater;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryProducerMonitor;
  v5 = -[PXStoryProducerMonitor init](&v14, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (OS_dispatch_queue *)v4;
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v6;
    }
    else
    {
      v8 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      storyQueue = v5->_storyQueue;
      v5->_storyQueue = v8;
    }

    -[PXStoryProducerMonitor currentTime](v5, "currentTime");
    v5->_startTime = v10;
    v11 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v5, sel__setNeedsUpdate);
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v11;

    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateIsLikelyToKeepUp);
  }

  return v5;
}

- (void)performChanges:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[PXStoryProducerMonitor storyQueue](self, "storyQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)PXStoryProducerMonitor;
  -[PXStoryProducerMonitor performChanges:](&v6, sel_performChanges_, v4);

}

- (void)setLastFractionCompleted:(float)a3
{
  if (self->_lastFractionCompleted != a3)
  {
    self->_lastFractionCompleted = a3;
    -[PXStoryProducerMonitor _invalidateIsLikelyToKeepUp](self, "_invalidateIsLikelyToKeepUp");
  }
}

- (void)setStartTime:(double)a3
{
  if (self->_startTime != a3)
  {
    self->_startTime = a3;
    -[PXStoryProducerMonitor _invalidateIsLikelyToKeepUp](self, "_invalidateIsLikelyToKeepUp");
  }
}

- (void)setLastTime:(double)a3
{
  if (self->_lastTime != a3)
  {
    self->_lastTime = a3;
    -[PXStoryProducerMonitor _invalidateIsLikelyToKeepUp](self, "_invalidateIsLikelyToKeepUp");
  }
}

- (void)setIsLikelyToKeepUp:(BOOL)a3
{
  if (self->_isLikelyToKeepUp != a3)
  {
    self->_isLikelyToKeepUp = a3;
    -[PXStoryProducerMonitor signalChange:](self, "signalChange:", 1);
  }
}

- (double)currentTime
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[PXStoryProducerMonitor currentDateForTesting](PXStoryProducerMonitor, "currentDateForTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v5 = v4;

  return v5;
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryProducerMonitor;
  -[PXStoryProducerMonitor didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryProducerMonitor updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setEstimatedFractionCompletedPlaybackSpeed:(float)a3
{
  if (self->_estimatedFractionCompletedPlaybackSpeed != a3)
  {
    self->_estimatedFractionCompletedPlaybackSpeed = a3;
    -[PXStoryProducerMonitor _invalidateIsLikelyToKeepUp](self, "_invalidateIsLikelyToKeepUp");
  }
}

- (void)producerDidProduceResult:(id)a3
{
  double v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isDegraded") & 1) != 0)
  {
    objc_msgSend(v6, "fractionCompleted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    -[PXStoryProducerMonitor setLastFractionCompleted:](self, "setLastFractionCompleted:");

  }
  else
  {
    LODWORD(v4) = 1.0;
    -[PXStoryProducerMonitor setLastFractionCompleted:](self, "setLastFractionCompleted:", v4);
  }
  -[PXStoryProducerMonitor currentTime](self, "currentTime");
  -[PXStoryProducerMonitor setLastTime:](self, "setLastTime:");

}

- (void)reset
{
  double v3;
  double v4;

  -[PXStoryProducerMonitor currentTime](self, "currentTime");
  -[PXStoryProducerMonitor setStartTime:](self, "setStartTime:");
  LODWORD(v3) = 0;
  -[PXStoryProducerMonitor setLastFractionCompleted:](self, "setLastFractionCompleted:", v3);
  LODWORD(v4) = 0;
  -[PXStoryProducerMonitor setEstimatedFractionCompletedPlaybackSpeed:](self, "setEstimatedFractionCompletedPlaybackSpeed:", v4);
}

- (void)_setNeedsUpdate
{
  -[PXStoryProducerMonitor signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateIsLikelyToKeepUp
{
  id v2;

  -[PXStoryProducerMonitor updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsLikelyToKeepUp);

}

- (void)_updateIsLikelyToKeepUp
{
  double v3;
  double v4;
  double v5;
  double v6;
  float v7;
  float v8;
  double v9;
  float v10;
  _BOOL8 v11;

  -[PXStoryProducerMonitor startTime](self, "startTime");
  v4 = v3;
  -[PXStoryProducerMonitor lastTime](self, "lastTime");
  if (v5 > v4)
  {
    v6 = v5;
    -[PXStoryProducerMonitor lastFractionCompleted](self, "lastFractionCompleted");
    v8 = v7;
    v9 = v7 / (v6 - v4);
    -[PXStoryProducerMonitor estimatedFractionCompletedPlaybackSpeed](self, "estimatedFractionCompletedPlaybackSpeed");
    v11 = v8 >= 1.0 || v9 > v10;
    -[PXStoryProducerMonitor setIsLikelyToKeepUp:](self, "setIsLikelyToKeepUp:", v11);
  }
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (float)estimatedFractionCompletedPlaybackSpeed
{
  return self->_estimatedFractionCompletedPlaybackSpeed;
}

- (BOOL)isLikelyToKeepUp
{
  return self->_isLikelyToKeepUp;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)lastTime
{
  return self->_lastTime;
}

- (float)lastFractionCompleted
{
  return self->_lastFractionCompleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

+ (NSDate)currentDateForTesting
{
  return (NSDate *)(id)_currentDateForTesting;
}

+ (void)setCurrentDateForTesting:(id)a3
{
  objc_storeStrong((id *)&_currentDateForTesting, a3);
}

@end
