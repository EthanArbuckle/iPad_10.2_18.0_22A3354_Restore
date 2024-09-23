@implementation PUIPosterSceneSnapshotter

+ (id)fileIOQueue
{
  if (fileIOQueue_onceToken != -1)
    dispatch_once(&fileIOQueue_onceToken, &__block_literal_global_25);
  return (id)fileIOQueue_fileIOQueue;
}

void __40__PUIPosterSceneSnapshotter_fileIOQueue__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = BSDispatchQueueCreateWithAttributes();
  v1 = (void *)fileIOQueue_fileIOQueue;
  fileIOQueue_fileIOQueue = v0;

}

- (void)dealloc
{
  BSContinuousMachTimer *timeoutTimer;
  objc_super v4;

  -[BSContinuousMachTimer invalidate](self->_timeoutTimer, "invalidate");
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  -[PUIPosterSceneSnapshotter _teardownScene:](self, "_teardownScene:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PUIPosterSceneSnapshotter;
  -[PUIPosterSceneSnapshotter dealloc](&v4, sel_dealloc);
}

- (PUIPosterSceneSnapshotter)initWithExtensionInstance:(id)a3 snapshotInfo:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  PUIPosterSceneSnapshotter *v13;
  PUIPosterSceneSnapshotter *v14;
  uint64_t v15;
  BSAtomicFlag *invalidationFlag;
  uint64_t v17;
  BSAtomicFlag *isSnapshottingFlag;
  uint64_t v19;
  BSAtomicFlag *isCompleteFlag;
  void *v22;
  void *v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("PFPosterExtensionInstance"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:].cold.1();
LABEL_15:
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244692F30);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFPosterExtensionInstanceClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:].cold.1();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x244692F94);
  }

  objc_msgSend(MEMORY[0x24BE0BDB8], "tokenForCurrentProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForEntitlement:", CFSTR("com.apple.runningboard.posterkit.host"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Remote snapshotting requires runningboard posterkit host entitlement"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:].cold.2((uint64_t)v22);
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)PUIPosterSceneSnapshotter;
  v13 = -[PUIPosterSceneSnapshotter init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_extensionInstance, a3);
    objc_storeStrong((id *)&v14->_snapshotInfo, a4);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
    invalidationFlag = v14->_invalidationFlag;
    v14->_invalidationFlag = (BSAtomicFlag *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
    isSnapshottingFlag = v14->_isSnapshottingFlag;
    v14->_isSnapshottingFlag = (BSAtomicFlag *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BE0BDA0]), "initWithFlag:", 0);
    isCompleteFlag = v14->_isCompleteFlag;
    v14->_isCompleteFlag = (BSAtomicFlag *)v19;

  }
  return v14;
}

- (NSString)logIdentifier
{
  return (NSString *)-[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
}

- (void)start
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__PUIPosterSceneSnapshotter_start__block_invoke;
  block[3] = &unk_25154BB88;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __34__PUIPosterSceneSnapshotter_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_setupScene");
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PUILogSnapshotter();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_error_impl(&dword_24464E000, v9, OS_LOG_TYPE_ERROR, "(%{public}@) sceneWillDeactivate:'%@' withError:'%@'", (uint8_t *)&v11, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = 0;
    _os_log_impl(&dword_24464E000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneWillDeactivate:'%@' withError:'%@'", (uint8_t *)&v11, 0x20u);
    goto LABEL_6;
  }

  -[PUIPosterSceneSnapshotter _mainQueue_finishWithError:result:](self, "_mainQueue_finishWithError:result:", v7, 0);
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PUILogSnapshotter();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_24464E000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) sceneContentStateDidChange:'%@'", (uint8_t *)&v7, 0x16u);

  }
  -[PUIPosterSceneSnapshotter _mainQueue_captureSnapshotWithScene:](self, "_mainQueue_captureSnapshotWithScene:", v4);

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a4, "pui_extendedRenderSessionDidChange"))
    -[PUIPosterSceneSnapshotter _mainQueue_captureSnapshotWithScene:](self, "_mainQueue_captureSnapshotWithScene:", v8);

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v6 = a4;
  PUILogSnapshotter();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v30 = v8;
    v31 = 2114;
    v32 = v6;
    _os_log_impl(&dword_24464E000, v7, OS_LOG_TYPE_DEFAULT, "(%{public}@) Received actions: %{public}@", buf, 0x16u);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v12 = v10;
    v13 = 0;
    v14 = *(_QWORD *)v25;
    *(_QWORD *)&v11 = 138543362;
    v22 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_self();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = objc_msgSend(v16, "isValid");

          if (v18)
          {
            PUILogSnapshotter();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v22;
              v30 = v20;
              _os_log_impl(&dword_24464E000, v19, OS_LOG_TYPE_DEFAULT, "(%{public}@) Complication rendering complete", buf, 0xCu);

            }
            self->_mainQueue_complicationRenderingCompleted = 1;
            -[PUIPosterSceneSnapshotter _mainQueue_captureSnapshotWithScene:](self, "_mainQueue_captureSnapshotWithScene:", v23);
            if (!v13)
              v13 = (void *)objc_opt_new();
            objc_msgSend(v13, "addObject:", v16, v22);
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUIPosterSceneSnapshotter _mainQueue_finishWithError:result:](self, "_mainQueue_finishWithError:result:", v4, 0);

}

