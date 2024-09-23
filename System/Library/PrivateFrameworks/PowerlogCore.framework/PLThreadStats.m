@implementation PLThreadStats

- (PLThreadStats)initWithTimeFilter:(double)a3 withPercentFilter:(unint64_t)a4 withProcessThreadMapping:(id)a5 withError:(id *)a6
{
  id v10;
  PLThreadStats *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  PLThreadStats *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PLThreadStats;
  v11 = -[PLThreadStats init](&v21, sel_init);
  if (!v11)
    goto LABEL_13;
  objc_opt_self();
  if (a3 >= 0.0)
  {
    -[PLThreadStats setAbsoluteTimeFilter:](v11, "setAbsoluteTimeFilter:", a3);
    objc_opt_self();
    if (a4 >= 0x65)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = 2;
      goto LABEL_9;
    }
    -[PLThreadStats setPercentTimeFilter:](v11, "setPercentTimeFilter:", a4);
    if (!v10)
    {
      -[PLThreadStats setProcessThreadMap:](v11, "setProcessThreadMap:", 0);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __89__PLThreadStats_initWithTimeFilter_withPercentFilter_withProcessThreadMapping_withError___block_invoke;
    v19[3] = &unk_1E6A55990;
    v15 = v14;
    v20 = v15;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);
    if (objc_msgSend(v15, "count"))
    {
      -[PLThreadStats setProcessThreadMap:](v11, "setProcessThreadMap:", v15);

LABEL_11:
      -[PLThreadStats generateSnapshot](v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLThreadStats setCurrentSnapshot:](v11, "setCurrentSnapshot:", v17);

      v16 = v11;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PLThreadStatsErrorDomain"), 3, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = 1;
LABEL_9:
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PLThreadStatsErrorDomain"), v13, 0);
  v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v16;
}

void __89__PLThreadStats_initWithTimeFilter_withPercentFilter_withProcessThreadMapping_withError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a2;
  objc_msgSend(v5, "setWithArray:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (id)generateSnapshot
{
  id v1;
  void *v2;
  NSObject *v3;
  unint64_t v4;
  unsigned int *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLProcessInfo *v14;
  NSObject *v15;
  _QWORD v17[2];
  uint8_t v18[16];
  uint8_t buf[8];
  uint64_t v20;

  v1 = a1;
  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)objc_opt_new();
    PLLogThreadStats();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_INFO, "started snapshot generation", buf, 2u);
    }

    v4 = +[PLUtilities maxProcessCount](PLUtilities, "maxProcessCount");
    v17[1] = v17;
    v5 = (unsigned int *)((char *)v17 - ((4 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v5, 4 * v4);
    v6 = proc_listpids(1u, 0, 0, 0);
    proc_listpids(1u, 0, v5, 4 * v4);
    if ((unint64_t)v6 >> 2 >= v4)
      v7 = v4;
    else
      v7 = (unint64_t)v6 >> 2;
    for (; v7; --v7)
    {
      v9 = *v5++;
      v8 = v9;
      +[PLUtilities fullProcessNameForPid:](PLUtilities, "fullProcessNameForPid:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "shouldGatherStatsForProcessName:", v10))
      {
        objc_msgSend(v1, "processThreadMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLThreadStats threadStatsForPid:withThreads:]((uint64_t)v1, v8, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count"))
        {
          v14 = -[PLProcessInfo initWithName:andID:]([PLProcessInfo alloc], "initWithName:andID:", v10, v8);
          -[PLProcessInfo setThreadNameToInfo:](v14, "setThreadNameToInfo:", v13);
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, v10);

        }
      }

    }
    PLLogThreadStats();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1B6AB6000, v15, OS_LOG_TYPE_INFO, "finished snapshot generation", v18, 2u);
    }

    v1 = (id)objc_msgSend(v2, "copy");
  }
  return v1;
}

