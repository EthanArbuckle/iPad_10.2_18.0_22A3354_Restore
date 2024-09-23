@implementation BFFFlowStarter

- (BFFFlowStarter)initWithFlowDiverter:(id)a3
{
  id v5;
  BFFFlowStarter *v6;
  BFFFlowStarter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BFFFlowStarter;
  v6 = -[BFFFlowStarter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_diverter, a3);

  return v7;
}

- (void)prepareWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[BFFFlowStarter diverter](self, "diverter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BFFFlowStarter diverter](self, "diverter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareWithCompletion:", v6);

  }
  else if (v6)
  {
    v6[2]();
  }

}

- (BOOL)controllerNeedsToRunForClass:(Class)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  Class v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[BFFFlowStarter diverter](self, "diverter");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[BFFFlowStarter diverter](self, "diverter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v25 = 0;
      v8 = objc_msgSend(v7, "shouldSkipControllerClass:reason:humanReadableReason:", a3, &v25, &v24);
      v9 = v25;
      v10 = v24;

      if (v8)
      {
        v11 = objc_msgSend(v10, "length");
        _BYLoggingFacility();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        if (v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138543618;
            v27 = a3;
            v28 = 2114;
            v29 = v10;
            v14 = "Skipping %{public}@ via %{public}@";
            v15 = v12;
            v16 = 22;
LABEL_20:
            _os_log_impl(&dword_214875000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
          }
        }
        else if (v13)
        {
          *(_DWORD *)buf = 138543362;
          v27 = a3;
          v14 = "Skipping %{public}@ for unknown reason";
          v15 = v12;
          v16 = 12;
          goto LABEL_20;
        }

        -[BFFFlowStarter diverter](self, "diverter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "didSkipControllerClass:forReason:", a3, v9);
        v17 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v17 = 1;
LABEL_23:

      return v17;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[objc_class controllerNeedsToRun](a3, "controllerNeedsToRun");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _BYLoggingFacility();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v19, "timeIntervalSinceDate:", v18);
      *(_DWORD *)buf = 138543618;
      v27 = a3;
      v28 = 2048;
      v29 = v23;
      _os_log_debug_impl(&dword_214875000, v20, OS_LOG_TYPE_DEBUG, "Decided controllerNeedsToRun for %{public}@ in %fs", buf, 0x16u);
    }

    if ((v17 & 1) == 0)
    {
      _BYLoggingFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = a3;
        _os_log_impl(&dword_214875000, v21, OS_LOG_TYPE_DEFAULT, "Skipping controller %{public}@: does not need to run", buf, 0xCu);
      }

    }
LABEL_22:

    goto LABEL_23;
  }
  return 0;
}

- (BOOL)controllerNeedsToRunForFlowItem:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "controllerNeedsToRun");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _BYLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "timeIntervalSinceDate:", v4);
      v11 = 138543618;
      v12 = v3;
      v13 = 2048;
      v14 = v10;
      _os_log_debug_impl(&dword_214875000, v7, OS_LOG_TYPE_DEBUG, "Decided instance controllerNeedsToRun for %{public}@ in %fs", (uint8_t *)&v11, 0x16u);
    }

    if ((v5 & 1) == 0)
    {
      _BYLoggingFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v3;
        _os_log_impl(&dword_214875000, v8, OS_LOG_TYPE_DEFAULT, "Skipping controller %{public}@: does not need to run", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BFFFlowDiverter)diverter
{
  return self->_diverter;
}

- (void)setDiverter:(id)a3
{
  objc_storeStrong((id *)&self->_diverter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diverter, 0);
}

@end
