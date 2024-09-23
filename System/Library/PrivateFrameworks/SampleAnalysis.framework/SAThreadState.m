@implementation SAThreadState

- (unint64_t)cpuTimeNs
{
  return self->_systemTimeInNs + self->_userTimeInNs;
}

- (SATimestamp)startTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 48, 1);
}

- (uint64_t)setEndSampleIndex:(uint64_t)result
{
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = *(_DWORD *)(result + 16) | 0x3FFFFFFF;
    }
    else
    {
      if (a2 >= 0x3FFFFFFF)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "endSampleIndex is %lu", buf, 0xCu);
        }

        *__error() = v4;
        _SASetCrashLogMessage(850, "endSampleIndex is %lu", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_DWORD *)(result + 16) & 0xC0000000 | a2;
    }
    *(_DWORD *)(result + 16) = v3;
  }
  return result;
}

- (unint64_t)endSampleIndex
{
  if ((*((_DWORD *)self + 4) & 0x3FFFFFFF) == 0x3FFFFFFF)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return *((_DWORD *)self + 4) & 0x3FFFFFFF;
}

- (SAWaitInfo)waitInfo
{
  return (SAWaitInfo *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)startSampleIndex
{
  if ((*((_DWORD *)self + 3) & 0x3FFFFFFF) == 0x3FFFFFFF)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return *((_DWORD *)self + 3) & 0x3FFFFFFF;
}

- (BOOL)isRunning
{
  return (*((unsigned __int8 *)self + 19) >> 6) & 1;
}

- (SATimestamp)endTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  NSObject *p_super;
  unint64_t v9;
  uint64_t v10;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && a3 > a4)
  {
    v19 = *__error();
    _sa_logt();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v37 = a3;
      v38 = 2048;
      v39 = a4;
      _os_log_error_impl(&dword_1B9BE0000, p_super, OS_LOG_TYPE_ERROR, "startSampleIndexCap %lu > endSampleIndexCap %lu", buf, 0x16u);
    }

    *__error() = v19;
    _SASetCrashLogMessage(1035, "startSampleIndexCap %lu > endSampleIndexCap %lu", v20, v21, v22, v23, v24, v25, a3);
    _os_crash();
    __break(1u);
    goto LABEL_29;
  }
  p_super = &self->super;
  v9 = -[SAThreadState startSampleIndex](self, "startSampleIndex");
  v10 = -[NSObject endSampleIndex](p_super, "endSampleIndex");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    return v10 == 0x7FFFFFFFFFFFFFFFLL;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_29:
    v26 = *__error();
    _sa_logt();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = -[NSObject startSampleIndex](p_super, "startSampleIndex");
      *(_DWORD *)buf = 134217984;
      v37 = v28;
      _os_log_error_impl(&dword_1B9BE0000, v27, OS_LOG_TYPE_ERROR, "endSampleIndex NSNotFound, startSampleIndex %lu", buf, 0xCu);
    }

    *__error() = v26;
    v29 = -[NSObject startSampleIndex](p_super, "startSampleIndex");
    _SASetCrashLogMessage(1038, "endSampleIndex NSNotFound, startSampleIndex %lu", v30, v31, v32, v33, v34, v35, v29);
    _os_crash();
    __break(1u);
  }
  v12 = -[NSObject endSampleIndex](p_super, "endSampleIndex");
  if (v12 >= a4)
    v13 = a4;
  else
    v13 = v12;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    v14 = v12;
  else
    v14 = v13;
  v15 = -[NSObject startSampleIndex](p_super, "startSampleIndex");
  if (v15 <= a3)
    v16 = a3;
  else
    v16 = v15;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v16 = v15;
  v17 = v14 >= v16;
  v18 = v14 - v16;
  if (v17)
    return v18 + 1;
  else
    return 0;
}

- (SATurnstileInfo)turnstileInfo
{
  return (SATurnstileInfo *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isIdleWorkQueue
{
  return *((unsigned __int8 *)self + 15) >> 7;
}

- (id)stackIgnoringKernelStackWithLeafFrame:(id)a3
{
  return -[SAThreadState stackWithBacktraceStyle:ignoringKernelStackWithLeafFrame:](self, "stackWithBacktraceStyle:ignoringKernelStackWithLeafFrame:", 0, a3);
}

- (BOOL)filledName
{
  return *((unsigned __int8 *)self + 19) >> 7;
}

- (void)setFilledName:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 19) = v3 & 0x80 | *((_BYTE *)self + 19) & 0x7F;
}

- (BOOL)filledDispatchQueue
{
  return *((_BYTE *)self + 20) & 1;
}

- (void)setFilledDispatchQueue:(BOOL)a3
{
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xFE | a3;
}

- (BOOL)filledSwiftTask
{
  return (*((unsigned __int8 *)self + 20) >> 1) & 1;
}

- (void)setFilledSwiftTask:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xFD | v3;
}

- (BOOL)filledUserStack
{
  return (*((unsigned __int8 *)self + 20) >> 2) & 1;
}

- (void)setFilledUserStack:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xFB | v3;
}

- (BOOL)filledScheduling
{
  return (*((unsigned __int8 *)self + 20) >> 3) & 1;
}

- (void)setFilledScheduling:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xF7 | v3;
}

- (BOOL)filledCyclesInstructions
{
  return (*((unsigned __int8 *)self + 20) >> 4) & 1;
}

- (void)setFilledCyclesInstructions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xEF | v3;
}

- (BOOL)filledSnapshot
{
  return (*((unsigned __int8 *)self + 20) >> 5) & 1;
}

- (void)setFilledSnapshot:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xDF | v3;
}

- (uint64_t)setStartSampleIndex:(uint64_t)result
{
  int v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = *(_DWORD *)(result + 12) | 0x3FFFFFFF;
    }
    else
    {
      if (a2 >= 0x3FFFFFFF)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "startSampleIndex is %lu", buf, 0xCu);
        }

        *__error() = v4;
        _SASetCrashLogMessage(835, "startSampleIndex is %lu", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_DWORD *)(result + 12) & 0xC0000000 | a2;
    }
    *(_DWORD *)(result + 12) = v3;
  }
  return result;
}

- (int)onBehalfOfPid
{
  return self->_originPid;
}

- (unsigned)cpuNum
{
  return self->_cpuNum - 1;
}

- (uint64_t)setCpuNum:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == -1)
    {
      v3 = 0;
    }
    else
    {
      if (a2 >= 0xFF)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "cpuNum is %u", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(869, "cpuNum is %u", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = a2 + 1;
    }
    *(_BYTE *)(result + 8) = v3;
  }
  return result;
}

- (int)basePriority
{
  if (self->_basePriority == 255)
    return -1;
  else
    return self->_basePriority;
}

- (int)setBasePriority:(int *)result
{
  unsigned int v2;
  int *v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = a2;
    v3 = result;
    if (a2 >= 0xFF)
    {
      v4 = *__error();
      _sa_logt();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v2;
        _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "basePriority %d", (uint8_t *)v6, 8u);
      }

      result = __error();
      *result = v4;
      LOBYTE(v2) = -1;
    }
    *((_BYTE *)v3 + 9) = v2;
  }
  return result;
}

- (int)scheduledPriority
{
  if (self->_scheduledPriority == 255)
    return -1;
  else
    return self->_scheduledPriority;
}

- (int)setScheduledPriority:(int *)result
{
  unsigned int v2;
  int *v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = a2;
    v3 = result;
    if (a2 >= 0xFF)
    {
      v4 = *__error();
      _sa_logt();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v2;
        _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "scheduledPriority %d", (uint8_t *)v6, 8u);
      }

      result = __error();
      *result = v4;
      LOBYTE(v2) = -1;
    }
    *((_BYTE *)v3 + 10) = v2;
  }
  return result;
}

- (unsigned)threadQos
{
  if ((*((_BYTE *)self + 11) & 7) == 7)
    return 125;
  else
    return *((_BYTE *)self + 11) & 7;
}

- (uint64_t)setThreadQos:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 125)
    {
      v3 = *(_BYTE *)(result + 11) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "threadQos %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(922, "threadQos %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_BYTE *)(result + 11) & 0xF8 | a2;
    }
    *(_BYTE *)(result + 11) = v3;
  }
  return result;
}

- (unsigned)threadRequestedQos
{
  if (((*((unsigned __int8 *)self + 11) >> 3) & 7) == 7)
    return 125;
  else
    return (*((_BYTE *)self + 11) >> 3) & 7;
}

- (uint64_t)setThreadRequestedQos:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 125)
    {
      v3 = *(_BYTE *)(result + 11) | 0x38;
    }
    else
    {
      if (a2 >= 7)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "threadRequestedQos %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(923, "threadRequestedQos %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_BYTE *)(result + 11) & 0xC7 | (8 * (a2 & 7));
    }
    *(_BYTE *)(result + 11) = v3;
  }
  return result;
}

- (unsigned)threadRequestedQosOverride
{
  if ((*((_BYTE *)self + 21) & 7) == 7)
    return 125;
  else
    return *((_BYTE *)self + 21) & 7;
}

- (uint64_t)setThreadRequestedQosOverride:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 125)
    {
      v3 = *(_BYTE *)(result + 21) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "threadRequestedQosOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(924, "threadRequestedQosOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_BYTE *)(result + 21) & 0xF8 | a2;
    }
    *(_BYTE *)(result + 21) = v3;
  }
  return result;
}

- (unsigned)threadQosPromote
{
  if (((*((unsigned __int8 *)self + 21) >> 3) & 7) == 7)
    return 125;
  else
    return (*((_BYTE *)self + 21) >> 3) & 7;
}

- (uint64_t)setThreadQosPromote:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 125)
    {
      v3 = *(_BYTE *)(result + 21) | 0x38;
    }
    else
    {
      if (a2 >= 7)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "threadQosPromote %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(925, "threadQosPromote %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_BYTE *)(result + 21) & 0xC7 | (8 * (a2 & 7));
    }
    *(_BYTE *)(result + 21) = v3;
  }
  return result;
}

- (unsigned)threadQosKEventOverride
{
  if ((*((_BYTE *)self + 22) & 7) == 7)
    return 125;
  else
    return *((_BYTE *)self + 22) & 7;
}

- (uint64_t)setThreadQosKEventOverride:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 125)
    {
      v3 = *(_BYTE *)(result + 22) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "threadQosKEventOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(926, "threadQosKEventOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_BYTE *)(result + 22) & 0xF8 | a2;
    }
    *(_BYTE *)(result + 22) = v3;
  }
  return result;
}

- (unsigned)threadQosWorkQueueOverride
{
  if (((*((unsigned __int8 *)self + 22) >> 3) & 7) == 7)
    return 125;
  else
    return (*((_BYTE *)self + 22) >> 3) & 7;
}

- (uint64_t)setThreadQosWorkQueueOverride:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 125)
    {
      v3 = *(_BYTE *)(result + 22) | 0x38;
    }
    else
    {
      if (a2 >= 7)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "threadQosWorkQueueOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(927, "threadQosWorkQueueOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_BYTE *)(result + 22) & 0xC7 | (8 * (a2 & 7));
    }
    *(_BYTE *)(result + 22) = v3;
  }
  return result;
}

- (unsigned)threadQosWorkloopServicerOverride
{
  if ((self->_ioTier & 7) == 7)
    return 125;
  else
    return self->_ioTier & 7;
}

