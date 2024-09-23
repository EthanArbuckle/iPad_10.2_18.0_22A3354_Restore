@implementation PGPictureInPictureController

- (BOOL)isStartingStoppingOrCancellingPictureInPicture
{
  return -[NSMutableSet bs_containsObjectPassingTest:](self->_activePictureInPictureRemoteObjects, "bs_containsObjectPassingTest:", &__block_literal_global_17);
}

- (NSSet)pictureInPictureApplications
{
  return self->_pictureInPictureApplications;
}

- (BOOL)pictureInPictureInterruptionBeganWithReason:(int64_t)a3 attribution:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    PGStringFromPictureInPictureInterruptionReason(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "-[PGPictureInPictureController pictureInPictureInterruptionBeganWithReason:attribution:]";
    v25 = 2114;
    v26 = v9;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", buf, 0x20u);

  }
  -[PGInterruptionAssistant addReason:attribution:](self->_interruptionAssistant, "addReason:attribution:", a3, v6);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v16, "pictureInPictureInterruptionBeganWithReason:attribution:", a3, v6);
        if (!((a3 != 2) | v13 & 1))
        {
          if (-[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", v16))v13 = objc_msgSend(v16, "isInterrupted");
          else
            v13 = 0;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  return v13 & 1;
}

- (BOOL)shouldStartPictureInPictureForApplicationEnteringBackground:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v12 = 0;
  v9 = -[PGPictureInPictureController _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](self, "_remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", v6, v7, &v12);
  v10 = v12 == 0;

  return v10;
}

- (id)_remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __164__PGPictureInPictureController__remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E622F740;
  v13 = v8;
  v9 = v8;
  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_remoteObjectForPictureInPictureApplication:(id)a3 passingTest:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PGPictureInPictureController *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  -[PGPictureInPictureController _remoteObjectsForPictureInPictureApplication:](v10, "_remoteObjectsForPictureInPictureApplication:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectsPassingTest:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      PGLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:].cold.1(v13);

    }
    if (objc_msgSend(v12, "count") == 1)
    {
      objc_msgSend(v12, "anyObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1002, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PGPegasusErrorDomain"), -1000, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }

  objc_sync_exit(v10);
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v14;
}

- (id)_remoteObjectsForPictureInPictureApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__PGPictureInPictureController__remoteObjectsForPictureInPictureApplication___block_invoke;
  v9[3] = &unk_1E622F740;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "objectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_pictureInPictureRemoteObjects
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableSet copy](self->_lock_pictureInPictureRemoteObjects, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (BOOL)isPictureInPictureSupported
{
  if (isPictureInPictureSupported_onceToken != -1)
    dispatch_once(&isPictureInPictureSupported_onceToken, &__block_literal_global_1);
  return isPictureInPictureSupported_isPictureInPictureSupported;
}

uint64_t __59__PGPictureInPictureController_isPictureInPictureSupported__block_invoke()
{
  uint64_t result;

  result = PGIsPictureInPictureSupported();
  isPictureInPictureSupported_isPictureInPictureSupported = result;
  return result;
}

- (PGPictureInPictureController)init
{
  NSObject *v3;
  PGPictureInPictureController *v4;
  PGPictureInPictureController *v5;
  uint64_t v6;
  NSMutableSet *lock_pictureInPictureRemoteObjects;
  uint64_t v8;
  NSMutableSet *pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart;
  uint64_t v10;
  NSMutableSet *activePictureInPictureRemoteObjects;
  PGInterruptionAssistant *v12;
  PGInterruptionAssistant *interruptionAssistant;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *listenerQueue;
  uint64_t v19;
  NSXPCListener *listener;
  objc_super v22;

  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureController init].cold.1();

  v22.receiver = self;
  v22.super_class = (Class)PGPictureInPictureController;
  v4 = -[PGPictureInPictureController init](&v22, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    lock_pictureInPictureRemoteObjects = v5->_lock_pictureInPictureRemoteObjects;
    v5->_lock_pictureInPictureRemoteObjects = (NSMutableSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart = v5->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart;
    v5->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    activePictureInPictureRemoteObjects = v5->_activePictureInPictureRemoteObjects;
    v5->_activePictureInPictureRemoteObjects = (NSMutableSet *)v10;

    v12 = objc_alloc_init(PGInterruptionAssistant);
    interruptionAssistant = v5->_interruptionAssistant;
    v5->_interruptionAssistant = v12;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.pegasus.PGPictureInPictureController %p"), v5);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    listenerQueue = v5->_listenerQueue;
    v5->_listenerQueue = (OS_dispatch_queue *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.pegasus"));
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v19;

    -[NSXPCListener setDelegate:](v5->_listener, "setDelegate:", v5);
    -[NSXPCListener resume](v5->_listener, "resume");
  }
  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  PGLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PGPictureInPictureController init].cold.1();

  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureController;
  -[PGPictureInPictureController dealloc](&v4, sel_dealloc);
}

uint64_t __78__PGPictureInPictureController_isStartingStoppingOrCancellingPictureInPicture__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isStartingStoppingOrCancellingPictureInPicture");
}

- (PGPictureInPictureControllerDelegate)delegate
{
  return (PGPictureInPictureControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v5)
      *(_BYTE *)&self->_delegateRespondsTo &= 0x80u;
    v6 = objc_storeWeak((id *)&self->_delegate, obj);

    if (obj)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = 2;
      else
        v9 = 0;
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v9;

      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = 4;
      else
        v11 = 0;
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFB | v11;

      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = 8;
      else
        v13 = 0;
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xF7 | v13;

      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = 16;
      else
        v15 = 0;
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xEF | v15;

      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = 32;
      else
        v17 = 0;
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xDF | v17;

      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = 64;
      else
        v19 = 0;
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xBF | v19;

    }
  }

}

- (CGRect)initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PGPictureInPictureController initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:](self, "initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:", a3, 0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)preferredContentSizeForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PGPictureInPictureController preferredContentSizeForInteractivelyEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:](self, "preferredContentSizeForInteractivelyEnteringBackgroundForApplication:sceneSessionPersistentIdentifier:", a3, 0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)shouldStartPictureInPictureForApplicationEnteringBackground:(id)a3
{
  return -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:](self, "shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:", a3, 0);
}

- (void)startPictureInPictureForApplicationEnteringBackground:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  -[PGPictureInPictureController startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:](self, "startPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:animated:completionHandler:", a3, 0, a4, a5);
}

- (void)stopPictureInPictureForApplication:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  -[PGPictureInPictureController stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:](self, "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:", a3, 0, a4, a5);
}

- (void)cancelPictureInPictureForApplication:(id)a3
{
  -[PGPictureInPictureController cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:](self, "cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:", a3, 0);
}

- (int64_t)contentTypePictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](self, "_remoteObjectForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "contentType");
  else
    v6 = 0;

  return v6;
}

