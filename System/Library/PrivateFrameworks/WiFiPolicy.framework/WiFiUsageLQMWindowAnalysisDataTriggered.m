@implementation WiFiUsageLQMWindowAnalysisDataTriggered

- (WiFiUsageLQMWindowAnalysisDataTriggered)initWithRollingWindow:(id)a3 andSubReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  int v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WiFiUsageLQMWindowAnalysisDataTriggered *v17;
  WiFiUsageLQMWindowAnalysisDataTriggered *v18;
  uint64_t v19;
  NSArray *triggerCriteriaList;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *v37;
  NSArray *v38;
  void *v39;
  void *v40;
  NSString **p_dataTriggerReason;
  id v43;
  id v44;
  id v45;
  id v46;
  id obj;
  objc_super v48;
  objc_super v49;
  objc_super v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v9 = *(_DWORD *)&a5.var0;
  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (id)objc_msgSend(v12, "evaluateCriteriaWithStopUponFirstMatch:", 0);
  v55.receiver = self;
  v55.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  v17 = -[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:](&v55, sel_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue_, v12, CFSTR("DataTriggered"), *(_QWORD *)&v9 & 0xFFFFFFLL, v14, v15);
  v18 = v17;
  if (v17)
  {
    v43 = v15;
    v44 = v14;
    v45 = v13;
    p_dataTriggerReason = &v17->_dataTriggerReason;
    objc_storeStrong((id *)&v17->_dataTriggerReason, a4);
    objc_msgSend(v12, "getTriggerCriteriaList");
    v19 = objc_claimAutoreleasedReturnValue();
    triggerCriteriaList = v18->_triggerCriteriaList;
    v18->_triggerCriteriaList = (NSArray *)v19;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v46 = v12;
    objc_msgSend(v12, "features");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v52 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v25, "fieldName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v25, "isPerSecond");
          v29 = &stru_1E881F240;
          if (v28)
            v29 = CFSTR("PerSecond");
          objc_msgSend(v26, "stringWithFormat:", CFSTR("median_%@%@"), v27, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = (void *)objc_opt_new();
          v50.receiver = v18;
          v50.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
          -[WiFiUsageLQMWindowAnalysis lqmWindowsFeatures](&v50, sel_lqmWindowsFeatures);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v31, v30);

          objc_msgSend(v25, "median");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v49.receiver = v18;
          v49.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
          -[WiFiUsageLQMWindowAnalysis lqmWindowsFeatures](&v49, sel_lqmWindowsFeatures);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v30);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v33, CFSTR("before"));

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v22);
    }

    v48.receiver = v18;
    v48.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
    -[WiFiUsageLQMWindowAnalysis reason](&v48, sel_reason);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *p_dataTriggerReason;
    v38 = v18->_triggerCriteriaList;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("matched == YES OR lastTriggered != NIL"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](v38, "filteredArrayUsingPredicate:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: LQM window analysis triggered by %@ (%@) with matched or match-ended criterias: %@"), "-[WiFiUsageLQMWindowAnalysisDataTriggered initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:]", v36, v37, v40);

    v13 = v45;
    v12 = v46;
    v15 = v43;
    v14 = v44;
  }

  return v18;
}

- (void)performAnalysis
{
  void *v3;
  NSString *dataTriggerReason;
  NSArray *triggerCriteriaList;
  void *v6;
  void *v7;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  -[WiFiUsageLQMWindowAnalysis reason](&v9, sel_reason);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dataTriggerReason = self->_dataTriggerReason;
  triggerCriteriaList = self->_triggerCriteriaList;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("matched == YES OR lastTriggered != NIL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](triggerCriteriaList, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%s: Performing LQM window analysis triggered by %@ (%@) with matched or match-ended criterias: %@"), "-[WiFiUsageLQMWindowAnalysisDataTriggered performAnalysis]", v3, dataTriggerReason, v7);

  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  -[WiFiUsageLQMWindowAnalysis performAnalysis](&v8, sel_performAnalysis);
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  NSArray *obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  v5 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](&v27, sel_addDimensionsTo_, v4);
  v21 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_dataTriggerReason, CFSTR("datatriggeredReason"));
  v6 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = self->_triggerCriteriaList;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v11, "valid") & 1) != 0
          || !-[NSString isEqualToString:](self->_dataTriggerReason, "isEqualToString:", CFSTR("Match Start")))
        {
          objc_msgSend(v11, "shortPredicateNoSpaces");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "matched");
          v14 = CFSTR("false");
          if (v13)
            v14 = CFSTR("true");
          objc_msgSend(v6, "appendFormat:", CFSTR("%@:%@&"), v12, v14);

          objc_msgSend(v11, "lastTriggered");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v11, "lastTriggered");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "firstTriggered");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceDate:", v17);
            +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:As:](WiFiUsageLQMTransformations, "getBinTimeIntervalUpTo12h:As:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("datatriggered_criteria%lu_duration"), -[NSArray indexOfObject:](self->_triggerCriteriaList, "indexOfObject:", v11));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v18, v19);

          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v6, CFSTR("datatriggeredCriteria"));
  return v21;
}

- (NSArray)triggerCriteriaList
{
  return self->_triggerCriteriaList;
}

- (NSString)dataTriggerReason
{
  return self->_dataTriggerReason;
}

- (void)setDataTriggerReason:(id)a3
{
  objc_storeStrong((id *)&self->_dataTriggerReason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTriggerReason, 0);
  objc_storeStrong((id *)&self->_triggerCriteriaList, 0);
}

@end
