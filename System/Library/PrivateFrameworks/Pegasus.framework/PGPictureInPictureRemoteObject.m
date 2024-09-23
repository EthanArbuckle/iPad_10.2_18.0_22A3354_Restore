@implementation PGPictureInPictureRemoteObject

- (BOOL)matchesSceneSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  if (!a3)
    return 1;
  v4 = a3;
  -[PGPictureInPictureRemoteObject sourceSceneSessionPersistentIdentifier](self, "sourceSceneSessionPersistentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (PGPictureInPictureRemoteObject)initWithConnection:(id)a3 interruptionAssistant:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PGPictureInPictureRemoteObject *v9;
  PGPictureInPictureRemoteObject *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  uint64_t v16;
  PGPictureInPictureApplication *pictureInPictureApplication;
  id v18;
  void *v19;
  uint64_t v20;
  BSInvalidatable *stateCaptureInvalidatable;
  PGInterruptionAssistant *interruptionAssistant;
  void *v23;
  id v25;
  id location;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject initWithConnection:interruptionAssistant:].cold.1();

  v27.receiver = self;
  v27.super_class = (Class)PGPictureInPictureRemoteObject;
  v9 = -[PGPictureInPictureRemoteObject init](&v27, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_connection, v6);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pegasus.PGPictureInPictureRemoteObject %p"), v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create(v12, v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

    +[PGPictureInPictureApplication pictureInPictureApplicationWithProcessIdentifier:](PGPictureInPictureApplication, "pictureInPictureApplicationWithProcessIdentifier:", objc_msgSend(v6, "processIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    pictureInPictureApplication = v10->_pictureInPictureApplication;
    v10->_pictureInPictureApplication = (PGPictureInPictureApplication *)v16;

    v10->_currentState = 0;
    objc_initWeak(&location, v10);
    v18 = MEMORY[0x1E0C80D38];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PictureInPicture - PGPictureInPictureRemoteObject - %p"), v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v25, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v20 = objc_claimAutoreleasedReturnValue();
    stateCaptureInvalidatable = v10->_stateCaptureInvalidatable;
    v10->_stateCaptureInvalidatable = (BSInvalidatable *)v20;

    objc_storeStrong((id *)&v10->_interruptionAssistant, a4);
    interruptionAssistant = v10->_interruptionAssistant;
    -[PGPictureInPictureApplication bundleIdentifier](v10->_pictureInPictureApplication, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGInterruptionAssistant setExemptAttribution:](interruptionAssistant, "setExemptAttribution:", v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v10;
}

__CFString *__75__PGPictureInPictureRemoteObject_initWithConnection_interruptionAssistant___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1E6231540;
  }

  return v3;
}

- (PGPictureInPictureRemoteObject)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  _PGLogMethodProem(self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithConnection:]."), v5, v7);

  return -[PGPictureInPictureRemoteObject initWithConnection:interruptionAssistant:](self, "initWithConnection:interruptionAssistant:", 0, 0);
}

- (void)dealloc
{
  void *v0;
  int v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5();
  _PGLogMethodProem(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v3, v4, "%@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

uint64_t __41__PGPictureInPictureRemoteObject_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deactivateAnalyticsSessionIfNeeded");
  return objc_msgSend(*(id *)(a1 + 40), "pictureInPictureDidDestroyAnalyticsSourceWithUUID:", *(_QWORD *)(a1 + 48));
}

- (NSString)description
{
  return (NSString *)-[PGPictureInPictureRemoteObject descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PGPictureInPictureRemoteObject succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PGPictureInPictureRemoteObject descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _BOOL8 v13;
  id v14;
  id v15;
  void *v16;

  -[PGPictureInPictureRemoteObject succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureApplication description](self->_pictureInPictureApplication, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("application"));

  objc_msgSend(v4, "appendString:withName:", self->_sourceSceneSessionPersistentIdentifier, CFSTR("sourceSceneSessionPersistentIdentifier"));
  -[PGPictureInPictureRemoteObject activitySessionIdentifier](self, "activitySessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("activitySessionIdentifier"));

  PGStringFromPictureInPictureControlsStyle(self->_controlsStyle);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("controlsStyle"));

  v8 = (id)objc_msgSend(v4, "appendBool:withName:", self->_isPictureInPicturePossible, CFSTR("isPictureInPicturePossible"));
  objc_msgSend(v4, "appendString:withName:", self->_exemptAttribution, CFSTR("exemptAttribution"));
  objc_msgSend(v4, "appendString:withName:", self->_exemptAttributionOverride, CFSTR("exemptAttributionOverride"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[PGPictureInPictureRemoteObject isInterrupted](self, "isInterrupted"), CFSTR("isInterrupted"));
  PGStringFromPictureInPictureRemoteObjectState(self->_currentState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v10, CFSTR("currentState"));

  v11 = (id)objc_msgSend(v4, "appendBool:withName:", self->_pictureInPictureShouldStartWhenEnteringBackground, CFSTR("pictureInPictureShouldStartWhenEnteringBackground"));
  v12 = (id)objc_msgSend(v4, "appendBool:withName:", self->_stashed, CFSTR("stashed"));
  if (self->_tetheringRemoteObject)
    v13 = 1;
  else
    v13 = self->_tetheredRemoteObject != 0;
  v14 = (id)objc_msgSend(v4, "appendBool:withName:", v13, CFSTR("isInMicroPIP"));
  v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[PGPictureInPictureRemoteObject _isUnderLock](self, "_isUnderLock"), CFSTR("isUnderLock"));
  NSStringFromCGRect(self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v16, CFSTR("initialLayerFrame"));

  return v4;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setAnalyticsDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  id *p_analyticsSourceUUID;
  NSUUID *analyticsSourceUUID;
  NSUUID *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  NSUUID *v14;
  id v15;
  NSUUID *v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_analyticsDelegate, v4);
    analyticsSourceUUID = self->_analyticsSourceUUID;
    p_analyticsSourceUUID = (id *)&self->_analyticsSourceUUID;
    v8 = analyticsSourceUUID;
    objc_msgSend(p_analyticsSourceUUID[18], "bundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("com.apple.MissingBundleIdentifier");
    if (v9)
      v11 = (__CFString *)v9;
    v12 = v11;

    -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("com.apple.InCallService"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(p_analyticsSourceUUID, v8);
    }
    v15 = v4;
    v16 = v8;
    v13 = v12;
    v14 = v8;
    BSDispatchMain();

  }
}

uint64_t __55__PGPictureInPictureRemoteObject_setAnalyticsDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pictureInPictureDidCreateAnalyticsSourceWithUUID:bundleIdentifier:contentType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (BOOL)shouldStartPictureInPictureEnteringBackground
{
  _BOOL4 v3;
  _BOOL4 pictureInPictureShouldStartWhenEnteringBackground;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  char v10;
  int v11;
  NSObject *v12;
  __CFString *v13;
  int v15;
  PGPictureInPictureRemoteObject *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[PGPictureInPictureRemoteObject isPictureInPicturePossible](self, "isPictureInPicturePossible");
  pictureInPictureShouldStartWhenEnteringBackground = self->_pictureInPictureShouldStartWhenEnteringBackground;
  v5 = -[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 3);
  v6 = (unint64_t)(self->_currentState - 3) <= 2 && self->_pictureInPictureStartedAutomatically;
  v7 = -[PGInterruptionAssistant isInterrupted](self->_interruptionAssistant, "isInterrupted");
  v8 = v7;
  v9 = v5 || v6;
  v10 = !v3;
  if (!pictureInPictureShouldStartWhenEnteringBackground)
    v10 = 1;
  if ((v10 & 1) != 0)
    v11 = 0;
  else
    v11 = v9 & !v7;
  PGLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v8)
    {
      -[PGInterruptionAssistant description](self->_interruptionAssistant, "description");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &stru_1E6231540;
    }
    v15 = 134219522;
    v16 = self;
    v17 = 1024;
    v18 = v11;
    v19 = 1024;
    v20 = v3;
    v21 = 1024;
    v22 = pictureInPictureShouldStartWhenEnteringBackground;
    v23 = 1024;
    v24 = v9;
    v25 = 1024;
    v26 = v8;
    v27 = 2114;
    v28 = v13;
    _os_log_impl(&dword_1B0CD6000, v12, OS_LOG_TYPE_DEFAULT, "Remote object(%p) shouldStartPictureInPictureEnteringBackground check result:%{BOOL}u. State: possible(%{BOOL}u) shouldStartEnteringBackground(%{BOOL}u) canStartAutomaticallyOrIsStartingAutomatically(%{BOOL}u) isInterrupted(%{BOOL}u) %{public}@", (uint8_t *)&v15, 0x34u);
    if (v8)

  }
  return v11;
}

- (BOOL)canStopPictureInPicture
{
  return -[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 8);
}

- (BOOL)canCancelPictureInPicture
{
  unint64_t currentState;

  currentState = self->_currentState;
  if (currentState > 0xE)
    return 0;
  if (((1 << currentState) & 0x73C7) != 0)
    return -[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 7);
  return 1;
}

- (BOOL)isStartingPictureInPicture
{
  return (unint64_t)(self->_currentState - 3) < 3;
}

- (BOOL)isStoppingOrCancellingPictureInPicture
{
  return (self->_currentState < 0xEuLL) & (0x2F80u >> self->_currentState);
}

- (BOOL)isStartingStoppingOrCancellingPictureInPicture
{
  return -[PGPictureInPictureRemoteObject isStartingPictureInPicture](self, "isStartingPictureInPicture")
      || -[PGPictureInPictureRemoteObject isStoppingOrCancellingPictureInPicture](self, "isStoppingOrCancellingPictureInPicture");
}

- (BOOL)canEndTwoStageStopPictureInPicture
{
  NSObject *v3;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  return self->_hasBegunTwoStageStop;
}

- (BOOL)isPictureInPicturePossible
{
  return self->_isPictureInPicturePossible;
}

- (BOOL)isInterrupted
{
  return -[PGInterruptionAssistant isInterrupted](self->_interruptionAssistant, "isInterrupted");
}

- (void)setPictureInPicturePossible:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *queue;
  _QWORD block[6];
  BOOL v12;
  uint8_t buf[4];
  PGPictureInPictureRemoteObject *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (self->_isPictureInPicturePossible != v3)
  {
    self->_isPictureInPicturePossible = v3;
    if (v3)
      -[PGPIPRemoteObjectSceneController activateIfNeeded](self->_sceneControllerIfExists, "activateIfNeeded");
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "isPictureInPicturePossible - %{public}@ %@", buf, 0x16u);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__PGPictureInPictureRemoteObject_setPictureInPicturePossible___block_invoke;
    block[3] = &unk_1E622FE30;
    block[4] = self;
    block[5] = a2;
    v12 = v3;
    dispatch_async(queue, block);
  }
}

void __62__PGPictureInPictureRemoteObject_setPictureInPicturePossible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePictureInPicturePossible:", *(unsigned __int8 *)(a1 + 48));

}

- (void)setSourceSceneSessionPersistentIdentifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *sourceSceneSessionPersistentIdentifier;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *, _BYTE *);
  void *v17;
  NSString *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_sourceSceneSessionPersistentIdentifier != v4 && !-[NSString isEqualToString:](v4, "isEqualToString:"))
  {
    v6 = (NSString *)-[NSString copy](v5, "copy");
    sourceSceneSessionPersistentIdentifier = self->_sourceSceneSessionPersistentIdentifier;
    self->_sourceSceneSessionPersistentIdentifier = v6;

    if (v5)
    {
      v20 = 0;
      v21 = &v20;
      v22 = 0x2050000000;
      v8 = (void *)getFBSceneManagerClass_softClass;
      v23 = getFBSceneManagerClass_softClass;
      v9 = MEMORY[0x1E0C809B0];
      if (!getFBSceneManagerClass_softClass)
      {
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __getFBSceneManagerClass_block_invoke;
        v19[3] = &unk_1E6230378;
        v19[4] = &v20;
        __getFBSceneManagerClass_block_invoke((uint64_t)v19);
        v8 = (void *)v21[3];
      }
      v10 = objc_retainAutorelease(v8);
      _Block_object_dispose(&v20, 8);
      objc_msgSend(v10, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      v15 = 3221225472;
      v16 = __76__PGPictureInPictureRemoteObject_setSourceSceneSessionPersistentIdentifier___block_invoke;
      v17 = &unk_1E622FE58;
      v18 = v5;
      objc_msgSend(v11, "scenesPassingTest:", &v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "anyObject", v14, v15, v16, v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&self->_sourceScene, v13);

      -[PGPIPRemoteObjectSceneController updateInterfaceOrientation](self->_sceneControllerIfExists, "updateInterfaceOrientation");
    }
  }

}

uint64_t __76__PGPictureInPictureRemoteObject_setSourceSceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "persistenceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(a1 + 32));
  *a3 = v11;
  return v11;
}

- (int64_t)sourceSceneSettingsInterfaceOrientation
{
  id WeakRetained;
  BOOL v4;
  int64_t v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sourceScene);
  v4 = -[PGPictureInPictureRemoteObject isStartingPictureInPicture](self, "isStartingPictureInPicture");
  v5 = 1;
  if (!v4 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "interfaceOrientation");

  }
  return v5;
}

- (int64_t)contentType
{
  return -[PGPlaybackState contentType](self->_playbackState, "contentType");
}

- (BOOL)isVideoCall
{
  return -[PGPictureInPictureRemoteObject contentType](self, "contentType") == 4;
}

