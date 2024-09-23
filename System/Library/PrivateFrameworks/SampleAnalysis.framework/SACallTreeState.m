@implementation SACallTreeState

- (SACallTreeState)initWithWaitInfo:(id)a3 turnstileInfo:(id)a4 isPartOfADeadlock:(BOOL)a5 isBlockedByADeadlock:(BOOL)a6 state:(unint64_t)a7 microstackshotState:(unsigned int)a8 pid:(int)a9 threadId:(unint64_t)a10 threadPriority:(unsigned __int8)a11 timeRange:(id)a12 originPid:(int)a13 proximatePid:(int)a14 startSampleIndex:(unint64_t)a15 sampleCount:(unint64_t)a16
{
  id v21;
  id v22;
  id v23;
  SACallTreeState *v24;
  uint64_t v25;
  NSMutableArray *timeRanges;
  unint64_t v27;
  objc_super v31;

  v21 = a3;
  v22 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SACallTreeState;
  v23 = a12;
  v24 = -[SACallTreeNode initWithStartSampleIndex:sampleCount:](&v31, sel_initWithStartSampleIndex_sampleCount_, a15, a16);
  if (v24)
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v23, 0);
    timeRanges = v24->_timeRanges;
    v24->_timeRanges = (NSMutableArray *)v25;

    v24->_pid = a9;
    v24->_threadId = a10;
    v24->_threadPriority = a11;
    objc_storeStrong((id *)&v24->_waitInfo, a3);
    objc_storeStrong((id *)&v24->_turnstileInfo, a4);
    v24->_isPartOfADeadlock = a5;
    v24->_isBlockedByADeadlock = a6;
    v24->_state = a7;
    v24->_microstackshotState = a8;
    v27 = a15 + a16 - 1;
    if (a15 == 0x7FFFFFFFFFFFFFFFLL)
      v27 = 0x7FFFFFFFFFFFFFFFLL;
    v24->_endSampleIndex = v27;
    v24->_originPid = a13;
    v24->_proximatePid = a14;
  }

  return v24;
}

