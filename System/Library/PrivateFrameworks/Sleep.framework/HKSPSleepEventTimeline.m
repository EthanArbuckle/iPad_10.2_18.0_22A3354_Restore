@implementation HKSPSleepEventTimeline

- (HKSPSleepEventTimeline)initWithOriginDate:(id)a3
{
  id v5;
  HKSPSleepEventTimeline *v6;
  HKSPSleepEventTimeline *v7;
  NSMutableArray *v8;
  NSMutableArray *orderedOccurrences;
  NSMutableArray *v10;
  NSMutableArray *timelineAdjustments;
  HKSPSleepEventTimeline *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSleepEventTimeline;
  v6 = -[HKSPSleepEventTimeline init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originDate, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    orderedOccurrences = v7->_orderedOccurrences;
    v7->_orderedOccurrences = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    timelineAdjustments = v7->_timelineAdjustments;
    v7->_timelineAdjustments = v10;

    v12 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKSPSleepEventTimeline *v4;
  uint64_t v5;
  NSDate *originDate;
  uint64_t v7;
  NSMutableArray *orderedOccurrences;
  uint64_t v9;
  NSMutableArray *timelineAdjustments;

  v4 = objc_alloc_init(HKSPSleepEventTimeline);
  v5 = -[NSDate copy](self->_originDate, "copy");
  originDate = v4->_originDate;
  v4->_originDate = (NSDate *)v5;

  v7 = -[NSMutableArray mutableCopy](self->_orderedOccurrences, "mutableCopy");
  orderedOccurrences = v4->_orderedOccurrences;
  v4->_orderedOccurrences = (NSMutableArray *)v7;

  v9 = -[NSMutableArray mutableCopy](self->_timelineAdjustments, "mutableCopy");
  timelineAdjustments = v4->_timelineAdjustments;
  v4->_timelineAdjustments = (NSMutableArray *)v9;

  return v4;
}

- (NSArray)resolvedOccurrences
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_orderedOccurrences, "copy");
}

- (NSArray)events
{
  void *v2;
  void *v3;

  -[HKSPSleepEventTimeline resolvedOccurrences](self, "resolvedOccurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __32__HKSPSleepEventTimeline_events__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v2, "windDownEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "windDownEvent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  objc_msgSend(v2, "bedtimeEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v2, "bedtimeEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  objc_msgSend(v2, "wakeUpEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  return v3;
}

- (NSArray)upcomingEvents
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HKSPSleepEventTimeline events](self, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__HKSPSleepEventTimeline_upcomingEvents__block_invoke;
  v6[3] = &unk_1E4E3A920;
  v6[4] = self;
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __40__HKSPSleepEventTimeline_upcomingEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_isAfterDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  return v4;
}

- (NSArray)previousEvents
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HKSPSleepEventTimeline events](self, "events");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__HKSPSleepEventTimeline_previousEvents__block_invoke;
  v7[3] = &unk_1E4E3A920;
  v7[4] = self;
  objc_msgSend(v3, "na_filter:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_reverse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __40__HKSPSleepEventTimeline_previousEvents__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "dueDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_isBeforeOrSameAsDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  return v4;
}

- (NSArray)upcomingResolvedOccurrences
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HKSPSleepEventTimeline resolvedOccurrences](self, "resolvedOccurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HKSPSleepEventTimeline_upcomingResolvedOccurrences__block_invoke;
  v6[3] = &unk_1E4E3CA68;
  v6[4] = self;
  objc_msgSend(v3, "na_filter:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __53__HKSPSleepEventTimeline_upcomingResolvedOccurrences__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "wakeUpEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hksp_isAfterDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  return v5;
}

- (NSArray)previousResolvedOccurrences
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HKSPSleepEventTimeline resolvedOccurrences](self, "resolvedOccurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HKSPSleepEventTimeline_previousResolvedOccurrences__block_invoke;
  v7[3] = &unk_1E4E3CA68;
  v7[4] = self;
  objc_msgSend(v3, "na_filter:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_reverse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __53__HKSPSleepEventTimeline_previousResolvedOccurrences__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "scheduledInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hksp_isBeforeOrSameAsDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  return v5;
}

- (id)upcomingResolvedOccurrencesBeforeDate:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStartDate:endDate:", self->_originDate, v5);

  -[HKSPSleepEventTimeline resolvedOccurrences](self, "resolvedOccurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HKSPSleepEventTimeline_upcomingResolvedOccurrencesBeforeDate___block_invoke;
  v11[3] = &unk_1E4E3CA90;
  v11[4] = self;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "na_filter:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __64__HKSPSleepEventTimeline_upcomingResolvedOccurrencesBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "occurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSingleDayOverride");

  if (v5)
  {
    objc_msgSend(v3, "scheduledInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hksp_isAfterOrSameAsDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(v3, "wakeUpEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dueDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "hksp_containsDate:searchOptions:", v7, 2);
  }
  v10 = v8;

  return v10;
}

- (void)addResolvedOccurrence:(id)a3
{
  NSMutableArray *orderedOccurrences;
  id v5;

  -[NSMutableArray addObject:](self->_orderedOccurrences, "addObject:", a3);
  orderedOccurrences = self->_orderedOccurrences;
  v5 = &__block_literal_global_15;
  -[NSMutableArray sortUsingComparator:](orderedOccurrences, "sortUsingComparator:", &__block_literal_global_15);

}

- (void)adjustResolvedOccurrence:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__HKSPSleepEventTimeline_adjustResolvedOccurrence_withEvent___block_invoke;
  v8[3] = &unk_1E4E3CAB8;
  v9 = v6;
  v7 = v6;
  -[HKSPSleepEventTimeline _adjustedResolvedOccurrence:adjustmentBlock:](self, "_adjustedResolvedOccurrence:adjustmentBlock:", a3, v8);

}