- (CGRect)initialFrameForInteractivePictureInPictureAnimationEnteringBackgroundForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6;
  id v7;
  PGPictureInPictureController *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[PGPictureInPictureController _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](v8, "_remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "initialLayerFrameForInteractiveTransitionAnimationUponBackgrounding");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D628];
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  objc_sync_exit(v8);
  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGSize)preferredContentSizeForInteractivelyEnteringBackgroundForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6;
  id v7;
  PGPictureInPictureController *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[PGPictureInPictureController _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](v8, "_remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", v6, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "preferredContentSize");
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D820];
    v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  objc_sync_exit(v8);
  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)preferredContentSizeForActivePictureInPictureWithApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6;
  id v7;
  PGPictureInPictureController *v8;
  NSMutableSet *activePictureInPictureRemoteObjects;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  CGSize result;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  activePictureInPictureRemoteObjects = v8->_activePictureInPictureRemoteObjects;
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke;
  v23[3] = &unk_1E622F6F0;
  v11 = v6;
  v24 = v11;
  v12 = v7;
  v25 = v12;
  -[NSMutableSet bs_firstObjectPassingTest:](activePictureInPictureRemoteObjects, "bs_firstObjectPassingTest:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_3;
  -[PGPictureInPictureController _remoteObjectsForPictureInPictureApplication:](v8, "_remoteObjectsForPictureInPictureApplication:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke_2;
  v21[3] = &unk_1E622F718;
  v22 = v12;
  objc_msgSend(v14, "bs_firstObjectPassingTest:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
LABEL_3:
    objc_msgSend(v13, "preferredContentSize");
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  objc_sync_exit(v8);
  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

uint64_t __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "pictureInPictureApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "matchesSceneSessionIdentifier:", *(_QWORD *)(a1 + 40));
  else
    v5 = 0;

  return v5;
}

uint64_t __126__PGPictureInPictureController_preferredContentSizeForActivePictureInPictureWithApplication_sceneSessionPersistentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesSceneSessionIdentifier:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isStoppingOrCancellingPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __118__PGPictureInPictureController_isStoppingOrCancellingPictureInPictureForApplication_sceneSessionPersistentIdentifier___block_invoke;
  v13[3] = &unk_1E622F740;
  v14 = v7;
  v9 = v7;
  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", v6, v13, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isStoppingOrCancellingPictureInPicture");

  return v11;
}

uint64_t __118__PGPictureInPictureController_isStoppingOrCancellingPictureInPictureForApplication_sceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesSceneSessionIdentifier:", *(_QWORD *)(a1 + 32));
}

- (int64_t)tetheringModeForSceneSessionPersistentIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PGPictureInPictureController_tetheringModeForSceneSessionPersistentIdentifier___block_invoke;
  v12[3] = &unk_1E622F718;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_firstObjectPassingTest:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  if (v9 && v7 && v9 != v7)
    v10 = objc_msgSend(v9, "canTetherRemoteObjectAsMicroPIP:", v7);

  return v10;
}

uint64_t __81__PGPictureInPictureController_tetheringModeForSceneSessionPersistentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "sourceSceneSessionPersistentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  LODWORD(v4) = objc_msgSend(v3, "supportsMicroPIP");
  return a1 & v4;
}

BOOL __81__PGPictureInPictureController_tetheringModeForSceneSessionPersistentIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState") == 6;
}

- (void)startPictureInPictureForApplicationEnteringBackground:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v18 = 0;
  -[PGPictureInPictureController _remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](self, "_remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", v10, v11, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __146__PGPictureInPictureController_startPictureInPictureForApplicationEnteringBackground_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke;
    v16[3] = &unk_1E622F788;
    v17 = v12;
    objc_msgSend(v14, "startPictureInPictureEnteringBackgroundAnimated:withCompletionHandler:", v7, v16);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v15);
  }

}

uint64_t __146__PGPictureInPictureController_startPictureInPictureForApplicationEnteringBackground_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stopPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v18 = 0;
  -[PGPictureInPictureController _remoteObjectThatCanStopPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](self, "_remoteObjectThatCanStopPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", v10, v11, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __127__PGPictureInPictureController_stopPictureInPictureForApplication_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke;
    v16[3] = &unk_1E622F788;
    v17 = v12;
    objc_msgSend(v14, "stopPictureInPictureAnimated:withCompletionHandler:", v7, v16);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v15);
  }

}

uint64_t __127__PGPictureInPictureController_stopPictureInPictureForApplication_sceneSessionPersistentIdentifier_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)beginTwoStageStopPictureInPictureForApplication:(id)a3 withSceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 byRestoringUserInterfaceWithCompletionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  NSObject *v12;
  void *v13;
  id v14;
  id v15;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a6;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v15 = 0;
  -[PGPictureInPictureController _remoteObjectThatCanStopPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](self, "_remoteObjectThatCanStopPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", v9, v10, &v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v15;
  if (v13)
  {
    objc_msgSend(v13, "beginTwoStageStopPictureInPictureByRestoringUserInterfaceWithCompletionHandler:", v11);
  }
  else if (v11)
  {
    v11[2](v11, 0, v14);
  }

}

- (void)endTwoStageStopPictureInPictureForApplication:(id)a3 withSceneSessionPersistentIdentifier:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  id v8;
  void (**v9)(id, _QWORD, id);
  NSObject *v10;
  void *v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = (void (**)(id, _QWORD, id))a6;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v13 = 0;
  -[PGPictureInPictureController _remoteObjectThatCanEndTwoStageStopPictureInPictureApplication:error:](self, "_remoteObjectThatCanEndTwoStageStopPictureInPictureApplication:error:", v8, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (v11)
  {
    objc_msgSend(v11, "endTwoStageStopPictureInPictureWithCompletionBlock:", v9);
  }
  else if (v9)
  {
    v9[2](v9, 0, v12);
  }

}

- (void)cancelPictureInPictureForApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "-[PGPictureInPictureController cancelPictureInPictureForApplication:sceneSessionPersistentIdentifier:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", (uint8_t *)&v12, 0x20u);
  }

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureController _remoteObjectThatCanCancelPictureInPictureApplication:sceneSessionPersistentIdentifier:error:](self, "_remoteObjectThatCanCancelPictureInPictureApplication:sceneSessionPersistentIdentifier:error:", v6, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "cancel");

}

- (void)startPictureInPictureResourcesUsageReductionForApplication:(id)a3 requestingViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__PGPictureInPictureController_startPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke;
  v12[3] = &unk_1E622F740;
  v13 = v7;
  v9 = v7;
  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", v6, v12, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "setCurrentResourcesUsageReductionReasons:", 1);

}

BOOL __116__PGPictureInPictureController_startPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "pictureInPictureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)stopPictureInPictureResourcesUsageReductionForApplication:(id)a3 requestingViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __115__PGPictureInPictureController_stopPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke;
  v12[3] = &unk_1E622F740;
  v13 = v7;
  v9 = v7;
  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", v6, v12, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "setCurrentResourcesUsageReductionReasons:", 0);

}

BOOL __115__PGPictureInPictureController_stopPictureInPictureResourcesUsageReductionForApplication_requestingViewController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "pictureInPictureViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_remoteObjectForTestApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "pictureInPictureApplication");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)startPictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureController _remoteObjectForTestApplicationWithBundleIdentifier:](self, "_remoteObjectForTestApplicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendStartPictureInPictureTestAction");

}

- (void)restorePictureInPictureTestActionForApplicationWithBundleIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureController _remoteObjectForTestApplicationWithBundleIdentifier:](self, "_remoteObjectForTestApplicationWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pictureInPictureViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleRestoreButtonTapped");

}

