@implementation CRLProgressObserver

- (CRLProgressObserver)initWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  CRLProgressObserver *v11;
  CRLProgressObserver *v12;
  id v13;
  id handler;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRLProgressObserver;
  v11 = -[CRLProgressObserver init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    v11->_valueInterval = a3;
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = objc_msgSend(v10, "copy");
    handler = v12->_handler;
    v12->_handler = v13;

    v12->_lastHandledValue = 0.0;
  }

  return v12;
}

- (CRLProgressObserver)init
{
  return -[CRLProgressObserver initWithValueInterval:queue:handler:](self, "initWithValueInterval:queue:handler:", 0, 0, 0.0);
}

- (void)handleValue:(double)a3 maxValue:(double)a4 isIndeterminate:(BOOL)a5
{
  double v9;
  double v10;
  NSObject *queue;
  _QWORD block[5];

  if (self->_lastHandledIndeterminate != a5
    || (v9 = vabdd_f64(a3, self->_lastHandledValue),
        -[CRLProgressObserver valueInterval](self, "valueInterval"),
        v9 >= v10)
    || a3 >= a4 && self->_lastHandledValue < a4)
  {
    self->_lastHandledIndeterminate = a5;
    self->_lastHandledValue = a3;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100107384;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (double)valueInterval
{
  return self->_valueInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
