@implementation ConversationSearchHandler

- (ConversationSearchHandler)init
{
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  dispatch_semaphore_t v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *v20;
  void *v21;
  NSMutableArray *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  id v26;
  NSObject *v27;
  objc_super v29;
  uint8_t buf[4];
  id v31;

  v29.receiver = self;
  v29.super_class = (Class)ConversationSearchHandler;
  v2 = -[ConversationSearchHandler init](&v29, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.mail.conversationsearchHandlerQueue", v6);
    v8 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v7;

    v9 = objc_claimAutoreleasedReturnValue(+[EFScheduler dispatchQueueSchedulerWithQueue:](EFScheduler, "dispatchQueueSchedulerWithQueue:", *((_QWORD *)v2 + 12)));
    v10 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INTERACTIVE, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.mail.conversationsearchManagementQueue", v14);
    v16 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v15;

    v17 = dispatch_semaphore_create(0);
    v18 = (void *)*((_QWORD *)v2 + 18);
    *((_QWORD *)v2 + 18) = v17;

    v19 = 3;
    do
    {
      dispatch_semaphore_signal(*((dispatch_semaphore_t *)v2 + 18));
      --v19;
    }
    while (v19);
    v20 = objc_opt_new(NSMutableArray);
    v21 = (void *)*((_QWORD *)v2 + 19);
    *((_QWORD *)v2 + 19) = v20;

    v22 = objc_opt_new(NSMutableArray);
    v23 = (void *)*((_QWORD *)v2 + 15);
    *((_QWORD *)v2 + 15) = v22;

    *((_QWORD *)v2 + 7) = 0;
    v24 = objc_opt_new(NSMutableArray);
    v25 = (void *)*((_QWORD *)v2 + 20);
    *((_QWORD *)v2 + 20) = v24;

    v26 = sub_100055328();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v31 = v2;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Created handler: %p", buf, 0xCu);
    }

  }
  return (ConversationSearchHandler *)v2;
}

- (void)aggregationContextDidFinish:(id)a3 withLoadingController:(id)a4 successfully:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *managementQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  ConversationSearchHandler *v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (self)
    managementQueue = self->_managementQueue;
  else
    managementQueue = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058360;
  block[3] = &unk_10051A960;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(managementQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchesWaitingForLoadingController, 0);
  objc_storeStrong((id *)&self->_loaderPool, 0);
  objc_storeStrong((id *)&self->_loaderPoolSem, 0);
  objc_storeStrong((id *)&self->_aggregationContexts, 0);
  objc_storeStrong((id *)&self->_allItemIDs, 0);
  objc_storeStrong((id *)&self->_messageProcessingScheduler, 0);
  objc_storeStrong((id *)&self->_messageProcessingQueue, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_searchOptions, 0);
  objc_storeStrong((id *)&self->_resultAggregator, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_highlightedRange, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_comparisonWebView, 0);
  objc_storeStrong((id *)&self->completedItemIndexes, 0);
  objc_storeStrong((id *)&self->resultsPendingCompletion, 0);
}

@end
