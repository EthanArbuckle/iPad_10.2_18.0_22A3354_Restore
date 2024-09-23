@implementation SBCaptureButtonSuppressionManager

- (SBCaptureButtonSuppressionManager)init
{
  SBCaptureButtonSuppressionManager *v2;
  SBCaptureButtonSuppressionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCaptureButtonSuppressionManager;
  v2 = -[SBCaptureButtonSuppressionManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_suppressionState = 0;
    -[SBCaptureButtonSuppressionManager _subscribeToViewObstructedUpdates](v2, "_subscribeToViewObstructedUpdates");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBCaptureButtonSuppressionManager _unsubscribeFromViewObstructedUpdates](self, "_unsubscribeFromViewObstructedUpdates");
  v3.receiver = self;
  v3.super_class = (Class)SBCaptureButtonSuppressionManager;
  -[SBCaptureButtonSuppressionManager dealloc](&v3, sel_dealloc);
}

- (void)setSuppressionState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  SBCaptureButtonSuppressionManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_suppressionState != a3)
  {
    self->_suppressionState = a3;
    SBLogCameraCaptureSuppression();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBCaptureButtonSuppressionState(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = self;
      v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) suppression state is now: %{public}@", (uint8_t *)&v7, 0x16u);

    }
    -[SBCaptureButtonSuppressionManager _notifyObserversOfSuppressionState](self, "_notifyObserversOfSuppressionState");
  }
}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 16), "removeObject:", a2);
  return result;
}

- (BOOL)isInCameraCapturePose
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CMSuppressionManager isCameraCapturePose](self->_suppressionManager, "isCameraCapturePose");
  else
    return 1;
}

- (unint64_t)cameraCapturePoseType
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[CMSuppressionManager cameraCapturePoseUIHint](self->_suppressionManager, "cameraCapturePoseUIHint");
  else
    return 0;
}

- (void)_notifyObserversOfSuppressionState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "captureButtonSuppressionManager:event:", self, self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_subscribeToViewObstructedUpdates
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "-[CMSuppressionManager isAvailable] returned NO", v1, 2u);
}

void __70__SBCaptureButtonSuppressionManager__subscribeToViewObstructedUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  SBLogCameraCaptureSuppression();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v18 = *v7;
      objc_msgSend(v6, "localizedDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedFailureReason");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v18;
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v19;
      v27 = 2114;
      v28 = v20;
      _os_log_fault_impl(&dword_1D0540000, v9, OS_LOG_TYPE_FAULT, "(%{public}@) suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v21, 0x2Au);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *v7;
    v21 = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v5;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) suppression event: %{public}@", (uint8_t *)&v21, 0x16u);
  }

  v11 = objc_msgSend(v5, "type");
  v12 = v11;
  switch(v11)
  {
    case 1:
      v14 = 0;
LABEL_22:
      *((_QWORD *)*v7 + 6) = v14;
      goto LABEL_23;
    case 2:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "timeSinceLastFacedownStatic");
        v14 = v15;
        v12 = 3;
      }
      else
      {
        v14 = 0;
        v12 = 2;
      }
      SBLogCameraCaptureSuppression();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *v7;
        v21 = 138543618;
        v22 = v17;
        v23 = 2048;
        v24 = v14;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) time since last face down: %g", (uint8_t *)&v21, 0x16u);
      }

      goto LABEL_22;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kCMSuppressionEventTypeMax not handled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        __70__SBCaptureButtonSuppressionManager__subscribeToViewObstructedUpdates__block_invoke_cold_1(a1, (uint64_t *)(a1 + 32), (uint64_t)v13);
      objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0AC64B0);
  }
LABEL_14:
  v12 = 0;
LABEL_23:
  objc_msgSend(*v7, "setSuppressionState:", v12);

}

- (void)_unsubscribeFromViewObstructedUpdates
{
  NSObject *v3;
  CMSuppressionManager *suppressionManager;
  uint8_t v5[16];

  if (self->_suppressionManager)
  {
    SBLogCameraCaptureSuppression();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Disabling View Obstructed updates", v5, 2u);
    }

    -[CMSuppressionManager stopSuppressionUpdates](self->_suppressionManager, "stopSuppressionUpdates");
    -[CMSuppressionManager stopService](self->_suppressionManager, "stopService");
    suppressionManager = self->_suppressionManager;
    self->_suppressionManager = 0;

  }
}

- (int64_t)suppressionState
{
  return self->_suppressionState;
}

- (void)setInCameraCapturePose:(BOOL)a3
{
  self->_inCameraCapturePose = a3;
}

- (void)setCameraCapturePoseType:(unint64_t)a3
{
  self->_cameraCapturePoseType = a3;
}

- (double)secondsAfterFaceDownAtUnsuppressionTime
{
  return self->_secondsAfterFaceDownAtUnsuppressionTime;
}

- (void)setSecondsAfterFaceDownAtUnsuppressionTime:(double)a3
{
  self->_secondsAfterFaceDownAtUnsuppressionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

void __70__SBCaptureButtonSuppressionManager__subscribeToViewObstructedUpdates__block_invoke_cold_1(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a2;
  v9 = 138544642;
  v10 = v5;
  v11 = 2114;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  v15 = 2114;
  v16 = CFSTR("SBCaptureButtonSuppressionManager.m");
  v17 = 1024;
  v18 = 156;
  v19 = 2114;
  v20 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

}

@end
