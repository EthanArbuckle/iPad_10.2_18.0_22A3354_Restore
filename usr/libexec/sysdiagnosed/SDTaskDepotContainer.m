@implementation SDTaskDepotContainer

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  SDTaskDepotContainer *v14;
  void *v15;

  v8 = a6;
  v11 = a3;
  v12 = a7;
  v13 = a4;
  v14 = -[SDContainer initWithName:andDestination:withDelegate:]([SDTaskDepotContainer alloc], "initWithName:andDestination:withDelegate:", v11, v13, v12);

  if (v14)
  {
    -[SDTaskContainer setTimeout:](v14, "setTimeout:", a5);
    -[SDTaskDepotContainer setIsConcurrent:](v14, "setIsConcurrent:", v8);
    -[SDTaskDepotContainer setMayStartExecuting:](v14, "setMayStartExecuting:", 1);
    -[SDContainer setName:](v14, "setName:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[SDTaskDepotContainer setRunningTasks:](v14, "setRunningTasks:", v15);

    -[SDTaskDepotContainer setNumExitedTasks:](v14, "setNumExitedTasks:", 0);
    -[SDTaskDepotContainer setNumReapedTasks:](v14, "setNumReapedTasks:", 0);
    -[SDTaskContainer setTimeoutSource:](v14, "setTimeoutSource:", 0);
    -[SDTaskDepotContainer setNumTimeouts:](v14, "setNumTimeouts:", 0);
    -[SDTaskDepotContainer setCompletionBlock:](v14, "setCompletionBlock:", 0);
    -[SDTaskDepotContainer setWallTimeUsedNS:](v14, "setWallTimeUsedNS:", 0);
    -[SDTaskDepotContainer setCpuTimeUsedNS:](v14, "setCpuTimeUsedNS:", 0);
    -[SDTaskDepotContainer setSequentialTasksQueue:](v14, "setSequentialTasksQueue:", 0);
    -[SDTaskDepotContainer setSequentialTasksSem:](v14, "setSequentialTasksSem:", 0);
  }

  return v14;
}

+ (id)containerWithName:(id)a3 destination:(id)a4 withTimeout:(double)a5 withConcurrency:(BOOL)a6 withDelegate:(id)a7 withCompletionBlock:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v19 = objc_msgSend((id)objc_opt_class(a1, v18), "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", v17, v16, v9, v15, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if (v20)
    objc_msgSend(v20, "setCompletionBlock:", v14);

  return v20;
}

- (BOOL)addSDTasksToContainer:(id)a3
{
  return -[SDTaskDepotContainer addSDTasksToContainer:withTmpOutputDir:](self, "addSDTasksToContainer:withTmpOutputDir:", a3, 0);
}

- (BOOL)addSDTasksToContainer:(id)a3 withTmpOutputDir:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v6 = a3;
  v7 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer destination](self, "destination"));
        v14 = objc_msgSend(v13, "copy");
        objc_msgSend(v12, "setDestination:", v14);

        if (v7)
          -[SDTaskDepotContainer replaceTaskArguments:withSubstitutionKey:withSubstitutionString:](self, "replaceTaskArguments:withSubstitutionKey:withSubstitutionString:", v12, CFSTR("<TMPOUTPUTDIR>"), v7);
        v15 = objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
        if (v15)
        {
          v16 = (void *)v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "providedPIDorProcess"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer runtimeFlagDelegate](self, "runtimeFlagDelegate"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "providedPIDorProcess"));
            -[SDTaskDepotContainer replaceTaskArguments:withSubstitutionKey:withSubstitutionString:](self, "replaceTaskArguments:withSubstitutionKey:withSubstitutionString:", v12, CFSTR("<PID>"), v20);

          }
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "launchPath"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arguments"));
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR(" ")));

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arguments"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "componentsJoinedByString:", CFSTR(" ")));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", v26));

        }
        if (-[SDContainer evaluateCollectionFlagsWithOverlay:withName:](self, "evaluateCollectionFlagsWithOverlay:withName:", objc_msgSend(v12, "runtimeChecks"), v21))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer units](self, "units"));
          objc_msgSend(v27, "addObject:", v12);

        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v9);
  }

  return 1;
}