- (void)startPictureInPictureEnteringBackgroundAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *queue;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  PGPictureInPictureRemoteObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[PGPictureInPictureRemoteObject startPictureInPictureEnteringBackgroundAnimated:withCompletionHandler:]";
    v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 3))
  {
    -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 3);
    -[PGPictureInPictureViewController notePictureInPictureStartedAutomatically:](self->_pictureInPictureViewController, "notePictureInPictureStartedAutomatically:", 1);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke;
    v12[3] = &unk_1E622FF20;
    v12[4] = self;
    v14 = a2;
    v13 = v7;
    v15 = a3;
    dispatch_async(queue, v12);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E622FEA8;
  v5 = *(id *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:errorHandler:", v3, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_4;
  v9[3] = &unk_1E622FEF8;
  v8 = *(id *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v6, "pictureInPictureStartRequestedAnimated:withCompletionHandler:", v7, v9);

}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E622FE80;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, a1[4]);
  WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 8));
  objc_msgSend(WeakRetained, "invalidate");

}

void __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_5;
  v9[3] = &unk_1E622FED0;
  v6 = *(id *)(a1 + 40);
  v13 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v12 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __104__PGPictureInPictureRemoteObject_startPictureInPictureEnteringBackgroundAnimated_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  if (!*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 40), "_invalidateForFailureToStartStopOrCancel");
  return result;
}

- (void)stopPictureInPictureAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *queue;
  void *v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  BOOL v14;

  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 8))
  {
    -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 8);
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke;
    v11[3] = &unk_1E622FF20;
    v11[4] = self;
    v13 = a2;
    v14 = a3;
    v12 = v7;
    dispatch_async(queue, v11);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

void __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E622F788;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "pictureInPictureStopRequestedAnimated:withCompletionHandler:", v5, v6);

}

void __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E622FF48;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  void *v8;
  _QWORD block[5];
  id v10;
  SEL v11;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 9))
  {
    self->_hasBegunTwoStageStop = 1;
    -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 9);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke;
    block[3] = &unk_1E622FFC0;
    block[4] = self;
    v11 = a2;
    v10 = v5;
    dispatch_async(queue, block);

  }
  else if (v5)
  {
    if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 6))
      -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 6);
    self->_hasBegunTwoStageStop = 0;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v8);

  }
}

void __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E622FF98;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "beginTwoStagePictureInPictureStopByRestoringUserInterfaceWithCompletionHandler:", v6);

}

void __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E622FF70;
  v11 = a2;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __113__PGPictureInPictureRemoteObject_beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 56))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 6))
      objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 6);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 0;
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)endTwoStageStopPictureInPictureWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *queue;
  void *v9;
  _QWORD block[5];
  id v11;
  SEL v12;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (self->_hasBegunTwoStageStop)
    goto LABEL_9;
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject endTwoStageStopPictureInPictureWithCompletionBlock:].cold.1(v7);

  if (self->_hasBegunTwoStageStop)
  {
LABEL_9:
    self->_hasBegunTwoStageStop = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke;
    block[3] = &unk_1E622FFC0;
    block[4] = self;
    v12 = a2;
    v11 = v5;
    dispatch_async(queue, block);

  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v9);

  }
}

void __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E622F788;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "endTwoStagePictureInPictureStopWithCompletionBlock:", v5);

}

void __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_3;
  block[3] = &unk_1E622FF48;
  v6 = *(id *)(a1 + 32);
  v11 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __85__PGPictureInPictureRemoteObject_endTwoStageStopPictureInPictureWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)sendStartPictureInPictureTestAction
{
  NSObject *v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  PGPictureInPictureRemoteObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[PGPictureInPictureRemoteObject sendStartPictureInPictureTestAction]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PGPictureInPictureRemoteObject_sendStartPictureInPictureTestAction__block_invoke;
  v7[3] = &unk_1E622FC00;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(queue, v7);
}

void __69__PGPictureInPictureRemoteObject_sendStartPictureInPictureTestAction__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCommand commandForTestStartPIP](PGCommand, "commandForTestStartPIP");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCommand:", v5);

}

- (void)startPictureInPictureFromBackground
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  dispatch_time_t v9;
  id v10;
  NSObject *queue;
  void *v12;
  _QWORD v13[6];
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  PGPictureInPictureRemoteObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[PGPictureInPictureRemoteObject isPictureInPicturePossible](self, "isPictureInPicturePossible"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureRemoteObject.m"), 530, CFSTR("Tried to BG PIP a remote object %@ that has NO for pip is possible"), self);

  }
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[PGPictureInPictureRemoteObject startPictureInPictureFromBackground]";
    v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v6 = MEMORY[0x1E0C809B0];
  if (!self->_startBackgroundPIPAssertion)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", objc_msgSend(WeakRetained, "processIdentifier"), CFSTR("Start PIP from Background"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_startBackgroundPIPAssertion, v8);
    v9 = dispatch_time(0, 5000000000);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke;
    block[3] = &unk_1E622F898;
    block[4] = self;
    v15 = v8;
    v10 = v8;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);

  }
  queue = self->_queue;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke_2;
  v13[3] = &unk_1E622FC00;
  v13[4] = self;
  v13[5] = a2;
  dispatch_async(queue, v13);
}

uint64_t __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(void **)(v1 + 64);
  if (v2 == *(void **)(result + 40))
  {
    v3 = result;
    *(_QWORD *)(v1 + 64) = 0;

    return objc_msgSend(*(id *)(v3 + 40), "invalidate");
  }
  return result;
}

void __69__PGPictureInPictureRemoteObject_startPictureInPictureFromBackground__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCommand commandForStartPIP](PGCommand, "commandForStartPIP");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCommand:", v5);

}

- (void)pictureInPictureInterruptionBeganWithReason:(int64_t)a3 attribution:(id)a4
{
  id v6;
  NSObject *v7;
  NSString *exemptAttributionOverride;
  NSObject *v9;
  const __CFString *v10;
  _BOOL4 v11;
  _BOOL8 v12;
  int v13;
  const char *v14;
  __int16 v15;
  PGPictureInPictureRemoteObject *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGInterruptionAssistant addReason:attribution:](self->_interruptionAssistant, "addReason:attribution:", a3, v6);
  if (a3 == 2)
  {
    exemptAttributionOverride = self->_exemptAttributionOverride;
    if (!exemptAttributionOverride)
      exemptAttributionOverride = self->_exemptAttribution;
    if (objc_msgSend(v6, "isEqualToString:", exemptAttributionOverride)
      && -[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 4))
    {
      -[PGPictureInPictureRemoteObject pictureInPictureInterruptionEndedWithReason:attribution:](self, "pictureInPictureInterruptionEndedWithReason:attribution:", 4, 0);
    }
  }
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4)
      v10 = CFSTR("invalid");
    else
      v10 = off_1E6230420[a3];
    v11 = -[PGInterruptionAssistant isInterrupted](self->_interruptionAssistant, "isInterrupted");
    v13 = 136315906;
    v14 = "-[PGPictureInPictureRemoteObject pictureInPictureInterruptionBeganWithReason:attribution:]";
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = v10;
    v19 = 1024;
    v20 = v11;
    _os_log_impl(&dword_1B0CD6000, v9, OS_LOG_TYPE_DEFAULT, "%s %p: %{public}@ isInterrupted %{BOOL}u ", (uint8_t *)&v13, 0x26u);
  }

  if (-[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 1))
    -[PGPictureInPictureRemoteObject _setUILockedResourcesUsageReductionReasons:](self, "_setUILockedResourcesUsageReductionReasons:", 1);
  if (a3 == 1)
  {
    v12 = self->_stashed || -[PGPictureInPictureRemoteObject _isUnderLock](self, "_isUnderLock");
    -[PGPictureInPictureRemoteObject _notifyProxyOfStashedOrUnderLock:](self, "_notifyProxyOfStashedOrUnderLock:", v12);
  }
  -[PGPictureInPictureRemoteObject _updateActiveProxyAndViewControllerOfInterruptionIfNeeded](self, "_updateActiveProxyAndViewControllerOfInterruptionIfNeeded");

}

- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3 attribution:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL8 v8;
  NSObject *v9;
  const __CFString *v10;
  _BOOL4 v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  PGPictureInPictureRemoteObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGInterruptionAssistant removeReason:attribution:](self->_interruptionAssistant, "removeReason:attribution:", a3, v6);
  if (a3 == 1)
  {
    v8 = self->_stashed || -[PGPictureInPictureRemoteObject _isUnderLock](self, "_isUnderLock");
    -[PGPictureInPictureRemoteObject _notifyProxyOfStashedOrUnderLock:](self, "_notifyProxyOfStashedOrUnderLock:", v8);
  }
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4)
      v10 = CFSTR("invalid");
    else
      v10 = off_1E6230420[a3];
    v11 = -[PGInterruptionAssistant isInterrupted](self->_interruptionAssistant, "isInterrupted");
    v12 = 138543874;
    v13 = v10;
    v14 = 1024;
    v15 = v11;
    v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_1B0CD6000, v9, OS_LOG_TYPE_DEFAULT, "pictureInPictureInterruptionEndedWithReason: %{public}@ isInterrupted %{BOOL}u %p", (uint8_t *)&v12, 0x1Cu);
  }

  -[PGPictureInPictureRemoteObject _updateActiveProxyAndViewControllerOfInterruptionIfNeeded](self, "_updateActiveProxyAndViewControllerOfInterruptionIfNeeded");
  if (!-[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 1))
    -[PGPictureInPictureRemoteObject _setUILockedResourcesUsageReductionReasons:](self, "_setUILockedResourcesUsageReductionReasons:", 0);
  -[PGPictureInPictureViewController flashControls](self->_pictureInPictureViewController, "flashControls");

}

- (void)_notifyProxyOfStashedOrUnderLock:(BOOL)a3
{
  NSObject *queue;
  _QWORD block[6];
  BOOL v5;

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PGPictureInPictureRemoteObject__notifyProxyOfStashedOrUnderLock___block_invoke;
  block[3] = &unk_1E622FE30;
  block[4] = self;
  block[5] = a2;
  v5 = a3;
  dispatch_async(queue, block);
}

void __67__PGPictureInPictureRemoteObject__notifyProxyOfStashedOrUnderLock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStashedOrUnderLock:", *(unsigned __int8 *)(a1 + 48));

}

- (void)suspend
{
  NSObject *v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  PGPictureInPictureRemoteObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[PGPictureInPictureRemoteObject suspend]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 12))
  {
    -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 12);
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke;
    v7[3] = &unk_1E622FC00;
    v7[4] = self;
    v7[5] = a2;
    dispatch_async(queue, v7);
  }
}

void __41__PGPictureInPictureRemoteObject_suspend__block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  __int128 v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke_2;
  v1[3] = &unk_1E622FC00;
  v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

uint64_t __41__PGPictureInPictureRemoteObject_suspend__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke_3;
  v2[3] = &unk_1E622FC00;
  v3 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(*(id *)(v3 + 256), "performSuspendAnimationWithCompletionHandler:", v2);
}

void __41__PGPictureInPictureRemoteObject_suspend__block_invoke_3(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v3[2] = __41__PGPictureInPictureRemoteObject_suspend__block_invoke_4;
  v3[3] = &unk_1E622FC00;
  v4 = v1;
  dispatch_async(v2, v3);
}

void __41__PGPictureInPictureRemoteObject_suspend__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCommand commandForSetSuspended:](PGCommand, "commandForSetSuspended:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCommand:", v5);

}

- (void)resume
{
  NSObject *v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[6];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  PGPictureInPictureRemoteObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[PGPictureInPictureRemoteObject resume]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PGPictureInPictureRemoteObject_resume__block_invoke;
  v7[3] = &unk_1E622FC00;
  v7[4] = self;
  v7[5] = a2;
  dispatch_async(queue, v7);
}

void __40__PGPictureInPictureRemoteObject_resume__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCommand commandForSetSuspended:](PGCommand, "commandForSetSuspended:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleCommand:", v6);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PGPictureInPictureRemoteObject_resume__block_invoke_2;
  block[3] = &unk_1E622F8C0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __40__PGPictureInPictureRemoteObject_resume__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 256);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PGPictureInPictureRemoteObject_resume__block_invoke_3;
  v4[3] = &unk_1E622F8C0;
  v4[4] = v1;
  return objc_msgSend(v2, "performResumeAnimationWithCompletionHandler:", v4);
}

_QWORD *__40__PGPictureInPictureRemoteObject_resume__block_invoke_3(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[5] == 12)
    return (_QWORD *)objc_msgSend(result, "_setCurrentState:", 6);
  return result;
}

- (void)cancel
{
  NSObject *v4;
  NSObject *v5;
  NSObject *queue;
  _BOOL4 v7;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  PGPictureInPictureRemoteObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[PGPictureInPictureRemoteObject cancel]";
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 7))
  {
    *(_WORD *)&self->_hasPendingCancellationRequest = 0;
    -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 7);
    -[PGPictureInPictureViewController notePictureInPictureWillStopForAppRequest:preferredFullScreenRestore:](self->_pictureInPictureViewController, "notePictureInPictureWillStopForAppRequest:preferredFullScreenRestore:", 0, 0);
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PGPictureInPictureRemoteObject_cancel__block_invoke;
    v8[3] = &unk_1E622FC00;
    v8[4] = self;
    v8[5] = a2;
    dispatch_async(queue, v8);
  }
  else
  {
    v7 = -[PGPictureInPictureRemoteObject isStartingPictureInPicture](self, "isStartingPictureInPicture");
    if (v7)
      LOBYTE(v7) = -[PGPictureInPictureRemoteObject canCancelPictureInPicture](self, "canCancelPictureInPicture");
    self->_hasPendingCancellationRequest = v7;
    self->_hasPendingStopRequest = 0;
  }
}

