@implementation PFCameraViewfinderSessionWatcher

- (BOOL)isCameraRunning
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  return v2 & 1;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  unsigned __int8 v5;
  id WeakRetained;
  unsigned __int8 v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_counter;
  v5 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  if ((v5 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_isCameraRunning);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cameraWatcherDidChangeState:", self);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
    if ((v7 & 1) != 0)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFCameraViewfinderSessionWatcher] viewfinderSessionDidBegin:, _isCameraRunning state: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (PFCameraViewfinderSessionWatcher)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  PFCameraViewfinderSessionWatcher *v9;
  PFCameraViewfinderSessionWatcher *v10;
  uint64_t v11;
  FigCameraViewfinder *viewFinder;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PFCameraViewfinderSessionWatcher;
  v9 = -[PFCameraViewfinderSessionWatcher init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    atomic_store(0, (unsigned __int8 *)&v9->_isCameraRunning);
    v9->_counter = 0;
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_msgSend(MEMORY[0x1E0D03B80], "cameraViewfinder");
    v11 = objc_claimAutoreleasedReturnValue();
    viewFinder = v10->_viewFinder;
    v10->_viewFinder = (FigCameraViewfinder *)v11;

    -[FigCameraViewfinder setDelegate:queue:](v10->_viewFinder, "setDelegate:queue:", v10, v7);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[FigCameraViewfinder stop](self->_viewFinder, "stop");
  v3.receiver = self;
  v3.super_class = (Class)PFCameraViewfinderSessionWatcher;
  -[PFCameraViewfinderSessionWatcher dealloc](&v3, sel_dealloc);
}

- (void)startWatching
{
  -[FigCameraViewfinder startWithOptions:](self->_viewFinder, "startWithOptions:", 0);
}

- (void)stopWatching
{
  -[FigCameraViewfinder setDelegate:queue:](self->_viewFinder, "setDelegate:queue:", 0, 0);
  -[FigCameraViewfinder stop](self->_viewFinder, "stop");
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionWillBegin:(id)a4
{
  unsigned __int8 v5;
  id WeakRetained;
  unint64_t counter;
  dispatch_time_t v8;
  NSObject *queue;
  unsigned __int8 v10;
  const __CFString *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  if ((v5 & 1) == 0)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_isCameraRunning);
    ++self->_counter;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cameraWatcherDidChangeState:", self);

    counter = self->_counter;
    v8 = dispatch_time(0, 5000000000);
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__PFCameraViewfinderSessionWatcher_cameraViewfinder_viewfinderSessionWillBegin___block_invoke;
    v12[3] = &unk_1E45A2E40;
    v12[4] = self;
    v12[5] = counter;
    dispatch_after(v8, queue, v12);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v10 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
    if ((v10 & 1) != 0)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFCameraViewfinderSessionWatcher] cameraViewfinder:viewfinderSessionWillBegin:, _isCameraRunning state: %@", buf, 0xCu);
  }
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  unsigned __int8 v5;
  id WeakRetained;
  unsigned __int8 v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ++self->_counter;
  v5 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
  if ((v5 & 1) != 0)
  {
    atomic_store(0, (unsigned __int8 *)&self->_isCameraRunning);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "cameraWatcherDidChangeState:", self);

  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = atomic_load((unsigned __int8 *)&self->_isCameraRunning);
    if ((v7 & 1) != 0)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PFCameraViewfinderSessionWatcher] viewfinderSessionDidEnd:, _isCameraRunning state: %@", (uint8_t *)&v9, 0xCu);
  }
}

- (PFCameraViewfinderSessionWatcherDelegate)delegate
{
  return (PFCameraViewfinderSessionWatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_viewFinder, 0);
}

void __80__PFCameraViewfinderSessionWatcher_cameraViewfinder_viewfinderSessionWillBegin___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  uint8_t v4[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == *(_QWORD *)(v1 + 16))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PFCameraViewfinderSessionWatcher] cameraViewfinder:viewfinderSessionWillBegin: called but session didn't begin 5s later, manually setting _isCameraRunning to NO", v4, 2u);
      v1 = *(_QWORD *)(a1 + 32);
    }
    atomic_store(0, (unsigned __int8 *)(v1 + 32));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(WeakRetained, "cameraWatcherDidChangeState:", *(_QWORD *)(a1 + 32));

  }
}

@end
