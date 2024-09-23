@implementation CRLProgressContext

- (void)reset
{
  CRLProgressStage *v2;
  CRLProgressStage *m_currentStage;
  CRLProgressContext *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = -[CRLProgressStage initRootStageInContext:]([CRLProgressStage alloc], "initRootStageInContext:", obj);
  m_currentStage = obj->m_currentStage;
  obj->m_currentStage = v2;

  obj->m_lastProgressReport = 0.0;
  obj->m_lastOverallProgress = 0.0;
  objc_sync_exit(obj);

}

- (void)addProgressObserver:(id)a3 selector:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", v6, a4, CFSTR("CRLProgressNotification"), self);

}

- (id)addProgressObserverBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100175C18;
  v9[3] = &unk_10123DAD8;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crl_addObserverForName:object:queue:usingBlock:", CFSTR("CRLProgressNotification"), self, 0, v9));

  return v7;
}

- (void)removeProgressObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", v4, CFSTR("CRLProgressNotification"), self);

}

- (void)createStageWithSteps:(double)a3 takingSteps:(double)a4
{
  double v6;
  NSObject *v7;
  CRLProgressContext *v8;
  CRLProgressStage *v9;
  CRLProgressStage *m_currentStage;

  if (a3 >= 0.0)
    v6 = a3;
  else
    v6 = 1.0;
  if (a4 <= 0.0)
  {
    if (qword_10147E368 != -1)
      dispatch_once(&qword_10147E368, &stru_10123DAF8);
    v7 = off_1013D9068;
    if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
      sub_100E0157C(v7, a4);
  }
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[CRLProgressStage initWithSteps:takingSteps:inContext:]([CRLProgressStage alloc], "initWithSteps:takingSteps:inContext:", v8, v6, a4);
  m_currentStage = v8->m_currentStage;
  v8->m_currentStage = v9;

  objc_sync_exit(v8);
}

- (void)createStageWithSteps:(double)a3
{
  CRLProgressContext *v4;
  CRLProgressStage *v5;
  CRLProgressStage *v6;
  double v7;
  double v8;

  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->m_currentStage;
  v6 = v5;
  if (v5)
  {
    -[CRLProgressStage nextSubStageParentSize](v5, "nextSubStageParentSize");
    v8 = v7;
    -[CRLProgressStage setNextSubStageParentSize:](v6, "setNextSubStageParentSize:", 1.0);
  }
  else
  {
    v8 = 1.0;
  }

  objc_sync_exit(v4);
  -[CRLProgressContext createStageWithSteps:takingSteps:](v4, "createStageWithSteps:takingSteps:", a3, v8);
}

- (void)nextSubStageWillTakeThisManyOfMySteps:(double)a3
{
  CRLProgressStage *v4;
  CRLProgressStage *v5;
  CRLProgressContext *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = obj->m_currentStage;
  v5 = v4;
  if (v4)
    -[CRLProgressStage setNextSubStageParentSize:](v4, "setNextSubStageParentSize:", a3);

  objc_sync_exit(obj);
}

- (void)endStage
{
  CRLProgressStage *v2;
  uint64_t v3;
  CRLProgressStage *m_currentStage;
  CRLProgressContext *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj->m_currentStage;
  -[CRLProgressStage end](v2, "end");
  v3 = objc_claimAutoreleasedReturnValue(-[CRLProgressStage parentStage](v2, "parentStage"));
  m_currentStage = obj->m_currentStage;
  obj->m_currentStage = (CRLProgressStage *)v3;

  objc_sync_exit(obj);
}

- (void)advanceProgress:(double)a3
{
  void *v4;
  CRLProgressContext *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLProgressContext currentStage](obj, "currentStage"));
  objc_msgSend(v4, "advanceProgress:", a3);

  objc_sync_exit(obj);
}

- (void)setProgress:(double)a3
{
  void *v4;
  CRLProgressContext *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLProgressContext currentStage](obj, "currentStage"));
  objc_msgSend(v4, "setProgress:", a3);

  objc_sync_exit(obj);
}