- (void)_mainQueue_captureSnapshotWithScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  int v10;
  NSObject *v11;
  double mainQueue_startTime;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  PUIPosterSceneSnapshotter *v20;
  double v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend((id)objc_opt_class(), "fileIOQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    PUILogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      v8 = "(%{public}@) Aborting capture, Invalidated";
LABEL_10:
      _os_log_impl(&dword_24464E000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    }
  }
  else if (objc_msgSend(v4, "contentState") == 2)
  {
    objc_msgSend(v4, "clientSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pui_inExtendedRenderSession");

    if (!v10)
    {
      if (self->_mainQueue_complicationRenderingCompleted || !self->_mainQueue_shouldWaitForComplicationRendering)
      {
        PUILogSnapshotter();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v6;
          _os_log_impl(&dword_24464E000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot is capturing", buf, 0xCu);
        }

        mainQueue_startTime = self->_mainQueue_startTime;
        if (-[BSAtomicFlag setFlag:](self->_isSnapshottingFlag, "setFlag:", 1))
        {
          -[PUIPosterSceneSnapshotterInfo request](self->_snapshotInfo, "request");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "snapshotLevelSets");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "legibilityProcessingRequest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "determineColorStatistics");
          v17[0] = MEMORY[0x24BDAC760];
          v17[1] = 3221225472;
          v17[2] = __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke;
          v17[3] = &unk_25154CCE8;
          v18 = v6;
          v19 = v13;
          v21 = mainQueue_startTime;
          v20 = self;
          v7 = v13;
          objc_msgSend(v4, "pui_executeSnapshotForLevelSets:determineColorStatistics:onQueue:completion:", v14, v16, v5, v17);

          goto LABEL_11;
        }
        PUILogSnapshotter();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_11;
        *(_DWORD *)buf = 138543362;
        v23 = v6;
        v8 = "(%{public}@) Ignoring capture, ~already~ capturing snapshots";
      }
      else
      {
        PUILogSnapshotter();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_11;
        *(_DWORD *)buf = 138543362;
        v23 = v6;
        v8 = "(%{public}@) Deferring capture, complication rendering not completed";
      }
      goto LABEL_10;
    }
    PUILogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      v8 = "(%{public}@) Deferring capture, scene is in extended render session";
      goto LABEL_10;
    }
  }
  else
  {
    PUILogSnapshotter();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v6;
      v8 = "(%{public}@) Deferring capture, Scene content state not ready";
      goto LABEL_10;
    }
  }
LABEL_11:

}

