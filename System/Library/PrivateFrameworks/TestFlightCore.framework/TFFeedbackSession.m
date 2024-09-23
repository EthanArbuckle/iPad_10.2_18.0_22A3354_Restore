@implementation TFFeedbackSession

- (id)initForContext:(unint64_t)a3 betaApplicationIdentifier:(id)a4
{
  id v6;
  TFFeedbackSession *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackSession;
  v7 = -[TFFeedbackSession init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    -[TFFeedbackSession commonInitWithContext:](v7, "commonInitWithContext:", a3);
  }

  return v7;
}

- (id)initForContext:(unint64_t)a3 betaApplicationLoadableBundleURL:(id)a4
{
  id v6;
  TFFeedbackSession *v7;
  uint64_t v8;
  NSURL *bundleURL;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  TFFeedbackSession *v13;
  objc_super v15;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TFFeedbackSession;
  v7 = -[TFFeedbackSession init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bundleURL = v7->_bundleURL;
    v7->_bundleURL = (NSURL *)v8;

    +[TFBundle bundleIdentifierForBundleURL:](TFBundle, "bundleIdentifierForBundleURL:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v11;

    if (!v7->_bundleIdentifier)
    {
      v13 = 0;
      goto LABEL_6;
    }
    -[TFFeedbackSession commonInitWithContext:](v7, "commonInitWithContext:", a3);
  }
  v13 = v7;
LABEL_6:

  return v13;
}

- (id)initForContext:(unint64_t)a3 withTestingWithLaunchInfo:(id)a4
{
  id v7;
  TFFeedbackSession *v8;
  TFFeedbackSession *v9;
  void *v10;
  uint64_t v11;
  NSURL *bundleURL;
  void *v13;
  uint64_t v14;
  NSString *bundleIdentifier;
  objc_super v17;

  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TFFeedbackSession;
  v8 = -[TFFeedbackSession init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_launchInfo, a4);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleURL");
    v11 = objc_claimAutoreleasedReturnValue();
    bundleURL = v9->_bundleURL;
    v9->_bundleURL = (NSURL *)v11;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v14;

    -[TFFeedbackSession commonInitWithContext:](v9, "commonInitWithContext:", a3);
  }

  return v9;
}

- (void)commonInitWithContext:(unint64_t)a3
{
  NSString *v4;
  NSString *logKey;
  TFFeedbackDataContainer *v6;
  TFFeedbackDataContainer *dataContainer;
  TFDataAggregator *v8;
  TFDataAggregator *aggregator;
  ASDTFFeedbackSubmissionService *v10;
  TFFeedbackSubmissionService *submissionService;

  self->_context = a3;
  AMSGenerateLogCorrelationKey();
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  logKey = self->_logKey;
  self->_logKey = v4;

  *(_WORD *)&self->_didSnapshot = 0;
  self->_currentPhase = 0;
  v6 = -[TFFeedbackDataContainer initWithName:]([TFFeedbackDataContainer alloc], "initWithName:", CFSTR("main"));
  dataContainer = self->_dataContainer;
  self->_dataContainer = v6;

  v8 = -[TFDataAggregator initWithSessionDataContainer:]([TFDataAggregator alloc], "initWithSessionDataContainer:", self->_dataContainer);
  aggregator = self->_aggregator;
  self->_aggregator = v8;

  -[TFDataAggregator setDelegate:](self->_aggregator, "setDelegate:", self);
  v10 = objc_alloc_init(ASDTFFeedbackSubmissionService);
  submissionService = self->_submissionService;
  self->_submissionService = (TFFeedbackSubmissionService *)v10;

  objc_storeWeak((id *)&self->_activeFormViewController, 0);
}

- (void)initiateFeedbackSnapshot
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] initiateFeedbackSnapshot", (uint8_t *)&v11, 0x20u);

  }
  -[TFFeedbackSession setDidSnapshot:](self, "setDidSnapshot:", 1);
  +[TFDataAggregationTask snapshotTasksForSession:](TFDataAggregationTask, "snapshotTasksForSession:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackSession aggregator](self, "aggregator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "runTasks:", v9);

}

- (void)associateIncidentId:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v16 = v7;
    v17 = 2114;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateIncidentId incidentId=%{public}@", buf, 0x2Au);

  }
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__TFFeedbackSession_associateIncidentId___block_invoke;
  v13[3] = &unk_24D794648;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "performBatchUpdates:", v13);

}

