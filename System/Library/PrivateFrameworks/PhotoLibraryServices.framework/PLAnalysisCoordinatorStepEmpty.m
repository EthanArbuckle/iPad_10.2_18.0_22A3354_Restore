@implementation PLAnalysisCoordinatorStepEmpty

- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  void (**v7)(id, id);
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = (void (**)(id, id))a5;
  v8 = a4;
  objc_msgSend(v8, "setCompletedUnitCount:", objc_msgSend(v8, "completedUnitCount") + objc_msgSend(a3, "count"));

  v9 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "successWithResult:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v11);
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLAnalysisCoordinatorGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unit Test Step cancelled", (uint8_t *)&v5, 0xCu);

  }
}

@end
