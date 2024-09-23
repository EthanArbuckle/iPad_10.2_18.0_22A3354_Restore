@implementation SATaskState

- (unint64_t)terminatedThreadsCycles
{
  return self->_terminatedThreadsCycles;
}

- (unsigned)cowFaults
{
  return self->_cowFaults;
}

+ (_QWORD)stateWithStackshotTaskV1:(uint64_t)a3 machTimebase:(unsigned int)a4 hwPageSize:(void *)a5 startTimestamp:(void *)a6 endTimestamp:(uint64_t)a7 startSampleIndex:(uint64_t)a8 endSampleIndex:
{
  id v14;
  id v15;
  SATaskState *v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;

  v14 = a6;
  v15 = a5;
  objc_opt_self();
  v16 = [SATaskState alloc];
  if (v16)
  {
    v17 = -[SATaskState initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:](v16, "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", v15, v14, a7, a8);
    v18 = (_QWORD *)v17;
    if (v17)
    {
      *(_DWORD *)(v17 + 8) = *(_DWORD *)(a2 + 60);
      v19 = *(_DWORD *)(a2 + 68);
      *(_QWORD *)(v17 + 64) = *(int *)(a2 + 64) * (unint64_t)a4;
      *(_DWORD *)(v17 + 12) = v19;
      *(_DWORD *)(v17 + 16) = *(_DWORD *)(a2 + 72);
      *(_DWORD *)(v17 + 20) = *(_DWORD *)(a2 + 76);
      *(_QWORD *)(v17 + 112) = *(unsigned int *)(a2 + 80);
      *(_DWORD *)(v17 + 24) = *(_DWORD *)(a2 + 125);
      if ((_DWORD)a3 && HIDWORD(a3))
      {
        if ((_DWORD)a3 == HIDWORD(a3))
        {
          *(_QWORD *)(v17 + 72) = *(_QWORD *)(a2 + 16);
          v20 = *(_QWORD *)(a2 + 24);
        }
        else
        {
          *(_QWORD *)(v17 + 72) = __udivti3();
          v20 = __udivti3();
        }
      }
      else
      {
        v20 = 0;
        v18[9] = 0;
      }
      v18[10] = v20;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (SATimestamp)endTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 40, 1);
}

- (SATaskState)initWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v11;
  id v12;
  SATaskState *v13;
  SATaskState *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SATaskState;
  v13 = -[SATaskState init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startTimestamp, a3);
    objc_storeStrong((id *)&v14->_endTimestamp, a4);
    v14->_startSampleIndex = a5;
    v14->_endSampleIndex = a6;
  }

  return v14;
}

- (unint64_t)taskSizeInBytes
{
  return self->_taskSizeInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donatingUniquePids, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

- (unint64_t)transitionType
{
  return 0;
}

- (BOOL)transitionIsTerminated
{
  return -[SATaskState transitionType](self, "transitionType") & 1;
}

- (id)debugDescriptionWithTask:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    if (v4 == v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ @ sample index %lu\n%@"), v7, v8, v10);
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "debugDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ @ sample indexes %lu-%lu\nstart:%@\n  end:%@"), v7, v8, v9, v10, v11);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)debugDescription
{
  SATimestamp *startTimestamp;
  SATimestamp *endTimestamp;
  id v5;
  unint64_t startSampleIndex;
  unint64_t endSampleIndex;
  void *v8;
  void *v9;
  void *v10;

  startTimestamp = self->_startTimestamp;
  endTimestamp = self->_endTimestamp;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  startSampleIndex = self->_startSampleIndex;
  if (startTimestamp == endTimestamp)
  {
    -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Task state @ sample index %lu\n%@"), startSampleIndex, v8);
  }
  else
  {
    endSampleIndex = self->_endSampleIndex;
    -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATimestamp debugDescription](self->_endTimestamp, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("Task state @ sample indexes %lu-%lu\nstart:%@\n  end:%@"), startSampleIndex, endSampleIndex, v8, v9);

  }
  return (NSString *)v10;
}

- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  NSObject *p_super;
  unint64_t startSampleIndex;
  unint64_t endSampleIndex;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  Class isa;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && a3 > a4)
  {
    v16 = *__error();
    _sa_logt();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v33 = a3;
      v34 = 2048;
      v35 = a4;
      _os_log_error_impl(&dword_1B9BE0000, p_super, OS_LOG_TYPE_ERROR, "startSampleIndexCap %lu > endSampleIndexCap %lu", buf, 0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(2387, "startSampleIndexCap %lu > endSampleIndexCap %lu", v17, v18, v19, v20, v21, v22, a3);
    _os_crash();
    __break(1u);
    goto LABEL_27;
  }
  p_super = &self->super;
  startSampleIndex = self->_startSampleIndex;
  endSampleIndex = self->_endSampleIndex;
  if (startSampleIndex == 0x7FFFFFFFFFFFFFFFLL)
    return endSampleIndex == 0x7FFFFFFFFFFFFFFFLL;
  if (endSampleIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_27:
    v23 = *__error();
    _sa_logt();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      isa = p_super[6].isa;
      *(_DWORD *)buf = 134217984;
      v33 = (unint64_t)isa;
      _os_log_error_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_ERROR, "_startSampleIndex %lu, end NSNotFound", buf, 0xCu);
    }

    *__error() = v23;
    _SASetCrashLogMessage(2390, "_startSampleIndex %lu, end NSNotFound", v26, v27, v28, v29, v30, v31, (char)p_super[6].isa);
    _os_crash();
    __break(1u);
  }
  if (endSampleIndex >= a4)
    v12 = a4;
  else
    v12 = self->_endSampleIndex;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
    endSampleIndex = v12;
  if (startSampleIndex <= a3)
    v13 = a3;
  else
    v13 = self->_startSampleIndex;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    startSampleIndex = v13;
  v14 = endSampleIndex >= startSampleIndex;
  v15 = endSampleIndex - startSampleIndex;
  if (v14)
    return v15 + 1;
  else
    return 0;
}

- (BOOL)isSuspended
{
  return self->_suspendCount || -[SATaskState isPidSuspended](self, "isPidSuspended");
}

- (BOOL)isTaskResourceFlagged
{
  return (LOBYTE(self->_ssFlags) >> 2) & 1;
}

- (BOOL)isTerminatedSnapshot
{
  return (LOBYTE(self->_ssFlags) >> 3) & 1;
}

- (BOOL)isPidSuspended
{
  return (LOBYTE(self->_ssFlags) >> 4) & 1;
}

- (BOOL)isFrozen
{
  return (LOBYTE(self->_ssFlags) >> 5) & 1;
}

- (BOOL)isDarwinBG
{
  return (LOBYTE(self->_ssFlags) >> 6) & 1;
}

- (BOOL)isDarwinExtBG
{
  return LOBYTE(self->_ssFlags) >> 7;
}

- (BOOL)isVisible
{
  return BYTE1(self->_ssFlags) & 1;
}

- (BOOL)isNonVisible
{
  return (BYTE1(self->_ssFlags) >> 1) & 1;
}

- (BOOL)isForeground
{
  return (BYTE1(self->_ssFlags) >> 2) & 1;
}

- (BOOL)isBoosted
{
  return (BYTE1(self->_ssFlags) >> 3) & 1;
}

- (BOOL)isSuppressed
{
  return (BYTE1(self->_ssFlags) >> 4) & 1;
}

- (BOOL)isTimerThrottled
{
  return (BYTE1(self->_ssFlags) >> 5) & 1;
}

- (BOOL)isImpDonor
{
  return (BYTE1(self->_ssFlags) >> 6) & 1;
}

- (BOOL)isLiveImpDonor
{
  return BYTE1(self->_ssFlags) >> 7;
}

- (BOOL)isDirty
{
  return BYTE2(self->_ssFlags) & 1;
}

- (BOOL)wqExceededConstrainedThreadLimit
{
  return (~LODWORD(self->_ssFlags) & 0xA0000) == 0;
}

- (BOOL)wqExceededTotalThreadLimit
{
  return (~LODWORD(self->_ssFlags) & 0xC0000) == 0;
}

- (unint64_t)terminatedThreadsCpuTimeNs
{
  return self->_terminatedThreadsSystemTimeInNs + self->_terminatedThreadsUserTimeInNs;
}