void __40__PGPictureInPictureRemoteObject_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPictureCancelRequestedAnimated:withCompletionHandler:", 1, &__block_literal_global_9);

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  PGPictureInPictureViewController *pictureInPictureViewController;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  PGPictureInPictureRemoteObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[PGPictureInPictureRemoteObject invalidate]";
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 13))
  {
    -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 13);
    -[PGPictureInPictureViewController parentViewController](self->_pictureInPictureViewController, "parentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PGPictureInPictureRemoteObject delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pictureInPictureRemoteObject:willHidePictureInPictureViewController:", self, self->_pictureInPictureViewController);

      -[PGPictureInPictureRemoteObject _stopTethering](self, "_stopTethering");
      pictureInPictureViewController = self->_pictureInPictureViewController;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __44__PGPictureInPictureRemoteObject_invalidate__block_invoke;
      v7[3] = &unk_1E622F8C0;
      v7[4] = self;
      -[PGPictureInPictureViewController performStopAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:](pictureInPictureViewController, "performStopAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:", 1, 0, v7, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    }
    else if (-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", 14))
    {
      -[PGPictureInPictureRemoteObject _setCurrentState:](self, "_setCurrentState:", 14);
      -[PGPictureInPictureRemoteObject _finishCleanup](self, "_finishCleanup");
    }
  }
  -[PGPIPRemoteObjectSceneController invalidate](self->_sceneControllerIfExists, "invalidate");
}

uint64_t __44__PGPictureInPictureRemoteObject_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setHostedWindowHostingHandle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setSceneView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureRemoteObject:didHidePictureInPictureViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

  result = objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 14);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 14);
    return objc_msgSend(*(id *)(a1 + 32), "_finishCleanup");
  }
  return result;
}

- (void)setCurrentResourcesUsageReductionReasons:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  PGPictureInPictureRemoteObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PGPictureInPictureRemoteObject setCurrentResourcesUsageReductionReasons:]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v7, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  self->_externalResourcesUsageReductionReasons = a3;
  -[PGPictureInPictureRemoteObject _setResolvedResourcesUsageReductionReasons:](self, "_setResolvedResourcesUsageReductionReasons:", self->_UILockedResourcesUsageReductionReasons | a3);
}

- (void)_setUILockedResourcesUsageReductionReasons:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  PGPictureInPictureRemoteObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PGPictureInPictureRemoteObject _setUILockedResourcesUsageReductionReasons:]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v7, 0x16u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  self->_UILockedResourcesUsageReductionReasons = a3;
  -[PGPictureInPictureRemoteObject _setResolvedResourcesUsageReductionReasons:](self, "_setResolvedResourcesUsageReductionReasons:", self->_externalResourcesUsageReductionReasons | a3);
}

- (void)_setResolvedResourcesUsageReductionReasons:(unint64_t)a3
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PGPictureInPictureRemoteObject__setResolvedResourcesUsageReductionReasons___block_invoke;
  block[3] = &unk_1E6230008;
  block[4] = self;
  block[5] = a3;
  block[6] = a2;
  dispatch_async(queue, block);
}

void __77__PGPictureInPictureRemoteObject__setResolvedResourcesUsageReductionReasons___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v1 + 184) != v2)
  {
    *(_QWORD *)(v1 + 184) = v2;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    _PGLogMethodProem(*(void **)(a1 + 32), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResourcesUsageReductionReasons:", *(_QWORD *)(a1 + 40));

  }
}

- (NSString)activitySessionIdentifier
{
  NSString *activitySessionIdentifier;

  activitySessionIdentifier = self->_activitySessionIdentifier;
  if (activitySessionIdentifier)
    return activitySessionIdentifier;
  -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canStartBackgroundPIPForCurrentActivitySessionIdentifier
{
  BOOL v3;
  NSString *activitySessionIdentifierForLastActivePIPSession;
  void *v6;

  if (self->_currentState != 2 || self->_pictureInPictureViewController)
    return 0;
  activitySessionIdentifierForLastActivePIPSession = self->_activitySessionIdentifierForLastActivePIPSession;
  -[PGPictureInPictureRemoteObject activitySessionIdentifier](self, "activitySessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](activitySessionIdentifierForLastActivePIPSession, "isEqualToString:", v6))
    v3 = -[PGPictureInPictureRemoteObject _isICSVideoCall](self, "_isICSVideoCall");
  else
    v3 = 1;

  return v3;
}

- (BOOL)supportsMicroPIP
{
  _BOOL4 v3;

  v3 = -[PGPlaybackState supportsMicroPIP](self->_playbackState, "supportsMicroPIP");
  if (v3)
    LOBYTE(v3) = -[PGPictureInPictureRemoteObject _isAppICS](self, "_isAppICS");
  return v3;
}

- (BOOL)canStartMicroPIP
{
  _BOOL4 v3;
  char v4;
  void *v5;

  v3 = -[PGPictureInPictureRemoteObject supportsMicroPIP](self, "supportsMicroPIP");
  if (v3)
  {
    if (self->_hasPendingStopRequest)
    {
      v4 = 0;
    }
    else
    {
      v4 = !self->_hasPendingCancellationRequest;
      if (!self->_hasPendingCancellationRequest && (unint64_t)(self->_currentState - 2) >= 5)
      {
        -[PGPictureInPictureRemoteObject delegate](self, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v5, "pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:", self);

      }
    }
    LOBYTE(v3) = -[PGPictureInPictureRemoteObject supportsMicroPIP](self, "supportsMicroPIP") & v4;
  }
  return v3;
}

- (BOOL)canTetherRemoteObjectAsMicroPIP:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  _BOOL4 v12;
  int v14;
  const char *v15;
  __int16 v16;
  PGPictureInPictureRemoteObject *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = (unint64_t)(self->_currentState - 3) <= 3
    && objc_msgSend(v4, "canStartMicroPIP")
    && !-[PGPictureInPictureRemoteObject canStartMicroPIP](self, "canStartMicroPIP")
    && !self->_tetheredRemoteObject
    && -[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:](self, "_isAssociatedWithOtherObject:", v5);
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PGStringFromPictureInPictureRemoteObjectState(self->_currentState);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "canStartMicroPIP");
    v11 = !-[PGPictureInPictureRemoteObject canStartMicroPIP](self, "canStartMicroPIP");
    v12 = self->_tetheredRemoteObject == 0;
    v14 = 136317186;
    v15 = "-[PGPictureInPictureRemoteObject canTetherRemoteObjectAsMicroPIP:]";
    v16 = 2048;
    v17 = self;
    v18 = 2114;
    v19 = v8;
    v20 = 1024;
    v21 = v6;
    v22 = 2114;
    v23 = v9;
    v24 = 1024;
    v25 = v10;
    v26 = 1024;
    v27 = v11;
    v28 = 1024;
    v29 = v12;
    v30 = 1024;
    v31 = -[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:](self, "_isAssociatedWithOtherObject:", v5);
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ %{BOOL}u || _currentState: %{public}@ [otherObject canStartMicroPIP] %{BOOL}u ![self canStartMicroPIP] %{BOOL}u _tetheredMicroPIP == nil %{BOOL}u [self _isAssociatedWithOtherObject:otherObject] %{BOOL}u", (uint8_t *)&v14, 0x48u);

  }
  return v6;
}

- (BOOL)canActivateUntetheredAlongsideOtherObject:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[PGPictureInPictureRemoteObject contentType](self, "contentType") == 6 || objc_msgSend(v4, "contentType") == 6;

  return v5;
}

+ (void)tetherRemoteObject:(id)a3 toRemoteObject:(id)a4 mode:(int64_t)a5
{
  id *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = (id *)a3;
  v10 = (unint64_t)a4;
  PGLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v19 = "+[PGPictureInPictureRemoteObject tetherRemoteObject:toRemoteObject:mode:]";
    v20 = 2048;
    v21 = a1;
    v22 = 2048;
    v23 = v9;
    v24 = 2048;
    v25 = v10;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1B0CD6000, v11, OS_LOG_TYPE_DEFAULT, "%s %p tether %p to %p for mode %@", buf, 0x34u);

  }
  if ((unint64_t)v9 | v10)
  {
    v13 = objc_msgSend((id)v10, "canTetherRemoteObjectAsMicroPIP:", v9);
    if (v9 && v10 && (v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PGPictureInPictureRemoteObject.m"), 812, CFSTR("Failed to tether [%@] to [%@]. isStoppingTethering[%u] canStartTethering[%u]"), v9, v10, 0, 0);

      objc_msgSend(v9, "setTetheringRemoteObject:", v10);
    }
    else
    {
      objc_msgSend(v9, "setTetheringRemoteObject:", v10);
      if (!v9)
        goto LABEL_11;
    }
    if (objc_msgSend(v9[32], "stashed") && (objc_msgSend(v9[19], "hasInterruptionReason:", 4) & 1) == 0)
      objc_msgSend(v9, "pictureInPictureInterruptionBeganWithReason:attribution:", 4, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PGPictureInPictureRemoteObject.m"), 809, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tetheredObject != nil || tetheringObject != nil"));

    objc_msgSend(0, "canTetherRemoteObjectAsMicroPIP:", 0);
    objc_msgSend(0, "setTetheringRemoteObject:", 0);
  }
LABEL_11:
  objc_msgSend((id)v10, "setTetheredRemoteObject:", v9);
  objc_msgSend(v9, "pictureInPictureViewController");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "pictureInPictureViewController");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v14 | v15)
    +[PGPictureInPictureViewController tetherViewController:toViewController:mode:](PGPictureInPictureViewController, "tetherViewController:toViewController:mode:", v14, v15, a5);

}

- (void)_stopTethering
{
  if (self->_tetheredRemoteObject)
  {
    objc_msgSend((id)objc_opt_class(), "tetherRemoteObject:toRemoteObject:mode:", self->_tetheredRemoteObject, 0, 0);
    objc_msgSend((id)objc_opt_class(), "tetherRemoteObject:toRemoteObject:mode:", 0, self, 0);
  }
  if (self->_tetheringRemoteObject)
  {
    objc_msgSend((id)objc_opt_class(), "tetherRemoteObject:toRemoteObject:mode:", 0, self->_tetheringRemoteObject, 0);
    objc_msgSend((id)objc_opt_class(), "tetherRemoteObject:toRemoteObject:mode:", self, 0, 1);
  }
}

- (BOOL)_isUnderLock
{
  return -[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 1);
}

