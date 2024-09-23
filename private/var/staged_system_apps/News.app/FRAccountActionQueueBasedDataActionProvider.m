@implementation FRAccountActionQueueBasedDataActionProvider

- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081880();
  if (!-[FRAccountActionQueueBasedDataActionProvider destructiveHasBeenConsumed](self, "destructiveHasBeenConsumed")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000817D0();
  }
  if (-[FRAccountActionQueueBasedDataActionProvider nonDestructiveHaveBeenConsumed](self, "nonDestructiveHaveBeenConsumed")&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100081720();
  }
  -[FRAccountActionQueueBasedDataActionProvider _consumeActionsUpToActionPassingTest:withBlock:](self, "_consumeActionsUpToActionPassingTest:withBlock:", &stru_1000DDD20, v4);
  -[FRAccountActionQueueBasedDataActionProvider setNonDestructiveHaveBeenConsumed:](self, "setNonDestructiveHaveBeenConsumed:", 1);

}

- (void)consumeActionsUpToDestructiveActionSyncWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081664();
  if (-[FRAccountActionQueueBasedDataActionProvider destructiveHasBeenConsumed](self, "destructiveHasBeenConsumed")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000815B4();
  }
  if (-[FRAccountActionQueueBasedDataActionProvider nonDestructiveHaveBeenConsumed](self, "nonDestructiveHaveBeenConsumed")&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100081504();
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000186B4;
  v6[3] = &unk_1000DDD00;
  v7 = v4;
  v5 = v4;
  -[FRAccountActionQueueBasedDataActionProvider _consumeActionsUpToActionPassingTest:withBlock:](self, "_consumeActionsUpToActionPassingTest:withBlock:", &stru_1000DDCD8, v6);
  -[FRAccountActionQueueBasedDataActionProvider setDestructiveHasBeenConsumed:](self, "setDestructiveHasBeenConsumed:", 1);

}

- (FRAccountActionQueueBasedDataActionProvider)init
{
  FRAccountActionQueueBasedDataActionProvider *v2;
  id v3;
  uint64_t v4;
  void *v5;
  FCAccountActionQueue *v6;
  FCAccountActionQueue *accountActionQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FRAccountActionQueueBasedDataActionProvider;
  v2 = -[FRAccountActionQueueBasedDataActionProvider init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)FCAccountActionQueue);
    v4 = FCURLForAccountActionQueue();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (FCAccountActionQueue *)objc_msgSend(v3, "initWithFileURL:", v5);
    accountActionQueue = v2->_accountActionQueue;
    v2->_accountActionQueue = v6;

  }
  return v2;
}

- (void)_consumeActionsUpToActionPassingTest:(id)a3 withBlock:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char *v12;
  char *v13;
  void *v14;
  id v15;
  void *v16;
  void (*v17)(_QWORD *, void *, _QWORD *);
  id v18;
  _QWORD v19[4];
  id v20;
  char *v21;
  _QWORD v22[4];
  id v23;

  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100081AA8();
    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000819EC();
LABEL_6:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRAccountActionQueueBasedDataActionProvider accountActionQueue](self, "accountActionQueue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peekAtActionTypes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v9));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100063AFC;
  v22[3] = &unk_1000DDD48;
  v23 = v6;
  v11 = v6;
  v12 = (char *)objc_msgSend(v10, "indexOfObjectWithOptions:passingTest:", 2, v22);
  if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL)
    v13 = 0;
  else
    v13 = v12 + 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fc_subarrayUpToCountInclusive:", v13));
  v15 = FRPrivateDataActionsForDataclassActionTypes(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100018708;
  v19[3] = &unk_1000DDD70;
  v20 = v8;
  v21 = v13;
  v17 = (void (*)(_QWORD *, void *, _QWORD *))v7[2];
  v18 = v8;
  v17(v7, v16, v19);

}

- (FCAccountActionQueue)accountActionQueue
{
  return self->_accountActionQueue;
}

- (void)setNonDestructiveHaveBeenConsumed:(BOOL)a3
{
  self->_nonDestructiveHaveBeenConsumed = a3;
}

- (void)setDestructiveHasBeenConsumed:(BOOL)a3
{
  self->_destructiveHasBeenConsumed = a3;
}

- (BOOL)nonDestructiveHaveBeenConsumed
{
  return self->_nonDestructiveHaveBeenConsumed;
}

- (BOOL)destructiveHasBeenConsumed
{
  return self->_destructiveHasBeenConsumed;
}

- (void)dealloc
{
  objc_super v3;

  if ((!-[FRAccountActionQueueBasedDataActionProvider destructiveHasBeenConsumed](self, "destructiveHasBeenConsumed")
     || !-[FRAccountActionQueueBasedDataActionProvider nonDestructiveHaveBeenConsumed](self, "nonDestructiveHaveBeenConsumed"))&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10008193C();
  }
  v3.receiver = self;
  v3.super_class = (Class)FRAccountActionQueueBasedDataActionProvider;
  -[FRAccountActionQueueBasedDataActionProvider dealloc](&v3, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountActionQueue, 0);
}

- (void)setAccountActionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountActionQueue, a3);
}

@end