- (uint64_t)correspondsToKCDataTask:(_QWORD *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v9 = a5;
  if (!a1)
    goto LABEL_26;
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 56)
    || *(_QWORD *)(a1 + 64) != *(_QWORD *)(a2 + 40)
    || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 60)
    || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 64)
    || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 68)
    || *(_QWORD *)(a1 + 112) != *(_QWORD *)(a2 + 8)
    || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 80))
  {
    goto LABEL_25;
  }
  v10 = *(_QWORD *)(a1 + 72);
  if ((_DWORD)a4 && HIDWORD(a4))
  {
    if ((_DWORD)a4 == HIDWORD(a4))
    {
      if (v10 != *(_QWORD *)(a2 + 16))
        goto LABEL_25;
      v11 = *(_QWORD *)(a2 + 24);
    }
    else
    {
      if (v10 != __udivti3())
        goto LABEL_25;
      v11 = __udivti3();
    }
  }
  else
  {
    if (v10)
      goto LABEL_25;
    v11 = 0;
  }
  if (*(_QWORD *)(a1 + 80) != v11)
    goto LABEL_25;
  if (a3)
  {
    if (*a3 == *(_QWORD *)(a1 + 88) && a3[1] == *(_QWORD *)(a1 + 96))
      goto LABEL_27;
LABEL_25:
    a1 = 0;
    goto LABEL_26;
  }
  if (*(_QWORD *)(a1 + 88) || *(_QWORD *)(a1 + 96))
    goto LABEL_25;
LABEL_27:
  v13 = *(_QWORD *)(a1 + 104);
  a1 = (v9 | v13) == 0;
  if (v9 && v13)
    a1 = objc_msgSend((id)v9, "isEqualToSet:");
LABEL_26:

  return a1;
}

- (uint64_t)correspondsToKCDataDeltaTask:(_QWORD *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v9 = a5;
  if (!a1)
    goto LABEL_26;
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 48)
    || *(_QWORD *)(a1 + 64) != *(_QWORD *)(a2 + 32)
    || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 52)
    || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 56)
    || *(_DWORD *)(a1 + 20) != *(_DWORD *)(a2 + 60)
    || *(_QWORD *)(a1 + 112) != *(_QWORD *)(a2 + 8)
    || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 72))
  {
    goto LABEL_25;
  }
  v10 = *(_QWORD *)(a1 + 72);
  if ((_DWORD)a4 && HIDWORD(a4))
  {
    if ((_DWORD)a4 == HIDWORD(a4))
    {
      if (v10 != *(_QWORD *)(a2 + 16))
        goto LABEL_25;
      v11 = *(_QWORD *)(a2 + 24);
    }
    else
    {
      if (v10 != __udivti3())
        goto LABEL_25;
      v11 = __udivti3();
    }
  }
  else
  {
    if (v10)
      goto LABEL_25;
    v11 = 0;
  }
  if (*(_QWORD *)(a1 + 80) != v11)
    goto LABEL_25;
  if (a3)
  {
    if (*a3 == *(_QWORD *)(a1 + 88) && a3[1] == *(_QWORD *)(a1 + 96))
      goto LABEL_27;
LABEL_25:
    a1 = 0;
    goto LABEL_26;
  }
  if (*(_QWORD *)(a1 + 88) || *(_QWORD *)(a1 + 96))
    goto LABEL_25;
LABEL_27:
  v13 = *(_QWORD *)(a1 + 104);
  a1 = (v9 | v13) == 0;
  if (v9 && v13)
    a1 = objc_msgSend((id)v9, "isEqualToSet:");
LABEL_26:

  return a1;
}