- (void)setPercentageProgressFromTCProgressContext:(double)a3
{
  void *v4;
  CRLProgressContext *obj;

  obj = self;
  objc_sync_enter(obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLProgressContext currentStage](obj, "currentStage"));
  objc_msgSend(v4, "setProgressPercentage:", a3);

  objc_sync_exit(obj);
}

- (void)setMessage:(id)a3
{
  void *v4;
  id v5;

  if (!a3)
    a3 = &stru_1012A72B0;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a3, CFSTR("CRLProgressMessage")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("CRLProgressNotification"), self, v5);

}

- (double)currentPosition
{
  CRLProgressContext *v2;
  void *v3;
  void *v4;
  double v5;
  double m_lastProgressReport;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLProgressContext currentStage](v2, "currentStage"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentPosition");
    m_lastProgressReport = v5;
  }
  else
  {
    m_lastProgressReport = v2->m_lastProgressReport;
  }

  objc_sync_exit(v2);
  return m_lastProgressReport;
}

- (double)overallProgress
{
  CRLProgressContext *v2;
  void *v3;
  void *v4;
  double v5;
  double m_lastOverallProgress;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLProgressContext currentStage](v2, "currentStage"));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "overallProgress");
    m_lastOverallProgress = v5;
  }
  else
  {
    m_lastOverallProgress = v2->m_lastOverallProgress;
  }

  objc_sync_exit(v2);
  return m_lastOverallProgress;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  -[CRLProgressContext currentPosition](self, "currentPosition");
  v4 = v3;
  -[CRLProgressContext overallProgress](self, "overallProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("CRLProgressContext %p: currentPosition = %g, overallProgress = %g"), self, v4, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLProgressContext currentStage](self, "currentStage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\ncurrentStage: %@"), v7));
  objc_msgSend(v6, "appendString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentStage"));

  if (v10)
  {
    do
    {
      objc_msgSend(v9, "appendString:", CFSTR("    "));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@parent: %@"), v9, v10));
      objc_msgSend(v6, "appendString:", v11);

      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentStage"));
      v10 = (void *)v12;
    }
    while (v12);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->m_lastReportTime, 0);
  objc_storeStrong((id *)&self->m_currentStage, 0);
}

- (CRLProgressContext)init
{
  CRLProgressContext *v2;
  CRLProgressContext *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLProgressContext;
  v2 = -[CRLProgressContext init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLProgressContext reset](v2, "reset");
  return v3;
}

- (void)dealloc
{
  CRLProgressStage *m_currentStage;
  NSDate *m_lastReportTime;
  objc_super v5;

  m_currentStage = self->m_currentStage;
  self->m_currentStage = 0;

  m_lastReportTime = self->m_lastReportTime;
  self->m_lastReportTime = 0;

  v5.receiver = self;
  v5.super_class = (Class)CRLProgressContext;
  -[CRLProgressContext dealloc](&v5, "dealloc");
}

- (id)currentStage
{
  return self->m_currentStage;
}

- (void)reportProgress:(double)a3 overallProgress:(double)a4
{
  NSDate *m_lastReportTime;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDate *v13;
  CRLProgressContext *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->m_lastOverallProgress = a4;
  m_lastReportTime = obj->m_lastReportTime;
  if (!m_lastReportTime
    || (-[NSDate timeIntervalSinceNow](m_lastReportTime, "timeIntervalSinceNow"), a3 >= 100.0)
    || v7 < -0.1
    || a3 - obj->m_lastProgressReport >= 5.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, CFSTR("CRLProgressCurrentPosition"), v9, CFSTR("CRLProgressOverallProgress"), 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("CRLProgressNotification"), obj, v10);

    v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v13 = obj->m_lastReportTime;
    obj->m_lastReportTime = (NSDate *)v12;

    obj->m_lastProgressReport = a3;
  }
  objc_sync_exit(obj);

}

@end
