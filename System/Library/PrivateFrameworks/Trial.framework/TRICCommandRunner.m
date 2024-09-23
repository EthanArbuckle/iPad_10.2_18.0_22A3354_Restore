@implementation TRICCommandRunner

+ (id)convertToTrialToolCommand:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);
  objc_msgSend(v7, "removeLastObject");
  objc_msgSend(v7, "addObject:", CFSTR("trialtool"));
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)convertToTrialToolArgs:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E3C195C8, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    objc_msgSend(&unk_1E3C195C8, "valueForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v3;
  }

  return v10;
}

+ (void)setUseTrialTool:(BOOL)a3
{
  _useTrialTool = a3;
}

+ (BOOL)useTrialTool
{
  return _useTrialTool;
}

+ (BOOL)runWithRootPrivilegesDroppedDescription:(const char *)a3 block:(id)a4
{
  void (**v5)(_QWORD);
  BOOL v6;
  const passwd *v7;
  const passwd *v8;
  int v9;
  FILE **v10;
  FILE *v11;
  const char *pw_name;
  int *v13;
  FILE *v14;
  int *v15;

  v5 = (void (**)(_QWORD))a4;
  if (!geteuid())
  {
    v7 = +[TRICEnvironmentManager getLoginPasswd](TRICEnvironmentManager, "getLoginPasswd");
    if (v7)
    {
      v8 = v7;
      *__error() = 0;
      v9 = seteuid(v8->pw_uid);
      v10 = (FILE **)MEMORY[0x1E0C80C10];
      v11 = (FILE *)*MEMORY[0x1E0C80C10];
      pw_name = v8->pw_name;
      if (v9)
      {
        v13 = __error();
        strerror(*v13);
        __error();
        fprintf(v11, "Warning: failed to seteuid() to account \"%s\": %s (%d)\n");
      }
      else
      {
        fprintf(v11, "trialcontroller was invoked as root; temporarily switched to account \"%s\" to carry out operation \"%s\".\n",
          pw_name,
          a3);
        v5[2](v5);
        if (!seteuid(0))
          goto LABEL_3;
        v14 = *v10;
        v15 = __error();
        strerror(*v15);
        __error();
        fprintf(v14, "Warning: failed to seteuid() back to root: %s (%d)\n");
      }
    }
    v6 = 0;
    goto LABEL_10;
  }
  v5[2](v5);
LABEL_3:
  v6 = 1;
LABEL_10:

  return v6;
}

+ (int)runCommand:(id)a3 withArgs:(id)a4
{
  return objc_msgSend(a1, "_withLoggingRunCommand:arguments:output:", a3, a4, 0);
}

+ (int)_withoutLoggingRunCommand:(id)a3 withArgs:(id)a4 output:(id *)a5 error:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v18;
  void *v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRICCommandRunner.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("command"));

    if (v13)
    {
LABEL_3:
      if (!a5)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRICCommandRunner.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arguments"));

  if (a5)
LABEL_4:
    *a5 = 0;
LABEL_5:
  if (a6)
    *a6 = 0;
  v20 = 0;
  objc_msgSend(a1, "runCommandAsync:withArgs:taskOutputOut:error:", v11, v13, &v20, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v20, "readDataToEndOfFile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "waitUntilExit");
    if (a5 && v15)
      *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
    v16 = objc_msgSend(v14, "terminationStatus");

  }
  else
  {
    v16 = -1;
  }

  return v16;
}

+ (id)runCommandAsync:(id)a3 withArgs:(id)a4 taskOutputOut:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  id v21;
  void *v22;
  id v24;

  v9 = a4;
  +[TRIStandardPaths resolveHardCodedPath:](TRIStandardPaths, "resolveHardCodedPath:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "environment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, CFSTR("OS_ACTIVITY_DT_MODE"));
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setEnvironment:", v13);
  v15 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v15, "insertObject:atIndex:", v10, 0);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/usr/local/bin/dvdo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExecutableURL:", v16);

  objc_msgSend(v14, "setArguments:", v15);
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStandardOutput:", v17);
  objc_msgSend(v14, "setStandardError:", v17);
  if (a5)
  {
    objc_msgSend(v17, "fileHandleForReading");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *a5;
    *a5 = v18;

  }
  v24 = 0;
  v20 = objc_msgSend(v14, "launchAndReturnError:", &v24);
  v21 = v24;
  v22 = v21;
  if ((v20 & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v21);

    v14 = 0;
  }

  return v14;
}

+ (int)_withLoggingRunCommand:(id)a3 arguments:(id)a4 output:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  id v20;
  uint8_t buf[4];
  _BYTE v22[28];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v19 = 0;
  v20 = 0;
  v9 = a4;
  v10 = objc_msgSend(a1, "_withoutLoggingRunCommand:withArgs:output:error:", v8, v9, &v20, &v19);
  v11 = v20;
  v12 = v19;
  objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_InternalTool();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v10 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v22 = v8;
      *(_WORD *)&v22[8] = 2112;
      *(_QWORD *)&v22[10] = v14;
      *(_WORD *)&v22[18] = 2112;
      *(_QWORD *)&v22[20] = v12;
      _os_log_error_impl(&dword_19B89C000, v16, OS_LOG_TYPE_ERROR, "Failed to spawn subprocess \"%@\" [%@]: %@", buf, 0x20u);
    }

LABEL_14:
    +[TRICPrinter printNewlineUsingStderr:format:](TRICPrinter, "printNewlineUsingStderr:format:", 1, CFSTR("Spawned subprocess: \"%@\" [%@]"), v8, v14);
    +[TRICPrinter printNewlineUsingStderr:format:](TRICPrinter, "printNewlineUsingStderr:format:", 1, CFSTR("Subprocess \"%@\" output: %@"), v8, v11);
    +[TRICPrinter printNewlineUsingStderr:format:](TRICPrinter, "printNewlineUsingStderr:format:", 1, CFSTR("Subprocess \"%@\" failed with status %d; error: %@"),
      v8,
      v10,
      v12);
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v22 = v10;
    *(_WORD *)&v22[4] = 2112;
    *(_QWORD *)&v22[6] = v8;
    *(_WORD *)&v22[14] = 2112;
    *(_QWORD *)&v22[16] = v14;
    _os_log_impl(&dword_19B89C000, v16, OS_LOG_TYPE_DEFAULT, "Spawned subprocess with exit code %d: \"%@\" [%@]", buf, 0x1Cu);
  }

  TRILogCategory_InternalTool();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v22 = v8;
    *(_WORD *)&v22[8] = 2112;
    *(_QWORD *)&v22[10] = v11;
    _os_log_impl(&dword_19B89C000, v17, OS_LOG_TYPE_DEFAULT, "Subprocess \"%@\" output: %@", buf, 0x16u);
  }

  if ((_DWORD)v10 || v12)
    goto LABEL_14;
  if (a5)
LABEL_9:
    *a5 = objc_retainAutorelease(v11);
LABEL_10:

  return v10;
}

id __61__TRICCommandRunner__withLoggingRunCommand_arguments_output___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithFormat:", CFSTR("\"%@\"), v3);

  return v4;
}

+ (int)runCommandAsTrialDaemonUserName:(id)a3 withArgs:(id)a4 output:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("-q");
  v16[1] = CFSTR("-f");
  v10 = a4;
  v11 = a3;
  +[TRICEnvironmentManager trialDaemonUserName](TRICEnvironmentManager, "trialDaemonUserName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(a6) = objc_msgSend(a1, "runCommand:withArgs:output:error:", CFSTR("/usr/bin/login"), v14, a5, a6);
  return (int)a6;
}

@end
