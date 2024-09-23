@implementation TIKBUserModel

- (void)sessionDidEnd:(id)a3 aligned:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[TIFavoniusTypingSessionAnalyzer favoniusTypingSessionAnalyzerForUserModel:](TIFavoniusTypingSessionAnalyzer, "favoniusTypingSessionAnalyzerForUserModel:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "analyzeSession:alignedSession:withConfidence:", v7, v6, objc_msgSend(v8, "evaluateConfidenceInSession:alignedSession:", v7, v6));

}

- (TIKBUserModel)initWithInputMode:(id)a3 userModelDataStore:(id)a4 metricDescriptorRegistry:(id)a5 fromDate:(id)a6
{
  id v11;
  TIKBUserModel *v12;
  TIKBUserModel *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TIKBUserModel;
  v12 = -[TIUserModel initWithInputMode:userModelDataStore:weeklyMetricKeys:fromDate:explicitTearDown:](&v15, sel_initWithInputMode_userModelDataStore_weeklyMetricKeys_fromDate_explicitTearDown_, a3, a4, 0, a6, 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_metricDescriptorRegistry, a5);
    -[TIUserModel setConfigurationDelegate:](v13, "setConfigurationDelegate:", v13);
  }

  return v13;
}

- (Class)userModelValuesClass
{
  return (Class)objc_opt_class();
}

- (id)durableCounterKeys
{
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v3[0] = kFeatureCounterTotalWordsTyped;
  v3[1] = kFeatureCounterTotalWordsPathed;
  v3[2] = kFeatureCounterTotalWordsAutocorrected;
  v3[3] = kFeatureCounterTotalWordsFromCandidateBar;
  v3[4] = kFeatureCounterTotalWordsTypedOnFloatingKeyboard;
  v3[5] = kFeatureCounterTotalWordsTypedInSecondaryLanguage;
  v3[6] = kFeedbackCounterAutocorrectionEnablementCorrectedWords;
  v3[7] = kFeedbackCounterAutocorrectionEnablementTappedWords;
  v3[8] = kFeedbackCounterAutocorrectionEnablementRevisedWords;
  v3[9] = kFeedbackCounterAutocorrectionEnablementRevisedCorrectedWords;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)settingsDictionary
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DBE260];
  v21[0] = *MEMORY[0x1E0DBE278];
  v21[1] = v4;
  v5 = *MEMORY[0x1E0DBDF70];
  v21[2] = *MEMORY[0x1E0DBE1D8];
  v21[3] = v5;
  v6 = *MEMORY[0x1E0DBE400];
  v21[4] = *MEMORY[0x1E0DBE388];
  v21[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v3, "BOOLForPreferenceKey:", v12, (_QWORD)v16);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v2;
}

- (void)trackPowerLogIfNecessary
{
  void *v2;
  int v3;
  void *v4;

  -[TIKBUserModel dictForPowerLog](self, "dictForPowerLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = PLShouldLogRegisteredEvent();
    v2 = v4;
    if (v3)
    {
      PLLogRegisteredEvent();
      v2 = v4;
    }
  }

}

- (id)dictForPowerLog
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id obj;
  uint64_t v51;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[6];
  _QWORD v59[6];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[TIUserModel contexts](self, "contexts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  if (v53)
  {
    v51 = *(_QWORD *)v55;
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v55 != v51)
          objc_enumerationMutation(obj);
        -[TIUserModel valuesFromContext:](self, "valuesFromContext:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "getTransientCounterForKey:", kFeatureValueWithWordLenPathEligibleWordsTapped);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "currentCounts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          v12 = 0;
          do
          {
            objc_msgSend(v11, "objectAtIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "intValue");

            v5 = (v14 + v5);
            v4 = (v4 + v14 * (v12++ + 2));
          }
          while (v12 != objc_msgSend(v11, "count"));
        }
        objc_msgSend(v9, "getTransientCounterForKey:", kFeatureValueWithWordLenPathIneligibleWordsTapped);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "currentCounts");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "count"))
        {
          v17 = 0;
          do
          {
            objc_msgSend(v16, "objectAtIndex:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "intValue");

            v5 = (v19 + v5);
            v4 = (v4 + v19 * (v17++ + 2));
          }
          while (v17 != objc_msgSend(v16, "count"));
        }
        objc_msgSend(v9, "getTransientCounterForKey:", kFeatureValueWithWordLenWholeWordsPathed);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "currentCounts");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "count"))
        {
          v22 = 0;
          do
          {
            objc_msgSend(v21, "objectAtIndex:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "intValue");

            v3 = (v24 + v3);
            v2 = (v2 + v24 * (v22++ + 2));
          }
          while (v22 != objc_msgSend(v21, "count"));
        }
        objc_msgSend(v9, "getTransientCounterForKey:", kFeatureValueWithWordLenWordCompletionsPathed);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "currentCounts");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v26, "count"))
        {
          v27 = 0;
          do
          {
            objc_msgSend(v26, "objectAtIndex:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "intValue");

            v3 = (v29 + v3);
            v2 = (v2 + v29 * (v27++ + 2));
          }
          while (v27 != objc_msgSend(v26, "count"));
        }
        objc_msgSend(v9, "getTransientCounterForKey:", kFeatureCounterDurationTappedWords);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "currentCounts");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v31, "count"))
        {
          v32 = 0;
          do
          {
            objc_msgSend(v31, "objectAtIndex:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "doubleValue");
            v35 = v34;

            v7 = v7 + v35;
            ++v32;
          }
          while (v32 != objc_msgSend(v31, "count"));
        }
        objc_msgSend(v9, "getTransientCounterForKey:", kFeatureCounterDurationPathedWords);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "currentCounts");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "count"))
        {
          v38 = 0;
          do
          {
            objc_msgSend(v37, "objectAtIndex:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            v41 = v40;

            v6 = v6 + v41;
            ++v38;
          }
          while (v38 != objc_msgSend(v37, "count"));
        }

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v53);
  }
  else
  {
    v6 = 0.0;
    v7 = 0.0;
  }

  if (v3 | v5)
  {
    v58[0] = CFSTR("WordsTapped");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v43;
    v58[1] = CFSTR("CharactersTapped");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v44;
    v58[2] = CFSTR("WordsPathed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v45;
    v58[3] = CFSTR("CharactersPathed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v46;
    v58[4] = CFSTR("TimeSpentPathTyping");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 / 1000.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v59[4] = v47;
    v58[5] = CFSTR("TimeSpentTapTyping");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 / 1000.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v59[5] = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 6);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }
  return v42;
}