- (uint64_t)setThreadQosWorkloopServicerOverride:(uint64_t)result
{
  char v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 == 125)
    {
      v3 = *(_BYTE *)(result + 23) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        v4 = *__error();
        _sa_logt();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v13 = a2;
          _os_log_error_impl(&dword_1B9BE0000, v5, OS_LOG_TYPE_ERROR, "threadQosWorkloopServicerOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(928, "threadQosWorkloopServicerOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      v3 = *(_BYTE *)(result + 23) & 0xF8 | a2;
    }
    *(_BYTE *)(result + 23) = v3;
  }
  return result;
}

- (BOOL)isSuspended
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (BOOL)isIOPassive
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (BOOL)isDarwinBG
{
  return (*((unsigned __int8 *)self + 15) >> 6) & 1;
}

- (BOOL)isPromotedAboveTask
{
  return (self->_ioTier >> 3) & 1;
}

- (BOOL)isWaiting
{
  return self->_state & 1;
}

- (BOOL)isStopped
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (BOOL)isRunnable
{
  return (LOBYTE(self->_state) >> 2) & 1;
}

- (BOOL)isWaitingUninterruptibly
{
  return (LOBYTE(self->_state) >> 3) & 1;
}

- (BOOL)isHaltedAtTermination
{
  return (LOBYTE(self->_state) >> 4) & 1;
}

- (BOOL)isAbortingInterruptibleWaits
{
  return (LOBYTE(self->_state) >> 5) & 1;
}

- (BOOL)isAbortingInterruptibleWaitsAtSafePoints
{
  return (LOBYTE(self->_state) >> 6) & 1;
}

- (BOOL)hasDispatchQueue
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)hasSwiftTask
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_swiftTask);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)isMicrostackshot
{
  return 0;
}

- (BOOL)isInterruptRecord
{
  return 0;
}

- (BOOL)isTimerArmingRecord
{
  return 0;
}

- (BOOL)isIORecord
{
  return 0;
}

- (BOOL)isUserMode
{
  return 0;
}

- (BOOL)isBatteryAndUserActivityValid
{
  return 0;
}

- (BOOL)isUserActive
{
  return 0;
}

- (BOOL)isOnBattery
{
  return 0;
}

- (unsigned)cpuSpeedMhz
{
  return 0;
}

- (unsigned)microstackshotFlags
{
  return 0;
}

- (SAThreadState)init
{
  SAThreadState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAThreadState;
  result = -[SAThreadState init](&v3, sel_init);
  if (result)
    *(_QWORD *)&result->_originPid = -1;
  return result;
}

- (SAThreadState)initWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v11;
  id v12;
  SAThreadState *v13;
  uint64_t v14;

  v11 = a3;
  v12 = a4;
  v13 = -[SAThreadState init](self, "init");
  v14 = (uint64_t)v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startTimestamp, a3);
    objc_storeStrong((id *)(v14 + 56), a4);
    -[SAThreadState setStartSampleIndex:](v14, a5);
    -[SAThreadState setEndSampleIndex:](v14, a6);
    *(_BYTE *)(v14 + 21) |= 0x38u;
    *(_BYTE *)(v14 + 22) |= 0x3Fu;
    *(_BYTE *)(v14 + 23) |= 7u;
  }

  return (SAThreadState *)v14;
}

+ (SAThreadState)stateWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", v11, v10, a5, a6);

  return (SAThreadState *)v12;
}

- (SAThreadState)initWithKCDataThreadV4:(const thread_snapshot_v4 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12 waitInfo:(id)a13 turnstileInfo:(id)a14 threadPolicyVersion:(unsigned int)a15 threadInstructionCycles:(const instrs_cycles_snapshot *)a16
{
  SAThreadState *v17;
  uint64_t v18;
  unsigned int ths_effective_policy;
  uint64_t ths_requested_policy;

  v17 = -[SAThreadState initWithKCDataThreadV2:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:machTimebase:waitInfo:turnstileInfo:](self, "initWithKCDataThreadV2:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:machTimebase:waitInfo:turnstileInfo:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  if (v17)
  {
    if (a16)
      *(instrs_cycles_snapshot *)&v17->_instructions = *a16;
    switch(a15)
    {
      case 0u:
        return v17;
      case 4u:
        -[SAThreadState setThreadQosPromote:]((uint64_t)v17, (LODWORD(a3->ths_requested_policy) >> 25) & 7);
        break;
      case 5u:
        ths_requested_policy = a3->ths_requested_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v17, (ths_requested_policy >> 25) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v17, (ths_requested_policy >> 35) & 7);
        break;
      case 6u:
      case 7u:
        v18 = a3->ths_requested_policy;
        ths_effective_policy = a3->ths_effective_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v17, (v18 >> 25) & 7);
        -[SAThreadState setThreadQosKEventOverride:]((uint64_t)v17, (v18 >> 28) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v17, BYTE4(v18) & 7);
        -[SAThreadState setThreadQosWorkloopServicerOverride:]((uint64_t)v17, (v18 >> 35) & 7);
        v17->_ioTier = v17->_ioTier & 0xF7 | (ths_effective_policy >> 21) & 8;
        break;
      default:
        SAComplainAboutUnknownThreadPolicyVersion(a15);
        break;
    }
  }
  return v17;
}

+ (id)stateWithKCDataThreadV4:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(uint64_t)a11 machTimebase:(void *)a12 waitInfo:(void *)a13 turnstileInfo:(int)a14 threadPolicyVersion:(uint64_t)a15 threadInstructionCycles:
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v29;

  v19 = a13;
  v20 = a12;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a4;
  v26 = a3;
  LODWORD(v29) = a14;
  v27 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithKCDataThreadV4:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:machTimebase:waitInfo:turnstileInfo:threadPolicyVersion:threadInstructionCycles:", a2, v26, v25, a5, a6, v24, v23, v22, v21, a11, v20, v19, v29, a15);

  return v27;
}

