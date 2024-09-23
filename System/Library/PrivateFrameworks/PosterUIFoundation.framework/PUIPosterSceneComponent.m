@implementation PUIPosterSceneComponent

- (void)_main_updateState
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PUIPosterSceneComponent.m");
  v16 = 1024;
  v17 = 103;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_24464E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (PUIPosterSceneComponent)initWithScene:(id)a3 bundleIdentifier:(id)a4 processIdentity:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PUIPosterSceneComponent *v14;
  PUIPosterSceneComponent *v15;
  uint64_t v16;
  NSString *bundleIdentifier;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[PUIPosterSceneComponent init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scene, a3);
    v16 = objc_msgSend(v12, "copy");
    bundleIdentifier = v15->_bundleIdentifier;
    v15->_bundleIdentifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_processIdentity, a5);
    v15->_options = a6;
    -[FBScene addObserver:](v15->_scene, "addObserver:", v15);
    -[PUIPosterSceneComponent _main_updateState](v15, "_main_updateState");
  }

  return v15;
}

- (void)invalidate
{
  NSObject *v3;
  CLInUseAssertion *v4;
  RBSAssertion *mlmAssertion;
  RBSAssertion *taskAssertion;
  NSObject *v7;
  CLInUseAssertion *locationInUseAssertion;
  CLInUseAssertion *v9;
  FBScene *scene;
  int v11;
  CLInUseAssertion *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[BSAbsoluteMachTimer invalidate](self->_wakeTimer, "invalidate");
  -[BSTimerScheduleQuerying invalidate](self->_eventTimer, "invalidate");
  -[FBScene removeObserver:](self->_scene, "removeObserver:", self);
  if (self->_mlmAssertion)
  {
    PUILogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene pui_shortDescription](self->_scene, "pui_shortDescription");
      v4 = (CLInUseAssertion *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_24464E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating MLM assertion.", (uint8_t *)&v11, 0xCu);

    }
    -[RBSAssertion invalidate](self->_mlmAssertion, "invalidate");
    mlmAssertion = self->_mlmAssertion;
    self->_mlmAssertion = 0;

  }
  -[RBSAssertion invalidate](self->_taskAssertion, "invalidate");
  taskAssertion = self->_taskAssertion;
  self->_taskAssertion = 0;

  if (self->_locationInUseAssertion)
  {
    PUILogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      locationInUseAssertion = self->_locationInUseAssertion;
      v11 = 138412290;
      v12 = locationInUseAssertion;
      _os_log_impl(&dword_24464E000, v7, OS_LOG_TYPE_DEFAULT, "invalidating CLInUseAssertion: %@", (uint8_t *)&v11, 0xCu);
    }

    -[CLInUseAssertion invalidate](self->_locationInUseAssertion, "invalidate");
    v9 = self->_locationInUseAssertion;
    self->_locationInUseAssertion = 0;

  }
  scene = self->_scene;
  self->_scene = 0;

}

- (void)_main_remoteMLMInvalidation:(id)a3
{
  RBSAssertion *mlmAssertion;

  if (self->_mlmAssertion == a3)
  {
    objc_msgSend(a3, "invalidate");
    mlmAssertion = self->_mlmAssertion;
    self->_mlmAssertion = 0;

    -[PUIPosterSceneComponent _main_updateState](self, "_main_updateState");
  }
}

void __44__PUIPosterSceneComponent__main_updateState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PUILogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_24464E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] MLM assertion for %{public}@ was invalidated remotely.", buf, 0x16u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__PUIPosterSceneComponent__main_updateState__block_invoke_31;
  v8[3] = &unk_25154CBF8;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v9 = v3;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  objc_destroyWeak(&v10);
}

void __44__PUIPosterSceneComponent__main_updateState__block_invoke_31(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_main_remoteMLMInvalidation:", *(_QWORD *)(a1 + 32));

}

