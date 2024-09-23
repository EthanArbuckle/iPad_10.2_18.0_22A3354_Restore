@implementation TCProgressContext

+ (void)createContextForCurrentThreadWithParentContext:(id)a3
{
  TCProgressContext *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = -[TCProgressContext initWithParentContext:]([TCProgressContext alloc], "initWithParentContext:", v6);
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("TCProgressContext Instance"));

}

+ (void)removeContextForCurrentThread
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("TCProgressContext Instance"));

}

+ (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "contextForCurrentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v8, a4, CFSTR("TCProgressNotification"), v6);

  }
}

+ (void)removeProgressObserver:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "contextForCurrentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", v6, CFSTR("TCProgressNotification"), v4);

  }
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
  objc_msgSend(a1, "createStageWithSteps:takingSteps:name:", 0, a3, a4);
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  _QWORD *v8;
  TCProgressStage *v9;
  void *v10;
  id v11;

  v11 = a5;
  objc_msgSend(a1, "contextForCurrentThread");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[TCProgressStage initWithSteps:takingSteps:name:inContext:]([TCProgressStage alloc], "initWithSteps:takingSteps:name:inContext:", v11, v8, a3, a4);
    v10 = (void *)v8[2];
    v8[2] = v9;

  }
}

+ (void)endStage
{
  id *v2;
  id v3;
  uint64_t v4;
  id v5;
  id *v6;

  objc_msgSend(a1, "contextForCurrentThread");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    v3 = v2[2];
    objc_msgSend(v3, "end");
    objc_msgSend(v3, "parentStage");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v6[2];
    v6[2] = (id)v4;

    v2 = v6;
  }

}

+ (id)createBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  objc_msgSend(a1, "contextForCurrentThread");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[TCProgressStage initBranchWithSteps:takingSteps:name:inContext:]([TCProgressStage alloc], "initBranchWithSteps:takingSteps:name:inContext:", v8, v9, a3, a4);
  else
    v10 = 0;

  return v10;
}

+ (void)endBranch:(id)a3
{
  objc_msgSend(a3, "end");
}

+ (void)pushBranch:(id)a3
{
  uint64_t v5;
  id *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a1, "contextForCurrentThread");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (id *)v5;
  if (v5)
  {
    objc_msgSend(*(id *)(v5 + 32), "addObject:", *(_QWORD *)(v5 + 16));
    objc_storeStrong(v6 + 2, a3);
  }

}

+ (void)popBranch
{
  uint64_t v2;
  id v3;
  id *v4;

  objc_msgSend(a1, "contextForCurrentThread");
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4[4], "lastObject");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v4[2];
    v4[2] = (id)v2;

    objc_msgSend(v4[4], "removeLastObject");
  }

}

+ (void)advanceProgress:(double)a3
{
  id v4;

  objc_msgSend(a1, "stageForCurrentThread");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "advanceProgress:", a3);

}

+ (void)advanceProgressInContext:(id)a3 progress:(double)a4
{
  id v5;

  objc_msgSend(a3, "currentStage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "advanceProgress:", a4);

}

+ (void)setProgress:(double)a3
{
  id v4;

  objc_msgSend(a1, "stageForCurrentThread");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProgress:", a3);

}

+ (void)setMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a3, CFSTR("TCProgressMessage"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contextForCurrentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("TCProgressNotification"), v5, v6);

}

+ (double)currentPosition
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "stageForCurrentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPosition");
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_stackOfBranches, 0);
  objc_storeStrong((id *)&self->m_lastReportTime, 0);
  objc_storeStrong((id *)&self->m_currentStage, 0);
  objc_storeStrong((id *)&self->m_parentProgressContext, 0);
}

- (TCProgressContext)initWithParentContext:(id)a3
{
  id v5;
  TCProgressContext *v6;
  TCProgressStage *v7;
  TCProgressStage *m_currentStage;
  NSMutableArray *v9;
  NSMutableArray *m_stackOfBranches;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TCProgressContext;
  v6 = -[TCProgressContext init](&v12, sel_init);
  if (v6)
  {
    v7 = -[TCProgressStage initRootStageInContext:]([TCProgressStage alloc], "initRootStageInContext:", v6);
    m_currentStage = v6->m_currentStage;
    v6->m_currentStage = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    m_stackOfBranches = v6->m_stackOfBranches;
    v6->m_stackOfBranches = v9;

    objc_storeStrong((id *)&v6->m_parentProgressContext, a3);
  }

  return v6;
}

- (void)dealloc
{
  TCProgressStage *m_currentStage;
  NSDate *m_lastReportTime;
  NSMutableArray *m_stackOfBranches;
  OITSUProgressContext *m_parentProgressContext;
  objc_super v7;

  m_currentStage = self->m_currentStage;
  self->m_currentStage = 0;

  m_lastReportTime = self->m_lastReportTime;
  self->m_lastReportTime = 0;

  m_stackOfBranches = self->m_stackOfBranches;
  self->m_stackOfBranches = 0;

  m_parentProgressContext = self->m_parentProgressContext;
  self->m_parentProgressContext = 0;

  v7.receiver = self;
  v7.super_class = (Class)TCProgressContext;
  -[TCProgressContext dealloc](&v7, sel_dealloc);
}

+ (id)contextForCurrentThread
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("TCProgressContext Instance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)stageForCurrentThread
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "contextForCurrentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentStage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (id)rootStage
{
  TCProgressStage *i;
  void *v3;
  uint64_t v4;

  for (i = self->m_currentStage; ; i = (TCProgressStage *)v4)
  {
    -[TCProgressStage parentStage](i, "parentStage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      break;
    -[TCProgressStage parentStage](i, "parentStage");
    v4 = objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (void)reportProgress:(double)a3
{
  OITSUProgressContext *m_parentProgressContext;

  m_parentProgressContext = self->m_parentProgressContext;
  if (m_parentProgressContext)
    -[OITSUProgressContext setPercentageProgressFromTCProgressContext:](m_parentProgressContext, "setPercentageProgressFromTCProgressContext:", a3);
}

@end