- (void)_setCurrentState:(int64_t)a3
{
  int64_t currentState;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  unint64_t v11;
  void *v12;
  NSString *v13;
  NSString *activitySessionIdentifierForLastActivePIPSession;
  _BOOL4 v15;
  _BOOL4 v16;
  BOOL v17;
  PGProcessAssertion *cancelPictureInPictureFinishTaskAssertion;
  PGProcessAssertion *v19;
  NSTimer *timerForInvalidatingIfStopOrCancelFails;
  id WeakRetained;
  void *v22;
  NSTimer *v23;
  NSTimer *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  PGPictureInPictureRemoteObject *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  currentState = self->_currentState;
  BSDispatchQueueAssertMain();
  if (!-[PGPictureInPictureRemoteObject _canTransitionToState:](self, "_canTransitionToState:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PGStringFromPictureInPictureRemoteObjectState(currentState);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    PGStringFromPictureInPictureRemoteObjectState(a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PGPictureInPictureRemoteObject.m"), 849, CFSTR("%@ attempted transition from %@ to %@,  which is not allowed."), self, v26, v27);

  }
  if (currentState == a3)
    return;
  self->_currentState = a3;
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    PGStringFromPictureInPictureRemoteObjectState(currentState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PGStringFromPictureInPictureRemoteObjectState(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v31 = "-[PGPictureInPictureRemoteObject _setCurrentState:]";
    v32 = 2048;
    v33 = self;
    v34 = 2114;
    v35 = v8;
    v36 = 2114;
    v37 = v9;
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ -> %{public}@", buf, 0x2Au);

  }
  v10 = -[PGInterruptionAssistant isProxyActive](self->_interruptionAssistant, "isProxyActive");
  v11 = self->_currentState;
  if (v11 <= 0xC)
  {
    if (((1 << v11) & 0x1070) != 0)
    {
LABEL_14:
      v10 = 1;
      goto LABEL_15;
    }
    if (((1 << v11) & 7) != 0)
    {
      if (-[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 4))
      {
        -[PGPictureInPictureRemoteObject pictureInPictureInterruptionEndedWithReason:attribution:](self, "pictureInPictureInterruptionEndedWithReason:attribution:", 4, 0);
      }
      v10 = 0;
      self->_pictureInPictureStartedAutomatically = 0;
      goto LABEL_15;
    }
    if (v11 == 3)
    {
      self->_pictureInPictureStartedAutomatically = 1;
      goto LABEL_14;
    }
  }
LABEL_15:
  -[PGInterruptionAssistant setProxyActive:](self->_interruptionAssistant, "setProxyActive:", v10);
  -[PGPictureInPictureRemoteObject _updateActiveProxyAndViewControllerOfInterruptionIfNeeded](self, "_updateActiveProxyAndViewControllerOfInterruptionIfNeeded");
  if (a3 == 6)
  {
    -[PGPictureInPictureRemoteObject activitySessionIdentifier](self, "activitySessionIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSString *)objc_msgSend(v12, "copy");
    activitySessionIdentifierForLastActivePIPSession = self->_activitySessionIdentifierForLastActivePIPSession;
    self->_activitySessionIdentifierForLastActivePIPSession = v13;

    v15 = 1;
  }
  else
  {
    v15 = -[PGPictureInPictureRemoteObject isStartingPictureInPicture](self, "isStartingPictureInPicture");
  }
  v16 = self->_hasPendingStopRequest || self->_hasPendingCancellationRequest;
  v17 = -[PGPictureInPictureRemoteObject isStoppingOrCancellingPictureInPicture](self, "isStoppingOrCancellingPictureInPicture");
  cancelPictureInPictureFinishTaskAssertion = self->_cancelPictureInPictureFinishTaskAssertion;
  if (!v17 && (!v15 || !v16))
  {
    -[PGProcessAssertion invalidate](cancelPictureInPictureFinishTaskAssertion, "invalidate");
    v19 = self->_cancelPictureInPictureFinishTaskAssertion;
    self->_cancelPictureInPictureFinishTaskAssertion = 0;

    -[NSTimer invalidate](self->_timerForInvalidatingIfStopOrCancelFails, "invalidate");
    timerForInvalidatingIfStopOrCancelFails = self->_timerForInvalidatingIfStopOrCancelFails;
    self->_timerForInvalidatingIfStopOrCancelFails = 0;
LABEL_27:

    return;
  }
  if (!cancelPictureInPictureFinishTaskAssertion || !self->_timerForInvalidatingIfStopOrCancelFails)
  {
    -[PGProcessAssertion invalidate](cancelPictureInPictureFinishTaskAssertion, "invalidate");
    -[NSTimer invalidate](self->_timerForInvalidatingIfStopOrCancelFails, "invalidate");
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", objc_msgSend(WeakRetained, "processIdentifier"), CFSTR("Cancel PIP Task Assertion"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_cancelPictureInPictureFinishTaskAssertion, v22);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __51__PGPictureInPictureRemoteObject__setCurrentState___block_invoke;
    v28[3] = &unk_1E6230030;
    v28[4] = self;
    v29 = v22;
    timerForInvalidatingIfStopOrCancelFails = v22;
    -[PGPictureInPictureRemoteObject _invalidationTimerWithTimeout:block:](self, "_invalidationTimerWithTimeout:block:", v28, 5.0);
    v23 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v24 = self->_timerForInvalidatingIfStopOrCancelFails;
    self->_timerForInvalidatingIfStopOrCancelFails = v23;

    goto LABEL_27;
  }
}

void __51__PGPictureInPictureRemoteObject__setCurrentState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(id *)(v5 + 96) == v3)
  {
    v11 = v3;
    if (objc_msgSend(v3, "isValid"))
      objc_msgSend(*(id *)(a1 + 32), "_invalidateForFailureToStartStopOrCancel");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 96);
    *(_QWORD *)(v6 + 96) = 0;

    v5 = *(_QWORD *)(a1 + 32);
    v4 = v11;
  }
  v8 = *(void **)(a1 + 40);
  if (v8 == *(void **)(v5 + 80))
  {
    v12 = v4;
    objc_msgSend(v8, "invalidate");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 80);
    *(_QWORD *)(v9 + 80) = 0;

    v4 = v12;
  }

}

- (BOOL)_canTransitionToState:(int64_t)a3
{
  int64_t currentState;
  BOOL result;
  BOOL v6;
  BOOL v7;

  currentState = self->_currentState;
  result = currentState == a3;
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      v6 = currentState == a3 || currentState == 0;
      goto LABEL_41;
    case 2:
      v6 = currentState == 1 || currentState == 11;
      goto LABEL_41;
    case 3:
      if (currentState != 2)
        goto LABEL_26;
      v7 = !self->_isPictureInPicturePossible;
      goto LABEL_32;
    case 4:
      if (currentState == 2 && self->_isPictureInPicturePossible)
        goto LABEL_20;
      v6 = currentState == 3;
      goto LABEL_41;
    case 5:
      v6 = currentState == 4;
      goto LABEL_41;
    case 6:
      if (currentState == 5 || currentState == 12)
      {
LABEL_20:
        result = 1;
      }
      else
      {
        v6 = self->_hasBegunTwoStageStop && currentState == 9;
LABEL_41:
        result = v6;
      }
      break;
    case 7:
      v6 = currentState == 6 || currentState == 12;
      goto LABEL_41;
    case 8:
      if (currentState != 6)
        goto LABEL_26;
      v7 = -[PGPlaybackState contentType](self->_playbackState, "contentType") == 6;
LABEL_32:
      result = !v7;
      break;
    case 9:
    case 12:
      v6 = currentState == 6;
      goto LABEL_41;
    case 10:
      return (unint64_t)(currentState - 6) < 4;
    case 11:
      v6 = currentState == 10;
      goto LABEL_41;
    case 13:
      v7 = currentState == 14 || currentState == a3;
      goto LABEL_32;
    case 14:
      v6 = currentState == a3 || currentState == 13;
      goto LABEL_41;
    default:
LABEL_26:
      result = 0;
      break;
  }
  return result;
}

- (void)_invalidateInterruptionBeganFinishTaskAssertion
{
  PGProcessAssertion *interruptionBeganFinishTaskAssertion;
  PGProcessAssertion *v4;
  NSUUID *finishTaskInvalidationUUID;

  interruptionBeganFinishTaskAssertion = self->_interruptionBeganFinishTaskAssertion;
  if (interruptionBeganFinishTaskAssertion)
  {
    -[PGProcessAssertion invalidate](interruptionBeganFinishTaskAssertion, "invalidate");
    v4 = self->_interruptionBeganFinishTaskAssertion;
    self->_interruptionBeganFinishTaskAssertion = 0;

    finishTaskInvalidationUUID = self->_finishTaskInvalidationUUID;
    self->_finishTaskInvalidationUUID = 0;

  }
}

- (void)_invalidateAllAssertions
{
  NSObject *v3;
  PGProcessAssertion *startBackgroundPIPAssertion;
  PGProcessAssertion *processAssertion;
  PGProcessAssertion *cancelPictureInPictureFinishTaskAssertion;
  int v7;
  const char *v8;
  __int16 v9;
  PGPictureInPictureRemoteObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PGPictureInPictureRemoteObject _invalidateAllAssertions]";
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s %p ", (uint8_t *)&v7, 0x16u);
  }

  -[PGProcessAssertion invalidate](self->_startBackgroundPIPAssertion, "invalidate");
  startBackgroundPIPAssertion = self->_startBackgroundPIPAssertion;
  self->_startBackgroundPIPAssertion = 0;

  -[PGProcessAssertion invalidate](self->_processAssertion, "invalidate");
  processAssertion = self->_processAssertion;
  self->_processAssertion = 0;

  -[PGProcessAssertion invalidate](self->_cancelPictureInPictureFinishTaskAssertion, "invalidate");
  cancelPictureInPictureFinishTaskAssertion = self->_cancelPictureInPictureFinishTaskAssertion;
  self->_cancelPictureInPictureFinishTaskAssertion = 0;

  -[PGPictureInPictureRemoteObject _invalidateInterruptionBeganFinishTaskAssertion](self, "_invalidateInterruptionBeganFinishTaskAssertion");
}

- (void)_finishCleanup
{
  NSObject *v3;
  void *v4;
  PGPictureInPictureViewController *pictureInPictureViewController;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureRemoteObject delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pictureInPictureRemoteObject:willDestroyPictureInPictureViewController:", self, self->_pictureInPictureViewController);

  -[PGPictureInPictureViewController deactivateAnalyticsSessionIfNeeded](self->_pictureInPictureViewController, "deactivateAnalyticsSessionIfNeeded");
  -[PGPictureInPictureViewController setDelegate:](self->_pictureInPictureViewController, "setDelegate:", 0);
  pictureInPictureViewController = self->_pictureInPictureViewController;
  self->_pictureInPictureViewController = 0;

  -[PGPictureInPictureRemoteObject _invalidateAllAssertions](self, "_invalidateAllAssertions");
  -[PGPictureInPictureRemoteObject pictureInPictureViewController:didTransitionToStashed:](self, "pictureInPictureViewController:didTransitionToStashed:", 0, 0);
}

- (id)_invalidationTimerWithTimeout:(double)a3
{
  return -[PGPictureInPictureRemoteObject _invalidationTimerWithTimeout:block:](self, "_invalidationTimerWithTimeout:block:", 0, a3);
}

- (id)_invalidationTimerWithTimeout:(double)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PGPictureInPictureRemoteObject__invalidationTimerWithTimeout_block___block_invoke;
  v11[3] = &unk_1E6230058;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __70__PGPictureInPictureRemoteObject__invalidationTimerWithTimeout_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *((_QWORD *)WeakRetained + 5);
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = v8 == 10;
      _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "Invalidation timeout fired while isStoppingOrCancelling: %{BOOL}u.", (uint8_t *)v11, 8u);
    }

    if (v8 == 10)
    {
      objc_msgSend(v5, "connection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

    }
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

}

- (BOOL)_isICSVideoCall
{
  _BOOL4 v3;

  v3 = -[PGPictureInPictureRemoteObject isVideoCall](self, "isVideoCall");
  if (v3)
    LOBYTE(v3) = -[PGPictureInPictureRemoteObject _isAppICS](self, "_isAppICS");
  return v3;
}

- (BOOL)_isAppICS
{
  void *v2;
  char v3;

  -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.InCallService"));

  return v3;
}

- (BOOL)_isAssociatedWithOtherObject:(id)a3
{
  PGPictureInPictureRemoteObject *v4;
  PGPictureInPictureRemoteObject *v5;
  void *v6;
  PGPictureInPictureRemoteObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  BOOL v15;
  id WeakRetained;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  int v24;
  const char *v25;
  __int16 v26;
  PGPictureInPictureRemoteObject *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  PGPictureInPictureRemoteObject *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (PGPictureInPictureRemoteObject *)a3;
  if (!-[PGPictureInPictureRemoteObject _isICSVideoCall](self, "_isICSVideoCall")
    && !-[PGPictureInPictureRemoteObject _isICSVideoCall](v4, "_isICSVideoCall"))
  {
    v15 = 0;
    goto LABEL_24;
  }
  if (-[PGPictureInPictureRemoteObject _isICSVideoCall](self, "_isICSVideoCall"))
    v5 = self;
  else
    v5 = v4;
  -[PGPictureInPictureRemoteObject activitySessionIdentifier](v5, "activitySessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGPictureInPictureRemoteObject _isICSVideoCall](self, "_isICSVideoCall"))
    v7 = v4;
  else
    v7 = self;
  -[PGPictureInPictureRemoteObject pictureInPictureApplication](v7, "pictureInPictureApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", v9))
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPictureInPictureRemoteObject pictureInPictureApplication](v4, "pictureInPictureApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136316162;
      v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v11;
      v30 = 2048;
      v31 = v4;
      v32 = 2114;
      v33 = v13;
      v14 = "%s Associating %p %{public}@ with %p %{public}@ because hasMatchingSessionIdentifierAndBundleIdentifier";
LABEL_20:
      _os_log_impl(&dword_1B0CD6000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v24, 0x34u);

    }
  }
  else if (-[PGPictureInPictureRemoteObject _isAppICS](self, "_isAppICS")
         && -[PGPictureInPictureRemoteObject _isAppICS](v4, "_isAppICS"))
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPictureInPictureRemoteObject pictureInPictureApplication](v4, "pictureInPictureApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136316162;
      v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v11;
      v30 = 2048;
      v31 = v4;
      v32 = 2114;
      v33 = v13;
      v14 = "%s Associating %p %{public}@ with %p %{public}@ because one of them is a video call and we always associate ICS with itself";
      goto LABEL_20;
    }
  }
  else
  {
    if ((-[PGPictureInPictureRemoteObject isEqual:](v4, "isEqual:", self->_tetheringRemoteObject) & 1) == 0
      && !-[PGPictureInPictureRemoteObject isEqual:](v4, "isEqual:", self->_tetheredRemoteObject))
    {
      if (-[PGPictureInPictureRemoteObject _isICSVideoCall](v4, "_isICSVideoCall"))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v18 = objc_msgSend(WeakRetained, "pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:", self);

        if (v18)
        {
          PGLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPictureInPictureRemoteObject pictureInPictureApplication](v4, "pictureInPictureApplication");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 136316162;
          v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
          v26 = 2048;
          v27 = self;
          v28 = 2114;
          v29 = v11;
          v30 = 2048;
          v31 = v4;
          v32 = 2114;
          v33 = v13;
          v14 = "%s Associating %p %{public}@ with %p %{public}@ because it has backgroundPIPAuthorization.";
          goto LABEL_20;
        }
      }
      if (-[PGPictureInPictureRemoteObject _isICSVideoCall](v4, "_isICSVideoCall"))
      {
        -[PGPictureInPictureRemoteObject activitySessionIdentifier](v4, "activitySessionIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.InCallService")) & 1) != 0)
        {
          -[PGPictureInPictureRemoteObject activitySessionIdentifier](self, "activitySessionIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPictureInPictureRemoteObject pictureInPictureApplication](self, "pictureInPictureApplication");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v20, "isEqualToString:", v22);

          if ((v23 & 1) == 0)
          {
            PGLogCommon();
            v10 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
              goto LABEL_21;
            -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[PGPictureInPictureRemoteObject pictureInPictureApplication](v4, "pictureInPictureApplication");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "bundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 136316162;
            v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
            v26 = 2048;
            v27 = self;
            v28 = 2114;
            v29 = v11;
            v30 = 2048;
            v31 = v4;
            v32 = 2114;
            v33 = v13;
            v14 = "%s Associating %p %{public}@ with %p %{public}@ because it has an expanse-like activity session identi"
                  "fier and the facetime video call has an ICS bundle for its activity session identifier.";
            goto LABEL_20;
          }
        }
        else
        {

        }
      }
      v15 = 0;
      goto LABEL_22;
    }
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGPictureInPictureRemoteObject pictureInPictureApplication](v4, "pictureInPictureApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 136316162;
      v25 = "-[PGPictureInPictureRemoteObject _isAssociatedWithOtherObject:]";
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v11;
      v30 = 2048;
      v31 = v4;
      v32 = 2114;
      v33 = v13;
      v14 = "%s Associating %p %{public}@ with %p %{public}@ because micropip is active between the objects";
      goto LABEL_20;
    }
  }
