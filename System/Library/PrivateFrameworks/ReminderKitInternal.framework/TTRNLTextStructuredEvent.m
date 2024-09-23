@implementation TTRNLTextStructuredEvent

- (TTRNLTextStructuredEvent)initWithStructuredEvent:(void *)a3
{
  TTRNLTextStructuredEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTRNLTextStructuredEvent;
  v4 = -[TTRNLTextStructuredEvent init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_structuredEvent = a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_structuredEvent);
  v3.receiver = self;
  v3.super_class = (Class)TTRNLTextStructuredEvent;
  -[TTRNLTextStructuredEvent dealloc](&v3, sel_dealloc);
}

- (TTRNLTextStructuredEventRecurrentEvent)recurrentEvent
{
  TTRNLTextStructuredEventRecurrentEvent *RecurrentEvent;
  uint64_t EventRange;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[TTRNLTextStructuredEvent structuredEvent](self, "structuredEvent");
  RecurrentEvent = (TTRNLTextStructuredEventRecurrentEvent *)NLTextStructuredEventGetRecurrentEvent();
  if (RecurrentEvent)
  {
    EventRange = NLTextSlotRecurrentEventGetEventRange();
    v5 = v4;
    NLTextSlotRecurrentEventGetEventFrequency();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NLTextSlotRecurrentEventGetEventStartDate();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NLTextSlotRecurrentEventGetEventEndDate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    RecurrentEvent = -[TTRNLTextStructuredEventRecurrentEvent initWithRange:startDate:endDate:isAllDay:frequency:]([TTRNLTextStructuredEventRecurrentEvent alloc], "initWithRange:startDate:endDate:isAllDay:frequency:", EventRange, v5, v7, v8, NLTextSlotRecurrentEventIsAllDayEvent() != 0, v6);

  }
  return RecurrentEvent;
}

- (NSArray)locations
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t Range;
  uint64_t v10;
  uint64_t v11;
  signed int v12;
  uint64_t v13;
  uint64_t v14;
  TTRNLTextStructuredEventLocation *v15;
  TTRNLTextStructuredEventLocation *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[TTRNLTextStructuredEvent structuredEvent](self, "structuredEvent");
  NLTextStructuredEventGetLocationRanges();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        Range = NLTextSlotGetRange();
        v11 = v10;
        v12 = NLTextSlotGetSlotID() - 5;
        if (v12 <= 5)
        {
          v13 = qword_1A4694530[v12];
          v14 = qword_1A4694560[v12];
          v15 = [TTRNLTextStructuredEventLocation alloc];
          v16 = -[TTRNLTextStructuredEventLocation initWithRange:locationType:proximity:](v15, "initWithRange:locationType:proximity:", Range, v11, v13, v14, v19);
          objc_msgSend(v3, "addObject:", v16);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v17;
}

- (void)structuredEvent
{
  return self->_structuredEvent;
}

- (void)setStructuredEvent:(void *)a3
{
  self->_structuredEvent = a3;
}

@end