- (void)pictureInPictureInterruptionBegan
{
  -[PGPictureInPictureController pictureInPictureInterruptionBeganWithReason:attribution:](self, "pictureInPictureInterruptionBeganWithReason:attribution:", 0, 0);
}

- (void)pictureInPictureInterruptionBeganWithReason:(int64_t)a3
{
  -[PGPictureInPictureController pictureInPictureInterruptionBeganWithReason:attribution:](self, "pictureInPictureInterruptionBeganWithReason:attribution:", a3, 0);
}

- (void)pictureInPictureInterruptionEnded
{
  -[PGPictureInPictureController pictureInPictureInterruptionEndedWithReason:attribution:](self, "pictureInPictureInterruptionEndedWithReason:attribution:", 0, 0);
}

- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3
{
  -[PGPictureInPictureController pictureInPictureInterruptionEndedWithReason:attribution:](self, "pictureInPictureInterruptionEndedWithReason:attribution:", a3, 0);
}

- (void)pictureInPictureInterruptionEndedWithReason:(int64_t)a3 attribution:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  id WeakRetained;
  char v20;
  id v21;
  int v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  PGLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    PGStringFromPictureInPictureInterruptionReason(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "-[PGPictureInPictureController pictureInPictureInterruptionEndedWithReason:attribution:]";
    v31 = 2114;
    v32 = v9;
    v33 = 2114;
    v34 = v6;
    _os_log_impl(&dword_1B0CD6000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@", buf, 0x20u);

  }
  v10 = -[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 1);
  -[PGInterruptionAssistant removeReason:attribution:](self->_interruptionAssistant, "removeReason:attribution:", a3, v6);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15++), "pictureInPictureInterruptionEndedWithReason:attribution:", a3, v6);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  if (!-[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 1)
    && v10
    && _os_feature_enabled_impl())
  {
    -[PGPictureInPictureController _faceTimeVideoCallRemoteObject](self, "_faceTimeVideoCallRemoteObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "currentState");
    v18 = objc_msgSend(v16, "shouldStartPictureInPictureEnteringBackground");
    if (v17 == 2)
    {
      if (v18)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v20 = objc_opt_respondsToSelector();

        if ((v20 & 1) != 0)
        {
          v21 = objc_loadWeakRetained((id *)&self->_delegate);
          v22 = objc_msgSend(v21, "pictureInPictureControllerCanBackgroundStartForFaceTimeVideoCall:", self);

          if (v22)
          {
            PGLogCommon();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v30 = "-[PGPictureInPictureController pictureInPictureInterruptionEndedWithReason:attribution:]";
              _os_log_impl(&dword_1B0CD6000, v23, OS_LOG_TYPE_DEFAULT, "%s Starting PIP for FaceTime Video Call upon unlock", buf, 0xCu);
            }

            objc_msgSend(v16, "startPictureInPictureFromBackground");
          }
        }
      }
    }

  }
}

- (id)existingPictureInPictureApplicationForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "pictureInPictureApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v4);

      if ((v12 & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (NSSet)activePictureInPictureApplications
{
  return (NSSet *)-[NSMutableSet bs_map:](self->_activePictureInPictureRemoteObjects, "bs_map:", &__block_literal_global_41);
}

uint64_t __66__PGPictureInPictureController_activePictureInPictureApplications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pictureInPictureApplication");
}

- (NSSet)activePictureInPictureApplicationsStoppingOrCancelling
{
  NSObject *v3;
  NSMutableSet *activePictureInPictureRemoteObjects;
  _QWORD v6[5];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__PGPictureInPictureController_activePictureInPictureApplicationsStoppingOrCancelling__block_invoke;
  v6[3] = &unk_1E622F830;
  v6[4] = self;
  -[NSMutableSet bs_compactMap:](activePictureInPictureRemoteObjects, "bs_compactMap:", v6);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

id __86__PGPictureInPictureController_activePictureInPictureApplicationsStoppingOrCancelling__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "pictureInPictureApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectForPictureInPictureApplication:passingTest:error:", v3, &__block_literal_global_42, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (objc_msgSend(v4, "isStoppingOrCancellingPictureInPicture"))
    v5 = v3;

  return v5;
}

uint64_t __86__PGPictureInPictureController_activePictureInPictureApplicationsStoppingOrCancelling__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesSceneSessionIdentifier:", 0);
}

- (id)suspendedPictureInPictureApplication
{
  return -[PGPictureInPictureRemoteObject pictureInPictureApplication](self->_suspendedPictureInPictureRemoteObject, "pictureInPictureApplication");
}

- (NSDictionary)activeSceneSessionIdentifiersByApplication
{
  void *v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_activePictureInPictureRemoteObjects, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSMutableSet count](self->_activePictureInPictureRemoteObjects, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = self->_activePictureInPictureRemoteObjects;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v9, "pictureInPictureApplication", (_QWORD)v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v3, "objectForKey:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
              objc_msgSend(v3, "objectForKey:", v10);
            else
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "sourceSceneSessionPersistentIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v12, "addObject:", v13);
            if (v12)
              objc_msgSend(v3, "setObject:forKey:", v12, v10);

          }
        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)activateBackgroundPIPAuthorizationService
{
  PGBackgroundPIPService *v3;
  PGBackgroundPIPService *backgroundPIPService;

  if (!self->_backgroundPIPService)
  {
    v3 = objc_alloc_init(PGBackgroundPIPService);
    backgroundPIPService = self->_backgroundPIPService;
    self->_backgroundPIPService = v3;

    -[PGBackgroundPIPService setDelegate:](self->_backgroundPIPService, "setDelegate:", self);
    -[PGBackgroundPIPService startListener](self->_backgroundPIPService, "startListener");
  }
}

- (void)pagingSkipByNumberOfPages:(int64_t)a3 application:(id)a4
{
  void *v5;
  id v6;

  -[PGPictureInPictureController _remoteObjectsForPictureInPictureApplication:](self, "_remoteObjectsForPictureInPictureApplication:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pagingSkipByNumberOfPages:", a3);
}

BOOL __77__PGPictureInPictureController__remoteObjectsForPictureInPictureApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "pictureInPictureApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)_remoteObjectForPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __115__PGPictureInPictureController__remoteObjectForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E622F740;
  v13 = v8;
  v9 = v8;
  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __115__PGPictureInPictureController__remoteObjectForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesSceneSessionIdentifier:", *(_QWORD *)(a1 + 32));
}

uint64_t __164__PGPictureInPictureController__remoteObjectThatShouldStartPictureInPictureEnteringBackgroundForPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  unsigned int v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "matchesSceneSessionIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = objc_msgSend(v3, "shouldStartPictureInPictureEnteringBackground");
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218752;
    v9 = v3;
    v10 = 1024;
    v11 = v4 & v5;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "Could remoteObject{%p} start pip upon backgrounding? %{BOOL}u, since we have at least the following: matchesSceneIdentifier{%{BOOL}u} shouldStartPictureInPictureEnteringBackground{%{BOOL}u}", (uint8_t *)&v8, 0x1Eu);
  }

  return v4 & v5;
}

- (id)_remoteObjectThatCanStopPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __123__PGPictureInPictureController__remoteObjectThatCanStopPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E622F740;
  v13 = v8;
  v9 = v8;
  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __123__PGPictureInPictureController__remoteObjectThatCanStopPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "matchesSceneSessionIdentifier:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "canStopPictureInPicture");
  else
    v4 = 0;

  return v4;
}

- (id)_remoteObjectThatCanCancelPictureInPictureApplication:(id)a3 sceneSessionPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __125__PGPictureInPictureController__remoteObjectThatCanCancelPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke;
  v12[3] = &unk_1E622F740;
  v13 = v8;
  v9 = v8;
  -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __125__PGPictureInPictureController__remoteObjectThatCanCancelPictureInPictureApplication_sceneSessionPersistentIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "matchesSceneSessionIdentifier:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "canCancelPictureInPicture");
  else
    v4 = 0;

  return v4;
}

- (id)_remoteObjectThatCanEndTwoStageStopPictureInPictureApplication:(id)a3 error:(id *)a4
{
  return -[PGPictureInPictureController _remoteObjectForPictureInPictureApplication:passingTest:error:](self, "_remoteObjectForPictureInPictureApplication:passingTest:error:", a3, &__block_literal_global_47, a4);
}

uint64_t __101__PGPictureInPictureController__remoteObjectThatCanEndTwoStageStopPictureInPictureApplication_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canEndTwoStageStopPictureInPicture");
}

- (BOOL)_hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP
{
  void *v3;
  NSMutableSet *activePictureInPictureRemoteObjects;
  uint64_t v5;
  id v6;
  char v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  PGPictureInPictureController *v12;
  _QWORD v13[4];
  id v14;
  PGPictureInPictureController *v15;

  -[PGPictureInPictureController _faceTimeVideoCallRemoteObject](self, "_faceTimeVideoCallRemoteObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke;
  v13[3] = &unk_1E622F6F0;
  v6 = v3;
  v14 = v6;
  v15 = self;
  if ((-[NSMutableSet bs_containsObjectPassingTest:](activePictureInPictureRemoteObjects, "bs_containsObjectPassingTest:", v13) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke_2;
    v10[3] = &unk_1E622F6F0;
    v11 = v6;
    v12 = self;
    v7 = objc_msgSend(v8, "bs_containsObjectPassingTest:", v10);

  }
  return v7;
}

uint64_t __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    objc_msgSend(v3, "activitySessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pictureInPictureApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasAcquiredAuthorizationForActivitySessionWithIdentifier:appBundleIdentifier:", v6, v8);

  }
  return v4;
}

uint64_t __92__PGPictureInPictureController__hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3) & 1) != 0 || objc_msgSend(v3, "currentState") == 2)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
    objc_msgSend(v3, "activitySessionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pictureInPictureApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasAcquiredAuthorizationForActivitySessionWithIdentifier:appBundleIdentifier:", v6, v8);

  }
  return v4;
}

- (id)_faceTimeVideoCallRemoteObject
{
  void *v2;
  void *v3;

  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_firstObjectPassingTest:", &__block_literal_global_48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __62__PGPictureInPictureController__faceTimeVideoCallRemoteObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  if (objc_msgSend(v2, "isVideoCall"))
  {
    objc_msgSend(v2, "pictureInPictureApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.InCallService"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_faceTimeVideoCallInterruptionExemption
{
  if (_os_feature_enabled_impl())
    return CFSTR("com.apple.avconferenced");
  else
    return CFSTR("com.apple.mediaserverd");
}

- (id)_continuityCameraInterruptionExemption
{
  return CFSTR("com.apple.continuitycaptured");
}

- (void)_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PGPictureInPictureRemoteObject *v10;
  uint64_t v11;
  NSMutableSet *activePictureInPictureRemoteObjects;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  _BOOL4 v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[6];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  -[PGPictureInPictureController _pictureInPictureRemoteObjects](self, "_pictureInPictureRemoteObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGPictureInPictureController _faceTimeVideoCallRemoteObject](self, "_faceTimeVideoCallRemoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v10 = *(PGPictureInPictureRemoteObject **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (v10 == self->_suspendedPictureInPictureRemoteObject
          || (-[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i)) & 1) != 0)
        {
          v11 = 1;
        }
        else
        {
          activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __90__PGPictureInPictureController__updateAllRemoteObjectsForPIPPossibleAndExemptAttributions__block_invoke;
          v43[3] = &unk_1E622F6F0;
          v43[4] = self;
          v43[5] = v10;
          v11 = -[NSMutableSet bs_containsObjectPassingTest:](activePictureInPictureRemoteObjects, "bs_containsObjectPassingTest:", v43) ^ 1;
        }
        -[PGPictureInPictureRemoteObject setPictureInPicturePossible:](v10, "setPictureInPicturePossible:", v11);
        if (-[PGPictureInPictureRemoteObject isVideoCall](v10, "isVideoCall")
          && (-[PGPictureInPictureRemoteObject pictureInPictureApplication](v10, "pictureInPictureApplication"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v13, "bundleIdentifier"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "isEqual:", CFSTR("com.apple.InCallService")),
              v14,
              v13,
              v15)
          || -[PGPictureInPictureRemoteObject isAssociatedWithRemoteObject:](v10, "isAssociatedWithRemoteObject:", v5))
        {
          -[PGPictureInPictureController _faceTimeVideoCallInterruptionExemption](self, "_faceTimeVideoCallInterruptionExemption");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPictureInPictureRemoteObject setExemptAttribution:](v10, "setExemptAttribution:", v16);
        }
        else
        {
          -[PGPictureInPictureRemoteObject pictureInPictureApplication](v10, "pictureInPictureApplication");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPictureInPictureRemoteObject setExemptAttribution:](v10, "setExemptAttribution:", v17);

        }
        if ((v11 & 1) == 0
          && -[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", v10)&& -[PGPictureInPictureRemoteObject canCancelPictureInPicture](v10, "canCancelPictureInPicture"))
        {
          -[PGPictureInPictureRemoteObject cancel](v10, "cancel");
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
    }
    while (v7);
  }

  -[PGBackgroundPIPService identifiersForAuthorizedActivitySessions](self->_backgroundPIPService, "identifiersForAuthorizedActivitySessions");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count"))
    goto LABEL_54;
  v19 = -[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 1);

  if (!v19)
  {
    v37 = -[PGPictureInPictureController _hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP](self, "_hasActiveNonVideoCallRemoteObjectAuthorizedForBackgroundPIP");
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v18 = obj;
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      v36 = v18;
LABEL_29:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v22)
          objc_enumerationMutation(v36);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v23);
        v25 = v37 ? objc_msgSend(v5, "isEqual:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v23)) : 1;
        objc_msgSend(v24, "activitySessionIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "pictureInPictureApplication");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "bundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          if (-[PGBackgroundPIPService hasAcquiredAuthorizationForActivitySessionWithIdentifier:appBundleIdentifier:](self->_backgroundPIPService, "hasAcquiredAuthorizationForActivitySessionWithIdentifier:appBundleIdentifier:", v26, v28))
          {
            break;
          }
        }

        if (v21 == ++v23)
        {
          v18 = v36;
          v21 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v39, v54, 16);
          if (v21)
            goto LABEL_29;
          goto LABEL_54;
        }
      }
      -[PGPictureInPictureController delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_opt_respondsToSelector();

      if ((v30 & 1) != 0)
      {
        -[PGPictureInPictureController delegate](self, "delegate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "pictureInPictureController:shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:", self, v28);

        if (v32)
        {
          if (objc_msgSend(v24, "canStartBackgroundPIPForCurrentActivitySessionIdentifier"))
            v33 = v24;
          else
            v33 = 0;
          v18 = v33;
          goto LABEL_50;
        }
        PGLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v49 = "-[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions]";
          v50 = 2114;
          v51 = v26;
          v52 = 2114;
          v53 = v28;
          _os_log_impl(&dword_1B0CD6000, v34, OS_LOG_TYPE_DEFAULT, "%s Revoking authorization for %{public}@ because the delegate forbids background pip for the app %{public}@", buf, 0x20u);
        }

        -[PGBackgroundPIPService revokeAuthorizationActivitySessionWithIdentifier:](self->_backgroundPIPService, "revokeAuthorizationActivitySessionWithIdentifier:", v26);
      }
      v18 = 0;
LABEL_50:

      if (!v18)
        goto LABEL_55;
      PGLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "-[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions]";
        v50 = 2114;
        v51 = v18;
        _os_log_impl(&dword_1B0CD6000, v35, OS_LOG_TYPE_DEFAULT, "%s Attempting to start backgroundPIP for %{public}@", buf, 0x16u);
      }

      objc_msgSend(v18, "setPictureInPicturePossible:", 1);
      objc_msgSend(v18, "startPictureInPictureFromBackground");
    }
