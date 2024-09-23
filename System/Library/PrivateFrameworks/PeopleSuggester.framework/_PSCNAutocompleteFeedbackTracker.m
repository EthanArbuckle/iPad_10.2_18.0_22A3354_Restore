@implementation _PSCNAutocompleteFeedbackTracker

+ (id)defaultImpressionWithFeedback:(id)a3 bundleID:(id)a4 trialID:(id)a5 isImplicit:(BOOL)a6
{
  _BOOL8 v6;
  const __CFString *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[13];
  _QWORD v20[14];

  v6 = a6;
  v20[13] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("avgRankTapped");
  v19[1] = CFSTR("avgRankUsed");
  v20[0] = &unk_1E442D028;
  v20[1] = &unk_1E442D028;
  if (a4)
    v9 = (const __CFString *)a4;
  else
    v9 = CFSTR("Unknown");
  v20[2] = v9;
  v19[2] = CFSTR("bundleID");
  v19[3] = CFSTR("countSuggested");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = (__CFString *)a5;
  v12 = a4;
  objc_msgSend(a3, "suggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  v20[4] = &unk_1E442B540;
  v19[4] = CFSTR("countTapped");
  v19[5] = CFSTR("countUsed");
  v20[5] = &unk_1E442B540;
  v20[6] = &unk_1E442B540;
  v19[6] = CFSTR("highestRankTapped");
  v19[7] = CFSTR("highestRankUsed");
  v20[7] = &unk_1E442B540;
  v19[8] = CFSTR("isImplicit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = CFSTR("ledToAction");
  v19[10] = CFSTR("lowestRankTapped");
  v20[8] = v15;
  v20[9] = &unk_1E442B540;
  v20[10] = &unk_1E442B540;
  v20[11] = &unk_1E442B540;
  v19[11] = CFSTR("lowestRankUsed");
  v19[12] = CFSTR("trialID");
  if (v11)
    v16 = v11;
  else
    v16 = CFSTR("Unknown");
  v20[12] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)defaultSubmodelImpressionWithFeedback:(id)a3 submodel:(id)a4 bundleID:(id)a5 trialID:(id)a6 isImplicit:(BOOL)a7
{
  _BOOL8 v7;
  const __CFString *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  _QWORD v35[16];

  v7 = a7;
  v35[14] = *MEMORY[0x1E0C80C00];
  v23 = CFSTR("avgRankTapped");
  v24 = CFSTR("avgRankUsed");
  v35[0] = &unk_1E442D028;
  v35[1] = &unk_1E442D028;
  if (a5)
    v11 = (const __CFString *)a5;
  else
    v11 = CFSTR("Unknown");
  v35[2] = v11;
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = (__CFString *)a6;
  v14 = a5;
  v15 = (__CFString *)a4;
  objc_msgSend(a3, "suggestions", v23, v24, CFSTR("bundleID"), CFSTR("countSuggested"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v17;
  v35[4] = &unk_1E442B540;
  v25 = CFSTR("countTapped");
  v26 = CFSTR("countUsed");
  v35[5] = &unk_1E442B540;
  v35[6] = &unk_1E442B540;
  v27 = CFSTR("highestRankTapped");
  v28 = CFSTR("highestRankUsed");
  v35[7] = &unk_1E442B540;
  v29 = CFSTR("isImplicit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("ledToAction");
  v31 = CFSTR("lowestRankTapped");
  v35[8] = v18;
  v35[9] = &unk_1E442B540;
  v35[10] = &unk_1E442B540;
  v35[11] = &unk_1E442B540;
  v32 = CFSTR("lowestRankUsed");
  v33 = CFSTR("submodelID");
  if (v15)
    v19 = v15;
  else
    v19 = CFSTR("Unknown");
  v34 = CFSTR("trialID");
  if (v13)
    v20 = v13;
  else
    v20 = CFSTR("Unknown");
  v35[12] = v19;
  v35[13] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v23, 14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)defaultActionWithInteraction:(id)a3 trialID:(id)a4 isImplicit:(BOOL)a5
{
  _BOOL8 v5;
  __CFString *v7;
  id v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v19[11];
  _QWORD v20[12];

  v5 = a5;
  v20[11] = *MEMORY[0x1E0C80C00];
  v19[0] = CFSTR("actionName");
  v7 = (__CFString *)a4;
  v8 = a3;
  objc_msgSend(v8, "mechanism");
  mechanismToString();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("Unknown");
  v20[0] = v11;
  v19[1] = CFSTR("bundleID");
  objc_msgSend(v8, "bundleId");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = CFSTR("Unknown");
  v20[1] = v13;
  v20[2] = &unk_1E442B540;
  v19[2] = CFSTR("countErasedHandles");
  v19[3] = CFSTR("countTappedSuggestions");
  v20[3] = &unk_1E442B540;
  v20[4] = &unk_1E442B540;
  v19[4] = CFSTR("countTimesVendedSuggestions");
  v19[5] = CFSTR("countTypedHandles");
  v20[5] = &unk_1E442B540;
  v20[6] = &unk_1E442B540;
  v19[6] = CFSTR("countUsedSuggestions");
  v19[7] = CFSTR("countVendedSuggestions");
  v20[7] = &unk_1E442B540;
  v19[8] = CFSTR("isImplicit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v7)
    v16 = v7;
  else
    v16 = CFSTR("Unknown");
  v20[8] = v14;
  v20[9] = v16;
  v19[9] = CFSTR("trialID");
  v19[10] = CFSTR("usedSuggestions");
  v20[10] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (_PSCNAutocompleteFeedbackTracker)initWithInteractionIterator:(id)a3 maxSecondsBetweenImpressionAndAction:(int64_t)a4 shouldInferEnterAndExit:(BOOL)a5 impressionLogger:(id)a6 submodelImpressionLogger:(id)a7 actionLogger:(id)a8 defaultForIsImplicit:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  _PSCNAutocompleteFeedbackTracker *v20;
  _PSCNAutocompleteFeedbackTracker *v21;
  uint64_t v22;
  id impressionLogger;
  uint64_t v24;
  id submodelImpressionLogger;
  uint64_t v26;
  id actionLogger;
  uint64_t v28;
  NSDateFormatter *dateFormatter;
  objc_super v31;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_PSCNAutocompleteFeedbackTracker;
  v20 = -[_PSCNAutocompleteFeedbackTracker init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_interactionIterator, a3);
    v21->_maxSecondsBetweenImpressionAndAction = a4;
    v21->_shouldInferEnterAndExit = a5;
    v22 = MEMORY[0x1A1AFCBF8](v17);
    impressionLogger = v21->_impressionLogger;
    v21->_impressionLogger = (id)v22;

    v24 = MEMORY[0x1A1AFCBF8](v18);
    submodelImpressionLogger = v21->_submodelImpressionLogger;
    v21->_submodelImpressionLogger = (id)v24;

    v26 = MEMORY[0x1A1AFCBF8](v19);
    actionLogger = v21->_actionLogger;
    v21->_actionLogger = (id)v26;

    v21->_defaultForIsImplicit = a9;
    v28 = objc_opt_new();
    dateFormatter = v21->_dateFormatter;
    v21->_dateFormatter = (NSDateFormatter *)v28;

    -[NSDateFormatter setDateFormat:](v21->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss zzz"));
  }

  return v21;
}

- (void)annotateImpression:(id)a3 withStatistics:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v5, "countTapped");
  v8 = 0.0;
  v9 = 0.0;
  if (v7 >= 1)
  {
    v10 = (double)objc_msgSend(v5, "totalRankTapped", 0.0);
    v9 = v10 / (double)objc_msgSend(v5, "countTapped");
  }
  objc_msgSend(v6, "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, CFSTR("avgRankTapped"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  if (objc_msgSend(v5, "countUsed") >= 1)
  {
    v13 = (double)objc_msgSend(v5, "totalRankUsed");
    v8 = v13 / (double)objc_msgSend(v5, "countUsed");
  }
  objc_msgSend(v12, "numberWithDouble:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v14, CFSTR("avgRankUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "countTapped"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, CFSTR("countTapped"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "countUsed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, CFSTR("countUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "countUsed") > 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, CFSTR("ledToAction"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "highestRankTapped"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, CFSTR("highestRankTapped"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "highestRankUsed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("highestRankUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "lowestRankTapped"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, CFSTR("lowestRankTapped"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "lowestRankUsed"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("lowestRankUsed"));

}

- (void)logImpressionsFromAccumulator:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
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
  void *v21;
  id v22;
  void *v23;
  unint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  unint64_t v36;

  v4 = a3;
  objc_msgSend(v4, "vendedSuggestionEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "vendedSuggestionEvents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      v26 = v4;
      do
      {
        v28 = (void *)objc_opt_class();
        objc_msgSend(v4, "vendedSuggestionEvents");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", v9);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "vendedSuggestions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "vendedSuggestionEvents");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v9);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "vendedSuggestionEvents");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "vendedSuggestions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "suggestions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "trialID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "defaultImpressionWithFeedback:bundleID:trialID:isImplicit:", v27, v10, v16, self->_defaultForIsImplicit);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v17, "mutableCopy");

        v4 = v26;
        objc_msgSend(v26, "metricsForImpressions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSCNAutocompleteFeedbackTracker annotateImpression:withStatistics:](self, "annotateImpression:withStatistics:", v29, v19);

        (*((void (**)(void))self->_impressionLogger + 2))();
        objc_msgSend(v26, "metricsForSubmodelImpressions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __66___PSCNAutocompleteFeedbackTracker_logImpressionsFromAccumulator___block_invoke;
        v34[3] = &unk_1E44019C8;
        v34[4] = self;
        v22 = v26;
        v35 = v22;
        v36 = v9;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v34);

        ++v9;
        objc_msgSend(v22, "vendedSuggestionEvents");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

      }
      while (v9 < v24);
    }
  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[_PSCNAutocompleteFeedbackTracker logImpressionsFromAccumulator:].cold.1(v25);

  }
}

- (void)annotateAction:(id)a3 withStatistics:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "countTappedSuggestions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("countTappedSuggestions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "countTimesVendedSuggestions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("countTimesVendedSuggestions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "countUsedSuggestions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("countUsedSuggestions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "countVendedSuggestions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("countVendedSuggestions"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v6, "countUsedSuggestions");

  objc_msgSend(v12, "numberWithInt:", v13 > 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("usedSuggestions"));

}

- (void)logActionFromAccumulator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "interaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendedSuggestionEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vendedSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trialID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultActionWithInteraction:trialID:isImplicit:", v6, v12, self->_defaultForIsImplicit);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v4, "metricsForAction");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSCNAutocompleteFeedbackTracker annotateAction:withStatistics:](self, "annotateAction:withStatistics:", v15, v14);
  (*((void (**)(void))self->_actionLogger + 2))();

}

