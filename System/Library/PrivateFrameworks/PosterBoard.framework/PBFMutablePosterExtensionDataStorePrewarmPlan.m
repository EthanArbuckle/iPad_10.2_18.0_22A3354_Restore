@implementation PBFMutablePosterExtensionDataStorePrewarmPlan

- (void)appendPrewarmPhase:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[PBFPosterExtensionDataStorePrewarmPlan prewarmPhasePlan](self, "prewarmPhasePlan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v12);

  if ((v5 & 1) == 0)
  {
    -[PBFPosterExtensionDataStorePrewarmPlan prewarmPhasePlan](self, "prewarmPhasePlan");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_opt_new();
    v10 = v9;

    objc_msgSend(v10, "addObject:", v12);
    v11 = (void *)objc_msgSend(v10, "copy");
    -[PBFPosterExtensionDataStorePrewarmPlan setPrewarmPhasePlan:](self, "setPrewarmPhasePlan:", v11);

  }
}

- (void)removePrewarmPhase:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PBFPosterExtensionDataStorePrewarmPlan prewarmPhasePlan](self, "prewarmPhasePlan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
  {
    -[PBFPosterExtensionDataStorePrewarmPlan prewarmPhasePlan](self, "prewarmPhasePlan");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "removeObject:", v9);
    v8 = (void *)objc_msgSend(v7, "copy");
    -[PBFPosterExtensionDataStorePrewarmPlan setPrewarmPhasePlan:](self, "setPrewarmPhasePlan:", v8);

  }
}

- (void)setTimeoutInterval:(double)a3 forPhase:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  -[PBFPosterExtensionDataStorePrewarmPlan phaseToPrewarmTimeout](self, "phaseToPrewarmTimeout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  if (a3 >= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v12);

  }
  else
  {
    objc_msgSend(v10, "removeObjectForKey:", v12);
  }
  -[PBFPosterExtensionDataStorePrewarmPlan setPhaseToPrewarmTimeout:](self, "setPhaseToPrewarmTimeout:", v10);

}

- (void)setExecutionBlock:(id)a3 forPhase:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[PBFPosterExtensionDataStorePrewarmPlan phaseToExecutionBlock](self, "phaseToExecutionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  if (v14)
  {
    v12 = (void *)objc_msgSend(v14, "copy");
    v13 = _Block_copy(v12);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v6);

  }
  else
  {
    objc_msgSend(v11, "removeObjectForKey:", v6);
  }
  -[PBFPosterExtensionDataStorePrewarmPlan setPhaseToExecutionBlock:](self, "setPhaseToExecutionBlock:", v11);

}

@end
