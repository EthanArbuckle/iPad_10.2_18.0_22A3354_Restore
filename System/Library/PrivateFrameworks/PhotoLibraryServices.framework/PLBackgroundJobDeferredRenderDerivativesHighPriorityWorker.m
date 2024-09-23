@implementation PLBackgroundJobDeferredRenderDerivativesHighPriorityWorker

+ (id)_criteriaToUse
{
  return +[PLBackgroundJobCriteria criteriaForHighPriorityRenderDerivativesWorker](PLBackgroundJobCriteria, "criteriaForHighPriorityRenderDerivativesWorker");
}

- (id)deferredProcessingStatesHandled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3763320);
}

- (id)_predicateToFetchDeferredAssets
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3880];
  -[PLBackgroundJobDeferredRenderDerivativesHighPriorityWorker deferredProcessingStatesHandled](self, "deferredProcessingStatesHandled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("deferredProcessingNeeded"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)taskIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = taskIdentifier_requestNumber_33++;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%lu"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