- (SAThreadState)initWithKCDataThreadV2:(const thread_snapshot_v2 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12 waitInfo:(id)a13 turnstileInfo:(id)a14
{
  id v17;
  id v18;
  SAThreadState *v19;
  uint64_t v20;
  uint64_t ths_user_time;
  uint64_t v22;
  void *v23;
  uint64_t ths_ss_flags;
  uint64_t v25;
  void *v26;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;

  v17 = a4;
  v18 = a8;
  v35 = a9;
  v34 = a10;
  v33 = a11;
  v32 = a13;
  v31 = a14;
  v19 = -[SAThreadState initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:](self, "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", v17, a5, a6, a7);
  v20 = (uint64_t)v19;
  if (v19)
  {
    v19->_voucherIdentifier = a3->ths_voucher_identifier;
    if (a12.numer && a12.denom)
    {
      if (a12.numer == a12.denom)
      {
        v19->_systemTimeInNs = a3->ths_sys_time;
        ths_user_time = a3->ths_user_time;
      }
      else
      {
        v19->_systemTimeInNs = __udivti3();
        ths_user_time = __udivti3();
      }
    }
    else
    {
      ths_user_time = 0;
      *(_QWORD *)(v20 + 144) = 0;
    }
    *(_QWORD *)(v20 + 136) = ths_user_time;
    *(_QWORD *)(v20 + 152) = 0;
    *(_QWORD *)(v20 + 160) = 0;
    *(_DWORD *)(v20 + 40) = a3->ths_state;
    -[SAThreadState setBasePriority:]((int *)v20, a3->ths_base_priority);
    -[SAThreadState setScheduledPriority:]((int *)v20, a3->ths_sched_priority);
    *(_DWORD *)(v20 + 36) = a3->ths_sched_flags;
    -[SAThreadState setThreadQos:](v20, a3->ths_eqos);
    -[SAThreadState setThreadRequestedQos:](v20, a3->ths_rqos);
    -[SAThreadState setThreadRequestedQosOverride:](v20, a3->ths_rqos_override);
    *(_BYTE *)(v20 + 23) &= ~8u;
    *(_BYTE *)(v20 + 24) = a3->ths_io_tier;
    if (a3->ths_last_made_runnable_time + 1 >= 2)
    {
      +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", 0.0, 0.0, 0.0);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(v20 + 168);
      *(_QWORD *)(v20 + 168) = v22;

      objc_msgSend(*(id *)(v20 + 168), "guessMissingTimesBasedOnTimestamp:", v17);
    }
    objc_storeStrong((id *)(v20 + 64), a9);
    objc_storeStrong((id *)(v20 + 72), a10);
    objc_storeStrong((id *)(v20 + 80), a11);
    objc_storeStrong((id *)(v20 + 88), a13);
    objc_storeStrong((id *)(v20 + 96), a14);
    ths_ss_flags = a3->ths_ss_flags;
    if ((ths_ss_flags & 0x40) != 0)
    {
      *(_BYTE *)(v20 + 11) |= 0x40u;
      ths_ss_flags = a3->ths_ss_flags;
      if ((ths_ss_flags & 0x20) == 0)
      {
LABEL_12:
        if ((ths_ss_flags & 0x10) == 0)
          goto LABEL_13;
        goto LABEL_20;
      }
    }
    else if ((ths_ss_flags & 0x20) == 0)
    {
      goto LABEL_12;
    }
    *(_BYTE *)(v20 + 11) |= 0x80u;
    ths_ss_flags = a3->ths_ss_flags;
    if ((ths_ss_flags & 0x10) == 0)
    {
LABEL_13:
      if ((ths_ss_flags & 0x1000) == 0)
        goto LABEL_14;
      goto LABEL_21;
    }
LABEL_20:
    *(_BYTE *)(v20 + 15) |= 0x40u;
    ths_ss_flags = a3->ths_ss_flags;
    if ((ths_ss_flags & 0x1000) == 0)
    {
LABEL_14:
      if ((ths_ss_flags & 0x800) == 0)
      {
LABEL_16:
        v25 = objc_msgSend(v18, "copy", a9);
        v26 = *(void **)(v20 + 104);
        *(_QWORD *)(v20 + 104) = v25;

        goto LABEL_17;
      }
LABEL_15:
      *(_BYTE *)(v20 + 19) |= 0x40u;
      goto LABEL_16;
    }
LABEL_21:
    *(_BYTE *)(v20 + 15) |= 0x80u;
    if ((a3->ths_ss_flags & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_17:

  return (SAThreadState *)v20;
}

+ (id)stateWithKCDataThreadV2:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(uint64_t)a11 machTimebase:(void *)a12 waitInfo:(void *)a13 turnstileInfo:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v17 = a13;
  v18 = a12;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithKCDataThreadV2:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:machTimebase:waitInfo:turnstileInfo:", a2, v24, v23, a5, a6, v22, v21, v20, v19, a11, v18, v17);

  return v25;
}

- (SAThreadState)initWithKCDataDeltaThreadV2:(const thread_delta_snapshot_v2 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 oldThreadState:(id)a12 waitInfo:(id)a13 turnstileInfo:(id)a14
{
  id v17;
  _QWORD *v18;
  SAThreadState *v19;
  uint64_t v20;
  uint64_t tds_ss_flags;
  uint64_t v22;
  void *v23;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v17 = a8;
  v32 = a9;
  v31 = a10;
  v30 = a11;
  v18 = a12;
  v29 = a13;
  v28 = a14;
  v19 = -[SAThreadState initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:](self, "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", a4, a5, a6, a7);
  v20 = (uint64_t)v19;
  if (v19)
  {
    v19->_voucherIdentifier = a3->tds_voucher_identifier;
    v19->_systemTimeInNs = v18[18];
    v19->_userTimeInNs = v18[17];
    v19->_instructions = v18[19];
    v19->_cycles = v18[20];
    v19->_state = a3->tds_state;
    -[SAThreadState setBasePriority:]((int *)v19, a3->tds_base_priority);
    -[SAThreadState setScheduledPriority:]((int *)v20, a3->tds_sched_priority);
    *(_DWORD *)(v20 + 36) = a3->tds_sched_flags;
    -[SAThreadState setThreadQos:](v20, a3->tds_eqos);
    -[SAThreadState setThreadRequestedQos:](v20, a3->tds_rqos);
    -[SAThreadState setThreadRequestedQosOverride:](v20, a3->tds_rqos_override);
    *(_BYTE *)(v20 + 23) &= ~8u;
    *(_BYTE *)(v20 + 24) = a3->tds_io_tier;
    objc_storeStrong((id *)(v20 + 64), a9);
    objc_storeStrong((id *)(v20 + 72), a10);
    objc_storeStrong((id *)(v20 + 80), a11);
    objc_storeStrong((id *)(v20 + 88), a13);
    objc_storeStrong((id *)(v20 + 96), a14);
    tds_ss_flags = a3->tds_ss_flags;
    if ((tds_ss_flags & 0x40) != 0)
    {
      *(_BYTE *)(v20 + 11) |= 0x40u;
      tds_ss_flags = a3->tds_ss_flags;
      if ((tds_ss_flags & 0x20) == 0)
      {
LABEL_4:
        if ((tds_ss_flags & 0x10) == 0)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    else if ((tds_ss_flags & 0x20) == 0)
    {
      goto LABEL_4;
    }
    *(_BYTE *)(v20 + 11) |= 0x80u;
    tds_ss_flags = a3->tds_ss_flags;
    if ((tds_ss_flags & 0x10) == 0)
    {
LABEL_5:
      if ((tds_ss_flags & 0x1000) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
LABEL_12:
    *(_BYTE *)(v20 + 15) |= 0x40u;
    tds_ss_flags = a3->tds_ss_flags;
    if ((tds_ss_flags & 0x1000) == 0)
    {
LABEL_6:
      if ((tds_ss_flags & 0x800) == 0)
      {
LABEL_8:
        v22 = objc_msgSend(v17, "copy");
        v23 = *(void **)(v20 + 104);
        *(_QWORD *)(v20 + 104) = v22;

        goto LABEL_9;
      }
LABEL_7:
      *(_BYTE *)(v20 + 19) |= 0x40u;
      goto LABEL_8;
    }
LABEL_13:
    *(_BYTE *)(v20 + 15) |= 0x80u;
    if ((a3->tds_ss_flags & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_9:

  return (SAThreadState *)v20;
}

+ (id)stateWithKCDataDeltaThreadV2:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(void *)a11 oldThreadState:(void *)a12 waitInfo:(void *)a13 turnstileInfo:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;

  v16 = a13;
  v17 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithKCDataDeltaThreadV2:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:oldThreadState:waitInfo:turnstileInfo:", a2, v24, v23, a5, a6, v22, v21, v20, v19, v18, v17, v16);

  return v25;
}

- (SAThreadState)initWithKCDataDeltaThreadV3:(const thread_delta_snapshot_v3 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 oldThreadState:(id)a12 waitInfo:(id)a13 turnstileInfo:(id)a14 threadPolicyVersion:(unsigned int)a15
{
  SAThreadState *v16;
  uint64_t v17;
  unsigned int tds_effective_policy;
  uint64_t tds_requested_policy;

  v16 = -[SAThreadState initWithKCDataDeltaThreadV2:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:oldThreadState:waitInfo:turnstileInfo:](self, "initWithKCDataDeltaThreadV2:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:oldThreadState:waitInfo:turnstileInfo:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
  if (v16)
  {
    switch(a15)
    {
      case 0u:
        return v16;
      case 4u:
        -[SAThreadState setThreadQosPromote:]((uint64_t)v16, (LODWORD(a3->tds_requested_policy) >> 25) & 7);
        break;
      case 5u:
        tds_requested_policy = a3->tds_requested_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v16, (tds_requested_policy >> 25) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v16, (tds_requested_policy >> 35) & 7);
        break;
      case 6u:
      case 7u:
        v17 = a3->tds_requested_policy;
        tds_effective_policy = a3->tds_effective_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v16, (v17 >> 25) & 7);
        -[SAThreadState setThreadQosKEventOverride:]((uint64_t)v16, (v17 >> 28) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v16, BYTE4(v17) & 7);
        -[SAThreadState setThreadQosWorkloopServicerOverride:]((uint64_t)v16, (v17 >> 35) & 7);
        v16->_ioTier = v16->_ioTier & 0xF7 | (tds_effective_policy >> 21) & 8;
        break;
      default:
        SAComplainAboutUnknownThreadPolicyVersion(a15);
        break;
    }
  }
  return v16;
}

+ (id)stateWithKCDataDeltaThreadV3:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(void *)a11 oldThreadState:(void *)a12 waitInfo:(void *)a13 turnstileInfo:(int)a14 threadPolicyVersion:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v28;

  v17 = a13;
  v18 = a12;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a8;
  v23 = a7;
  v24 = a4;
  v25 = a3;
  LODWORD(v28) = a14;
  v26 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithKCDataDeltaThreadV3:startTimestamp:endTimestamp:startSampleIndex:endSampleIndex:name:leafUserFrame:leafOfCRootFramesReplacedBySwiftAsync:leafKernelFrame:oldThreadState:waitInfo:turnstileInfo:threadPolicyVersion:", a2, v25, v24, a5, a6, v23, v22, v21, v20, v19, v18, v17, v28);

  return v26;
}

- (SAThreadState)initWithStackshotThreadV1:(const thread_snapshot *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 leafUserFrame:(id)a8 leafOfCRootFramesReplacedBySwiftAsync:(id)a9 leafKernelFrame:(id)a10 machTimebase:(mach_timebase_info)a11
{
  id v18;
  SAThreadState *v19;
  uint64_t v20;
  uint64_t v21;
  __int16 var11_low;
  id v24;
  id v25;

  v25 = a8;
  v24 = a9;
  v18 = a10;
  v19 = -[SAThreadState initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:](self, "initWithStartTimestamp:endTimestamp:startSampleIndex:endSampleIndex:", a4, a5, a6, a7);
  v20 = (uint64_t)v19;
  if (!v19)
    goto LABEL_16;
  v19->_voucherIdentifier = *(unint64_t *)((char *)&a3->var31 + 4);
  if (a11.numer && a11.denom)
  {
    if (a11.numer == a11.denom)
    {
      v19->_systemTimeInNs = *(unint64_t *)((char *)&a3->var6 + 4);
      v21 = *(unint64_t *)((char *)&a3->var5 + 4);
    }
    else
    {
      v19->_systemTimeInNs = __udivti3();
      v21 = __udivti3();
    }
  }
  else
  {
    v21 = 0;
    *(_QWORD *)(v20 + 144) = 0;
  }
  *(_QWORD *)(v20 + 136) = v21;
  *(_QWORD *)(v20 + 152) = 0;
  *(_QWORD *)(v20 + 160) = 0;
  *(_DWORD *)(v20 + 40) = HIDWORD(a3->var7);
  -[SAThreadState setBasePriority:]((int *)v20, a3->var8);
  -[SAThreadState setScheduledPriority:]((int *)v20, a3->var9);
  *(_DWORD *)(v20 + 36) = a3->var10;
  -[SAThreadState setThreadQos:](v20, BYTE1(a3->var11));
  -[SAThreadState setThreadRequestedQos:](v20, BYTE2(a3->var11));
  -[SAThreadState setThreadRequestedQosOverride:](v20, HIBYTE(a3->var11));
  *(_BYTE *)(v20 + 23) &= ~8u;
  *(_BYTE *)(v20 + 24) = a3->var12;
  objc_storeStrong((id *)(v20 + 64), a8);
  objc_storeStrong((id *)(v20 + 72), a9);
  objc_storeStrong((id *)(v20 + 80), a10);
  LOBYTE(var11_low) = a3->var11;
  if ((var11_low & 0x40) == 0)
  {
    if ((a3->var11 & 0x20) == 0)
      goto LABEL_10;
LABEL_18:
    *(_BYTE *)(v20 + 11) |= 0x80u;
    LOBYTE(var11_low) = a3->var11;
    if ((var11_low & 0x10) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  *(_BYTE *)(v20 + 11) |= 0x40u;
  LOBYTE(var11_low) = a3->var11;
  if ((var11_low & 0x20) != 0)
    goto LABEL_18;
LABEL_10:
  if ((var11_low & 0x10) != 0)
  {
LABEL_11:
    *(_BYTE *)(v20 + 15) |= 0x40u;
    LOBYTE(var11_low) = a3->var11;
  }
LABEL_12:
  var11_low = (char)var11_low;
  if (((char)var11_low & 0x1000) != 0)
  {
    *(_BYTE *)(v20 + 15) |= 0x80u;
    var11_low = SLOBYTE(a3->var11);
  }
  if ((var11_low & 0x800) != 0)
    *(_BYTE *)(v20 + 19) |= 0x40u;
LABEL_16:

  return (SAThreadState *)v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 48), self->_startTimestamp);
  objc_storeStrong((id *)(v4 + 56), self->_endTimestamp);
  v5 = *(_DWORD *)(v4 + 16);
  *(_DWORD *)(v4 + 12) = *(_DWORD *)(v4 + 12) & 0xC0000000 | *((_DWORD *)self + 3) & 0x3FFFFFFF;
  *(_DWORD *)(v4 + 16) = v5 & 0xC0000000 | *((_DWORD *)self + 4) & 0x3FFFFFFF;
  objc_storeStrong((id *)(v4 + 64), self->_leafUserFrame);
  objc_storeStrong((id *)(v4 + 72), self->_leafOfCRootFramesReplacedBySwiftAsync);
  objc_storeStrong((id *)(v4 + 80), self->_leafKernelFrame);
  objc_storeStrong((id *)(v4 + 176), self->_exclavesInfo);
  objc_storeStrong((id *)(v4 + 88), self->_waitInfo);
  objc_storeStrong((id *)(v4 + 96), self->_turnstileInfo);
  v6 = -[NSString copy](self->_name, "copy");
  v7 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
  objc_storeWeak((id *)(v4 + 112), WeakRetained);

  v9 = objc_loadWeakRetained((id *)&self->_swiftTask);
  objc_storeWeak((id *)(v4 + 120), v9);

  *(_QWORD *)(v4 + 128) = self->_voucherIdentifier;
  *(_DWORD *)(v4 + 28) = self->_originPid;
  *(_DWORD *)(v4 + 32) = self->_proximatePid;
  *(_QWORD *)(v4 + 136) = self->_userTimeInNs;
  *(_QWORD *)(v4 + 144) = self->_systemTimeInNs;
  *(_QWORD *)(v4 + 152) = self->_instructions;
  *(_QWORD *)(v4 + 160) = self->_cycles;
  *(_BYTE *)(v4 + 9) = self->_basePriority;
  *(_BYTE *)(v4 + 10) = self->_scheduledPriority;
  *(_DWORD *)(v4 + 36) = self->_schedulerFlags;
  objc_storeStrong((id *)(v4 + 168), self->_timestampLastMadeRunnable);
  v10 = *(_BYTE *)(v4 + 11) & 0xF8 | *((_BYTE *)self + 11) & 7;
  *(_BYTE *)(v4 + 11) = v10;
  v11 = v10 & 0xC7 | (8 * ((*((_BYTE *)self + 11) >> 3) & 7));
  *(_BYTE *)(v4 + 11) = v11;
  v12 = *(_BYTE *)(v4 + 21) & 0xF8 | *((_BYTE *)self + 21) & 7;
  *(_BYTE *)(v4 + 21) = v12;
  *(_BYTE *)(v4 + 21) = v12 & 0xC7 | *((_BYTE *)self + 21) & 0x38;
  v13 = *(_BYTE *)(v4 + 22) & 0xF8 | *((_BYTE *)self + 22) & 7;
  *(_BYTE *)(v4 + 22) = v13;
  *(_BYTE *)(v4 + 22) = v13 & 0xC7 | *((_BYTE *)self + 22) & 0x38;
  v14 = *(_BYTE *)(v4 + 23) & 0xF8 | self->_ioTier & 7;
  *(_BYTE *)(v4 + 23) = v14;
  *(_BYTE *)(v4 + 23) = v14 & 0xF7 | self->_ioTier & 8;
  *(_BYTE *)(v4 + 24) = self->_threadQosIpcOverride;
  v15 = *((_BYTE *)self + 11) & 0x80 | v11 & 0x7F;
  *(_BYTE *)(v4 + 11) = v15;
  *(_BYTE *)(v4 + 11) = v15 & 0xBF | *((_BYTE *)self + 11) & 0x40;
  v16 = *(_BYTE *)(v4 + 15) & 0xBF | (((*((_BYTE *)self + 15) & 0x40) != 0) << 6);
  *(_BYTE *)(v4 + 15) = v16;
  *(_BYTE *)(v4 + 15) = *((_BYTE *)self + 15) & 0x80 | v16 & 0x7F;
  *(_BYTE *)(v4 + 19) = *(_BYTE *)(v4 + 19) & 0xBF | *((_BYTE *)self + 19) & 0x40;
  *(_DWORD *)(v4 + 40) = self->_state;
  return (id)v4;
}

- (unint64_t)hash
{
  return (uint64_t)self->_leafKernelFrame ^ (uint64_t)self->_leafUserFrame;
}

- (BOOL)isEqual:(id)a3
{
  SAThreadState *v4;
  SAThreadState *v5;
  unsigned int v6;
  BOOL v7;
  SAThreadState *v9;
  id WeakRetained;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  SAWaitInfo *waitInfo;
  SAWaitInfo *v16;
  SATurnstileInfo *turnstileInfo;
  SATurnstileInfo *v18;
  NSString *name;
  NSString *v20;

  v4 = (SAThreadState *)a3;
  if (self == v4)
  {
    v7 = 1;
    goto LABEL_19;
  }
  if (!-[SAThreadState isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = 0;
    goto LABEL_19;
  }
  v5 = v4;
  if (self->_systemTimeInNs == v5->_systemTimeInNs
    && self->_userTimeInNs == v5->_userTimeInNs
    && self->_state == v5->_state
    && self->_basePriority == v5->_basePriority
    && self->_scheduledPriority == v5->_scheduledPriority
    && self->_schedulerFlags == v5->_schedulerFlags
    && self->_voucherIdentifier == v5->_voucherIdentifier
    && self->_originPid == v5->_originPid
    && self->_proximatePid == v5->_proximatePid)
  {
    v6 = *((unsigned __int8 *)v5 + 11) ^ *((unsigned __int8 *)self + 11);
    if ((v6 & 0x3F) == 0
      && ((*((_BYTE *)v5 + 21) ^ *((_BYTE *)self + 21)) & 7) == 0
      && ((*((_BYTE *)v5 + 22) ^ *((_BYTE *)self + 22)) & 0x3F) == 0)
    {
      v9 = v5;
      if ((*((_BYTE *)v5 + 21) ^ *((_BYTE *)self + 21)) & 0x38 | (v5->_ioTier ^ self->_ioTier) & 7)
        goto LABEL_21;
      v7 = 0;
      if (v6 > 0x3F || self->_threadQosIpcOverride != v5->_threadQosIpcOverride)
        goto LABEL_16;
      if (((*((unsigned __int8 *)v5 + 19) ^ *((unsigned __int8 *)self + 19)) & 0x40) != 0
        || (*((unsigned __int8 *)v5 + 15) ^ *((unsigned __int8 *)self + 15)) > 0x3F
        || self->_leafUserFrame != v5->_leafUserFrame
        || self->_leafOfCRootFramesReplacedBySwiftAsync != v5->_leafOfCRootFramesReplacedBySwiftAsync
        || self->_leafKernelFrame != v5->_leafKernelFrame
        || self->_exclavesInfo != v5->_exclavesInfo)
      {
LABEL_21:
        v7 = 0;
        goto LABEL_16;
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
      v11 = objc_loadWeakRetained((id *)&v9->_dispatchQueue);
      if (WeakRetained != v11)
      {
        v12 = 0;
LABEL_36:

        v5 = v9;
        v7 = v12;
        goto LABEL_16;
      }
      v13 = objc_loadWeakRetained((id *)&self->_swiftTask);
      v14 = objc_loadWeakRetained((id *)&v9->_swiftTask);
      if (v13 != v14)
        goto LABEL_34;
      waitInfo = self->_waitInfo;
      v16 = v9->_waitInfo;
      if (waitInfo)
      {
        if (!v16 || !-[SAWaitInfo isEqual:](waitInfo, "isEqual:"))
          goto LABEL_34;
      }
      else if (v16)
      {
        goto LABEL_34;
      }
      turnstileInfo = self->_turnstileInfo;
      v18 = v9->_turnstileInfo;
      if (turnstileInfo)
      {
        if (v18 && -[SATurnstileInfo isEqual:](turnstileInfo, "isEqual:"))
        {
LABEL_47:
          name = self->_name;
          v20 = v9->_name;
          v12 = ((unint64_t)name | (unint64_t)v20) == 0;
          if (name && v20)
            v12 = -[NSString isEqualToString:](name, "isEqualToString:");
          goto LABEL_35;
        }
      }
      else if (!v18)
      {
        goto LABEL_47;
      }
LABEL_34:
      v12 = 0;
LABEL_35:

      goto LABEL_36;
    }
  }
  v7 = 0;
LABEL_16:

LABEL_19:
  return v7;
}

- (id)stackWithBacktraceStyle:(unint64_t)a3 ignoringKernelStackWithLeafFrame:(id)a4
{
  SAFrame *v6;
  id v7;
  _BOOL4 v8;
  unsigned int v9;
  _BOOL4 v10;
  SAThreadState *v11;
  SAFrame *v12;
  SAFrame *v13;
  id *p_isa;
  SAFrame *v15;
  SAFrame *v16;
  SAFrame *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SAFrame *v22;
  SAFrame *v23;
  const char *v24;
  id v25;
  const char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const char *v30;
  id v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id Property;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  void *v42;
  _QWORD *v43;
  const char *v44;
  SAExclaveFrame *v45;
  id v46;
  id v47;
  _BYTE *v48;
  uint64_t v49;
  SAFrame *parentFrame;
  SAFrame *v51;
  SAFrame *v52;
  SAFrame *v53;
  SAFrame *v54;
  SAFrame *v55;
  _BOOL4 v56;
  id v57;
  _BYTE *v58;
  char v59;
  int v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  SAThreadState *v69;
  SAFrame *v70;
  void *v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  unint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = (SAFrame *)a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((a3 & 0x19) == 0 && self->_leafKernelFrame != v6)
  {
    -[SAFrame instruction](v6, "instruction");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_24;
    v19 = (void *)v18;
    -[SAFrame instruction](v6, "instruction");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SAFrame instruction](self->_leafKernelFrame, "instruction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20 != v21)
    {
LABEL_24:
      v22 = self->_leafKernelFrame;
      if (v22)
      {
        v23 = v22;
        v69 = self;
        v70 = v6;
        v72 = a3;
        while (-[SAFrame isExclave](v23, "isExclave"))
        {
          if ((a3 & 0x20) != 0)
            goto LABEL_59;
          v25 = objc_getProperty(self, v24, 176, 1);
          v27 = v25;
          if (!v25
            || (v28 = objc_getProperty(v25, v26, 16, 1),
                v29 = objc_msgSend(v28, "count"),
                v28,
                !v29))
          {
            objc_msgSend(v7, "insertObject:atIndex:", v23, 0);
            goto LABEL_58;
          }
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v31 = objc_getProperty(v27, v30, 16, 1);
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
          if (!v32)
          {

LABEL_58:
            a3 = v72;
LABEL_59:
            parentFrame = v23->_parentFrame;
            goto LABEL_60;
          }
          v34 = v32;
          v71 = v27;
          v35 = *(_QWORD *)v74;
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v74 != v35)
                objc_enumerationMutation(v31);
              v37 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v36);
              if (v37)
                Property = objc_getProperty(*(id *)(*((_QWORD *)&v73 + 1) + 8 * v36), v33, 16, 1);
              else
                Property = 0;
              v39 = Property;

              if (v39)
              {
                if (v37)
                {
                  v40 = objc_getProperty(v37, v33, 16, 1);
                  if (v40)
                  {
                    v41 = v40;
                    do
                    {
                      objc_msgSend(v7, "insertObject:atIndex:", v41, 0);
                      v42 = (void *)v41[4];
                      v43 = v42;

                      v41 = v43;
                    }
                    while (v42);
                  }
                }
              }
              else
              {
                v45 = [SAExclaveFrame alloc];
                if (v37)
                  v46 = objc_getProperty(v37, v44, 8, 1);
                else
                  v46 = 0;
                v47 = v46;
                v48 = -[SAExclaveFrame initWithExclave:](v45, v47);

                if (v48)
                  v48[8] |= 8u;
                objc_msgSend(v7, "insertObject:atIndex:", v48, 0);

              }
              ++v36;
            }
            while (v36 != v34);
            v49 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
            v34 = v49;
          }
          while (v49);

          self = v69;
          v6 = v70;
          a3 = v72;
          if (v23)
            goto LABEL_59;
          parentFrame = 0;
LABEL_60:
          v51 = parentFrame;

          v23 = v51;
          if (!v51)
            goto LABEL_2;
        }
        objc_msgSend(v7, "insertObject:atIndex:", v23, 0);
        goto LABEL_59;
      }
    }
  }
LABEL_2:
  if ((a3 & 2) == 0)
  {
    if ((a3 & 8) != 0 && (a3 & 0x14) != 0)
    {
      v61 = *__error();
      _sa_logt();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v78 = a3;
        _os_log_error_impl(&dword_1B9BE0000, v62, OS_LOG_TYPE_ERROR, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", buf, 0xCu);
      }

      *__error() = v61;
      _SASetCrashLogMessage(1704, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", v63, v64, v65, v66, v67, v68, a3);
      _os_crash();
      __break(1u);
    }
    v8 = -[SAThreadState hasSwiftTask](self, "hasSwiftTask");
    v9 = 1;
    if ((a3 & 0x10) == 0 && v8)
      v9 = (self->_leafOfCRootFramesReplacedBySwiftAsync != 0) & (a3 >> 2);
    v10 = (a3 & 0x18) != 0 && v8;
    v11 = self;
    v12 = self->_leafUserFrame;
    if (v12)
    {
      v13 = v12;
      p_isa = 0;
      while (!-[SAFrame isSwiftAsync](v13, "isSwiftAsync"))
      {
        if (!v10)
          goto LABEL_18;
        v15 = v13;

        p_isa = (id *)&v15->super.isa;
LABEL_19:
        v16 = v13->_parentFrame;
        v17 = v16;

        v13 = v17;
        if (!v16)
          goto LABEL_64;
      }
      if ((v9 & 1) != 0)
      {

        goto LABEL_65;
      }
LABEL_18:
      objc_msgSend(v7, "insertObject:atIndex:", v13, 0);
      goto LABEL_19;
    }
    p_isa = 0;
LABEL_64:
    if ((v9 & 1) != 0)
    {
LABEL_65:
      v52 = v11->_leafOfCRootFramesReplacedBySwiftAsync;
      if (v52)
      {
        v53 = v52;
        do
        {
          objc_msgSend(v7, "insertObject:atIndex:", v53, 0);
          v54 = v53->_parentFrame;
          v55 = v54;

          v53 = v55;
        }
        while (v54);
      }
    }
    if (p_isa)
      v56 = v10;
    else
      v56 = 0;
    if (v56)
    {
      v57 = p_isa[4];
      v58 = (_BYTE *)objc_msgSend(p_isa, "copyWithNewParent:", v57);

      if (v58)
      {
        if (v9)
          v59 = 18;
        else
          v59 = 16;
        v58[8] = v59 | v58[8] & 0xED;
      }
      objc_msgSend(v7, "addObject:", v58);

    }
  }

  return v7;
}

- (id)stackWithBacktraceStyle:(unint64_t)a3
{
  return -[SAThreadState stackWithBacktraceStyle:ignoringKernelStackWithLeafFrame:](self, "stackWithBacktraceStyle:ignoringKernelStackWithLeafFrame:", a3, 0);
}

- (id)stack
{
  return -[SAThreadState stackWithBacktraceStyle:ignoringKernelStackWithLeafFrame:](self, "stackWithBacktraceStyle:ignoringKernelStackWithLeafFrame:", 0, 0);
}

- (BOOL)hasSameStackAs:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  char v6;
  uint64_t exclavesInfo;
  unint64_t v9;

  v4 = a3;
  v5 = v4;
  if (*(_OWORD *)&self->_leafUserFrame == *((_OWORD *)v4 + 4) && self->_leafKernelFrame == (SAFrame *)v4[10])
  {
    exclavesInfo = (uint64_t)self->_exclavesInfo;
    v9 = v5[22];
    v6 = (exclavesInfo | v9) == 0;
    if (exclavesInfo && v9)
      v6 = -[SAThreadExclavesInfo matchesStack:](exclavesInfo, (void *)v9);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)debugDescriptionWithThread:(id *)a1
{
  id *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(a2, "debugDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    WeakRetained = objc_loadWeakRetained(v2 + 15);
    if (WeakRetained)
    {
      v6 = objc_loadWeakRetained(v2 + 15);
      objc_msgSend(v6, "debugDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" (%@)"), v7);

    }
    v8 = objc_loadWeakRetained(v2 + 14);

    if (v8)
    {
      v9 = objc_loadWeakRetained(v2 + 14);
      objc_msgSend(v9, "debugDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" (%@)"), v10);

    }
    v11 = v2[6];
    if (v11 == v2[7])
    {
      objc_msgSend(v11, "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" at %@ sample index %lu"), v14, objc_msgSend(v2, "startSampleIndex"));
    }
    else
    {
      v12 = objc_msgSend(v2, "startSampleIndex");
      v13 = objc_msgSend(v2, "endSampleIndex");
      objc_msgSend(v2[6], "debugDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2[7], "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(" at sample indexes %lu-%lu\nstart:%@\n  end:%@"), v12, v13, v14, v15);

    }
    v2 = (id *)objc_msgSend(v4, "copy");

  }
  return v2;
}

- (NSString)debugDescription
{
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  SATimestamp *startTimestamp;
  SATimestamp *endTimestamp;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_msgSend(CFSTR("thread state"), "mutableCopy");
  WeakRetained = objc_loadWeakRetained((id *)&self->_swiftTask);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)&self->_swiftTask);
    objc_msgSend(v5, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%@)"), v6);

  }
  v7 = objc_loadWeakRetained((id *)&self->_dispatchQueue);

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_dispatchQueue);
    objc_msgSend(v8, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" (%@)"), v9);

  }
  startTimestamp = self->_startTimestamp;
  endTimestamp = self->_endTimestamp;
  v12 = -[SAThreadState startSampleIndex](self, "startSampleIndex");
  if (startTimestamp == endTimestamp)
  {
    -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" at sample index %lu\n%@"), v12, v14);
  }
  else
  {
    v13 = -[SAThreadState endSampleIndex](self, "endSampleIndex");
    -[SATimestamp debugDescription](self->_startTimestamp, "debugDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SATimestamp debugDescription](self->_endTimestamp, "debugDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" at sample indexes %lu-%lu\nstart:%@\n  end:%@"), v12, v13, v14, v15);

  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v16;
}

- (SAFrame)leafUserFrame
{
  return (SAFrame *)objc_getProperty(self, a2, 64, 1);
}

- (SAFrame)leafOfCRootFramesReplacedBySwiftAsync
{
  return (SAFrame *)objc_getProperty(self, a2, 72, 1);
}

- (SAFrame)leafKernelFrame
{
  return (SAFrame *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (SADispatchQueue)dispatchQueue
{
  return (SADispatchQueue *)objc_loadWeakRetained((id *)&self->_dispatchQueue);
}

- (SASwiftTask)swiftTask
{
  return (SASwiftTask *)objc_loadWeakRetained((id *)&self->_swiftTask);
}

- (unint64_t)voucherIdentifier
{
  return self->_voucherIdentifier;
}

- (int)originPid
{
  return self->_originPid;
}

- (int)proximatePid
{
  return self->_proximatePid;
}

- (unint64_t)userTimeInNs
{
  return self->_userTimeInNs;
}

- (unint64_t)systemTimeInNs
{
  return self->_systemTimeInNs;
}

- (unint64_t)instructions
{
  return self->_instructions;
}

- (unint64_t)cycles
{
  return self->_cycles;
}

- (unsigned)schedulerFlags
{
  return self->_schedulerFlags;
}

- (SATimestamp)timestampLastMadeRunnable
{
  return (SATimestamp *)objc_getProperty(self, a2, 168, 1);
}

- (unsigned)ioTier
{
  return self->_threadQosIpcOverride;
}

- (unsigned)threadQosIpcOverride
{
  return self->_threadQosSyncIpcOverride;
}

- (unsigned)threadQosSyncIpcOverride
{
  return *(&self->_threadQosSyncIpcOverride + 1);
}

- (BOOL)needsExclave
{
  return (*((unsigned __int8 *)self + 20) >> 6) & 1;
}

- (void)setNeedsExclave:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 20) = *((_BYTE *)self + 20) & 0xBF | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclavesInfo, 0);
  objc_storeStrong((id *)&self->_timestampLastMadeRunnable, 0);
  objc_destroyWeak((id *)&self->_swiftTask);
  objc_destroyWeak((id *)&self->_dispatchQueue);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_turnstileInfo, 0);
  objc_storeStrong((id *)&self->_waitInfo, 0);
  objc_storeStrong((id *)&self->_leafKernelFrame, 0);
  objc_storeStrong((id *)&self->_leafOfCRootFramesReplacedBySwiftAsync, 0);
  objc_storeStrong((id *)&self->_leafUserFrame, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("SAThreadState");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 199;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  id WeakRetained;
  id v14;
  char v15;
  int v17;
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
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAThreadState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v17 = *__error();
    _sa_logt();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[SAThreadState debugDescription](self, "debugDescription");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v29 = objc_msgSend(v19, "UTF8String");
      v30 = 2048;
      v31 = -[SAThreadState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v32 = 2048;
      v33 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v17;
    -[SAThreadState debugDescription](self, "debugDescription");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "UTF8String");
    -[SAThreadState sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(4393, "%s: size %lu != buffer length %lu", v22, v23, v24, v25, v26, v27, v21);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 2049;
  *(unint64_t *)((char *)&a3->var3 + 2) = -[SAThreadState startSampleIndex](self, "startSampleIndex");
  *(unint64_t *)((char *)&a3->var4 + 2) = -[SAThreadState endSampleIndex](self, "endSampleIndex");
  *(unint64_t *)((char *)&a3->var10 + 2) = self->_voucherIdentifier;
  *(unint64_t *)((char *)&a3->var11 + 2) = self->_userTimeInNs;
  *(unint64_t *)((char *)&a3->var12 + 2) = self->_systemTimeInNs;
  *(unint64_t *)((char *)&a3->var13 + 2) = self->_instructions;
  *(unint64_t *)((char *)&a3->var14 + 2) = self->_cycles;
  *(_DWORD *)((char *)&a3->var15 + 2) = -[SAThreadState basePriority](self, "basePriority");
  *(_DWORD *)((char *)&a3->var15 + 6) = -[SAThreadState scheduledPriority](self, "scheduledPriority");
  *(int *)((char *)&a3->var16 + 2) = self->_schedulerFlags;
  *((_BYTE *)&a3->var18 + 6) = *((_BYTE *)self + 11) & 7;
  *((_BYTE *)&a3->var18 + 7) = (*((_BYTE *)self + 11) >> 3) & 7;
  LOBYTE(a3->var19) = *((_BYTE *)self + 21) & 7;
  BYTE1(a3->var19) = (*((_BYTE *)self + 21) >> 3) & 7;
  WORD1(a3->var19) = 1799;
  BYTE4(a3->var19) = self->_threadQosIpcOverride;
  *(_DWORD *)((char *)&a3->var19 + 5) = self->_state;
  a3->var21 = -[SAThreadState microstackshotFlags](self, "microstackshotFlags");
  v9 = a3->var22 & 0xFE | (*((unsigned __int8 *)self + 11) >> 7);
  a3->var22 = v9;
  v10 = v9 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 11) >> 6) & 1));
  a3->var22 = v10;
  v11 = v10 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 15) >> 6) & 1));
  a3->var22 = v11;
  v12 = v11 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 15) >> 7) & 1));
  a3->var22 = v12;
  a3->var22 = v12 & 0xEF | (*((_BYTE *)self + 19) >> 2) & 0x10;
  *(_QWORD *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTimestamp, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTimestamp, v8);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_leafUserFrame, v8);
  *(unint64_t *)((char *)&a3->var30 + 7) = SASerializableIndexForPointerFromSerializationDictionary(self->_leafOfCRootFramesReplacedBySwiftAsync, v8);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_leafKernelFrame, v8);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_waitInfo, v8);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
  *(unint64_t *)((char *)&a3->var9 + 2) = SASerializableIndexForPointerFromSerializationDictionary(WeakRetained, v8);

  v14 = objc_loadWeakRetained((id *)&self->_swiftTask);
  *(_QWORD *)((char *)&a3->var29 + 7) = SASerializableIndexForPointerFromSerializationDictionary(v14, v8);

  *(_QWORD *)((char *)&a3->var17 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_timestampLastMadeRunnable, v8);
  *(_QWORD *)&a3->var24 = SASerializableIndexForPointerFromSerializationDictionary(self->_turnstileInfo, v8);
  *(_DWORD *)&a3->var28 = -[SAThreadState cpuNum](self, "cpuNum");
  a3->var29.var1 = ($A4FF59F43F4B20644E55A5E6B3BB4A05)-[SAThreadState cpuSpeedMhz](self, "cpuSpeedMhz");
  *((_BYTE *)&a3->var29 + 4) = -[SAThreadState threadQosKEventOverride](self, "threadQosKEventOverride");
  *((_BYTE *)&a3->var29 + 5) = -[SAThreadState threadQosWorkQueueOverride](self, "threadQosWorkQueueOverride");
  *((_BYTE *)&a3->var29 + 6) = -[SAThreadState threadQosWorkloopServicerOverride](self, "threadQosWorkloopServicerOverride");
  if (-[SAThreadState isPromotedAboveTask](self, "isPromotedAboveTask"))
    v15 = 32;
  else
    v15 = 0;
  a3->var22 = a3->var22 & 0xDF | v15;
  *(unsigned int *)((char *)&a3->var32 + 3) = -[SAThreadState originPid](self, "originPid");
  *(_DWORD *)(&a3->var35 + 1) = -[SAThreadState proximatePid](self, "proximatePid");
  *(_QWORD *)(&a3->var35 + 5) = SASerializableIndexForPointerFromSerializationDictionary(self->_exclavesInfo, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v8, self, v4);

  if (v5)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_startTimestamp, "addSelfToSerializationDictionary:", v8);
    -[SATimestamp addSelfToSerializationDictionary:](self->_endTimestamp, "addSelfToSerializationDictionary:", v8);
    -[SAFrame addSelfToSerializationDictionary:](self->_leafUserFrame, "addSelfToSerializationDictionary:", v8);
    -[SAFrame addSelfToSerializationDictionary:](self->_leafOfCRootFramesReplacedBySwiftAsync, "addSelfToSerializationDictionary:", v8);
    -[SAFrame addSelfToSerializationDictionary:](self->_leafKernelFrame, "addSelfToSerializationDictionary:", v8);
    -[SAWaitInfo addSelfToSerializationDictionary:](self->_waitInfo, "addSelfToSerializationDictionary:", v8);
    -[SATurnstileInfo addSelfToSerializationDictionary:](self->_turnstileInfo, "addSelfToSerializationDictionary:", v8);
    -[NSString addSelfToSerializationDictionary:](self->_name, "addSelfToSerializationDictionary:", v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
    objc_msgSend(WeakRetained, "addSelfToSerializationDictionary:", v8);

    v7 = objc_loadWeakRetained((id *)&self->_swiftTask);
    objc_msgSend(v7, "addSelfToSerializationDictionary:", v8);

    -[SATimestamp addSelfToSerializationDictionary:](self->_timestampLastMadeRunnable, "addSelfToSerializationDictionary:", v8);
    -[SAThreadExclavesInfo addSelfToSerializationDictionary:](self->_exclavesInfo, "addSelfToSerializationDictionary:", v8);
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAThreadState *v6;
  unsigned int v7;
  SAThreadStateMicrostackshot *v8;
  char v9;
  SAThreadState *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  char v16;
  char v17;
  char v18;
  int v19;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  _BYTE v70[22];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 9u)
    goto LABEL_46;
  if (a4 <= 0x93)
  {
    v21 = *__error();
    _sa_logt();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(_QWORD *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(_QWORD *)&v70[14] = 148;
      _os_log_error_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState struct %lu", v70, 0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(4489, "bufferLength %lu < serialized SAThreadState struct %lu", v23, v24, v25, v26, v27, v28, a4);
    _os_crash();
    __break(1u);
    goto LABEL_31;
  }
  if ((*((_BYTE *)a3 + 145) & 1) != 0)
  {
    if (*((unsigned __int8 *)a3 + 1) < 3u)
    {
      LOWORD(v7) = 0;
    }
    else
    {
      if (a4 <= 0xA3)
      {
LABEL_34:
        v37 = *__error();
        _sa_logt();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v70 = 134218240;
          *(_QWORD *)&v70[4] = a4;
          *(_WORD *)&v70[12] = 2048;
          *(_QWORD *)&v70[14] = 164;
          _os_log_error_impl(&dword_1B9BE0000, v38, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v70, 0x16u);
        }

        *__error() = v37;
        _SASetCrashLogMessage(4499, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v39, v40, v41, v42, v43, v44, a4);
        _os_crash();
        __break(1u);
LABEL_37:
        v45 = *__error();
        _sa_logt();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v70 = 134218240;
          *(_QWORD *)&v70[4] = a4;
          *(_WORD *)&v70[12] = 2048;
          *(_QWORD *)&v70[14] = 167;
          _os_log_error_impl(&dword_1B9BE0000, v46, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v4 struct %lu", v70, 0x16u);
        }

        *__error() = v45;
        _SASetCrashLogMessage(4551, "bufferLength %lu < serialized SAThreadState v4 struct %lu", v47, v48, v49, v50, v51, v52, a4);
        _os_crash();
        __break(1u);
        goto LABEL_40;
      }
      v7 = *((_DWORD *)a3 + 40) / 0x64u;
    }
    v8 = [SAThreadStateMicrostackshot alloc];
    if (v8)
    {
      v9 = *((_BYTE *)a3 + 145);
      *(_QWORD *)v70 = v8;
      *(_QWORD *)&v70[8] = SAThreadStateMicrostackshot;
      v10 = (SAThreadState *)objc_msgSendSuper2((objc_super *)v70, sel_init);
      v6 = v10;
      if (v10)
      {
        LOBYTE(v10[1].super.isa) = v9;
        WORD1(v10[1].super.isa) = v7;
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = objc_alloc_init(SAThreadState);
  }
  v11 = *(_QWORD *)((char *)a3 + 18);
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 != 0x7FFFFFFF && v11 != 0x7FFFFFFFFFFFFFFFLL)
    v12 = *(_QWORD *)((char *)a3 + 18);
  -[SAThreadState setStartSampleIndex:]((uint64_t)v6, v12);
  v13 = *(_QWORD *)((char *)a3 + 26);
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 != 0x7FFFFFFF && v13 != 0x7FFFFFFFFFFFFFFFLL)
    v14 = *(_QWORD *)((char *)a3 + 26);
  -[SAThreadState setEndSampleIndex:]((uint64_t)v6, v14);
  v6->_voucherIdentifier = *(_QWORD *)((char *)a3 + 74);
  v6->_userTimeInNs = *(_QWORD *)((char *)a3 + 82);
  v6->_systemTimeInNs = *(_QWORD *)((char *)a3 + 90);
  v6->_instructions = *(_QWORD *)((char *)a3 + 98);
  v6->_cycles = *(_QWORD *)((char *)a3 + 106);
  -[SAThreadState setBasePriority:]((int *)v6, *(_DWORD *)((char *)a3 + 114));
  -[SAThreadState setScheduledPriority:]((int *)v6, *(_DWORD *)((char *)a3 + 118));
  v6->_schedulerFlags = *(_DWORD *)((char *)a3 + 122);
  v15 = *((_BYTE *)v6 + 11) & 0xF8 | *((_BYTE *)a3 + 134) & 7;
  *((_BYTE *)v6 + 11) = v15;
  v16 = v15 & 0xC7 | (8 * (*((_BYTE *)a3 + 135) & 7));
  *((_BYTE *)v6 + 11) = v16;
  v17 = *((_BYTE *)v6 + 21) & 0xF8 | *((_BYTE *)a3 + 136) & 7;
  *((_BYTE *)v6 + 21) = v17;
  *((_BYTE *)v6 + 21) = (8 * (*((_BYTE *)a3 + 137) & 7)) | v17 & 0xC7;
  v6->_threadQosIpcOverride = *((_BYTE *)a3 + 140);
  v6->_state = *(_DWORD *)((char *)a3 + 141);
  v18 = v16 & 0x7F | (*((_BYTE *)a3 + 146) << 7);
  *((_BYTE *)v6 + 11) = v18;
  *((_BYTE *)v6 + 11) = (32 * *((_BYTE *)a3 + 146)) & 0x40 | v18 & 0xBF;
  v19 = *((_BYTE *)v6 + 15) & 0xBF | (((*((unsigned __int8 *)a3 + 146) >> 2) & 1) << 6);
  *((_BYTE *)v6 + 15) = v19;
  *((_BYTE *)v6 + 15) = v19 & 0x7F | (((*((_BYTE *)a3 + 146) & 8) != 0) << 7);
  *((_BYTE *)v6 + 19) = *((_BYTE *)v6 + 19) & 0xBF | (4 * *((_BYTE *)a3 + 146)) & 0x40;
  if (*((unsigned __int8 *)a3 + 1) < 3u)
    return v6;
  if (a4 <= 0xA3)
  {
LABEL_31:
    v29 = *__error();
    _sa_logt();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(_QWORD *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(_QWORD *)&v70[14] = 164;
      _os_log_error_impl(&dword_1B9BE0000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v70, 0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(4544, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
    goto LABEL_34;
  }
  -[SAThreadState setCpuNum:]((uint64_t)v6, *((_DWORD *)a3 + 39));
  if (*((unsigned __int8 *)a3 + 1) < 4u)
    return v6;
  if (a4 <= 0xA6)
    goto LABEL_37;
  -[SAThreadState setThreadQosKEventOverride:]((uint64_t)v6, *((unsigned __int8 *)a3 + 164));
  -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v6, *((unsigned __int8 *)a3 + 165));
  -[SAThreadState setThreadQosWorkloopServicerOverride:]((uint64_t)v6, *((unsigned __int8 *)a3 + 166));
  v6->_ioTier = v6->_ioTier & 0xF7 | (*((_BYTE *)a3 + 146) >> 2) & 8;
  if (*((unsigned __int8 *)a3 + 1) < 6u)
    return v6;
  if (a4 <= 0xBA)
  {
LABEL_40:
    v53 = *__error();
    _sa_logt();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(_QWORD *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(_QWORD *)&v70[14] = 187;
      _os_log_error_impl(&dword_1B9BE0000, v54, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v6 struct %lu", v70, 0x16u);
    }

    *__error() = v53;
    _SASetCrashLogMessage(4561, "bufferLength %lu < serialized SAThreadState v6 struct %lu", v55, v56, v57, v58, v59, v60, a4);
    _os_crash();
    __break(1u);
LABEL_43:
    v61 = *__error();
    _sa_logt();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(_QWORD *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(_QWORD *)&v70[14] = 191;
      _os_log_error_impl(&dword_1B9BE0000, v62, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v7 struct %lu", v70, 0x16u);
    }

    *__error() = v61;
    _SASetCrashLogMessage(4568, "bufferLength %lu < serialized SAThreadState v7 struct %lu", v63, v64, v65, v66, v67, v68, a4);
    _os_crash();
    __break(1u);
LABEL_46:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAThreadState version"), 0);
    v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v69);
  }
  v6->_originPid = *(_DWORD *)((char *)a3 + 183);
  if (*((unsigned __int8 *)a3 + 1) >= 7u)
  {
    if (a4 > 0xBE)
    {
      v6->_proximatePid = *(_DWORD *)((char *)a3 + 187);
      return v6;
    }
    goto LABEL_43;
  }
  return v6;
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
  unint64_t v20;
  void *v21;
  SAFrame *v22;
  SAFrame *leafUserFrame;
  unint64_t v24;
  void *v25;
  SAFrame *v26;
  SAFrame *leafKernelFrame;
  unint64_t v28;
  void *v29;
  SAWaitInfo *v30;
  SAWaitInfo *waitInfo;
  unint64_t v32;
  void *v33;
  NSString *v34;
  NSString *name;
  unint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  SATimestamp *v41;
  SATimestamp *timestampLastMadeRunnable;
  unint64_t v43;
  void *v44;
  SATurnstileInfo *v45;
  SATurnstileInfo *turnstileInfo;
  unint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  SAFrame *v52;
  SAFrame *leafOfCRootFramesReplacedBySwiftAsync;
  unint64_t v54;
  void *v55;
  SAThreadExclavesInfo *v56;
  SAThreadExclavesInfo *exclavesInfo;
  int v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  id v91;
  uint8_t buf[4];
  unint64_t v93;
  __int16 v94;
  uint64_t v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v91 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 9u)
    goto LABEL_23;
  if (a4 <= 0x93)
  {
    v58 = *__error();
    _sa_logt();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v93 = a4;
      v94 = 2048;
      v95 = 148;
      _os_log_error_impl(&dword_1B9BE0000, v59, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState struct %lu", buf, 0x16u);
    }

    *__error() = v58;
    _SASetCrashLogMessage(4581, "bufferLength %lu < serialized SAThreadState struct %lu", v60, v61, v62, v63, v64, v65, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    v66 = *__error();
    _sa_logt();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v93 = a4;
      v94 = 2048;
      v95 = 156;
      _os_log_error_impl(&dword_1B9BE0000, v67, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v2 struct %lu", buf, 0x16u);
    }

    *__error() = v66;
    _SASetCrashLogMessage(4598, "bufferLength %lu < serialized SAThreadState v2 struct %lu", v68, v69, v70, v71, v72, v73, a4);
    _os_crash();
    __break(1u);
    goto LABEL_17;
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 2);
  v13 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v91, v11, v13);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTimestamp = self->_startTimestamp;
  self->_startTimestamp = v14;

  v16 = *(_QWORD *)((char *)a3 + 10);
  v17 = (void *)objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v91, v11, v17);
  v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTimestamp = self->_endTimestamp;
  self->_endTimestamp = v18;

  v20 = *(_QWORD *)((char *)a3 + 34);
  v21 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v20, v91, v11, v21, 0);
  v22 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafUserFrame = self->_leafUserFrame;
  self->_leafUserFrame = v22;

  v24 = *(_QWORD *)((char *)a3 + 42);
  v25 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v91, v11, v25, 0);
  v26 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafKernelFrame = self->_leafKernelFrame;
  self->_leafKernelFrame = v26;

  v28 = *(_QWORD *)((char *)a3 + 50);
  v29 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v28, v91, v11, v29, 0);
  v30 = (SAWaitInfo *)objc_claimAutoreleasedReturnValue();
  waitInfo = self->_waitInfo;
  self->_waitInfo = v30;

  v32 = *(_QWORD *)((char *)a3 + 58);
  v33 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v32, v91, v11, v33, 0);
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v34;

  v36 = *(_QWORD *)((char *)a3 + 66);
  v37 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v36, v91, v11, v37, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_dispatchQueue, v38);

  v39 = *(_QWORD *)((char *)a3 + 126);
  v40 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v39, v91, v11, v40, 0);
  v41 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestampLastMadeRunnable = self->_timestampLastMadeRunnable;
  self->_timestampLastMadeRunnable = v41;

  if (*((unsigned __int8 *)a3 + 1) < 2u)
    goto LABEL_10;
  if (a4 <= 0x9B)
    goto LABEL_14;
  v43 = *(_QWORD *)((char *)a3 + 148);
  v44 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v43, v91, v11, v44, 0);
  v45 = (SATurnstileInfo *)objc_claimAutoreleasedReturnValue();
  turnstileInfo = self->_turnstileInfo;
  self->_turnstileInfo = v45;

  if (*((unsigned __int8 *)a3 + 1) < 5u)
    goto LABEL_10;
  if (a4 <= 0xB6)
  {
LABEL_17:
    v74 = *__error();
    _sa_logt();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v93 = a4;
      v94 = 2048;
      v95 = 183;
      _os_log_error_impl(&dword_1B9BE0000, v75, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v5 struct %lu", buf, 0x16u);
    }

    *__error() = v74;
    _SASetCrashLogMessage(4604, "bufferLength %lu < serialized SAThreadState v5 struct %lu", v76, v77, v78, v79, v80, v81, a4);
    _os_crash();
    __break(1u);
LABEL_20:
    v82 = *__error();
    _sa_logt();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v93 = a4;
      v94 = 2048;
      v95 = 199;
      _os_log_error_impl(&dword_1B9BE0000, v83, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v8 struct %lu", buf, 0x16u);
    }

    *__error() = v82;
    _SASetCrashLogMessage(4612, "bufferLength %lu < serialized SAThreadState v8 struct %lu", v84, v85, v86, v87, v88, v89, a4);
    _os_crash();
    __break(1u);
LABEL_23:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAThreadState version"), 0);
    v90 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v90);
  }
  v47 = *(_QWORD *)((char *)a3 + 167);
  v48 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v47, v91, v11, v48, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_swiftTask, v49);

  v50 = *(_QWORD *)((char *)a3 + 175);
  v51 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v50, v91, v11, v51, 0);
  v52 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafOfCRootFramesReplacedBySwiftAsync = self->_leafOfCRootFramesReplacedBySwiftAsync;
  self->_leafOfCRootFramesReplacedBySwiftAsync = v52;

  if (*((unsigned __int8 *)a3 + 1) >= 8u)
  {
    if (a4 > 0xC6)
    {
      v54 = *(_QWORD *)((char *)a3 + 191);
      v55 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v54, v91, v11, v55, 0);
      v56 = (SAThreadExclavesInfo *)objc_claimAutoreleasedReturnValue();
      exclavesInfo = self->_exclavesInfo;
      self->_exclavesInfo = v56;

      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_10:

}

