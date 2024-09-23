@implementation NSError(SUCoreError)

+ (id)buildCheckedError:()SUCoreError
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "_checkedIsSafe:", 1))
    {
      v5 = v4;
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "_checkedDepthCount:", v4);
      if (v6 >= 1
        && (v7 = v6, objc_msgSend(v4, "_checkedStackErrorAtDepth:", v6), (v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v9 = (void *)v8;
        v10 = 0;
        do
        {
          v11 = v10;
          v12 = v9;
          v13 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v9, "domain");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "code");
          objc_msgSend(v12, "localizedDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "_buildCheckedErrorForDomain:withCode:safeUnderlying:description:", v14, v15, v11, v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "_checkedStackErrorAtDepth:", v7 - 1);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7 < 2)
            break;
          --v7;
        }
        while (v9);

      }
      else
      {
        v10 = 0;
      }
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v4, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v4, "code");
      objc_msgSend(v4, "localizedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_buildCheckedErrorForDomain:withCode:safeUnderlying:description:", v18, v19, v10, v20);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)checkedDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v2 = objc_msgSend(a1, "checkedDepthCount");
  v3 = objc_msgSend(a1, "_errorInStackLayer");
  +[SUCoreErrorInformation codeNameForError:](SUCoreErrorInformation, "codeNameForError:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "checkedIndicationsDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "domain");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3 > 10)
  {
    +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@(%@):%@"), v8, v9, v4);
    objc_msgSend(&stru_1E611E1C8, "stringByAppendingString:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@:%@"), v7, v4);
    objc_msgSend(&stru_1E611E1C8, "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v2 <= 0)
  {
    v20 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(a1, "localizedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR(" | %@"), v12);
    objc_msgSend(v10, "stringByAppendingString:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v4;
  }
  else
  {
    objc_msgSend(a1, "checkedForDepthIndex:", v2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[SUCoreErrorInformation layerForError:](SUCoreErrorInformation, "layerForError:", v12);
    +[SUCoreErrorInformation codeNameForError:](SUCoreErrorInformation, "codeNameForError:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v12, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 > 10)
    {
      +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", v13);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v15, "initWithFormat:", CFSTR("_%d_%@(%@):%@ | %@"), v2, v16, v17, v14, v18);
      objc_msgSend(v10, "stringByAppendingString:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)v21;
    }
    else
    {
      objc_msgSend(v12, "localizedDescription");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("_%d_%@:%@ | %@"), v2, v16, v14, v17);
      objc_msgSend(v10, "stringByAppendingString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v10 = (void *)v17;
  }

  if (v5)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\n%@"), v5);
    objc_msgSend(v19, "stringByAppendingString:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v23;
  }

  return v19;
}

- (id)checkedIndicationsDescription
{
  int v1;
  void *v2;
  uint64_t i;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = objc_msgSend(a1, "checkedIndications");
  v2 = 0;
  for (i = 0; i != 5; ++i)
  {
    if ((v1 & (1 << i)) != 0)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      +[SUCoreErrorAttributes descriptionForIndication:](SUCoreErrorAttributes, "descriptionForIndication:");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      if (v2)
      {
        objc_msgSend(v4, "stringWithFormat:", CFSTR("\n-> %@"), v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringByAppendingString:", v7);
        v8 = objc_claimAutoreleasedReturnValue();

        v2 = (void *)v8;
      }
      else
      {
        objc_msgSend(v4, "stringWithFormat:", CFSTR("-> %@"), v5);
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  return v2;
}

- (int64_t)checkedIndications
{
  int64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = +[SUCoreErrorInformation allIndicationsForError:](SUCoreErrorInformation, "allIndicationsForError:", a1);
  v3 = objc_msgSend(a1, "checkedDepthCount");
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = v3;
    while (1)
    {
      objc_msgSend(a1, "checkedForDepthIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        break;
      v2 |= +[SUCoreErrorInformation allIndicationsForError:](SUCoreErrorInformation, "allIndicationsForError:", v6);
      --v5;

      if (!v5)
        return v2;
    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "checkedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109634;
      v11[1] = v4;
      v12 = 1024;
      v13 = v5;
      v14 = 2114;
      v15 = v10;
      _os_log_error_impl(&dword_1B05B8000, v8, OS_LOG_TYPE_ERROR, "[CORE_ERROR] {checkedIndications} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot determine if generic failure for error: %{public}@", (uint8_t *)v11, 0x18u);

    }
  }
  return v2;
}

- (uint64_t)_checkedIsSafe:()SUCoreError
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a1;
  if (!v4)
    return 1;
  v5 = v4;
  v6 = *MEMORY[0x1E0CB3388];
  while (1)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB35C8], "_checkedIsSafeUserInfo:", v5);
    if (!(_DWORD)v7 || a3 == 0)
      break;
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v7 = 1;
      break;
    }
    objc_msgSend(v5, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeObjectForKey:ofClass:", v6, objc_opt_class());
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
    if (!v11)
    {
      v5 = 0;
      break;
    }
  }

  return v7;
}

- (uint64_t)checkedDepthCount
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v1, "safeObjectForKey:ofClass:", *MEMORY[0x1E0CB3388], objc_opt_class());
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = 0;
    v6 = v1;
    do
    {
      ++v5;
      objc_msgSend(v4, "userInfo");
      v1 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v1, "safeObjectForKey:ofClass:", v2, objc_opt_class());
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
      v6 = v1;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (uint64_t)_checkedIsSafeUserInfo:()SUCoreError
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 1;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke;
    v8[3] = &unk_1E611C780;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_deepestWithLayer
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(a1, "checkedDepthCount");
  if (v2 < 1)
    goto LABEL_9;
  v3 = v2;
  do
  {
    objc_msgSend(a1, "checkedForDepthIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_errorInStackLayer") > 10)
    {
      v5 = v4;
    }
    else
    {
      v5 = 0;
      --v3;
    }

  }
  while (!v5 && v3 > 0);
  if (!v5)
  {
LABEL_9:
    if (objc_msgSend(a1, "_errorInStackLayer") >= 11)
      v5 = a1;
    else
      v5 = 0;
  }
  return v5;
}

- (int64_t)_errorInStackLayer
{
  return +[SUCoreErrorInformation layerForError:](SUCoreErrorInformation, "layerForError:", a1);
}

- (id)checkedDomain
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_deepestWithLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)checkedCode
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_deepestWithLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "code");
  else
    v3 = -1;

  return v3;
}

