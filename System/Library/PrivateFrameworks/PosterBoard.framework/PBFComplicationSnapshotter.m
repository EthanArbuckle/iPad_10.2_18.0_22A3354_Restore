@implementation PBFComplicationSnapshotter

- (PBFComplicationSnapshotter)initWithComplicationSnapshotRequest:(id)a3
{
  id v5;
  PBFComplicationSnapshotter *v6;
  PBFComplicationSnapshotter *v7;
  uint64_t v8;
  NSHashTable *lock_observers;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *snapshotterIdentifier;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PBFComplicationSnapshotter;
  v6 = -[PBFComplicationSnapshotter init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    lock_observers = v7->_lock_observers;
    v7->_lock_observers = (NSHashTable *)v8;

    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "substringToIndex:", 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "widget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@-%@"), v13, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    snapshotterIdentifier = v7->_snapshotterIdentifier;
    v7->_snapshotterIdentifier = (NSString *)v17;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)start
{
  os_unfair_lock_s *p_lock;
  _BOOL4 lock_started;
  NSObject *v5;
  NSString *snapshotterIdentifier;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSString *v12;
  dispatch_time_t v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD block[4];
  id v19;
  PBFComplicationSnapshotter *v20;
  uint8_t buf[4];
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_started = self->_lock_started;
  if (self->_lock_started)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_startTime = CFAbsoluteTimeGetCurrent();
    self->_lock_started = 1;
    os_unfair_lock_unlock(p_lock);
    PBFLogSnapshotter();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      snapshotterIdentifier = self->_snapshotterIdentifier;
      *(_DWORD *)buf = 138543362;
      v22 = snapshotterIdentifier;
      _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Starting complication snapshotter", buf, 0xCu);
    }

    -[PBFComplicationSnapshotRequest widget](self->_request, "widget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PBFComplicationSnapshotter_start__block_invoke;
    block[3] = &unk_1E86F2540;
    v9 = v7;
    v19 = v9;
    v20 = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "BOOLForKey:", CFSTR("DISABLE_SNAPSHOT_TIMEOUT")) & 1) == 0)
    {
      PBFLogSnapshotter();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_snapshotterIdentifier;
        *(_DWORD *)buf = 138543362;
        v22 = v12;
        _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_INFO, "(%{public}@) Starting complication snapshotter timeout watching", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v13 = dispatch_time(0, 60000000000);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __35__PBFComplicationSnapshotter_start__block_invoke_8;
      v16[3] = &unk_1E86F3C90;
      objc_copyWeak(&v17, (id *)buf);
      v14 = (void *)MEMORY[0x1E0C80D38];
      dispatch_after(v13, MEMORY[0x1E0C80D38], v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }

  }
  return !lock_started;
}

void __35__PBFComplicationSnapshotter_start__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  PRSharedWidgetDescriptorProvider();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorForPersonality:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "intentType");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(*(id *)(a1 + 32), "intent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __35__PBFComplicationSnapshotter_start__block_invoke_2;
    v9[3] = &unk_1E86F3C68;
    v7 = *(id *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = v7;
    v11 = v8;
    objc_msgSend(v3, "loadDefaultIntent:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_main_kickoffHostViewController:", *(_QWORD *)(a1 + 32));
  }

}

void __35__PBFComplicationSnapshotter_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "widgetByReplacingIntent:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_main_kickoffHostViewController:", v3);

}

void __35__PBFComplicationSnapshotter_start__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_requestTimedOut");

}