+ (id)stateWithoutReferencesFromPAStyleSerializedThread:(uint64_t)a1
{
  SAThreadState *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  char v12;
  char v13;

  objc_opt_self();
  v3 = objc_alloc_init(SAThreadState);
  v4 = (uint64_t)v3;
  if (v3)
  {
    *((_BYTE *)v3 + 22) |= 0x3Fu;
    v3->_ioTier = v3->_ioTier & 0xF0 | 7;
  }
  v5 = *(_QWORD *)a2;
  if (*(_QWORD *)a2 > 0x11235818uLL)
  {
    v3->_voucherIdentifier = *(_QWORD *)(a2 + 56);
    v3->_userTimeInNs = *(_QWORD *)(a2 + 64);
    v3->_systemTimeInNs = *(_QWORD *)(a2 + 72);
    v3->_instructions = *(_QWORD *)(a2 + 80);
    v3->_cycles = *(_QWORD *)(a2 + 88);
    v3->_state = *(_DWORD *)(a2 + 96);
    -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 104));
    -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 106));
    *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 100);
    *(_BYTE *)(v4 + 24) = *(_BYTE *)(a2 + 114);
    -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 108));
    -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 109));
    -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 110));
    -[SAThreadState setThreadQosPromote:](v4, *(unsigned __int8 *)(a2 + 111));
    v6 = *(_QWORD *)(a2 + 115);
    if ((v6 & 1) != 0)
    {
      *(_BYTE *)(v4 + 11) |= 0x40u;
      v6 = *(_QWORD *)(a2 + 115);
      if ((v6 & 2) == 0)
      {
LABEL_6:
        if ((v6 & 4) == 0)
          goto LABEL_7;
        goto LABEL_17;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_6;
    }
    *(_BYTE *)(v4 + 11) |= 0x80u;
    v6 = *(_QWORD *)(a2 + 115);
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0)
        goto LABEL_38;
