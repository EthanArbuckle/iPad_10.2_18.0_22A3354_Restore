@implementation RBCoalitionKernelAdapter

- (unint64_t)coalitionLevelForID:(unint64_t)a3
{
  return 0;
}

- (int64_t)applyCoalitionWithID:(unint64_t)a3 coalitionLevel:(unint64_t)a4
{
  return -1;
}

- (int64_t)coalitionInfoForPID:(int)a3 outCoalitionInfo:(coalition_info *)a4
{
  NSObject *v6;
  int v7;
  int v8;
  NSObject *v9;
  int64_t result;
  int v11;
  NSObject *v12;
  int v13;
  __int128 v14;
  int v15;
  size_t v16;
  _OWORD buffer[2];
  uint64_t v18;
  int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  char v30[4];
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v18 = 0;
  memset(buffer, 0, sizeof(buffer));
  rbs_process_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A8B4000, v6, OS_LOG_TYPE_DEFAULT, "coalitionInfoForPID: Calling proc_pidinfo", buf, 2u);
  }

  v7 = proc_pidinfo(a3, 20, 0, buffer, 40);
  if (v7 < 0)
  {
    v11 = v7;
    rbs_process_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[RBCoalitionKernelAdapter coalitionInfoForPID:outCoalitionInfo:].cold.1(a3, v11, v12);

    return -1;
  }
  else
  {
    v16 = 8;
    v8 = sysctlbyname("kern.coalition_roles", v30, &v16, &v19, 4uLL);
    if (v8 < 0 || v16 != 8)
    {
      rbs_process_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = v19;
        v14 = buffer[0];
        v15 = *__error();
        *(_DWORD *)buf = 67110144;
        v21 = v13;
        v22 = 2048;
        v23 = v14;
        v24 = 2048;
        v25 = *((_QWORD *)&v14 + 1);
        v26 = 1024;
        v27 = v8;
        v28 = 1024;
        v29 = v15;
        _os_log_error_impl(&dword_21A8B4000, v9, OS_LOG_TYPE_ERROR, "Kernel call to get coalition roles for PID %d, resource coalition id: %llu, jetsam coalition id: %llu, failed: ret %d, errno %d.", buf, 0x28u);
      }

    }
    result = 0;
    *(_OWORD *)&a4->var0 = buffer[0];
    a4->var2 = v31 == 1;
  }
  return result;
}

- (void)coalitionInfoForPID:(NSObject *)a3 outCoalitionInfo:.cold.1(int a1, int a2, NSObject *a3)
{
  int v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = *__error();
  v7[0] = 67109632;
  v7[1] = a1;
  v8 = 1024;
  v9 = a2;
  v10 = 1024;
  v11 = v6;
  _os_log_error_impl(&dword_21A8B4000, a3, OS_LOG_TYPE_ERROR, "Kernel call to get coalition info for PID %d failed: ret %d, errno %d.", (uint8_t *)v7, 0x14u);
}

@end
