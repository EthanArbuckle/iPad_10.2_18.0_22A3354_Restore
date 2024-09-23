@implementation VMUProcInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstArg, 0);
  objc_storeStrong((id *)&self->_requestedAppName, 0);
  objc_storeStrong((id *)&self->_realAppName, 0);
  objc_storeStrong((id *)&self->_procTableName, 0);
  objc_storeStrong((id *)&self->_envVars, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_vmuTask, 0);
}

- (id)userAppName
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[VMUProcInfo realAppName](self, "realAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "rangeOfString:", CFSTR("LaunchCFMApp"));
    if (v5)
    {
      -[VMUProcInfo firstArgument](self, "firstArgument");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
  }
  return v4;
}

- (id)realAppName
{
  NSString *v3;
  NSString *realAppName;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  if (!self->_realAppName)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 0);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    realAppName = self->_realAppName;
    self->_realAppName = v3;

    v5 = self->_realAppName;
    if (!v5 || !-[NSString length](v5, "length"))
    {
      -[VMUProcInfo procTableName](self, "procTableName");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_realAppName;
      self->_realAppName = v6;

    }
  }
  return self->_realAppName;
}

- (VMUProcInfo)initWithPid:(int)a3
{
  VMUProcInfo *v4;
  VMUProcInfo *v5;
  VMUTask *vmuTask;

  v4 = -[VMUProcInfo init](self, "init");
  v5 = v4;
  if (v4)
  {
    v4->_pid = a3;
    v4->_task = 0;
    vmuTask = v4->_vmuTask;
    v4->_vmuTask = 0;

  }
  return v5;
}

- (id)name
{
  void *name;
  void *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  name = self->_name;
  if (!name)
  {
    if (!self->_pid)
    {
      self->_name = (NSString *)CFSTR("mach_kernel");
      goto LABEL_7;
    }
    -[VMUProcInfo userAppName](self, "userAppName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_name;
    self->_name = v5;

    v7 = self->_name;
    if (!v7 || !-[NSString length](v7, "length"))
    {
      -[VMUProcInfo procTableName](self, "procTableName");
      name = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(name, "lastPathComponent");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = self->_name;
      self->_name = v8;

LABEL_7:
    }
  }
  return self->_name;
}

void __38__VMUProcInfo_shouldAnalyzeWithCorpse__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Activity Monitor"), CFSTR("bluetoothd"), CFSTR("cfprefsd"), 0x1E4E0D000, CFSTR("coreservicesd"), CFSTR("coresymbolicationd"), CFSTR("diagnosticd"), CFSTR("hidd"), CFSTR("kernelmanagerd"), CFSTR("kextd"), CFSTR("launchd"), CFSTR("launchd.development"), CFSTR("launchservicesd"), CFSTR("logd"), CFSTR("loginwindow"), CFSTR("mach_kernel"), CFSTR("mds"),
    CFSTR("mdworker"),
    CFSTR("notifyd"),
    CFSTR("opendirectoryd"),
    CFSTR("powerd"),
    CFSTR("ReportCrash"),
    CFSTR("ReportMemoryException"),
    CFSTR("ReportPanic"),
    CFSTR("rpc.lockd"),
    CFSTR("securityd"),
    CFSTR("spindump_agent"),
    CFSTR("sysdiagnose"),
    CFSTR("taskgated"),
    CFSTR("TouchBarServer"),
    CFSTR("UserEventAgent"),
    CFSTR("usbd"),
    CFSTR("watchdogd"),
    CFSTR("WindowServer"),
    CFSTR("WindowManager"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldAnalyzeWithCorpse_s_criticalSystemProcesses;
  shouldAnalyzeWithCorpse_s_criticalSystemProcesses = v0;

}

- (BOOL)shouldAnalyzeWithCorpse
{
  VMUTask *vmuTask;
  void *v5;
  void *v6;

  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
    return 0;
  if (shouldAnalyzeWithCorpse_onceToken != -1)
    dispatch_once(&shouldAnalyzeWithCorpse_onceToken, &__block_literal_global_67);
  v5 = (void *)shouldAnalyzeWithCorpse_s_criticalSystemProcesses;
  -[VMUProcInfo name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  return (char)v5;
}

- (id)procTableName
{
  VMUTask *vmuTask;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  int pid;
  _DWORD *v9;
  __CFString *v10;
  NSString *procTableName;
  const char *v13;
  size_t size;
  int v15[2];
  int v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_procTableName)
  {
    vmuTask = self->_vmuTask;
    if (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore"))
    {
      size = 0;
      *(_QWORD *)v15 = 0xE00000001;
      pid = self->_pid;
      v16 = 1;
      v17 = pid;
      if (sysctl(v15, 4u, 0, &size, 0, 0) < 0)
      {
        v13 = "Failure calling sysctl to get buf size";
      }
      else
      {
        v9 = malloc_type_calloc(1uLL, size, 0xA90FD239uLL);
        if ((sysctl(v15, 4u, v9, &size, 0, 0) & 0x80000000) == 0)
        {
          if (v9[10] == self->_pid)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v9 + 243);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = CFSTR("Exited process");
          }
          procTableName = self->_procTableName;
          self->_procTableName = &v10->isa;

          free(v9);
          return self->_procTableName;
        }
        free(v9);
        v13 = "Failure calling sysctl to get proc buf";
      }
      perror(v13);
      return 0;
    }
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMUTaskMemoryCache coreFileProcName](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_procTableName;
    self->_procTableName = v6;

  }
  return self->_procTableName;
}