- (void)markTaskAsDone:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  double v15;

  v4 = a3;
  v5 = sub_100026BC4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((unint64_t)v4 + 1 >= 2 && os_signpost_enabled(v6))
  {
    v14 = 134217984;
    v15 = (double)(unint64_t)objc_msgSend(v4, "cpuTimeUsedNS") / 1000000000.0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v4, "CLI Task", "CPU time: %fs", (uint8_t *)&v14, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
    dispatch_semaphore_signal(v9);

  }
  objc_msgSend(v4, "executionTime");
  -[SDTaskDepotContainer setWallTimeUsedNS:](self, "setWallTimeUsedNS:", (char *)-[SDTaskDepotContainer wallTimeUsedNS](self, "wallTimeUsedNS") + (unint64_t)(v10 * 1000000000.0));
  -[SDTaskDepotContainer setCpuTimeUsedNS:](self, "setCpuTimeUsedNS:", (char *)objc_msgSend(v4, "cpuTimeUsedNS") + -[SDTaskDepotContainer cpuTimeUsedNS](self, "cpuTimeUsedNS"));
  -[SDTaskDepotContainer setNumExitedTasks:](self, "setNumExitedTasks:", (char *)-[SDTaskDepotContainer numExitedTasks](self, "numExitedTasks") + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  objc_msgSend(v11, "removeObject:", v4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  v13 = objc_msgSend(v12, "count");

  if (!v13)
    -[SDTaskDepotContainer endExecution](self, "endExecution");

}

- (id)createTaskHandlers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  SDTaskDepotContainer *v19;
  id v20;
  _QWORD handler[5];
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskQueue"));
  v7 = sub_10002734C(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v4, "setExitSource:", v8);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exitSource"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100042080;
  handler[3] = &unk_100099260;
  handler[4] = self;
  v10 = v4;
  v22 = v10;
  dispatch_source_set_event_handler(v9, handler);

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "exitSource"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100042144;
  v18 = &unk_100099260;
  v19 = self;
  v20 = v10;
  v12 = v10;
  dispatch_source_set_cancel_handler(v11, &v15);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "exitSource", v15, v16, v17, v18, v19));
  return v13;
}

