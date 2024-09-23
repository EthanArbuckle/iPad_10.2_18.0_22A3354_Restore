@implementation PXTimelineSchedulerOptions

- (PXTimelineSchedulerOptions)init
{
  PXTimelineSchedulerOptions *v2;
  PXTimelineSchedulerOptions *v3;
  double *v4;
  uint64_t v5;
  NSArray *bestContentStartTimeHours;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXTimelineSchedulerOptions;
  v2 = -[PXTimelineSchedulerOptions init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (double *)MEMORY[0x1E0D72EF0];
    v2->_timelineEntryDuration = 3600.0;
    v2->_bestContentEntryDuration = *v4;
    v5 = objc_msgSend((id)*MEMORY[0x1E0D72EF8], "copy");
    bestContentStartTimeHours = v3->_bestContentStartTimeHours;
    v3->_bestContentStartTimeHours = (NSArray *)v5;

    v3->_timelineForSize = 0;
    v3->_timelineIndex = 0;
    v3->_numberOfTimelines = 1;
  }
  return v3;
}

- (void)updateOptionsForTimelineSize:(unint64_t)a3 withTimelineSizes:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_sortTimelineSizesFromSet:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PXTimelineSchedulerOptions setTimelineForSize:](self, "setTimelineForSize:", a3);
  -[PXTimelineSchedulerOptions setNumberOfTimelines:](self, "setNumberOfTimelines:", objc_msgSend(v10, "count"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "indexOfObject:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = v8;
  -[PXTimelineSchedulerOptions setTimelineIndex:](self, "setTimelineIndex:", v9);

}

- (double)timelineEntryDuration
{
  return self->_timelineEntryDuration;
}

- (void)setTimelineEntryDuration:(double)a3
{
  self->_timelineEntryDuration = a3;
}

- (double)bestContentEntryDuration
{
  return self->_bestContentEntryDuration;
}

- (void)setBestContentEntryDuration:(double)a3
{
  self->_bestContentEntryDuration = a3;
}

- (NSArray)bestContentStartTimeHours
{
  return self->_bestContentStartTimeHours;
}

- (void)setBestContentStartTimeHours:(id)a3
{
  objc_storeStrong((id *)&self->_bestContentStartTimeHours, a3);
}

- (unint64_t)timelineForSize
{
  return self->_timelineForSize;
}

- (void)setTimelineForSize:(unint64_t)a3
{
  self->_timelineForSize = a3;
}

- (unint64_t)timelineIndex
{
  return self->_timelineIndex;
}

- (void)setTimelineIndex:(unint64_t)a3
{
  self->_timelineIndex = a3;
}

- (unint64_t)numberOfTimelines
{
  return self->_numberOfTimelines;
}

- (void)setNumberOfTimelines:(unint64_t)a3
{
  self->_numberOfTimelines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestContentStartTimeHours, 0);
}

+ (id)_sortTimelineSizesFromSet:(id)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  SEL v10;
  id v11;

  objc_msgSend(a3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXTimelineSchedulerOptions__sortTimelineSizesFromSet___block_invoke;
  v8[3] = &unk_1E512EC58;
  v9 = &unk_1E53E9D08;
  v10 = a2;
  v11 = a1;
  objc_msgSend(v6, "sortUsingComparator:", v8);

  return v6;
}

uint64_t __56__PXTimelineSchedulerOptions__sortTimelineSizesFromSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *v11;
  uint64_t v12;
  int v14;
  id v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v5);
  v8 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v6);
  v9 = v8;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = 138413058;
      v15 = v5;
      v16 = 2048;
      v17 = v7;
      v18 = 2112;
      v19 = v6;
      v20 = 2048;
      v21 = v9;
      _os_log_error_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Widget size class not found: widget size1 %@ [%tu], widget size2 %@ [%tu]", (uint8_t *)&v14, 0x2Au);
    }

  }
  if (v7 < v9)
    v12 = -1;
  else
    v12 = 1;

  return v12;
}

@end
