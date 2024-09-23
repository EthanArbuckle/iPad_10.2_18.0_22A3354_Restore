@implementation PLTimedPerfCheck

- (PLTimedPerfCheck)init
{
  PLTimedPerfCheck *v2;
  PLTimedPerfCheck *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLTimedPerfCheck;
  v2 = -[PLTimedPerfCheck init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isSessionCompleted = 0;
    v2->_sessionCompletedLock._os_unfair_lock_opaque = 0;
    -[PLTimedPerfCheck setup](v2, "setup");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pc_session_destroy();
  self->_pc_session = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLTimedPerfCheck;
  -[PLTimedPerfCheck dealloc](&v3, sel_dealloc);
}

- (void)setup
{
  pc_session *v3;
  int v4;
  int v5;
  uint8_t buf[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (pc_session *)pc_session_create();
  self->_pc_session = v3;
  if (v3)
  {
    getpid();
    pc_session_set_procpid();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    pc_session_add_metric();
    v4 = pc_session_begin();
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = strerror(v5);
        _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to begin performance check session: %s", buf, 0xCu);
      }
      pc_session_destroy();
      self->_pc_session = 0;
    }
    else
    {
      pc_session_get_value();
      pc_session_get_value();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = strerror(0);
    _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create performance check session: %s", buf, 0xCu);
  }
}

- (id)endSessionAndReturnPerfCheckExtraInformation
{
  os_unfair_lock_s *p_sessionCompletedLock;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[16];
  _QWORD v18[7];
  _QWORD v19[9];

  v19[7] = *MEMORY[0x1E0C80C00];
  p_sessionCompletedLock = &self->_sessionCompletedLock;
  os_unfair_lock_lock(&self->_sessionCompletedLock);
  if (self->_isSessionCompleted)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_3:
      v4 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x1E0C81028];
    v8 = "End performance check session called multiple times";
LABEL_15:
    _os_log_error_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
    goto LABEL_3;
  }
  if (!self->_pc_session)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_WORD *)buf = 0;
    v7 = MEMORY[0x1E0C81028];
    v8 = "End performance check session called with invalid session token";
    goto LABEL_15;
  }
  v5 = pc_session_end();
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = strerror(v6);
      _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to end performance check session: %s", buf, 0xCu);
    }
    v4 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    pc_session_get_value();
    v18[0] = CFSTR("processMemoryPeakKiloBytesInitial");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_initialProcessMemoryPeak);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v18[1] = CFSTR("processMemoryPeakKiloBytesAfterRequest");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v18[2] = CFSTR("processMemoryCurrentKiloBytesInitial");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_initialProcessMemoryCurrent);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v11;
    v18[3] = CFSTR("processMemoryCurrentKiloBytesAfterRequest");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v12;
    v18[4] = CFSTR("cpuTimeMilliSeconds");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / 1000000.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v13;
    v18[5] = CFSTR("cpuMillionInstructions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / 1000000.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[5] = v14;
    v18[6] = CFSTR("storageDirtied");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[6] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  self->_isSessionCompleted = 1;
LABEL_13:
  os_unfair_lock_unlock(p_sessionCompletedLock);
  return v4;
}

- (id)perfCheckLogStringWithPerfCheckInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double v23;
  __CFString *v24;
  void *v26;
  void *v27;

  v4 = a3;
  if (v4 || (-[PLTimedPerfCheck stop](self, "stop"), (v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[PLTimedPerfCheck perfUnitsFromPerfCheckInfo:](self, "perfUnitsFromPerfCheckInfo:", v4);
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processMemoryPeakKiloBytesInitial"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v6 = v5 * 0.0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processMemoryPeakKiloBytesAfterRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8 * 0.0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processMemoryCurrentKiloBytesInitial"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11 * 0.0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processMemoryCurrentKiloBytesAfterRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14 * 0.0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuTimeMilliSeconds"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17 * 0.0;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cpuMillionInstructions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storageDirtied"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v26, "stringWithFormat:", CFSTR(", dirty memory before/after peak:[%.1f %s/%.1f %s], current:[%.1f %s/%.1f %s], CPU time %.2f%s, instructions %.3fM, dirty storage %.1f %s"), *(_QWORD *)&v6, 0, *(_QWORD *)&v9, 0, *(_QWORD *)&v12, 0, *(_QWORD *)&v15, 0, *(_QWORD *)&v18, 0, v21, v23 * 0.0, 0);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = CFSTR(" (error getting perf check info)");
  }
  return v24;
}

- (PLUnitMultiplier)perfUnitsFromPerfCheckInfo:(SEL)a3
{
  double *v5;
  char **v6;
  double *v7;
  char **v8;
  char **var1;
  id v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  PLUnitMultiplier *result;

  *retstr = *(PLUnitMultiplier *)byte_1E376BAF0;
  v5 = &retstr->var0[4];
  v6 = &retstr->var1[4];
  v7 = &retstr->var0[2];
  v8 = &retstr->var1[2];
  var1 = retstr->var1;
  v10 = a4;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("processMemoryPeakKiloBytesInitial"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  PLUpdateSizeUnit(retstr->var0, var1, v12);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("processMemoryPeakKiloBytesAfterRequest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  PLUpdateSizeUnit(&retstr->var0[1], &retstr->var1[1], v14);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("processMemoryCurrentKiloBytesInitial"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  PLUpdateSizeUnit(v7, v8, v16);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("processMemoryCurrentKiloBytesAfterRequest"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  PLUpdateSizeUnit(&retstr->var0[3], &retstr->var1[3], v18);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("storageDirtied"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  PLUpdateSizeUnit(v5, v6, v20);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cpuTimeMilliSeconds"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  if (v23 > 1000.0)
  {
    retstr->var0[5] = 0.001;
    retstr->var1[5] = "s";
  }
  return result;
}

+ (id)start
{
  return objc_alloc_init(PLTimedPerfCheck);
}

@end
