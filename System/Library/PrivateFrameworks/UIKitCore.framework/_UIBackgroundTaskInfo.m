@implementation _UIBackgroundTaskInfo

- (void)dealloc
{
  objc_super v3;

  -[_UIBackgroundTaskInfo invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIBackgroundTaskInfo;
  -[_UIBackgroundTaskInfo dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  BKSProcessAssertion *processAssertion;

  processAssertion = self->_processAssertion;
  if (processAssertion)
  {
    self->_processAssertion = 0;

  }
}

+ (id)backgroundTaskAssertionQueue
{
  if (qword_1ECD7DE78 != -1)
    dispatch_once(&qword_1ECD7DE78, &__block_literal_global_249);
  return (id)qword_1ECD7DE80;
}

- (id)description
{
  __darwin_time_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  timespec __tp;

  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &__tp);
  v3 = __tp.tv_sec - self->_creationTime;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UIBackgroundTaskInfo;
  -[_UIBackgroundTaskInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: taskID = %lu, taskName = %@, creationTime = %lu (elapsed = %lu)"), v5, self->_taskId, self->_taskName, self->_creationTime, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (_UIBackgroundTaskInfo)initWithProcessAssertion:(id)a3 taskName:(id)a4 expirationHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIBackgroundTaskInfo *v12;
  _UIBackgroundTaskInfo *v13;
  void *v14;
  id expireHandler;
  uint64_t v16;
  NSString *taskName;
  timespec v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)_UIBackgroundTaskInfo;
  v12 = -[_UIBackgroundTaskInfo init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_taskId = 0;
    v14 = _Block_copy(v11);
    expireHandler = v13->_expireHandler;
    v13->_expireHandler = v14;

    objc_storeStrong((id *)&v13->_processAssertion, a3);
    v16 = objc_msgSend(v10, "copy");
    taskName = v13->_taskName;
    v13->_taskName = (NSString *)v16;

    v19.tv_sec = 0;
    v19.tv_nsec = 0;
    clock_gettime(_CLOCK_UPTIME_RAW_APPROX, &v19);
    v13->_creationTime = v19.tv_sec;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong(&self->_expireHandler, 0);
}

- (void)fireExpirationHandler
{
  void (**expireHandler)(id, SEL);
  unint64_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  unint64_t v11;
  NSObject *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  expireHandler = (void (**)(id, SEL))self->_expireHandler;
  if (expireHandler && self->_processAssertion)
  {
    expireHandler[2](expireHandler, a2);
    v4 = qword_1ECD7DE88;
    if (!qword_1ECD7DE88)
    {
      v4 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v4, (unint64_t *)&qword_1ECD7DE88);
    }
    if ((*(_BYTE *)v4 & 1) != 0)
    {
      v5 = *(NSObject **)(v4 + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = self->_expireHandler;
        v7 = v5;
        v8 = _Block_copy(v6);
        -[_UIBackgroundTaskInfo description](self, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[_UIBackgroundTaskInfo fireExpirationHandler]";
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        v10 = "%s: Called expiration handler: %@ for task: %@";
LABEL_14:
        _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v14, 0x20u);

      }
    }
  }
  else
  {
    v11 = qword_1ECD7DE90;
    if (!qword_1ECD7DE90)
    {
      v11 = __UILogCategoryGetNode("BackgroundTask", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&qword_1ECD7DE90);
    }
    if ((*(_BYTE *)v11 & 1) != 0)
    {
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = self->_expireHandler;
        v7 = v12;
        v8 = _Block_copy(v13);
        -[_UIBackgroundTaskInfo description](self, "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[_UIBackgroundTaskInfo fireExpirationHandler]";
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        v10 = "%s: Did not call expiration handler: %@ for task: %@. Handler was nil, or UIKIT_SUPPORTS_ASSERTIONSERVICES is false.";
        goto LABEL_14;
      }
    }
  }
}

@end