+ (id)treeCountedStateWithWaitInfo:(uint64_t)a1 turnstileInfo:(void *)a2 isPartOfADeadlock:(void *)a3 isBlockedByADeadlock:(unsigned int)a4 state:(unsigned int)a5 microstackshotState:(uint64_t)a6 pid:(unsigned int)a7 threadId:(int)a8 threadPriority:(uint64_t)a9 timeRange:(char)a10 originPid:(void *)a11 proximatePid:(uint64_t)a12 startSampleIndex:(uint64_t)a13 sampleCount:(uint64_t)a14
{
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;

  v16 = a11;
  v17 = a3;
  v18 = a2;
  LOBYTE(v22) = a10;
  LODWORD(v21) = a8;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithWaitInfo:turnstileInfo:isPartOfADeadlock:isBlockedByADeadlock:state:microstackshotState:pid:threadId:threadPriority:timeRange:originPid:proximatePid:startSampleIndex:sampleCount:", v18, v17, a4, a5, a6, a7, v21, a9, v22, v16, a12, a13, a14);

  return v19;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int microstackshotState;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  const char *v14;
  void *v15;
  unint64_t v16;
  const char *v17;
  void *v18;
  unint64_t state;
  void *v20;
  void *v21;
  void *v22;
  SAWaitInfo *waitInfo;
  void *v24;
  SATurnstileInfo *turnstileInfo;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C9AAB0];
  v6 = (void *)MEMORY[0x1E0C9AAA0];
  if ((self->_microstackshotState & 2) != 0)
    v7 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v7 = (void *)MEMORY[0x1E0C9AAA0];
  v30 = v4;
  SAJSONWriteDictionaryFirstEntry(v4, (uint64_t)CFSTR("foreground"), v7);
  microstackshotState = self->_microstackshotState;
  if ((microstackshotState & 0x10) != 0)
  {
    if ((microstackshotState & 4) != 0)
      v9 = v6;
    else
      v9 = v5;
    SAJSONWriteDictionaryEntry(v30, CFSTR("userActive"), v9);
    if ((self->_microstackshotState & 8) != 0)
      v10 = v5;
    else
      v10 = v6;
    SAJSONWriteDictionaryEntry(v30, CFSTR("onBattery"), v10);
    microstackshotState = self->_microstackshotState;
  }
  if ((microstackshotState & 0x20) != 0)
    v11 = v5;
  else
    v11 = v6;
  SAJSONWriteDictionaryEntry(v30, CFSTR("suppressed"), v11);
  if ((self->_microstackshotState & 0x80) != 0)
    v12 = v5;
  else
    v12 = v6;
  SAJSONWriteDictionaryEntry(v30, CFSTR("kernelMode"), v12);
  v13 = (((unint64_t)self->_microstackshotState >> 8) & 7) - 1;
  if (v13 > 6)
    v14 = "Thread QoS Unknown";
  else
    v14 = off_1E7148C60[v13];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v30, CFSTR("effectiveQos"), v15);

  v16 = (((unint64_t)self->_microstackshotState >> 11) & 7) - 1;
  if (v16 > 6)
    v17 = "Thread QoS Unknown";
  else
    v17 = off_1E7148C60[v16];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v30, CFSTR("requestedQos"), v18);

  state = self->_state;
  if (state)
  {
    if ((state & 4) != 0)
      v20 = v5;
    else
      v20 = v6;
    SAJSONWriteDictionaryEntry(v30, CFSTR("running"), v20);
    if ((self->_state & 2) != 0)
      v21 = v5;
    else
      v21 = v6;
    SAJSONWriteDictionaryEntry(v30, CFSTR("runnable"), v21);
    if ((self->_state & 1) != 0)
      v22 = v5;
    else
      v22 = v6;
    SAJSONWriteDictionaryEntry(v30, CFSTR("suspended"), v22);
  }
  waitInfo = self->_waitInfo;
  if (waitInfo)
  {
    -[SAWaitInfo descriptionForPid:tid:options:nameCallback:](waitInfo, "descriptionForPid:tid:options:nameCallback:", self->_pid, self->_threadId, 3, &__block_literal_global_8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
      SAJSONWriteDictionaryEntry(v30, CFSTR("waitInfo"), v24);

  }
  turnstileInfo = self->_turnstileInfo;
  if (turnstileInfo)
  {
    -[SATurnstileInfo descriptionForPid:tid:threadPriority:options:nameCallback:](turnstileInfo, "descriptionForPid:tid:threadPriority:options:nameCallback:", self->_pid, self->_threadId, self->_threadPriority, 3, &__block_literal_global_130);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
      SAJSONWriteDictionaryEntry(v30, CFSTR("turnstileInfo"), v26);

  }
  if (self->_isPartOfADeadlock)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v30, CFSTR("isPartOfADeadlock"), v27);

  }
  if (self->_isBlockedByADeadlock)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v30, CFSTR("isBlockedByADeadlock"), v28);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v30, CFSTR("count"), v29);

}

id __54__SACallTreeState_writeJSONDictionaryEntriesToStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v8;

  if ((_DWORD)a2 == -1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%llx"), a3, v8);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (a3)
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%d] 0x%llx"), a2, a3);
    else
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%d]"), a2, v8);
  }
  return v6;
}

id __54__SACallTreeState_writeJSONDictionaryEntriesToStream___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v8;

  if ((_DWORD)a2 == -1)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("0x%llx"), a3, v8);
  }
  else
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (a3)
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%d] 0x%llx"), a2, a3);
    else
      v6 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("[%d]"), a2, v8);
  }
  return v6;
}