- (uint64_t)checkedLayer
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_deepestWithLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "_errorInStackLayer");
  else
    v3 = 10;

  return v3;
}

- (id)checkedOfLayer:()SUCoreError
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = objc_msgSend(a1, "checkedDepthCount");
  if (v5 < 1)
    goto LABEL_9;
  v6 = v5;
  do
  {
    objc_msgSend(a1, "checkedForDepthIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_errorInStackLayer") == a3)
    {
      v8 = v7;
    }
    else
    {
      v8 = 0;
      --v6;
    }

  }
  while (!v8 && v6 > 0);
  if (!v8)
  {
LABEL_9:
    objc_msgSend(a1, "_errorInStackOfLayer:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)checkedUserInfo
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_deepestWithLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)checkedSystemPartitionSize
{
  void *v2;
  NSObject *v3;

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[NSError(SUCoreError) checkedSystemPartitionSize].cold.1(a1, v3);

  return 0;
}

- (unint64_t)shouldFallbackToCustomerScan
{
  return ((unint64_t)objc_msgSend(a1, "checkedIndications") >> 5) & 1;
}

- (int64_t)checkedIndicationsMatchingMask:()SUCoreError
{
  int64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = +[SUCoreErrorInformation indicationsForError:matchingMask:](SUCoreErrorInformation, "indicationsForError:matchingMask:", a1, a3);
  v6 = objc_msgSend(a1, "checkedDepthCount");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = v6;
    while (1)
    {
      objc_msgSend(a1, "checkedForDepthIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v5 |= +[SUCoreErrorInformation indicationsForError:matchingMask:](SUCoreErrorInformation, "indicationsForError:matchingMask:", v9, a3);
      --v8;

      if (!v8)
        return v5;
    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "checkedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109634;
      v14[1] = v7;
      v15 = 1024;
      v16 = v8;
      v17 = 2114;
      v18 = v13;
      _os_log_error_impl(&dword_1B05B8000, v11, OS_LOG_TYPE_ERROR, "[CORE_ERROR] {checkedIndicationsMatchingMask} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot determine if generic failure for error: %{public}@", (uint8_t *)v14, 0x18u);

    }
  }
  return v5;
}

- (__CFString)checkedIndicationsSummary
{
  int v1;
  uint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;

  v1 = objc_msgSend(a1, "checkedIndications");
  v2 = 0;
  v3 = &stru_1E611E1C8;
  do
  {
    if ((v1 & (1 << v2)) != 0)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      +[SUCoreErrorAttributes nameForIndication:](SUCoreErrorAttributes, "nameForIndication:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("|%@"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v7;
    }
    ++v2;
  }
  while (v2 != 5);
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", &stru_1E611E1C8) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("|"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v9;
    v3 = v8;
  }

  return v8;
}

