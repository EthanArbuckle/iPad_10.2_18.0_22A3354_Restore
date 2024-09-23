@implementation MTHostWindowReadyTrackingController

- (MTHostWindowReadyTrackingController)init
{
  MTHostWindowReadyTrackingController *v2;
  uint64_t v3;
  NSMutableArray *pendingBlocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTHostWindowReadyTrackingController;
  v2 = -[MTHostWindowReadyTrackingController init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingBlocks = v2->_pendingBlocks;
    v2->_pendingBlocks = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)runBlockWhenReady:(id)a3
{
  NSMutableArray *pendingBlocks;
  id v5;

  if (a3)
  {
    pendingBlocks = self->_pendingBlocks;
    v5 = objc_retainBlock(a3);
    -[NSMutableArray addObject:](pendingBlocks, "addObject:", v5);

    -[MTHostWindowReadyTrackingController performPendingBlocksIfReady](self, "performPendingBlocksIfReady");
  }
}

- (void)start
{
  id v3;

  if (!self->_observing || self->_isReady)
  {
    self->_observing = 1;
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "_hostWindowDidBecomeReady", CFSTR("UISBHSMainHostWindowDidBecomeKeyNotification"), 0);

  }
}

- (void)_hostWindowDidBecomeReady
{
  void *v3;
  _QWORD block[5];

  self->_isReady = 1;
  self->_observing = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UISBHSMainHostWindowDidBecomeKeyNotification"), 0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F0FAC;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)performPendingBlocksIfReady
{
  id v3;

  if (self->_isReady)
  {
    v3 = -[NSMutableArray copy](self->_pendingBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingBlocks, "removeAllObjects");
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_1004AAD50);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
}

@end