LABEL_18:
      *(_BYTE *)(v4 + 15) |= 0x80u;
      v6 = *(_QWORD *)(a2 + 115);
      goto LABEL_38;
    }
LABEL_17:
    *(_BYTE *)(v4 + 15) |= 0x40u;
    v6 = *(_QWORD *)(a2 + 115);
    if ((v6 & 0x10) == 0)
      goto LABEL_38;
    goto LABEL_18;
  }
  if (*(_QWORD *)a2 == 287528984)
  {
    v3->_voucherIdentifier = *(_QWORD *)(a2 + 56);
    v3->_userTimeInNs = *(_QWORD *)(a2 + 64);
    v3->_systemTimeInNs = *(_QWORD *)(a2 + 72);
    v3->_state = *(_DWORD *)(a2 + 80);
    -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 88));
    -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 90));
    *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 84);
    *(_BYTE *)(v4 + 24) = *(_BYTE *)(a2 + 98);
    -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 92));
    -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 93));
    -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 94));
    -[SAThreadState setThreadQosPromote:](v4, *(unsigned __int8 *)(a2 + 95));
    v6 = *(_QWORD *)(a2 + 99);
    if ((v6 & 1) != 0)
    {
      *(_BYTE *)(v4 + 11) |= 0x40u;
      v6 = *(_QWORD *)(a2 + 99);
      if ((v6 & 2) == 0)
      {
LABEL_12:
        if ((v6 & 4) == 0)
          goto LABEL_13;
        goto LABEL_27;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_12;
    }
    *(_BYTE *)(v4 + 11) |= 0x80u;
    v6 = *(_QWORD *)(a2 + 99);
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0)
        goto LABEL_38;
