@implementation HKSPSleepStoreExportedObject

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sleepStore);
}

- (void)setSleepStore:(id)a3
{
  objc_storeWeak((id *)&self->_sleepStore, a3);
}

- (void)getClientIdentifierWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v6, "loggingIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] responding with client identifier: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v4[2](v4, v6, 0);

}

- (HKSPSleepStore)sleepStore
{
  return (HKSPSleepStore *)objc_loadWeakRetained((id *)&self->_sleepStore);
}

- (void)clientShouldCheckInWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  HKSPLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncAnchorContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] responding with container: %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "syncAnchorContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v11, 0);

}

- (BOOL)_shouldNotifyObserversForClientIdentifier:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "options");

  LOBYTE(v6) = 1;
  if (v4 && (v5 & 0x20) != 0)
  {
    -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v6) = objc_msgSend(v4, "isEqual:", v10) ^ 1;

    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }

  return (char)v6;
}

- (void)sleepScheduleChanged:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    HKSPLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = v8;
      _os_log_error_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_ERROR, "%{public}@ received unexpected nil sleepSchedule", (uint8_t *)&v17, 0xCu);
    }

  }
  HKSPSleepScheduleUnwrap(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(1uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepScheduleChanged: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(v8, "syncAnchorContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateSleepScheduleSyncAnchor:", v13);

  -[HKSPSleepStoreExportedObject _mergeExternalSleepScheduleChange:clientIdentifier:](self, "_mergeExternalSleepScheduleChange:clientIdentifier:", v10, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sleepStoreCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateCachedSleepSchedule:", v14);

  v16 = -[HKSPSleepStoreExportedObject _shouldNotifyObserversForClientIdentifier:](self, "_shouldNotifyObserversForClientIdentifier:", v7);
  if (v16)
    objc_msgSend(v8, "_notifyObserversForChangedSleepSchedule:", v14);

}

- (id)_mergeExternalSleepScheduleChange:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7
    && (-[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "clientIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sleepStoreCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedSleepSchedule");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v6, "lastModifiedDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastModifiedDate:", v15);

        objc_msgSend(v14, "freeze");
        v16 = (id)objc_msgSend(v14, "copy");

      }
      else
      {
        v16 = v6;
      }

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = v6;
  }

  return v16;
}

- (void)sleepSettingsChanged:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepSettingsChanged: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v8, "syncAnchorContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSleepSettingsSyncAnchor:", v11);

  -[HKSPSleepStoreExportedObject _mergeExternalSleepSettingsChange:clientIdentifier:](self, "_mergeExternalSleepSettingsChange:clientIdentifier:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sleepStoreCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateCachedSleepSettings:", v12);

  v14 = -[HKSPSleepStoreExportedObject _shouldNotifyObserversForClientIdentifier:](self, "_shouldNotifyObserversForClientIdentifier:", v7);
  if (v14)
    objc_msgSend(v8, "_notifyObserversForChangedSleepSettings:", v12);

}

- (id)_mergeExternalSleepSettingsChange:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7
    && (-[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "clientIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sleepStoreCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedSleepSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v6, "lastModifiedDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastModifiedDate:", v15);

        objc_msgSend(v14, "freeze");
        v16 = (id)objc_msgSend(v14, "copy");

      }
      else
      {
        v16 = v6;
      }

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = v6;
  }

  return v16;
}

- (void)sleepEventRecordChanged:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(1uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v6;
    _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepEventRecordChanged: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(v8, "syncAnchorContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "syncAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateSleepEventRecordSyncAnchor:", v11);

  -[HKSPSleepStoreExportedObject _mergeExternalSleepEventRecordChange:clientIdentifier:](self, "_mergeExternalSleepEventRecordChange:clientIdentifier:", v6, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sleepStoreCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateCachedSleepEventRecord:", v12);

  v14 = -[HKSPSleepStoreExportedObject _shouldNotifyObserversForClientIdentifier:](self, "_shouldNotifyObserversForClientIdentifier:", v7);
  if (v14)
    objc_msgSend(v8, "_notifyObserversForChangedSleepEventRecord:", v12);

}

- (id)_mergeExternalSleepEventRecordChange:(id)a3 clientIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7
    && (-[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "clientIdentifier"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v7, "isEqual:", v9),
        v9,
        v8,
        (v10 & 1) != 0))
  {
    if (v6)
    {
      -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sleepStoreCache");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedSleepEventRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v6, "lastModifiedDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setLastModifiedDate:", v15);

        objc_msgSend(v14, "freeze");
        v16 = (id)objc_msgSend(v14, "copy");

      }
      else
      {
        v16 = v6;
      }

    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = v6;
  }

  return v16;
}

- (void)sleepEventOccurred:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(1uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepEventOccurred: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v5, "syncAnchorContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateSleepEventSyncAnchor:", v8);

  objc_msgSend(v5, "_notifyObserversForSleepEvent:", v4);
}

- (void)sleepScheduleStateChanged:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "scheduleState");
  v6 = objc_msgSend(v4, "changeReason");
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHKSPSleepScheduleState(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepScheduleStateChangeReason(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v7;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepScheduleStateChanged: %{public}@ (%{public}@)", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(v7, "syncAnchorContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateSleepScheduleStateSyncAnchor:", v12);

  objc_msgSend(v7, "sleepStoreCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateCachedSleepScheduleState:", v5);

  objc_msgSend(v7, "_notifyObserversForChangedSleepScheduleState:reason:", v5, v6);
}

- (void)sleepModeChanged:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "sleepMode");
  v6 = objc_msgSend(v4, "changeReason");
  -[HKSPSleepStoreExportedObject sleepStore](self, "sleepStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHKSPSleepMode(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepModeChangeReason(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v7;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sleepModeChanged: %{public}@ (%{public}@)", (uint8_t *)&v14, 0x20u);

  }
  objc_msgSend(v7, "syncAnchorContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateSleepModeSyncAnchor:", v12);

  objc_msgSend(v7, "sleepStoreCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateCachedSleepMode:", v5);

  objc_msgSend(v7, "_notifyObserversForChangedSleepMode:reason:", v5, v6);
}

@end
