@implementation GKFriendSuggesterSettingsProvider

- (GKFriendSuggesterSettingsProvider)initWithStoreBag:(id)a3
{
  id v5;
  GKFriendSuggesterSettingsProvider *v6;
  GKFriendSuggesterSettingsProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKFriendSuggesterSettingsProvider;
  v6 = -[GKFriendSuggesterSettingsProvider init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storeBag, a3);

  return v7;
}

- (void)fetchSettingsWithQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[GKFriendSuggesterSettings allBagKeys](GKFriendSuggesterSettings, "allBagKeys"));
  -[GKFriendSuggesterSettingsProvider fetchSettingsWithQueue:valuesForKeys:handler:](self, "fetchSettingsWithQueue:valuesForKeys:handler:", v7, v8, v6);

}

- (void)fetchSettingsWithQueue:(id)a3 valuesForKeys:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKFriendSuggesterSettingsProvider storeBag](self, "storeBag"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100156B54;
  v13[3] = &unk_1002BCC38;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "getValuesForKeys:queue:completion:", v9, v10, v13);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (GKStoreBag)storeBag
{
  return self->_storeBag;
}

- (void)setStoreBag:(id)a3
{
  objc_storeStrong((id *)&self->_storeBag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeBag, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