- (void)dealloc
{
  mach_port_name_t task;
  objc_super v4;

  if (!self->_vmuTask)
  {
    task = self->_task;
    if (task + 1 >= 2)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], task);
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUProcInfo;
  -[VMUProcInfo dealloc](&v4, sel_dealloc);
}

- (id)_infoFromCommandLine:(int)a3
{
  __CFString *v5;
  VMUTask *vmuTask;
  void *v7;
  _DWORD *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  _DWORD *v16;
  size_t v17;
  size_t v18;
  void *v19;
  _DWORD *v20;
  void *v21;
  int v22;
  void *v24;
  size_t v25;
  uint64_t v26;
  __CFString *v27;
  __CFString *v28;
  size_t v29;
  size_t v30;
  size_t v31;
  int v32;
  size_t size;
  int v34[2];
  int pid;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  size = 0;
  if ((a3 - 3) > 1)
    v5 = &stru_1E4E04720;
  else
    v5 = (__CFString *)objc_opt_new();
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
  {
    *(_QWORD *)v34 = 0;
    v32 = 0;
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VMUTaskMemoryCache getCoreFileUserstack:]((uint64_t)v7))
    {

    }
    else
    {
      -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VMUTaskMemoryCache getCoreFileArgsLen:]((uint64_t)v9);

      if (!v10)
        goto LABEL_13;
    }
    v30 = 0;
    v31 = 0;
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mapAddress:size:returnedAddress:returnedSize:", *(_QWORD *)v34 - v32, v32, &v31, &v30);

    if (v12)
      goto LABEL_13;
    size = v30;
    v16 = malloc_type_malloc(v30, 0xE7F56D78uLL);
    if (!v16)
      goto LABEL_13;
    v8 = v16;
    memcpy(v16, (const void *)v31, size);
    goto LABEL_17;
  }
  *(_QWORD *)v34 = 0x800000001;
  v31 = 8;
  if (!sysctl(v34, 2u, &size, &v31, 0, 0))
  {
    *(_QWORD *)v34 = 0x3100000001;
    pid = self->_pid;
    v8 = malloc_type_malloc(size, 0x3F566F42uLL);
    if (sysctl(v34, 3u, v8, &size, 0, 0))
    {
LABEL_10:
      free(v8);
      goto LABEL_13;
    }
LABEL_17:
    *((_BYTE *)v8 + size - 1) = 0;
    if (!a3)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = v8 + 1;
LABEL_27:
      objc_msgSend(v19, "stringWithUTF8String:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      free(v8);
      v13 = v21;
      goto LABEL_14;
    }
    v17 = size;
    v18 = 4;
    if (size >= 5)
    {
      while (*((_BYTE *)v8 + v18))
      {
        if (size == ++v18)
          goto LABEL_10;
      }
    }
    if (v18 < size)
    {
      while (!*((_BYTE *)v8 + v18))
      {
        if (size == ++v18)
          goto LABEL_10;
      }
      if (a3 == 1)
      {
        v20 = (_DWORD *)((char *)v8 + v18);
        v19 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_27;
      }
      if (v18 < size)
      {
        while (*((_BYTE *)v8 + v18))
        {
          if (++v18 >= size)
            goto LABEL_10;
        }
      }
      if (v18 < size)
      {
        while (!*((_BYTE *)v8 + v18))
        {
          if (size == ++v18)
            goto LABEL_10;
        }
        v22 = *v8 - (*v8 > 0);
        if (v22 >= 1 && v18 < size)
        {
          v26 = 0;
          while (1)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v8 + v18);
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v27)
            {
              v29 = -[__CFString length](v27, "length");
            }
            else
            {
              NSLog(CFSTR("Argument num %d utf8 null: %s\n"), v26, (char *)v8 + v18);
              v29 = strlen((const char *)v8 + v18);
            }
            v18 += v29;
            if (v18 < size)
            {
              while (!*((_BYTE *)v8 + v18))
              {
                if (++v18 >= size)
                {
                  v18 = size;
                  break;
                }
              }
            }
            if (a3 == 2)
              break;
            if (a3 == 3 && v28)
              -[__CFString addObject:](v5, "addObject:", v28);

            v26 = (v26 + 1);
            v17 = size;
            if ((int)v26 >= v22 || v18 >= size)
              goto LABEL_43;
          }

          goto LABEL_70;
        }
