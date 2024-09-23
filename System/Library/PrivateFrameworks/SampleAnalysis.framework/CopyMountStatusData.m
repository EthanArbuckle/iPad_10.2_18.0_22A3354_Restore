@implementation CopyMountStatusData

void __CopyMountStatusData_block_invoke()
{
  unsigned int v0;
  int v1;
  NSObject *v2;
  int v3;
  int *v4;
  char *v5;
  dispatch_semaphore_t v6;
  void *v7;
  dispatch_queue_t v8;
  void *v9;
  statfs *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v0 = getmntinfo(&v10, 2);
  _MergedGlobals_9 = v0;
  if (v0)
  {
    qword_1ED1DD930 = (uint64_t)malloc_type_calloc(v0, 0x878uLL, 0x100004087E0324AuLL);
    memcpy((void *)qword_1ED1DD930, v10, 2168 * _MergedGlobals_9);
  }
  else
  {
    v1 = *__error();
    _sa_logt();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *__error();
      v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)buf = 67109378;
      v12 = v3;
      v13 = 2080;
      v14 = v5;
      _os_log_impl(&dword_1B9BE0000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: getmntinfo failed: %d %s", buf, 0x12u);
    }

    *__error() = v1;
    qword_1ED1DD930 = 0;
    _MergedGlobals_9 = 0;
  }
  v6 = dispatch_semaphore_create(1);
  v7 = (void *)qword_1ED1DD938;
  qword_1ED1DD938 = (uint64_t)v6;

  v8 = dispatch_queue_create("Network mount sysctl", 0);
  v9 = (void *)qword_1ED1DD940;
  qword_1ED1DD940 = (uint64_t)v8;

}

intptr_t __CopyMountStatusData_block_invoke_42(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  size_t v6;
  int v7;
  NSObject *v8;
  unsigned int *v9;
  int v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  int v14;
  int *v15;
  char *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  size_t size;
  uint8_t buf[4];
  _DWORD v24[7];

  *(_QWORD *)&v24[5] = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_9)
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = qword_1ED1DD930;
      size = 0;
      if ((sysctl_fsid((_QWORD *)(qword_1ED1DD930 + v2 + 48), 0, &size) & 0x80000000) == 0)
      {
        v6 = size;
        if (size >= 0x611)
        {
          v7 = *__error();
          _sa_logt();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)v24 = (size - 528) >> 3;
            _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "network mount status sizing check says %ld threads are blocked, ignoring", buf, 0xCu);
          }

          *__error() = v7;
          goto LABEL_18;
        }
        v9 = (unsigned int *)malloc_type_calloc(1uLL, size, 0x109DBD91uLL);
        if ((sysctl_fsid((_QWORD *)(v5 + v2 + 48), v9, &size) & 0x80000000) != 0)
        {
          v12 = *__error();
          _sa_logt();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v14 = *__error();
            v15 = __error();
            v16 = strerror(*v15);
            *(_DWORD *)buf = 67109378;
            v24[0] = v14;
            LOWORD(v24[1]) = 2080;
            *(_QWORD *)((char *)&v24[1] + 2) = v16;
            _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "Unable to get netfs_status: %d %s", buf, 0x12u);
          }

          *__error() = v12;
        }
        else
        {
          if (&v9[2 * v9[130] + 132] <= (unsigned int *)((char *)v9 + v6))
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) + 8) = v9;
            **(_QWORD **)(*(_QWORD *)(a1 + 40) + 8 * v4++) = v5 + v2;
            goto LABEL_18;
          }
          v10 = *__error();
          _sa_logt();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v17 = v9[130];
            *(_DWORD *)buf = 67109376;
            v24[0] = v17;
            LOWORD(v24[1]) = 2048;
            *(_QWORD *)((char *)&v24[1] + 2) = v6;
            _os_log_error_impl(&dword_1B9BE0000, v11, OS_LOG_TYPE_ERROR, "network mount status says %u threads are blocked, which is more than fits in the allocated status structure (%zu bytes), ignoring", buf, 0x12u);
          }

          *__error() = v10;
        }
        free(v9);
      }
LABEL_18:
      ++v3;
      v2 += 2168;
    }
    while (v3 < _MergedGlobals_9);
  }
  v18 = *(unsigned int **)(a1 + 48);
  do
  {
    v19 = __ldxr(v18);
    v20 = v19 - 1;
  }
  while (__stxr(v20, v18));
  if (!v20)
    free(*(void **)(a1 + 40));
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_1ED1DD938);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