- (void)processFeedback:(id)a3
{
  if (self->_shouldInferEnterAndExit)
    -[_PSCNAutocompleteFeedbackTracker processFeedbackWithInferredEnterAndExit:](self, "processFeedbackWithInferredEnterAndExit:", a3);
  else
    -[_PSCNAutocompleteFeedbackTracker processFeedbackWithoutInferredEnterAndExit:](self, "processFeedbackWithoutInferredEnterAndExit:", a3);
}

- (void)processFeedbackWithInferredEnterAndExit:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _PSCNAutocompleteFeedbackInteractionIterator *interactionIterator;
  void *v22;
  _CDInteraction *v23;
  _CDInteraction *followingInteraction;
  NSObject *v25;
  _PSCNAutocompleteFeedbackSessionAccumulator *v26;
  NSObject *v27;
  _PSCNAutocompleteFeedbackSessionAccumulator *accumulator;
  _CDInteraction *v29;
  NSObject *v30;
  NSObject *v31;
  NSDateFormatter *dateFormatter;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double maxSecondsBetweenImpressionAndAction;
  NSObject *v45;
  _BOOL4 v46;
  NSDate *v47;
  NSDate *stopTime;
  int64_t v49;
  _PSCNAutocompleteFeedbackSessionAccumulator *v50;
  _PSCNAutocompleteFeedbackSessionAccumulator *v51;
  int v52;
  int64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_stopTime)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_PSCNAutocompleteFeedbackTracker processFeedbackWithInferredEnterAndExit:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_8:

    goto LABEL_9;
  }
  if (!objc_msgSend(v4, "feedbackType") || objc_msgSend(v5, "feedbackType") == 1)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_PSCNAutocompleteFeedbackTracker processFeedbackWithInferredEnterAndExit:].cold.1(v6, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_followingInteractionPrevious, self->_followingInteraction);
  interactionIterator = self->_interactionIterator;
  objc_msgSend(v5, "reportTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSCNAutocompleteFeedbackInteractionIterator fastForwardToDate:](interactionIterator, "fastForwardToDate:", v22);
  v23 = (_CDInteraction *)objc_claimAutoreleasedReturnValue();
  followingInteraction = self->_followingInteraction;
  self->_followingInteraction = v23;

  if (self->_accumulator)
  {
    if (self->_followingInteraction == self->_followingInteractionPrevious || !self->_inActionWindow)
    {
      if (objc_msgSend(v5, "feedbackType") == 2 && !self->_inActionWindow)
      {
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v52) = 0;
          _os_log_impl(&dword_1A07F4000, v27, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Ended - received next vended suggestions event.", (uint8_t *)&v52, 2u);
        }

        -[_PSCNAutocompleteFeedbackTracker logImpressionsFromAccumulator:](self, "logImpressionsFromAccumulator:", self->_accumulator);
        accumulator = self->_accumulator;
        self->_accumulator = 0;

      }
    }
    else
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v52) = 0;
        _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Ended - moved past previous interaction (action).", (uint8_t *)&v52, 2u);
      }

      -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithInteraction:](self->_accumulator, "updateWithInteraction:", self->_followingInteractionPrevious);
      -[_PSCNAutocompleteFeedbackTracker logImpressionsFromAccumulator:](self, "logImpressionsFromAccumulator:", self->_accumulator);
      -[_PSCNAutocompleteFeedbackTracker logActionFromAccumulator:](self, "logActionFromAccumulator:", self->_accumulator);
      v26 = self->_accumulator;
      self->_accumulator = 0;

      self->_inActionWindow = 0;
    }
  }
  v29 = self->_followingInteraction;
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29)
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      dateFormatter = self->_dateFormatter;
      objc_msgSend(v5, "reportTime");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sourceBundleIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isImplicit"))
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      v39 = objc_msgSend(v5, "feedbackType");
      v52 = 138413570;
      v53 = (int64_t)v34;
      v54 = 2112;
      v55 = v35;
      v56 = 2112;
      v57 = v36;
      v58 = 2112;
      v59 = v37;
      v60 = 2112;
      v61 = v38;
      v62 = 2048;
      v63 = v39;
      _os_log_impl(&dword_1A07F4000, v31, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Processing event reported on %@ for user %@, for %@, reported by %@, implicit=%@, of type %lu.", (uint8_t *)&v52, 0x3Eu);

    }
    if (!self->_accumulator && objc_msgSend(v5, "feedbackType") == 2)
    {
      -[_CDInteraction startDate](self->_followingInteraction, "startDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reportTime");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeIntervalSinceDate:", v41);
      v43 = v42;
      maxSecondsBetweenImpressionAndAction = (double)self->_maxSecondsBetweenImpressionAndAction;

      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
      if (v43 <= maxSecondsBetweenImpressionAndAction)
      {
        if (v46)
        {
          v49 = self->_maxSecondsBetweenImpressionAndAction;
          v52 = 134217984;
          v53 = v49;
          _os_log_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Started - within %ld seconds of next interaction (action).", (uint8_t *)&v52, 0xCu);
        }

        self->_inActionWindow = 1;
      }
      else
      {
        if (v46)
        {
          LOWORD(v52) = 0;
          _os_log_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_DEFAULT, "_PSCNAutocompleteFeedbackTracker: Session Started - received vended suggestions event too far away from interaction (action).", (uint8_t *)&v52, 2u);
        }

      }
      v50 = (_PSCNAutocompleteFeedbackSessionAccumulator *)objc_opt_new();
      v51 = self->_accumulator;
      self->_accumulator = v50;

    }
    -[_PSCNAutocompleteFeedbackSessionAccumulator updateWithFeedback:](self->_accumulator, "updateWithFeedback:", v5);
  }
  else
  {
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[_PSCNAutocompleteFeedbackTracker processFeedbackWithInferredEnterAndExit:].cold.2((uint64_t)self, v5);

    objc_msgSend(v5, "reportTime");
    v47 = (NSDate *)objc_claimAutoreleasedReturnValue();
    stopTime = self->_stopTime;
    self->_stopTime = v47;

  }