LABEL_43:
        if ((a3 & 0xFFFFFFFE) == 2 || v18 >= v17)
        {
          v28 = v5;
LABEL_70:
          free(v8);
          v13 = v28;
          goto LABEL_14;
        }
        if (a3 == 4)
        {
          do
          {
            if (*((_BYTE *)v8 + v18))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v8 + v18);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "length")
                && objc_msgSend(v24, "rangeOfString:", CFSTR("=")) != 0x7FFFFFFFFFFFFFFFLL)
              {
                -[__CFString addObject:](v5, "addObject:", v24);
                v25 = objc_msgSend(v24, "length");
              }
              else
              {
                v25 = strlen((const char *)v8 + v18);
              }
              v18 += v25;

              v17 = size;
            }
            ++v18;
          }
          while (v18 < v17);
        }
      }
    }
    goto LABEL_10;
  }
LABEL_13:
  v13 = v5;
LABEL_14:
  v14 = v13;

  return v14;
}

- (VMUProcInfo)initWithTask:(unsigned int)a3
{
  VMUProcInfo *v4;
  VMUProcInfo *v5;
  VMUTask *vmuTask;
  int x;

  x = 0;
  v4 = -[VMUProcInfo init](self, "init");
  v5 = v4;
  if (v4)
  {
    vmuTask = v4->_vmuTask;
    v4->_vmuTask = 0;

    if (!mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a3, 0, 1))
    {
      v5->_task = a3;
      if (!pid_for_task(a3, &x))
        v5->_pid = x;
    }
  }
  return v5;
}

- (VMUProcInfo)initWithVMUTask:(id)a3
{
  id v5;
  VMUProcInfo *v6;
  VMUProcInfo *v7;

  v5 = a3;
  v6 = -[VMUProcInfo init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vmuTask, a3);
    v7->_pid = -[VMUTask pid](v7->_vmuTask, "pid");
    v7->_task = -[VMUTask taskPort](v7->_vmuTask, "taskPort");
  }

  return v7;
}

+ (id)getProcessIds
{
  void *v2;
  int *v3;
  uint64_t v4;
  int *v5;
  void *v6;
  size_t size;
  int v9[2];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  size = 0;
  *(_QWORD *)v9 = 0xE00000001;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (sysctl(v9, 3u, 0, &size, 0, 0) < 0)
  {
    perror("Failure calling sysctl to get process list buffer size");
  }
  else
  {
    v3 = (int *)malloc_type_calloc(1uLL, size, 0xE1BF5590uLL);
    if ((sysctl(v9, 3u, v3, &size, 0, 0) & 0x80000000) == 0 && (int)(size / 0x288) >= 1)
    {
      v4 = (size / 0x288);
      v5 = v3 + 10;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "insertObject:atIndex:", v6, 0);

        v5 += 162;
        --v4;
      }
      while (v4);
    }
    free(v3);
  }
  return v2;
}