void __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  double Current;
  NSObject *v9;
  uint64_t v10;
  PUIPosterSnapshotterResult *v11;
  id v12;
  uint64_t v13;
  PUIPosterSnapshotterResult *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  PUIPosterSnapshotterResult *v20;
  double v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  PUILogSnapshotter();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_impl(&dword_24464E000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) Snapshot captured", buf, 0xCu);
  }

  if (v6)
  {
    v11 = -[PUIPosterSnapshotterResult initWithRequest:snapshotBundleBuilder:executionTime:]([PUIPosterSnapshotterResult alloc], "initWithRequest:snapshotBundleBuilder:executionTime:", *(_QWORD *)(a1 + 40), v6, Current - *(double *)(a1 + 56));
    v22 = 0;
    -[PUIPosterSnapshotterResult finalizeWithError:](v11, "finalizeWithError:", &v22);
    v12 = v22;
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke_23;
  v17[3] = &unk_25154CCC0;
  v13 = *(_QWORD *)(a1 + 48);
  v21 = Current;
  v17[4] = v13;
  v18 = v12;
  v19 = v7;
  v20 = v11;
  v14 = v11;
  v15 = v7;
  v16 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], v17);

}

uint64_t __65__PUIPosterSceneSnapshotter__mainQueue_captureSnapshotWithScene___block_invoke_23(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 64);
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
    v1 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_finishWithError:result:", v1, *(_QWORD *)(a1 + 56));
}

- (void)_teardownScene:(BOOL)a3
{
  _BOOL8 v3;
  FBScene *mainQueue_scene;
  FBScene *v5;

  v3 = a3;
  mainQueue_scene = self->_mainQueue_scene;
  self->_mainQueue_scene = 0;
  v5 = mainQueue_scene;

  objc_msgSend((id)objc_opt_class(), "teardownScene:sceneWasDeactivated:", v5, v3);
}

+ (void)teardownScene:(id)a3 sceneWasDeactivated:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  BSDispatchMain();

}

void *__63__PUIPosterSceneSnapshotter_teardownScene_sceneWasDeactivated___block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
  result = *(void **)(a1 + 32);
  if (result)
  {
    if (!*(_BYTE *)(a1 + 40))
      return (void *)objc_msgSend(result, "pui_invalidateWithCompletion:", 0);
  }
  return result;
}

- (void)_mainQueue_setupScene
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2;
  v3[3] = &unk_25154CD10;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "updateSettingsWithBlock:", v3);

}

void __50__PUIPosterSceneSnapshotter__mainQueue_setupScene__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "pui_setSnapshot:", 1);
  objc_msgSend(v3, "pui_applyToMutableSceneSettings:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setForeground:", 1);

}

- (void)_activateTimeoutTimer
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  BSContinuousMachTimer *v9;
  BSContinuousMachTimer *timeoutTimer;
  BSContinuousMachTimer *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[PUIPosterSceneSnapshotterInfo request](self->_snapshotInfo, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeoutInterval");
  v5 = v4;

  if (v5 > 0.0)
  {
    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x24BE0BDE8]);
    -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Timeout timer for "), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (BSContinuousMachTimer *)objc_msgSend(v6, "initWithIdentifier:", v8);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v9;

    v11 = self->_timeoutTimer;
    v12 = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC9B8];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke;
    v14[3] = &unk_25154CD60;
    objc_copyWeak(&v15, &location);
    -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v11, "scheduleWithFireInterval:leewayInterval:queue:handler:", v12, v14, v5, 5.0);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained[6], "getFlag"))
    {
      PUILogSnapshotter();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke_cold_1((uint64_t)v2);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 8);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_mainQueue_finishWithError:result:", v3, 0);
    }

  }
}

