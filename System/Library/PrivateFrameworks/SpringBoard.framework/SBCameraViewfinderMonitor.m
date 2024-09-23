@implementation SBCameraViewfinderMonitor

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SBCameraViewfinderMonitor_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance___result;
}

void __43__SBCameraViewfinderMonitor_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___result;
  sharedInstance___result = (uint64_t)v1;

}

- (void)_start
{
  FigCameraViewfinder *v3;
  FigCameraViewfinder *cameraViewFinder;

  if (!self->_cameraViewFinder)
  {
    objc_msgSend(MEMORY[0x1E0D03B80], "cameraViewfinder");
    v3 = (FigCameraViewfinder *)objc_claimAutoreleasedReturnValue();
    cameraViewFinder = self->_cameraViewFinder;
    self->_cameraViewFinder = v3;

    -[FigCameraViewfinder setDelegate:queue:](self->_cameraViewFinder, "setDelegate:queue:", self, MEMORY[0x1E0C80D38]);
    -[FigCameraViewfinder startWithOptions:](self->_cameraViewFinder, "startWithOptions:", 0);
  }
}

- (id)addObserver:(id)a3
{
  id v4;
  SBCameraViewfinderMonitorToken *v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;

  v4 = a3;
  if (v4 && !-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    observers = self->_observers;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v4);
    if (-[NSHashTable count](self->_observers, "count") == 1)
      -[SBCameraViewfinderMonitor _start](self, "_start");
    v5 = -[SBCameraViewfinderMonitorToken initWithMonitor:observer:]([SBCameraViewfinderMonitorToken alloc], "initWithMonitor:observer:", self, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_removeObserver:(id)a3
{
  NSHashTable *observers;

  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

    -[SBCameraViewfinderMonitor _cancel](self, "_cancel");
  }
}

- (void)_cancel
{
  FigCameraViewfinder *cameraViewFinder;
  FigCameraViewfinder *v4;

  cameraViewFinder = self->_cameraViewFinder;
  if (cameraViewFinder)
  {
    -[FigCameraViewfinder stop](cameraViewFinder, "stop");
    v4 = self->_cameraViewFinder;
    self->_cameraViewFinder = 0;

  }
}

- (id)auditTokenForProcessWithActiveOrImminentViewfinderSession
{
  return self->_activeSessionAuditToken;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v24[2];
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0D016E0];
  if (v7)
    objc_msgSend(v7, "clientAuditToken");
  else
    memset(v24, 0, sizeof(v24));
  objc_msgSend(v9, "tokenFromAuditToken:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v19 = v6;
    objc_storeStrong((id *)&self->_activeSessionAuditToken, v10);
    SBLogCaptureViewfinderMonitor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v12;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Camera Viewfinder Active for: %@", buf, 0xCu);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "cameraViewfinderMonitorSessionWillBegin:auditToken:", self, v10);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v15);
    }

    v6 = v19;
  }

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0D016E0];
  if (v7)
    objc_msgSend(v7, "clientAuditToken");
  else
    memset(v25, 0, sizeof(v25));
  objc_msgSend(v9, "tokenFromAuditToken:", v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "hasSameProcessAsAuditToken:", self->_activeSessionAuditToken) & 1) == 0)
    {
      SBLogCaptureViewfinderMonitor();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "bundleID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v13;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Camera Viewfinder Active for: %@", buf, 0xCu);

      }
    }
    v20 = v6;
    objc_storeStrong((id *)&self->_activeSessionAuditToken, v11);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v19, "cameraViewfinderMonitorSessionDidBegin:auditToken:", self, v11);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }

    v6 = v20;
  }

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BSAuditToken *activeSessionAuditToken;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0D016E0];
  if (v7)
    objc_msgSend(v7, "clientAuditToken");
  else
    memset(v26, 0, sizeof(v26));
  objc_msgSend(v9, "tokenFromAuditToken:", v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "hasSameProcessAsAuditToken:", self->_activeSessionAuditToken))
    {
      activeSessionAuditToken = self->_activeSessionAuditToken;
      self->_activeSessionAuditToken = 0;

      SBLogCaptureViewfinderMonitor();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "bundleID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v14;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Camera Viewfinder Inactive for: %@", buf, 0xCu);

      }
    }
    v21 = v6;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v20, "cameraViewfinderMonitorSessionDidEnd:auditToken:", self, v11);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v17);
    }

    v6 = v21;
  }

}

- (void)cameraViewfinderSessionDidStartMovieRecording:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "cameraViewfinderMonitorSessionDidBeginMovieRecording:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)cameraViewfinderSessionDidFinishMovieRecording:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[NSHashTable copy](self->_observers, "copy", a3, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "cameraViewfinderMonitorSessionDidEndMovieRecording:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (FigCameraViewfinder)cameraViewFinder
{
  return self->_cameraViewFinder;
}

- (void)setCameraViewFinder:(id)a3
{
  objc_storeStrong((id *)&self->_cameraViewFinder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraViewFinder, 0);
  objc_storeStrong((id *)&self->_activeSessionAuditToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