+ (int)processParentId:(int)a3
{
  size_t v4;
  int v5[2];
  int v6;
  int v7;
  _BYTE v8[560];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 648;
  *(_QWORD *)v5 = 0xE00000001;
  v6 = 1;
  v7 = a3;
  sysctl(v5, 4u, v8, &v4, 0, 0);
  if (v4 == 648)
    return v9;
  else
    return -1;
}

- (timeval)startTime
{
  __darwin_time_t tv_sec;
  timeval *p_startTime;
  uint64_t v5;
  VMUTask *vmuTask;
  void *v7;
  int pid;
  timeval *v9;
  void *v10;
  int v11;
  const char *v12;
  size_t size;
  int v14[2];
  int v15;
  int v16;
  uint64_t v17;
  timeval result;

  v17 = *MEMORY[0x1E0C80C00];
  p_startTime = &self->_startTime;
  tv_sec = self->_startTime.tv_sec;
  if (tv_sec)
    goto LABEL_4;
  if (self->_startTime.tv_usec)
  {
    tv_sec = 0;
LABEL_4:
    v5 = *(_QWORD *)&self->_startTime.tv_usec;
    goto LABEL_21;
  }
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
  {
    *(_QWORD *)v14 = 0;
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VMUTaskMemoryCache getCoreFileProcStarttimeSec:]((uint64_t)v7))
    {

    }
    else
    {
      -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[VMUTaskMemoryCache getCoreFileProcStarttimeUSec:]((uint64_t)v10);

      if (!v11)
      {
        tv_sec = *(_QWORD *)v14;
        self->_startTime.tv_sec = *(_QWORD *)v14;
        self->_startTime.tv_usec = 0;
        goto LABEL_4;
      }
    }
    goto LABEL_20;
  }
  size = 0;
  *(_QWORD *)v14 = 0xE00000001;
  pid = self->_pid;
  v15 = 1;
  v16 = pid;
  if (sysctl(v14, 4u, 0, &size, 0, 0) < 0)
  {
    v12 = "Failure calling sysctl to get buf size";
LABEL_19:
    perror(v12);
    goto LABEL_20;
  }
  v9 = (timeval *)malloc_type_calloc(1uLL, size, 0xC9AB2DADuLL);
  if (sysctl(v14, 4u, v9, &size, 0, 0) < 0)
  {
    free(v9);
    v12 = "Failure calling sysctl to get proc buf";
    goto LABEL_19;
  }
  if (v9[2].tv_usec == self->_pid)
  {
    *p_startTime = *v9;
    free(v9);
    tv_sec = p_startTime->tv_sec;
    goto LABEL_4;
  }
  free(v9);
LABEL_20:
  v5 = 0;
  tv_sec = 0;
LABEL_21:
  result.tv_usec = v5;
  result.tv_sec = tv_sec;
  return result;
}

- (id)requestedAppName
{
  NSString *v3;
  NSString *requestedAppName;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  if (!self->_requestedAppName)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 1);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestedAppName = self->_requestedAppName;
    self->_requestedAppName = v3;

    v5 = self->_requestedAppName;
    if (!v5 || !-[NSString length](v5, "length"))
    {
      -[VMUProcInfo procTableName](self, "procTableName");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      v7 = self->_requestedAppName;
      self->_requestedAppName = v6;

    }
  }
  return self->_requestedAppName;
}

- (id)firstArgument
{
  NSString *firstArg;
  NSString **p_firstArg;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  p_firstArg = &self->_firstArg;
  firstArg = self->_firstArg;
  if (!firstArg)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (__CFString *)v5;
    else
      v7 = &stru_1E4E04720;
    objc_storeStrong((id *)p_firstArg, v7);

    firstArg = self->_firstArg;
  }
  return firstArg;
}