LABEL_28:
      *(_BYTE *)(v4 + 15) |= 0x80u;
      v6 = *(_QWORD *)(a2 + 99);
      goto LABEL_38;
    }
LABEL_27:
    *(_BYTE *)(v4 + 15) |= 0x40u;
    v6 = *(_QWORD *)(a2 + 99);
    if ((v6 & 0x10) == 0)
      goto LABEL_38;
    goto LABEL_28;
  }
  if (v5 <= 0x11235816)
  {
    switch(v5)
    {
      case 0x11235813uLL:
        v3->_voucherIdentifier = 0;
        v3->_userTimeInNs = *(_QWORD *)(a2 + 40);
        v3->_systemTimeInNs = *(_QWORD *)(a2 + 48);
        v3->_state = *(_DWORD *)(a2 + 64);
        -[SAThreadState setBasePriority:]((int *)v3, *(_DWORD *)(a2 + 68));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(_DWORD *)(a2 + 72));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 76);
        *(_BYTE *)(v4 + 24) = *(_BYTE *)(a2 + 84);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 80));
        v7 = *(_BYTE *)(v4 + 11);
        v8 = v7 | 0x38;
        *(_BYTE *)(v4 + 11) = v7 | 0x38;
        *(_BYTE *)(v4 + 21) |= 0x3Fu;
        v9 = *(_BYTE *)(a2 + 86);
        if ((v9 & 0x40) != 0)
        {
          v8 = v7 | 0x78;
          *(_BYTE *)(v4 + 11) = v7 | 0x78;
          v9 = *(_BYTE *)(a2 + 86);
          if ((v9 & 0x20) == 0)
          {
LABEL_32:
            if ((v9 & 0x10) != 0)
              goto LABEL_61;
            return (id)v4;
          }
        }
        else if ((*(_BYTE *)(a2 + 86) & 0x20) == 0)
        {
          goto LABEL_32;
        }
        *(_BYTE *)(v4 + 11) = v8 | 0x80;
        if ((*(_BYTE *)(a2 + 86) & 0x10) != 0)
          goto LABEL_61;
        return (id)v4;
      case 0x11235814uLL:
        v3->_voucherIdentifier = 0;
        v3->_userTimeInNs = *(_QWORD *)(a2 + 40);
        v3->_systemTimeInNs = *(_QWORD *)(a2 + 48);
        v3->_state = *(_DWORD *)(a2 + 64);
        -[SAThreadState setBasePriority:]((int *)v3, *(_DWORD *)(a2 + 68));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(_DWORD *)(a2 + 72));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 76);
        *(_BYTE *)(v4 + 24) = *(_BYTE *)(a2 + 84);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 80));
        -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 81));
        -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 82));
        *(_BYTE *)(v4 + 21) |= 0x38u;
        v12 = *(_BYTE *)(a2 + 86);
        if ((v12 & 0x40) != 0)
        {
          *(_BYTE *)(v4 + 11) |= 0x40u;
          v12 = *(_BYTE *)(a2 + 86);
        }
        if ((v12 & 0x20) != 0)
        {
          *(_BYTE *)(v4 + 11) |= 0x80u;
          v12 = *(_BYTE *)(a2 + 86);
        }
        if ((v12 & 0x10) != 0)
          goto LABEL_61;
        return (id)v4;
      case 0x11235815uLL:
        v3->_voucherIdentifier = *(_QWORD *)(a2 + 40);
        v3->_userTimeInNs = *(_QWORD *)(a2 + 48);
        v3->_systemTimeInNs = *(_QWORD *)(a2 + 56);
        v3->_state = *(_DWORD *)(a2 + 64);
        -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 72));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 74));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 68);
        *(_BYTE *)(v4 + 24) = *(_BYTE *)(a2 + 79);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 76));
        -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 77));
        -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 78));
        *(_BYTE *)(v4 + 21) |= 0x38u;
        v13 = *(_BYTE *)(a2 + 80);
        if ((v13 & 1) != 0)
        {
          *(_BYTE *)(v4 + 11) |= 0x40u;
          v13 = *(_BYTE *)(a2 + 80);
        }
        if ((v13 & 2) != 0)
        {
          *(_BYTE *)(v4 + 11) |= 0x80u;
          v13 = *(_BYTE *)(a2 + 80);
        }
        if ((v13 & 4) != 0)
        {
LABEL_61:
          v10 = 15;
          goto LABEL_40;
        }
        return (id)v4;
      case 0x11235816uLL:
        v3->_voucherIdentifier = *(_QWORD *)(a2 + 48);
        v3->_userTimeInNs = *(_QWORD *)(a2 + 56);
        v3->_systemTimeInNs = *(_QWORD *)(a2 + 64);
        v3->_state = *(_DWORD *)(a2 + 72);
        -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 80));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 82));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 76);
        *(_BYTE *)(v4 + 24) = *(_BYTE *)(a2 + 87);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 84));
        -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 85));
        -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 86));
        *(_BYTE *)(v4 + 21) |= 0x38u;
        v6 = *(_QWORD *)(a2 + 88);
        if ((v6 & 1) != 0)
        {
          *(_BYTE *)(v4 + 11) |= 0x40u;
          v6 = *(_QWORD *)(a2 + 88);
          if ((v6 & 2) == 0)
          {
LABEL_56:
            if ((v6 & 4) == 0)
              goto LABEL_57;
            goto LABEL_64;
          }
        }
        else if ((v6 & 2) == 0)
        {
          goto LABEL_56;
        }
        *(_BYTE *)(v4 + 11) |= 0x80u;
        v6 = *(_QWORD *)(a2 + 88);
        if ((v6 & 4) == 0)
        {
LABEL_57:
          if ((v6 & 0x10) == 0)
            goto LABEL_38;
LABEL_65:
          *(_BYTE *)(v4 + 15) |= 0x80u;
          v6 = *(_QWORD *)(a2 + 88);
          goto LABEL_38;
        }