- (void)_mainQueue_finishWithError:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BSContinuousMachTimer *timeoutTimer;
  NSObject *v10;
  NSObject *v11;
  double v12;
  NSObject *snapshotInfo;
  double v14;
  id WeakRetained;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BSAtomicFlag setFlag:](self->_isCompleteFlag, "setFlag:", 1))
  {
    if (self->_mainQueue_endTime != 0.0)
      self->_mainQueue_endTime = CFAbsoluteTimeGetCurrent();
    -[BSContinuousMachTimer invalidate](self->_timeoutTimer, "invalidate");
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    PUILogSnapshotter();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = self->_mainQueue_endTime - self->_mainQueue_startTime;
        v17 = 138544130;
        v18 = v8;
        v19 = 2114;
        v20 = v6;
        v21 = 2112;
        v22 = v7;
        v23 = 2048;
        v24 = v12;
        _os_log_error_impl(&dword_24464E000, v11, OS_LOG_TYPE_ERROR, "(%{public}@) _mainQueue_finishWithError:'%{public}@' result:'%@'; runtime: %f",
          (uint8_t *)&v17,
          0x2Au);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_mainQueue_endTime - self->_mainQueue_startTime;
      v17 = 138544130;
      v18 = v8;
      v19 = 2114;
      v20 = 0;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = v14;
      _os_log_impl(&dword_24464E000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) _mainQueue_finishWithError:'%{public}@' result:'%@'; runtime: %f",
        (uint8_t *)&v17,
        0x2Au);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sceneSnapshotterDidFinish:result:error:", self, v7, v6);

    -[PUIPosterSceneSnapshotter _teardownScene:](self, "_teardownScene:", v6 != 0);
    PUILogSnapshotter();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v8;
      _os_log_impl(&dword_24464E000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) scene torn down", (uint8_t *)&v17, 0xCu);
    }

    snapshotInfo = self->_snapshotInfo;
    self->_snapshotInfo = 0;
  }
  else
  {
    PUILogSnapshotter();
    snapshotInfo = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(snapshotInfo, OS_LOG_TYPE_ERROR))
      -[PUIPosterSceneSnapshotter _mainQueue_finishWithError:result:].cold.1();
  }

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((-[BSAtomicFlag getFlag](self->_isCompleteFlag, "getFlag") & 1) == 0
    && -[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    PUILogSnapshotter();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[PUIPosterSceneSnapshotterInfo logIdentifier](self->_snapshotInfo, "logIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_impl(&dword_24464E000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) PUIPosterSceneSnapshotter invalidated", buf, 0xCu);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PUIPosterSceneSnapshotter_invalidate__block_invoke;
    block[3] = &unk_25154BB88;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __39__PUIPosterSceneSnapshotter_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "pui_errorWithCode:", 5);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_mainQueue_finishWithError:result:", v2, 0);

}

- (void)fireSceneDeactivationErrorForTesting:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if ((MEMORY[0x249514E6C]("-[PUIPosterSceneSnapshotter fireSceneDeactivationErrorForTesting:]") & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__PUIPosterSceneSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke;
    block[3] = &unk_25154BFC0;
    block[4] = self;
    v8 = v4;
    v5 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_BSIsInternalInstall(__PRETTY_FUNCTION__)"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[PUIPosterSceneSnapshotter fireSceneDeactivationErrorForTesting:].cold.1();
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __66__PUIPosterSceneSnapshotter_fireSceneDeactivationErrorForTesting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sceneWillDeactivate:withError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PUIPosterSceneSnapshotterInfo)snapshotInfo
{
  return self->_snapshotInfo;
}

- (void)setSnapshotInfo:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotInfo, a3);
}

- (PUIPosterSceneSnapshotterDelegate)delegate
{
  return (PUIPosterSceneSnapshotterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotInfo, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_storeStrong((id *)&self->_isCompleteFlag, 0);
  objc_storeStrong((id *)&self->_isSnapshottingFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_mainQueue_scene, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

- (void)initWithExtensionInstance:snapshotInfo:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithExtensionInstance:(uint64_t)a1 snapshotInfo:.cold.2(uint64_t a1)
{
  void *v2;
  uint8_t v3[12];
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PUIPosterSceneSnapshotter initWithExtensionInstance:snapshotInfo:]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  v4 = 2114;
  v5 = CFSTR("PUIPosterSceneSnapshotter.m");
  v6 = 1024;
  v7 = 75;
  v8 = 2114;
  v9 = a1;
  _os_log_error_impl(&dword_24464E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", v3, 0x26u);

}

void __50__PUIPosterSceneSnapshotter__activateTimeoutTimer__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 80), "logIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_2(&dword_24464E000, v2, v3, "(%{public}@) Timeout timer fired but snapshot is no longer active", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)_mainQueue_finishWithError:result:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_24464E000, v0, OS_LOG_TYPE_ERROR, "(%{public}@) _mainQueue_finishWithError: Called on already-complete snapshot session", v1, 0xCu);
}

- (void)fireSceneDeactivationErrorForTesting:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_24464E000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

@end
