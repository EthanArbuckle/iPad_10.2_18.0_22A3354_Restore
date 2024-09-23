@implementation UPContextualizerStrategyOffer

- (UPContextualizerStrategyOffer)initWithPrebuiltIntentThreshold:(double)a3
{
  UPContextualizerStrategyOffer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UPContextualizerStrategyOffer;
  result = -[UPContextualizerStrategyOffer init](&v5, sel_init);
  if (result)
    result->_prebuiltIntentThreshold = a3;
  return result;
}

- (id)resultUsingContextualizerInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double prebuiltIntentThreshold;
  void *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  uint8_t v13[8];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dialogAct");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[UPContextualizerStrategyOffer resultUsingContextualizerInput:]", "UPContextualizerStrategyOffer.m", 39, "[contextualizerInput.dialogAct isKindOfClass:[UPDialogActOffer class]]");

  objc_msgSend(v4, "coreResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  prebuiltIntentThreshold = self->_prebuiltIntentThreshold;
  v14[0] = CFSTR("no");
  v14[1] = CFSTR("yes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[UPContextualizerUtilities hasTopCandidate:excedingProbability:matchingOneOfIntents:](UPContextualizerUtilities, "hasTopCandidate:excedingProbability:matchingOneOfIntents:", v6, v8, prebuiltIntentThreshold);

  if (v9)
  {
    SNLPOSLoggerForCategory(3);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C2196000, v10, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOffer: Detected high-probability yes/no intent in core result", v13, 2u);
    }

    +[UPResult createResultFromExistingResult:truncatedTo:](UPResult, "createResultFromExistingResult:truncatedTo:", v6, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

@end
