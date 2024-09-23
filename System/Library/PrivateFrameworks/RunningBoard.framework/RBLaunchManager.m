@implementation RBLaunchManager

- (id)_resolveNewProcessForInstance:(id)a3 requestIdentity:(id)a4 context:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  RBLaunchTracker *launchTracker;
  void *v17;
  id WeakRetained;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBLaunchdProperties propertiesForPid:](RBLaunchdProperties, "propertiesForPid:", objc_msgSend(v13, "pid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    rbs_general_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:].cold.2();

  }
  if (objc_msgSend(v14, "hasBackoff"))
  {
    launchTracker = self->_launchTracker;
    objc_msgSend(v10, "identity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBLaunchTracker trackLaunchOfIdentity:](launchTracker, "trackLaunchOfIdentity:", v17);

  }
  if (objc_msgSend(v11, "osServiceType") == 3 && v14 && (objc_msgSend(v14, "isAngel") & 1) == 0)
  {
    rbs_general_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:].cold.1();

    -[RBLaunchdJobManager removeJobWithInstance:error:](self->_jobManager, "removeJobWithInstance:error:", v10, 0);
    if (a6)
    {
      v27 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKey:", CFSTR("Unsupported Angel launch request."), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v27, 5, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      *a6 = v29;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_lifecycleQueue_addProcessWithInstance:properties:", v10, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[RBLaunchManager _validateBundleIDForProcess:launchedWithContext:](self, "_validateBundleIDForProcess:launchedWithContext:", v19, v12);
      v20 = v19;
    }
    else
    {
      rbs_general_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30 = 138543362;
        v31 = v10;
        _os_log_impl(&dword_21A8B4000, v21, OS_LOG_TYPE_DEFAULT, "Failed to create process object for %{public}@", (uint8_t *)&v30, 0xCu);
      }

      -[RBLaunchdJobManager removeJobWithInstance:error:](self->_jobManager, "removeJobWithInstance:error:", v10, 0);
      if (a6)
      {
        v22 = *MEMORY[0x24BE80E48];
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", CFSTR("Launched process exited during launch."), *MEMORY[0x24BDD0FD8]);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v22, 5, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        *a6 = v24;
      }
    }

  }
  return v19;
}

- (void)_validateBundleIDForProcess:(id)a3 launchedWithContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a3;
  objc_msgSend(a4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8 && (objc_msgSend(v8, "isEqualToString:", v6) & 1) == 0)
  {
    rbs_process_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[RBLaunchManager _validateBundleIDForProcess:launchedWithContext:].cold.1();

  }
}

- (id)executeLaunchRequest:(id)a3 existingProcess:(id)a4 requestIdentity:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  RBLaunchdJobManager *jobManager;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  char v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v43;
  void *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_msgSend(v12, "isExtension");
  if (v11 && (v13 & 1) == 0)
  {
    rbs_process_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v48 = v12;
      v49 = 2114;
      v50 = v11;
      _os_log_impl(&dword_21A8B4000, v14, OS_LOG_TYPE_INFO, "%{public}@ is already running as %{public}@", buf, 0x16u);
    }

    if (a6)
    {
      v15 = *MEMORY[0x24BE80E48];
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", CFSTR("The process was already running."), *MEMORY[0x24BDD0FD8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v15, 2, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      *a6 = v17;
    }
    v18 = v11;
    goto LABEL_38;
  }
  v19 = v12;
  if ((objc_msgSend(v19, "isEmbeddedApplication") & 1) != 0
    || (objc_msgSend(v19, "hasConsistentLaunchdJob") & 1) != 0
    || objc_msgSend(v19, "isExtension"))
  {

  }
  else
  {
    v37 = objc_msgSend(v19, "isDext");

    if ((v37 & 1) == 0)
    {
      rbs_process_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v19;
        _os_log_impl(&dword_21A8B4000, v38, OS_LOG_TYPE_INFO, "%{public}@ could not be launched", buf, 0xCu);
      }

      if (a6)
      {
        v39 = *MEMORY[0x24BE80E48];
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", CFSTR("Launch prevented due to invalid parameters; only apps, extensions or daemons can be launched by RunningBoard"),
          *MEMORY[0x24BDD0FD8]);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v39, 1, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        *a6 = v41;
        goto LABEL_38;
      }
