@implementation OITSUProgressContext

- (void)reset
{
  objc_sync_enter(self);

  self->m_currentStage = (OITSUProgressStage *)-[OITSUProgressStage initRootStageInContext:]([OITSUProgressStage alloc], "initRootStageInContext:", self);
  self->m_lastProgressReport = 0.0;
  self->m_lastOverallProgress = 0.0;
  objc_sync_exit(self);
}

- (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", a3, a4, CFSTR("TSUProgressNotification"), self);
}

- (id)addProgressObserverBlock:(id)a3
{
  void *v5;
  _QWORD v7[5];

  v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__OITSUProgressContext_addProgressObserverBlock___block_invoke;
  v7[3] = &unk_24F39AC48;
  v7[4] = a3;
  return (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("TSUProgressNotification"), self, 0, v7);
}

void *__49__OITSUProgressContext_addProgressObserverBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *result;
  uint64_t v6;

  v4 = objc_opt_class();
  result = (void *)TSUDynamicCast(v4, objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("TSUProgressOverallProgress")));
  if (result)
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(result, "doubleValue");
    return (void *)(*(uint64_t (**)(uint64_t))(v6 + 16))(v6);
  }
  return result;
}

- (void)removeProgressObserver:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", a3, CFSTR("TSUProgressNotification"), self);
}

- (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
  double v6;
  OITSUProgressStage *m_currentStage;

  if (a3 >= 0.0)
    v6 = a3;
  else
    v6 = 1.0;
  if (a4 <= 0.0 && TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_10);
  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  self->m_currentStage = -[OITSUProgressStage initWithSteps:takingSteps:inContext:]([OITSUProgressStage alloc], "initWithSteps:takingSteps:inContext:", self, v6, a4);

  objc_sync_exit(self);
}

os_log_t __57__OITSUProgressContext_createStageWithSteps_takingSteps___block_invoke()
{
  os_log_t result;

  result = TSULogCreateCategory("TSUDefaultCat");
  TSUDefaultCat_log_t = (uint64_t)result;
  return result;
}

- (void)createStageWithSteps:(double)a3
{
  OITSUProgressStage *m_currentStage;
  double v6;
  double v7;

  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  if (m_currentStage)
  {
    -[OITSUProgressStage nextSubStageParentSize](self->m_currentStage, "nextSubStageParentSize");
    v7 = v6;
    -[OITSUProgressStage setNextSubStageParentSize:](m_currentStage, "setNextSubStageParentSize:", 1.0);
  }
  else
  {
    v7 = 1.0;
  }
  objc_sync_exit(self);
  -[OITSUProgressContext createStageWithSteps:takingSteps:](self, "createStageWithSteps:takingSteps:", a3, v7);
}

- (void)nextSubStageWillTakeThisManyOfMySteps:(double)a3
{
  OITSUProgressStage *m_currentStage;

  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  if (m_currentStage)
    -[OITSUProgressStage setNextSubStageParentSize:](m_currentStage, "setNextSubStageParentSize:", a3);
  objc_sync_exit(self);
}

- (void)endStage
{
  OITSUProgressStage *m_currentStage;

  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  -[OITSUProgressStage end](m_currentStage, "end");
  self->m_currentStage = (OITSUProgressStage *)-[OITSUProgressStage parentStage](m_currentStage, "parentStage");

  objc_sync_exit(self);
}

- (void)advanceProgress:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[OITSUProgressContext currentStage](self, "currentStage"), "advanceProgress:", a3);
  objc_sync_exit(self);
}

- (void)setProgress:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[OITSUProgressContext currentStage](self, "currentStage"), "setProgress:", a3);
  objc_sync_exit(self);
}

- (void)setPercentageProgressFromTCProgressContext:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[OITSUProgressContext currentStage](self, "currentStage"), "setProgressPercentage:", a3);
  objc_sync_exit(self);
}

- (void)setMessage:(id)a3
{
  uint64_t v4;

  if (!a3)
    a3 = &stru_24F3BFFF8;
  v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, CFSTR("TSUProgressMessage"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSUProgressNotification"), self, v4);
}

- (double)currentPosition
{
  id v3;
  double v4;
  double m_lastProgressReport;

  objc_sync_enter(self);
  v3 = -[OITSUProgressContext currentStage](self, "currentStage");
  if (v3)
  {
    objc_msgSend(v3, "currentPosition");
    m_lastProgressReport = v4;
  }
  else
  {
    m_lastProgressReport = self->m_lastProgressReport;
  }
  objc_sync_exit(self);
  return m_lastProgressReport;
}

- (double)overallProgress
{
  id v3;
  double v4;
  double m_lastOverallProgress;

  objc_sync_enter(self);
  v3 = -[OITSUProgressContext currentStage](self, "currentStage");
  if (v3)
  {
    objc_msgSend(v3, "overallProgress");
    m_lastOverallProgress = v4;
  }
  else
  {
    m_lastOverallProgress = self->m_lastOverallProgress;
  }
  objc_sync_exit(self);
  return m_lastOverallProgress;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD16A8];
  -[OITSUProgressContext currentPosition](self, "currentPosition");
  v5 = v4;
  -[OITSUProgressContext overallProgress](self, "overallProgress");
  v7 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("TSUProgressContext %p: currentPosition = %g, overallProgress = %g"), self, v5, v6);
  v8 = -[OITSUProgressContext currentStage](self, "currentStage");
  objc_msgSend(v7, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\ncurrentStage: %@"), v8));
  v9 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v10 = objc_msgSend(v8, "parentStage");
  if (v10)
  {
    v11 = (void *)v10;
    do
    {
      objc_msgSend(v9, "appendString:", CFSTR("    "));
      objc_msgSend(v7, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@parent: %@"), v9, v11));
      v11 = (void *)objc_msgSend(v11, "parentStage");
    }
    while (v11);
  }
  return v7;
}

- (OITSUProgressContext)init
{
  OITSUProgressContext *v2;
  OITSUProgressContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUProgressContext;
  v2 = -[OITSUProgressContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[OITSUProgressContext reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->m_currentStage = 0;
  self->m_lastReportTime = 0;
  v3.receiver = self;
  v3.super_class = (Class)OITSUProgressContext;
  -[OITSUProgressContext dealloc](&v3, sel_dealloc);
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (void)reportProgress:(double)a3 overallProgress:(double)a4
{
  NSDate *m_lastReportTime;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_sync_enter(self);
  self->m_lastOverallProgress = a4;
  m_lastReportTime = self->m_lastReportTime;
  if (!m_lastReportTime
    || (-[NSDate timeIntervalSinceNow](m_lastReportTime, "timeIntervalSinceNow"), a3 >= 100.0)
    || v8 < -0.1
    || a3 - self->m_lastProgressReport >= 5.0)
  {
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v11 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v9, CFSTR("TSUProgressCurrentPosition"), v10, CFSTR("TSUProgressOverallProgress"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSUProgressNotification"), self, v11);

    self->m_lastReportTime = (NSDate *)(id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    self->m_lastProgressReport = a3;
  }
  objc_sync_exit(self);
}

@end
