@implementation VLAR_DTMFCommandsAccumulator

- (VLAR_DTMFCommandsAccumulator)init
{
  VLAR_DTMFCommandsAccumulator *v2;
  SOSAnalyticsEventAccumulator *v3;
  SOSAnalyticsEventAccumulator *commandsAccumulator;
  SOSAnalyticsEventAccumulator *v5;
  SOSAnalyticsEventAccumulator *commandsWithPlaybackStateAccumulator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VLAR_DTMFCommandsAccumulator;
  v2 = -[VLAR_DTMFCommandsAccumulator init](&v8, sel_init);
  if (v2)
  {
    v3 = -[SOSAnalyticsEventAccumulator initWithName:]([SOSAnalyticsEventAccumulator alloc], "initWithName:", CFSTR("DTMFCommand"));
    commandsAccumulator = v2->_commandsAccumulator;
    v2->_commandsAccumulator = v3;

    v5 = -[SOSAnalyticsEventAccumulator initWithName:]([SOSAnalyticsEventAccumulator alloc], "initWithName:", CFSTR("DTMFCommand-PlaybackState"));
    commandsWithPlaybackStateAccumulator = v2->_commandsWithPlaybackStateAccumulator;
    v2->_commandsWithPlaybackStateAccumulator = v5;

  }
  return v2;
}

- (id)_stringFromDTMFCommand:(unint64_t)a3 withPlaybackState:(unint64_t)a4
{
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  if ((uint64_t)a3 <= 199)
  {
    if (!a3)
    {
      v4 = CFSTR("None");
      goto LABEL_13;
    }
    if (a3 == 100)
    {
      v4 = CFSTR("Stop");
      goto LABEL_13;
    }
  }
  else
  {
    switch(a3)
    {
      case 0xC8uLL:
        v4 = CFSTR("Repeat");
        goto LABEL_13;
      case 0x1388uLL:
        v4 = CFSTR("Resume");
        goto LABEL_13;
      case 0x2710uLL:
        v4 = CFSTR("Unhandled");
        goto LABEL_13;
    }
  }
  v4 = CFSTR("Unknown");
LABEL_13:
  v5 = CFSTR("NotStarted");
  v6 = CFSTR("Responding");
  v7 = CFSTR("Repeating");
  if (a4 != 400)
    v7 = CFSTR("NotStarted");
  if (a4 != 300)
    v6 = v7;
  if (a4 == 200)
    v5 = CFSTR("Stopped");
  if (a4 == 100)
    v5 = CFSTR("InitialLoop");
  if ((uint64_t)a4 > 299)
    v5 = v6;
  return (id)-[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("-%@"), v5);
}

- (void)noteDidReceiveDTMFCommand:(unint64_t)a3 withPlaybackState:(unint64_t)a4
{
  SOSAnalyticsEventAccumulator *commandsAccumulator;
  const __CFString *v8;
  SOSAnalyticsEventAccumulator *commandsWithPlaybackStateAccumulator;
  id v10;

  commandsAccumulator = self->_commandsAccumulator;
  if ((uint64_t)a3 <= 199)
  {
    if (!a3)
    {
      v8 = CFSTR("None");
      goto LABEL_13;
    }
    if (a3 == 100)
    {
      v8 = CFSTR("Stop");
      goto LABEL_13;
    }
LABEL_12:
    v8 = CFSTR("Unknown");
    goto LABEL_13;
  }
  if (a3 == 200)
  {
    v8 = CFSTR("Repeat");
    goto LABEL_13;
  }
  if (a3 == 5000)
  {
    v8 = CFSTR("Resume");
    goto LABEL_13;
  }
  if (a3 != 10000)
    goto LABEL_12;
  v8 = CFSTR("Unhandled");
LABEL_13:
  -[SOSAnalyticsEventAccumulator noteEvent:](commandsAccumulator, "noteEvent:", v8);
  commandsWithPlaybackStateAccumulator = self->_commandsWithPlaybackStateAccumulator;
  -[VLAR_DTMFCommandsAccumulator _stringFromDTMFCommand:withPlaybackState:](self, "_stringFromDTMFCommand:withPlaybackState:", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SOSAnalyticsEventAccumulator noteEvent:](commandsWithPlaybackStateAccumulator, "noteEvent:", v10);

}

- (id)reportedCommands
{
  void *v2;

  if (+[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.allowResume"), 0))
  {
    objc_msgSend(&unk_1E5F831A8, "arrayByAddingObject:", &unk_1E5F82F28);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &unk_1E5F831A8;
  }
  return v2;
}

- (id)analyticsDataDict
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[3];
  _QWORD v33[3];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[VLAR_DTMFCommandsAccumulator reportedCommands](self, "reportedCommands");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(&unk_1E5F831C0, "count") * objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v5)
  {
    v6 = v5;
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(obj);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "unsignedIntegerValue");
        v9 = v8;
        if (v8 <= 199)
        {
          v10 = CFSTR("None");
          if (!v8)
            goto LABEL_17;
          if (v8 == 100)
          {
            v10 = CFSTR("Stop");
            goto LABEL_17;
          }
        }
        else
        {
          switch(v8)
          {
            case 200:
              v10 = CFSTR("Repeat");
              goto LABEL_17;
            case 5000:
              v10 = CFSTR("Resume");
              goto LABEL_17;
            case 10000:
              v10 = CFSTR("Unhandled");
              goto LABEL_17;
          }
        }
        v10 = CFSTR("Unknown");
LABEL_17:
        objc_msgSend(v23, "addObject:", v10);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = objc_msgSend(&unk_1E5F831C0, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(&unk_1E5F831C0);
              -[VLAR_DTMFCommandsAccumulator _stringFromDTMFCommand:withPlaybackState:](self, "_stringFromDTMFCommand:withPlaybackState:", v9, objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "unsignedIntegerValue"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v15);

            }
            v12 = objc_msgSend(&unk_1E5F831C0, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
          }
          while (v12);
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v6);
  }

  v32[0] = CFSTR("AllEventsKey");
  v32[1] = CFSTR("KnownEventsKey");
  v33[0] = CFSTR("nDTMFCommands_Total");
  v33[1] = CFSTR("nDTMFCommands_Known");
  v32[2] = CFSTR("UnknownEventsKey");
  v33[2] = CFSTR("nDTMFCommands_Unknown");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSAnalyticsEventAccumulator analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:](self->_commandsAccumulator, "analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:", v23, CFSTR("nDTMFCommand_"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSAnalyticsEventAccumulator analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:](self->_commandsWithPlaybackStateAccumulator, "analyticsDataDictForAccumulatedKeys:outputKeyPrefix:summaryKeysDict:", v4, CFSTR("nDTMFCommand_"), v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "mutableCopy");
  objc_msgSend(v19, "addEntriesFromDictionary:", v18);

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandsWithPlaybackStateAccumulator, 0);
  objc_storeStrong((id *)&self->_commandsAccumulator, 0);
}

@end
