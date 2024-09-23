@implementation ICLegacyImportManager

+ (id)sharedLegacyImportManager
{
  if (qword_1005DDFB0 != -1)
    dispatch_once(&qword_1005DDFB0, &stru_100554CE8);
  return (id)qword_1005DDFA8;
}

- (ICLegacyImportManager)init
{
  ICLegacyImportManager *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICLegacyImportManager;
  v2 = -[ICLegacyImportManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSOperationQueue);
    -[ICLegacyImportManager setOperationQueue:](v2, "setOperationQueue:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICLegacyImportManager operationQueue](v2, "operationQueue"));
    objc_msgSend(v4, "setName:", CFSTR("com.apple.notes.move-HTML-notes-to-modern-account-queue"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICLegacyImportManager operationQueue](v2, "operationQueue"));
    objc_msgSend(v5, "setMaxConcurrentOperationCount:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICLegacyImportManager operationQueue](v2, "operationQueue"));
    objc_msgSend(v6, "setQualityOfService:", 25);

  }
  return v2;
}

- (void)moveLegacyNotes:(id)a3 toFolder:(id)a4
{
  id v6;
  id v7;
  ICImportLegacyNotesOperation *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  id location;
  uint8_t buf[4];
  ICImportLegacyNotesOperation *v28;

  v6 = a3;
  v7 = a4;
  v8 = -[ICImportLegacyNotesOperation initWithLegacyNotes:destinationFolder:deleteLegacyNotesAfterImport:]([ICImportLegacyNotesOperation alloc], "initWithLegacyNotes:destinationFolder:deleteLegacyNotesAfterImport:", v6, v7, 1);
  objc_initWeak(&location, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Move legacy notes %@"), v8));
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000F607C;
  v18[3] = &unk_100554D10;
  v11 = v9;
  v19 = v11;
  objc_copyWeak(&v21, &location);
  v20 = &v22;
  v12 = objc_msgSend(v10, "beginBackgroundTaskWithName:expirationHandler:", v11, v18);

  v23[3] = (uint64_t)v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000F6180;
  v16[3] = &unk_100554D38;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  v16[5] = &v22;
  -[ICImportLegacyNotesOperation setCompletionBlock:](v8, "setCompletionBlock:", v16);
  v13 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Adding move legacy notes operation: %@", buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICLegacyImportManager operationQueue](self, "operationQueue"));
  objc_msgSend(v14, "addOperation:", v8);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("ICLegacyImportManagerOperationsDidChangeNotification"), self);

  objc_destroyWeak(&v17);
  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&location);
}

- (BOOL)hasPendingOperations
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICLegacyImportManager operationQueue](self, "operationQueue"));
  v3 = objc_msgSend(v2, "operationCount") != 0;

  return v3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