+ (void)writeJSONDictionaryEntriesToStream:(__int16)a3 microstackshotState:(__int16)a4 primaryMicrostackshotState:(int)a5 includeIdleAndBattery:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  id v23;

  v23 = a2;
  objc_opt_self();
  v8 = (void *)MEMORY[0x1E0C9AAB0];
  v9 = (void *)MEMORY[0x1E0C9AAA0];
  if ((a3 & 2) != (a4 & 2))
  {
    if ((a3 & 2) != 0)
      v10 = (void *)MEMORY[0x1E0C9AAB0];
    else
      v10 = (void *)MEMORY[0x1E0C9AAA0];
    SAJSONWriteDictionaryEntry(v23, CFSTR("foreground"), v10);
  }
  if ((a3 & 0x20) != (a4 & 0x20))
  {
    if ((a3 & 0x20) != 0)
      v11 = v8;
    else
      v11 = v9;
    SAJSONWriteDictionaryEntry(v23, CFSTR("suppressed"), v11);
  }
  if ((a3 & 0x80) != (a4 & 0x80))
  {
    if ((a3 & 0x80) != 0)
      v12 = v8;
    else
      v12 = v9;
    SAJSONWriteDictionaryEntry(v23, CFSTR("kernelMode"), v12);
  }
  if (a5)
  {
    if ((a3 & 0x10) == 0)
    {
      if ((a4 & 0x10) == 0)
        goto LABEL_36;
      v13 = CFSTR("idleBatteryInvalid");
      v14 = (void *)MEMORY[0x1E0C9AAB0];
      goto LABEL_35;
    }
    if ((a4 & 0x10) == 0)
    {
      if ((a3 & 4) != 0)
        v15 = v9;
      else
        v15 = v8;
      SAJSONWriteDictionaryEntry(v23, CFSTR("userActive"), v15);
LABEL_31:
      if ((a3 & 8) != 0)
        v14 = v8;
      else
        v14 = v9;
      v13 = CFSTR("onBattery");
LABEL_35:
      SAJSONWriteDictionaryEntry(v23, v13, v14);
      goto LABEL_36;
    }
    if (((a4 ^ a3) & 4) != 0)
    {
      if ((a3 & 4) != 0)
        v16 = v9;
      else
        v16 = v8;
      SAJSONWriteDictionaryEntry(v23, CFSTR("userActive"), v16);
    }
    if (((a4 ^ a3) & 8) != 0)
      goto LABEL_31;
  }
LABEL_36:
  if ((a3 & 0x700) != (a4 & 0x700))
  {
    v17 = ((unsigned __int16)(a3 & 0x700) >> 8) - 1;
    if (v17 > 6)
      v18 = "Thread QoS Unknown";
    else
      v18 = off_1E7148C60[v17];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v23, CFSTR("effectiveQos"), v19);

  }
  if ((a3 & 0x3800) != (a4 & 0x3800))
  {
    v20 = ((unsigned __int16)(a3 & 0x3800) >> 11) - 1;
    if (v20 > 6)
      v21 = "Thread QoS Unknown";
    else
      v21 = off_1E7148C60[v20];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SAJSONWriteDictionaryEntry(v23, CFSTR("requestedQos"), v22);

  }
}

