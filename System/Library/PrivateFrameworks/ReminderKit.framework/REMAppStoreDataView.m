@implementation REMAppStoreDataView

- (REMAppStoreDataView)initWithStore:(id)a3
{
  id v5;
  REMAppStoreDataView *v6;
  REMAppStoreDataView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAppStoreDataView;
  v6 = -[REMAppStoreDataView init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (id)fetchCreatedOrCompletedRemindersCountFromDate:(id)a3 toDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = -[REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount initWithFromDate:toDate:]([REMAppStoreDataViewInvocation_fetchCreatedOrCompletedRemindersCount alloc], "initWithFromDate:toDate:", v8, v9);
    -[REMAppStoreDataView store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resultFromPerformingInvocation:error:", v11, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_opt_class();
    objc_msgSend(v13, "storedPropertyForKey:", CFSTR("CreatedOrCompletedRemindersLastMonthCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    REMDynamicCast(v14, (uint64_t)v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && !v16 && !*a5)
    {
      +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Failed to fetch created/completed reminders count"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a5 && !*a5)
  {
    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Non-nil fromDate and toDate required for fetchCreatedOrCompletedRemindersCountFromDate:toDate:error:"));
    v16 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)fetchAppStoreCloudConfigurationPropertiesWithError:(id *)a3
{
  REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _REMAppStoreReviewCloudConfigurationStorage *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _REMAppStoreReviewCloudConfigurationStorage *v20;

  v5 = objc_alloc_init(REMAppStoreDataViewInvocation_fetchICCloudConfigurationProperties);
  -[REMAppStoreDataView store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultFromPerformingInvocation:error:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  REMDynamicCast(v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "createdOrCompletedRemindersCountThreshold"))
  {
    v10 = [_REMAppStoreReviewCloudConfigurationStorage alloc];
    v11 = objc_msgSend(v9, "createdOrCompletedRemindersCountThreshold");
    v12 = objc_msgSend(v9, "numberOfForegroundsThreshold");
    objc_msgSend(v9, "timeIntervalOfInterest");
    v14 = v13;
    objc_msgSend(v9, "timeIntervalSinceInitialForeground");
    v16 = v15;
    objc_msgSend(v9, "timeIntervalSinceLastFetch");
    v18 = v17;
    objc_msgSend(v9, "timeIntervalSinceLastPrompt");
    v20 = -[_REMAppStoreReviewCloudConfigurationStorage initWithCreatedOrCompletedRemindersCountThreshold:numberOfForegroundsThreshold:timeIntervalOfInterest:timeIntervalSinceInitialForeground:timeIntervalSinceLastFetch:timeIntervalSinceLastPrompt:](v10, "initWithCreatedOrCompletedRemindersCountThreshold:numberOfForegroundsThreshold:timeIntervalOfInterest:timeIntervalSinceInitialForeground:timeIntervalSinceLastFetch:timeIntervalSinceLastPrompt:", v11, v12, v14, v16, v18, v19);
  }
  else if (a3 && !*a3)
  {
    +[REMError internalErrorWithDebugDescription:](REMError, "internalErrorWithDebugDescription:", CFSTR("Failed to fetch REMAppStoreReviewCloudConfiguration properties"));
    v20 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (REMStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