- (void)endExecution
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  _QWORD v43[5];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  double v59;
  __int16 v60;
  int64_t v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "taskQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDTaskContainer timeoutSource](self, "timeoutSource"));
    dispatch_source_cancel(v6);

  }
  v7 = (double)-[SDTaskDepotContainer wallTimeUsedNS](self, "wallTimeUsedNS");
  v8 = (double)-[SDTaskDepotContainer cpuTimeUsedNS](self, "cpuTimeUsedNS") / 1000000000.0;
  -[SDTaskContainer timeout](self, "timeout");
  if (v9 == 0.0)
  {
    v11 = 0.0;
  }
  else
  {
    -[SDTaskContainer timeout](self, "timeout");
    v11 = v8 / v10 * 100.0;
  }
  v12 = v7 / 1000000000.0;
  v13 = -[SDTaskDepotContainer numExitedTasks](self, "numExitedTasks");
  v14 = v13 - -[SDTaskDepotContainer numReapedTasks](self, "numReapedTasks");
  v15 = sub_100026C34();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
    v19 = objc_msgSend(v18, "count");
    v20 = v8 / v12;
    -[SDTaskContainer timeout](self, "timeout");
    *(_DWORD *)buf = 138414338;
    v45 = v17;
    v46 = 2048;
    v47 = v14;
    v48 = 2048;
    v49 = v19;
    v50 = 2048;
    v51 = v7 / 1000000000.0;
    v52 = 2048;
    v53 = v8;
    v54 = 2048;
    v55 = v8 / v12;
    v56 = 2048;
    v57 = v21;
    v58 = 2048;
    v59 = v11;
    v60 = 2048;
    v61 = -[SDTaskDepotContainer numTimeouts](self, "numTimeouts");
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Task Container %@ finished %lu/%lu tasks [wall seconds:%.1f] [CPU seconds:%.1f] [CPU/wall: %.1f%%] [timeout: %.1f] [CPU/timeout: %.1f%%] [numTimeouts: %ld] ", buf, 0x5Cu);

  }
  else
  {
    v20 = v8 / v12;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
  v25 = objc_msgSend(v24, "count");
  -[SDTaskContainer timeout](self, "timeout");
  objc_msgSend(v22, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Task Container %@ finished %lu/%lu tasks [wall seconds:%.1f] [CPU seconds:%.1f] [CPU/wall: %.1f%%] [timeout: %.1f] [CPU/timeout: %.1f%%] [numTimeouts: %ld] "), v23, v14, v25, *(_QWORD *)&v12, *(_QWORD *)&v8, *(_QWORD *)&v20, v26, *(_QWORD *)&v11, -[SDTaskDepotContainer numTimeouts](self, "numTimeouts"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer completionBlock](self, "completionBlock"));
  if (v27)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100042678;
    v43[3] = &unk_100098F88;
    v43[4] = self;
    v28 = sub_1000272CC(v43);
    if (v28 > 1.0)
    {
      v29 = sub_100026C34();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_100061508(self);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      objc_msgSend(v31, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Completion block for %@ took too long: %.1fs (allowed: %.1fs)"), v32, *(_QWORD *)&v28, 0x3FF0000000000000);

    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pushBufferDelegate"));
  if (v34)
  {
    v35 = (void *)v34;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pushBufferDelegate"));
    v37 = objc_opt_respondsToSelector(v36, "writeReportForTasks:withTimeout:concurrently:withDepotName:");

    if ((v37 & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pushBufferDelegate"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
      -[SDTaskContainer timeout](self, "timeout");
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      objc_msgSend(v38, "writeReportForTasks:withTimeout:concurrently:withDepotName:", v39, 1, v42, v41);

    }
  }
  objc_msgSend(v33, "recordTaskContainerEnd:", self);

}

- (unint64_t)reapTasks
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SDTaskDepotContainer setMayStartExecuting:](self, "setMayStartExecuting:", 0);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
    v6 = objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v12, "isRunning"))
          {
            ++v9;
            objc_msgSend(v12, "stop");
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v13 = sub_100026C34();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 134218242;
      v24 = v9;
      v25 = 2112;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Reaping %lu tasks for container: %@", buf, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    objc_msgSend(v16, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Reaping %lu tasks for container: %@"), v9, v17);

  }
  else
  {
    if (-[SDTaskDepotContainer mayStartExecuting](self, "mayStartExecuting"))
    {
      -[SDTaskDepotContainer setMayStartExecuting:](self, "setMayStartExecuting:", 0);
      -[SDTaskDepotContainer endExecution](self, "endExecution");
    }
    return 0;
  }
  return v9;
}

- (id)timeoutMetricsString
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;

  v3 = -[SDTaskDepotContainer numTimeouts](self, "numTimeouts");
  -[SDTaskContainer timeout](self, "timeout");
  v5 = v4;
  -[SDTaskContainer elapsedTime](self, "elapsedTime");
  v7 = v6;
  v8 = (double)-[SDTaskDepotContainer countCPUTimeUsedNS](self, "countCPUTimeUsedNS") / 1000000000.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(numTimeouts: %ld) (timeout: %f) (elapsed time: %.2fs) (CPU time used: %.2f) (task containers running: %ld)"), v3, v5, v7, *(_QWORD *)&v8, objc_msgSend(v9, "numRunningTaskContainers")));

  return v10;
}

- (unint64_t)countCPUTimeUsedNS
{
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "cpuTimeUsedNS");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)exceededAllowedCPUTime:(unint64_t)a3
{
  double v3;
  double v4;

  v3 = (double)a3;
  -[SDTaskContainer timeout](self, "timeout");
  return v4 * 1000000000.0 <= v3;
}

- (BOOL)ranForMinimumTime
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[SDTaskContainer timeout](self, "timeout");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v5, "minimumTimeBeforeTimeouts");
  v7 = v4 + v6;

  -[SDTaskContainer elapsedTime](self, "elapsedTime");
  return v8 >= v7;
}

- (BOOL)ranForMaximumTime
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  -[SDTaskContainer elapsedTime](self, "elapsedTime");
  v4 = v3;
  -[SDTaskContainer timeout](self, "timeout");
  if (v5 >= 60.0)
    v6 = v5;
  else
    v6 = 60.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v7, "minimumTimeBeforeTimeouts");
  v9 = v4 >= v6 + v8;

  return v9;
}