LABEL_21:

  v15 = 1;
LABEL_22:

LABEL_24:
  return v15;
}

- (BOOL)_isInActivitySession
{
  int64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  BSDispatchQueueAssertMain();
  v3 = -[PGPictureInPictureRemoteObject contentType](self, "contentType");
  if (-[PGPictureInPictureRemoteObject contentType](self, "contentType") == 6)
  {
    LOBYTE(v4) = 0;
  }
  else if (v3 == 5)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[PGPictureInPictureRemoteObject activitySessionIdentifier](self, "activitySessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureRemoteObject pictureInPictureApplication](self, "pictureInPictureApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", v7) ^ 1;

  }
  return v4;
}

- (void)_invalidateForFailureToStartStopOrCancel
{
  NSXPCConnection **p_connection;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;

  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", objc_msgSend(WeakRetained, "processIdentifier"), CFSTR("Invalidate for failure to start stop or cancel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v6 = objc_loadWeakRetained((id *)p_connection);
  _PGLogMethodProem(self, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "PG_appProxyWithDebugMethodAndPointerProem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCommand commandForInvalidateFromProxy](PGCommand, "commandForInvalidateFromProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleCommand:", v10);

  v11 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke;
  block[3] = &unk_1E6230080;
  v14 = v5;
  v12 = v5;
  objc_copyWeak(&v15, &location);
  dispatch_after(v11, MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke_2;
    block[3] = &unk_1E622F8C0;
    block[4] = v3;
    dispatch_async(v4, block);
  }

}

void __74__PGPictureInPictureRemoteObject__invalidateForFailureToStartStopOrCancel__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)initializePictureInPictureWithControlsStyle:(int64_t)a3 preferredContentSize:(CGSize)a4 sceneIdentifier:(id)a5 affectsAppLifeCycle:(BOOL)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  int64_t v26;
  CGFloat v27;
  CGFloat v28;
  SEL v29;
  BOOL v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  CGSize v36;

  height = a4.height;
  width = a4.width;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a7;
  PGLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    _PGLogMethodProem(self, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36.width = width;
    v36.height = height;
    NSStringFromCGSize(v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v21;
    v33 = 2114;
    v34 = v22;
    _os_log_debug_impl(&dword_1B0CD6000, v16, OS_LOG_TYPE_DEBUG, "%@ preferredContentSize:%{public}@", buf, 0x16u);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v18 == WeakRetained)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke;
    v23[3] = &unk_1E62300F8;
    v23[4] = self;
    v25 = v15;
    v26 = a3;
    v27 = width;
    v28 = height;
    v30 = a6;
    v24 = v14;
    v29 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v15 + 2))(v15, 0, v20);

  }
}

void __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD *v3;
  uint64_t v4;
  PGPIPRemoteObjectSceneController *v5;
  uint64_t v6;
  void *v7;
  char v8;
  NSObject *v9;
  id *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[2];
  char v15;
  _QWORD block[4];
  id v17;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 1);
  v3 = *(_QWORD **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "_setCurrentState:", 1);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 56);
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 304) = *(_OWORD *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(a1 + 40) && !*(_QWORD *)(v4 + 48))
    {
      v5 = -[PGPIPRemoteObjectSceneController initWithRemoteObject:requestedSceneIdentifier:affectsAppLifeCycle:]([PGPIPRemoteObjectSceneController alloc], "initWithRemoteObject:requestedSceneIdentifier:affectsAppLifeCycle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 88));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 48);
      *(_QWORD *)(v6 + 48) = v5;

      v4 = *(_QWORD *)(a1 + 32);
    }
    v8 = *(_BYTE *)(v4 + 113);
    if (v8)
    {
      objc_msgSend(*(id *)(v4 + 48), "activateIfNeeded");
      v4 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v4, "_setCurrentState:", 2);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_3;
    v13[3] = &unk_1E62300D0;
    v10 = (id *)v14;
    v11 = *(id *)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14[0] = v11;
    v14[1] = *(_QWORD *)(a1 + 80);
    v15 = v8;
    v12 = v13;
  }
  else
  {
    v9 = v3[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_2;
    block[3] = &unk_1E62300A8;
    v10 = &v17;
    v17 = *(id *)(a1 + 48);
    v12 = block;
  }
  dispatch_async(v9, v12);

}

void __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePictureInPicturePossible:", *(unsigned __int8 *)(a1 + 56));

  return BSDispatchMain();
}

void __153__PGPictureInPictureRemoteObject_initializePictureInPictureWithControlsStyle_preferredContentSize_sceneIdentifier_affectsAppLifeCycle_completionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  objc_msgSend(WeakRetained, "pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)setupStartAnimated:(BOOL)a3 hostedWindowHostingHandle:(id)a4 sceneSessionPersistentIdentifier:(id)a5 preferredContentSize:(CGSize)a6 initialInterfaceOrientation:(int64_t)a7 initialLayerFrame:(CGRect)a8 completionHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v15;
  CGFloat v16;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id WeakRetained;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  CGFloat v33;
  CGFloat v34;
  SEL v35;
  int64_t v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  BOOL v41;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v15 = a6.height;
  v16 = a6.width;
  v21 = a4;
  v22 = a5;
  v23 = a9;
  PGLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v26 == WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke;
    block[3] = &unk_1E6230170;
    v33 = v16;
    v34 = v15;
    block[4] = self;
    v35 = a2;
    v32 = v23;
    v30 = v22;
    v41 = a3;
    v31 = v21;
    v36 = a7;
    v37 = x;
    v38 = y;
    v39 = width;
    v40 = height;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v23 + 2))(v23, 0, v28);

  }
}

void __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  id WeakRetained;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  PGPictureInPictureViewController *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  uint64_t v39;
  id v40;
  _QWORD block[4];
  id v42;
  id v43;
  _QWORD v44[2];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = *(double *)(a1 + 64);
  v2 = *(double *)(a1 + 72);
  if (!objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 4))
  {
    v28 = -1002;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_124;
    block[3] = &unk_1E6230120;
    v31 = *(id *)(a1 + 56);
    v42 = v29;
    v43 = v31;
    v32 = v29;
    dispatch_async(v30, block);

    return;
  }
  if (!PGSizeIsValid() || (PGSizeIsPositive() & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
    v5 = objc_msgSend(WeakRetained, "pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:", *(_QWORD *)(a1 + 32));

    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(double *)v44 = v3;
        *(double *)&v44[1] = v2;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v44, "{CGSize=dd}");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        _PGLogMethodProem(*(void **)(a1 + 32), 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v33;
        v47 = 2112;
        v48 = v34;
        _os_log_error_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_ERROR, "invalid preferredContentSize %{public}@ %@", buf, 0x16u);

      }
      v28 = -1003;
      goto LABEL_16;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      _PGLogMethodProem(*(void **)(a1 + 32), 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v8;
      _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "Using default initial preferred content size due to background PIP authorization %@", buf, 0xCu);

    }
    v3 = 16.0;
    v2 = 9.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pictureInPictureRemoteObjectShouldAcceptSetupRequest:", *(_QWORD *)(a1 + 32));

  if ((v10 & 1) == 0)
  {
    v28 = -1007;
    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 4);
  v11 = -[PGPictureInPictureViewController initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:]([PGPictureInPictureViewController alloc], "initWithApplication:sourceSceneSessionPersistentIdentifier:controlsStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 256);
  *(_QWORD *)(v12 + 256) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidden:", *(_BYTE *)(a1 + 128) == 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setDelegate:");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 256);
  v17 = objc_loadWeakRetained((id *)(v15 + 264));
  objc_msgSend(v16, "setAnalyticsDelegate:analyticsSourceUUID:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "notePictureInPictureStartedAutomatically:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 112));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setPreferredContentSize:", v3, v2);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 256);
  objc_msgSend(*(id *)(v18 + 144), "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updatePlaybackStateWithDiff:", v20);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "viewModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setInActivitySession:", objc_msgSend(*(id *)(a1 + 32), "_isInActivitySession"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "pagingAccessorySetCurrentPage:numberOfPages:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pictureInPictureRemoteObject:didCreatePictureInPictureViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setHostedWindowHostingHandle:", *(_QWORD *)(a1 + 48));
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 256);
  objc_msgSend(*(id *)(v23 + 48), "sceneView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSceneView:", v25);

  objc_msgSend(*(id *)(a1 + 32), "setSourceSceneSessionPersistentIdentifier:", *(_QWORD *)(a1 + 40));
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_2;
  v38 = &unk_1E6230148;
  v39 = *(_QWORD *)(a1 + 32);
  v40 = *(id *)(a1 + 56);
  v26 = MEMORY[0x1B5E0FE80](&v35);
  v27 = (void *)v26;
  if (*(_BYTE *)(a1 + 128))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "prepareStartAnimationWithInitialInterfaceOrientation:initialLayerFrame:completionHandler:", *(_QWORD *)(a1 + 88), v26, *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), v35, v36, v37, v38, v39);
  else
    (*(void (**)(uint64_t))(v26 + 16))(v26);

}

uint64_t __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_3;
  block[3] = &unk_1E62300A8;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __197__PGPictureInPictureRemoteObject_setupStartAnimated_hostedWindowHostingHandle_sceneSessionPersistentIdentifier_preferredContentSize_initialInterfaceOrientation_initialLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startPictureInPictureAnimated:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  PGPictureInPictureRemoteObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[PGPictureInPictureRemoteObject startPictureInPictureAnimated:completionHandler:]";
    v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v9 == WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke;
    block[3] = &unk_1E6230198;
    block[4] = self;
    v13 = v6;
    v14 = a3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);

  }
}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 5);
  v3 = *(_QWORD *)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    if (*(_BYTE *)(v3 + 113))
    {
      objc_msgSend((id)v3, "_setCurrentState:", 5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "updateInterfaceOrientation");
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pictureInPictureRemoteObject:willShowPictureInPictureViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_4;
      v13 = &unk_1E6230148;
      v5 = *(void **)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = v5;
      v6 = (void *)MEMORY[0x1B5E0FE80](&v10);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "performStartAnimated:withCompletionHandler:", *(unsigned __int8 *)(a1 + 48), v6, v10, v11, v12, v13, v14);

      v7 = v15;
    }
    else
    {
      v9 = *(NSObject **)(v3 + 16);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_3;
      v16[3] = &unk_1E62300A8;
      v17 = *(id *)(a1 + 40);
      dispatch_async(v9, v16);
      v7 = v17;
    }
  }
  else
  {
    v8 = *(NSObject **)(v3 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_2;
    block[3] = &unk_1E62300A8;
    v19 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    v7 = v19;
  }

}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1007, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureRemoteObject:didShowPictureInPictureViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

  if (objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 6))
    objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 6);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_5;
  v6[3] = &unk_1E6230120;
  v5 = v3;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  dispatch_async(v4, v6);

}

uint64_t __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return BSDispatchMain();
}

uint64_t __82__PGPictureInPictureRemoteObject_startPictureInPictureAnimated_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(result + 114)
    && (v3 = objc_msgSend((id)result, "canCancelPictureInPicture"), result = *(_QWORD *)(a1 + 32), v3))
  {
    result = objc_msgSend((id)result, "cancel");
  }
  else if (*(_BYTE *)(result + 115))
  {
    result = objc_msgSend((id)result, "pictureInPictureViewControllerDidRequestStop:", *(_QWORD *)(result + 256));
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 114) = 0;
  return result;
}

- (void)updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding:(CGRect)a3 withCompletionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  NSObject *v11;
  id v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(id, _QWORD, void *);
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _QWORD v26[4];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, _QWORD, void *))a4;
  PGLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v12 != WeakRetained)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -1001;
LABEL_14:
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v17);

    goto LABEL_15;
  }
  if ((PGRectIsValid() & 1) == 0)
  {
    PGLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(CGFloat *)v26 = x;
      *(CGFloat *)&v26[1] = y;
      *(CGFloat *)&v26[2] = width;
      *(CGFloat *)&v26[3] = height;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v26, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      _PGLogMethodProem(self, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_error_impl(&dword_1B0CD6000, v16, OS_LOG_TYPE_ERROR, "invalid initialLayerFrame %{public}@ %@", buf, 0x16u);

    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -1003;
    goto LABEL_14;
  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke;
  v20[3] = &unk_1E62301C0;
  v20[4] = self;
  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  v21 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

LABEL_15:
}

void __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v1 + 320) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v1 + 336) = v2;
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E62300A8;
  v6 = v3;
  dispatch_async(v4, block);

}

uint64_t __130__PGPictureInPictureRemoteObject_updateInitialLayerFrameForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v10 == WeakRetained)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke;
    block[3] = &unk_1E622F8E8;
    block[4] = self;
    v14 = v6;
    v15 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

