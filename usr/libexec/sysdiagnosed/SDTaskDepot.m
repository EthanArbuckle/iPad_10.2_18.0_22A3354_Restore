@implementation SDTaskDepot

+ (id)sharedTaskDepot
{
  if (qword_1000B98B0 != -1)
    dispatch_once(&qword_1000B98B0, &stru_100099C60);
  return (id)qword_1000B98A8;
}

- (void)recordTaskContainerStart:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tasks"));
  -[SDTaskDepot setTotalTasks:](self, "setTotalTasks:", (char *)objc_msgSend(v5, "count") + -[SDTaskDepot totalTasks](self, "totalTasks"));

  -[SDTaskDepot setTotalTaskContainers:](self, "setTotalTaskContainers:", (char *)-[SDTaskDepot totalTaskContainers](self, "totalTaskContainers") + 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  objc_msgSend(v6, "addObject:", v4);

}

- (void)recordTaskContainerEnd:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  objc_msgSend(v5, "removeObject:", v4);

  -[SDTaskDepot recordTaskEnd](self, "recordTaskEnd");
}

- (void)recordHelperTaskStart
{
  -[SDTaskDepot setTotalTasks:](self, "setTotalTasks:", (char *)-[SDTaskDepot totalTasks](self, "totalTasks") + 1);
  -[SDTaskDepot setNumRunningHelperTasks:](self, "setNumRunningHelperTasks:", (char *)-[SDTaskDepot numRunningHelperTasks](self, "numRunningHelperTasks") + 1);
}

- (void)recordHelperTaskEnd
{
  -[SDTaskDepot setNumRunningHelperTasks:](self, "setNumRunningHelperTasks:", (char *)-[SDTaskDepot numRunningHelperTasks](self, "numRunningHelperTasks") - 1);
  -[SDTaskDepot recordTaskEnd](self, "recordTaskEnd");
}

- (void)recordBlockTaskStart
{
  -[SDTaskDepot setTotalTasks:](self, "setTotalTasks:", (char *)-[SDTaskDepot totalTasks](self, "totalTasks") + 1);
  -[SDTaskDepot setNumRunningBlocks:](self, "setNumRunningBlocks:", (char *)-[SDTaskDepot numRunningBlocks](self, "numRunningBlocks") + 1);
}

- (void)recordBlockTaskEnd
{
  -[SDTaskDepot setNumRunningBlocks:](self, "setNumRunningBlocks:", (char *)-[SDTaskDepot numRunningBlocks](self, "numRunningBlocks") - 1);
  -[SDTaskDepot recordTaskEnd](self, "recordTaskEnd");
}

- (void)recordTaskEnd
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot taskCompletionBlock](self, "taskCompletionBlock"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDTaskDepot taskCompletionBlock](self, "taskCompletionBlock"));
    v4[2]();

  }
  if (-[SDTaskDepot allTasksComplete](self, "allTasksComplete"))
    -[SDTaskDepot continueExecution](self, "continueExecution");
}

- (int64_t)numRunningTaskContainers
{
  void *v3;
  char *v4;
  int64_t v5;
  char *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  v4 = (char *)objc_msgSend(v3, "count");
  v5 = -[SDTaskDepot numRunningHelperTasks](self, "numRunningHelperTasks");
  v6 = &v4[-[SDTaskDepot numRunningBlocks](self, "numRunningBlocks") + v5];

  return (int64_t)v6;
}

- (BOOL)allTasksComplete
{
  return -[SDTaskDepot numRunningTaskContainers](self, "numRunningTaskContainers") < 1;
}

