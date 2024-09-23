@implementation MFUserSyncStakeholder

- (MFUserSyncStakeholder)init
{
  MFUserSyncStakeholder *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  MFUserSyncStakeholder *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFUserSyncStakeholder;
  v2 = -[MFUserSyncStakeholder init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentUser"));
    v5 = objc_msgSend(v4, "uid");
    v2->_runningInSyncBubble = v5 != getuid();

    if (v2->_runningInSyncBubble)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFProcessTransaction transactionWithDescription:](EFProcessTransaction, "transactionWithDescription:", CFSTR("com.apple.mail.stakeholder-initialization")));
      +[MailAccount reloadAccounts](MailAccount, "reloadAccounts");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance"));
      objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_networkConfigurationChanged:", NetworkConfigurationDidChangeNotification, v8);

      objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_processingDidStart:", CFSTR("MFDeliveryQueueProcessingStartedNotification"), 0);
      objc_msgSend(v7, "addObserver:selector:name:object:", v2, "_processingDidFinish:", CFSTR("MFDeliveryQueueProcessingFinishedNotification"), 0);

    }
    v9 = v2;
  }

  return v2;
}

+ (id)sharedStakeholder
{
  if (qword_10001EBC0 != -1)
    dispatch_once(&qword_10001EBC0, &stru_100018B58);
  return (id)qword_10001EBB8;
}

- (void)createAndStartTask
{
  UMUserSyncTask *v3;
  UMUserSyncTask *task;
  void *v6;

  if (self->_task)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFUserSyncStakeholder.m"), 70, CFSTR("task already exists!"));

  }
  v3 = (UMUserSyncTask *)objc_claimAutoreleasedReturnValue(+[UMUserSyncTask taskWithName:reason:forBundleID:](UMUserSyncTask, "taskWithName:reason:forBundleID:", CFSTR("mail delivery"), CFSTR("client requested"), kMFMobileMailBundleIdentifier));
  task = self->_task;
  self->_task = v3;

  -[UMUserSyncTask begin](self->_task, "begin");
}

- (void)endTask
{
  UMUserSyncTask *task;

  -[UMUserSyncTask end](self->_task, "end");
  task = self->_task;
  self->_task = 0;

}

- (void)uploadContent
{
  uint64_t v2;
  NSObject *v3;
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (self->_task)
  {
    v2 = MFLogGeneral(self);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[MFUserSyncStakeholder uploadContent]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: task already exists", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue sharedDeliveryQueue](MFDeliveryQueue, "sharedDeliveryQueue"));
    v5 = -[NSObject numberOfPendingMessages](v3, "numberOfPendingMessages");
    v6 = v5;
    if (v5)
    {
      v7 = MFLogGeneral(v5);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 136315394;
        v12 = "-[MFUserSyncStakeholder uploadContent]";
        v13 = 2048;
        v14 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: creating sync task for %lu messages", (uint8_t *)&v11, 0x16u);
      }

      -[MFUserSyncStakeholder createAndStartTask](self, "createAndStartTask");
      v9 = objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue sharedDeliveryQueue](MFDeliveryQueue, "sharedDeliveryQueue"));
      -[NSObject processQueueAndPlaySoundOnSuccess:forceAll:](v9, "processQueueAndPlaySoundOnSuccess:forceAll:", 0, 1);
    }
    else
    {
      v10 = MFLogGeneral(0);
      v9 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 136315138;
        v12 = "-[MFUserSyncStakeholder uploadContent]";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: no pending messages found", (uint8_t *)&v11, 0xCu);
      }
    }

  }
}

- (void)willSwitchUser
{
  void *v3;
  id v4;

  if (!self->_runningInSyncBubble)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue sharedDeliveryQueue](MFDeliveryQueue, "sharedDeliveryQueue"));
    if ((objc_msgSend(v4, "isBusy") & 1) != 0 || objc_msgSend(v4, "numberOfPendingMessages"))
    {
      -[MFUserSyncStakeholder createAndStartTask](self, "createAndStartTask");
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
      objc_msgSend(v3, "unregisterStakeHolder:status:reason:", self, 0, CFSTR("willSwitchUser"));

    }
  }
}

- (void)printDeliveryQueue
{
  id v2;
  id v3;
  id v4;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue sharedDeliveryQueue](MFDeliveryQueue, "sharedDeliveryQueue"));
  v2 = objc_msgSend(v3, "copyDiagnosticInformation");

  v4 = objc_retainAutorelease(v2);
  puts((const char *)objc_msgSend(v4, "UTF8String"));

}

- (void)processQueueAndExit
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MFDeliveryQueue sharedDeliveryQueue](MFDeliveryQueue, "sharedDeliveryQueue"));
  if (!objc_msgSend(v3, "numberOfPendingMessages"))
    exit(0);
  self->_exitWhenDone = 1;
  -[MFUserSyncStakeholder uploadContent](self, "uploadContent");

}

- (void)_networkConfigurationChanged:(id)a3
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance", a3));
  v4 = MFLogGeneral(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v3, "isNetworkUp");
    v7 = CFSTR("NO");
    if (v6)
      v7 = CFSTR("YES");
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#Network network %@", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_processingDidStart:(id)a3
{
  EFProcessTransaction *v4;
  EFProcessTransaction *transaction;

  v4 = (EFProcessTransaction *)objc_claimAutoreleasedReturnValue(+[EFProcessTransaction transactionWithDescription:](EFProcessTransaction, "transactionWithDescription:", CFSTR("com.apple.mail.stakeholder-processing")));
  transaction = self->_transaction;
  self->_transaction = v4;

}

- (void)_processingDidFinish:(id)a3
{
  EFProcessTransaction *transaction;
  id v5;

  v5 = a3;
  -[MFUserSyncStakeholder endTask](self, "endTask");
  -[EFProcessTransaction invalidate](self->_transaction, "invalidate");
  transaction = self->_transaction;
  self->_transaction = 0;

  if (self->_exitWhenDone)
    exit(0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
