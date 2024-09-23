@implementation ParkedCarItemSource

- (ParkedCarItemSource)init
{
  ParkedCarItemSource *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *lockQueue;
  void *v7;
  void *v8;
  ParkedCarPersonalizedItem *v9;
  void *v10;
  ParkedCarItemSource *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ParkedCarItemSource;
  v2 = -[ParkedCarItemSource init](&v13, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("ParkedCarItemSource.lock", v4);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parkedCar"));

    if (v8)
    {
      v9 = -[ParkedCarPersonalizedItem initWithParkedCar:]([ParkedCarPersonalizedItem alloc], "initWithParkedCar:", v8);
      -[ParkedCarItemSource assignItem:](v2, "assignItem:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
    objc_msgSend(v10, "addParkedCarObserver:", v2);

    v11 = v2;
  }

  return v2;
}

- (void)assignItem:(id)a3
{
  id v4;
  NSObject *lockQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A8947C;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(lockQueue, block);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
  objc_msgSend(v3, "removeParkedCarObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ParkedCarItemSource;
  -[ParkedCarItemSource dealloc](&v4, "dealloc");
}

- (id)allItems
{
  NSObject *lockQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100A895AC;
  v10 = sub_100A895BC;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A895C4;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)parkedCarManager:(id)a3 didRemoveParkedCar:(id)a4
{
  -[ParkedCarItemSource assignItem:](self, "assignItem:", 0, a4);
  -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");
}

- (void)parkedCarManager:(id)a3 didAddParkedCar:(id)a4
{
  id v5;
  ParkedCarPersonalizedItem *v6;

  v5 = a4;
  v6 = -[ParkedCarPersonalizedItem initWithParkedCar:]([ParkedCarPersonalizedItem alloc], "initWithParkedCar:", v5);

  -[ParkedCarItemSource assignItem:](self, "assignItem:", v6);
  -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");

}

- (void)parkedCarManager:(id)a3 didUpdateParkedCar:(id)a4
{
  id v6;
  id v7;
  NSObject *lockQueue;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  ParkedCarPersonalizedItem *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_100A895AC;
  v21 = sub_100A895BC;
  v22 = 0;
  lockQueue = self->_lockQueue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100A89874;
  v16[3] = &unk_1011ADF48;
  v16[4] = self;
  v16[5] = &v17;
  dispatch_sync(lockQueue, v16);
  if (!v18[5]
    || (objc_msgSend(v7, "coordinate"),
        v10 = v9,
        v12 = v11,
        objc_msgSend((id)v18[5], "coordinate"),
        vabdd_f64(v10, v14) >= 0.00000000999999994)
    || vabdd_f64(v12, v13) >= 0.00000000999999994)
  {
    v15 = -[ParkedCarPersonalizedItem initWithParkedCar:]([ParkedCarPersonalizedItem alloc], "initWithParkedCar:", v7);
    -[ParkedCarItemSource assignItem:](self, "assignItem:", v15);
    -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");

  }
  _Block_object_dispose(&v17, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end