- (BOOL)isRunningAlone
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  if (objc_msgSend(v3, "numRunningTaskContainers") == (id)1)
    v4 = 1;
  else
    v4 = -[SDTaskContainer runByItself](self, "runByItself");

  return v4;
}

- (void)startTimeout
{
  _QWORD v3[5];

  -[SDTaskContainer timeout](self, "timeout");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100042C60;
  v3[3] = &unk_100098F88;
  v3[4] = self;
  -[SDTaskContainer startTimeout:withHandler:](self, "startTimeout:withHandler:", v3);
}

- (void)replaceTaskArguments:(id)a3 withSubstitutionKey:(id)a4 withSubstitutionString:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arguments"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arguments"));
    v12 = objc_msgSend(v11, "mutableCopy");

    if (objc_msgSend(v12, "count"))
    {
      v13 = 0;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arguments"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v13));

        if (objc_msgSend(v15, "rangeOfString:", v8) != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", v8, v9));
          v17 = sub_100026C34();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v22 = v8;
            v23 = 2112;
            v24 = v15;
            v25 = 2112;
            v26 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ Substitution found: %@ --> %@", buf, 0x20u);
          }

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v19, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ Substitution found: %@ --> %@"), v8, v15, v16);

          objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v13, v16);
        }

        ++v13;
      }
      while ((unint64_t)objc_msgSend(v12, "count") > v13);
    }
    v20 = objc_msgSend(v12, "copy");
    objc_msgSend(v7, "setArguments:", v20);

  }
  else
  {
    objc_msgSend(v7, "setArguments:", &__NSArray0__struct);
  }

}

- (BOOL)startTasks
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _QWORD v47[5];
  _QWORD block[6];
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  if ((objc_msgSend(v5, "noTimeout") & 1) != 0)
  {

  }
  else
  {
    -[SDTaskContainer timeout](self, "timeout");
    v7 = v6;

    if (v7 > 0.0)
      -[SDTaskDepotContainer startTimeout](self, "startTimeout");
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
          dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

        }
        if (!-[SDTaskDepotContainer mayStartExecuting](self, "mayStartExecuting"))
        {
          v28 = sub_100026C34();
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
            *(_DWORD *)buf = 138412546;
            v55 = v30;
            v56 = 2112;
            v57 = v31;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[%@ container] Can't start task %@ in because the container has been stopped", buf, 0x16u);

          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
          objc_msgSend(v32, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("[%@ container] Can't start task %@ in because the container has been stopped"), v33, v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
          if (v35)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
            v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "taskQueue"));
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_1000437FC;
            v49[3] = &unk_100098F88;
            v49[4] = self;
            dispatch_sync(v37, v49);

            v38 = objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
            dispatch_semaphore_signal(v38);

          }
          else
          {
            -[SDTaskDepotContainer endExecution](self, "endExecution");
          }
          goto LABEL_29;
        }
        if ((objc_msgSend(v14, "createChild") & 1) != 0)
        {
          v17 = objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer createTaskHandlers:](self, "createTaskHandlers:", v14));
          dispatch_resume(v17);
          ++v11;
        }
        else
        {
          v18 = sub_100026C34();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
            *(_DWORD *)buf = 138412546;
            v55 = v26;
            v56 = 2112;
            v57 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create child process for task %@ in group %@", buf, 0x16u);

          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "description"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
          objc_msgSend(v20, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to create child process for task %@ in group %@"), v21, v22);

          objc_msgSend(v14, "setStopped:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));

          if (v23)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
            v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "taskQueue"));
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100043804;
            block[3] = &unk_100099260;
            block[4] = self;
            block[5] = v14;
            dispatch_sync(v25, block);

            v17 = objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
            dispatch_semaphore_signal(v17);
          }
          else
          {
            v17 = objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer runningTasks](self, "runningTasks"));
            -[NSObject removeObject:](v17, "removeObject:", v14);
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      if (v10)
        continue;
      break;
    }
LABEL_29:

    if (v11)
      return 1;
  }
  else
  {

  }
  v40 = sub_100026C34();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    sub_100061630(self);

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
  objc_msgSend(v42, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("No tasks were created for %@"), v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksSem](self, "sequentialTasksSem"));
  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "taskQueue"));
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100043844;
    v47[3] = &unk_100098F88;
    v47[4] = self;
    dispatch_sync(v46, v47);

  }
  else
  {
    -[SDTaskDepotContainer endExecution](self, "endExecution");
  }
  return 0;
}

