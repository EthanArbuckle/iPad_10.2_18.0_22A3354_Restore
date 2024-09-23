@implementation SPIProcessUtils

+ (id)getProcessNameForPid:(int)a3
{
  void *v3;
  _BYTE buffer[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (proc_name(a3, buffer, 0x400u) < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (unsigned)getProcessForPid:(int)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[SPIProcessUtils getProcessNameForPid:](SPIProcessUtils, "getProcessNameForPid:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)processNameToTypeMapping, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)processNameToTypeMapping, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "unsignedShortValue");

  }
  return v4;
}

+ (int)getUsageForPid:(int)a3 withOutput:(SPIResourceUsage *)a4
{
  int result;
  _OWORD v6[4];
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
  int8x16_t v18[4];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v18, 0, sizeof(v18));
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
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  result = proc_pid_rusage(a3, 5, (rusage_info_t *)v6);
  if (!result)
  {
    *(int8x16_t *)&a4->cpuCycles = vextq_s8(*(int8x16_t *)((char *)v18 + 8), *(int8x16_t *)((char *)v18 + 8), 8uLL);
    a4->memPhysFootprint = *((_QWORD *)&v7 + 1);
  }
  return result;
}

@end
