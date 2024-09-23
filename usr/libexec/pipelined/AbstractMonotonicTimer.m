@implementation AbstractMonotonicTimer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_handlerQ, 0);
  objc_storeStrong((id *)&self->_q, 0);
}

- (void)setInterval:(duration<long)long
{
  NSObject *q;
  _QWORD v5[6];
  uint64_t rep;
  void *__p;
  void *v8[2];
  char v9;
  std::string v10;
  std::string v11;

  rep = a3.__rep_;
  if (a3.__rep_ < 0)
  {
    sub_1000D5048(v8, "");
    sub_100258B30("Negative intervals are unsupported: ", &v10);
    sub_100263844(&rep, &v11);
    sub_100174738((uint64_t)v8, (uint64_t)&v10, 2);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v11.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_5:
        if ((v9 & 0x80000000) == 0)
          goto LABEL_6;
LABEL_9:
        operator delete(v8[0]);
LABEL_6:
        sub_1000F2AE4((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((v9 & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_9;
  }
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BCD34;
  v5[3] = &unk_100404868;
  v5[4] = self;
  v5[5] = a3.__rep_;
  dispatch_sync(q, v5);
}

- (void)onQueueTick
{
  NSObject *handlerQ;
  id handler;

  handlerQ = self->_handlerQ;
  if (handlerQ)
  {
    handler = self->_handler;
    if (handler)
      dispatch_async(handlerQ, handler);
  }
}

- (void)onQueueInvalidate
{
  id handler;
  OS_dispatch_queue *handlerQ;

  handler = self->_handler;
  self->_handler = 0;

  handlerQ = self->_handlerQ;
  self->_handlerQ = 0;

}

- (void)setEventHandler:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  NSObject *q;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDA60;
  block[3] = &unk_1004048C0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(q, block);

}

- (AbstractMonotonicTimer)initWithName:(id)a3
{
  id v4;
  AbstractMonotonicTimer *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *q;
  AbstractMonotonicTimer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AbstractMonotonicTimer;
  v5 = -[AbstractMonotonicTimer init](&v10, "init");
  if (v5
    && (v6 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), 0),
        q = v5->_q,
        v5->_q = (OS_dispatch_queue *)v6,
        q,
        v5->_q))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)resume
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BC9B0;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_sync(q, block);
}

- (void)setDelay:(duration<long)long
{
  NSObject *q;
  _QWORD v5[6];
  uint64_t rep;
  void *__p;
  void *v8[2];
  char v9;
  std::string v10;
  std::string v11;

  rep = a3.__rep_;
  if (a3.__rep_ < 0)
  {
    sub_1000D5048(v8, "");
    sub_10016A234("Negative delays are unsupported: ", &v10);
    sub_100263844(&rep, &v11);
    sub_100174738((uint64_t)v8, (uint64_t)&v10, 2);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v11.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_5:
        if ((v9 & 0x80000000) == 0)
          goto LABEL_6;
LABEL_9:
        operator delete(v8[0]);
LABEL_6:
        sub_1000F2AE4((uint64_t)&__p);
      }
    }
    else if ((SHIBYTE(v10.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_5;
    }
    operator delete(v10.__r_.__value_.__l.__data_);
    if ((v9 & 0x80000000) == 0)
      goto LABEL_6;
    goto LABEL_9;
  }
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BC920;
  v5[3] = &unk_100404868;
  v5[4] = self;
  v5[5] = a3.__rep_;
  dispatch_sync(q, v5);
}

- (void)pause
{
  NSObject *q;
  _QWORD block[5];

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BCD44;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_sync(q, block);
}

- (AbstractMonotonicTimer)init
{
  -[AbstractMonotonicTimer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)abstractFunctionCalled:(SEL)a3
{
  NSString *v3;
  id v4;

  v3 = NSStringFromSelector(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("You must override %@ in a subclass"), v4);

}

- (void)implOnQueuePause
{
  -[AbstractMonotonicTimer abstractFunctionCalled:](self, "abstractFunctionCalled:", a2);
}

- (void)implOnQueueResume
{
  -[AbstractMonotonicTimer abstractFunctionCalled:](self, "abstractFunctionCalled:", a2);
}

- (void)implOnQueueUpdateTimer
{
  -[AbstractMonotonicTimer abstractFunctionCalled:](self, "abstractFunctionCalled:", a2);
}

- (void)invalidate
{
  -[AbstractMonotonicTimer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (duration<long)delay
{
  NSObject *q;
  AbstractMonotonicTimer *v3;
  _QWORD block[4];
  AbstractMonotonicTimer *v6;
  duration<long long, std::ratio<1, 1000000000>> *v7;
  duration<long long, std::ratio<1, 1000000000>> v8;

  v8.__rep_ = -1;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1002F03F4;
  block[3] = &unk_100404830;
  v6 = self;
  v7 = &v8;
  v3 = v6;
  dispatch_sync(q, block);

  return v8;
}

- (double)delayTimeInterval
{
  return (double)(uint64_t)-[AbstractMonotonicTimer delay](self, "delay") / 1000000000.0;
}

- (void)setDelayTimeInterval:(double)a3
{
  -[AbstractMonotonicTimer setDelay:](self, "setDelay:", (uint64_t)(a3 * 1000000000.0));
}

- (duration<long)interval
{
  NSObject *q;
  AbstractMonotonicTimer *v3;
  _QWORD block[4];
  AbstractMonotonicTimer *v6;
  duration<long long, std::ratio<1, 1000000000>> *v7;
  duration<long long, std::ratio<1, 1000000000>> v8;

  v8.__rep_ = -1;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1002F0504;
  block[3] = &unk_100404888;
  v6 = self;
  v7 = &v8;
  v3 = v6;
  dispatch_sync(q, block);

  return v8;
}

- (void)setIntervalTimeInterval:(double)a3
{
  -[AbstractMonotonicTimer setInterval:](self, "setInterval:", (uint64_t)(a3 * 1000000000.0));
}

- (double)intervalTimeInterval
{
  return (double)(uint64_t)-[AbstractMonotonicTimer interval](self, "interval") / 1000000000.0;
}

@end