- (id)arguments
{
  NSArray *arguments;
  NSArray *v4;
  NSArray *v5;

  arguments = self->_arguments;
  if (!arguments)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 3);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_arguments;
    self->_arguments = v4;

    arguments = self->_arguments;
  }
  return arguments;
}

- (id)envVars
{
  NSArray *envVars;
  NSArray *v4;
  NSArray *v5;

  envVars = self->_envVars;
  if (!envVars)
  {
    -[VMUProcInfo _infoFromCommandLine:](self, "_infoFromCommandLine:", 4);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_envVars;
    self->_envVars = v4;

    envVars = self->_envVars;
  }
  return envVars;
}

- (id)valueForEnvVar:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A85A9758]();
  v6 = objc_msgSend(v4, "length");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@="), v4);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[VMUProcInfo envVars](self, "envVars");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = v7 + 1;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v16, "hasPrefix:", v8))
          {
            objc_msgSend(v16, "substringFromIndex:", v13);
            v17 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v17;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    objc_autoreleasePoolPop(v5);
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<VMUProcInfo: %@ (PID %d)>"), self->_name, self->_pid);
}

- (int)pid
{
  return self->_pid;
}

- (int)ppid
{
  int result;
  VMUTask *vmuTask;
  void *v5;

  result = self->_ppid;
  if (!result)
  {
    vmuTask = self->_vmuTask;
    if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
    {
      -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMUTaskMemoryCache getCoreFilePPid:]((uint64_t)v5);

      result = -1;
    }
    else
    {
      result = +[VMUProcInfo processParentId:](VMUProcInfo, "processParentId:", self->_pid);
    }
    self->_ppid = result;
  }
  return result;
}

- (unsigned)task
{
  return 0;
}

- (void)update
{
  NSString *name;
  id v4;
  NSArray *envVars;
  id v6;
  NSString *procTableName;
  id v8;
  NSString *realAppName;
  id v10;
  NSString *requestedAppName;
  id v12;
  NSString *firstArg;
  id v14;

  name = self->_name;
  self->_name = 0;

  v4 = -[VMUProcInfo name](self, "name");
  envVars = self->_envVars;
  self->_envVars = 0;

  v6 = -[VMUProcInfo envVars](self, "envVars");
  procTableName = self->_procTableName;
  self->_procTableName = 0;

  v8 = -[VMUProcInfo procTableName](self, "procTableName");
  realAppName = self->_realAppName;
  self->_realAppName = 0;

  v10 = -[VMUProcInfo realAppName](self, "realAppName");
  requestedAppName = self->_requestedAppName;
  self->_requestedAppName = 0;

  v12 = -[VMUProcInfo requestedAppName](self, "requestedAppName");
  firstArg = self->_firstArg;
  self->_firstArg = 0;

  v14 = -[VMUProcInfo firstArgument](self, "firstArgument");
  -[VMUProcInfo isZombie](self, "isZombie");
}

- (BOOL)isApp
{
  return 0;
}

- (BOOL)isMachO
{
  return !-[VMUProcInfo isCFM](self, "isCFM");
}