- (id)checkedForDepthIndex:()SUCoreError
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;

  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v4, "safeObjectForKey:ofClass:", *MEMORY[0x1E0CB3388], objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a3 > 1;
  if (v6)
    v8 = a3 < 2;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = 2;
    do
    {
      v10 = v4;
      v11 = v6;
      objc_msgSend(v6, "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "safeObjectForKey:ofClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v9 < a3;
      if (v6)
        v12 = v9 < a3;
      else
        v12 = 0;
      ++v9;
    }
    while (v12);
  }
  if (v7)
    v13 = 0;
  else
    v13 = v6;

  return v13;
}

- (id)checkedNameForCode
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_deepestWithLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    +[SUCoreErrorInformation codeNameForError:](SUCoreErrorInformation, "codeNameForError:", v2);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(a1, "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)checkedSummary
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;

  v2 = objc_msgSend(a1, "checkedDepthCount");
  v3 = objc_msgSend(a1, "_errorInStackLayer");
  +[SUCoreErrorInformation codeNameForError:](SUCoreErrorInformation, "codeNameForError:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "checkedIndicationsSummary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v27 = a1;
  objc_msgSend(a1, "domain");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v26 = (void *)v5;
  if (v3 > 10)
  {
    +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("[%@(%@):%@"), v8, v9, v4);
    objc_msgSend(&stru_1E611E1C8, "stringByAppendingString:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("[%@:%@"), v7, v4);
    objc_msgSend(&stru_1E611E1C8, "stringByAppendingString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v2 < 1)
  {
    v21 = v10;
  }
  else
  {
    v12 = -v2;
    v13 = 1;
    do
    {
      v14 = v4;
      objc_msgSend(v27, "checkedForDepthIndex:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = +[SUCoreErrorInformation layerForError:](SUCoreErrorInformation, "layerForError:", v15);
      +[SUCoreErrorInformation codeNameForError:](SUCoreErrorInformation, "codeNameForError:", v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v15, "domain");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v16 > 10)
      {
        +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v17, "initWithFormat:", CFSTR("_%d_%@(%@):%@"), v13, v19, v20, v4);
        objc_msgSend(v10, "stringByAppendingString:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = (void *)v22;
      }
      else
      {
        v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("_%d_%@:%@"), v13, v18, v4);
        objc_msgSend(v10, "stringByAppendingString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

      ++v13;
      v10 = v21;
    }
    while (v12 + v13 != 1);
  }
  if (v26)
  {
    objc_msgSend(v21, "stringByAppendingString:", v26);
    v23 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v23;
  }
  if ((objc_msgSend(v21, "isEqualToString:", &stru_1E611E1C8) & 1) == 0)
  {
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("]"));
    v24 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v24;
  }

  return v21;
}

- (id)_checkedStackErrorAtDepth:()SUCoreError
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;

  objc_msgSend(a1, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v4, "safeObjectForKey:ofClass:", *MEMORY[0x1E0CB3388], objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = a3 < 2;
  else
    v7 = 1;
  if (!v7)
  {
    for (i = 2; ; ++i)
    {
      v9 = v6;
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeObjectForKey:ofClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)(i - 1) >= 4)
        break;
      if (v6)
        v11 = i < a3;
      else
        v11 = 0;
      if (!v11)
        return v6;
    }

    v6 = 0;
  }
  return v6;
}

- (int64_t)_checkedIndicationsMatching:()SUCoreError
{
  int64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = +[SUCoreErrorInformation indicationsForError:matchingMask:](SUCoreErrorInformation, "indicationsForError:matchingMask:", a1, a3);
  v6 = objc_msgSend(a1, "checkedDepthCount");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = v6;
    while (1)
    {
      objc_msgSend(a1, "checkedForDepthIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v5 |= +[SUCoreErrorInformation indicationsForError:matchingMask:](SUCoreErrorInformation, "indicationsForError:matchingMask:", v9, a3);
      --v8;

      if (!v8)
        return v5;
    }
    +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "checkedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109634;
      v14[1] = v7;
      v15 = 1024;
      v16 = v8;
      v17 = 2114;
      v18 = v13;
      _os_log_error_impl(&dword_1B05B8000, v11, OS_LOG_TYPE_ERROR, "[CORE_ERROR] {_checkedIndicationsMatching} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot determine all indications for error: %{public}@", (uint8_t *)v14, 0x18u);

    }
  }
  return v5;
}

- (id)_errorInStackOfLayer:()SUCoreError
{
  id v4;

  if (+[SUCoreErrorInformation layerForError:](SUCoreErrorInformation, "layerForError:", a1) == a3)
    v4 = a1;
  else
    v4 = 0;
  return v4;
}

+ (id)buildCheckedSUCoreError:()SUCoreError underlying:description:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = a5;
  objc_msgSend(v7, "buildCheckedError:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_buildCheckedErrorForDomain:withCode:safeUnderlying:description:", CFSTR("SUCoreError"), a3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = a5;
  objc_msgSend(v7, "buildCheckedError:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_buildCheckedErrorForDomain:withCode:safeUnderlying:description:", CFSTR("SUCoreError"), a3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[NSError(SUCoreError) buildAndLogCheckedSUCoreError:underlying:description:].cold.1((uint64_t)v10, v12, v13);

  return v10;
}

+ (unint64_t)_checkedDepthCount:()SUCoreError
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v3, "safeObjectForKey:ofClass:", *MEMORY[0x1E0CB3388], objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
    while (1)
    {
      v7 = v5;
      objc_msgSend(v5, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeObjectForKey:ofClass:", v4, objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 && v6 >= 4)
        break;
      ++v6;
      if (!v5)
        return v6;
    }

  }
  return 0;
}

+ (id)_buildCheckedErrorForDomain:()SUCoreError withCode:safeUnderlying:description:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_opt_new();
  +[SUCoreErrorInformation codeNameForDomain:withCode:](SUCoreErrorInformation, "codeNameForDomain:withCode:", v9, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v11)
    v15 = objc_msgSend(v14, "initWithFormat:", CFSTR("[%@] %@"), v13, v11);
  else
    v15 = objc_msgSend(v14, "initWithFormat:", CFSTR("[%@]"), v13, v19);
  v16 = (void *)v15;
  objc_msgSend(v12, "setSafeObject:forKey:", v15, *MEMORY[0x1E0CB2D50]);
  if (v10)
    objc_msgSend(v12, "setSafeObject:forKey:", v10, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v9, a4, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)checkedSystemPartitionSize
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "checkedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_2(&dword_1B05B8000, a2, v4, "[CORE_ERROR] {checkedSystemPartitionSize} system partition size error attribute not yet implemented | cannot provide system partition size for error: %{public}@", (uint8_t *)&v5);

}

+ (void)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1B05B8000, a2, a3, "Error: %@", (uint8_t *)&v3);
}

@end
