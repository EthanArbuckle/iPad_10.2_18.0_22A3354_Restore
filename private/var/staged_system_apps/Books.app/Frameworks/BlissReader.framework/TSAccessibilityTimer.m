@implementation TSAccessibilityTimer

- (TSAccessibilityTimer)init
{
  return -[TSAccessibilityTimer initWithTargetSerialQueue:](self, "initWithTargetSerialQueue:", 0);
}

- (TSAccessibilityTimer)initWithTargetSerialQueue:(id)a3
{
  TSAccessibilityTimer *v4;
  TSAccessibilityTimer *v5;
  id v6;
  NSString *v7;
  objc_class *v8;
  id v9;
  NSObject *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSAccessibilityTimer;
  v4 = -[TSAccessibilityTimer init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      -[TSAccessibilityTimer _setDispatchQueue:](v4, "_setDispatchQueue:", a3);
    }
    else
    {
      v6 = objc_alloc((Class)NSString);
      v7 = -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier");
      v8 = (objc_class *)objc_opt_class(v5);
      v9 = objc_msgSend(v6, "initWithFormat:", CFSTR("%@.%@.TimerQueue"), v7, NSStringFromClass(v8));
      v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);

      -[TSAccessibilityTimer _setDispatchQueue:](v5, "_setDispatchQueue:", v10);
      if (v10)
        dispatch_release(v10);
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TSAccessibilityTimer _reallyCancel](self, "_reallyCancel");
  -[TSAccessibilityTimer _setDispatchQueue:](self, "_setDispatchQueue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityTimer;
  -[TSAccessibilityTimer dealloc](&v3, "dealloc");
}

- (void)afterDelay:(double)a3 processBlock:(id)a4
{
  _QWORD block[7];

  -[TSAccessibilityTimer _setCancelled:](self, "_setCancelled:", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22A4F8;
  block[3] = &unk_4270E0;
  *(double *)&block[6] = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)-[TSAccessibilityTimer _dispatchQueue](self, "_dispatchQueue"), block);
}

- (void)_reallyCancel
{
  OS_dispatch_source *v3;

  v3 = -[TSAccessibilityTimer _dispatchTimer](self, "_dispatchTimer");
  if (v3)
  {
    dispatch_source_cancel((dispatch_source_t)v3);
    -[TSAccessibilityTimer _setDispatchTimer:](self, "_setDispatchTimer:", 0);
  }
}

- (void)cancel
{
  _QWORD block[5];

  -[TSAccessibilityTimer _setCancelled:](self, "_setCancelled:", 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22A6F0;
  block[3] = &unk_426DD0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)-[TSAccessibilityTimer _dispatchQueue](self, "_dispatchQueue"), block);
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
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OS_dispatch_source)_dispatchTimer
{
  return self->_dispatchTimer;
}

- (void)_setDispatchTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)_isCancelled
{
  return self->_cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end
