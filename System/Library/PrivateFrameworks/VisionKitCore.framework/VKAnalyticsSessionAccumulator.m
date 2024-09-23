@implementation VKAnalyticsSessionAccumulator

- (VKAnalyticsSessionAccumulator)initWithAnalysis:(id)a3 customIdentifier:(id)a4
{
  id v7;
  id v8;
  VKAnalyticsSessionAccumulator *v9;
  VKAnalyticsSessionAccumulator *v10;
  uint64_t v11;
  NSDate *sessionOpenDate;
  NSString *v13;
  void *bundleIdentifier;
  uint64_t v15;
  NSString *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VKAnalyticsSessionAccumulator;
  v9 = -[VKAnalyticsSessionAccumulator init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_analysis, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = objc_claimAutoreleasedReturnValue();
    sessionOpenDate = v10->_sessionOpenDate;
    v10->_sessionOpenDate = (NSDate *)v11;

    if (v8)
    {
      v13 = (NSString *)v8;
      bundleIdentifier = v10->_bundleIdentifier;
      v10->_bundleIdentifier = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      bundleIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(bundleIdentifier, "bundleIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v10->_bundleIdentifier;
      v10->_bundleIdentifier = (NSString *)v15;

    }
    v10->_isPerformingAutomatedTest = +[VKCInternalSettings isPerformingAutomatedTest](VKCInternalSettings, "isPerformingAutomatedTest");
  }

  return v10;
}

- (void)addEvent:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  switch(objc_msgSend(v7, "type"))
  {
    case 2:
      -[VKAnalyticsSessionAccumulator textEvents](self, "textEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textEvent");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[VKAnalyticsSessionAccumulator ddEvents](self, "ddEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ddEvent");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      -[VKAnalyticsSessionAccumulator mrcEvents](self, "mrcEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mrcEvent");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[VKAnalyticsSessionAccumulator quickActionEvents](self, "quickActionEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "quickActionEvent");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      -[VKAnalyticsSessionAccumulator vsEvents](self, "vsEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "visualSearchEvent");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      -[VKAnalyticsSessionAccumulator subjectEvents](self, "subjectEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "subjectEvent");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8:
      -[VKAnalyticsSessionAccumulator interactionEvents](self, "interactionEvents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "interactionEvent");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = (void *)v5;
      objc_msgSend(v4, "addObject:", v5);

      break;
    default:
      break;
  }

}

- (NSMutableArray)interactionEvents
{
  NSMutableArray *interactionEvents;
  NSMutableArray *v4;
  NSMutableArray *v5;

  interactionEvents = self->_interactionEvents;
  if (!interactionEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_interactionEvents;
    self->_interactionEvents = v4;

    interactionEvents = self->_interactionEvents;
  }
  return interactionEvents;
}

- (NSMutableArray)textEvents
{
  NSMutableArray *textEvents;
  NSMutableArray *v4;
  NSMutableArray *v5;

  textEvents = self->_textEvents;
  if (!textEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_textEvents;
    self->_textEvents = v4;

    textEvents = self->_textEvents;
  }
  return textEvents;
}

- (NSMutableArray)quickActionEvents
{
  NSMutableArray *quickActionEvents;
  NSMutableArray *v4;
  NSMutableArray *v5;

  quickActionEvents = self->_quickActionEvents;
  if (!quickActionEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_quickActionEvents;
    self->_quickActionEvents = v4;

    quickActionEvents = self->_quickActionEvents;
  }
  return quickActionEvents;
}

- (NSMutableArray)mrcEvents
{
  NSMutableArray *mrcEvents;
  NSMutableArray *v4;
  NSMutableArray *v5;

  mrcEvents = self->_mrcEvents;
  if (!mrcEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_mrcEvents;
    self->_mrcEvents = v4;

    mrcEvents = self->_mrcEvents;
  }
  return mrcEvents;
}

- (NSMutableArray)ddEvents
{
  NSMutableArray *ddEvents;
  NSMutableArray *v4;
  NSMutableArray *v5;

  ddEvents = self->_ddEvents;
  if (!ddEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_ddEvents;
    self->_ddEvents = v4;

    ddEvents = self->_ddEvents;
  }
  return ddEvents;
}

- (NSMutableArray)vsEvents
{
  NSMutableArray *vsEvents;
  NSMutableArray *v4;
  NSMutableArray *v5;

  vsEvents = self->_vsEvents;
  if (!vsEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_vsEvents;
    self->_vsEvents = v4;

    vsEvents = self->_vsEvents;
  }
  return vsEvents;
}

- (NSMutableArray)subjectEvents
{
  NSMutableArray *subjectEvents;
  NSMutableArray *v4;
  NSMutableArray *v5;

  subjectEvents = self->_subjectEvents;
  if (!subjectEvents)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_subjectEvents;
    self->_subjectEvents = v4;

    subjectEvents = self->_subjectEvents;
  }
  return subjectEvents;
}

- (void)close
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator sessionOpenDate](self, "sessionOpenDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  -[VKAnalyticsSessionAccumulator setSessionDuration:](self, "setSessionDuration:");

  -[VKAnalyticsSessionAccumulator analysis](self, "analysis");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageAnalysisResult");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[VKAnalyticsSessionAccumulator setNumberOfDDEvents:](self, "setNumberOfDDEvents:", -[NSMutableArray count](self->_ddEvents, "count"));
  -[VKAnalyticsSessionAccumulator setNumberOfVSEvents:](self, "setNumberOfVSEvents:", -[NSMutableArray count](self->_vsEvents, "count"));
  -[VKAnalyticsSessionAccumulator setNumberOfTextEvents:](self, "setNumberOfTextEvents:", -[NSMutableArray count](self->_textEvents, "count"));
  -[VKAnalyticsSessionAccumulator setNumberOfMRCEvents:](self, "setNumberOfMRCEvents:", -[NSMutableArray count](self->_mrcEvents, "count"));
  -[VKAnalyticsSessionAccumulator setNumberOfQuickActionEvents:](self, "setNumberOfQuickActionEvents:", -[NSMutableArray count](self->_quickActionEvents, "count"));
  -[VKAnalyticsSessionAccumulator setNumberOfSubjectEvents:](self, "setNumberOfSubjectEvents:", -[NSMutableArray count](self->_subjectEvents, "count"));
  objc_msgSend(v11, "mrcDataDetectorElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator setNumberOfMRCElements:](self, "setNumberOfMRCElements:", objc_msgSend(v6, "count"));

  objc_msgSend(v11, "visualSearchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator setNumberOfVSElements:](self, "setNumberOfVSElements:", objc_msgSend(v8, "count"));

  objc_msgSend(v11, "dataDetectors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator setNumberOfDDElements:](self, "setNumberOfDDElements:", objc_msgSend(v9, "count"));

  objc_msgSend(v11, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator setTextLength:](self, "setTextLength:", objc_msgSend(v10, "length"));

  -[VKAnalyticsSessionAccumulator calculateAverageSelectedLengthFromTextEvents](self, "calculateAverageSelectedLengthFromTextEvents");
  -[VKAnalyticsSessionAccumulator calculateDidHighlightAll](self, "calculateDidHighlightAll");
  -[VKAnalyticsSessionAccumulator calculateDidActivateRegex](self, "calculateDidActivateRegex");

}

- (void)calculateAverageSelectedLengthFromTextEvents
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[VKAnalyticsSessionAccumulator textEvents](self, "textEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__VKAnalyticsSessionAccumulator_calculateAverageSelectedLengthFromTextEvents__block_invoke;
  v6[3] = &unk_1E9463DC8;
  v6[4] = &v11;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  -[VKAnalyticsSessionAccumulator setNumberOfSelectionChanges:](self, "setNumberOfSelectionChanges:", v8[3]);
  v4 = v8[3];
  if (v4 < 1)
    v5 = 0;
  else
    v5 = (unint64_t)(double)(v12[3] / v4);
  -[VKAnalyticsSessionAccumulator setAverageTextSelectionLength:](self, "setAverageTextSelectionLength:", v5);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

void __77__VKAnalyticsSessionAccumulator_calculateAverageSelectedLengthFromTextEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!objc_msgSend(v3, "eventType"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "selectionLength");
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }

}

- (void)calculateDidHighlightAll
{
  id v3;

  -[VKAnalyticsSessionAccumulator interactionEvents](self, "interactionEvents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator setDidActivateHighlightAll:](self, "setDidActivateHighlightAll:", objc_msgSend(v3, "vk_containsObjectPassingTest:", &__block_literal_global_13));

}

BOOL __57__VKAnalyticsSessionAccumulator_calculateDidHighlightAll__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventType") == 0;
}

- (void)calculateDidActivateRegex
{
  id v3;

  -[VKAnalyticsSessionAccumulator interactionEvents](self, "interactionEvents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator setDidActivateRegex:](self, "setDidActivateRegex:", objc_msgSend(v3, "vk_containsObjectPassingTest:", &__block_literal_global_58));

}

BOOL __58__VKAnalyticsSessionAccumulator_calculateDidActivateRegex__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventType") == 3;
}

- (NSDictionary)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[17];
  _QWORD v24[19];

  v24[17] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("numberOfTextEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfTextEvents](self, "numberOfTextEvents"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("numberOfMRCEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfMRCEvents](self, "numberOfMRCEvents"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("numberOfDDEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfDDEvents](self, "numberOfDDEvents"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("numberOfVSEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfVSEvents](self, "numberOfVSEvents"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("numberOfQuickActionEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfQuickActionEvents](self, "numberOfQuickActionEvents"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("numberOfSubjectEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfSubjectEvents](self, "numberOfSubjectEvents"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  v23[6] = CFSTR("numberOfMRCElements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfMRCElements](self, "numberOfMRCElements"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = CFSTR("numberOfDDElements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfDDElements](self, "numberOfDDElements"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = CFSTR("numberOfVSElements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfVSElements](self, "numberOfVSElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v3;
  v23[9] = CFSTR("textLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator textLength](self, "textLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v4;
  v23[10] = CFSTR("averageTextSelectionLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator averageTextSelectionLength](self, "averageTextSelectionLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v5;
  v23[11] = CFSTR("numberOfSelectionChanges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VKAnalyticsSessionAccumulator numberOfSelectionChanges](self, "numberOfSelectionChanges"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v6;
  v23[12] = CFSTR("didActivateHighlightAll");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsSessionAccumulator didActivateHighlightAll](self, "didActivateHighlightAll"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v7;
  v23[13] = CFSTR("didActivateRegexHighlight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsSessionAccumulator didActivateRegex](self, "didActivateRegex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v8;
  v23[14] = CFSTR("sessionDuration");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[VKAnalyticsSessionAccumulator sessionDuration](self, "sessionDuration");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v10;
  v23[15] = CFSTR("automatedTest");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VKAnalyticsSessionAccumulator isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v11;
  v23[16] = CFSTR("bundleIdentifier");
  -[VKAnalyticsSessionAccumulator bundleIdentifier](self, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v13;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  objc_super v25;

  v24 = (void *)MEMORY[0x1E0CB3940];
  v25.receiver = self;
  v25.super_class = (Class)VKAnalyticsSessionAccumulator;
  -[VKAnalyticsSessionAccumulator description](&v25, sel_description);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator sessionDuration](self, "sessionDuration");
  v4 = v3;
  v22 = -[VKAnalyticsSessionAccumulator numberOfTextEvents](self, "numberOfTextEvents");
  v21 = -[VKAnalyticsSessionAccumulator numberOfMRCEvents](self, "numberOfMRCEvents");
  v20 = -[VKAnalyticsSessionAccumulator numberOfDDEvents](self, "numberOfDDEvents");
  v19 = -[VKAnalyticsSessionAccumulator numberOfVSEvents](self, "numberOfVSEvents");
  v18 = -[VKAnalyticsSessionAccumulator numberOfQuickActionEvents](self, "numberOfQuickActionEvents");
  v17 = -[VKAnalyticsSessionAccumulator numberOfSubjectEvents](self, "numberOfSubjectEvents");
  v5 = -[VKAnalyticsSessionAccumulator numberOfMRCElements](self, "numberOfMRCElements");
  v6 = -[VKAnalyticsSessionAccumulator numberOfDDElements](self, "numberOfDDElements");
  v7 = -[VKAnalyticsSessionAccumulator numberOfVSElements](self, "numberOfVSElements");
  v8 = -[VKAnalyticsSessionAccumulator textLength](self, "textLength");
  v9 = -[VKAnalyticsSessionAccumulator averageTextSelectionLength](self, "averageTextSelectionLength");
  v10 = -[VKAnalyticsSessionAccumulator numberOfSelectionChanges](self, "numberOfSelectionChanges");
  VKMUIStringForBool(-[VKAnalyticsSessionAccumulator didActivateHighlightAll](self, "didActivateHighlightAll"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsSessionAccumulator didActivateRegex](self, "didActivateRegex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  VKMUIStringForBool(-[VKAnalyticsSessionAccumulator isPerformingAutomatedTest](self, "isPerformingAutomatedTest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKAnalyticsSessionAccumulator bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@ \n sessionDuration: %f seconds\n numberOfTextEvents: %lu \n numberOfMRCEvents: %lu \n numberOfDDEvents: %lu \n numberOfVSEvents: %lu \n numberOfQuickActionEvents: %lu \n numberOfSubjectEvents: %lu \n numberOfMRCElements: %lu \n numberOfDDElements: %lu \n numberOfVSElements: %lu \n textLength: %lu \n averageTextSelectionLength: %lu \n numberOfSelectionChanges: %lu \n didActivateHighlightAll: %@ \n didActivateRegexHighlight: %@ \n automatedTest: %@ \n bundleIdentifier: %@ \n "), v23, v4, v22, v21, v20, v19, v18, v17, v5, v6, v7, v8, v9, v10, v11, v12,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (VKCImageAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysis:(id)a3
{
  objc_storeStrong((id *)&self->_analysis, a3);
}

- (void)setInteractionEvents:(id)a3
{
  objc_storeStrong((id *)&self->_interactionEvents, a3);
}

- (void)setTextEvents:(id)a3
{
  objc_storeStrong((id *)&self->_textEvents, a3);
}

- (void)setQuickActionEvents:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionEvents, a3);
}

- (void)setMrcEvents:(id)a3
{
  objc_storeStrong((id *)&self->_mrcEvents, a3);
}

- (void)setDdEvents:(id)a3
{
  objc_storeStrong((id *)&self->_ddEvents, a3);
}

- (void)setVsEvents:(id)a3
{
  objc_storeStrong((id *)&self->_vsEvents, a3);
}

- (void)setSubjectEvents:(id)a3
{
  objc_storeStrong((id *)&self->_subjectEvents, a3);
}

- (NSDate)sessionOpenDate
{
  return self->_sessionOpenDate;
}

- (void)setSessionOpenDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionOpenDate, a3);
}

- (BOOL)didSelectText
{
  return self->_didSelectText;
}

- (void)setDidSelectText:(BOOL)a3
{
  self->_didSelectText = a3;
}

- (unint64_t)numberOfEvents
{
  return self->_numberOfEvents;
}

- (void)setNumberOfEvents:(unint64_t)a3
{
  self->_numberOfEvents = a3;
}

- (unint64_t)numberOfTextEvents
{
  return self->_numberOfTextEvents;
}

- (void)setNumberOfTextEvents:(unint64_t)a3
{
  self->_numberOfTextEvents = a3;
}

- (unint64_t)numberOfMRCEvents
{
  return self->_numberOfMRCEvents;
}

- (void)setNumberOfMRCEvents:(unint64_t)a3
{
  self->_numberOfMRCEvents = a3;
}

- (unint64_t)numberOfDDEvents
{
  return self->_numberOfDDEvents;
}

- (void)setNumberOfDDEvents:(unint64_t)a3
{
  self->_numberOfDDEvents = a3;
}

- (unint64_t)numberOfVSEvents
{
  return self->_numberOfVSEvents;
}

- (void)setNumberOfVSEvents:(unint64_t)a3
{
  self->_numberOfVSEvents = a3;
}

- (unint64_t)numberOfQuickActionEvents
{
  return self->_numberOfQuickActionEvents;
}

- (void)setNumberOfQuickActionEvents:(unint64_t)a3
{
  self->_numberOfQuickActionEvents = a3;
}

- (unint64_t)numberOfSubjectEvents
{
  return self->_numberOfSubjectEvents;
}

- (void)setNumberOfSubjectEvents:(unint64_t)a3
{
  self->_numberOfSubjectEvents = a3;
}

- (unint64_t)numberOfMRCElements
{
  return self->_numberOfMRCElements;
}

- (void)setNumberOfMRCElements:(unint64_t)a3
{
  self->_numberOfMRCElements = a3;
}

- (unint64_t)numberOfDDElements
{
  return self->_numberOfDDElements;
}

- (void)setNumberOfDDElements:(unint64_t)a3
{
  self->_numberOfDDElements = a3;
}

- (unint64_t)numberOfVSElements
{
  return self->_numberOfVSElements;
}

- (void)setNumberOfVSElements:(unint64_t)a3
{
  self->_numberOfVSElements = a3;
}

- (unint64_t)textLength
{
  return self->_textLength;
}

- (void)setTextLength:(unint64_t)a3
{
  self->_textLength = a3;
}

- (unint64_t)averageTextSelectionLength
{
  return self->_averageTextSelectionLength;
}

- (void)setAverageTextSelectionLength:(unint64_t)a3
{
  self->_averageTextSelectionLength = a3;
}

- (unint64_t)numberOfSelectionChanges
{
  return self->_numberOfSelectionChanges;
}

- (void)setNumberOfSelectionChanges:(unint64_t)a3
{
  self->_numberOfSelectionChanges = a3;
}

- (BOOL)didActivateHighlightAll
{
  return self->_didActivateHighlightAll;
}

- (void)setDidActivateHighlightAll:(BOOL)a3
{
  self->_didActivateHighlightAll = a3;
}

- (BOOL)didActivateRegex
{
  return self->_didActivateRegex;
}

- (void)setDidActivateRegex:(BOOL)a3
{
  self->_didActivateRegex = a3;
}

- (double)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(double)a3
{
  self->_sessionDuration = a3;
}

- (BOOL)isPerformingAutomatedTest
{
  return self->_isPerformingAutomatedTest;
}

- (void)setIsPerformingAutomatedTest:(BOOL)a3
{
  self->_isPerformingAutomatedTest = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionOpenDate, 0);
  objc_storeStrong((id *)&self->_subjectEvents, 0);
  objc_storeStrong((id *)&self->_vsEvents, 0);
  objc_storeStrong((id *)&self->_ddEvents, 0);
  objc_storeStrong((id *)&self->_mrcEvents, 0);
  objc_storeStrong((id *)&self->_quickActionEvents, 0);
  objc_storeStrong((id *)&self->_textEvents, 0);
  objc_storeStrong((id *)&self->_interactionEvents, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

@end