void __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setSourceSceneSessionPersistentIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E62300A8;
  v4 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

uint64_t __151__PGPictureInPictureRemoteObject_updateSourceSceneSessionPersistentIdentifierForInteractiveTransitionAnimationUponBackgrounding_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatePreferredContentSize:(CGSize)a3 withCompletionHandler:(id)a4
{
  double height;
  double width;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  CGSize v22;

  height = a3.height;
  width = a3.width;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, void *))a4;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22.width = width;
    v22.height = height;
    NSStringFromCGSize(v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412546;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%@ preferredContentSize:%{public}@", (uint8_t *)&v17, 0x16u);

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v12 == WeakRetained)
  {
    if (!self->_queue_outstandingRotationAnimationsCount)
    {
      -[PGPictureInPictureRemoteObject _updatePreferredContentSize:withCompletionHandler:](self, "_updatePreferredContentSize:withCompletionHandler:", v7, width, height);
      goto LABEL_12;
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -1002;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = -1001;
  }
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v16);

LABEL_12:
}

- (void)_updatePreferredContentSize:(CGSize)a3 withCompletionHandler:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  CGFloat v16;
  CGFloat v17;
  _QWORD block[5];
  id v19;
  CGFloat v20;
  CGFloat v21;
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  height = a3.height;
  width = a3.width;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  if (PGSizeIsValid() && (PGSizeIsPositive() & 1) != 0)
  {
    if (self->_currentState == 6)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke;
      block[3] = &unk_1E62301E8;
      block[4] = self;
      v20 = width;
      v21 = height;
      v19 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v9 = v19;
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_3;
      v14[3] = &unk_1E62301E8;
      v14[4] = self;
      v16 = width;
      v17 = height;
      v15 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], v14);
      v9 = v15;
    }

  }
  else
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(CGFloat *)v22 = width;
      *(CGFloat *)&v22[1] = height;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{CGSize=dd}");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _PGLogMethodProem(self, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_error_impl(&dword_1B0CD6000, v10, OS_LOG_TYPE_ERROR, "invalid preferredContentSize %{public}@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1003, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 304) = *(_OWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setPreferredContentSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E62300A8;
  v5 = v2;
  dispatch_async(v3, block);

}

uint64_t __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 304) = *(_OWORD *)(a1 + 48);
  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_4;
  block[3] = &unk_1E62300A8;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __84__PGPictureInPictureRemoteObject__updatePreferredContentSize_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)checkActivePictureInPictureCancellationPolicyWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *, uint64_t, uint64_t);
  NSObject *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *, uint64_t, uint64_t);

  v4 = (void (**)(id, _QWORD, void *, uint64_t, uint64_t))a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v7 != WeakRetained)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -1001;
LABEL_12:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v11, 1, 1);

    goto LABEL_13;
  }
  if ((self->_currentState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -1002;
    goto LABEL_12;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__PGPictureInPictureRemoteObject_checkActivePictureInPictureCancellationPolicyWithCompletion___block_invoke;
  v12[3] = &unk_1E6230148;
  v12[4] = self;
  v13 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

LABEL_13:
}

uint64_t __94__PGPictureInPictureRemoteObject_checkActivePictureInPictureCancellationPolicyWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pictureInPictureRemoteObjectShouldUpdateCancellationPolicyOnStart:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)rotateContentContainer:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[5];
  id v15;
  int64_t v16;

  v6 = a4;
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v9 != WeakRetained)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = -1001;
LABEL_12:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v6 + 2))(v6, 0, v13, 0);

    goto LABEL_13;
  }
  if (self->_currentState != 6)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = -1002;
    goto LABEL_12;
  }
  ++self->_queue_outstandingRotationAnimationsCount;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke;
  block[3] = &unk_1E622FFC0;
  block[4] = self;
  v16 = a3;
  v15 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

LABEL_13:
}

void __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  v1 = a1[4];
  v2 = (void *)a1[5];
  v3 = *(void **)(v1 + 256);
  v4 = a1[6];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E622FFC0;
  v5[4] = v1;
  v7 = v4;
  v6 = v2;
  objc_msgSend(v3, "performRotateAnimationWithRotation:completionHandler:", v4, v5);

}

void __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v2 = (void *)MEMORY[0x1B5E0FCE8]();
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[4];
  v5 = (void *)a1[5];
  v6 = *(NSObject **)(v4 + 16);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_3;
  v8[3] = &unk_1E6230238;
  v8[1] = 3221225472;
  v11 = a1[6];
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, v8);

  objc_autoreleasePoolPop(v2);
}

void __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  double *v2;
  double v3;
  double v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(double **)(a1 + 32);
  if (*(_QWORD *)(a1 + 56) > 1uLL)
  {
    --*((_QWORD *)v2 + 3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = v2[38];
    v3 = v2[39];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_4;
    v5[3] = &unk_1E6230210;
    v5[4] = v2;
    v7 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_updatePreferredContentSize:withCompletionHandler:", v5, v3, v4);

  }
}

uint64_t __79__PGPictureInPictureRemoteObject_rotateContentContainer_withCompletionHandler___block_invoke_4(_QWORD *a1)
{
  --*(_QWORD *)(a1[4] + 24);
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[6] + 16))(a1[6], 1, 0, a1[5]);
}

- (void)setupStopAnimated:(BOOL)a3 needsApplicationActivation:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  BOOL v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;

  v8 = a5;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v11 == WeakRetained)
  {
    v14 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke;
    v22[3] = &unk_1E6230198;
    v22[4] = self;
    v15 = v8;
    v23 = v15;
    v24 = a4;
    v16 = (void *)MEMORY[0x1B5E0FE80](v22);
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_7;
    block[3] = &unk_1E6230288;
    block[4] = self;
    v21 = a3;
    v19 = v15;
    v20 = v16;
    v17 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v13);

  }
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[5];
  id v6;
  char v7;

  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_2;
  block[3] = &unk_1E622FF48;
  v4 = v2;
  v7 = *(_BYTE *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, block);

}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_2(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_3;
  v5[3] = &unk_1E622F788;
  v6 = *(id *)(a1 + 40);
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E0FE80](v5);
  v3 = v2;
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = v2;
    BSDispatchMain();

  }
  else
  {
    v2[2](v2, 1, 0);
  }

}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1005, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sourceSceneSessionPersistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_5;
  v6[3] = &unk_1E6230260;
  v5 = *(id *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "pictureInPictureRemoteObject:requestActivationOfSceneWithPersistenceIdentier:completion:", v3, v4, v6);

}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_5(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v4 = objc_msgSend(WeakRetained, "processIdentifier");
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 288);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_6;
    v7[3] = &unk_1E622F788;
    v8 = v5;
    PGActivateApplication(v4, v6, v7);

  }
}

uint64_t __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_7(uint64_t a1)
{
  char v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[4];
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 10);
  v3 = *(_QWORD **)(a1 + 32);
  if ((v2 & 1) == 0)
  {
    v6 = v3[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_8;
    block[3] = &unk_1E62300A8;
    v10 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
    v5 = v10;
    goto LABEL_5;
  }
  objc_msgSend(v3, "_setCurrentState:", 10);
  if (*(_BYTE *)(a1 + 56))
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_9;
    v7[3] = &unk_1E62300A8;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v4, "prepareStopAnimationWithCompletionHandler:", v7);
    v5 = v8;
LABEL_5:

    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __97__PGPictureInPictureRemoteObject_setupStopAnimated_needsApplicationActivation_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopPictureInPictureAnimated:(BOOL)a3 withFinalInterfaceOrientation:(int64_t)a4 finalLayerFrame:(CGRect)a5 completionHandler:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id WeakRetained;
  void *v18;
  _QWORD v19[5];
  id v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  int64_t v25;
  BOOL v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  PGPictureInPictureRemoteObject *v30;
  uint64_t v31;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v31 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  PGLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[PGPictureInPictureRemoteObject stopPictureInPictureAnimated:withFinalInterfaceOrientation:finalLayerFrame:co"
          "mpletionHandler:]";
    v29 = 2048;
    v30 = self;
    _os_log_impl(&dword_1B0CD6000, v14, OS_LOG_TYPE_DEFAULT, "%s %p ", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v16 == WeakRetained)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke;
    v19[3] = &unk_1E62302B0;
    v19[4] = self;
    v20 = v13;
    v21 = x;
    v22 = y;
    v23 = width;
    v24 = height;
    v26 = a3;
    v25 = a4;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v13 + 2))(v13, 0, v18, 0);

  }
}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[4];
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:", 11);
  v3 = *(_QWORD **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "_setCurrentState:", 11);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pictureInPictureRemoteObject:willHidePictureInPictureViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3;
    v9[3] = &unk_1E6230148;
    v5 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    v6 = (void *)MEMORY[0x1B5E0FE80](v9);
    objc_msgSend(*(id *)(a1 + 32), "_stopTethering");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "notePictureInPictureWillStopForAppRequest:preferredFullScreenRestore:", 1, !CGRectIsNull(*(CGRect *)(a1 + 48)));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "performStopAnimated:withFinalInterfaceOrientation:finalLayerFrame:completionHandler:", *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 80), v6, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

    v7 = v10;
  }
  else
  {
    v8 = v3[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2;
    block[3] = &unk_1E62300A8;
    v12 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    v7 = v12;
  }

}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v1 + 16))(v1, 0, v2, 0);

}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pictureInPictureRemoteObject:didHidePictureInPictureViewController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));

  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4;
  block[3] = &unk_1E62300A8;
  v6 = v3;
  dispatch_async(v4, block);

}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_4(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_5;
  block[3] = &unk_1E62300A8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __127__PGPictureInPictureRemoteObject_stopPictureInPictureAnimated_withFinalInterfaceOrientation_finalLayerFrame_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)cleanupWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  void (**v13)(id, _QWORD, void *);

  v4 = (void (**)(id, _QWORD, void *))a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v7 != WeakRetained)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -1001;
LABEL_12:
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v11);

    goto LABEL_13;
  }
  if (self->_currentState != 11)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = -1002;
    goto LABEL_12;
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6230148;
  v12[4] = self;
  v13 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

LABEL_13:
}

void __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setHostedWindowHostingHandle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setSceneView:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 2);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E6230120;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

void __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E622F8C0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __63__PGPictureInPictureRemoteObject_cleanupWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_finishCleanup");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
  objc_msgSend(WeakRetained, "pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)setPictureInPictureShouldStartWhenEnteringBackground:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  NSObject *v8;
  id v9;
  id WeakRetained;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  PGPictureInPictureRemoteObject *v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (self->_pictureInPictureShouldStartWhenEnteringBackground != v4)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = "-[PGPictureInPictureRemoteObject setPictureInPictureShouldStartWhenEnteringBackground:completionHandler:]";
      v14 = 2048;
      v15 = self;
      v16 = 1024;
      v17 = v4;
      _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{BOOL}u", (uint8_t *)&v12, 0x1Cu);
    }

  }
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v9 == WeakRetained)
  {
    self->_pictureInPictureShouldStartWhenEnteringBackground = v4;
    v6[2](v6, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v11);

  }
}

- (void)updatePlaybackStateWithDiff:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id WeakRetained;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  PGPictureInPictureRemoteObject *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[PGPictureInPictureRemoteObject updatePlaybackStateWithDiff:]";
    v13 = 2048;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v7 == WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__PGPictureInPictureRemoteObject_updatePlaybackStateWithDiff___block_invoke;
    v9[3] = &unk_1E622F898;
    v9[4] = self;
    v10 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __62__PGPictureInPictureRemoteObject_updatePlaybackStateWithDiff___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  PGPlaybackState *v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  id WeakRetained;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "contentType");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  if (v3)
  {
    objc_msgSend(v3, "updatePlaybackStateWithDiff:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = -[PGPlaybackState initWithDictionary:]([PGPlaybackState alloc], "initWithDictionary:", *(_QWORD *)(a1 + 40));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v4;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "updatePlaybackStateWithDiff:", *(_QWORD *)(a1 + 40));
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "backgroundAudioPolicy") == 1
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "backgroundAudioPolicy") == 3;
  if (v7 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "isExemptFromUILockInterruptionsWhenActive"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setExemptFromUILockInterruptionsWhenActive:", v7);
    objc_msgSend(*(id *)(a1 + 32), "_updateActiveProxyAndViewControllerOfInterruptionIfNeeded");
  }
  if (v2 != objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "contentType"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 240));
    objc_msgSend(WeakRetained, "pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:", *(_QWORD *)(a1 + 32));

  }
}

- (void)updateMenuItems:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id WeakRetained;
  BOOL v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17[2];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  PGPictureInPictureRemoteObject *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureRemoteObject updateMenuItems:].cold.2();

  }
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[PGPictureInPictureRemoteObject updateMenuItems:]";
    v20 = 2048;
    v21 = self;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v10 = v8 == WeakRetained;

  if (v10)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke;
    v16[3] = &unk_1E6230300;
    objc_copyWeak(v17, (id *)buf);
    v16[4] = self;
    v17[1] = (id)a2;
    objc_msgSend(v5, "bs_map:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)&self->_connection);
    v13 = objc_msgSend(v12, "PG_hasMenuItemProviderEntitlement");

    if (v13)
    {
      v15 = v11;
      BSDispatchMain();

    }
    else
    {
      PGLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PGPictureInPictureRemoteObject updateMenuItems:].cold.1(v14);

    }
    objc_destroyWeak(v17);
  }
  objc_destroyWeak((id *)buf);

}