LABEL_54:

  }
LABEL_55:

}

uint64_t __90__PGPictureInPictureController__updateAllRemoteObjectsForPIPPossibleAndExemptAttributions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 88));
  if (WeakRetained == v3)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "canPreventOrSuspendRemoteObject:", *(_QWORD *)(a1 + 40));

  return v5;
}

- (void)_addRemoteObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSMutableSet addObject:](self->_lock_pictureInPictureRemoteObjects, "addObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_removeRemoteObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  if (a3)
  {
    p_lock = &self->_lock;
    v5 = a3;
    os_unfair_lock_lock(p_lock);
    -[NSMutableSet removeObject:](self->_lock_pictureInPictureRemoteObjects, "removeObject:", v5);

    os_unfair_lock_unlock(p_lock);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  NSObject *listenerQueue;
  id v14;
  _QWORD v16[4];
  id v17;
  PGPictureInPictureController *v18;
  id v19;
  _QWORD v20[5];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  PGPictureInPictureController *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[PGPictureInPictureController listener:shouldAcceptNewConnection:]";
    v23 = 2048;
    v24 = self;
    v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    PGLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController listener:shouldAcceptNewConnection:].cold.1();

  }
  if (!PGIsPictureInPictureSupported()
    || (*(_BYTE *)&self->_delegateRespondsTo & 0x20) != 0
    && (-[PGPictureInPictureController delegate](self, "delegate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "pictureInPictureController:shouldDenyNewConnection:", self, v5),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 0;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke;
    v20[3] = &unk_1E622F8C0;
    v20[4] = self;
    v12 = (void *)MEMORY[0x1B5E0FE80](v20);
    listenerQueue = self->_listenerQueue;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_4;
    v16[3] = &unk_1E622F8E8;
    v17 = v5;
    v18 = self;
    v19 = v12;
    v14 = v12;
    dispatch_async(listenerQueue, v16);

    v10 = 1;
  }

  return v10;
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_pictureInPictureRemoteObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_map:", &__block_literal_global_53);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3;
  v5[3] = &unk_1E622F898;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pictureInPictureApplication");
}

uint64_t __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("pictureInPictureApplications"));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("pictureInPictureApplications"));
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_4(uint64_t a1)
{
  PGPictureInPictureRemoteObject *v2;
  uint64_t v3;
  void *v4;
  PGPictureInPictureRemoteObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PGPictureInPictureRemoteObject *v12;
  void *v13;
  PGPictureInPictureRemoteObject *v14;
  void *v15;
  void *v16;
  void *v17;
  PGPictureInPictureRemoteObject *v18;
  _QWORD v19[5];
  PGPictureInPictureRemoteObject *v20;
  _QWORD v21[4];
  PGPictureInPictureRemoteObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v26[4];
  PGPictureInPictureRemoteObject *v27;
  id location;

  v2 = [PGPictureInPictureRemoteObject alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "copyWithExemptAttribution:", 0);
  v5 = -[PGPictureInPictureRemoteObject initWithConnection:interruptionAssistant:](v2, "initWithConnection:interruptionAssistant:", v3, v4);

  -[PGPictureInPictureRemoteObject setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 40));
  v6 = *(void **)(a1 + 32);
  -[PGPictureInPictureRemoteObject queue](v5, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setQueue:", v7);

  v8 = *(void **)(a1 + 32);
  PGPictureInPictureRemoteObjectInterface();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedInterface:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", v5);
  v10 = *(void **)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_5;
  v26[3] = &unk_1E622F8C0;
  v12 = v5;
  v27 = v12;
  objc_msgSend(v10, "setInterruptionHandler:", v26);
  v13 = *(void **)(a1 + 32);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_57;
  v21[3] = &unk_1E622F910;
  v14 = v12;
  v22 = v14;
  objc_copyWeak(&v25, &location);
  v15 = *(void **)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 40);
  v24 = v15;
  objc_msgSend(v13, "setInvalidationHandler:", v21);
  v16 = *(void **)(a1 + 32);
  PGPictureInPictureExportedInterface();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRemoteObjectInterface:", v17);

  objc_msgSend(*(id *)(a1 + 40), "_addRemoteObject:", v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "resume");
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3_60;
  v19[3] = &unk_1E622F898;
  v19[4] = *(_QWORD *)(a1 + 40);
  v20 = v14;
  v18 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], v19);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134218240;
    v6 = v3;
    v7 = 1024;
    v8 = objc_msgSend(v4, "processIdentifier");
    _os_log_impl(&dword_1B0CD6000, v2, OS_LOG_TYPE_DEFAULT, "PGPictureInPictureRemoteObject %p - Connection with PID %d interrupted!", (uint8_t *)&v5, 0x12u);

  }
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_57(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  id v8;
  int8x16_t v9;
  _QWORD block[4];
  int8x16_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PGLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v14 = v3;
    v15 = 1024;
    v16 = objc_msgSend(v4, "processIdentifier");
    _os_log_impl(&dword_1B0CD6000, v2, OS_LOG_TYPE_DEFAULT, "PGPictureInPictureRemoteObject %p - Connection with PID %d invalidated!", buf, 0x12u);

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[5];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_58;
    block[3] = &unk_1E622F8E8;
    v9 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    v12 = *(id *)(a1 + 48);
    dispatch_async(v7, block);

  }
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_58(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_removeRemoteObject:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = *(id *)(a1 + 40);
  BSDispatchMain();

}

uint64_t __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_2_59(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(a1 + 40), "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");
}

void __67__PGPictureInPictureController_listener_shouldAcceptNewConnection___block_invoke_3_60(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "analyticsDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnalyticsDelegate:", v3);

}

