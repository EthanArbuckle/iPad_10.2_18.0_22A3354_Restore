@implementation BKLibraryImportStatusController

+ (id)sharedController
{
  if (qword_DE568 != -1)
    dispatch_once(&qword_DE568, &stru_C2FE8);
  return (id)qword_DE570;
}

- (BKLibraryImportStatusController)init
{
  BKLibraryImportStatusController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *iVarQueue;
  id v5;
  BUCoalescingCallBlock *v6;
  BUCoalescingCallBlock *coalescedStatusChange;
  id v8;
  BUCoalescingCallBlock *v9;
  BUCoalescingCallBlock *coalescedZeroing;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BKLibraryImportStatusController;
  v2 = -[BKLibraryImportStatusController init](&v17, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iBooks.BKLibraryImportStatusController", 0);
    iVarQueue = v2->_iVarQueue;
    v2->_iVarQueue = (OS_dispatch_queue *)v3;

    objc_initWeak(&location, v2);
    v5 = objc_alloc((Class)BUCoalescingCallBlock);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_57DC4;
    v14[3] = &unk_C15B8;
    objc_copyWeak(&v15, &location);
    v6 = (BUCoalescingCallBlock *)objc_msgSend(v5, "initWithNotifyBlock:blockDescription:", v14, CFSTR("BKLibraryImportStatusController statusChange"));
    coalescedStatusChange = v2->_coalescedStatusChange;
    v2->_coalescedStatusChange = v6;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_coalescedStatusChange, "setCoalescingDelay:", 1.0);
    -[BUCoalescingCallBlock setMaximumDelay:](v2->_coalescedStatusChange, "setMaximumDelay:", 1.0);
    v8 = objc_alloc((Class)BUCoalescingCallBlock);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_57F28;
    v12[3] = &unk_C15B8;
    objc_copyWeak(&v13, &location);
    v9 = (BUCoalescingCallBlock *)objc_msgSend(v8, "initWithNotifyBlock:blockDescription:", v12, CFSTR("BKLibraryImportStatusController zeroing"));
    coalescedZeroing = v2->_coalescedZeroing;
    v2->_coalescedZeroing = v9;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_coalescedZeroing, "setCoalescingDelay:", 30.0);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)startImportOperation
{
  NSObject *iVarQueue;
  void *v4;
  _QWORD block[5];

  iVarQueue = self->_iVarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5812C;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_sync(iVarQueue, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryImportStatusController coalescedStatusChange](self, "coalescedStatusChange"));
  objc_msgSend(v4, "signalWithCompletion:", &stru_C3028);

}

- (void)completeImportOperation
{
  NSObject *iVarQueue;
  void *v4;
  _QWORD block[5];

  iVarQueue = self->_iVarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_581DC;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_sync(iVarQueue, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryImportStatusController coalescedStatusChange](self, "coalescedStatusChange"));
  objc_msgSend(v4, "signalWithCompletion:", &stru_C3048);

}

- (void)failImportOperation
{
  NSObject *iVarQueue;
  void *v4;
  _QWORD block[5];

  iVarQueue = self->_iVarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5828C;
  block[3] = &unk_C1400;
  block[4] = self;
  dispatch_sync(iVarQueue, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryImportStatusController coalescedStatusChange](self, "coalescedStatusChange"));
  objc_msgSend(v4, "signalWithCompletion:", &stru_C3068);

}

- (int64_t)totalImportOperationsProcessed
{
  return self->_totalImportOperationsProcessed;
}

- (void)setTotalImportOperationsProcessed:(int64_t)a3
{
  self->_totalImportOperationsProcessed = a3;
}

- (int64_t)totalImportOperations
{
  return self->_totalImportOperations;
}

- (void)setTotalImportOperations:(int64_t)a3
{
  self->_totalImportOperations = a3;
}

- (int64_t)completedImportOperations
{
  return self->_completedImportOperations;
}

- (void)setCompletedImportOperations:(int64_t)a3
{
  self->_completedImportOperations = a3;
}

- (int64_t)failedImportOperations
{
  return self->_failedImportOperations;
}

- (void)setFailedImportOperations:(int64_t)a3
{
  self->_failedImportOperations = a3;
}

- (int64_t)actualTotalImportOperations
{
  return self->_actualTotalImportOperations;
}

- (void)setActualTotalImportOperations:(int64_t)a3
{
  self->_actualTotalImportOperations = a3;
}

- (int64_t)actualCompletedImportOperations
{
  return self->_actualCompletedImportOperations;
}

- (void)setActualCompletedImportOperations:(int64_t)a3
{
  self->_actualCompletedImportOperations = a3;
}

- (int64_t)actualFailedImportOperations
{
  return self->_actualFailedImportOperations;
}

- (void)setActualFailedImportOperations:(int64_t)a3
{
  self->_actualFailedImportOperations = a3;
}

- (BUCoalescingCallBlock)coalescedStatusChange
{
  return self->_coalescedStatusChange;
}

- (void)setCoalescedStatusChange:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedStatusChange, a3);
}

- (BUCoalescingCallBlock)coalescedZeroing
{
  return self->_coalescedZeroing;
}

- (void)setCoalescedZeroing:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedZeroing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedZeroing, 0);
  objc_storeStrong((id *)&self->_coalescedStatusChange, 0);
  objc_storeStrong((id *)&self->_iVarQueue, 0);
}

@end
