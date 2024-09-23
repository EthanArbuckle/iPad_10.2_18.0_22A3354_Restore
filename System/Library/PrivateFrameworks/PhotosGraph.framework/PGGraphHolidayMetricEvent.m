@implementation PGGraphHolidayMetricEvent

- (PGGraphHolidayMetricEvent)initWithHolidayName:(id)a3 numberOfCelebrations:(unint64_t)a4
{
  __CFString *v6;
  PGGraphHolidayMetricEvent *v7;
  __CFString *v8;
  objc_super v10;

  v6 = (__CFString *)a3;
  v10.receiver = self;
  v10.super_class = (Class)PGGraphHolidayMetricEvent;
  v7 = -[PGGraphHolidayMetricEvent init](&v10, sel_init);
  if (v7)
  {
    if (-[__CFString length](v6, "length"))
      v8 = v6;
    else
      v8 = &stru_1E8436F28;
    objc_storeStrong((id *)&v7->_holidayName, v8);
    v7->_numberOfCelebrations = a4;
  }

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.Intelligence.Graph.CelebratedHoliday");
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (id)payload
{
  NSString *holidayName;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  holidayName = self->_holidayName;
  v6[0] = CFSTR("holiday");
  v6[1] = CFSTR("numberOfCelebrations");
  v7[0] = holidayName;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfCelebrations);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)holidayName
{
  return self->_holidayName;
}

- (void)setHolidayName:(id)a3
{
  objc_storeStrong((id *)&self->_holidayName, a3);
}

- (unint64_t)numberOfCelebrations
{
  return self->_numberOfCelebrations;
}

- (void)setNumberOfCelebrations:(unint64_t)a3
{
  self->_numberOfCelebrations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holidayName, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (id)celebratedHolidayMetricEventsWithGraphManager:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isReady"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke;
    v6[3] = &unk_1E84353C0;
    v7 = v4;
    objc_msgSend(v3, "performSynchronousConcurrentGraphReadUsingBlock:", v6);

  }
  return v4;
}

void __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  PGGraphHolidayMetricEvent *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke_2;
  v17[3] = &unk_1E8433B30;
  v6 = v4;
  v18 = v6;
  objc_msgSend(v5, "enumerateCelebratedHolidayNodesUsingBlock:", v17);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = -[PGGraphHolidayMetricEvent initWithHolidayName:numberOfCelebrations:]([PGGraphHolidayMetricEvent alloc], "initWithHolidayName:numberOfCelebrations:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), objc_msgSend(v7, "countForObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13));
        if (v12)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v9);
  }

}

void __75__PGGraphHolidayMetricEvent_celebratedHolidayMetricEventsWithGraphManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