LABEL_9:

}

- (void)finish
{
  if (self->_shouldInferEnterAndExit)
    -[_PSCNAutocompleteFeedbackTracker finishWithInferredEnterAndExit](self, "finishWithInferredEnterAndExit");
  else
    -[_PSCNAutocompleteFeedbackTracker finishWithoutInferredEnterAndExit](self, "finishWithoutInferredEnterAndExit");
}

- (void)finishWithInferredEnterAndExit
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 80), "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringFromDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v4, v5, "_PSCNAutocompleteFeedbackTracker: Finished iterating through feedback events. Setting stop time to %@.", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

- (NSDate)stopTime
{
  return self->_stopTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTime, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_followingInteraction, 0);
  objc_storeStrong((id *)&self->_followingInteractionPrevious, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong(&self->_actionLogger, 0);
  objc_storeStrong(&self->_submodelImpressionLogger, 0);
  objc_storeStrong(&self->_impressionLogger, 0);
  objc_storeStrong((id *)&self->_interactionIterator, 0);
}

- (void)logImpressionsFromAccumulator:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A07F4000, log, OS_LOG_TYPE_ERROR, "_PSCNAutocompleteFeedbackTracker: Error when attempting to log impressions for session. Skipping.", v1, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)processFeedbackWithInferredEnterAndExit:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "_PSAutocompleteFeedbackTracker: Feedback event is enter or exit event. Skipping as we are running in inferred enter / exit mode.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)processFeedbackWithInferredEnterAndExit:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 64);
  objc_msgSend(a2, "reportTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1A07F4000, v5, v6, "_PSCNAutocompleteFeedbackTracker: Interaction (action) iterator exhausted. Setting stop time to %@.", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)processFeedbackWithInferredEnterAndExit:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "_PSCNAutocompleteFeedbackTracker: Stop time already set; out of recorded interactions (actions). Deferring processin"
    "g of feedback event.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_9();
}

@end
