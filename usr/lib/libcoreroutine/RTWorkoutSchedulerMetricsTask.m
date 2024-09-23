@implementation RTWorkoutSchedulerMetricsTask

+ (id)defaultsKeyForTaskType:(unint64_t)a3
{
  if (a3 > 6)
    return CFSTR("RTDefaultsWorkoutSchedulerMetricsTaskTypeInitialClusterAndSyncKey");
  else
    return off_1E92A3FC0[a3];
}

+ (unint64_t)taskTypeForDefaultsKey:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTDefaultsWorkoutSchedulerMetricsTaskTypeInitialClusterAndSyncKey")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTDefaultsWorkoutSchedulerMetricsTaskTypeWorkoutComparisonKey")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTDefaultsWorkoutSchedulerMetricsTaskTypeWorkoutComparisonOnChargerKey")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTDefaultsWorkoutSchedulerMetricsTaskTypeClusterAndSyncKey")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RTDefaultsWorkoutSchedulerMetricsTaskTypeUpdateRelevanceScoreKey")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RTDefaultsWorkoutSchedulerMetricsTaskTypeProcessNewlyAddedWorkoutKey")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (RTWorkoutSchedulerMetricsTask)initWithTaskType:(unint64_t)a3 defaultsManager:(id)a4
{
  id v7;
  RTWorkoutSchedulerMetricsTask *v8;
  RTWorkoutSchedulerMetricsTask *v9;
  RTWorkoutSchedulerMetricsTask *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  v7 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)RTWorkoutSchedulerMetricsTask;
    v8 = -[RTWorkoutSchedulerMetricsTask init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_defaultsManager, a4);
      -[RTWorkoutSchedulerMetricsTask setTaskType:](v9, "setTaskType:", a3);
      -[RTWorkoutSchedulerMetricsTask setTaskStart:](v9, "setTaskStart:", 0);
      -[RTWorkoutSchedulerMetricsTask setTaskFinish:](v9, "setTaskFinish:", 0);
      -[RTWorkoutSchedulerMetricsTask setMemoryFootprintAtStart:](v9, "setMemoryFootprintAtStart:", -1);
      -[RTWorkoutSchedulerMetricsTask setMemoryFootprintAtFinish:](v9, "setMemoryFootprintAtFinish:", -1);
      -[RTWorkoutSchedulerMetricsTask setTaskRunDailyCount:](v9, "setTaskRunDailyCount:", -[RTWorkoutSchedulerMetricsTask taskRunDailyCountForMetricsTaskType:](v9, "taskRunDailyCountForMetricsTaskType:", a3));
      -[RTWorkoutSchedulerMetricsTask setTotalNAtStart:](v9, "setTotalNAtStart:", -1);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)resetTaskState
{
  void *v3;
  void *v4;
  void *v5;

  -[RTWorkoutSchedulerMetricsTask setTaskStart:](self, "setTaskStart:", 0);
  -[RTWorkoutSchedulerMetricsTask setTaskFinish:](self, "setTaskFinish:", 0);
  -[RTWorkoutSchedulerMetricsTask setMemoryFootprintAtStart:](self, "setMemoryFootprintAtStart:", -1);
  -[RTWorkoutSchedulerMetricsTask setMemoryFootprintAtFinish:](self, "setMemoryFootprintAtFinish:", -1);
  -[RTWorkoutSchedulerMetricsTask defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTWorkoutSchedulerMetricsTask taskRunDailyCount](self, "taskRunDailyCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTWorkoutSchedulerMetricsTask defaultsKeyForTaskType:](RTWorkoutSchedulerMetricsTask, "defaultsKeyForTaskType:", -[RTWorkoutSchedulerMetricsTask taskType](self, "taskType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v5);

  -[RTWorkoutSchedulerMetricsTask setTotalNAtStart:](self, "setTotalNAtStart:", -1);
}

- (unint64_t)taskRunDailyCountForMetricsTaskType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  +[RTWorkoutSchedulerMetricsTask defaultsKeyForTaskType:](RTWorkoutSchedulerMetricsTask, "defaultsKeyForTaskType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWorkoutSchedulerMetricsTask defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (unint64_t)memoryFootprintAtStart
{
  return self->_memoryFootprintAtStart;
}

- (void)setMemoryFootprintAtStart:(unint64_t)a3
{
  self->_memoryFootprintAtStart = a3;
}

- (unint64_t)memoryFootprintAtFinish
{
  return self->_memoryFootprintAtFinish;
}

- (void)setMemoryFootprintAtFinish:(unint64_t)a3
{
  self->_memoryFootprintAtFinish = a3;
}

- (unint64_t)currentNAtFinish
{
  return self->_currentNAtFinish;
}

- (void)setCurrentNAtFinish:(unint64_t)a3
{
  self->_currentNAtFinish = a3;
}

- (unint64_t)currentNAtStart
{
  return self->_currentNAtStart;
}

- (void)setCurrentNAtStart:(unint64_t)a3
{
  self->_currentNAtStart = a3;
}

- (NSDate)taskStart
{
  return self->_taskStart;
}

- (void)setTaskStart:(id)a3
{
  objc_storeStrong((id *)&self->_taskStart, a3);
}

- (NSDate)taskFinish
{
  return self->_taskFinish;
}

- (void)setTaskFinish:(id)a3
{
  objc_storeStrong((id *)&self->_taskFinish, a3);
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (void)setTaskType:(unint64_t)a3
{
  self->_taskType = a3;
}

- (unint64_t)taskRunDailyCount
{
  return self->_taskRunDailyCount;
}

- (void)setTaskRunDailyCount:(unint64_t)a3
{
  self->_taskRunDailyCount = a3;
}

- (int64_t)totalNAtStart
{
  return self->_totalNAtStart;
}

- (void)setTotalNAtStart:(int64_t)a3
{
  self->_totalNAtStart = a3;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_taskFinish, 0);
  objc_storeStrong((id *)&self->_taskStart, 0);
}

@end
