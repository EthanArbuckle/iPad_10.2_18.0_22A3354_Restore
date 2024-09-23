@implementation PLFileDescriptorFuse

+ (void)checkFileDescriptorFuse
{
  int v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = open("/dev/null", 0);
  if (v3 < 0)
  {
    if (*__error() == 24 || *__error() == 23)
    {
      PLBackendGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "File descriptor fuse blown", v5, 2u);
      }

      objc_msgSend(a1, "logRecentOpenFiles");
      qword_1EE36DAE0 = (uint64_t)"File descriptor fuse blown";
      __break(1u);
    }
  }
  else
  {
    close(v3);
  }
}

+ (void)logRecentOpenFiles
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  int rlim_cur;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int *v10;
  char *v11;
  rlimit v12;
  uint8_t v13[4];
  int v14;
  __int16 v15;
  uint8_t *v16;
  uint8_t buf[4];
  _BYTE v18[18];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x19AEC04BC](a1, a2))
  {
    v12.rlim_cur = 0;
    v12.rlim_max = 0;
    v2 = getrlimit(8, &v12);
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v2 < 0)
    {
      if (v4)
      {
        v9 = *__error();
        v10 = __error();
        v11 = strerror(*v10);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v18 = v9;
        *(_WORD *)&v18[4] = 2082;
        *(_QWORD *)&v18[6] = v11;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Unable to get the maximum number of open files RLIMIT_NOFILE: %d %{public}s", buf, 0x12u);
      }

    }
    else
    {
      if (v4)
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)v18 = v12.rlim_cur;
        *(_WORD *)&v18[8] = 2048;
        *(_QWORD *)&v18[10] = v12.rlim_max;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Maximum number of open files RLIMIT_NOFILE, cur: %llu, max: %llu", buf, 0x16u);
      }

      rlim_cur = v12.rlim_cur;
      if (SLODWORD(v12.rlim_cur) >= 1)
      {
        if (SLODWORD(v12.rlim_cur) >= 25)
          v6 = 25;
        else
          v6 = v12.rlim_cur;
        v7 = LODWORD(v12.rlim_cur) - v6;
        do
        {
          if (fcntl(v7, 50, buf) != -1)
          {
            PLBackendGetLog();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v13 = 67109378;
              v14 = v7;
              v15 = 2080;
              v16 = buf;
              _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "fd %d: %s", v13, 0x12u);
            }

          }
          ++v7;
        }
        while (v7 < rlim_cur);
      }
    }
  }
}

@end
