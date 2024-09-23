@implementation PLSnapshotCPUStats

+ (double)getCpuSnapshot:(int)a3
{
  int v3;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  v3 = proc_pid_rusage(a3, 1, (rusage_info_t *)&v5);
  result = -1.0;
  if (!v3)
    +[PLSnapshotUtilities secondsFromMachTime:](PLSnapshotUtilities, "secondsFromMachTime:", (_QWORD)v6, -1.0);
  return result;
}

+ (double)getCoalitionSnapshot:(unint64_t)a3
{
  int v4;
  uint64_t *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  double v13;
  double v14;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = proc_listcoalitions();
  v5 = (uint64_t *)malloc_type_malloc(2 * v4, 0xB41EEAA9uLL);
  v6 = proc_listcoalitions();
  if (v6 > 2 * v4 || v6 < 16)
  {
    v13 = -1.0;
    if (!v5)
      return v13;
    goto LABEL_16;
  }
  v7 = 0;
  v8 = v6 >> 4;
  v9 = MEMORY[0x24BDACB70];
  v10 = v5;
  while (1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = *v10;
      *(_DWORD *)buf = 67109376;
      v17 = v7;
      v18 = 2048;
      v19 = v11;
      _os_log_debug_impl(&dword_21F4E0000, v9, OS_LOG_TYPE_DEBUG, "Coalitions ID number %d is: %lld\n", buf, 0x12u);
    }
    if (*v10 == a3)
      break;
    ++v7;
    v10 += 2;
    if (v8 == v7)
    {
      v13 = -1.0;
      goto LABEL_16;
    }
  }
  v12 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
  if (coalition_info_resource_usage())
  {
    v13 = -1.0;
    if (!v12)
      goto LABEL_16;
  }
  else
  {
    +[PLSnapshotUtilities secondsFromMachTime:](PLSnapshotUtilities, "secondsFromMachTime:", v12[3]);
    v13 = v14;
  }
  free(v12);
LABEL_16:
  free(v5);
  return v13;
}

@end