- (uint64_t)correspondsToKCDataTransitioningTask:(_QWORD *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:
{
  unint64_t v8;
  uint64_t v10;

  v8 = a5;
  if (!a1)
    goto LABEL_11;
  if (*(_QWORD *)(a1 + 112) != *(_QWORD *)(a2 + 8) || objc_msgSend((id)a1, "transitionType") != *(_QWORD *)(a2 + 16))
    goto LABEL_10;
  if (a3)
  {
    if (*a3 == *(_QWORD *)(a1 + 88) && a3[1] == *(_QWORD *)(a1 + 96))
      goto LABEL_12;
LABEL_10:
    a1 = 0;
    goto LABEL_11;
  }
  if (*(_QWORD *)(a1 + 88) || *(_QWORD *)(a1 + 96))
    goto LABEL_10;
LABEL_12:
  v10 = *(_QWORD *)(a1 + 104);
  a1 = (v8 | v10) == 0;
  if (v8 && v10)
    a1 = objc_msgSend((id)v8, "isEqualToSet:");
LABEL_11:

  return a1;
}

+ (id)stateWithKCDataTask:(_QWORD *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:
{
  id v14;
  id v15;
  id v16;
  SATaskState *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  objc_opt_self();
  v17 = [SATaskState alloc];
  v18 = v16;
  if (v17)
  {
    v19 = -[SATaskState initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:](v17, "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", v15, v14, a8, a9);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)(v19 + 104), a5);
      *(_DWORD *)(v20 + 8) = *(_DWORD *)(a2 + 56);
      *(_QWORD *)(v20 + 64) = *(_QWORD *)(a2 + 40);
      *(_DWORD *)(v20 + 12) = *(_DWORD *)(a2 + 60);
      *(_DWORD *)(v20 + 16) = *(_DWORD *)(a2 + 64);
      *(_DWORD *)(v20 + 20) = *(_DWORD *)(a2 + 68);
      *(_QWORD *)(v20 + 112) = *(_QWORD *)(a2 + 8);
      *(_DWORD *)(v20 + 24) = *(_DWORD *)(a2 + 80);
      if ((_DWORD)a4 && HIDWORD(a4))
      {
        if ((_DWORD)a4 == HIDWORD(a4))
        {
          *(_QWORD *)(v20 + 72) = *(_QWORD *)(a2 + 16);
          v21 = *(_QWORD *)(a2 + 24);
        }
        else
        {
          *(_QWORD *)(v20 + 72) = __udivti3();
          v21 = __udivti3();
        }
      }
      else
      {
        v21 = 0;
        *(_QWORD *)(v20 + 72) = 0;
      }
      *(_QWORD *)(v20 + 80) = v21;
      if (a3)
      {
        *(_QWORD *)(v20 + 88) = *a3;
        *(_QWORD *)(v20 + 96) = a3[1];
      }
    }
  }
  else
  {
    v20 = 0;
  }

  return (id)v20;
}

+ (id)stateWithKCDataDeltaTask:(_QWORD *)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:
{
  id v14;
  id v15;
  id v16;
  SATaskState *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  objc_opt_self();
  v17 = [SATaskState alloc];
  v18 = v16;
  if (v17)
  {
    v19 = -[SATaskState initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:](v17, "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", v15, v14, a8, a9);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)(v19 + 104), a5);
      *(_DWORD *)(v20 + 8) = *(_DWORD *)(a2 + 48);
      *(_QWORD *)(v20 + 64) = *(_QWORD *)(a2 + 32);
      *(_DWORD *)(v20 + 12) = *(_DWORD *)(a2 + 52);
      *(_DWORD *)(v20 + 16) = *(_DWORD *)(a2 + 56);
      *(_DWORD *)(v20 + 20) = *(_DWORD *)(a2 + 60);
      *(_QWORD *)(v20 + 112) = *(_QWORD *)(a2 + 8);
      *(_DWORD *)(v20 + 24) = *(_DWORD *)(a2 + 72);
      if ((_DWORD)a4 && HIDWORD(a4))
      {
        if ((_DWORD)a4 == HIDWORD(a4))
        {
          *(_QWORD *)(v20 + 72) = *(_QWORD *)(a2 + 16);
          v21 = *(_QWORD *)(a2 + 24);
        }
        else
        {
          *(_QWORD *)(v20 + 72) = __udivti3();
          v21 = __udivti3();
        }
      }
      else
      {
        v21 = 0;
        *(_QWORD *)(v20 + 72) = 0;
      }
      *(_QWORD *)(v20 + 80) = v21;
      if (a3)
      {
        *(_QWORD *)(v20 + 88) = *a3;
        *(_QWORD *)(v20 + 96) = a3[1];
      }
    }
  }
  else
  {
    v20 = 0;
  }

  return (id)v20;
}