- (BOOL)startTasksSequentially
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  _QWORD block[5];

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.sysdiagnose.SDTaskDepotContainer.sequentialTasksQueue", v4);
  -[SDTaskDepotContainer setSequentialTasksQueue:](self, "setSequentialTasksQueue:", v5);

  v6 = dispatch_semaphore_create(1);
  -[SDTaskDepotContainer setSequentialTasksSem:](self, "setSequentialTasksSem:", v6);

  v7 = objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer sequentialTasksQueue](self, "sequentialTasksQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043920;
  block[3] = &unk_100098F88;
  block[4] = self;
  dispatch_async(v7, block);

  return 1;
}

- (BOOL)_execute
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint8_t buf[4];
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  if ((objc_msgSend(v3, "mayStartExecuting") & 1) != 0)
  {
    objc_msgSend(v3, "recordTaskContainerStart:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepotContainer tasks](self, "tasks"));
    v5 = objc_msgSend(v4, "count");

    if (!-[SDTaskDepotContainer isConcurrent](self, "isConcurrent") && (unint64_t)v5 <= 1)
    {
      v6 = sub_100026C34();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000616A8(self);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      objc_msgSend(v8, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Container %@ shouldn't be marked as not concurrent because it only has %lu task"), v9, v5);

      -[SDTaskDepotContainer setIsConcurrent:](self, "setIsConcurrent:", 1);
    }
    if (-[SDTaskDepotContainer isConcurrent](self, "isConcurrent"))
      v10 = -[SDTaskDepotContainer startTasks](self, "startTasks");
    else
      v10 = -[SDTaskDepotContainer startTasksSequentially](self, "startTasksSequentially");
    v16 = v10;
  }
  else
  {
    v11 = sub_100026C34();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@ container] Can't execute because sysdiagnose has stopped", buf, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDContainer name](self, "name"));
    objc_msgSend(v14, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("[%@ container] Can't execute because sysdiagnose has stopped"), v15);

    v16 = 0;
  }

  return v16;
}

- (BOOL)isConcurrent
{
  return self->_isConcurrent;
}

- (void)setIsConcurrent:(BOOL)a3
{
  self->_isConcurrent = a3;
}

- (BOOL)mayStartExecuting
{
  return self->_mayStartExecuting;
}

- (void)setMayStartExecuting:(BOOL)a3
{
  self->_mayStartExecuting = a3;
}

- (void)setTasks:(id)a3
{
  objc_storeStrong((id *)&self->_tasks, a3);
}

- (NSMutableArray)runningTasks
{
  return self->_runningTasks;
}

- (void)setRunningTasks:(id)a3
{
  objc_storeStrong((id *)&self->_runningTasks, a3);
}

- (int64_t)numExitedTasks
{
  return self->_numExitedTasks;
}

- (void)setNumExitedTasks:(int64_t)a3
{
  self->_numExitedTasks = a3;
}

- (int64_t)numReapedTasks
{
  return self->_numReapedTasks;
}

- (void)setNumReapedTasks:(int64_t)a3
{
  self->_numReapedTasks = a3;
}

- (int64_t)numTimeouts
{
  return self->_numTimeouts;
}

- (void)setNumTimeouts:(int64_t)a3
{
  self->_numTimeouts = a3;
}

- (unint64_t)cpuTimeUsedNS
{
  return self->_cpuTimeUsedNS;
}

- (void)setCpuTimeUsedNS:(unint64_t)a3
{
  self->_cpuTimeUsedNS = a3;
}

- (unint64_t)wallTimeUsedNS
{
  return self->_wallTimeUsedNS;
}

- (void)setWallTimeUsedNS:(unint64_t)a3
{
  self->_wallTimeUsedNS = a3;
}

- (OS_dispatch_queue)sequentialTasksQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSequentialTasksQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (OS_dispatch_semaphore)sequentialTasksSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSequentialTasksSem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_sequentialTasksSem, 0);
  objc_storeStrong((id *)&self->_sequentialTasksQueue, 0);
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
