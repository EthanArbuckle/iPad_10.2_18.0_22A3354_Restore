@implementation SUInstallationConstraintMonitorMediaPlaying

- (id)initOnQueue:(id)a3 withDownload:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  BSDispatchQueueAssert();
  v13.receiver = self;
  v13.super_class = (Class)SUInstallationConstraintMonitorMediaPlaying;
  v8 = -[SUInstallationConstraintMonitorBase initOnQueue:withRepresentedInstallationConstraints:andDownload:](&v13, sel_initOnQueue_withRepresentedInstallationConstraints_andDownload_, v7, 1024, v6);

  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.softwareupdateservices.mediaremote", 0);
    v10 = (void *)v8[7];
    v8[7] = v9;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v8, sel__handlePlaybackChangeNotification_, *MEMORY[0x24BE65768], 0);

    MRMediaRemoteSetWantsNowPlayingNotifications();
    objc_msgSend(v8, "_queue_pollSatisfied");
  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  MRMediaRemoteSetWantsNowPlayingNotifications();
  v4.receiver = self;
  v4.super_class = (Class)SUInstallationConstraintMonitorMediaPlaying;
  -[SUInstallationConstraintMonitorMediaPlaying dealloc](&v4, sel_dealloc);
}

- (void)_queue_pollSatisfied
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  SUInstallationConstraintMonitorMediaPlaying *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  BSDispatchQueueAssert();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = dispatch_semaphore_create(0);
  v10 = MEMORY[0x24BDAC760];
  v4 = v3;
  v11 = v4;
  MRMediaRemoteGetNowPlayingApplicationPlaybackState();
  v5 = dispatch_time(0, 3000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = *((unsigned __int8 *)v13 + 24);
  if (self->_queue_mediaPlaying != v6)
  {
    self->_queue_mediaPlaying = v6;
    SULogInstallConstraints();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_queue_mediaPlaying)
        v8 = CFSTR("NO");
      else
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v17 = self;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_2128D9000, v7, OS_LOG_TYPE_DEFAULT, "%@ - media playing constraint changed (satisfied? %@)", buf, 0x16u);
    }

    -[SUInstallationConstraintMonitorBase delegate](self, "delegate", v10, 3221225472, __67__SUInstallationConstraintMonitorMediaPlaying__queue_pollSatisfied__block_invoke, &unk_24CE3CB78, v4, &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "installationConstraintMonitor:constraintsDidChange:", self, -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints"));

  }
  _Block_object_dispose(&v12, 8);
}

intptr_t __67__SUInstallationConstraintMonitorMediaPlaying__queue_pollSatisfied__block_invoke(uint64_t a1, int a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2 == 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handlePlaybackChangeNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->super._queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__SUInstallationConstraintMonitorMediaPlaying__handlePlaybackChangeNotification___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __81__SUInstallationConstraintMonitorMediaPlaying__handlePlaybackChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_pollSatisfied");
}

- (unint64_t)unsatisfiedConstraints
{
  BSDispatchQueueAssert();
  -[SUInstallationConstraintMonitorMediaPlaying _queue_pollSatisfied](self, "_queue_pollSatisfied");
  if (self->_queue_mediaPlaying)
    return -[SUInstallationConstraintMonitorBase representedConstraints](self, "representedConstraints");
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteQueue, 0);
}

@end