+ (void)writeJSONDictionaryEntriesToStream:(uint64_t)a3 state:(uint64_t *)a4 primaryState:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  _BOOL4 v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_opt_self();
  if (!a4)
  {
    if ((a3 & 1) != 0)
      SAJSONWriteDictionaryEntry(v18, CFSTR("suspended"), MEMORY[0x1E0C9AAB0]);
    if ((a3 & 4) != 0)
    {
      SAJSONWriteDictionaryEntry(v18, CFSTR("running"), MEMORY[0x1E0C9AAB0]);
    }
    else if ((a3 & 6) == 2)
    {
LABEL_21:
      if ((a3 & 2) != 0)
        v10 = (void *)MEMORY[0x1E0C9AAB0];
      else
        v10 = (void *)MEMORY[0x1E0C9AAA0];
      SAJSONWriteDictionaryEntry(v18, CFSTR("runnable"), v10);
      v11 = a3 & 0x7F8;
      v12 = v11 != 0;
      if (!a4)
      {
        if ((a3 & 0x7F8) == 0)
          goto LABEL_36;
        goto LABEL_35;
      }
      goto LABEL_32;
    }
    v11 = a3 & 0x7F8;
    if ((a3 & 0x7F8) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  v6 = *a4;
  v7 = *a4 ^ a3;
  if ((v7 & 1) != 0)
  {
    if ((a3 & 1) != 0)
      v8 = (void *)MEMORY[0x1E0C9AAB0];
    else
      v8 = (void *)MEMORY[0x1E0C9AAA0];
    SAJSONWriteDictionaryEntry(v18, CFSTR("suspended"), v8);
    v6 = *a4;
    v7 = *a4 ^ a3;
  }
  if ((v7 & 4) == 0)
  {
    if ((a3 & 4) != 0)
      goto LABEL_27;
LABEL_20:
    if (!(v6 & 4 | v7 & 2))
    {
LABEL_27:
      v11 = a3 & 0x7F8;
      v12 = v11 != 0;
      goto LABEL_33;
    }
    goto LABEL_21;
  }
  if ((a3 & 4) != 0)
    v9 = (void *)MEMORY[0x1E0C9AAB0];
  else
    v9 = (void *)MEMORY[0x1E0C9AAA0];
  SAJSONWriteDictionaryEntry(v18, CFSTR("running"), v9);
  if ((a3 & 4) == 0)
  {
    v6 = *a4;
    v7 = *a4 ^ a3;
    goto LABEL_20;
  }
  v11 = a3 & 0x7F8;
  v12 = v11 != 0;
LABEL_32:
  v6 = *a4;
LABEL_33:
  if (((v12 ^ ((v6 & 0x7F8) != 0)) & 1) == 0)
  {
    v14 = !v12;
    if ((v6 & 0x7F8) == 0)
      v14 = 1;
    if ((v14 & 1) != 0 || (v11 >> 3) == (v6 >> 3))
    {
LABEL_46:
      v15 = *a4 ^ a3;
      if ((v15 & 0x800) != 0)
      {
        if ((a3 & 0x800) != 0)
          v16 = (void *)MEMORY[0x1E0C9AAB0];
        else
          v16 = (void *)MEMORY[0x1E0C9AAA0];
        SAJSONWriteDictionaryEntry(v18, CFSTR("eCore"), v16);
        v15 = *a4 ^ a3;
      }
      if ((v15 & 0x1000) != 0)
        goto LABEL_52;
      goto LABEL_56;
    }
  }
  if (!v12)
  {
    SAJSONWriteDictionaryEntry(v18, CFSTR("cpuNum"), &unk_1E71677F8);
    goto LABEL_46;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v11 >> 3) - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v18, CFSTR("cpuNum"), v13);

  if (a4)
    goto LABEL_46;
LABEL_36:
  if ((a3 & 0x800) != 0)
    SAJSONWriteDictionaryEntry(v18, CFSTR("eCore"), MEMORY[0x1E0C9AAB0]);
  if ((a3 & 0x1000) != 0)
  {
LABEL_52:
    if ((a3 & 0x1000) != 0)
      v17 = (void *)MEMORY[0x1E0C9AAB0];
    else
      v17 = (void *)MEMORY[0x1E0C9AAA0];
    SAJSONWriteDictionaryEntry(v18, CFSTR("pCore"), v17);
  }
LABEL_56:

}

- (NSString)debugDescription
{
  unint64_t v3;
  unint64_t state;
  uint64_t pid;
  uint64_t microstackshotState;
  void *v7;
  void *v8;
  _BOOL8 isPartOfADeadlock;
  _BOOL8 isBlockedByADeadlock;
  void *v11;
  void *v12;
  void *v13;
  uint64_t threadPriority;
  unint64_t threadId;
  unint64_t v17;
  unint64_t endSampleIndex;
  unint64_t v19;
  id v20;

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  v19 = -[SACallTreeNode startSampleIndex](self, "startSampleIndex");
  if (self)
    endSampleIndex = self->_endSampleIndex;
  else
    endSampleIndex = 0;
  v3 = -[SACallTreeNode sampleCount](self, "sampleCount");
  threadId = self->_threadId;
  v17 = v3;
  threadPriority = self->_threadPriority;
  state = self->_state;
  pid = self->_pid;
  microstackshotState = self->_microstackshotState;
  -[SAWaitInfo debugDescription](self->_waitInfo, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SATurnstileInfo debugDescription](self->_turnstileInfo, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  isPartOfADeadlock = self->_isPartOfADeadlock;
  isBlockedByADeadlock = self->_isBlockedByADeadlock;
  -[NSMutableArray debugDescription](self->_childIOEvents, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray debugDescription](self->_timeRanges, "debugDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("tree state %lu-%lu (%lu) [%d] thread 0x%llx priority:%d state:0x%llx microState:0x%x waitInfo:%@ turnstileInfo:%@ deadlocked:%d indirectly_deadlocked:%d io:%@ timeRanges:%@ originPid:%d proximatePid:%d"), v19, endSampleIndex, v17, pid, threadId, threadPriority, state, microstackshotState, v7, v8, isPartOfADeadlock, isBlockedByADeadlock, v11, v12, self->_originPid, self->_proximatePid);

  return (NSString *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRanges, 0);
  objc_storeStrong((id *)&self->_childIOEvents, 0);
  objc_storeStrong((id *)&self->_turnstileInfo, 0);
  objc_storeStrong((id *)&self->_waitInfo, 0);
}

@end
