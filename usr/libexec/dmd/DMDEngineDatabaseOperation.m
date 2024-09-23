@implementation DMDEngineDatabaseOperation

- (void)dealloc
{
  OS_os_transaction *v3;
  dispatch_time_t v4;
  OS_os_transaction *v5;
  objc_super v6;
  _QWORD block[4];
  OS_os_transaction *v8;

  v3 = self->_transaction;
  v4 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_2;
  block[3] = &unk_1000BA4B0;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)DMDEngineDatabaseOperation;
  -[DMDEngineDatabaseOperation dealloc](&v6, "dealloc");
}

- (DMDEngineDatabaseOperation)init
{
  DMDEngineDatabaseOperation *v2;
  DMDEngineDatabaseOperation *v3;
  id v4;
  uint64_t v5;
  OS_os_transaction *transaction;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMDEngineDatabaseOperation;
  v2 = -[DMDEngineDatabaseOperation init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation description](v2, "description")));
    v5 = os_transaction_create(objc_msgSend(v4, "UTF8String"));
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;

  }
  return v3;
}

- (BOOL)isAsynchronous
{
  return 0;
}

- (void)main
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));

  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEngineDatabaseOperation.m"), 42, CFSTR("A database must be provided to %@"), self);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDEngineDatabaseOperation database](self, "database"));
  v6 = objc_msgSend(v5, "newBackgroundContext");

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003B188;
  v9[3] = &unk_1000B9BA8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v9);

}

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v5 = (objc_class *)objc_opt_class(self);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDEngineDatabaseOperation.m"), 50, CFSTR("%@ must override %@"), v7, v9);

}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
