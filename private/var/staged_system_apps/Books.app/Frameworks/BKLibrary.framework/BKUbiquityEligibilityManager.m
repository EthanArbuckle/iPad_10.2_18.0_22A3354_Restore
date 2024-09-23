@implementation BKUbiquityEligibilityManager

- (BKUbiquityEligibilityManager)initWithQuotaFetcher:(id)a3 eligibleBooksProvider:(id)a4 ubiquityStatusMonitor:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKUbiquityEligibilityManager *v12;
  BKUbiquityEligibilityManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BKUbiquityEligibilityManager;
  v12 = -[BKUbiquityEligibilityManager init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_quotaFetcher, a3);
    objc_storeStrong((id *)&v13->_eligibleBooksProvider, a4);
    objc_storeStrong((id *)&v13->_ubiquityStatusMonitor, a5);
    -[IMUbiquityStatusMonitor addObserver:](v13->_ubiquityStatusMonitor, "addObserver:", v13);
  }

  return v13;
}

- (void)determineCloudEligibility:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  NSObject *v14;
  id v15;
  id v16;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKUbiquityEligibilityManager.m", 64, "-[BKUbiquityEligibilityManager determineCloudEligibility:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v5 = objc_claimAutoreleasedReturnValue(-[BKUbiquityEligibilityManager eligibleBooksProvider](self, "eligibleBooksProvider"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityEligibilityManager quotaFetcher](self, "quotaFetcher")),
        v7,
        v6,
        v7))
  {
    kdebug_trace(725352652, 0, 0, 0, 0);
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityEligibilityManager mq_setupAndStartQueryWithGroup:](self, "mq_setupAndStartQueryWithGroup:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityEligibilityManager eligibleBooksProvider](self, "eligibleBooksProvider"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_6DE4;
    v13[3] = &unk_C1370;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v4;
    v11 = v9;
    v12 = v8;
    objc_msgSend(v10, "fetchAllLocalBooksEligibleToBeMadeUbiquitousWithCompletion:", v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0, 0, 0);
  }

}

- (id)mq_setupAndStartQueryWithGroup:(id)a3
{
  NSObject *v4;
  NSMetadataQuery *v5;
  OS_dispatch_group *v6;
  OS_dispatch_group *documentsURLBecomesAvailable;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  NSObject *v11;
  NSMetadataQuery *v12;
  NSMetadataQuery *v13;
  NSMetadataQuery *v14;
  _QWORD v16[5];
  NSMetadataQuery *v17;
  uint8_t buf[4];
  const __CFString *v19;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKUbiquityEligibilityManager.m", 255, "-[BKUbiquityEligibilityManager mq_setupAndStartQueryWithGroup:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v5 = objc_opt_new(NSMetadataQuery);
  dispatch_group_enter(v4);
  if (v4)
    objc_setAssociatedObject(v5, off_DCC10, v4, (char *)&dword_0 + 1);
  v6 = (OS_dispatch_group *)dispatch_group_create();
  documentsURLBecomesAvailable = self->_documentsURLBecomesAvailable;
  self->_documentsURLBecomesAvailable = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKUbiquityEligibilityManager ubiquityStatusMonitor](self, "ubiquityStatusMonitor"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "documentsURL"));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("nil");
    if (v9)
      v10 = v9;
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Current documentsURL = %@", buf, 0xCu);
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "documentsURL is nil. Waiting for ubiquityStatusMonitor to notify us when it comes back.", buf, 2u);
    }
    dispatch_group_enter((dispatch_group_t)self->_documentsURLBecomesAvailable);
  }
  v11 = self->_documentsURLBecomesAvailable;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_7778;
  v16[3] = &unk_C12F8;
  v16[4] = self;
  v12 = v5;
  v17 = v12;
  dispatch_group_notify(v11, (dispatch_queue_t)&_dispatch_main_q, v16);
  v13 = v17;
  v14 = v12;

  return v14;
}

- (void)mq_tearDownQuery:(id)a3
{
  void *v4;
  void *v5;
  id object;

  object = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKUbiquityEligibilityManager.m", 295, "-[BKUbiquityEligibilityManager mq_tearDownQuery:]", "[NSThread isMainThread]", CFSTR("This operation must only be performed on the main thread!"));
  v4 = object;
  if (object)
  {
    objc_setAssociatedObject(object, off_DCC10, 0, (char *)&dword_0 + 1);
    objc_msgSend(object, "stopQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, NSMetadataQueryDidFinishGatheringNotification, object);

    v4 = object;
  }

}

- (void)mq_queryDidFinish:(id)a3
{
  id AssociatedObject;
  NSObject *v5;
  NSObject *v6;
  id object;

  object = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  objc_msgSend(object, "disableUpdates");
  -[BKUbiquityEligibilityManager setNumberOfItemsIniCloud:](self, "setNumberOfItemsIniCloud:", objc_msgSend(object, "resultCount"));
  objc_msgSend(object, "enableUpdates");
  AssociatedObject = objc_getAssociatedObject(object, off_DCC10);
  v5 = objc_claimAutoreleasedReturnValue(AssociatedObject);
  v6 = v5;
  if (v5)
    dispatch_group_leave(v5);

}

- (void)ubiquityDocumentsURLChanged:(id)a3
{
  __CFString *v4;
  const __CFString *v5;
  NSObject *documentsURLBecomesAvailable;
  int v7;
  const __CFString *v8;

  v4 = (__CFString *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("nil");
    if (v4)
      v5 = v4;
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ubiquityDocumentsURLChanged to %@", (uint8_t *)&v7, 0xCu);
  }
  documentsURLBecomesAvailable = self->_documentsURLBecomesAvailable;
  if (documentsURLBecomesAvailable)
    dispatch_group_leave(documentsURLBecomesAvailable);

}

- (IMUbiquityQuotaFetcher)quotaFetcher
{
  return self->_quotaFetcher;
}

- (void)setQuotaFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_quotaFetcher, a3);
}

- (BKUbiquityEligibleBooksProviding)eligibleBooksProvider
{
  return self->_eligibleBooksProvider;
}

- (void)setEligibleBooksProvider:(id)a3
{
  objc_storeStrong((id *)&self->_eligibleBooksProvider, a3);
}

- (IMUbiquityStatusMonitor)ubiquityStatusMonitor
{
  return self->_ubiquityStatusMonitor;
}

- (void)setUbiquityStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, a3);
}

- (unint64_t)numberOfItemsIniCloud
{
  return self->_numberOfItemsIniCloud;
}

- (void)setNumberOfItemsIniCloud:(unint64_t)a3
{
  self->_numberOfItemsIniCloud = a3;
}

- (OS_dispatch_group)documentsURLBecomesAvailable
{
  return self->_documentsURLBecomesAvailable;
}

- (void)setDocumentsURLBecomesAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_documentsURLBecomesAvailable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentsURLBecomesAvailable, 0);
  objc_storeStrong((id *)&self->_ubiquityStatusMonitor, 0);
  objc_storeStrong((id *)&self->_eligibleBooksProvider, 0);
  objc_storeStrong((id *)&self->_quotaFetcher, 0);
}

@end
