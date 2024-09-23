@implementation SBDockSuggestionsMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  _QWORD v12[5];

  v6 = a4;
  objc_msgSend(v6, "eventPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 == 9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABE08]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
    {
      v9 = -[SBDockSuggestionsMetric _trackEvent:withPayload:](self, "_trackEvent:withPayload:", 0, v8);

      goto LABEL_10;
    }

    goto LABEL_9;
  }
  if (a3 == 11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__SBDockSuggestionsMetric_handleEvent_withContext___block_invoke;
    v12[3] = &unk_1E8EA38B8;
    v12[4] = self;
    v9 = 1;
    objc_msgSend(v6, "stateForQueryName:completion:", 1, v12);
    goto LABEL_10;
  }
  if (a3 != 17)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v9 = -[SBDockSuggestionsMetric _trackEvent:withPayload:](self, "_trackEvent:withPayload:", 1, v7);
LABEL_10:

  return v9;
}

- (SBDockSuggestionsMetric)init
{
  SBDockSuggestionsMetric *v2;
  SBDockSuggestionsMetric *v3;
  void *v4;
  double v5;
  unint64_t v6;
  NSArray *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSArray *trackers;
  NSArray *v17;
  uint64_t v18;
  NSMutableDictionary *indexToSuggestionType;
  id v20;
  uint64_t v21;
  uint64_t v22;
  PETScalarEventTracker *enabledTracker;
  uint64_t v24;
  PETDistributionEventTracker *distTracker;
  SBDockSuggestionsMetric *v27;
  objc_super v28;
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SBDockSuggestionsMetric;
  v2 = -[SBDockSuggestionsMetric init](&v28, sel_init);
  v3 = v2;
  if (v2)
  {
    v27 = v2;
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberOfRecents");
    *(float *)&v5 = v5;
    v6 = vcvtms_u32_f32(*(float *)&v5);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = v6;
      do
      {
        v9 = (void *)MEMORY[0x1E0D80F20];
        v30[0] = &unk_1E91D21E0;
        v30[1] = &unk_1E91D21F8;
        v31[0] = CFSTR("recent");
        v31[1] = CFSTR("suggest");
        v30[2] = &unk_1E91D2210;
        v31[2] = CFSTR("badgedSuggest");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertyWithName:enumMapping:", CFSTR("suggType"), v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:", CFSTR("index"), 0, v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc(MEMORY[0x1E0D80F30]);
        v29[0] = v11;
        v29[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("SpringBoard"), CFSTR("suggShown"), CFSTR("suggTapped"), v14);

        -[NSArray addObject:](v7, "addObject:", v15);
        --v8;
      }
      while (v8);
    }
    v3 = v27;
    trackers = v27->_trackers;
    v27->_trackers = v7;
    v17 = v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    indexToSuggestionType = v27->_indexToSuggestionType;
    v27->_indexToSuggestionType = (NSMutableDictionary *)v18;

    v20 = objc_alloc(MEMORY[0x1E0D80F38]);
    v21 = MEMORY[0x1E0C9AA60];
    v22 = objc_msgSend(v20, "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("suggestionsEnabled"), MEMORY[0x1E0C9AA60]);
    enabledTracker = v27->_enabledTracker;
    v27->_enabledTracker = (PETScalarEventTracker *)v22;

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("SpringBoard"), CFSTR("suggestionsDist"), v21);
    distTracker = v27->_distTracker;
    v27->_distTracker = (PETDistributionEventTracker *)v24;

  }
  return v3;
}

- (BOOL)_trackEvent:(BOOL)a3 withPayload:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  NSMutableDictionary *indexToSuggestionType;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  _QWORD v31[2];
  _QWORD v32[3];

  v4 = a3;
  v32[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (!v4)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABDF8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    if (v20 < -[NSArray count](self->_trackers, "count"))
    {
      indexToSuggestionType = self->_indexToSuggestionType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](indexToSuggestionType, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

      -[NSArray objectAtIndexedSubscript:](self->_trackers, "objectAtIndexedSubscript:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v26;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "trackGoalConversionEventWithPropertyValues:", v28);

      -[PETDistributionEventTracker trackEventWithPropertyValues:value:](self->_distTracker, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], (double)v20);
      goto LABEL_6;
    }
LABEL_7:
    v29 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD50]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  if (v9 >= -[NSArray count](self->_trackers, "count"))
    goto LABEL_7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD58]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  -[NSArray objectAtIndexedSubscript:](self->_trackers, "objectAtIndexedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trackGoalOpportunityEventWithPropertyValues:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_indexToSuggestionType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v16, v18);

LABEL_6:
  v29 = 1;
LABEL_8:

  return v29;
}

uint64_t __51__SBDockSuggestionsMetric_handleEvent_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unsigned int v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DABD60]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "trackEventWithPropertyValues:setValue:", MEMORY[0x1E0C9AA60], v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distTracker, 0);
  objc_storeStrong((id *)&self->_indexToSuggestionType, 0);
  objc_storeStrong((id *)&self->_enabledTracker, 0);
  objc_storeStrong((id *)&self->_trackers, 0);
}

@end