+ (SATaskStateInTransition)stateWithKCDataTransitioningTask:(uint64_t)a3 terminatedThreadsInstructionCycles:(uint64_t)a4 machTimebase:(void *)a5 donatingUniquePids:(void *)a6 startTimestamp:(void *)a7 endTimestamp:(uint64_t)a8 startSampleIndex:(uint64_t)a9 endSampleIndex:
{
  id v15;
  id v16;
  id v17;
  SATaskStateInTransition *v18;

  v15 = a7;
  v16 = a6;
  v17 = a5;
  objc_opt_self();
  v18 = -[SATaskStateInTransition initWithKCDataTransitioningTask:andTerminatedThreadsInstructionCycles:machTimebase:andDonatingUniquePids:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:]([SATaskStateInTransition alloc], "initWithKCDataTransitioningTask:andTerminatedThreadsInstructionCycles:machTimebase:andDonatingUniquePids:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", a2, a3, a4, v17, v16, v15, a8, a9);

  return v18;
}

+ (SATaskState)stateWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", v11, v10, a5, a6);

  return (SATaskState *)v12;
}

- (SATimestamp)startTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)startSampleIndex
{
  return self->_startSampleIndex;
}

- (unint64_t)endSampleIndex
{
  return self->_endSampleIndex;
}

- (unsigned)suspendCount
{
  return self->_suspendCount;
}

- (unsigned)faults
{
  return self->_faults;
}

- (unsigned)pageins
{
  return self->_pageins;
}

- (unsigned)latencyQos
{
  return self->_latencyQos;
}

- (unint64_t)terminatedThreadsUserTimeInNs
{
  return self->_terminatedThreadsUserTimeInNs;
}

- (unint64_t)terminatedThreadsSystemTimeInNs
{
  return self->_terminatedThreadsSystemTimeInNs;
}

- (unint64_t)terminatedThreadsInstructions
{
  return self->_terminatedThreadsInstructions;
}

- (NSSet)donatingUniquePids
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (unint64_t)ssFlags
{
  return self->_ssFlags;
}