uint64_t __61__HKSPSleepEventTimeline_adjustResolvedOccurrence_withEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "occurrenceByAdjustingEvent:", *(_QWORD *)(a1 + 32));
}

- (void)adjustResolvedOccurrence:(id)a3 removingEventWithIdentifier:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__HKSPSleepEventTimeline_adjustResolvedOccurrence_removingEventWithIdentifier___block_invoke;
  v8[3] = &unk_1E4E3CAB8;
  v9 = v6;
  v7 = v6;
  -[HKSPSleepEventTimeline _adjustedResolvedOccurrence:adjustmentBlock:](self, "_adjustedResolvedOccurrence:adjustmentBlock:", a3, v8);

}

uint64_t __79__HKSPSleepEventTimeline_adjustResolvedOccurrence_removingEventWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "occurrenceByRemovingEventWithIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)_adjustedResolvedOccurrence:(id)a3 adjustmentBlock:(id)a4
{
  id v6;
  NSMutableArray *timelineAdjustments;
  void (**v8)(id, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _HKSPSleepEventTimelineAdjustment *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;

  v6 = a3;
  timelineAdjustments = self->_timelineAdjustments;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __70__HKSPSleepEventTimeline__adjustedResolvedOccurrence_adjustmentBlock___block_invoke;
  v21 = &unk_1E4E3CAE0;
  v16 = v6;
  v22 = v16;
  v8 = (void (**)(id, id))a4;
  -[NSMutableArray na_firstObjectPassingTest:](timelineAdjustments, "na_firstObjectPassingTest:", &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "adjustedOccurrence");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAdjustedOccurrence:", v12);
    objc_msgSend(v10, "adjustedOccurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_alloc_init(_HKSPSleepEventTimelineAdjustment);
    -[_HKSPSleepEventTimelineAdjustment setOriginalOccurrence:](v14, "setOriginalOccurrence:", v16);
    v8[2](v8, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[_HKSPSleepEventTimelineAdjustment setAdjustedOccurrence:](v14, "setAdjustedOccurrence:", v15);
    -[NSMutableArray addObject:](self->_timelineAdjustments, "addObject:", v14);
    v11 = v16;
    -[_HKSPSleepEventTimelineAdjustment adjustedOccurrence](v14, "adjustedOccurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[NSMutableArray removeObject:](self->_orderedOccurrences, "removeObject:", v11, v16, v18, v19, v20, v21);
  -[HKSPSleepEventTimeline addResolvedOccurrence:](self, "addResolvedOccurrence:", v13);

}

uint64_t __70__HKSPSleepEventTimeline__adjustedResolvedOccurrence_adjustmentBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "originalOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "adjustedOccurrence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  return v5;
}

- (id)resolvedOccurrenceOverlappingOccurrence:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HKSPSleepEventTimeline resolvedOccurrences](self, "resolvedOccurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HKSPSleepEventTimeline_resolvedOccurrenceOverlappingOccurrence___block_invoke;
  v9[3] = &unk_1E4E3CA68;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __66__HKSPSleepEventTimeline_resolvedOccurrenceOverlappingOccurrence___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "scheduledInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scheduledInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hksp_overlapsInterval:", v4);

  return v5;
}

- (id)resolvedOccurrenceContainingDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HKSPSleepEventTimeline resolvedOccurrences](self, "resolvedOccurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__HKSPSleepEventTimeline_resolvedOccurrenceContainingDate___block_invoke;
  v9[3] = &unk_1E4E3CA68;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __59__HKSPSleepEventTimeline_resolvedOccurrenceContainingDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "scheduledInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_containsDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)resolvedOccurrencePrecedingDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HKSPSleepEventTimeline resolvedOccurrences](self, "resolvedOccurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_reverse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__HKSPSleepEventTimeline_resolvedOccurrencePrecedingDate___block_invoke;
  v10[3] = &unk_1E4E3CA68;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __58__HKSPSleepEventTimeline_resolvedOccurrencePrecedingDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "scheduledInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hksp_isBeforeOrSameAsDate:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)resolvedOccurrenceContainingOrPrecedingDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[HKSPSleepEventTimeline resolvedOccurrenceContainingDate:](self, "resolvedOccurrenceContainingDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[HKSPSleepEventTimeline resolvedOccurrencePrecedingDate:](self, "resolvedOccurrencePrecedingDate:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (NSDate)originDate
{
  return self->_originDate;
}

- (NSMutableArray)orderedOccurrences
{
  return self->_orderedOccurrences;
}

- (NSMutableArray)timelineAdjustments
{
  return self->_timelineAdjustments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineAdjustments, 0);
  objc_storeStrong((id *)&self->_orderedOccurrences, 0);
  objc_storeStrong((id *)&self->_originDate, 0);
}

@end