- (BOOL)pictureInPictureRemoteObjectHasBackgroundPIPAuthorization:(id)a3
{
  PGBackgroundPIPService *backgroundPIPService;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  backgroundPIPService = self->_backgroundPIPService;
  v4 = a3;
  objc_msgSend(v4, "activitySessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pictureInPictureApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(backgroundPIPService) = -[PGBackgroundPIPService hasAcquiredAuthorizationForActivitySessionWithIdentifier:appBundleIdentifier:](backgroundPIPService, "hasAcquiredAuthorizationForActivitySessionWithIdentifier:appBundleIdentifier:", v5, v7);

  return (char)backgroundPIPService;
}

- (BOOL)pictureInPictureRemoteObjectShouldAcceptSetupRequest:(id)a3
{
  id v4;
  int v5;
  NSMutableSet *activePictureInPictureRemoteObjects;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", v4);
  activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__PGPictureInPictureController_pictureInPictureRemoteObjectShouldAcceptSetupRequest___block_invoke;
  v9[3] = &unk_1E622F718;
  v10 = v4;
  v7 = v4;
  LODWORD(activePictureInPictureRemoteObjects) = (v5 | -[NSMutableSet bs_containsObjectPassingTest:](activePictureInPictureRemoteObjects, "bs_containsObjectPassingTest:", v9)) ^ 1;

  return (char)activePictureInPictureRemoteObjects;
}

uint64_t __85__PGPictureInPictureController_pictureInPictureRemoteObjectShouldAcceptSetupRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canPreventOrSuspendRemoteObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)pictureInPictureRemoteObjectShouldUpdateCancellationPolicyOnStart:(id)a3
{
  return (*(_BYTE *)&self->_delegateRespondsTo >> 4) & 1;
}

- (BOOL)pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart:(id)a3
{
  id v4;
  NSMutableSet *activePictureInPictureRemoteObjects;
  id v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  PGPictureInPictureController *v13;
  id v14;

  v4 = a3;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 0x10) != 0
    && -[NSMutableSet count](self->_activePictureInPictureRemoteObjects, "count"))
  {
    activePictureInPictureRemoteObjects = self->_activePictureInPictureRemoteObjects;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __102__PGPictureInPictureController_pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart___block_invoke;
    v12 = &unk_1E622F6F0;
    v13 = self;
    v6 = v4;
    v14 = v6;
    v7 = -[NSMutableSet bs_containsObjectPassingTest:](activePictureInPictureRemoteObjects, "bs_containsObjectPassingTest:", &v9);
    if ((v7 & 1) == 0)
      -[NSMutableSet addObject:](self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart, "addObject:", v6, v9, v10, v11, v12, v13);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

uint64_t __102__PGPictureInPictureController_pictureInPictureRemoteObjectShouldCancelActivePictureInPictureOnStart___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "pictureInPictureApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "pictureInPictureApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "pictureInPictureController:shouldCancelPictureInPictureForApplication:whenStartingPictureInPictureForApplication:", v6, v7, v8);

  return v9;
}

- (void)pictureInPictureRemoteObject:(id)a3 didRequestPictureInPictureStopForViewController:(id)a4 sourceSceneSessionIdentifier:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id obj;

  v6 = a6;
  obj = a3;
  v10 = a4;
  v11 = a5;
  objc_storeWeak((id *)&self->_remoteObjectThatRequestedStop, obj);
  -[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions](self, "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");
  if ((*(_BYTE *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    -[PGPictureInPictureController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pictureInPictureController:didRequestStopForPictureInPictureViewController:sourceSceneSessionIdentifier:animated:", self, v10, v11, v6);
  }
  else
  {
    objc_msgSend(obj, "pictureInPictureApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "sourceSceneSessionPersistentIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPictureInPictureController stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:](self, "stopPictureInPictureForApplication:sceneSessionPersistentIdentifier:animated:completionHandler:", v12, v13, v6, 0);

  }
}

- (void)pictureInPictureRemoteObject:(id)a3 didCreatePictureInPictureViewController:(id)a4
{
  id v5;
  id v6;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    v5 = a4;
    -[PGPictureInPictureController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pictureInPictureController:didCreatePictureInPictureViewController:", self, v5);

  }
}

- (void)pictureInPictureRemoteObject:(id)a3 willShowPictureInPictureViewController:(id)a4
{
  PGPictureInPictureController *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PGPictureInPictureController *v15;
  NSObject *v16;
  PGPictureInPictureController *v17;
  PGPictureInPictureController *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  char v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  PGPictureInPictureController *v29;
  id *location;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  PGPictureInPictureController *v39;
  __int16 v40;
  PGPictureInPictureController *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = (PGPictureInPictureController *)a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v9 = (void *)-[NSMutableSet copy](self->_activePictureInPictureRemoteObjects, "copy");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (!v11)
  {

    v27 = 0;
    goto LABEL_46;
  }
  v12 = v11;
  v28 = 0;
  location = (id *)&self->_suspendedPictureInPictureRemoteObject;
  v31 = 0;
  v13 = *(_QWORD *)v33;
  v29 = self;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v33 != v13)
        objc_enumerationMutation(v10);
      v15 = *(PGPictureInPictureController **)(*((_QWORD *)&v32 + 1) + 8 * v14);
      if (-[PGPictureInPictureController canTetherRemoteObjectAsMicroPIP:](v6, "canTetherRemoteObjectAsMicroPIP:", v15))
      {
        PGLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          v38 = 2048;
          v39 = v6;
          v40 = 2048;
          v41 = v15;
          _os_log_impl(&dword_1B0CD6000, v16, OS_LOG_TYPE_DEFAULT, "%s Will tether because new object %p can tether %p as micropip", buf, 0x20u);
        }

        v17 = v15;
        v18 = v6;
LABEL_18:
        +[PGPictureInPictureRemoteObject tetherRemoteObject:toRemoteObject:mode:](PGPictureInPictureRemoteObject, "tetherRemoteObject:toRemoteObject:mode:", v17, v18, 1);
        goto LABEL_19;
      }
      if (-[PGPictureInPictureController canTetherRemoteObjectAsMicroPIP:](v15, "canTetherRemoteObjectAsMicroPIP:", v6))
      {
        PGLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          v38 = 2048;
          v39 = v15;
          v40 = 2048;
          v41 = v6;
          _os_log_impl(&dword_1B0CD6000, v19, OS_LOG_TYPE_DEFAULT, "%s Will tether because active object %p can tether %p as micropip", buf, 0x20u);
        }

        v17 = v6;
        v18 = v15;
        goto LABEL_18;
      }
      if (-[PGPictureInPictureController canActivateUntetheredAlongsideOtherObject:](v6, "canActivateUntetheredAlongsideOtherObject:", v15))
      {
        PGLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:
          *(_DWORD *)buf = 136315650;
          v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          v38 = 2048;
          v39 = v6;
          v40 = 2048;
          v41 = v15;
          _os_log_impl(&dword_1B0CD6000, v20, OS_LOG_TYPE_DEFAULT, "%s Allowing remote object %p to coexist with active %p because one is QNBacklink", buf, 0x20u);
        }