- (id)diffSinceLastSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLThreadStats generateSnapshot](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLThreadStats currentSnapshot](self, "currentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLThreadStats diffSnapshotWithNew:andOld:](self, "diffSnapshotWithNew:andOld:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLThreadStats setCurrentSnapshot:](self, "setCurrentSnapshot:", v3);
  -[PLThreadStats filterDiff:](self, "filterDiff:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diffSnapshotWithNew:(id)a3 andOld:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __44__PLThreadStats_diffSnapshotWithNew_andOld___block_invoke;
  v15 = &unk_1E6A55C58;
  v16 = v5;
  v17 = v7;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v12);

  v10 = (void *)objc_msgSend(v8, "copy", v12, v13, v14, v15);
  return v10;
}

void __44__PLThreadStats_diffSnapshotWithNew_andOld___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "diffSinceBaseline:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
}

- (id)filterDiff:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  PLThreadStats *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __28__PLThreadStats_filterDiff___block_invoke;
  v12 = &unk_1E6A55C58;
  v13 = self;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);

  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return v7;
}

void __28__PLThreadStats_filterDiff___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  PLProcessInfo *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[6];
  _QWORD v22[4];
  _QWORD v23[4];

  v5 = a2;
  v6 = a3;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  objc_msgSend(v6, "threadNameToInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __28__PLThreadStats_filterDiff___block_invoke_2;
  v21[3] = &unk_1E6A55C80;
  v21[4] = v23;
  v21[5] = v22;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v21);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadNameToInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14 = 3221225472;
  v15 = __28__PLThreadStats_filterDiff___block_invoke_3;
  v16 = &unk_1E6A55CA8;
  v17 = *(_QWORD *)(a1 + 32);
  v19 = v22;
  v20 = v23;
  v11 = v9;
  v18 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v13);

  if (objc_msgSend(v11, "count", v13, v14, v15, v16, v17))
  {
    v12 = -[PLProcessInfo initWithProcessInfo:]([PLProcessInfo alloc], "initWithProcessInfo:", v6);
    -[PLProcessInfo setThreadNameToInfo:](v12, "setThreadNameToInfo:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v5);

  }
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);

}

double __28__PLThreadStats_filterDiff___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double result;

  v4 = a3;
  objc_msgSend(v4, "userTime");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v4, "systemTime");
  v7 = v6;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v7 + *(double *)(v8 + 24);
  *(double *)(v8 + 24) = result;
  return result;
}

void __28__PLThreadStats_filterDiff___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeThread:withTotalSystemTime:withTotalUserTime:", v5, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)))objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)threadStatsForPid:(void *)a3 withThreads:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  PLThreadInfo *v19;
  PLThreadInfo *v20;
  void *v21;
  unsigned __int8 v23;
  _OWORD buffer[5];
  __int128 v25;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = objc_msgSend(v5, "count");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    memset(buffer, 0, sizeof(buffer));
    if (proc_pidinfo(a2, 4, 0, buffer, 96) == 96
      && (v9 = 8 * SDWORD1(v25), (v10 = malloc_type_malloc(v9, 0x3A3CA823uLL)) != 0))
    {
      v11 = v10;
      while (1)
      {
        v12 = proc_pidinfo(a2, 6, 0, v11, v9);
        if ((v12 & 0x80000000) != 0)
          break;
        if (v9 >= v12)
        {
          if (v12 >= 8)
          {
            v14 = v12 >> 3;
            v15 = (uint64_t *)v11;
            do
            {
              v17 = *v15++;
              v16 = v17;
              v23 = 0;
              +[PLThreadStats getThreadName:inProcess:isNamed:](PLThreadStats, "getThreadName:inProcess:isNamed:", v17, a2, &v23);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18 && (!v7 || objc_msgSend(v6, "containsObject:", v18)))
              {
                v19 = -[PLThreadInfo initWithThread:inProcess:]([PLThreadInfo alloc], "initWithThread:inProcess:", v16, a2);
                v20 = v19;
                if (v19)
                {
                  -[PLThreadInfo setThreadName:](v19, "setThreadName:", v18);
                  -[PLThreadInfo setIsNamed:](v20, "setIsNamed:", v23);
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v18);
                }

              }
              --v14;
            }
            while (v14);
          }
          break;
        }
        v9 += 512;
        v11 = reallocf(v11, v9);
        if (!v11)
          goto LABEL_20;
      }
      free(v11);
