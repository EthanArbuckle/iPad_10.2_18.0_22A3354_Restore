@implementation PLFeatureAvailabilityTransitionDelegate

- (PLFeatureAvailabilityTransitionDelegate)initWithLibraryServicesManager:(id)a3
{
  id v4;
  PLFeatureAvailabilityTransitionDelegate *v5;
  PLFeatureAvailabilityTransitionDelegate *v6;
  PLFeatureAvailabilityTransitionDelegate *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLFeatureAvailabilityTransitionDelegate;
  v5 = -[PLFeatureAvailabilityTransitionDelegate init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_lsm, v4);
    v7 = v6;
  }

  return v6;
}

- (void)availability:(id)a3 feature:(id)a4 didTransition:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  int v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(a4, "unsignedIntegerValue");
  PLBackendGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v11)
    {
      v12 = 67109120;
      v13 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "FeatureAvailability: %u became available", (uint8_t *)&v12, 8u);
    }

    if (v9 == 3)
      -[PLFeatureAvailabilityTransitionDelegate searchUIFeatureBecameAvailable:](self, "searchUIFeatureBecameAvailable:", v8);
  }
  else
  {
    if (v11)
    {
      v12 = 67109120;
      v13 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "FeatureAvailability: %u became unavailable", (uint8_t *)&v12, 8u);
    }

  }
}

- (void)searchUIFeatureBecameAvailable:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:", "-[PLFeatureAvailabilityTransitionDelegate searchUIFeatureBecameAvailable:]");
  objc_msgSend(v6, "globalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "searchFeatureReadyDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSearchFeatureReadyDate:", v9);

    objc_msgSend(v11, "fractionForFeature:", &unk_1E375E700);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSearchFeatureReadyFraction:", v10);

    +[PLAnalysisCoordinator reportBGSTFeatureAvailable:](PLAnalysisCoordinator, "reportBGSTFeatureAvailable:", 3);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lsm);
}

@end
