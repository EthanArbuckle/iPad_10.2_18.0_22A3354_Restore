@implementation CRLAccessibilityTimer

- (CRLAccessibilityTimer)init
{
  return -[CRLAccessibilityTimer initWithTargetSerialQueue:](self, "initWithTargetSerialQueue:", 0);
}

- (CRLAccessibilityTimer)initWithTargetSerialQueue:(id)a3
{
  id v4;
  CRLAccessibilityTimer *v5;
  CRLAccessibilityTimer *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  Class v11;
  NSString *v12;
  void *v13;
  id v14;
  id v15;
  dispatch_queue_t v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRLAccessibilityTimer;
  v5 = -[CRLAccessibilityTimer init](&v18, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[CRLAccessibilityTimer _setDispatchQueue:](v5, "_setDispatchQueue:", v4);
    }
    else
    {
      v7 = objc_alloc((Class)NSString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
      objc_opt_class(v6, v10);
      v12 = NSStringFromClass(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@.%@.TimerQueue"), v9, v13);

      v15 = objc_retainAutorelease(v14);
      v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), 0);
      -[CRLAccessibilityTimer _setDispatchQueue:](v6, "_setDispatchQueue:", v16);

    }
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLAccessibilityTimer _reallyCancel](self, "_reallyCancel");
  -[CRLAccessibilityTimer _setDispatchQueue:](self, "_setDispatchQueue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLAccessibilityTimer;
  -[CRLAccessibilityTimer dealloc](&v3, "dealloc");
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a4;
  -[CRLAccessibilityTimer _setCancelled:](self, "_setCancelled:", 0);
  v7 = objc_claimAutoreleasedReturnValue(-[CRLAccessibilityTimer _dispatchQueue](self, "_dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B6DDC;
  block[3] = &unk_1012313C0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_reallyCancel
{
  NSObject *v3;
  NSObject *v4;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLAccessibilityTimer _dispatchTimer](self, "_dispatchTimer"));
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    -[CRLAccessibilityTimer _setDispatchTimer:](self, "_setDispatchTimer:", 0);
    v3 = v4;
  }

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[CRLAccessibilityTimer _setCancelled:](self, "_setCancelled:", 1);
  v3 = objc_claimAutoreleasedReturnValue(-[CRLAccessibilityTimer _dispatchQueue](self, "_dispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B7018;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)automaticallyCancelPendingBlockUponSchedulingNewBlock
{
  return self->_automaticallyCancelPendingBlockUponSchedulingNewBlock;
}

- (void)setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:(BOOL)a3
{
  self->_automaticallyCancelPendingBlockUponSchedulingNewBlock = a3;
}

- (OS_dispatch_queue)_dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_dispatch_source)_dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)_setDispatchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchTimer, a3);
}

- (BOOL)_isCancelled
{
  return self->_cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchTimer, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