LABEL_27:

        goto LABEL_19;
      }
      if (-[PGPictureInPictureController canActivateUntetheredAlongsideOtherObject:](v15, "canActivateUntetheredAlongsideOtherObject:", v6))
      {
        PGLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        goto LABEL_27;
      }
      if (-[PGPictureInPictureController canPreventOrSuspendRemoteObject:](v6, "canPreventOrSuspendRemoteObject:", v15))
      {
        PGLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
          v38 = 2048;
          v39 = self;
          v40 = 2048;
          v41 = v15;
          _os_log_impl(&dword_1B0CD6000, v21, OS_LOG_TYPE_DEFAULT, "%s New object %p suspending active %p", buf, 0x20u);
        }

        -[PGPictureInPictureController suspend](v15, "suspend");
        -[NSMutableSet removeObject:](self->_activePictureInPictureRemoteObjects, "removeObject:", v15);
        objc_storeStrong(location, v15);
      }
      else
      {
        v22 = -[NSMutableSet containsObject:](self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart, "containsObject:", v6);
        PGLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if ((v22 & 1) != 0)
        {
          if (v24)
          {
            *(_DWORD *)buf = 136315138;
            v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
            _os_log_impl(&dword_1B0CD6000, v23, OS_LOG_TYPE_DEFAULT, "%s removing objects for swap", buf, 0xCu);
          }

          v28 = 1;
          self = v29;
        }
        else
        {
          self = v29;
          if (v24)
          {
            *(_DWORD *)buf = 136315650;
            v37 = "-[PGPictureInPictureController pictureInPictureRemoteObject:willShowPictureInPictureViewController:]";
            v38 = 2048;
            v39 = v29;
            v40 = 2048;
            v41 = v15;
            _os_log_impl(&dword_1B0CD6000, v23, OS_LOG_TYPE_DEFAULT, "%s New object %p canceling active %p", buf, 0x20u);
          }

          -[PGPictureInPictureController cancel](v15, "cancel");
          v25 = v31;
          if (!v31)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableSet count](v29->_activePictureInPictureRemoteObjects, "count"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v31 = v25;
          objc_msgSend(v25, "addObject:", v15);
        }
      }
LABEL_19:
      ++v14;
    }
    while (v12 != v14);
    v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    v12 = v26;
  }
  while (v26);

  if ((v28 & 1) != 0)
    -[NSMutableSet removeObject:](self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart, "removeObject:", v6);
  v27 = v31;
LABEL_46:
  if (objc_msgSend(v27, "count"))
    -[NSMutableSet minusSet:](self->_activePictureInPictureRemoteObjects, "minusSet:", v27);
  -[NSMutableSet addObject:](self->_activePictureInPictureRemoteObjects, "addObject:", v6);
  -[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions](self, "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");
  -[PGBackgroundPIPService pipDidStartForRemoteObject:](self->_backgroundPIPService, "pipDidStartForRemoteObject:", v6);

}