uint64_t __41__TFFeedbackSession_associateIncidentId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStringForIdentifier:toValue:", CFSTR("d"), *(_QWORD *)(a1 + 32));
}

- (void)associateScreenshotImages:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v7;
    v17 = 2114;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateScreenshotImages", buf, 0x20u);

  }
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__TFFeedbackSession_associateScreenshotImages___block_invoke;
  v13[3] = &unk_24D794648;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "performBatchUpdates:", v13);

}

uint64_t __47__TFFeedbackSession_associateScreenshotImages___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setImageCollectionForIdentifier:toValue:", CFSTR("c"), *(_QWORD *)(a1 + 32));
}

- (void)associateComments:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v16 = v7;
    v17 = 2114;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateComments comments=%{public}@", buf, 0x2Au);

  }
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __39__TFFeedbackSession_associateComments___block_invoke;
  v13[3] = &unk_24D794648;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "performBatchUpdates:", v13);

}

uint64_t __39__TFFeedbackSession_associateComments___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStringForIdentifier:toValue:", CFSTR("b"), *(_QWORD *)(a1 + 32));
}

- (void)associateEmail:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v7;
    v17 = 2114;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateEmail", buf, 0x20u);

  }
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __36__TFFeedbackSession_associateEmail___block_invoke;
  v13[3] = &unk_24D794648;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "performBatchUpdates:", v13);

}

uint64_t __36__TFFeedbackSession_associateEmail___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStringForIdentifier:toValue:", CFSTR("a"), *(_QWORD *)(a1 + 32));
}

- (id)createFeedbackViewControllerForCurrentState
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  TFFeedbackFormPresenter *v20;
  void *v21;
  TFFeedbackFormPresenter *v22;
  TFFeedbackFormViewController *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v5;
    v27 = 2114;
    v28 = v7;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] createFeedbackViewControllerForCurrentState", (uint8_t *)&v25, 0x20u);

  }
  if (!-[TFFeedbackSession didSnapshot](self, "didSnapshot"))
    -[TFFeedbackSession initiateFeedbackSnapshot](self, "initiateFeedbackSnapshot");
  +[TFDataAggregationTask anytimeTasksForSession:](TFDataAggregationTask, "anytimeTasksForSession:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackSession aggregator](self, "aggregator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "runTasks:", v9);

  -[TFFeedbackSession _generateFormForCurrentState](self, "_generateFormForCurrentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prepareInitialValuesForForm:", v11);

  -[TFFeedbackSession activeFormViewController](self, "activeFormViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "generatedLogger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackSession logKey](self, "logKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v16;
      v27 = 2114;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_2174E1000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Error - createFeedbackViewControllerForCurrentState is called when earlier view controller is still in alive. Deallocate earlier view controller.", (uint8_t *)&v25, 0x20u);

    }
  }
  -[TFFeedbackSession setCurrentPhase:](self, "setCurrentPhase:", 0);
  v20 = [TFFeedbackFormPresenter alloc];
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TFFeedbackFormPresenter initWithForm:dataContainer:session:](v20, "initWithForm:dataContainer:session:", v11, v21, self);

  v23 = -[TFFeedbackFormViewController initWithPresenter:]([TFFeedbackFormViewController alloc], "initWithPresenter:", v22);
  -[TFFeedbackFormPresenter setPresenterView:](v22, "setPresenterView:", v23);
  -[TFFeedbackSession setActiveFormViewController:](self, "setActiveFormViewController:", v23);

  return v23;
}

- (void)submitCrashFeedback
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] submitCrashFeedback", (uint8_t *)&v12, 0x20u);

  }
  v9 = -[TFFeedbackSession _associatePrefilledEmailIfNeeded](self, "_associatePrefilledEmailIfNeeded");
  if (!-[TFFeedbackSession didSnapshot](self, "didSnapshot"))
    -[TFFeedbackSession initiateFeedbackSnapshot](self, "initiateFeedbackSnapshot");
  +[TFDataAggregationTask anytimeTasksForSession:](TFDataAggregationTask, "anytimeTasksForSession:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackSession aggregator](self, "aggregator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "runTasks:", v10);

  -[TFFeedbackSession setCurrentPhase:](self, "setCurrentPhase:", 0);
  -[TFFeedbackSession _beginFeedbackSubmisionForViewController:](self, "_beginFeedbackSubmisionForViewController:", 0);

}

- (void)submitFeedbackForActiveFormViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v5;
    v18 = 2114;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] submitFeedbackForActiveFormViewController", (uint8_t *)&v16, 0x20u);

  }
  -[TFFeedbackSession activeFormViewController](self, "activeFormViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TFFeedbackSession activeFormViewController](self, "activeFormViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession _beginFeedbackSubmisionForViewController:](self, "_beginFeedbackSubmisionForViewController:", v10);
  }
  else
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generatedLogger");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackSession logKey](self, "logKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v12;
      v18 = 2114;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_2174E1000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] submitFeedbackForActiveFormViewController called when there was no active UI.", (uint8_t *)&v16, 0x20u);

    }
  }

}

- (void)cancelFeedbackForActiveFormViewController
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v5;
    v18 = 2114;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_2174E1000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] cancelFeedbackForActiveFormViewController", (uint8_t *)&v16, 0x20u);

  }
  -[TFFeedbackSession setCurrentPhase:](self, "setCurrentPhase:", 0);
  -[TFFeedbackSession delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  -[TFFeedbackSession delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v11, "sessionDidCancelFeedback:", self);
  }
  else
  {
    v13 = objc_opt_respondsToSelector();

    -[TFFeedbackSession delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v13 & 1) != 0)
    {
      -[TFFeedbackSession activeFormViewController](self, "activeFormViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session:didCancelFeedbackFromViewController:", self, v14);
    }
    else
    {
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) == 0)
        return;
      -[TFFeedbackSession delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackSession activeFormViewController](self, "activeFormViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "session:didSubmitFeedbackFromViewController:", self, v14);
    }

  }
}

