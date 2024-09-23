@implementation MTUuidQueryObserver

- (id)addResultsChangedHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = objc_retainBlock(a3);
  v8.receiver = self;
  v8.super_class = (Class)MTUuidQueryObserver;
  v5 = -[MTUuidQueryObserver addResultsChangedHandler:](&v8, "addResultsChangedHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "delegate"));

  if (v4)
    -[MTUuidQueryObserver notifyObservers](self, "notifyObservers");
}

- (void)notifyObservers
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10004672C;
  v18 = sub_100046A0C;
  v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000069A8;
  v13[3] = &unk_1004A97D8;
  v13[4] = &v14;
  -[MTUuidQueryObserver results:](self, "results:", v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTUuidQueryObserver uuidOrder](self, "uuidOrder"));
  v4 = objc_alloc((Class)NSSet);
  v5 = objc_msgSend(v4, "initWithArray:", v15[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTUuidQueryObserver uuidSet](self, "uuidSet"));
  v7 = objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "minusSet:", v5);
  v8 = objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v8, "minusSet:", v6);
  -[MTUuidQueryObserver setUuidSet:](self, "setUuidSet:", v5);
  -[MTUuidQueryObserver setUuidOrder:](self, "setUuidOrder:", v15[5]);
  if (objc_msgSend(v7, "count")
    || objc_msgSend(v8, "count")
    || (objc_msgSend(v3, "isEqual:", v15[5]) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTUuidQueryObserver handlers](self, "handlers"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100023658;
    v10[3] = &unk_1004A9800;
    v11 = v7;
    v12 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  _Block_object_dispose(&v14, 8);

}

- (NSSet)uuidSet
{
  return self->_uuidSet;
}

- (NSArray)uuidOrder
{
  return self->_uuidOrder;
}

- (void)setUuidSet:(id)a3
{
  objc_storeStrong((id *)&self->_uuidSet, a3);
}

- (void)setUuidOrder:(id)a3
{
  objc_storeStrong((id *)&self->_uuidOrder, a3);
}

- (void)startObserving
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTUuidQueryObserver;
  -[MTUuidQueryObserver startObserving](&v3, "startObserving");
  -[MTUuidQueryObserver notifyObservers](self, "notifyObservers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOrder, 0);
  objc_storeStrong((id *)&self->_uuidSet, 0);
}

@end