LABEL_35:
      v18 = 0;
      goto LABEL_38;
    }
  }
  if (!v11 && !-[RBLaunchManager _checkLaunchForBackoff:error:](self, "_checkLaunchForBackoff:error:", v19, a6))
    goto LABEL_35;
  objc_msgSend(v10, "_additionalEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  RBSStringForKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v10, "setHomeDirectory:", v21);
  objc_msgSend(v10, "_additionalEnvironment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  RBSStringForKey();
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v10, "setTmpDirectory:", v23);
  jobManager = self->_jobManager;
  v46 = 0;
  -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:](jobManager, "createAndLaunchWithIdentity:context:error:", v19, v10, &v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v46;
  v27 = v26;
  if (v25)
  {
    v45 = v26;
    if (!v11)
      goto LABEL_24;
    objc_msgSend(v11, "identifier");
    v43 = v10;
    v28 = v23;
    v29 = a6;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v44 = v21;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    v21 = v44;
    a6 = v29;
    v23 = v28;
    v10 = v43;
    if (v32)
    {
      rbs_process_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v48 = v19;
        v49 = 2114;
        v50 = v34;
        _os_log_impl(&dword_21A8B4000, v33, OS_LOG_TYPE_INFO, "returning existing extension %{public}@ already running as pid %{public}@", buf, 0x16u);

        v21 = v44;
      }

      v35 = v11;
    }
    else
    {
LABEL_24:
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:](self, "_resolveNewProcessForInstance:requestIdentity:context:withError:", v25, v19, v10, a6);
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v35;
    v27 = v45;
  }
  else
  {
    rbs_general_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[RBLaunchManager executeLaunchRequest:existingProcess:requestIdentity:withError:].cold.1();

    if (a6)
    {
      _errorWithRequestCodeAndInfoBuilder((void *)*MEMORY[0x24BE80E48], 5, CFSTR("Launch failed."), v27, 0);
      v18 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }

LABEL_38:
  return v18;
}

- (BOOL)_checkLaunchForBackoff:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v6 = a3;
  -[RBLaunchTracker nextAllowedLaunchOfIdentity:](self->_launchTracker, "nextAllowedLaunchOfIdentity:", v6);
  v8 = v7;
  if (v7 != 0.0)
  {
    rbs_general_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[RBLaunchManager _checkLaunchForBackoff:error:].cold.1((uint64_t)v6, v9, v8);

    if (a4)
    {
      v10 = *MEMORY[0x24BE80E48];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke;
      v14[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
      *(double *)&v14[4] = v8;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", CFSTR("Launch Request throttled."), *MEMORY[0x24BDD0FD8]);
      __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke((uint64_t)v14, v11);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v10, 6, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      *a4 = v12;
    }
  }

  return v8 == 0.0;
}

- (RBLaunchManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBLaunchManager.m"), 114, CFSTR("-init is not allowed on RBProcessManager"));

  return 0;
}

- (RBLaunchManager)initWithJobManager:(id)a3 timeProvider:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  RBLaunchManager *v12;
  RBLaunchManager *v13;
  RBLaunchTracker *v14;
  RBLaunchTracker *launchTracker;
  RBLaunchManager *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)RBLaunchManager;
  v12 = -[RBLaunchManager init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_jobManager, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = -[RBLaunchTracker initWithTimeProvider:]([RBLaunchTracker alloc], "initWithTimeProvider:", v10);
    launchTracker = v13->_launchTracker;
    v13->_launchTracker = v14;

    v16 = v13;
  }

  return v13;
}

void __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithDouble:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BE80E60]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTracker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_jobManager, 0);
}

- (void)_validateBundleIDForProcess:launchedWithContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_fault_impl(&dword_21A8B4000, v1, OS_LOG_TYPE_FAULT, "RunningBoard launch requested for identifier %{public}@ launched process with different identifier %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_checkLaunchForBackoff:(double)a3 error:.cold.1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl(&dword_21A8B4000, a2, OS_LOG_TYPE_ERROR, "Launch throttled for %{public}@ until %lf", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_resolveNewProcessForInstance:requestIdentity:context:withError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_21A8B4000, v0, OS_LOG_TYPE_FAULT, "Angel launch attempted for non-angel %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)_resolveNewProcessForInstance:requestIdentity:context:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "New process launch resulted in nil properties for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)executeLaunchRequest:existingProcess:requestIdentity:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Launch failed with %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
