@implementation MTTimedOperation

- (MTTimedOperation)init
{
  MTTimedOperation *v2;
  MTTimedOperation *v3;
  uint64_t v4;
  NSUUID *identifier;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTTimedOperation;
  v2 = -[MTTimedOperation init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v2->_executing = 0;
    v2->_finished = 0;
    v2->_startDelay = 1.0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    identifier = v3->_identifier;
    v3->_identifier = (NSUUID *)v4;

    v6 = dispatch_queue_create("MTTimedOperation.workQueue", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)finish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];
  _QWORD v8[2];

  -[MTTimedOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[MTTimedOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_executing = 0;
  self->_finished = 1;
  -[MTTimedOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[MTTimedOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  v7[0] = CFSTR("MTTimedOperationIsCancelledKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MTTimedOperation isCancelled](self, "isCancelled")));
  v7[1] = CFSTR("MTTimedOperationIdentifierKey");
  v8[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTimedOperation identifier](self, "identifier"));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MTTimedOperationFinished"), 0, v5);

}

- (void)start
{
  double v3;

  if (-[MTTimedOperation isCancelled](self, "isCancelled"))
  {
    -[MTTimedOperation finish](self, "finish");
  }
  else
  {
    -[MTTimedOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = 1;
    -[MTTimedOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[MTTimedOperation startDelay](self, "startDelay");
    if (v3 <= 0.0)
      -[MTTimedOperation main](self, "main");
    else
      -[MTTimedOperation waitForStartDelay](self, "waitForStartDelay");
  }
}

- (void)main
{
  void (**mainBlock)(void);

  if ((-[MTTimedOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    mainBlock = (void (**)(void))self->_mainBlock;
    if (mainBlock)
      mainBlock[2]();
  }
  -[MTTimedOperation finish](self, "finish");
}

- (void)waitForStartDelay
{
  double v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if ((-[MTTimedOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[MTTimedOperation setIsSleepingOnStartDelay:](self, "setIsSleepingOnStartDelay:", 1);
    objc_initWeak(&location, self);
    -[MTTimedOperation startDelay](self, "startDelay");
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    v5 = objc_claimAutoreleasedReturnValue(-[MTTimedOperation workQueue](self, "workQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C2BC4;
    v6[3] = &unk_1004A7570;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)cancel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTTimedOperation;
  -[MTTimedOperation cancel](&v3, "cancel");
  -[MTTimedOperation setIsSleepingOnStartDelay:](self, "setIsSleepingOnStartDelay:", 0);
  -[MTTimedOperation finish](self, "finish");
}

- (void)setMainBlock:(id)a3
{
  id v4;
  id mainBlock;

  v4 = objc_retainBlock(a3);
  mainBlock = self->_mainBlock;
  self->_mainBlock = v4;

}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setStartDelay:(double)a3
{
  self->_startDelay = a3;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int64_t)a3
{
  self->_operationType = a3;
}

- (BOOL)isSleepingOnStartDelay
{
  return self->_isSleepingOnStartDelay;
}

- (void)setIsSleepingOnStartDelay:(BOOL)a3
{
  self->_isSleepingOnStartDelay = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_mainBlock, 0);
}

- (BOOL)requiresStartDelayToAvoidClampErrors
{
  int64_t v2;

  v2 = -[MTTimedOperation operationType](self, "operationType");
  return v2 != 5 && v2 != 10;
}

@end
