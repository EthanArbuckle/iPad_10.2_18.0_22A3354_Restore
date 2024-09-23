@implementation CopyDyldSnapshotForPid

int *__CopyDyldSnapshotForPid_block_invoke(uint64_t a1)
{
  ipc_space_t *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  int *result;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v3 = task_read_for_pid();
  if (v3)
  {
    v4 = v3;
    v5 = kill(*(_DWORD *)(a1 + 48), 0);
    v6 = *__error();
    _sa_logt();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        v22 = v9;
        _os_log_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_INFO, "Unable to inspect [%d] since it's no longer alive", buf, 8u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109376;
      v22 = v18;
      v23 = 1024;
      v24 = v4;
      _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "Unable to inspect [%d]: %d", buf, 0xEu);
    }

    result = __error();
    *result = v6;
  }
  else
  {
    v10 = mach_absolute_time();
    v11 = SASecondsFromMachTimeUsingLiveTimebase(v10);
    if (dyld_process_create_for_task())
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = dyld_process_snapshot_create_for_process();
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v12 = mach_absolute_time();
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SASecondsFromMachTimeUsingLiveTimebase(v12) - v11;
      }
      dyld_process_dispose();
      result = (int *)mach_port_deallocate(*v2, 0);
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      {
        v14 = *__error();
        _sa_logt();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v20 = *(_DWORD *)(a1 + 48);
          *(_DWORD *)buf = 67109376;
          v22 = v20;
          v23 = 1024;
          v24 = 0;
          _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "Unable to get dyld process snapshot for [%d]: %d", buf, 0xEu);
        }

        result = __error();
        *result = v14;
      }
    }
    else
    {
      v16 = *__error();
      _sa_logt();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109376;
        v22 = v19;
        v23 = 1024;
        v24 = 0;
        _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "Unable to get dyld process for [%d]: %d", buf, 0xEu);
      }

      *__error() = v16;
      return (int *)mach_port_deallocate(*v2, 0);
    }
  }
  return result;
}

@end