- (id)_developerName
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDC1540]);
  -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v13);
  v6 = v13;

  if (!v5)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generatedLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2174E1000, v8, OS_LOG_TYPE_ERROR, "Failed to load application record for %@: %@", buf, 0x16u);

    }
  }
  objc_msgSend(v5, "iTunesMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "artistName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_associatePrefilledEmailIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[TFFeedbackSession launchInfo](self, "launchInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "testerEmail");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (__CFString *)v4;
  else
    v6 = &stru_24D795FA8;
  v7 = v6;

  objc_msgSend(MEMORY[0x24BE04600], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getEmailAddressForBundleID:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = &stru_24D795FA8;
  v13 = v12;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v26[0] = v7;
  v26[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v19 && objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "length"))
        {
          -[TFFeedbackSession associateEmail:](self, "associateEmail:", v19);
          v20 = v19;
          goto LABEL_18;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v16)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (id)_generateFormForCurrentState
{
  TFFeedbackFormBuilder *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;

  v3 = objc_alloc_init(TFFeedbackFormBuilder);
  -[TFFeedbackSession _developerName](self, "_developerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackSession _associatePrefilledEmailIfNeeded](self, "_associatePrefilledEmailIfNeeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageCollectionForIdentifer:", CFSTR("c"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBD1A8];
  if (v7)
  {
    v9 = objc_msgSend(v7, "count");
    v10 = v9 != 0;
    if (v9)
      v8 = v7;
  }
  else
  {
    v10 = 0;
  }
  -[TFFeedbackSession associateScreenshotImages:](self, "associateScreenshotImages:", v8);
  -[TFFeedbackFormBuilder buildFormForContext:withDeveloperName:prefilledEmail:hasScreenshots:](v3, "buildFormForContext:withDeveloperName:prefilledEmail:hasScreenshots:", -[TFFeedbackSession context](self, "context"), v4, v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_beginFeedbackSubmisionForViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession _currentContextStringDescription](self, "_currentContextStringDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v27 = v7;
    v28 = 2114;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v4;
    v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] _beginFeedbackSubmisionForViewController: formViewController=%@ context=%@", buf, 0x34u);

  }
  -[TFFeedbackSession setCurrentPhase:](self, "setCurrentPhase:", 1);
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isLoading");

  if (v13)
  {
    +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "generatedLogger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_opt_class();
      v17 = v16;
      -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TFFeedbackSession logKey](self, "logKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v16;
      v28 = 2114;
      v29 = v18;
      v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_2174E1000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] Waiting for aggregator to complete", buf, 0x20u);

    }
    -[TFFeedbackSession setWaitingOnAggregatorForSubmission:](self, "setWaitingOnAggregatorForSubmission:", 1);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[TFFeedbackSession submissionService](self, "submissionService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession dataContainer](self, "dataContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke;
    v23[3] = &unk_24D794D48;
    objc_copyWeak(&v25, (id *)buf);
    v24 = v4;
    objc_msgSend(v20, "submitFeedbackForBundleId:withContentsOfDataSource:completionHandler:", v21, v22, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

}

void __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke_2;
  block[3] = &unk_24D794D20;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = WeakRetained;
  if (v2)
    objc_msgSend(WeakRetained, "_abortFeedbackSubmissionForViewController:withError:", v4, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "_finishFeedbackSubmissionForViewController:", v4);

}

- (void)_abortFeedbackSubmissionForViewController:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "generatedLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v25 = v10;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession _currentContextStringDescription](self, "_currentContextStringDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v27 = v10;
    v28 = 2114;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v6;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_2174E1000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] _abortFeedbackSubmissionForViewController:withError: formViewController=%@ context=%@ | error=%@", buf, 0x3Eu);

  }
  -[TFFeedbackSession setCurrentPhase:](self, "setCurrentPhase:", 0);
  -[TFFeedbackSession activeFormViewController](self, "activeFormViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[TFFeedbackSession submissionService](self, "submissionService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession _displayableErrorMessageFromService:submissionError:](self, "_displayableErrorMessageFromService:submissionError:", v16, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[TFFeedbackSession activeFormViewController](self, "activeFormViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "showSubmissionFailureWithMessage:", v17);

  }
  -[TFFeedbackSession delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  -[TFFeedbackSession delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if ((v21 & 1) != 0)
  {
    objc_msgSend(v22, "sessionDidFailToSubmit:withError:", self, v7);
LABEL_9:

    goto LABEL_10;
  }
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    -[TFFeedbackSession delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "session:failedToSubmitFeedbackFromViewController:withError:", self, v6, v7);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_finishFeedbackSubmissionForViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TFLogConfiguration defaultConfiguration](TFLogConfiguration, "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generatedLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    -[TFFeedbackSession bundleIdentifier](self, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession logKey](self, "logKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TFFeedbackSession _currentContextStringDescription](self, "_currentContextStringDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544386;
    v18 = v7;
    v19 = 2114;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v4;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_2174E1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] _finishFeedbackSubmissionForViewController: formViewController=%@ context=%@", (uint8_t *)&v17, 0x34u);

  }
  -[TFFeedbackSession setCurrentPhase:](self, "setCurrentPhase:", 2);
  -[TFFeedbackSession delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  -[TFFeedbackSession delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "sessionDidSubmitFeedback:", self);
LABEL_7:

    goto LABEL_8;
  }
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[TFFeedbackSession delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "session:didSubmitFeedbackFromViewController:", self, v4);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)dataAggregator:(id)a3 didCompleteTasks:(id)a4
{
  char v5;
  void *v6;
  char v7;

  if (-[TFFeedbackSession currentPhase](self, "currentPhase", a3, a4) == 1)
    v5 = !-[TFFeedbackSession isWaitingOnAggregatorForSubmission](self, "isWaitingOnAggregatorForSubmission");
  else
    v5 = 1;
  -[TFFeedbackSession dataContainer](self, "dataContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isLoading");

  if ((v5 & 1) == 0 && (v7 & 1) == 0)
  {
    -[TFFeedbackSession submitFeedbackForActiveFormViewController](self, "submitFeedbackForActiveFormViewController");
    -[TFFeedbackSession setWaitingOnAggregatorForSubmission:](self, "setWaitingOnAggregatorForSubmission:", 0);
  }
}

