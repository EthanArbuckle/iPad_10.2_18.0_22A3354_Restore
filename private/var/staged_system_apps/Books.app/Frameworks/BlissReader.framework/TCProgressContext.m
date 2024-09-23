@implementation TCProgressContext

+ (void)createContextForCurrentThreadWithParentContext:(id)a3
{
  TCProgressContext *v3;

  v3 = -[TCProgressContext initWithParentContext:]([TCProgressContext alloc], "initWithParentContext:", a3);
  -[NSMutableDictionary setObject:forKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "setObject:forKey:", v3, CFSTR("TCProgressContext Instance"));

}

+ (void)removeContextForCurrentThread
{
  -[NSMutableDictionary removeObjectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "removeObjectForKey:", CFSTR("TCProgressContext Instance"));
}

+ (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  id v6;

  v6 = objc_msgSend(a1, "contextForCurrentThread");
  if (v6)
    -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", a3, a4, CFSTR("TCProgressNotification"), v6);
}

+ (void)removeProgressObserver:(id)a3
{
  id v4;

  v4 = objc_msgSend(a1, "contextForCurrentThread");
  if (v4)
    -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", a3, CFSTR("TCProgressNotification"), v4);
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
  objc_msgSend(a1, "createStageWithSteps:takingSteps:name:", 0, a3, a4);
}

+ (void)createStageWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  _QWORD *v8;
  id v9;

  v8 = objc_msgSend(a1, "contextForCurrentThread");
  if (v8)
  {
    v9 = (id)v8[2];
    v8[2] = -[TCProgressStage initWithSteps:takingSteps:name:inContext:]([TCProgressStage alloc], "initWithSteps:takingSteps:name:inContext:", a5, v8, a3, a4);

  }
}

+ (void)endStage
{
  _QWORD *v2;
  _QWORD *v3;
  id v4;

  v2 = objc_msgSend(a1, "contextForCurrentThread");
  if (v2)
  {
    v3 = v2;
    v4 = (id)v2[2];
    objc_msgSend(v4, "end");
    v3[2] = objc_msgSend(v4, "parentStage");

  }
}

+ (id)createBranchWithSteps:(double)a3 takingSteps:(double)a4 name:(id)a5
{
  id result;

  result = objc_msgSend(a1, "contextForCurrentThread");
  if (result)
    return -[TCProgressStage initBranchWithSteps:takingSteps:name:inContext:]([TCProgressStage alloc], "initBranchWithSteps:takingSteps:name:inContext:", a5, result, a3, a4);
  return result;
}

+ (void)endBranch:(id)a3
{
  objc_msgSend(a3, "end");

}

+ (void)pushBranch:(id)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_msgSend(a1, "contextForCurrentThread");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4[4], "addObject:", v4[2]);
    v5[2] = a3;
  }
}

+ (void)popBranch
{
  id *v2;
  id *v3;

  v2 = (id *)objc_msgSend(a1, "contextForCurrentThread");
  if (v2)
  {
    v3 = v2;
    v2[2] = objc_msgSend(v2[4], "lastObject");
    objc_msgSend(v3[4], "removeLastObject");
  }
}

+ (void)advanceProgress:(double)a3
{
  objc_msgSend(objc_msgSend(a1, "stageForCurrentThread"), "advanceProgress:", a3);
}

+ (void)advanceProgressInContext:(id)a3 progress:(double)a4
{
  objc_msgSend(objc_msgSend(a3, "currentStage"), "advanceProgress:", a4);
}

+ (void)setProgress:(double)a3
{
  objc_msgSend(objc_msgSend(a1, "stageForCurrentThread"), "setProgress:", a3);
}

+ (void)setMessage:(id)a3
{
  -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TCProgressNotification"), objc_msgSend(a1, "contextForCurrentThread"), +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a3, CFSTR("TCProgressMessage")));
}

+ (double)currentPosition
{
  double result;

  objc_msgSend(objc_msgSend(a1, "stageForCurrentThread"), "currentPosition");
  return result;
}

- (TCProgressContext)initWithParentContext:(id)a3
{
  TCProgressContext *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TCProgressContext;
  v4 = -[TCProgressContext init](&v7, "init");
  if (v4)
  {
    v4->m_currentStage = (TCProgressStage *)-[TCProgressStage initRootStageInContext:]([TCProgressStage alloc], "initRootStageInContext:", v4);
    v4->m_stackOfBranches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v5 = a3;

    v4->m_parentProgressContext = (TSUProgressContext *)a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->m_currentStage = 0;
  self->m_lastReportTime = 0;

  self->m_stackOfBranches = 0;
  self->m_parentProgressContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)TCProgressContext;
  -[TCProgressContext dealloc](&v3, "dealloc");
}

+ (id)contextForCurrentThread
{
  return -[NSMutableDictionary objectForKey:](-[NSThread threadDictionary](+[NSThread currentThread](NSThread, "currentThread"), "threadDictionary"), "objectForKey:", CFSTR("TCProgressContext Instance"));
}

+ (id)stageForCurrentThread
{
  return objc_msgSend(objc_msgSend(a1, "contextForCurrentThread"), "currentStage");
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (id)rootStage
{
  TCProgressStage *m_currentStage;
  TCProgressStage *i;

  m_currentStage = self->m_currentStage;
  for (i = m_currentStage; -[TCProgressStage parentStage](i, "parentStage"); m_currentStage = i)
    i = -[TCProgressStage parentStage](m_currentStage, "parentStage");
  return m_currentStage;
}

- (void)reportProgress:(double)a3
{
  TSUProgressContext *m_parentProgressContext;

  m_parentProgressContext = self->m_parentProgressContext;
  if (m_parentProgressContext)
    -[TSUProgressContext setPercentageProgressFromTCProgressContext:](m_parentProgressContext, "setPercentageProgressFromTCProgressContext:", a3);
}

@end
