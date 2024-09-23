@implementation _TUIKeyboardCorrectionListAccumulator

- (_TUIKeyboardCorrectionListAccumulator)initWithRequestToken:(id)a3 keyboardState:(id)a4 enabledCandidateSources:(id)a5 policy:(id)a6 onComplete:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _TUIKeyboardCorrectionListAccumulator *v18;
  _TUIKeyboardCorrectionListAccumulator *v19;
  uint64_t v20;
  NSMutableDictionary *generatorResults;
  uint64_t v22;
  NSMutableSet *nilResults;
  void *v24;
  id accumulatorCompletedBlock;
  dispatch_queue_t v26;
  OS_dispatch_queue *completionBlockQueue;
  _TUIKeyboardCorrectionListAccumulatorPolicy *v28;
  _TUIKeyboardCorrectionListAccumulatorPolicy *policy;
  double v30;
  dispatch_time_t v31;
  NSObject *v32;
  _QWORD block[4];
  _TUIKeyboardCorrectionListAccumulator *v35;
  objc_super v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v36.receiver = self;
  v36.super_class = (Class)_TUIKeyboardCorrectionListAccumulator;
  v18 = -[_TUIKeyboardCorrectionListAccumulator init](&v36, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_token, a3);
    objc_storeStrong((id *)&v19->_keyboardState, a4);
    objc_storeStrong((id *)&v19->_expectedGeneratorSourceTypes, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    generatorResults = v19->_generatorResults;
    v19->_generatorResults = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    nilResults = v19->_nilResults;
    v19->_nilResults = (NSMutableSet *)v22;

    v24 = _Block_copy(v17);
    accumulatorCompletedBlock = v19->_accumulatorCompletedBlock;
    v19->_accumulatorCompletedBlock = v24;

    v26 = dispatch_queue_create("com.apple.TextInputUI.TUIKeyboardCorrectionListAccumulator.Completion", 0);
    completionBlockQueue = v19->_completionBlockQueue;
    v19->_completionBlockQueue = (OS_dispatch_queue *)v26;

    v19->_completionCalled = 0;
    if (v16)
    {
      v28 = (_TUIKeyboardCorrectionListAccumulatorPolicy *)v16;
    }
    else
    {
      +[_TUIKeyboardCorrectionListAccumulatorPolicy standard](_TUIKeyboardCorrectionListAccumulatorPolicy, "standard");
      v28 = (_TUIKeyboardCorrectionListAccumulatorPolicy *)objc_claimAutoreleasedReturnValue();
    }
    policy = v19->_policy;
    v19->_policy = v28;

    -[_TUIKeyboardCorrectionListAccumulatorPolicy accumulatorTimeout](v19->_policy, "accumulatorTimeout");
    v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
    v32 = v19->_completionBlockQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __118___TUIKeyboardCorrectionListAccumulator_initWithRequestToken_keyboardState_enabledCandidateSources_policy_onComplete___block_invoke;
    block[3] = &unk_1E24FC068;
    v35 = v19;
    dispatch_after(v31, v32, block);

  }
  return v19;
}

- (BOOL)hasCorrectionsForCandidateSource:(int64_t)a3
{
  NSMutableDictionary *generatorResults;
  void *v4;
  void *v5;

  generatorResults = self->_generatorResults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](generatorResults, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(generatorResults) = v5 != 0;

  return (char)generatorResults;
}

- (id)correctionsForCandidateSource:(int64_t)a3
{
  NSMutableDictionary *generatorResults;
  void *v4;
  void *v5;

  generatorResults = self->_generatorResults;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](generatorResults, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)kbdCorrectionsAreComplete
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if ((-[NSMutableSet containsObject:](self->_nilResults, "containsObject:", &unk_1E25173C8) & 1) != 0)
    return 1;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_generatorResults, "objectForKeyedSubscript:", &unk_1E25173C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v3 = 0;
  if (v4)
  {
    objc_msgSend(v4, "predictions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v3 = 1;
  }

  return v3;
}