- (void)continueExecution
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TaskDepot unblocking waiting threads", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "stdoutWrite:", CFSTR("TaskDepot unblocking waiting threads"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v4, "log:", CFSTR("TaskDepot unblocking waiting threads"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
  objc_sync_enter(v5);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3 withSemaphore:(id)a4
{
  id v6;
  BOOL v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  dispatch_time_t v32;
  id v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void **v40;
  uint64_t v41;
  intptr_t (*v42)(uint64_t);
  void *v43;
  id v44;
  uint64_t *v45;
  dispatch_time_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint8_t buf[4];
  double v52;

  v6 = a4;
  if (v6)
  {
    if (-[SDTaskDepot allTasksComplete](self, "allTasksComplete"))
    {
      v7 = 1;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      objc_sync_enter(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      v20 = objc_msgSend(v19, "containsObject:", v6);

      if (v20)
      {
        v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v21)
          sub_1000613B4(v21, v22, v23, v24, v25, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v29, "stderrWrite:", CFSTR("Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores."));

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v30, "log:", CFSTR("Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores."));

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      objc_msgSend(v31, "addObject:", v6);

      objc_sync_exit(v18);
      if (a3)
        v32 = dispatch_time(0, 1000000000 * a3);
      else
        v32 = -1;
      v47 = 0;
      v48 = &v47;
      v49 = 0x2020000000;
      v50 = 0;
      v40 = _NSConcreteStackBlock;
      v41 = 3221225472;
      v42 = sub_10004043C;
      v43 = &unk_100099C88;
      v45 = &v47;
      v33 = v6;
      v44 = v33;
      v46 = v32;
      v34 = sub_1000272CC(&v40);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v52 = v34;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Blocked thread for %.1fs while waiting for tasks to complete", buf, 0xCu);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v35, "log:", CFSTR("Blocked thread for %.1fs while waiting for tasks to complete"), *(_QWORD *)&v34, v40, v41, v42, v43);

      if (*((_BYTE *)v48 + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100061338(a3);
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v36, "log:", CFSTR("Timed out waiting for all tasks to complete. Timeout: %llus"), a3);

      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      objc_sync_enter(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot allTasksFinishedSemaphoresArray](self, "allTasksFinishedSemaphoresArray"));
      objc_msgSend(v38, "removeObject:", v33);

      objc_sync_exit(v37);
      v7 = *((_BYTE *)v48 + 24) == 0;

      _Block_object_dispose(&v47, 8);
    }
  }
  else
  {
    v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8)
      sub_100061300(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v16, "stderrWrite:", CFSTR("Semaphore to wait for tasks to complete is nil"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v17, "log:", CFSTR("Semaphore to wait for tasks to complete is nil"));

    v7 = 0;
  }

  return v7;
}

- (BOOL)waitUntilAllTasksComplete:(unint64_t)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot defaultAllTasksFinishedSemaphore](self, "defaultAllTasksFinishedSemaphore"));
  LOBYTE(a3) = -[SDTaskDepot waitUntilAllTasksComplete:withSemaphore:](self, "waitUntilAllTasksComplete:withSemaphore:", a3, v5);

  return a3;
}

- (unint64_t)_reapTasks
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  id obj;
  _QWORD block[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[128];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Trying to reap tasks...", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", CFSTR("Trying to reap tasks..."));

  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDTaskDepot runningTaskContainers](self, "runningTaskContainers"));
  obj = objc_msgSend(v4, "copy");

  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100040700;
        block[3] = &unk_100099CB0;
        block[4] = v8;
        block[5] = buf;
        dispatch_sync(v10, block);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

  v11 = *((_QWORD *)v20 + 3);
  _Block_object_dispose(buf, 8);
  return v11;
}

+ (unint64_t)stopTasks
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  _QWORD block[4];
  id v11;
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stopping TaskDepot.", buf, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", CFSTR("Stopping TaskDepot."));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", CFSTR("Stopping TaskDepot."));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "taskQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040888;
  block[3] = &unk_100098F88;
  v11 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = objc_msgSend(v6, "_reapTasks");
  v8 = dispatch_semaphore_create(0);
  objc_msgSend(v6, "waitUntilAllTasksComplete:withSemaphore:", 60, v8);

  return (unint64_t)v7;
}

