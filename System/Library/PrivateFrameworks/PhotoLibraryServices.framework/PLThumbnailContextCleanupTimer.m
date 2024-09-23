@implementation PLThumbnailContextCleanupTimer

- (PLThumbnailContextCleanupTimer)initWithHandler:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  void *v11;
  dispatch_source_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PLThumbnailContextCleanupTimer;
  v5 = -[PLThumbnailContextCleanupTimer init](&v20, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x19AEC174C](v4);
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = dispatch_queue_create("com.apple.photos.backend.thumbnailContextCleanup", v9);
    v11 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v10;

    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v5 + 2));
    v13 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v12;

    *((_DWORD *)v5 + 8) = 0;
    objc_initWeak(&location, v5);
    v14 = *((_QWORD *)v5 + 3);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __50__PLThumbnailContextCleanupTimer_initWithHandler___block_invoke;
    v17[3] = &unk_1E3677D48;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v14, v17);
    v15 = v5;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return (PLThumbnailContextCleanupTimer *)v5;
}

- (void)activate
{
  dispatch_activate((dispatch_object_t)self->_timer);
}

- (void)invalidate
{
  dispatch_source_cancel((dispatch_source_t)self->_timer);
  PLRunWithUnfairLock();
}

- (void)_timerFired
{
  (*((void (**)(void))self->_handler + 2))();
  PLRunWithUnfairLock();
}

- (void)startOrRestartTimer
{
  dispatch_time_t v3;

  PLRunWithUnfairLock();
  v3 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 10000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_timer, v3, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
}

void __53__PLThumbnailContextCleanupTimer_startOrRestartTimer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = os_transaction_create();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __45__PLThumbnailContextCleanupTimer__timerFired__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __44__PLThumbnailContextCleanupTimer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __50__PLThumbnailContextCleanupTimer_initWithHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_timerFired");

}

@end