- (BOOL)_main_kickoffHostViewController:(id)a3
{
  id v5;
  void *v6;
  CHUISWidgetHostViewController *v7;
  CHUISWidgetHostViewController *hostViewController;
  void *v9;
  id v10;
  id v11;
  void *v12;
  CHUISWidgetHostViewController *v13;
  void *v14;
  id v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v5 = a3;
  NSClassFromString(CFSTR("CHSWidget"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotter _main_kickoffHostViewController:].cold.1(a2);
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA325F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:CHSWidgetClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotter _main_kickoffHostViewController:].cold.2(a2);
    goto LABEL_9;
  }

  BSDispatchQueueAssertMain();
  -[PBFComplicationSnapshotRequest metrics](self->_request, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (CHUISWidgetHostViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10310]), "initWithWidget:metrics:widgetConfigurationIdentifier:", v5, v6, 0);
  hostViewController = self->_hostViewController;
  self->_hostViewController = v7;

  -[CHUISWidgetHostViewController setCanAppearInSecureEnvironment:](self->_hostViewController, "setCanAppearInSecureEnvironment:", 1);
  -[CHUISWidgetHostViewController setContentType:](self->_hostViewController, "setContentType:", 1);
  -[CHUISWidgetHostViewController setColorScheme:](self->_hostViewController, "setColorScheme:", 2);
  -[CHUISWidgetHostViewController setWidgetPriority:](self->_hostViewController, "setWidgetPriority:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10250]), "initWithRenderingMode:backgroundViewPolicy:", 1, 1);
  -[CHUISWidgetHostViewController setRenderScheme:](self->_hostViewController, "setRenderScheme:", v9);
  v10 = objc_alloc_init(MEMORY[0x1E0D10058]);
  objc_msgSend(v10, "setShowsDateAlongsideText:", 1);
  v11 = objc_alloc_init(MEMORY[0x1E0D10040]);
  objc_msgSend(v11, "setSize:", &unk_1E8741B38);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1438]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWeight:", v12);

  objc_msgSend(v10, "setFontSpecification:", v11);
  objc_msgSend(v10, "setSymbolScale:", 1);
  -[CHUISWidgetHostViewController setInlineTextParameters:](self->_hostViewController, "setInlineTextParameters:", v10);
  -[CHUISWidgetHostViewController setPresentationMode:](self->_hostViewController, "setPresentationMode:", 2);
  objc_initWeak(&location, self);
  v13 = self->_hostViewController;
  dispatch_get_global_queue(25, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__PBFComplicationSnapshotter__main_kickoffHostViewController___block_invoke;
  v18[3] = &unk_1E86F3CB8;
  v15 = v5;
  v19 = v15;
  objc_copyWeak(&v20, &location);
  -[CHUISWidgetHostViewController snapshotContentWithTimeout:queue:completion:](v13, "snapshotContentWithTimeout:queue:completion:", v14, v18, 30.0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

void __62__PBFComplicationSnapshotter__main_kickoffHostViewController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!(v5 | v6))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v11[0] = *MEMORY[0x1E0CB2D50];
    v11[1] = CFSTR("Widget");
    v8 = *(const __CFString **)(a1 + 32);
    if (!v8)
      v8 = CFSTR("(null widget)");
    v12[0] = CFSTR("Unable to generate image for widget");
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pbf_generalErrorWithCode:userInfo:", 1, v9);
    v6 = objc_claimAutoreleasedReturnValue();

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishWithImage:error:", v5, v6);

}

- (void)_main_requestTimedOut
{
  id v3;

  if (!-[PBFComplicationSnapshotter _isFinished](self, "_isFinished"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 2, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PBFComplicationSnapshotter _finishWithImage:error:](self, "_finishWithImage:error:", 0, v3);

  }
}