LABEL_64:
        *(_BYTE *)(v4 + 15) |= 0x40u;
        v6 = *(_QWORD *)(a2 + 88);
        if ((v6 & 0x10) == 0)
          goto LABEL_38;
        goto LABEL_65;
      default:
        return (id)v4;
    }
  }
  v3->_voucherIdentifier = *(_QWORD *)(a2 + 56);
  v3->_userTimeInNs = *(_QWORD *)(a2 + 64);
  v3->_systemTimeInNs = *(_QWORD *)(a2 + 72);
  v3->_state = *(_DWORD *)(a2 + 80);
  -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 88));
  -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 90));
  *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 84);
  *(_BYTE *)(v4 + 24) = *(_BYTE *)(a2 + 95);
  -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 92));
  -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 93));
  -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 94));
  *(_BYTE *)(v4 + 21) |= 0x38u;
  v6 = *(_QWORD *)(a2 + 96);
  if ((v6 & 1) != 0)
  {
    *(_BYTE *)(v4 + 11) |= 0x40u;
    v6 = *(_QWORD *)(a2 + 96);
    if ((v6 & 2) == 0)
    {
LABEL_22:
      if ((v6 & 4) == 0)
        goto LABEL_23;
LABEL_36:
      *(_BYTE *)(v4 + 15) |= 0x40u;
      v6 = *(_QWORD *)(a2 + 96);
      if ((v6 & 0x10) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_22;
  }
  *(_BYTE *)(v4 + 11) |= 0x80u;
  v6 = *(_QWORD *)(a2 + 96);
  if ((v6 & 4) != 0)
    goto LABEL_36;
LABEL_23:
  if ((v6 & 0x10) != 0)
  {
LABEL_37:
    *(_BYTE *)(v4 + 15) |= 0x80u;
    v6 = *(_QWORD *)(a2 + 96);
  }
LABEL_38:
  if ((v6 & 0x20) != 0)
  {
    v10 = 19;
LABEL_40:
    *(_BYTE *)(v4 + v10) |= 0x40u;
  }
  return (id)v4;
}

- (void)populateReferencesUsingPAStyleSerializedThread:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  id Property;
  unint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  id v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  const char *v49;
  id v50;
  const char *v51;
  id v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  id v60;
  id v61;

  v61 = a3;
  v7 = a4;
  if (a1)
  {
    v8 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    if (*a2 <= 0x11235816uLL)
    {
      if (*a2 != 287528982)
      {
        v46 = a2[1];
        if (v46 >= 0xFFFFFFFFFFFFFFFELL)
        {
          v59 = CFSTR("Bad leaf frame index");
        }
        else
        {
          v47 = (void *)objc_opt_class();
          _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v46, v61, v7, v47, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            v13 = v48;
            v50 = objc_getProperty(v48, v49, 8, 1);

            if (!v50)
            {
              v52 = objc_getProperty(v13, v51, 8, 1);
              v53 = *(void **)(a1 + 64);
              *(_QWORD *)(a1 + 64) = v52;

              v54 = *(void **)(a1 + 80);
              *(_QWORD *)(a1 + 80) = 0;

              if (*a2 <= 0x11235814uLL)
              {
                v58 = *(void **)(a1 + 104);
                *(_QWORD *)(a1 + 104) = 0;
              }
              else
              {
                v55 = a2[2];
                if (v55 == -2)
                {
LABEL_33:
                  v59 = CFSTR("Bad thread name index");
                  goto LABEL_44;
                }
                v56 = (void *)objc_opt_class();
                _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v55, v61, v7, v56, 0);
                v57 = objc_claimAutoreleasedReturnValue();
                v58 = *(void **)(a1 + 104);
                *(_QWORD *)(a1 + 104) = v57;
              }

              v19 = *(void **)(a1 + 88);
              *(_QWORD *)(a1 + 88) = 0;
              goto LABEL_31;
            }
          }
          v59 = CFSTR("nil leaf frame");
        }
LABEL_44:
        +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v59, 0);
        v60 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v60);
      }
      v31 = a2[1];
      if (v31 != -2)
      {
        v32 = (void *)objc_opt_class();
        _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v61, v7, v32, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v33;
        if (v33)
          Property = objc_getProperty(v33, v34, 8, 1);
        else
          Property = 0;
        objc_storeStrong((id *)(a1 + 64), Property);
        v36 = a2[2];
        if (v36 != -2)
        {
          v37 = (void *)objc_opt_class();
          _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v36, v61, v7, v37, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v38;
          if (v38)
            v40 = objc_getProperty(v38, v39, 8, 1);
          else
            v40 = 0;
          objc_storeStrong((id *)(a1 + 80), v40);
          v41 = a2[3];
          if (v41 != -2)
          {
            v42 = (void *)objc_opt_class();
            _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v41, v61, v7, v42, 0);
            v43 = objc_claimAutoreleasedReturnValue();
            v44 = *(void **)(a1 + 104);
            *(_QWORD *)(a1 + 104) = v43;

            v45 = *(void **)(a1 + 88);
            *(_QWORD *)(a1 + 88) = 0;

            goto LABEL_31;
          }
          goto LABEL_33;
        }
        goto LABEL_35;
      }
    }
    else
    {
      v9 = a2[1];
      if (v9 != -2)
      {
        v10 = (void *)objc_opt_class();
        _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v9, v61, v7, v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v11;
        if (v11)
          v14 = objc_getProperty(v11, v12, 8, 1);
        else
          v14 = 0;
        objc_storeStrong((id *)(a1 + 64), v14);
        v15 = a2[2];
        if (v15 != -2)
        {
          v16 = (void *)objc_opt_class();
          _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v61, v7, v16, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v17;
          if (v17)
            v20 = objc_getProperty(v17, v18, 8, 1);
          else
            v20 = 0;
          objc_storeStrong((id *)(a1 + 80), v20);
          v21 = a2[3];
          if (v21 != -2)
          {
            v22 = (void *)objc_opt_class();
            _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v21, v61, v7, v22, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v23;
            if (v23)
              v26 = objc_getProperty(v23, v24, 8, 1);
            else
              v26 = 0;
            objc_storeStrong((id *)(a1 + 88), v26);
            v27 = a2[4];
            if (v27 != -2)
            {
              v28 = (void *)objc_opt_class();
              _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v27, v61, v7, v28, 0);
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = *(void **)(a1 + 104);
              *(_QWORD *)(a1 + 104) = v29;

LABEL_31:
              goto LABEL_32;
            }
            goto LABEL_33;
          }
          v59 = CFSTR("Bad wait info index");
          goto LABEL_44;
        }
LABEL_35:
        v59 = CFSTR("Bad leaf kernel frame index");
        goto LABEL_44;
      }
    }
    v59 = CFSTR("Bad leaf user frame index");
    goto LABEL_44;
  }
LABEL_32:

}

- (void)applyPAStyleSampleTimestamp:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    if (!*(_QWORD *)(a1 + 48))
      objc_storeStrong((id *)(a1 + 48), a2);
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

@end