uint64_t __44__PUIPosterSceneComponent__main_updateState__block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PUILogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138543618;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_24464E000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finalizing delayed invalidation of MLM assertion %p.", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  id v9;
  char v10;
  int v11;
  BSTimerScheduleQuerying *eventTimer;
  void *v13;
  char v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  char v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  BSTimerScheduleQuerying *v26;
  BSTimerScheduleQuerying *v27;
  NSObject *v28;
  id v29;
  void *v30;
  BSTimerScheduleQuerying *v31;
  BSTimerScheduleQuerying *v32;
  BSTimerScheduleQuerying *v33;
  void *v34;
  const __CFString *v35;
  id v36;
  void *v37;
  BSTimerScheduleQuerying *v38;
  BSTimerScheduleQuerying *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  double v48;
  __int16 v49;
  const __CFString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "pui_significantEventTimeDidChange");
  v11 = objc_msgSend(v9, "pui_significantEventsDidChange");

  if ((v10 & 1) != 0 || v11)
  {
    -[BSTimerScheduleQuerying invalidate](self->_eventTimer, "invalidate");
    eventTimer = self->_eventTimer;
    self->_eventTimer = 0;

    objc_msgSend(v8, "clientSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "pui_significantEventOptions");

    objc_msgSend(v8, "clientSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "pui_significantEventOptions");

    v17 = objc_msgSend(v8, "pui_isLegacyProvider");
    if ((v14 & 1) != 0 || (v16 & 8) != 0 && ((v17 ^ 1) & 1) == 0)
    {
      objc_msgSend(v8, "clientSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "pui_significantEventTime");

      v45 = 0;
      v46 = 0;
      if (!dispatch_time_to_nsec())
      {
        PUILogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.6();
        goto LABEL_26;
      }
      if (v19 == (unint64_t)(v45 == 2) << 63)
      {
        PUILogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.2();
LABEL_26:

        goto LABEL_27;
      }
      v44 = 0;
      if (!dispatch_time_to_nsec())
      {
        PUILogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.5();
        goto LABEL_26;
      }
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __101__PUIPosterSceneComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
      v43[3] = &unk_25154CC48;
      v43[4] = self;
      v22 = (void *)MEMORY[0x2495151FC](v43);
      v23 = (double)(unint64_t)(v46 - v44) / 1000000000.0;
      if (v23 <= 0.0)
      {
        PUILogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.4();
      }
      else
      {
        if (v45 == 3)
        {
          v29 = objc_alloc(MEMORY[0x24BE0BEC0]);
          objc_msgSend(v8, "pui_shortDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (BSTimerScheduleQuerying *)objc_msgSend(v29, "initWithIdentifier:", v30);
          v32 = self->_eventTimer;
          self->_eventTimer = v31;

          v33 = self->_eventTimer;
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v23);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[BSTimerScheduleQuerying scheduleForDate:leewayInterval:queue:handler:](v33, "scheduleForDate:leewayInterval:queue:handler:", v34, MEMORY[0x24BDAC9B8], v22, 0.1);

          v35 = CFSTR("wall");
        }
        else if (v45 == 2)
        {
          v36 = objc_alloc(MEMORY[0x24BE0BDE8]);
          objc_msgSend(v8, "pui_shortDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (BSTimerScheduleQuerying *)objc_msgSend(v36, "initWithIdentifier:", v37);
          v39 = self->_eventTimer;
          self->_eventTimer = v38;

          -[BSTimerScheduleQuerying scheduleWithFireInterval:leewayInterval:queue:handler:](self->_eventTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], v22, v23, 0.1);
          v35 = CFSTR("monotonic");
        }
        else
        {
          if (v45 == 1)
          {
            v24 = objc_alloc(MEMORY[0x24BE0BD78]);
            objc_msgSend(v8, "pui_shortDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (BSTimerScheduleQuerying *)objc_msgSend(v24, "initWithIdentifier:", v25);
            v27 = self->_eventTimer;
            self->_eventTimer = v26;

            -[BSTimerScheduleQuerying scheduleWithFireInterval:leewayInterval:queue:handler:](self->_eventTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x24BDAC9B8], v22, v23, 0.1);
          }
          else
          {
            PUILogCommon();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.3(&v45, v40);

          }
          v35 = CFSTR("default");
        }
        if (!self->_eventTimer)
          goto LABEL_44;
        if (v23 <= 60.0)
        {
          PUILogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v48 = v23;
            v49 = 2112;
            v50 = v35;
            _os_log_impl(&dword_24464E000, v28, OS_LOG_TYPE_DEFAULT, "Setting significant time interval to %.1fs (%@)", buf, 0x16u);
          }
        }
        else
        {
          v28 = objc_alloc_init(MEMORY[0x24BDD14F8]);
          -[NSObject setUnitsStyle:](v28, "setUnitsStyle:", 1);
          -[NSObject stringFromTimeInterval:](v28, "stringFromTimeInterval:", v23);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          PUILogCommon();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v48 = *(double *)&v41;
            v49 = 2112;
            v50 = v35;
            _os_log_impl(&dword_24464E000, v42, OS_LOG_TYPE_DEFAULT, "Setting significant time interval to %{public}@ (%@)", buf, 0x16u);
          }

        }
      }

LABEL_44:
      goto LABEL_27;
    }
    if ((v16 & 8) != 0)
      v21 = v17;
    else
      v21 = 1;
    if ((v21 & 1) == 0)
    {
      PUILogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        -[PUIPosterSceneComponent scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:].cold.1(v8, v20);
      goto LABEL_26;
    }
  }
LABEL_27:

}

void __101__PUIPosterSceneComponent_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  if (objc_msgSend(v4, "isActive"))
  {
    PUILogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "pui_shortDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "Significant event timer fired for %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(v4, "pui_postSignificantEvent:", 1);
  }
  objc_msgSend(v3, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTimer, 0);
  objc_storeStrong((id *)&self->_wakeTimer, 0);
  objc_storeStrong((id *)&self->_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_mlmAssertion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)scene:(void *)a1 didUpdateClientSettingsWithDiff:(NSObject *)a2 oldClientSettings:transitionContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pui_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_24464E000, a2, OS_LOG_TYPE_FAULT, "PRPosterSignificantEventOptionLegacySettingsUpdate requested from *not* LegacyPoster BUT: %{public}@", (uint8_t *)&v4, 0xCu);

}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_4(&dword_24464E000, v0, v1, "we do not support significant event timers for \"now\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)scene:(uint64_t *)a1 didUpdateClientSettingsWithDiff:(NSObject *)a2 oldClientSettings:transitionContext:.cold.3(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_24464E000, a2, OS_LOG_TYPE_ERROR, "bad dispatch time clock ID, clock %lu is unsupported", (uint8_t *)&v3, 0xCu);
}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_4(&dword_24464E000, v0, v1, "ignoring significant event time in the past", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_4(&dword_24464E000, v0, v1, "bad dispatch time, ignoring signficant event time (2)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)scene:didUpdateClientSettingsWithDiff:oldClientSettings:transitionContext:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_4(&dword_24464E000, v0, v1, "bad dispatch time, ignoring signficant event time", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