- (void)_finishWithImage:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  uint64_t v11;
  char *__ptr32 *v12;
  NSObject *v13;
  NSObject *v14;
  NSString *snapshotterIdentifier;
  double v16;
  NSString *v17;
  double v18;
  PBFComplicationSnapshotter *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  os_unfair_lock_s *v26;
  id v27;
  void *v28;
  id obj;
  _QWORD block[5];
  _QWORD v31[6];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  NSString *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  uint64_t v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v28 = v7;
  obj = a4;
  if (__PAIR128__((unint64_t)obj, (unint64_t)v7) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D68];
    v46[0] = CFSTR("No image was created and no error given; this is a catch all instead of just crashing.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pbf_generalErrorWithCode:userInfo:", 7, v9);
    obj = (id)objc_claimAutoreleasedReturnValue();

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = MEMORY[0x1E0C809B0];
  v12 = &off_1CBB8E000;
  if (!self->_lock_finished)
  {
    v26 = &self->_lock;
    self->_lock_endTime = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&self->_snapshot, a3);
    objc_storeStrong((id *)&self->_snapshotError, obj);
    PBFLogSnapshotter();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (obj)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        snapshotterIdentifier = self->_snapshotterIdentifier;
        v16 = self->_lock_endTime - self->_lock_startTime;
        *(_DWORD *)buf = 138543874;
        v40 = snapshotterIdentifier;
        v41 = 2114;
        v42 = *(double *)&obj;
        v43 = 2048;
        v44 = v16;
        _os_log_error_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_ERROR, "(%{public}@) Finished complication snapshotter w/ error '%{public}@'; %f seconds elapsed",
          buf,
          0x20u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_snapshotterIdentifier;
      v18 = self->_lock_endTime - self->_lock_startTime;
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      v41 = 2048;
      v42 = v18;
      _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished complication snapshotter; %f seconds elapsed",
        buf,
        0x16u);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v19 = self;
    v27 = (id)-[NSHashTable copy](self->_lock_observers, "copy");
    v20 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v27);
          v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PBFComplicationSnapshotter _finishWithImage:error:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke;
          v31[3] = &unk_1E86F3308;
          v31[4] = v24;
          v31[5] = v19;
          v32 = v28;
          v33 = obj;
          PBFDispatchAsyncWithString(v25, QOS_CLASS_DEFAULT, v31);

        }
        v21 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v21);
    }

    self = v19;
    -[NSHashTable removeAllObjects](v19->_lock_observers, "removeAllObjects");
    v19->_lock_finished = 1;
    p_lock = v26;
    v11 = MEMORY[0x1E0C809B0];
    v12 = &off_1CBB8E000;
  }
  os_unfair_lock_unlock(p_lock);
  block[0] = v11;
  block[1] = *((_QWORD *)v12 + 45);
  block[2] = __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke_2;
  block[3] = &unk_1E86F2518;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "complicationSnapshotter:didFinishWithSnapshot:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __53__PBFComplicationSnapshotter__finishWithImage_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_cleanup");
}

- (void)cancelWithReason:(id)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB35C8];
  if (a3)
    v5 = (const __CFString *)a3;
  else
    v5 = CFSTR("(null)");
  v10 = *MEMORY[0x1E0CB2D68];
  v11[0] = v5;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pbf_generalErrorWithCode:userInfo:", 4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBFComplicationSnapshotter _finishWithImage:error:](self, "_finishWithImage:error:", 0, v9);
}

- (void)_main_cleanup
{
  CHUISWidgetHostViewController *hostViewController;

  BSDispatchQueueAssertMain();
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_cleanedUp)
  {
    -[CHUISWidgetHostViewController invalidate](self->_hostViewController, "invalidate");
    hostViewController = self->_hostViewController;
    self->_hostViewController = 0;

    self->_lock_cleanedUp = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (UIImage)snapshot
{
  os_unfair_lock_s *p_lock;
  UIImage *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_snapshot;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSError)snapshotError
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_snapshotError;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)elapsedTime
{
  os_unfair_lock_s *p_lock;
  double lock_endTime;
  double v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_started)
  {
    if (self->_lock_finished)
      lock_endTime = self->_lock_endTime;
    else
      lock_endTime = CFAbsoluteTimeGetCurrent();
    v5 = lock_endTime - self->_lock_startTime;
  }
  else
  {
    v5 = -1.0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)_isFinished
{
  PBFComplicationSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_hasStarted
{
  PBFComplicationSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_started;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_wasCleanedUp
{
  PBFComplicationSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_cleanedUp;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_wasInvalidated
{
  PBFComplicationSnapshotter *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_lock_invalidated = 1;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PBFComplicationSnapshotter _finishWithImage:error:](self, "_finishWithImage:error:", 0, v4);

  }
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_lock_observers, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_lock_observers, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (PBFComplicationSnapshotRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_snapshotError, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_widgetWithIntent, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_snapshotterIdentifier, 0);
}

- (void)_main_kickoffHostViewController:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_main_kickoffHostViewController:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
