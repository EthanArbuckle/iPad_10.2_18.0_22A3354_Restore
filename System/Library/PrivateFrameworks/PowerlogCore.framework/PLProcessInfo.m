@implementation PLProcessInfo

- (PLProcessInfo)initWithName:(id)a3 andID:(int)a4
{
  uint64_t v4;
  id v6;
  PLProcessInfo *v7;
  PLProcessInfo *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLProcessInfo;
  v7 = -[PLProcessInfo init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PLProcessInfo setProcessName:](v7, "setProcessName:", v6);
    -[PLProcessInfo setPid:](v8, "setPid:", v4);
    -[PLProcessInfo populateCPUTime](v8, "populateCPUTime");
  }

  return v8;
}

- (PLProcessInfo)initWithProcessInfo:(id)a3
{
  id v4;
  PLProcessInfo *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = objc_alloc_init(PLProcessInfo);
  objc_msgSend(v4, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLProcessInfo setProcessName:](v5, "setProcessName:", v6);

  -[PLProcessInfo setPid:](v5, "setPid:", objc_msgSend(v4, "pid"));
  objc_msgSend(v4, "totalUserTime");
  -[PLProcessInfo setTotalUserTime:](v5, "setTotalUserTime:");
  objc_msgSend(v4, "totalSystemTime");
  v8 = v7;

  -[PLProcessInfo setTotalSystemTime:](v5, "setTotalSystemTime:", v8);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLProcessInfo processName](self, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLProcessInfo pid](self, "pid");
  -[PLProcessInfo threadNameToInfo](self, "threadNameToInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%d), %lu threads"), v4, v5, objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)diffSinceBaseline:(id)a3
{
  id v4;
  PLProcessInfo *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  id v22;

  v4 = a3;
  v5 = -[PLProcessInfo initWithProcessInfo:]([PLProcessInfo alloc], "initWithProcessInfo:", self);
  -[PLProcessInfo totalUserTime](self, "totalUserTime");
  v7 = v6;
  objc_msgSend(v4, "totalUserTime");
  -[PLProcessInfo setTotalUserTime:](v5, "setTotalUserTime:", v7 - v8);
  -[PLProcessInfo totalSystemTime](self, "totalSystemTime");
  v10 = v9;
  objc_msgSend(v4, "totalSystemTime");
  -[PLProcessInfo setTotalSystemTime:](v5, "setTotalSystemTime:", v10 - v11);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLProcessInfo threadNameToInfo](self, "threadNameToInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __35__PLProcessInfo_diffSinceBaseline___block_invoke;
  v20 = &unk_1E6A55CD0;
  v21 = v4;
  v22 = v12;
  v14 = v12;
  v15 = v4;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v17);

  -[PLProcessInfo setThreadNameToInfo:](v5, "setThreadNameToInfo:", v14, v17, v18, v19, v20);
  return v5;
}

void __35__PLProcessInfo_diffSinceBaseline___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "threadNameToInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "diffSinceBaseline:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v7);
}

- (void)populateCPUTime
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  if (!proc_pid_rusage(-[PLProcessInfo pid](self, "pid", 0, 0), 5, (rusage_info_t *)&v3))
  {
    +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", (_QWORD)v4);
    -[PLProcessInfo setTotalUserTime:](self, "setTotalUserTime:");
    +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", *((_QWORD *)&v4 + 1));
    -[PLProcessInfo setTotalSystemTime:](self, "setTotalSystemTime:");
  }
}

- (BOOL)isEqualToProcessInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  BOOL v29;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_16;
  -[PLProcessInfo processName](self, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_16;
  v8 = -[PLProcessInfo pid](self, "pid");
  if (v8 != objc_msgSend(v4, "pid"))
    goto LABEL_16;
  -[PLProcessInfo totalUserTime](self, "totalUserTime");
  v10 = v9;
  objc_msgSend(v4, "totalUserTime");
  if (v10 != v11)
    goto LABEL_16;
  -[PLProcessInfo totalSystemTime](self, "totalSystemTime");
  v13 = v12;
  objc_msgSend(v4, "totalSystemTime");
  if (v13 != v14)
    goto LABEL_16;
  -[PLProcessInfo threadNameToInfo](self, "threadNameToInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  objc_msgSend(v4, "threadNameToInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v16 == v18)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[PLProcessInfo threadNameToInfo](self, "threadNameToInfo");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          -[PLProcessInfo threadNameToInfo](self, "threadNameToInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "threadNameToInfo");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v25, "isEqualToThreadInfo:", v27);

          if (!v28)
          {
            v29 = 0;
            goto LABEL_19;
          }
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v20)
          continue;
        break;
      }
    }
    v29 = 1;
LABEL_19:

  }
  else
  {
LABEL_16:
    v29 = 0;
  }

  return v29;
}

- (double)totalSystemTime
{
  return self->_totalSystemTime;
}

- (void)setTotalSystemTime:(double)a3
{
  self->_totalSystemTime = a3;
}

- (double)totalUserTime
{
  return self->_totalUserTime;
}

- (void)setTotalUserTime:(double)a3
{
  self->_totalUserTime = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)threadNameToInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThreadNameToInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadNameToInfo, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
