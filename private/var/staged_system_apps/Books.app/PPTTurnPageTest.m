@implementation PPTTurnPageTest

- (PPTTurnPageTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  PPTTurnPageTest *v11;
  void *v12;
  objc_super v14;

  v6 = a6;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PPTTurnPageTest;
  v11 = -[PPTBasicTest initWithName:options:testDefinition:isMainTest:](&v14, "initWithName:options:testDefinition:isMainTest:", a3, a4, v10, v6);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("glitch-free")));
    v11->_glitchFree = objc_msgSend(v12, "BOOLValue");

  }
  return v11;
}

- (BOOL)waitForCACommitBeforeTrackingMetric
{
  return 0;
}

- (void)startTest
{
  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  -[PPTTurnPageTest subscribe](self, "subscribe");
  -[PPTTurnPageTest turnPage](self, "turnPage");
}

- (void)subscribe
{
  id v3;

  -[PPTBasicTest subscribeToStartNotification:endNotification:](self, "subscribeToStartNotification:endNotification:", kBETestDriverPageTurnStart, kBETestDriverPageTurnEnd);
  if (-[PPTBasicTest running](self, "running"))
  {
    if (-[PPTBasicTest mainTest](self, "mainTest"))
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleSetupStart:", kBETestDriverPageTurnSetupStart, 0);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleSetupEnd:", kBETestDriverPageTurnSetupEnd, 0);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handlePageTurnAnimationStart:", kBETestDriverPageTurnAnimationStart, 0);
      objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handlePageTurnAnimationEnd:", kBETestDriverPageTurnAnimationEnd, 0);

    }
  }
}

- (void)_handleSetupStart:(id)a3
{
  void *v4;
  id v5;

  if (-[PPTBasicTest running](self, "running", a3))
  {
    if (-[PPTBasicTest mainTest](self, "mainTest"))
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
      objc_msgSend(v5, "startedSubTest:forTest:withMetrics:", CFSTR("setup"), v4, &off_10092F658);

    }
  }
}

- (void)_handleSetupEnd:(id)a3
{
  void *v4;
  id v5;

  if (-[PPTBasicTest running](self, "running", a3))
  {
    if (-[PPTBasicTest mainTest](self, "mainTest"))
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
      objc_msgSend(v5, "finishedSubTest:forTest:", CFSTR("setup"), v4);

    }
  }
}

- (void)_handlePageTurnAnimationStart:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  PPTTurnPageTest *v7;

  if (-[PPTBasicTest running](self, "running", a3))
  {
    if (-[PPTBasicTest mainTest](self, "mainTest"))
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100158D94;
      v5[3] = &unk_1008E7338;
      v6 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v7 = self;
      v4 = v6;
      objc_msgSend(v4, "installCACommitCompletionBlock:", v5);

    }
  }
}

- (void)_handlePageTurnAnimationEnd:(id)a3
{
  void *v4;
  id v5;

  if (-[PPTBasicTest running](self, "running", a3))
  {
    if (-[PPTBasicTest mainTest](self, "mainTest"))
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest name](self, "name"));
      objc_msgSend(v5, "finishedSubTest:forTest:", CFSTR("page-turn"), v4);

    }
  }
}

- (BOOL)glitchFree
{
  return self->_glitchFree;
}

- (void)setGlitchFree:(BOOL)a3
{
  self->_glitchFree = a3;
}

@end