- (void)pictureInPictureRemoteObject:(id)a3 didShowPictureInPictureViewController:(id)a4
{
  id v5;
  NSObject *v6;
  PGPictureInPictureApplication *v7;
  PGPictureInPictureApplication *activePictureInPictureApplication;
  PGPictureInPictureApplication *v9;
  PGPictureInPictureApplication *v10;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if (-[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", v5))
  {
    if (self->_pictureInPictureActive)
    {
      -[PGPictureInPictureController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activePictureInPictureApplication"));
      self->_pictureInPictureActive = 1;
      objc_msgSend(v5, "pictureInPictureApplication");
      v7 = (PGPictureInPictureApplication *)objc_claimAutoreleasedReturnValue();
      activePictureInPictureApplication = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = v7;

    }
    else
    {
      -[PGPictureInPictureController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pictureInPictureActive"));
      -[PGPictureInPictureController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activePictureInPictureApplication"));
      self->_pictureInPictureActive = 1;
      objc_msgSend(v5, "pictureInPictureApplication");
      v9 = (PGPictureInPictureApplication *)objc_claimAutoreleasedReturnValue();
      v10 = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = v9;

      -[PGPictureInPictureController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pictureInPictureActive"));
    }
    -[PGPictureInPictureController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activePictureInPictureApplication"));
  }
  -[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions](self, "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");

}

- (void)pictureInPictureRemoteObject:(id)a3 willHidePictureInPictureViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  PGPictureInPictureRemoteObject *suspendedPictureInPictureRemoteObject;
  PGPictureInPictureApplication *v11;
  PGPictureInPictureApplication *v12;
  PGPictureInPictureApplication *v13;
  PGPictureInPictureApplication *activePictureInPictureApplication;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  if ((*(_BYTE *)&self->_delegateRespondsTo & 4) != 0)
  {
    -[PGPictureInPictureController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pictureInPictureController:willHidePictureInPictureViewController:", self, v7);

  }
  if (-[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", v6))
  {
    suspendedPictureInPictureRemoteObject = self->_suspendedPictureInPictureRemoteObject;
    if (!suspendedPictureInPictureRemoteObject)
    {
      -[PGPictureInPictureController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activePictureInPictureApplication"));
      activePictureInPictureApplication = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = 0;
      goto LABEL_12;
    }
    v11 = self->_activePictureInPictureApplication;
    -[PGPictureInPictureRemoteObject pictureInPictureApplication](suspendedPictureInPictureRemoteObject, "pictureInPictureApplication");
    v12 = (PGPictureInPictureApplication *)objc_claimAutoreleasedReturnValue();

    if (v11 != v12)
    {
      -[PGPictureInPictureController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("activePictureInPictureApplication"));
      -[PGPictureInPictureRemoteObject pictureInPictureApplication](self->_suspendedPictureInPictureRemoteObject, "pictureInPictureApplication");
      v13 = (PGPictureInPictureApplication *)objc_claimAutoreleasedReturnValue();
      activePictureInPictureApplication = self->_activePictureInPictureApplication;
      self->_activePictureInPictureApplication = v13;
LABEL_12:

      -[PGPictureInPictureController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("activePictureInPictureApplication"));
    }
  }
  -[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions](self, "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");

}

- (void)pictureInPictureRemoteObject:(id)a3 didHidePictureInPictureViewController:(id)a4
{
  PGPictureInPictureRemoteObject *v6;
  id v7;
  NSObject *v8;
  int v9;
  PGPictureInPictureRemoteObject *suspendedPictureInPictureRemoteObject;
  PGPictureInPictureRemoteObject *v11;
  void *v12;

  v6 = (PGPictureInPictureRemoteObject *)a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    PGLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PGPictureInPictureController shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:].cold.1();

  }
  v9 = -[NSMutableSet containsObject:](self->_activePictureInPictureRemoteObjects, "containsObject:", v6);
  suspendedPictureInPictureRemoteObject = self->_suspendedPictureInPictureRemoteObject;
  if (v9)
  {
    if (suspendedPictureInPictureRemoteObject)
    {
      -[PGPictureInPictureRemoteObject resume](suspendedPictureInPictureRemoteObject, "resume");
      -[NSMutableSet addObject:](self->_activePictureInPictureRemoteObjects, "addObject:", self->_suspendedPictureInPictureRemoteObject);
      v11 = self->_suspendedPictureInPictureRemoteObject;
      self->_suspendedPictureInPictureRemoteObject = 0;

    }
    else
    {
      -[PGPictureInPictureController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("pictureInPictureActive"));
      self->_pictureInPictureActive = 0;
      -[PGPictureInPictureController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("pictureInPictureActive"));
    }
    -[NSMutableSet removeObject:](self->_activePictureInPictureRemoteObjects, "removeObject:", v6);
  }
  else if (suspendedPictureInPictureRemoteObject == v6)
  {
    self->_suspendedPictureInPictureRemoteObject = 0;

  }
  if ((*(_BYTE *)&self->_delegateRespondsTo & 8) != 0)
  {
    -[PGPictureInPictureController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pictureInPictureController:didHidePictureInPictureViewController:", self, v7);

  }
  -[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions](self, "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");
  -[PGBackgroundPIPService pipDidStopForRemoteObject:](self->_backgroundPIPService, "pipDidStopForRemoteObject:", v6);

}

- (void)pictureInPictureRemoteObject:(id)a3 willDestroyPictureInPictureViewController:(id)a4
{
  id v6;
  void *v7;
  PGPictureInPictureRemoteObject **p_remoteObjectThatRequestedStop;
  id WeakRetained;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    -[PGPictureInPictureController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pictureInPictureController:willDestroyPictureInPictureViewController:", self, v6);

  }
  p_remoteObjectThatRequestedStop = &self->_remoteObjectThatRequestedStop;
  WeakRetained = objc_loadWeakRetained((id *)p_remoteObjectThatRequestedStop);

  if (WeakRetained == v10)
    objc_storeWeak((id *)p_remoteObjectThatRequestedStop, 0);

}

- (id)pictureInPictureRemoteObjectInterruptionAssistant:(id)a3
{
  return -[PGInterruptionAssistant copyWithExemptAttribution:](self->_interruptionAssistant, "copyWithExemptAttribution:", 0);
}

- (void)pictureInPictureRemoteObject:(id)a3 requestActivationOfSceneWithPersistenceIdentier:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (v8
    && (-[PGPictureInPictureController delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    -[PGPictureInPictureController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pictureInPictureViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pictureInPictureController:requestActivationOfSceneWithPersistenceIdentier:pictureInPictureViewController:completion:", self, v8, v13, v9);

  }
  else
  {
    v9[2](v9, 0);
  }

}

- (void)backgroundPIPService:(id)a3 didGrantBackgroundPIPAuthorizationForActivitySessionWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PGPictureInPictureController backgroundPIPService:didGrantBackgroundPIPAuthorizationForActivitySessionWithIdentifier:]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions](self, "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");
}

- (void)backgroundPIPService:(id)a3 didRevokeBackgroundPIPAuthorizationForActivitySessionWithIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PGLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[PGPictureInPictureController backgroundPIPService:didRevokeBackgroundPIPAuthorizationForActivitySessionWithIdentifier:]";
    v9 = 2114;
    v10 = v5;
    _os_log_impl(&dword_1B0CD6000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v7, 0x16u);
  }

  -[PGPictureInPictureController _updateAllRemoteObjectsForPIPPossibleAndExemptAttributions](self, "_updateAllRemoteObjectsForPIPPossibleAndExemptAttributions");
}

- (BOOL)backgroundPIPService:(id)a3 canAuthorizeBackgroundPIPForActivitySessionWithIdentifier:(id)a4 appBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _QWORD v18[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[PGPictureInPictureController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[PGPictureInPictureController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "pictureInPictureController:shouldAuthorizeBackgroundPIPForAppWithBundleIdentifier:", self, v8);

  }
  else
  {
    v12 = 0;
  }
  PGLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v20 = "-[PGPictureInPictureController backgroundPIPService:canAuthorizeBackgroundPIPForActivitySessionWithIdentifier:"
          "appBundleIdentifier:]";
    v21 = 2114;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    v25 = 1024;
    v26 = v12;
    _os_log_impl(&dword_1B0CD6000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@ %{public}@ canAuthorizeBackgroundPIPForActivitySessionWithIdentifier before checking interruptions %{BOOL}u", buf, 0x26u);
  }

  if (v12)
  {
    if (-[PGInterruptionAssistant hasInterruptionReason:](self->_interruptionAssistant, "hasInterruptionReason:", 2))
    {
      -[PGInterruptionAssistant cameraInterruptionAttributions](self->_interruptionAssistant, "cameraInterruptionAttributions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __131__PGPictureInPictureController_backgroundPIPService_canAuthorizeBackgroundPIPForActivitySessionWithIdentifier_appBundleIdentifier___block_invoke;
      v18[3] = &unk_1E622F938;
      v18[4] = self;
      v15 = objc_msgSend(v14, "bs_containsObjectPassingTest:", v18) ^ 1;
      if ((v15 & 1) == 0)
      {
        PGLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v20 = "-[PGPictureInPictureController backgroundPIPService:canAuthorizeBackgroundPIPForActivitySessionWithIdent"
                "ifier:appBundleIdentifier:]";
          v21 = 2114;
          v22 = v7;
          v23 = 2114;
          v24 = v8;
          _os_log_impl(&dword_1B0CD6000, v16, OS_LOG_TYPE_DEFAULT, "%s Controller changed mind and decided to reject auth due for %{public}@ %{public}@ to camera interruption.", buf, 0x20u);
        }

      }
    }
    else
    {
      LOBYTE(v15) = 1;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

uint64_t __131__PGPictureInPictureController_backgroundPIPService_canAuthorizeBackgroundPIPForActivitySessionWithIdentifier_appBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_faceTimeVideoCallInterruptionExemption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_continuityCameraInterruptionExemption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v6) ^ 1;

  }
  return v5;
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (PGPictureInPictureApplication)activePictureInPictureApplication
{
  return self->_activePictureInPictureApplication;
}

- (PGPictureInPictureAnalyticsDelegate)analyticsDelegate
{
  return (PGPictureInPictureAnalyticsDelegate *)objc_loadWeakRetained((id *)&self->_analyticsDelegate);
}

- (void)setAnalyticsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_activePictureInPictureApplication, 0);
  objc_storeStrong((id *)&self->_pictureInPictureApplications, 0);
  objc_destroyWeak((id *)&self->_remoteObjectThatRequestedStop);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interruptionAssistant, 0);
  objc_storeStrong((id *)&self->_backgroundPIPService, 0);
  objc_storeStrong((id *)&self->_suspendedPictureInPictureRemoteObject, 0);
  objc_storeStrong((id *)&self->_activePictureInPictureRemoteObjects, 0);
  objc_storeStrong((id *)&self->_listenerQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pictureInPictureRemoteObjectsSupportingActiveSessionCancellationOnStart, 0);
  objc_storeStrong((id *)&self->_lock_pictureInPictureRemoteObjects, 0);
}

- (void)init
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

- (void)shouldStartPictureInPictureForApplicationEnteringBackground:sceneSessionPersistentIdentifier:.cold.1()
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
  OUTLINED_FUNCTION_4();
  _PGLogMethodProem(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v3, v4, "%@ needs to be invoked on the main thread!", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

- (void)_remoteObjectForPictureInPictureApplication:(os_log_t)log passingTest:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0CD6000, log, OS_LOG_TYPE_DEBUG, "Multiple remote object response for attempted action, desired effect is ambiguous", v1, 2u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
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
  OUTLINED_FUNCTION_4();
  _PGLogMethodProem(v0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B0CD6000, v3, v4, "%@ may not be invoked on the main thread!", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