+ (id)classDictionaryKey
{
  return CFSTR("SATaskState");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSSet count](self->_donatingUniquePids, "count") + 111;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v5;
  id v9;
  char *v10;
  NSSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char *v16;
  NSObject *v18;
  id v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  NSUInteger v32;
  id v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  NSUInteger v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  int v57;
  unint64_t v58;
  id v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  _BYTE v74[24];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (-[SATaskState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    LODWORD(v5) = *__error();
    _sa_logt();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[SATaskState debugDescription](self, "debugDescription");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v72 = objc_msgSend(v19, "UTF8String");
      v73 = 2048;
      *(_QWORD *)v74 = -[SATaskState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v74[8] = 2048;
      *(_QWORD *)&v74[10] = a4;
      _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v5;
    -[SATaskState debugDescription](self, "debugDescription");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "UTF8String");
    -[SATaskState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(3395, "%s: size %lu != buffer length %lu", v22, v23, v24, v25, v26, v27, v21);

    _os_crash();
    __break(1u);
    goto LABEL_18;
  }
  *(_WORD *)&a3->var0 = 513;
  *(_OWORD *)((char *)&a3->var3 + 2) = *(_OWORD *)&self->_startSampleIndex;
  *(_DWORD *)((char *)&a3->var5 + 2) = self->_suspendCount;
  *(unint64_t *)((char *)&a3->var5 + 6) = self->_taskSizeInBytes;
  *(unsigned int *)((char *)&a3->var6 + 6) = self->_faults;
  *(_DWORD *)((char *)&a3->var7 + 2) = self->_pageins;
  *(_DWORD *)((char *)&a3->var7 + 6) = self->_cowFaults;
  *(unsigned int *)((char *)&a3->var8 + 2) = self->_latencyQos;
  *(_QWORD *)((char *)&a3->var9 + 2) = self->_terminatedThreadsUserTimeInNs;
  *(_QWORD *)((char *)&a3->var11 + 2) = self->_terminatedThreadsSystemTimeInNs;
  *(unint64_t *)((char *)&a3->var12 + 6) = self->_terminatedThreadsInstructions;
  *(unint64_t *)((char *)&a3->var13 + 6) = self->_terminatedThreadsCycles;
  *(unint64_t *)((char *)&a3->var14 + 7) = self->_ssFlags;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTimestamp, v9);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTimestamp, v9);
  if (-[NSSet count](self->_donatingUniquePids, "count") >= 0xFF)
  {
LABEL_18:
    v28 = *__error();
    _sa_logt();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      -[SATaskState debugDescription](self, "debugDescription");
      v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v31 = objc_msgSend(v30, "UTF8String");
      v32 = -[NSSet count](self->_donatingUniquePids, "count");
      *(_DWORD *)buf = 136315394;
      v72 = v31;
      v73 = 2048;
      *(_QWORD *)v74 = v32;
      _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "%s: %lu donatingUniquePids", buf, 0x16u);

    }
    *__error() = v28;
    -[SATaskState debugDescription](self, "debugDescription");
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = objc_msgSend(v33, "UTF8String");
    -[NSSet count](self->_donatingUniquePids, "count");
    _SASetCrashLogMessage(3417, "%s: %lu donatingUniquePids", v35, v36, v37, v38, v39, v40, v34);

    _os_crash();
    __break(1u);
    goto LABEL_21;
  }
  v10 = (char *)&a3->var15 + 7;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v11 = self->_donatingUniquePids;
  v12 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v12)
  {
    v13 = v12;
    LOBYTE(v5) = 0;
    v14 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v68 != v14)
          objc_enumerationMutation(v11);
        *(_QWORD *)&v10[8 * v5] = objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * i), "unsignedLongLongValue");
        LOBYTE(v5) = v5 + 1;
      }
      v13 = -[NSSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    }
    while (v13);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  if (-[NSSet count](self->_donatingUniquePids, "count") != v5)
  {
LABEL_21:
    v41 = *__error();
    _sa_logt();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      -[SATaskState debugDescription](self, "debugDescription");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "UTF8String");
      v45 = -[NSSet count](self->_donatingUniquePids, "count");
      v5 = v5;
      *(_DWORD *)buf = 136315650;
      v72 = v44;
      v73 = 2048;
      *(_QWORD *)v74 = v45;
      *(_WORD *)&v74[8] = 1024;
      *(_DWORD *)&v74[10] = v5;
      _os_log_error_impl(&dword_1B9BE0000, v42, OS_LOG_TYPE_ERROR, "%s: %lu donatingUniquePids, but %u serialized", buf, 0x1Cu);

    }
    else
    {
      v5 = v5;
    }

    *__error() = v41;
    -[SATaskState debugDescription](self, "debugDescription");
    a3 = ($2089E77EEE4A1EB652AD555C69D4CCDC *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = -[$2089E77EEE4A1EB652AD555C69D4CCDC UTF8String](a3, "UTF8String");
    -[NSSet count](self->_donatingUniquePids, "count");
    _SASetCrashLogMessage(3424, "%s: %lu donatingUniquePids, but %u serialized", v47, v48, v49, v50, v51, v52, v46);

    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  BYTE6(a3->var14) = v5;
  v16 = &v10[8 * v5];
  v5 = v16 - (char *)a3 + 8;
  if (v5 != -[SATaskState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
  {
LABEL_24:
    v53 = *__error();
    _sa_logt();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      -[SATaskState debugDescription](self, "debugDescription");
      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v56 = objc_msgSend(v55, "UTF8String");
      v57 = BYTE6(a3->var14);
      v58 = -[SATaskState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      v72 = v56;
      v73 = 1024;
      *(_DWORD *)v74 = v57;
      *(_WORD *)&v74[4] = 2048;
      *(_QWORD *)&v74[6] = v5;
      *(_WORD *)&v74[14] = 2048;
      *(_QWORD *)&v74[16] = v58;
      _os_log_error_impl(&dword_1B9BE0000, v54, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u donating uniquepids), ended with length %ld, should be %lu", buf, 0x26u);

    }
    *__error() = v53;
    -[SATaskState debugDescription](self, "debugDescription");
    v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v60 = objc_msgSend(v59, "UTF8String");
    -[SATaskState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(3428, "%s: after serializing (with %u donating uniquepids), ended with length %ld, should be %lu", v61, v62, v63, v64, v65, v66, v60);

    _os_crash();
    __break(1u);
  }
  *(_QWORD *)v16 = -[SATaskState transitionType](self, "transitionType");

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v6, self, v4);

  if (v5)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_startTimestamp, "addSelfToSerializationDictionary:", v6);
    -[SATimestamp addSelfToSerializationDictionary:](self->_endTimestamp, "addSelfToSerializationDictionary:", v6);
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  int v9;
  __objc2_class **v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint8_t buf[4];
  unint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_31;
  if (a4 <= 0x66)
  {
    v23 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v50 = a4;
      v51 = 2048;
      v52 = 103;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATaskState struct %lu", buf, 0x16u);
    }

    *__error() = v23;
    _SASetCrashLogMessage(3449, "bufferLength %lu < serialized SATaskState struct %lu", v24, v25, v26, v27, v28, v29, a4);
    _os_crash();
    __break(1u);
    goto LABEL_25;
  }
  v5 = (uint64_t)a3;
  v6 = *((unsigned __int8 *)a3 + 94);
  if (8 * v6 + 103 > a4)
  {
LABEL_25:
    v30 = *__error();
    _sa_logt();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = *(unsigned __int8 *)(v5 + 94);
      *(_DWORD *)buf = 134218240;
      v50 = a4;
      v51 = 1024;
      LODWORD(v52) = v32;
      _os_log_error_impl(&dword_1B9BE0000, v31, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", buf, 0x12u);
    }

    *__error() = v30;
    _SASetCrashLogMessage(3451, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", v33, v34, v35, v36, v37, v38, a4);
    _os_crash();
    __break(1u);
LABEL_28:
    v39 = *__error();
    _sa_logt();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v41 = *(unsigned __int8 *)(v5 + 94);
      *(_DWORD *)buf = 134218240;
      v50 = a4;
      v51 = 1024;
      LODWORD(v52) = v41;
      _os_log_error_impl(&dword_1B9BE0000, v40, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATaskState struct v2 with %u donating unique pids", buf, 0x12u);
    }

    *__error() = v39;
    _SASetCrashLogMessage(3459, "bufferLength %lu < serialized SATaskState struct v2 with %u donating unique pids", v42, v43, v44, v45, v46, v47, a4);
    _os_crash();
    __break(1u);
LABEL_31:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATaskState version"), 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v48);
  }
  v7 = (char *)a3 + 103;
  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
    v8 = 0;
    goto LABEL_9;
  }
  if (8 * v6 + 111 > a4)
    goto LABEL_28;
  v8 = &v7[8 * v6];
  if (!*(_QWORD *)v8)
  {
LABEL_9:
    v9 = 0;
    v10 = off_1E7145BB0;
    goto LABEL_10;
  }
  v9 = 1;
  v10 = off_1E7145BB8;
LABEL_10:
  v11 = objc_alloc_init(*v10);
  v12 = v11;
  v13 = *(_QWORD *)(v5 + 18);
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 != 0x7FFFFFFF && v13 != 0x7FFFFFFFFFFFFFFFLL)
    v14 = *(_QWORD *)(v5 + 18);
  v11[6] = v14;
  v15 = *(_QWORD *)(v5 + 26);
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v15 != 0x7FFFFFFF && v15 != 0x7FFFFFFFFFFFFFFFLL)
    v16 = *(_QWORD *)(v5 + 26);
  v11[7] = v16;
  *((_DWORD *)v11 + 2) = *(_DWORD *)(v5 + 34);
  v11[8] = *(_QWORD *)(v5 + 38);
  *((_DWORD *)v11 + 3) = *(_DWORD *)(v5 + 46);
  *((_DWORD *)v11 + 4) = *(_DWORD *)(v5 + 50);
  *((_DWORD *)v11 + 5) = *(_DWORD *)(v5 + 54);
  *((_DWORD *)v11 + 6) = *(_DWORD *)(v5 + 58);
  v11[9] = *(_QWORD *)(v5 + 62);
  v11[10] = *(_QWORD *)(v5 + 70);
  v11[11] = *(_QWORD *)(v5 + 78);
  v11[12] = *(_QWORD *)(v5 + 86);
  v11[14] = *(_QWORD *)(v5 + 95);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", *(unsigned __int8 *)(v5 + 94));
  if (*(_BYTE *)(v5 + 94))
  {
    v18 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&v7[8 * v18]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v19);

      ++v18;
    }
    while (v18 < *(unsigned __int8 *)(v5 + 94));
  }
  v20 = objc_msgSend(v17, "copy");
  v21 = (void *)v12[13];
  v12[13] = v20;

  if (v9)
    v12[15] = *(_QWORD *)v8;

  return v12;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimestamp *v14;
  SATimestamp *startTimestamp;
  unint64_t v16;
  void *v17;
  SATimestamp *v18;
  SATimestamp *endTimestamp;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v37 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 3u)
    goto LABEL_11;
  if (a4 <= 0x66)
  {
    v20 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v39 = a4;
      v40 = 2048;
      v41 = 103;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATaskState struct %lu", buf, 0x16u);
    }

    *__error() = v20;
    _SASetCrashLogMessage(3508, "bufferLength %lu < serialized SATaskState struct %lu", v21, v22, v23, v24, v25, v26, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  if (8 * (unint64_t)*((unsigned __int8 *)a3 + 94) + 103 > a4)
  {
LABEL_8:
    v27 = *__error();
    _sa_logt();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = *((unsigned __int8 *)a3 + 94);
      *(_DWORD *)buf = 134218240;
      v39 = a4;
      v40 = 1024;
      LODWORD(v41) = v29;
      _os_log_error_impl(&dword_1B9BE0000, v28, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", buf, 0x12u);
    }

    *__error() = v27;
    _SASetCrashLogMessage(3509, "bufferLength %lu < serialized SATask struct with %u donatingUniquePids", v30, v31, v32, v33, v34, v35, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SATaskState version"), 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v36);
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v37, v11, v13);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTimestamp = self->_startTimestamp;
  self->_startTimestamp = v14;

  v16 = *(_QWORD *)((char *)a3 + 10);
  v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v37, v11, v17);
  v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTimestamp = self->_endTimestamp;
  self->_endTimestamp = v18;

}

