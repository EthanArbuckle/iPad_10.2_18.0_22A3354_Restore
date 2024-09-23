@implementation TSUProgressContext

- (void)reset
{
  objc_sync_enter(self);

  self->m_currentStage = (TSUProgressStage *)-[TSUProgressStage initRootStageInContext:]([TSUProgressStage alloc], "initRootStageInContext:", self);
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
  v7[2] = __47__TSUProgressContext_addProgressObserverBlock___block_invoke;
  v7[3] = &unk_24D61B048;
  v7[4] = a3;
  return (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("TSUProgressNotification"), self, 0, v7);
}

void *__47__TSUProgressContext_addProgressObserverBlock___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v10;
  TSUProgressStage *m_currentStage;

  if (a3 >= 0.0)
    v10 = a3;
  else
    v10 = 1.0;
  if (a4 <= 0.0)
    TSULogErrorInFunction((uint64_t)"-[TSUProgressContext createStageWithSteps:takingSteps:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUProgressContext.m", 139, (uint64_t)CFSTR("createStageWithSteps: taking steps not a positive number: %g"), v4, v5, v6, v7, *(uint64_t *)&a4);
  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  self->m_currentStage = -[TSUProgressStage initWithSteps:takingSteps:inContext:]([TSUProgressStage alloc], "initWithSteps:takingSteps:inContext:", self, v10, a4);

  objc_sync_exit(self);
}

- (void)createStageWithSteps:(double)a3
{
  TSUProgressStage *m_currentStage;
  double v6;
  double v7;

  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  if (m_currentStage)
  {
    -[TSUProgressStage nextSubStageParentSize](self->m_currentStage, "nextSubStageParentSize");
    v7 = v6;
    -[TSUProgressStage setNextSubStageParentSize:](m_currentStage, "setNextSubStageParentSize:", 1.0);
  }
  else
  {
    v7 = 1.0;
  }
  objc_sync_exit(self);
  -[TSUProgressContext createStageWithSteps:takingSteps:](self, "createStageWithSteps:takingSteps:", a3, v7);
}

- (void)nextSubStageWillTakeThisManyOfMySteps:(double)a3
{
  TSUProgressStage *m_currentStage;

  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  if (m_currentStage)
    -[TSUProgressStage setNextSubStageParentSize:](m_currentStage, "setNextSubStageParentSize:", a3);
  objc_sync_exit(self);
}

- (void)endStage
{
  TSUProgressStage *m_currentStage;

  objc_sync_enter(self);
  m_currentStage = self->m_currentStage;
  -[TSUProgressStage end](m_currentStage, "end");
  self->m_currentStage = (TSUProgressStage *)-[TSUProgressStage parentStage](m_currentStage, "parentStage");

  objc_sync_exit(self);
}

- (void)advanceProgress:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[TSUProgressContext currentStage](self, "currentStage"), "advanceProgress:", a3);
  objc_sync_exit(self);
}

- (void)setProgress:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[TSUProgressContext currentStage](self, "currentStage"), "setProgress:", a3);
  objc_sync_exit(self);
}

- (void)setPercentageProgressFromTCProgressContext:(double)a3
{
  objc_sync_enter(self);
  objc_msgSend(-[TSUProgressContext currentStage](self, "currentStage"), "setProgressPercentage:", a3);
  objc_sync_exit(self);
}

- (void)setMessage:(id)a3
{
  uint64_t v4;

  if (!a3)
    a3 = &stru_24D61C228;
  v4 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, CFSTR("TSUProgressMessage"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSUProgressNotification"), self, v4);
}

- (double)currentPosition
{
  id v3;
  double result;

  objc_sync_enter(self);
  v3 = -[TSUProgressContext currentStage](self, "currentStage");
  objc_sync_exit(self);
  if (!v3)
    return self->m_lastProgressReport;
  objc_msgSend(v3, "currentPosition");
  return result;
}

- (double)overallProgress
{
  id v3;
  double result;

  objc_sync_enter(self);
  v3 = -[TSUProgressContext currentStage](self, "currentStage");
  objc_sync_exit(self);
  if (!v3)
    return self->m_lastOverallProgress;
  objc_msgSend(v3, "overallProgress");
  return result;
}

- (TSUProgressContext)init
{
  TSUProgressContext *v2;
  TSUProgressContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUProgressContext;
  v2 = -[TSUProgressContext init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TSUProgressContext reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->m_currentStage = 0;
  self->m_lastReportTime = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUProgressContext;
  -[TSUProgressContext dealloc](&v3, sel_dealloc);
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