- (void)dispatchFeedbackAnalyzers:(id)a3 aligned:(id)a4 revisionRateAnalysisSummary:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  +[TIAutocorrectionFeedbackAnalyzer analyzerForUserModel:revisionRateAnalysisSummary:](TIAutocorrectionFeedbackAnalyzer, "analyzerForUserModel:revisionRateAnalysisSummary:", self, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "analyzeSession:alignedSession:withConfidence:", v9, v8, objc_msgSend(v10, "evaluateConfidenceInSession:alignedSession:", v9, v8));

}

- (void)doLoad
{
  TIMetricDescriptorRegistry *v3;
  TIMetricDescriptorRegistry *metricDescriptorRegistry;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_metricDescriptorRegistry)
  {
    +[TIMetricDescriptorRegistry registry](TIMetricDescriptorRegistry, "registry");
    v3 = (TIMetricDescriptorRegistry *)objc_claimAutoreleasedReturnValue();
    metricDescriptorRegistry = self->_metricDescriptorRegistry;
    self->_metricDescriptorRegistry = v3;

  }
  -[TIUserModel weeklyMetricKeys](self, "weeklyMetricKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "addObject:", kFeatureCounterWithWordLenWordsTypedOnFloatingKeyboard);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenWholeWordsPathed);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenWordCompletionsPathed);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenPathEligibleWordsTapped);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenPathIneligibleWordsTapped);
    objc_msgSend(v6, "addObject:", kFeatureCounterDurationPathedWords);
    objc_msgSend(v6, "addObject:", kFeatureCounterDurationTappedWords);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenWholeWordsPathed);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenWordCompletionsPathed);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenPathEligibleWordsTapped);
    objc_msgSend(v6, "addObject:", kFeatureValueWithWordLenPathIneligibleWordsTapped);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[TIMetricDescriptorRegistry allMetricDescriptors](self->_metricDescriptorRegistry, "allMetricDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
          if (objc_msgSend(v12, "isMemberOfClass:", objc_opt_class()))
            -[TIKBUserModel addDescriptor:toWeeklyMetricKeys:](self, "addDescriptor:toWeeklyMetricKeys:", v12, v6);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIUserModel setWeeklyMetricKeys:](self, "setWeeklyMetricKeys:", v13);

  }
  v14.receiver = self;
  v14.super_class = (Class)TIKBUserModel;
  -[TIUserModel doLoad](&v14, sel_doLoad);
}

- (void)addMetric:(id)a3 toWeeklyMetricKeys:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[TIMetricDescriptorRegistry metricDescriptorWithName:](self->_metricDescriptorRegistry, "metricDescriptorWithName:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
    -[TIKBUserModel addDescriptor:toWeeklyMetricKeys:](self, "addDescriptor:toWeeklyMetricKeys:", v6, v7);

}

- (void)addDescriptor:(id)a3 toWeeklyMetricKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "calculationExpression");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v6, "calculationDependencies", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[TIKBUserModel addMetric:toWeeklyMetricKeys:](self, "addMetric:toWeeklyMetricKeys:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13++), v7);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  else
  {
    objc_msgSend(v6, "metricName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

  }
}

- (id)valueForMetricWithName:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  -[TIUserModel valuesFromContext:](self, "valuesFromContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "metricValue:userModel:forNumberOfDays:", v7, self, *MEMORY[0x1E0DBEAB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)valuesByBucketedWordLengthForMetricWithName:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TIUserModel loadIfNecessary](self, "loadIfNecessary");
  -[TIUserModel valuesFromContext:](self, "valuesFromContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "metricValuesByWordLength:userModel:forNumberOfDays:", v7, self, *MEMORY[0x1E0DBEAB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (TIMetricDescriptorRegistry)metricDescriptorRegistry
{
  return self->_metricDescriptorRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricDescriptorRegistry, 0);
}

+ (TIKBUserModel)userModelWithInputMode:(id)a3 userModelDataStore:(id)a4
{
  return (TIKBUserModel *)objc_msgSend(a1, "userModelWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:", a3, a4, 0, 0);
}

+ (TIKBUserModel)userModelWithInputMode:(id)a3 userModelDataStore:(id)a4 metricDescriptorRegistry:(id)a5 fromDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  TIKBUserModel *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[TIKBUserModel initWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:]([TIKBUserModel alloc], "initWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:", v12, v11, v10, v9);

  return v13;
}

@end
