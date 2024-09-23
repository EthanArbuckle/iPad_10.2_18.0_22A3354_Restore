@implementation VLAR_DTMFEventsAccumulator

- (VLAR_DTMFEventsAccumulator)init
{
  VLAR_DTMFEventsAccumulator *v2;
  SOSAnalyticsEventAccumulator *v3;
  SOSAnalyticsEventAccumulator *eventsAccumulator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VLAR_DTMFEventsAccumulator;
  v2 = -[VLAR_DTMFEventsAccumulator init](&v6, sel_init);
  if (v2)
  {
    v3 = -[SOSAnalyticsEventAccumulator initWithName:]([SOSAnalyticsEventAccumulator alloc], "initWithName:", CFSTR("DTMFEvent"));
    eventsAccumulator = v2->_eventsAccumulator;
    v2->_eventsAccumulator = v3;

  }
  return v2;
}

- (void)noteDidReceiveDTMFDigit:(char)a3
{
  SOSAnalyticsEventAccumulator *eventsAccumulator;
  id v4;

  eventsAccumulator = self->_eventsAccumulator;
  _NSStringFromDTMFDigitChar(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SOSAnalyticsEventAccumulator noteEvent:](eventsAccumulator, "noteEvent:", v4);

}

- (id)analyticsDataDict
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[3];
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("1");
  v9[1] = CFSTR("2");
  v9[2] = CFSTR("3");
  v9[3] = CFSTR("4");
  v9[4] = CFSTR("5");
  v9[5] = CFSTR("6");
  v9[6] = CFSTR("7");
  v9[7] = CFSTR("8");
  v9[8] = CFSTR("9");
  v9[9] = CFSTR("0");
  v9[10] = CFSTR("Star");
  v9[11] = CFSTR("Pound");
  v9[12] = CFSTR("A");
  v9[13] = CFSTR("B");
  v9[14] = CFSTR("C");
  v9[15] = CFSTR("D");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("AllEventsKey");
  v7[1] = CFSTR("KnownEventsKey");
  v8[0] = CFSTR("nDTMFEvents_Total");
  v8[1] = CFSTR("nDTMFEvents_Known");
  v7[2] = CFSTR("UnknownEventsKey");
  v8[2] = CFSTR("nDTMFEvents_Unknown");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSAnalyticsEventAccumulator analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:](self->_eventsAccumulator, "analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:", v3, CFSTR("nDTMFEvent_"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsAccumulator, 0);
}

@end
