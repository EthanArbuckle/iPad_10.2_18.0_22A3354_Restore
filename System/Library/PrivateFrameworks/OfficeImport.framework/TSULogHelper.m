@implementation TSULogHelper

+ (id)sharedInstance
{
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, &__block_literal_global_34);
  return (id)sharedInstance__instance;
}

void __30__TSULogHelper_sharedInstance__block_invoke()
{
  TSULogHelper *v0;
  void *v1;

  v0 = objc_alloc_init(TSULogHelper);
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

}

- (BOOL)incrementThrottleCountAndCheckThottleMax:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  void *v11;

  v5 = -[TSULogHelper throttleCount](self, "throttleCount");
  -[TSULogHelper setThrottleCount:](self, "setThrottleCount:", -[TSULogHelper throttleCount](self, "throttleCount") + 1);
  -[TSULogHelper lastThrottleCheck](self, "lastThrottleCheck");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == a3 && TSUPerformanceCat_init_token != -1)
    dispatch_once(&TSUPerformanceCat_init_token, &__block_literal_global_58);
  if (v5 < a3 || !v6)
    goto LABEL_12;
  objc_msgSend(v6, "timeIntervalSinceNow");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v9 < -300.0)
  {
    if (TSUPerformanceCat_init_token != -1)
      dispatch_once(&TSUPerformanceCat_init_token, &__block_literal_global_60_0);
    -[TSULogHelper setThrottleCount:](self, "setThrottleCount:", 0);
  }
  if (v8 >= -60.0)
  {
    v10 = 1;
  }
  else
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSULogHelper setLastThrottleCheck:](self, "setLastThrottleCheck:", v11);

    v10 = 0;
  }

  return v10;
}

void __57__TSULogHelper_incrementThrottleCountAndCheckThottleMax___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUPerformanceCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUPerformanceCat_log_t;
  TSUPerformanceCat_log_t = v0;

}

void __57__TSULogHelper_incrementThrottleCountAndCheckThottleMax___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUPerformanceCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUPerformanceCat_log_t;
  TSUPerformanceCat_log_t = v0;

}

- (unint64_t)throttleCount
{
  return self->_throttleCount;
}

- (void)setThrottleCount:(unint64_t)a3
{
  self->_throttleCount = a3;
}

- (NSDate)lastThrottleCheck
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastThrottleCheck:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastThrottleCheck, 0);
}

@end