- (id)_displayableErrorMessageFromService:(id)a3 submissionError:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  TFLocalizedString(CFSTR("NUMBER_OF_CHARACTERS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, objc_msgSend(v7, "maxNumberOfCommentSymbolsAllowed"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  TFLocalizedString(CFSTR("NUMBER_OF_IMAGES"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "maxNumberOfScreenshotsAllowed");

  objc_msgSend(v10, "stringWithFormat:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v5, "code");
  if (v14 <= 400)
  {
    if (v14 == 302)
    {
      v20 = CFSTR("ALERT_SUBMIT_FAILURE_MALFORMED_EMAIL");
    }
    else
    {
      if (v14 != 303)
        goto LABEL_16;
      v20 = CFSTR("ALERT_SUBMIT_FAILURE_MISSING_USER_DATA_MESSAGE");
    }
LABEL_17:
    TFLocalizedString(v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v14 == 401)
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    TFLocalizedString(CFSTR("ALERT_SUBMIT_FAILURE_TOO_MANY_IMAGES_MESSAGE_TEMPLATE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v16, v13);
LABEL_12:
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v19 = (void *)v23;
    goto LABEL_14;
  }
  if (v14 == 402)
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    TFLocalizedString(CFSTR("ALERT_SUBMIT_FAILURE_TOO_MANY_CHARACTERS_MESSAGE_TEMPLATE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v16, v9);
    goto LABEL_12;
  }
  if (v14 != 404)
  {
LABEL_16:
    v20 = CFSTR("ALERT_SUBMIT_FAILURE_GENERIC_MESSAGE");
    goto LABEL_17;
  }
  objc_msgSend(v5, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("TFErrorImageName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    TFLocalizedString(CFSTR("ALERT_SUBMIT_FAILURE_TOO_LARGE_UNNAMED_IMAGE_MESSAGE_TEMPLATE"));
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  TFLocalizedString(CFSTR("ALERT_SUBMIT_FAILURE_TOO_LARGE_NAMED_IMAGE_MESSAGE_TEMPLATE"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v18, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
LABEL_18:

  return v19;
}

- (id)_currentContextStringDescription
{
  if (_currentContextStringDescription_onceToken != -1)
    dispatch_once(&_currentContextStringDescription_onceToken, &__block_literal_global_9);
  return (id)objc_msgSend((id)_currentContextStringDescription_contextDescriptors, "objectAtIndexedSubscript:", -[TFFeedbackSession context](self, "context"));
}

void __53__TFFeedbackSession__currentContextStringDescription__block_invoke()
{
  void *v0;

  v0 = (void *)_currentContextStringDescription_contextDescriptors;
  _currentContextStringDescription_contextDescriptors = (uint64_t)&unk_24D7A0610;

}

- (TFFeedbackSession)initWithBetaApplicationIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  TFFeedbackSession *v8;

  v4 = (void *)MEMORY[0x24BE08328];
  v5 = a3;
  objc_msgSend(v4, "currentProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TFFeedbackSession initForContext:betaApplicationIdentifier:](self, "initForContext:betaApplicationIdentifier:", objc_msgSend(v7, "containsString:", CFSTR("Screenshot")), v5);

  return v8;
}

- (id)initForContext:(unint64_t)a3 betaApplicationBundleURL:(id)a4
{
  id v6;
  TFFeedbackSession *v7;
  uint64_t v8;
  NSURL *bundleURL;
  void *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFFeedbackSession;
  v7 = -[TFFeedbackSession init](&v14, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    bundleURL = v7->_bundleURL;
    v7->_bundleURL = (NSURL *)v8;

    +[TFBundle bundleIdentifierForBundleURL:](TFBundle, "bundleIdentifierForBundleURL:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v11;

    -[TFFeedbackSession commonInitWithContext:](v7, "commonInitWithContext:", a3);
  }

  return v7;
}

- (unint64_t)context
{
  return self->_context;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (ASDBetaAppLaunchInfo)launchInfo
{
  return self->_launchInfo;
}

- (TFFeedbackSessionDelegate)delegate
{
  return (TFFeedbackSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)forcePrefilledEmailViewVariant
{
  return self->_forcePrefilledEmailViewVariant;
}

- (void)setForcePrefilledEmailViewVariant:(BOOL)a3
{
  self->_forcePrefilledEmailViewVariant = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (BOOL)didSnapshot
{
  return self->_didSnapshot;
}

- (void)setDidSnapshot:(BOOL)a3
{
  self->_didSnapshot = a3;
}

- (BOOL)isWaitingOnAggregatorForSubmission
{
  return self->_waitingOnAggregatorForSubmission;
}

- (void)setWaitingOnAggregatorForSubmission:(BOOL)a3
{
  self->_waitingOnAggregatorForSubmission = a3;
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_currentPhase = a3;
}

- (TFFeedbackDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (TFDataAggregator)aggregator
{
  return self->_aggregator;
}

- (TFFeedbackSubmissionService)submissionService
{
  return self->_submissionService;
}

- (TFFeedbackFormViewController)activeFormViewController
{
  return (TFFeedbackFormViewController *)objc_loadWeakRetained((id *)&self->_activeFormViewController);
}

- (void)setActiveFormViewController:(id)a3
{
  objc_storeWeak((id *)&self->_activeFormViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeFormViewController);
  objc_storeStrong((id *)&self->_submissionService, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