+ (SATaskState)stateWithPAStyleTaskPrivateData:(void *)a3 donatingUniquePids:
{
  NSSet *v4;
  id v5;
  SATaskState *v6;
  SATaskState *v7;
  unint64_t v8;
  NSSet *donatingUniquePids;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_alloc_init(SATaskState);
  v7 = v6;
  if (v5)
  {
    v6->_taskSizeInBytes = *((_QWORD *)v5 + 4);
    v6->_faults = *((_DWORD *)v5 + 3);
    v6->_pageins = *((_DWORD *)v5 + 4);
    v6->_cowFaults = *((_DWORD *)v5 + 5);
    v6->_suspendCount = *((_DWORD *)v5 + 2);
    v6->_latencyQos = *((_DWORD *)v5 + 6);
    v6->_terminatedThreadsUserTimeInNs = *((_QWORD *)v5 + 6);
    v6->_terminatedThreadsSystemTimeInNs = *((_QWORD *)v5 + 7);
    v6->_terminatedThreadsInstructions = *((_QWORD *)v5 + 8);
    v6->_terminatedThreadsCycles = *((_QWORD *)v5 + 9);
    v8 = *((_QWORD *)v5 + 5);
  }
  else
  {
    v8 = 0;
    *(_QWORD *)&v6->_suspendCount = 0;
    *(_QWORD *)&v6->_pageins = 0;
    v6->_latencyQos = 0;
    *(_OWORD *)&v6->_taskSizeInBytes = 0u;
    *(_OWORD *)&v6->_terminatedThreadsSystemTimeInNs = 0u;
    v6->_terminatedThreadsCycles = 0;
  }

  donatingUniquePids = v7->_donatingUniquePids;
  v7->_donatingUniquePids = v4;
  v7->_ssFlags = v8;

  return v7;
}

- (void)applyPAStyleSampleTimestamp:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 32))
      objc_storeStrong((id *)(a1 + 32), a2);
    objc_storeStrong((id *)(a1 + 40), a2);
  }

}

@end
