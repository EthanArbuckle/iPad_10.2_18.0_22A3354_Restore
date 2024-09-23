@implementation PLFileSystemVolumeUnmountMonitor

uint64_t __61__PLFileSystemVolumeUnmountMonitor_addVolumeUnmountObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

- (PLFileSystemVolumeUnmountMonitor)initWithVolumeURL:(id)a3
{
  id v4;
  PLFileSystemVolumeUnmountMonitor *v5;
  PLFileSystemVolumeUnmountMonitor *v6;
  uint64_t v7;
  NSHashTable *observers;
  uint64_t v9;
  NSURL *volumeURL;
  NSObject *v11;
  NSURL *v12;
  objc_super v14;
  uint8_t buf[4];
  PLFileSystemVolumeUnmountMonitor *v16;
  __int16 v17;
  NSURL *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLFileSystemVolumeUnmountMonitor;
  v5 = -[PLFileSystemVolumeUnmountMonitor init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = objc_msgSend(v4, "copy");
    volumeURL = v6->_volumeURL;
    v6->_volumeURL = (NSURL *)v9;

    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v6->_volumeURL;
      *(_DWORD *)buf = 134218242;
      v16 = v6;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Initialized Volume Unmount Monitor %p for %@", buf, 0x16u);
    }

  }
  return v6;
}

- (void)addVolumeUnmountObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLFileSystemVolumeUnmountMonitor;
  -[PLFileSystemVolumeUnmountMonitor dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %p %@"), objc_opt_class(), self, self->_volumeURL);
}

- (void)removeVolumeUnmountObserver:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeURL, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

uint64_t __64__PLFileSystemVolumeUnmountMonitor_removeVolumeUnmountObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

@end