PGMenuItem *__50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGMenuItem *v4;
  void *v5;
  PGMenuItem *v6;
  _QWORD v8[5];
  id v9[2];

  v3 = a2;
  v4 = [PGMenuItem alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_2;
  v8[3] = &unk_1E62302D8;
  objc_copyWeak(v9, (id *)(a1 + 40));
  v5 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9[1] = v5;
  v6 = -[PGMenuItem initWithDictionary:action:](v4, "initWithDictionary:action:", v3, v8);
  objc_destroyWeak(v9);

  return v6;
}

void __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[6];
  id v9;
  uint64_t v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[2];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_3;
    v8[3] = &unk_1E622FE08;
    v7 = *(_QWORD *)(a1 + 32);
    v8[4] = WeakRetained;
    v8[5] = v7;
    v10 = *(_QWORD *)(a1 + 48);
    v9 = v3;
    dispatch_async(v6, v8);

  }
}

void __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 40), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCommand commandForMenuItemSelected:](PGCommand, "commandForMenuItemSelected:", objc_msgSend(*(id *)(a1 + 48), "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCommand:", v5);

}

uint64_t __50__PGPictureInPictureRemoteObject_updateMenuItems___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setMenuItems:", *(_QWORD *)(a1 + 40));
}

- (void)setActivitySessionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  _QWORD v8[4];
  id v9;
  PGPictureInPictureRemoteObject *v10;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v6 == WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__PGPictureInPictureRemoteObject_setActivitySessionIdentifier___block_invoke;
    v8[3] = &unk_1E622F898;
    v9 = v4;
    v10 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

void __63__PGPictureInPictureRemoteObject_setActivitySessionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id WeakRetained;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 248), "bundleIdentifier");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 40), "activitySessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v8, "activitySessionIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315906;
      v21 = "-[PGPictureInPictureRemoteObject setActivitySessionIdentifier:]_block_invoke";
      v22 = 2048;
      v23 = v8;
      v24 = 2114;
      v25 = v4;
      v26 = 2114;
      v27 = v9;
      _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@ --> %{public}@", (uint8_t *)&v20, 0x2Au);

    }
    v10 = objc_msgSend(v4, "copy");
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 128);
    *(_QWORD *)(v11 + 128) = v10;

    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 232);
    *(_QWORD *)(v13 + 232) = 0;

    if (objc_msgSend(*(id *)(a1 + 40), "currentState") == 6)
    {
      v15 = objc_msgSend(v4, "copy");
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(v16 + 232);
      *(_QWORD *)(v16 + 232) = v15;

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 240));
    objc_msgSend(WeakRetained, "pictureInPictureRemoteObjectNeedsActivationAndInterruptionPolicyUpdate:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 256), "viewModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setInActivitySession:", objc_msgSend(*(id *)(a1 + 40), "_isInActivitySession"));

  }
}

- (void)setExemptAttributionOverride:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  if (v6 == WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__PGPictureInPictureRemoteObject_setExemptAttributionOverride___block_invoke;
    v8[3] = &unk_1E622F898;
    v8[4] = self;
    v9 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

  }
}

uint64_t __63__PGPictureInPictureRemoteObject_setExemptAttributionOverride___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = v2;

  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 136315394;
    v11 = "-[PGPictureInPictureRemoteObject setExemptAttributionOverride:]_block_invoke";
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 136);
  if (!v8)
    v8 = *(_QWORD *)(v7 + 296);
  objc_msgSend(*(id *)(v7 + 152), "setExemptAttribution:", v8);
  return objc_msgSend(*(id *)(a1 + 32), "_updateActiveProxyAndViewControllerOfInterruptionIfNeeded");
}

- (void)stopPictureInPictureAndRestoreUserInterface
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  PGPictureInPictureRemoteObject *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PGPictureInPictureApplication bundleIdentifier](self->_pictureInPictureApplication, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v6 = "-[PGPictureInPictureRemoteObject stopPictureInPictureAndRestoreUserInterface]";
    v7 = 2048;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1B0CD6000, v3, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);

  }
  if (-[PGPictureInPictureRemoteObject _isAppICS](self, "_isAppICS"))
    BSDispatchMain();
}

uint64_t __77__PGPictureInPictureRemoteObject_stopPictureInPictureAndRestoreUserInterface__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pictureInPictureViewControllerDidRequestStop:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256));
}

- (void)pagingAccessorySetCurrentPage:(unint64_t)a3 numberOfPages:(unint64_t)a4
{
  _QWORD block[7];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PGPictureInPictureRemoteObject_pagingAccessorySetCurrentPage_numberOfPages___block_invoke;
  block[3] = &unk_1E6230008;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __78__PGPictureInPictureRemoteObject_pagingAccessorySetCurrentPage_numberOfPages___block_invoke(_QWORD *a1)
{
  *(_QWORD *)(a1[4] + 168) = a1[5];
  *(_QWORD *)(a1[4] + 176) = a1[6];
  return objc_msgSend(*(id *)(a1[4] + 256), "pagingAccessorySetCurrentPage:numberOfPages:", a1[5], a1[6]);
}

- (void)setExemptAttribution:(id)a3
{
  NSString *v4;
  NSString *exemptAttribution;
  NSString *v6;
  NSString *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  PGPictureInPictureRemoteObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  BSDispatchQueueAssertMain();
  exemptAttribution = self->_exemptAttribution;
  if (exemptAttribution != v4 && !-[NSString isEqualToString:](exemptAttribution, "isEqualToString:", v4))
  {
    v6 = (NSString *)-[NSString copy](v4, "copy");
    v7 = self->_exemptAttribution;
    self->_exemptAttribution = v6;

    if (!self->_exemptAttributionOverride)
    {
      PGLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315394;
        v10 = "-[PGPictureInPictureRemoteObject setExemptAttribution:]";
        v11 = 2114;
        v12 = self;
        _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v9, 0x16u);
      }

      -[PGInterruptionAssistant setExemptAttribution:](self->_interruptionAssistant, "setExemptAttribution:", v4);
      -[PGPictureInPictureRemoteObject _updateActiveProxyAndViewControllerOfInterruptionIfNeeded](self, "_updateActiveProxyAndViewControllerOfInterruptionIfNeeded");
    }
  }

}

- (void)_updateActiveProxyAndViewControllerOfInterruptionIfNeeded
{
  NSObject *queue;
  _QWORD block[5];

  BSDispatchQueueAssertMain();
  -[PGPictureInPictureViewController setInterrupted:](self->_pictureInPictureViewController, "setInterrupted:", -[PGInterruptionAssistant isInterrupted](self->_interruptionAssistant, "isInterrupted"));
  -[PGPictureInPictureRemoteObject _acquireOrInvalidateProcessAssertionIfNeeded](self, "_acquireOrInvalidateProcessAssertionIfNeeded");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PGPictureInPictureRemoteObject__updateActiveProxyAndViewControllerOfInterruptionIfNeeded__block_invoke;
  block[3] = &unk_1E622F8C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __91__PGPictureInPictureRemoteObject__updateActiveProxyAndViewControllerOfInterruptionIfNeeded__block_invoke(uint64_t a1)
{
  int v2;
  id *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "shouldNotifyProxyOfInterruptionBegan");
  v3 = *(id **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "_queue_notifyProxyOfInterruptionBegan");
  result = objc_msgSend(v3[19], "shouldNotifyProxyOfInterruptionEnded");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyProxyOfInterruptionEnded");
  return result;
}

- (BOOL)_currentStateAllowsProcessAssertion
{
  unint64_t currentState;

  BSDispatchQueueAssertMain();
  currentState = self->_currentState;
  if (currentState > 0xD)
    return 0;
  if (((1 << currentState) & 0x2F80) != 0)
    return self->_processAssertion != 0;
  return ((1 << currentState) & 0x78) != 0;
}

- (BOOL)_wantsProcessAssertion
{
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;

  BSDispatchQueueAssertMain();
  v3 = -[PGPictureInPictureRemoteObject _currentStateAllowsProcessAssertion](self, "_currentStateAllowsProcessAssertion");
  if (v3)
  {
    v4 = -[PGInterruptionAssistant isInterrupted](self->_interruptionAssistant, "isInterrupted");
    v5 = -[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 1);
    LOBYTE(v3) = !v5;
    if (!v5 && v4)
      LOBYTE(v3) = -[PGPictureInPictureRemoteObject isVideoCall](self, "isVideoCall");
  }
  return v3;
}

- (void)_acquireOrInvalidateProcessAssertionIfNeeded
{
  _BOOL4 v3;
  PGProcessAssertion *processAssertion;
  NSObject *v5;
  id WeakRetained;
  PGProcessAssertion *v7;
  PGProcessAssertion *v8;
  PGProcessAssertion *startBackgroundPIPAssertion;
  NSObject *v10;
  id v11;
  id v12;
  PGProcessAssertion *v13;
  PGProcessAssertion *interruptionBeganFinishTaskAssertion;
  dispatch_time_t v15;
  PGProcessAssertion *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *(*v19)(uint64_t);
  void *v20;
  id v21;
  PGPictureInPictureRemoteObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  PGPictureInPictureRemoteObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v3 = -[PGPictureInPictureRemoteObject _wantsProcessAssertion](self, "_wantsProcessAssertion");
  processAssertion = self->_processAssertion;
  if (v3)
  {
    if (processAssertion)
      return;
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGPictureInPictureRemoteObject _acquireOrInvalidateProcessAssertionIfNeeded]";
      v25 = 2048;
      v26 = self;
      _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "%s %p Acquiring process assertion", buf, 0x16u);
    }

    -[PGPictureInPictureRemoteObject _invalidateInterruptionBeganFinishTaskAssertion](self, "_invalidateInterruptionBeganFinishTaskAssertion");
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    +[PGProcessAssertion pipVisibleAssertionForProcessWithIdentifier:explanation:legacy:](PGProcessAssertion, "pipVisibleAssertionForProcessWithIdentifier:explanation:legacy:", objc_msgSend(WeakRetained, "processIdentifier"), CFSTR("PIP Visible Assertion"), self->_sceneControllerIfExists == 0);
    v7 = (PGProcessAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_processAssertion;
    self->_processAssertion = v7;

    -[PGPIPRemoteObjectSceneController setForeground:](self->_sceneControllerIfExists, "setForeground:", 1);
    -[PGProcessAssertion invalidate](self->_startBackgroundPIPAssertion, "invalidate");
    startBackgroundPIPAssertion = self->_startBackgroundPIPAssertion;
    self->_startBackgroundPIPAssertion = 0;
  }
  else
  {
    if (!processAssertion)
      return;
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[PGPictureInPictureRemoteObject _acquireOrInvalidateProcessAssertionIfNeeded]";
      v25 = 2048;
      v26 = self;
      _os_log_impl(&dword_1B0CD6000, v10, OS_LOG_TYPE_DEFAULT, "%s %p Invalidating process assertion", buf, 0x16u);
    }

    -[PGPictureInPictureRemoteObject _invalidateInterruptionBeganFinishTaskAssertion](self, "_invalidateInterruptionBeganFinishTaskAssertion");
    v11 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_storeStrong((id *)&self->_finishTaskInvalidationUUID, v11);
    v12 = objc_loadWeakRetained((id *)&self->_connection);
    +[PGProcessAssertion transientTaskAssertionForProcessWithIdentifier:explanation:](PGProcessAssertion, "transientTaskAssertionForProcessWithIdentifier:explanation:", objc_msgSend(v12, "processIdentifier"), CFSTR("interruption began assertion"));
    v13 = (PGProcessAssertion *)objc_claimAutoreleasedReturnValue();
    interruptionBeganFinishTaskAssertion = self->_interruptionBeganFinishTaskAssertion;
    self->_interruptionBeganFinishTaskAssertion = v13;

    v15 = dispatch_time(0, 3000000000);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __78__PGPictureInPictureRemoteObject__acquireOrInvalidateProcessAssertionIfNeeded__block_invoke;
    v20 = &unk_1E622F898;
    v21 = v11;
    v22 = self;
    startBackgroundPIPAssertion = (PGProcessAssertion *)v11;
    dispatch_after(v15, MEMORY[0x1E0C80D38], &v17);
    -[PGProcessAssertion invalidate](self->_processAssertion, "invalidate", v17, v18, v19, v20);
    v16 = self->_processAssertion;
    self->_processAssertion = 0;

    -[PGPIPRemoteObjectSceneController setForeground:](self->_sceneControllerIfExists, "setForeground:", 0);
  }

}

_QWORD *__78__PGPictureInPictureRemoteObject__acquireOrInvalidateProcessAssertionIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[11])
    return (_QWORD *)objc_msgSend(result, "_invalidateInterruptionBeganFinishTaskAssertion");
  return result;
}

