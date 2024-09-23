@implementation CRLProgress

- (id)initForSubclass
{
  CRLProgress *v2;
  NSMutableSet *v3;
  NSMutableSet *progressObservers;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *progressObserversQueue;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *progressObserversValueQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRLProgress;
  v2 = -[CRLProgress init](&v14, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    progressObservers = v2->_progressObservers;
    v2->_progressObservers = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.freeform.CRLProgressObservers", v6);
    progressObserversQueue = v2->_progressObserversQueue;
    v2->_progressObserversQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.freeform.CRLProgressObserverValue", v10);
    progressObserversValueQueue = v2->_progressObserversValueQueue;
    v2->_progressObserversValueQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

- (double)value
{
  return NAN;
}

- (double)maxValue
{
  return NAN;
}

- (BOOL)isIndeterminate
{
  return 1;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  CRLProgressObserver *v5;
  id v9;
  id v10;
  CRLProgressObserver *v11;
  NSObject *progressObserversQueue;
  _QWORD v14[5];
  CRLProgressObserver *v15;

  v5 = 0;
  if (a4 && a5)
  {
    v9 = a5;
    v10 = a4;
    v11 = -[CRLProgressObserver initWithValueInterval:queue:handler:]([CRLProgressObserver alloc], "initWithValueInterval:queue:handler:", v10, v9, a3);

    progressObserversQueue = self->_progressObserversQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100104D7C;
    v14[3] = &unk_10122D3D8;
    v14[4] = self;
    v5 = v11;
    v15 = v5;
    dispatch_async(progressObserversQueue, v14);

  }
  return v5;
}

- (void)removeProgressObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *progressObserversQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    progressObserversQueue = self->_progressObserversQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100104E14;
    v7[3] = &unk_10122D3D8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(progressObserversQueue, v7);

  }
}

- (void)protected_progressDidChange
{
  NSObject *progressObserversValueQueue;
  _QWORD block[5];

  progressObserversValueQueue = self->_progressObserversValueQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100104E78;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(progressObserversValueQueue, block);
}

- (BOOL)protected_hasProgressObservers
{
  NSObject *progressObserversQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  progressObserversQueue = self->_progressObserversQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001050C0;
  v5[3] = &unk_10122C5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(progressObserversQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)protected_minProgressObserverValueInterval
{
  NSObject *progressObserversQueue;
  double v3;
  _QWORD v5[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0x7FF0000000000000;
  progressObserversQueue = self->_progressObserversQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100105190;
  v5[3] = &unk_10122C6A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(progressObserversQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_progressObserversValueQueue, 0);
  objc_storeStrong((id *)&self->_progressObserversQueue, 0);
  objc_storeStrong((id *)&self->_progressObservers, 0);
}

@end
