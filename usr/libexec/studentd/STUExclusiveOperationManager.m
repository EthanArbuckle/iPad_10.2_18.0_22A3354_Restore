@implementation STUExclusiveOperationManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B93C;
  block[3] = &unk_1000C9FE0;
  block[4] = a1;
  if (qword_1000FC158 != -1)
    dispatch_once(&qword_1000FC158, block);
  return (id)qword_1000FC150;
}

- (STUExclusiveOperationManager)init
{
  STUExclusiveOperationManager *v2;
  CATOperationQueue *v3;
  NSOperationQueue *mQueue;
  NSMutableSet *v5;
  NSMutableSet *mExclusiveOperations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUExclusiveOperationManager;
  v2 = -[STUExclusiveOperationManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(CATOperationQueue);
    mQueue = v2->mQueue;
    v2->mQueue = (NSOperationQueue *)v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->mQueue, "setMaxConcurrentOperationCount:", 1);
    v5 = objc_opt_new(NSMutableSet);
    mExclusiveOperations = v2->mExclusiveOperations;
    v2->mExclusiveOperations = v5;

  }
  return v2;
}

- (id)requestToMakeOperationExclusive:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUExclusiveOperationManager.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation"));

    if (v9)
      goto LABEL_4;
    goto LABEL_9;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v17 = NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUExclusiveOperationManager.m"), 54, CFSTR("%@ must be called from the main thread"), v18);

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v9)
    goto LABEL_4;
LABEL_9:
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUExclusiveOperationManager.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("successBlock"));

LABEL_4:
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[STUCancellableBlockOperation blockOperationWithBlock:cancellationBlock:](STUCancellableBlockOperation, "blockOperationWithBlock:cancellationBlock:", v9, v10));
  if (-[NSMutableSet count](self->mExclusiveOperations, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->mExclusiveOperations, "allObjects"));
    objc_msgSend(v12, "cat_addDependencies:", v13);

    -[NSMutableSet enumerateObjectsUsingBlock:](self->mExclusiveOperations, "enumerateObjectsUsingBlock:", &stru_1000CA020);
  }
  -[STUExclusiveOperationManager addExclusiveOperation:](self, "addExclusiveOperation:", v11);
  objc_msgSend(v11, "addTarget:selector:forOperationEvents:", self, "exclusiveOperationDidFinish:", 6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->mQueue, "operations"));
  objc_msgSend(v14, "makeObjectsPerformSelector:", "cancel");

  -[NSOperationQueue addOperation:](self->mQueue, "addOperation:", v12);
  return v12;
}

- (void)stopWaitingForOperationToBeExclusive:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSOperationQueue operations](self->mQueue, "operations"));
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if (v5)
    objc_msgSend(v6, "cancel");

}

- (void)exclusiveOperationDidFinish:(id)a3
{
  -[STUExclusiveOperationManager removeExclusiveOperation:](self, "removeExclusiveOperation:", a3);
}

- (NSSet)exclusiveOperations
{
  return (NSSet *)-[NSMutableSet copy](self->mExclusiveOperations, "copy");
}

- (void)addExclusiveOperation:(id)a3
{
  id v3;
  _QWORD v4[4];
  STUExclusiveOperationManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001BCF8;
  v4[3] = &unk_1000C9B00;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[STUExclusiveOperationManager updateExclusiveOperationsWithBlock:](v5, "updateExclusiveOperationsWithBlock:", v4);

}

- (void)removeExclusiveOperation:(id)a3
{
  id v3;
  _QWORD v4[4];
  STUExclusiveOperationManager *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001BD7C;
  v4[3] = &unk_1000C9B00;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[STUExclusiveOperationManager updateExclusiveOperationsWithBlock:](v5, "updateExclusiveOperationsWithBlock:", v4);

}

- (void)updateExclusiveOperationsWithBlock:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[STUExclusiveOperationManager willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("exclusiveOperations"));
  v4[2](v4);

  -[STUExclusiveOperationManager didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("exclusiveOperations"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mExclusiveOperations, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
}

@end
