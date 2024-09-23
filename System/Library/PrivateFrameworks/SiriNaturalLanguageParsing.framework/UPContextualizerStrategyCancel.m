@implementation UPContextualizerStrategyCancel

- (UPContextualizerStrategyCancel)initWithPrebuiltIntentThreshold:(double)a3
{
  UPContextualizerStrategyCancel *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UPContextualizerStrategyCancel;
  result = -[UPContextualizerStrategyCancel init](&v5, sel_init);
  if (result)
    result->_prebuiltIntentThreshold = a3;
  return result;
}

- (id)resultUsingContextualizerInput:(id)a3
{
  void *v4;
  double prebuiltIntentThreshold;
  void *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "coreResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  prebuiltIntentThreshold = self->_prebuiltIntentThreshold;
  v12[0] = CFSTR("cancel");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[UPContextualizerUtilities hasTopCandidate:excedingProbability:matchingOneOfIntents:](UPContextualizerUtilities, "hasTopCandidate:excedingProbability:matchingOneOfIntents:", v4, v6, prebuiltIntentThreshold);

  if (v7)
  {
    SNLPOSLoggerForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C2196000, v8, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyCancel: Detected high-probability cancel intent in core result", v11, 2u);
    }

    +[UPResult createResultFromExistingResult:truncatedTo:](UPResult, "createResultFromExistingResult:truncatedTo:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

@end
