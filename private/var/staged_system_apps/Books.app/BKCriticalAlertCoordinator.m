@implementation BKCriticalAlertCoordinator

- (id)criticalAlertCoordinatorHoldPresentingCriticalAlertAssertion
{
  NSObject *v3;
  BKCriticalAlertAssertion *v4;
  void *v5;
  BKCriticalAlertAssertion *v6;
  _QWORD v8[5];
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[BKCriticalAlertCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009648;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_sync(v3, block);

  v4 = [BKCriticalAlertAssertion alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCriticalAlertCoordinator queue](self, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009E3C;
  v8[3] = &unk_1008E72C0;
  v8[4] = self;
  v6 = -[BKCriticalAlertAssertion initWithQueue:assertionIsInvalidBlock:](v4, "initWithQueue:assertionIsInvalidBlock:", v5, v8);

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)invokeAfterCriticalAlertDismisses:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[BKCriticalAlertCoordinator queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063884;
  block[3] = &unk_1008E75B8;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v13 + 24))
  {
    v6 = objc_retainBlock(v4);
    v7 = v6;
    if (v6)
      (*((void (**)(id))v6 + 2))(v6);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[BKCriticalAlertCoordinator group](self, "group"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001B180C;
    v9[3] = &unk_1008E7818;
    v10 = v4;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, v9);

    v7 = v10;
  }

  _Block_object_dispose(&v12, 8);
}

- (BKCriticalAlertCoordinator)init
{
  BKCriticalAlertCoordinator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  dispatch_group_t v5;
  OS_dispatch_group *group;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKCriticalAlertCoordinator;
  v2 = -[BKCriticalAlertCoordinator init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.iBooks.BKCriticalAlertCoordinator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_group_create();
    group = v2->_group;
    v2->_group = (OS_dispatch_group *)v5;

  }
  return v2;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (BOOL)criticalAlertCoordinatorIsPresentingCriticalAlert
{
  BKCriticalAlertCoordinator *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[BKCriticalAlertCoordinator queue](self, "queue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001B18FC;
  v5[3] = &unk_1008E75B8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (unint64_t)holdCriticalAlertCount
{
  return self->_holdCriticalAlertCount;
}

- (void)setHoldCriticalAlertCount:(unint64_t)a3
{
  self->_holdCriticalAlertCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