- (BOOL)updateWithCorrections:(id)a3 forType:(int64_t)a4
{
  id v6;
  NSArray *expectedGeneratorSourceTypes;
  void *v8;
  _BOOL4 v9;
  NSMutableDictionary *generatorResults;
  void *v11;
  NSMutableSet *nilResults;
  void *v13;
  NSMutableSet *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSObject *v17;
  _QWORD block[5];

  v6 = a3;
  expectedGeneratorSourceTypes = self->_expectedGeneratorSourceTypes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSArray containsObject:](expectedGeneratorSourceTypes, "containsObject:", v8);

  if (v9)
  {
    if (v6)
    {
      generatorResults = self->_generatorResults;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](generatorResults, "setObject:forKeyedSubscript:", v6, v11);

      nilResults = self->_nilResults;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](nilResults, "removeObject:", v13);
    }
    else
    {
      v14 = self->_nilResults;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v14, "addObject:", v15);

      v16 = self->_generatorResults;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v13);
    }

    if (-[_TUIKeyboardCorrectionListAccumulator areAllGeneratorsComplete](self, "areAllGeneratorsComplete"))
    {
      -[_TUIKeyboardCorrectionListAccumulator completionBlockQueue](self, "completionBlockQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71___TUIKeyboardCorrectionListAccumulator_updateWithCorrections_forType___block_invoke;
      block[3] = &unk_1E24FC068;
      block[4] = self;
      dispatch_async(v17, block);

    }
  }

  return v9;
}

- (BOOL)areAllGeneratorsComplete
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;

  if (-[NSArray count](self->_expectedGeneratorSourceTypes, "count"))
  {
    if (!-[NSArray containsObject:](self->_expectedGeneratorSourceTypes, "containsObject:", &unk_1E25173C8)
      || (v3 = -[_TUIKeyboardCorrectionListAccumulator kbdCorrectionsAreComplete](self, "kbdCorrectionsAreComplete")))
    {
      v4 = -[NSMutableDictionary count](self->_generatorResults, "count");
      v5 = -[NSMutableSet count](self->_nilResults, "count") + v4;
      LOBYTE(v3) = v5 == -[NSArray count](self->_expectedGeneratorSourceTypes, "count");
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)completionBlockJustOnce:(BOOL)a3
{
  void (**accumulatorCompletedBlock)(id, BOOL);

  accumulatorCompletedBlock = (void (**)(id, BOOL))self->_accumulatorCompletedBlock;
  if (accumulatorCompletedBlock)
  {
    if (!self->_completionCalled)
    {
      self->_completionCalled = 1;
      accumulatorCompletedBlock[2](accumulatorCompletedBlock, a3);
    }
  }
}

- (id)debugDescription
{
  uint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  NSArray *expectedGeneratorSourceTypes;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;

  v3 = -[NSMutableSet count](self->_nilResults, "count");
  v4 = -[_TUIKeyboardCorrectionListAccumulator areAllGeneratorsComplete](self, "areAllGeneratorsComplete");
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[TICandidateRequestToken shortIdentifier](self->_token, "shortIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  expectedGeneratorSourceTypes = self->_expectedGeneratorSourceTypes;
  v8 = -[NSMutableDictionary count](self->_generatorResults, "count");
  -[_TUIKeyboardCorrectionListAccumulatorPolicy accumulatorTimeout](self->_policy, "accumulatorTimeout");
  v10 = "NO";
  if (v4)
    v11 = "YES";
  else
    v11 = "NO";
  if (self->_completionCalled)
    v10 = "YES";
  objc_msgSend(v5, "stringWithFormat:", CFSTR("{requestToken.shortId: %@, enabledSources: %@, generatedResults.count: %lu, nilResults.count: %lu, accumulatorTimeout: %f, isCompleted: %s, completionCalled: %s}"), v6, expectedGeneratorSourceTypes, v8, v3, v9, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (TICandidateRequestToken)token
{
  return self->_token;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (id)accumulatorCompletedBlock
{
  return self->_accumulatorCompletedBlock;
}

- (NSArray)expectedGeneratorSourceTypes
{
  return self->_expectedGeneratorSourceTypes;
}

- (NSMutableDictionary)generatorResults
{
  return self->_generatorResults;
}

- (NSMutableSet)nilResults
{
  return self->_nilResults;
}

- (_TUIKeyboardCorrectionListAccumulatorPolicy)policy
{
  return self->_policy;
}

- (BOOL)completionCalled
{
  return self->_completionCalled;
}

- (OS_dispatch_queue)completionBlockQueue
{
  return self->_completionBlockQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionBlockQueue, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_nilResults, 0);
  objc_storeStrong((id *)&self->_generatorResults, 0);
  objc_storeStrong((id *)&self->_expectedGeneratorSourceTypes, 0);
  objc_storeStrong(&self->_accumulatorCompletedBlock, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
