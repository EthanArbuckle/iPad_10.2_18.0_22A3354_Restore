@implementation CKKSProvideKeySetOperation

- (CKKSProvideKeySetOperation)initWithIntendedZoneIDs:(id)a3
{
  id v5;
  CKKSProvideKeySetOperation *v6;
  CKKSProvideKeySetOperation *v7;
  NSDictionary *keysets;
  uint64_t v9;
  NSOperation *startDependency;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKKSProvideKeySetOperation;
  v6 = -[CKKSGroupOperation init](&v14, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_intendedZoneIDs, a3);
    keysets = v7->_keysets;
    v7->_keysets = 0;

    v9 = objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &stru_1002DCD38));
    startDependency = v7->_startDependency;
    v7->_startDependency = (NSOperation *)v9;

    -[NSOperation setName:](v7->_startDependency, "setName:", CFSTR("key-set-provided"));
    v11 = dispatch_queue_create("key-set-queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    -[CKKSGroupOperation addDependency:](v7, "addDependency:", v7->_startDependency);
  }

  return v7;
}

- (void)provideKeySets:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CKKSProvideKeySetOperation queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B51DC;
  block[3] = &unk_1002E9728;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSDictionary)keysets
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setKeysets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSSet)intendedZoneIDs
{
  return (NSSet *)objc_getProperty(self, a2, 136, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 144, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSOperation)startDependency
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStartDependency:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDependency, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_intendedZoneIDs, 0);
  objc_storeStrong((id *)&self->_keysets, 0);
}

@end