LABEL_20:
      v13 = (id)objc_msgSend(v8, "copy");
    }
    else
    {
      v13 = v8;
    }
    v21 = v13;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (BOOL)shouldGatherStatsForProcessName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[PLThreadStats processThreadMap](self, "processThreadMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PLThreadStats processThreadMap](self, "processThreadMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 != 0;

    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldIncludeThread:(id)a3 withTotalSystemTime:(double)a4 withTotalUserTime:(double)a5
{
  id v8;
  double v9;
  double v10;
  NSObject *v11;
  char v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  char v18;
  double v19;
  double v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  char v26;

  v8 = a3;
  if (-[PLThreadStats percentTimeFilter](self, "percentTimeFilter"))
  {
    if (a4 <= 0.0)
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "systemTime");
      v10 = v9 * 100.0 / a4;
      PLLogThreadStats();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLThreadStats shouldIncludeThread:withTotalSystemTime:withTotalUserTime:].cold.3(self);

      v12 = v10 >= (double)-[PLThreadStats percentTimeFilter](self, "percentTimeFilter");
    }
    if (a5 > 0.0)
    {
      objc_msgSend(v8, "userTime");
      v14 = v13 * 100.0 / a5;
      PLLogThreadStats();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLThreadStats shouldIncludeThread:withTotalSystemTime:withTotalUserTime:].cold.2(self);

      if (v14 >= (double)-[PLThreadStats percentTimeFilter](self, "percentTimeFilter"))
        v12 = 1;
    }
  }
  else
  {
    v12 = 1;
  }
  PLLogThreadStats();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[PLThreadStats shouldIncludeThread:withTotalSystemTime:withTotalUserTime:].cold.1(v12, v16);

  -[PLThreadStats absoluteTimeFilter](self, "absoluteTimeFilter");
  if (v17 == 0.0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v8, "systemTime");
    v20 = v19;
    -[PLThreadStats absoluteTimeFilter](self, "absoluteTimeFilter");
    v22 = v20 >= v21;
    objc_msgSend(v8, "userTime");
    v24 = v23;
    -[PLThreadStats absoluteTimeFilter](self, "absoluteTimeFilter");
    v18 = v24 >= v25 || v22;
  }
  v26 = v18 & v12;

  return v26;
}

+ (id)getThreadName:(unint64_t)a3 inProcess:(int)a4 isNamed:(BOOL *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _OWORD buffer[3];
  _OWORD v15[77];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *a5 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llx"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 < 1)
  {
    v12 = 0;
  }
  else
  {
    memset(v15, 0, 464);
    memset(buffer, 0, sizeof(buffer));
    if (proc_pidinfo(a4, 10, a3, buffer, 1288) <= 0 && (*__error() == 3 || *__error() == 22))
    {
      v12 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");
      v11 = v8;
      if (v10)
      {
        *a5 = 1;
        v11 = v9;
      }
      v12 = v11;

    }
  }

  return v12;
}

- (NSDictionary)processThreadMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProcessThreadMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)absoluteTimeFilter
{
  return self->_absoluteTimeFilter;
}

- (void)setAbsoluteTimeFilter:(double)a3
{
  self->_absoluteTimeFilter = a3;
}

- (unint64_t)percentTimeFilter
{
  return self->_percentTimeFilter;
}

- (void)setPercentTimeFilter:(unint64_t)a3
{
  self->_percentTimeFilter = a3;
}

- (NSDictionary)currentSnapshot
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentSnapshot:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_processThreadMap, 0);
}

- (void)shouldIncludeThread:(char)a1 withTotalSystemTime:(NSObject *)a2 withTotalUserTime:.cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "thread meets pct: %d", (uint8_t *)v2, 8u);
}

- (void)shouldIncludeThread:(void *)a1 withTotalSystemTime:withTotalUserTime:.cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "percentTimeFilter");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_14_0(&dword_1B6AB6000, v1, v2, "usr pct %f filter %zu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

- (void)shouldIncludeThread:(void *)a1 withTotalSystemTime:withTotalUserTime:.cold.3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "percentTimeFilter");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_14_0(&dword_1B6AB6000, v1, v2, "sys pct %f filter %zu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1_1();
}

@end
