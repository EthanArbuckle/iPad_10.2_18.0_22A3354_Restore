@implementation PLEventForwardPowerStateEntry

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEventForwardPowerStateEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("PowerState"));
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withDate:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  PLEventForwardPowerStateEntry *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a4;
  v8 = a3;
  v10 = a5;
  v11 = a6;
  +[PLEventForwardPowerStateEntry entryKey](PLEventForwardPowerStateEntry, "entryKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)PLEventForwardPowerStateEntry;
  v13 = -[PLEntry initWithEntryKey:withDate:](&v18, sel_initWithEntryKey_withDate_, v12, v11);

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, CFSTR("State"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, CFSTR("Event"));

    v16 = (void *)IOPMSleepWakeCopyUUID();
    -[PLEntry setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v16, CFSTR("UUID"));

    if (v10)
      -[PLEntry setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v10, CFSTR("Reason"));
  }

  return v13;
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withKernelSleepDate:(id)a6 withDate:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  PLEventForwardPowerStateEntry *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v9 = a4;
  v10 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  +[PLEventForwardPowerStateEntry entryKey](PLEventForwardPowerStateEntry, "entryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)PLEventForwardPowerStateEntry;
  v16 = -[PLEntry initWithEntryKey:withDate:](&v21, sel_initWithEntryKey_withDate_, v15, v14);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v17, CFSTR("State"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v18, CFSTR("Event"));

    v19 = (void *)IOPMSleepWakeCopyUUID();
    -[PLEntry setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v19, CFSTR("UUID"));

    -[PLEntry setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v13, CFSTR("KernelSleepDate"));
    if (v12)
      -[PLEntry setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v12, CFSTR("Reason"));
  }

  return v16;
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withCurrentWakeTime:(unint64_t)a6 withCurrentWakeTimeKey:(id)a7 withWakeType:(id)a8 withDriverWakeReason:(id)a9 withDate:(id)a10
{
  uint64_t v13;
  uint64_t v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  PLEventForwardPowerStateEntry *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v13 = a4;
  v14 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  +[PLEventForwardPowerStateEntry entryKey](PLEventForwardPowerStateEntry, "entryKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PLEventForwardPowerStateEntry;
  v22 = -[PLEntry initWithEntryKey:withDate:](&v28, sel_initWithEntryKey_withDate_, v21, v20);

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v23, CFSTR("State"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v13);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v24, CFSTR("Event"));

    v25 = (void *)IOPMSleepWakeCopyUUID();
    -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v25, CFSTR("UUID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v26, v17);

    if (v16)
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v16, CFSTR("Reason"));
    if (v18)
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v18, CFSTR("WakeType"));
    if (v19)
      -[PLEntry setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v19, CFSTR("DriverWakeReason"));
  }

  return v22;
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withCurrentWakeTime:(unint64_t)a6 withCurrentWakeTimeKey:(id)a7 withDate:(id)a8
{
  uint64_t v11;
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  void *v17;
  PLEventForwardPowerStateEntry *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v11 = a4;
  v12 = a3;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  +[PLEventForwardPowerStateEntry entryKey](PLEventForwardPowerStateEntry, "entryKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)PLEventForwardPowerStateEntry;
  v18 = -[PLEntry initWithEntryKey:withDate:](&v24, sel_initWithEntryKey_withDate_, v17, v16);

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("State"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("Event"));

    v21 = (void *)IOPMSleepWakeCopyUUID();
    -[PLEntry setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v21, CFSTR("UUID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v22, v15);

    if (v14)
      -[PLEntry setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v14, CFSTR("Reason"));
  }

  return v18;
}

- (id)initEntryWithIOMessage:(unsigned int)a3
{
  unint64_t v4;
  __int16 v5;
  PLEventForwardPowerStateEntry *v6;
  __int16 v7;
  void *v8;

  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  v5 = -1;
  v6 = 0;
  v7 = -1;
  switch((v4 >> 4))
  {
    case 0u:
      v7 = 1;
      v5 = 3;
      goto LABEL_7;
    case 1u:
      v5 = 1;
      v7 = 1;
      goto LABEL_7;
    case 2u:
      v7 = 1;
      v5 = 2;
      goto LABEL_7;
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0xAu:
      goto LABEL_7;
    case 9u:
      v5 = 0;
      v7 = 0;
      goto LABEL_7;
    case 0xBu:
      goto LABEL_8;
    default:
      v7 = -1;
LABEL_7:
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self = (PLEventForwardPowerStateEntry *)-[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withDate:](self, "initEntryWithState:withEvent:withReason:withDate:", v7, v5, 0, v8);

      v6 = self;
LABEL_8:

      return v6;
  }
}

- (signed)state
{
  void *v2;
  signed __int16 v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("State"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longValue");

  return v3;
}

- (signed)event
{
  void *v2;
  signed __int16 v3;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Event"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longValue");

  return v3;
}

- (NSArray)reason
{
  return (NSArray *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("Reason"));
}

- (BOOL)isBasebandWake
{
  void *v2;
  char v3;

  -[PLEventForwardPowerStateEntry reason](self, "reason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsAtleastOneOf:", &unk_1E86526B8);

  return v3;
}

@end
