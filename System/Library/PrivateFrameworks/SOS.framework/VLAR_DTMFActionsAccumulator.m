@implementation VLAR_DTMFActionsAccumulator

- (VLAR_DTMFActionsAccumulator)init
{
  VLAR_DTMFActionsAccumulator *v2;
  SOSAnalyticsEventAccumulator *v3;
  SOSAnalyticsEventAccumulator *actionsAccumulator;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VLAR_DTMFActionsAccumulator;
  v2 = -[VLAR_DTMFActionsAccumulator init](&v6, sel_init);
  if (v2)
  {
    v3 = -[SOSAnalyticsEventAccumulator initWithName:]([SOSAnalyticsEventAccumulator alloc], "initWithName:", CFSTR("DTMFAction"));
    actionsAccumulator = v2->_actionsAccumulator;
    v2->_actionsAccumulator = v3;

  }
  return v2;
}

- (void)noteDTMFAction:(unint64_t)a3
{
  SOSAnalyticsEventAccumulator *actionsAccumulator;
  const __CFString *v4;

  actionsAccumulator = self->_actionsAccumulator;
  if ((uint64_t)a3 <= 299)
  {
    switch(a3)
    {
      case 0uLL:
        v4 = CFSTR("None");
        goto LABEL_6;
      case 0x64uLL:
        v4 = CFSTR("StopWithConfirmation");
        goto LABEL_6;
      case 0xC8uLL:
        v4 = CFSTR("Repeat");
        goto LABEL_6;
    }
LABEL_17:
    v4 = CFSTR("Unknown");
    goto LABEL_6;
  }
  if ((uint64_t)a3 > 4999)
  {
    if (a3 == 5000)
    {
      v4 = CFSTR("Resume");
      goto LABEL_6;
    }
    if (a3 == 10000)
    {
      v4 = CFSTR("Ignored");
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  if (a3 == 300)
  {
    v4 = CFSTR("StopSilent");
    goto LABEL_6;
  }
  if (a3 != 400)
    goto LABEL_17;
  v4 = CFSTR("Reminder");
LABEL_6:
  -[SOSAnalyticsEventAccumulator noteEvent:](actionsAccumulator, "noteEvent:", v4);
}

- (id)analyticsDataDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("AllEventsKey");
  v12[1] = CFSTR("KnownEventsKey");
  v13[0] = CFSTR("nDTMFActions_Total");
  v13[1] = CFSTR("nDTMFActions_Known");
  v12[2] = CFSTR("UnknownEventsKey");
  v13[2] = CFSTR("nDTMFActions_Unknown");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSAnalyticsEventAccumulator analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:](self->_actionsAccumulator, "analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:", &unk_1E5F831D8, CFSTR("nDTMFAction_"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nDTMFActions_Known"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nDTMFAction_Ignored"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 - objc_msgSend(v8, "integerValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("nDTMFActions_Acted"));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsAccumulator, 0);
}

@end
