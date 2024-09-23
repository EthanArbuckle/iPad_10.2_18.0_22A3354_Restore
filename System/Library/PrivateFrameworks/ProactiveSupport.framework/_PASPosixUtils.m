@implementation _PASPosixUtils

+ (int)runCommandWithPath:(const char *)a3 argv:(const char *)a4 envp:(const char *)a5 handleStdout:(id)a6 handleStderr:(id)a7
{
  id v11;
  id v12;
  NSObject *v13;
  dispatch_queue_t v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  const char **v21;
  int v22;
  int v23;
  int *v24;
  char *v25;
  int v26;
  int v27;
  int v28;
  char *v30;
  int v31;
  pid_t v32;
  posix_spawn_file_actions_t v33;
  int v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_queue_create("_PASPosixUtils-runCommandWithPath", v13);

  v34 = 0;
  v15 = dispatch_group_create();
  v33 = 0;
  posix_spawn_file_actions_init(&v33);
  if (!v11)
  {
    v16 = 0;
    if (v12)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v16 = (void *)objc_opt_new();
  v17 = objc_msgSend(v16, "setupWithSubprocessFd:fileActions:queue:group:readErrno:", 1, &v33, v14, v15, &v34);
  if (v17 < 0)
  {
    v20 = v17;
    v18 = 0;
    goto LABEL_29;
  }
  if (!v12)
    goto LABEL_7;
LABEL_4:
  v18 = (void *)objc_opt_new();
  v19 = objc_msgSend(v18, "setupWithSubprocessFd:fileActions:queue:group:readErrno:", 2, &v33, v14, v15, &v34);
  if (v19 < 0)
  {
    v20 = v19;
    goto LABEL_29;
  }
LABEL_8:
  v32 = -1;
  v41[0] = 0;
  if (a5)
    v21 = a5;
  else
    v21 = (const char **)v41;
  v22 = posix_spawn(&v32, a3, &v33, 0, (char *const *)a4, (char *const *)v21);
  if (v22)
  {
    v23 = v22;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = strerror(v23);
      *(_DWORD *)buf = 136315650;
      v36 = a3;
      v37 = 2080;
      v38 = v30;
      v39 = 1024;
      v40 = v23;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "runCommandWithPath failed to spawn %s: %s (%d)", buf, 0x1Cu);
    }
    *__error() = v23;
  }
  else
  {
    objc_msgSend(v16, "startReadWithHandler:", v11);
    objc_msgSend(v18, "startReadWithHandler:", v12);
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    v31 = 1;
    do
      *__error() = 0;
    while (waitpid(v32, &v31, 0) < 0 && *__error() == 4);
    if (*__error())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v24 = __error();
        v25 = strerror(*v24);
        v26 = *__error();
        *(_DWORD *)buf = 136315394;
        v36 = v25;
        v37 = 1024;
        LODWORD(v38) = v26;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "runCommandWithPath failed on waitpid: %s (%d)", buf, 0x12u);
      }
    }
    else
    {
      v27 = v31;
      if ((v31 & 0x7F) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v36 = a3;
          v37 = 1024;
          LODWORD(v38) = v27;
          _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "runCommandWithPath subprocess \"%s\" did not exit cleanly (status %d)", buf, 0x12u);
        }
        *__error() = 5;
      }
      else
      {
        v28 = v34;
        if (!v34)
        {
          v20 = BYTE1(v31);
          goto LABEL_29;
        }
        *__error() = v28;
      }
    }
  }
  v20 = -1;
LABEL_29:

  return v20;
}

+ (int)runCommandWithPath:(const char *)a3 argv:(const char *)a4 envp:(const char *)a5 stdoutData:(id *)a6 stderrData:(id *)a7
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  if (a6)
  {
    v13 = (void *)objc_opt_new();
    if (a7)
    {
LABEL_3:
      v14 = (void *)objc_opt_new();
      goto LABEL_6;
    }
  }
  else
  {
    v13 = 0;
    if (a7)
      goto LABEL_3;
  }
  v14 = 0;
LABEL_6:
  objc_msgSend(v13, "handleData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "runCommandWithPath:argv:envp:handleStdout:handleStderr:", a3, a4, a5, v15, v16);

  if (a6)
  {
    objc_msgSend(v13, "allData");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    objc_msgSend(v14, "allData");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

@end