- (void)_queue_notifyProxyOfInterruptionBegan
{
  void *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  PGPictureInPictureRemoteObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PGInterruptionAssistant noteDidNotifyProxyOfInterruptionBegan](self->_interruptionAssistant, "noteDidNotifyProxyOfInterruptionBegan");
  +[PGCommand commandForBeginInterruption](PGCommand, "commandForBeginInterruption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PGLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = self;
    _os_log_impl(&dword_1B0CD6000, v4, OS_LOG_TYPE_DEFAULT, "remote object %p notifying proxy of pictureInPictureInterruptionBegan", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  _PGLogMethodProem(self, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleCommand:", v8);

}

- (void)_queue_notifyProxyOfInterruptionEnded
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  PGPictureInPictureRemoteObject *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PGInterruptionAssistant allowsResumingAfterInterruptionEnds](self->_interruptionAssistant, "allowsResumingAfterInterruptionEnds");
  -[PGInterruptionAssistant noteDidNotifyProxyOfInterruptionEnded](self->_interruptionAssistant, "noteDidNotifyProxyOfInterruptionEnded");
  +[PGCommand commandForEndInterruptionWithShouldResumeSuggestion:](PGCommand, "commandForEndInterruptionWithShouldResumeSuggestion:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218240;
    v11 = self;
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_1B0CD6000, v5, OS_LOG_TYPE_DEFAULT, "remote object %p notifying proxy of pictureInPictureInterruptionEnded shouldResumeSuggestion %{BOOL}u", (uint8_t *)&v10, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  _PGLogMethodProem(self, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleCommand:", v9);

}

- (void)handleCommand:(id)a3
{
  -[PGPictureInPictureRemoteObject pictureInPictureViewController:didReceiveCommand:](self, "pictureInPictureViewController:didReceiveCommand:", self->_pictureInPictureViewController, a3);
}

- (void)pictureInPictureViewController:(id)a3 updateHostedWindowSize:(CGSize)a4 animationType:(int64_t)a5 initialSpringVelocity:(double)a6
{
  double height;
  double width;
  id v12;
  NSObject *v13;
  NSObject *v14;
  PGPIPRemoteObjectSceneController *sceneControllerIfExists;
  void *v16;
  void *v17;
  NSObject *queue;
  id v19;
  _QWORD block[5];
  id v21;
  SEL v22;
  double v23;
  double v24;
  int64_t v25;
  double v26;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  PGLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  sceneControllerIfExists = self->_sceneControllerIfExists;
  if (sceneControllerIfExists)
  {
    -[PGPIPRemoteObjectSceneController updateSize:animationType:initialSpringVelocity:](sceneControllerIfExists, "updateSize:animationType:initialSpringVelocity:", a5, width, height, a6);
  }
  else
  {
    v16 = (void *)MEMORY[0x1B5E0FCE8]();
    objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __124__PGPictureInPictureRemoteObject_pictureInPictureViewController_updateHostedWindowSize_animationType_initialSpringVelocity___block_invoke;
    block[3] = &unk_1E6230328;
    v21 = v17;
    v22 = a2;
    v23 = width;
    v24 = height;
    v25 = a5;
    v26 = a6;
    block[4] = self;
    v19 = v17;
    dispatch_async(queue, block);

    objc_autoreleasePoolPop(v16);
  }

}

void __124__PGPictureInPictureRemoteObject_pictureInPictureViewController_updateHostedWindowSize_animationType_initialSpringVelocity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateHostedWindowSize:animationType:initialSpringVelocity:synchronizationFence:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 80));

}

- (void)pictureInPictureViewControllerHostedWindowSizeChangeBegan:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];

  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeBegan___block_invoke;
  v8[3] = &unk_1E622FC00;
  v8[4] = self;
  v8[5] = a2;
  dispatch_async(queue, v8);
}

void __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeBegan___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostedWindowSizeChangeBegan");

}

- (void)pictureInPictureViewControllerHostedWindowSizeChangeEnded:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[6];

  PGLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeEnded___block_invoke;
  v8[3] = &unk_1E622FC00;
  v8[4] = self;
  v8[5] = a2;
  dispatch_async(queue, v8);
}

void __92__PGPictureInPictureRemoteObject_pictureInPictureViewControllerHostedWindowSizeChangeEnded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostedWindowSizeChangeEnded");

}

- (void)pictureInPictureViewControllerDidRequestStop:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  int v10;
  const char *v11;
  __int16 v12;
  PGPictureInPictureRemoteObject *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PGPictureInPictureRemoteObject canStopPictureInPicture](self, "canStopPictureInPicture");
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[PGPictureInPictureRemoteObject pictureInPictureViewControllerDidRequestStop:]";
    v12 = 2048;
    v13 = self;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %p canStop: %{BOOL}u", (uint8_t *)&v10, 0x1Cu);
  }

  if (v5)
  {
    self->_hasPendingStopRequest = 0;
    -[PGPictureInPictureViewController notePictureInPictureWillStopForAppRequest:preferredFullScreenRestore:](self->_pictureInPictureViewController, "notePictureInPictureWillStopForAppRequest:preferredFullScreenRestore:", 0, 1);
    -[PGPictureInPictureRemoteObject delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureRemoteObject sourceSceneSessionPersistentIdentifier](self, "sourceSceneSessionPersistentIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pictureInPictureRemoteObject:didRequestPictureInPictureStopForViewController:sourceSceneSessionIdentifier:animated:", self, v4, v8, 1);

  }
  else
  {
    v9 = !self->_hasPendingCancellationRequest
      && -[PGPictureInPictureRemoteObject isStartingPictureInPicture](self, "isStartingPictureInPicture");
    self->_hasPendingStopRequest = v9;
  }

}

- (void)pictureInPictureViewController:(id)a3 didReceiveCommand:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *queue;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD block[5];
  id v15;
  SEL v16;

  v7 = a3;
  v8 = a4;
  PGLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureRemoteObject dealloc].cold.1();

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  switch(objc_msgSend(v8, "systemAction"))
  {
    case 0:
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke;
      block[3] = &unk_1E6230350;
      block[4] = self;
      v16 = a2;
      v15 = v8;
      dispatch_async(queue, block);

      break;
    case 1:
      v12 = self->_queue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke_2;
      v13[3] = &unk_1E622FC00;
      v13[4] = self;
      v13[5] = a2;
      dispatch_async(v12, v13);
      break;
    case 2:
      -[PGPictureInPictureRemoteObject _stopTethering](self, "_stopTethering");
      -[PGPictureInPictureRemoteObject pictureInPictureViewControllerDidRequestStop:](self, "pictureInPictureViewControllerDidRequestStop:", v7);
      break;
    case 3:
      -[PGPictureInPictureRemoteObject _stopTethering](self, "_stopTethering");
      -[PGPictureInPictureRemoteObject pictureInPictureViewControllerDidRequestCancel:](self, "pictureInPictureViewControllerDidRequestCancel:", v7);
      break;
    default:
      break;
  }

}

void __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleCommand:", v4);

}

void __83__PGPictureInPictureRemoteObject_pictureInPictureViewController_didReceiveCommand___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionButtonTapped");

}

- (void)pictureInPictureViewControllerDidRequestCancel:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  PGPictureInPictureRemoteObject *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    PGLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v5 = -[PGPictureInPictureRemoteObject canCancelPictureInPicture](self, "canCancelPictureInPicture");
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "-[PGPictureInPictureRemoteObject pictureInPictureViewControllerDidRequestCancel:]";
    v9 = 2048;
    v10 = self;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %p canCancel: %{BOOL}u", (uint8_t *)&v7, 0x1Cu);
  }

  if (v5)
    -[PGPictureInPictureRemoteObject cancel](self, "cancel");
}

- (void)pictureInPictureViewController:(id)a3 didTransitionToStashed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *considerStashedPlaybackAsBackgroundAudioTimer;
  NSTimer *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PGLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _PGLogMethodProem(self, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v8;
    v17 = 1024;
    v18 = v4;
    v19 = 1024;
    v20 = -[PGPictureInPictureRemoteObject _isUnderLock](self, "_isUnderLock");
    _os_log_impl(&dword_1B0CD6000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ setStashed:%{BOOL}u [self _isUnderLock]:%{BOOL}u", buf, 0x18u);

  }
  self->_stashed = v4;
  if (v4)
  {
    -[PGPictureInPictureRemoteObject _notifyProxyOfStashedOrUnderLock:](self, "_notifyProxyOfStashedOrUnderLock:", 1);
    if (-[PGPlaybackState backgroundAudioPolicy](self->_playbackState, "backgroundAudioPolicy") == 2
      && !self->_considerStashedPlaybackAsBackgroundAudioTimer)
    {
      objc_initWeak((id *)buf, self);
      v9 = (void *)MEMORY[0x1E0C99E88];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __88__PGPictureInPictureRemoteObject_pictureInPictureViewController_didTransitionToStashed___block_invoke;
      v13[3] = &unk_1E622FD20;
      objc_copyWeak(&v14, (id *)buf);
      objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, v13, 30.0);
      v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      considerStashedPlaybackAsBackgroundAudioTimer = self->_considerStashedPlaybackAsBackgroundAudioTimer;
      self->_considerStashedPlaybackAsBackgroundAudioTimer = v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    -[PGPictureInPictureRemoteObject _notifyProxyOfStashedOrUnderLock:](self, "_notifyProxyOfStashedOrUnderLock:", -[PGPictureInPictureRemoteObject _isUnderLock](self, "_isUnderLock"));
    -[NSTimer invalidate](self->_considerStashedPlaybackAsBackgroundAudioTimer, "invalidate");
    v12 = self->_considerStashedPlaybackAsBackgroundAudioTimer;
    self->_considerStashedPlaybackAsBackgroundAudioTimer = 0;

    -[PGPictureInPictureRemoteObject pictureInPictureInterruptionEndedWithReason:attribution:](self, "pictureInPictureInterruptionEndedWithReason:attribution:", 3, 0);
  }

}

void __88__PGPictureInPictureRemoteObject_pictureInPictureViewController_didTransitionToStashed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "pictureInPictureInterruptionBeganWithReason:attribution:", 3, 0);
    WeakRetained = v2;
  }

}

- (BOOL)pictureInPictureViewControllerShouldHideTetheredViewControllerAlongsideControls:(id)a3
{
  PGPictureInPictureRemoteObject *tetheredRemoteObject;

  tetheredRemoteObject = self->_tetheredRemoteObject;
  return tetheredRemoteObject
      && -[PGInterruptionAssistant hasInterruptionReason:](tetheredRemoteObject->_interruptionAssistant, "hasInterruptionReason:", 4);
}

- (BOOL)canPreventOrSuspendRemoteObject:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[PGPictureInPictureRemoteObject _isICSVideoCall](self, "_isICSVideoCall")
    && objc_msgSend(v4, "isVideoCall"))
  {
    v5 = objc_msgSend(v4, "_isAppICS") ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)pagingSkipByNumberOfPages:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PGPictureInPictureRemoteObject_pagingSkipByNumberOfPages___block_invoke;
  block[3] = &unk_1E6230008;
  block[4] = self;
  block[5] = a2;
  block[6] = a3;
  dispatch_async(queue, block);
}

void __60__PGPictureInPictureRemoteObject_pagingSkipByNumberOfPages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  _PGLogMethodProem(*(void **)(a1 + 32), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "PG_appProxyWithDebugMethodAndPointerProem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pagingSkipByNumberOfPages:", *(_QWORD *)(a1 + 48));

}

- (PGPictureInPictureApplication)pictureInPictureApplication
{
  return self->_pictureInPictureApplication;
}

- (PGPictureInPictureViewController)pictureInPictureViewController
{
  return self->_pictureInPictureViewController;
}

- (PGPictureInPictureRemoteObjectDelegate)delegate
{
  return (PGPictureInPictureRemoteObjectDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PGPictureInPictureAnalyticsDelegate)analyticsDelegate
{
  return (PGPictureInPictureAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (PGPictureInPictureRemoteObject)tetheredRemoteObject
{
  return self->_tetheredRemoteObject;
}

- (void)setTetheredRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_tetheredRemoteObject, a3);
}

- (PGPictureInPictureRemoteObject)tetheringRemoteObject
{
  return self->_tetheringRemoteObject;
}

- (void)setTetheringRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_tetheringRemoteObject, a3);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (CGRect)initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.origin.x;
  y = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.origin.y;
  width = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.size.width;
  height = self->_initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)preferredContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)sourceSceneSessionPersistentIdentifier
{
  return self->_sourceSceneSessionPersistentIdentifier;
}

- (NSString)exemptAttribution
{
  return self->_exemptAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exemptAttribution, 0);
  objc_storeStrong((id *)&self->_sourceSceneSessionPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_tetheringRemoteObject, 0);
  objc_storeStrong((id *)&self->_tetheredRemoteObject, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_pictureInPictureViewController, 0);
  objc_storeStrong((id *)&self->_pictureInPictureApplication, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activitySessionIdentifierForLastActivePIPSession, 0);
  objc_destroyWeak((id *)&self->_sourceScene);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_considerStashedPlaybackAsBackgroundAudioTimer, 0);
  objc_storeStrong((id *)&self->_interruptionAssistant, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_exemptAttributionOverride, 0);
  objc_storeStrong((id *)&self->_activitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_analyticsSourceUUID, 0);
  objc_storeStrong((id *)&self->_timerForInvalidatingIfStopOrCancelFails, 0);
  objc_storeStrong((id *)&self->_finishTaskInvalidationUUID, 0);
  objc_storeStrong((id *)&self->_cancelPictureInPictureFinishTaskAssertion, 0);
  objc_storeStrong((id *)&self->_interruptionBeganFinishTaskAssertion, 0);
  objc_storeStrong((id *)&self->_startBackgroundPIPAssertion, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_sceneControllerIfExists, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)initWithConnection:interruptionAssistant:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  _PGLogMethodProem(v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v2, v3, "%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)endTwoStageStopPictureInPictureWithCompletionBlock:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0CD6000, log, OS_LOG_TYPE_DEBUG, "Called endTwoStageStopPictureInPictureWithCompletionBlock on object that hasn't begun.", v1, 2u);
}

- (void)updateMenuItems:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B0CD6000, log, OS_LOG_TYPE_ERROR, "*** WARNING: Updating menu without the proper entitlement has no effect. ***", v1, 2u);
}

- (void)updateMenuItems:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  _PGLogMethodProem(v0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v2, v3, "%@ may not be invoked on the main thread!", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