- (BOOL)isCFM
{
  void *v2;
  BOOL v3;

  -[VMUProcInfo realAppName](self, "realAppName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("LaunchCFMApp")) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (int)cpuType
{
  VMUTask *vmuTask;
  void *v4;
  int v5;
  size_t v7;
  size_t v8;
  size_t v9;
  int v10;
  int v11[4];
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = -1;
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
  {
    -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "getCoreFileCPUType:", &v10);

    if (v5)
      return -1;
    else
      return v10;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    *(_OWORD *)v11 = 0u;
    v9 = 12;
    if (sysctlnametomib("sysctl.proc_cputype", v11, &v9) != -1)
    {
      v7 = v9;
      v11[v9] = self->_pid;
      v8 = 4;
      v9 = v7 + 1;
      if (sysctl(v11, v7 + 1, &v10, &v8, 0, 0) == -1)
        return -1;
    }
    return v10;
  }
}

- (BOOL)isNative
{
  VMUTask *vmuTask;
  void *v4;
  char v5;

  vmuTask = self->_vmuTask;
  if (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore"))
    return CSTaskIsTranslated() ^ 1;
  -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "taskIsTranslated");

  return v5;
}

- (unsigned)platform
{
  VMUTask *vmuTask;
  void *v4;
  int v5;
  unsigned int v7;

  v7 = 0;
  vmuTask = self->_vmuTask;
  if (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore"))
    return CSPlatformForTask();
  -[VMUTask memoryCache](self->_vmuTask, "memoryCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getPlatform:", &v7);

  if (v5)
    return 0;
  else
    return v7;
}

- (id)platformName
{
  return VMUPlatformNameForPlatform(-[VMUProcInfo platform](self, "platform"));
}

- (BOOL)isRunning
{
  VMUTask *vmuTask;

  vmuTask = self->_vmuTask;
  return (!vmuTask || !-[VMUTask isCore](vmuTask, "isCore")) && VMUProcessIsAnalyzable(self->_pid);
}

- (BOOL)isSemiCriticalProcess
{
  void *v3;
  char v4;

  if (isSemiCriticalProcess_onceToken != -1)
    dispatch_once(&isSemiCriticalProcess_onceToken, &__block_literal_global_15);
  -[VMUProcInfo name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)isSemiCriticalProcess_s_semiCriticalSystemProcesses, "containsObject:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("boardd"));

  return v4;
}

void __36__VMUProcInfo_isSemiCriticalProcess__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Carousel"), CFSTR("SpringBoard"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isSemiCriticalProcess_s_semiCriticalSystemProcesses;
  isSemiCriticalProcess_s_semiCriticalSystemProcesses = v0;

}

- (BOOL)isSemiCriticalProcessWithNoTimeLimit
{
  return 0;
}

- (BOOL)isZombie
{
  VMUTask *vmuTask;
  BOOL result;
  int pid;
  void *v6;
  const char *v7;
  size_t size;
  int v9[2];
  int v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
    return 0;
  result = 1;
  if (!self->_isZombie)
  {
    size = 0;
    *(_QWORD *)v9 = 0xE00000001;
    pid = self->_pid;
    v10 = 1;
    v11 = pid;
    if (sysctl(v9, 4u, 0, &size, 0, 0) < 0)
    {
      v7 = "Failure calling sysctl to get buf size";
    }
    else
    {
      v6 = malloc_type_calloc(1uLL, size, 0x3D3C66DFuLL);
      if (sysctl(v9, 4u, v6, &size, 0, 0) < 0)
      {
        free(v6);
        v7 = "Failure calling sysctl to get proc buf";
      }
      else
      {
        if (*((_DWORD *)v6 + 10) == self->_pid)
        {
          self->_isZombie = *((_BYTE *)v6 + 36) == 5;
          free(v6);
          return self->_isZombie;
        }
        free(v6);
        v7 = "Process exited";
      }
    }
    perror(v7);
    return 0;
  }
  return result;
}

- (BOOL)terminate
{
  VMUTask *vmuTask;
  pid_t pid;
  int v6;
  int v7;

  vmuTask = self->_vmuTask;
  if (vmuTask && -[VMUTask isCore](vmuTask, "isCore"))
    return 1;
  pid = self->_pid;
  if (pid < 1)
    return 0;
  v6 = kill(pid, 3);
  v7 = kill(self->_pid, 9);
  return !v6 || v7 == 0;
}

- (BOOL)signal:(int)a3
{
  VMUTask *vmuTask;

  vmuTask = self->_vmuTask;
  return vmuTask && -[VMUTask isCore](vmuTask, "isCore") || kill(self->_pid, a3) == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "pid") == self->_pid;

  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int pid;
  int64_t v6;
  int v7;

  v4 = a3;
  pid = self->_pid;
  if (pid >= (int)objc_msgSend(v4, "pid"))
  {
    v7 = self->_pid;
    v6 = v7 != objc_msgSend(v4, "pid");
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (int64_t)compareByName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[VMUProcInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (int64_t)compareByUserAppName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[VMUProcInfo userAppName](self, "userAppName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMUProcInfo;
  return -[VMUProcInfo hash](&v3, sel_hash);
}

@end