+ (void)signalInterrupt
{
  void *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n", v5, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", CFSTR("\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", CFSTR("\nSkipping. To end sysdiagnose, press 'Ctrl+\\'.\n"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v4, "_reapTasks");

}

+ (void)signalStopTasks
{
  void *v2;
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nTerminated, cleaning up subtasks and blocking new ones...\n", buf, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", CFSTR("\nTerminated, cleaning up subtasks and blocking new ones...\n"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", CFSTR("\nTerminated, cleaning up subtasks and blocking new ones...\n"));

  +[SDTaskDepot stopTasks](SDTaskDepot, "stopTasks");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting stop notification", v9, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v4, "log:", CFSTR("Posting stop notification"));

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.sysdiagnose.sysdiagnoseStopped"), 0, 0, 1u);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputDirectory"));
  objc_msgSend(v6, "removeItemAtPath:error:", v8, 0);

}

- (NSString)outputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputDirectory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)totalTasks
{
  return self->_totalTasks;
}

- (void)setTotalTasks:(unint64_t)a3
{
  self->_totalTasks = a3;
}

- (unint64_t)totalTaskContainers
{
  return self->_totalTaskContainers;
}

- (void)setTotalTaskContainers:(unint64_t)a3
{
  self->_totalTaskContainers = a3;
}

- (int)totalFailedTasks
{
  return self->_totalFailedTasks;
}

- (void)setTotalFailedTasks:(int)a3
{
  self->_totalFailedTasks = a3;
}

- (int)totalTimeouts
{
  return self->_totalTimeouts;
}

- (void)setTotalTimeouts:(int)a3
{
  self->_totalTimeouts = a3;
}

- (NSMutableArray)runningTaskContainers
{
  return self->_runningTaskContainers;
}

- (void)setRunningTaskContainers:(id)a3
{
  objc_storeStrong((id *)&self->_runningTaskContainers, a3);
}

- (int64_t)numRunningHelperTasks
{
  return self->_numRunningHelperTasks;
}

- (void)setNumRunningHelperTasks:(int64_t)a3
{
  self->_numRunningHelperTasks = a3;
}

- (int64_t)numRunningBlocks
{
  return self->_numRunningBlocks;
}

- (void)setNumRunningBlocks:(int64_t)a3
{
  self->_numRunningBlocks = a3;
}

- (void)setNumRunningTaskContainers:(int64_t)a3
{
  self->_numRunningTaskContainers = a3;
}

- (SDTaskDepotPushBufferDelegate)pushBufferDelegate
{
  return (SDTaskDepotPushBufferDelegate *)objc_loadWeakRetained((id *)&self->_pushBufferDelegate);
}

- (void)setPushBufferDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pushBufferDelegate, a3);
}

- (OS_dispatch_queue)taskQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTaskQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_semaphore)defaultAllTasksFinishedSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDefaultAllTasksFinishedSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)allTasksFinishedSemaphoresArray
{
  return self->_allTasksFinishedSemaphoresArray;
}

- (void)setAllTasksFinishedSemaphoresArray:(id)a3
{
  objc_storeStrong((id *)&self->_allTasksFinishedSemaphoresArray, a3);
}

- (BOOL)mayStartExecuting
{
  return self->_mayStartExecuting;
}

- (void)setMayStartExecuting:(BOOL)a3
{
  self->_mayStartExecuting = a3;
}

- (BOOL)noTimeout
{
  return self->_noTimeout;
}

- (void)setNoTimeout:(BOOL)a3
{
  self->_noTimeout = a3;
}

- (double)minimumTimeBeforeTimeouts
{
  return self->_minimumTimeBeforeTimeouts;
}

- (void)setMinimumTimeBeforeTimeouts:(double)a3
{
  self->_minimumTimeBeforeTimeouts = a3;
}

- (id)taskCompletionBlock
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setTaskCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_taskCompletionBlock, 0);
  objc_storeStrong((id *)&self->_allTasksFinishedSemaphoresArray, 0);
  objc_storeStrong((id *)&self->_defaultAllTasksFinishedSemaphore, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_destroyWeak((id *)&self->_pushBufferDelegate);
  objc_storeStrong((id *)&self->_runningTaskContainers, 0);
  objc_storeStrong((id *)&self->_outputDirectory, 0);
}

@end
