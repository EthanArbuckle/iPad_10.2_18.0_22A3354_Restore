@implementation SMCAirplaneModeObserver

- (BOOL)enabled
{
  return -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SMCAirplaneModeObserver)initWithQueue:(id)a3
{
  id v5;
  SMCAirplaneModeObserver *v6;
  SMCAirplaneModeObserver *v7;
  RadiosPreferences *v8;
  RadiosPreferences *radiosPreferences;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMCAirplaneModeObserver;
  v6 = -[SMCAirplaneModeObserver init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x1E0CFA9B8]);
    radiosPreferences = v7->_radiosPreferences;
    v7->_radiosPreferences = v8;

    -[RadiosPreferences setDelegate:](v7->_radiosPreferences, "setDelegate:", v7);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)airplaneModeChanged
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SMCAirplaneModeObserver_airplaneModeChanged__block_invoke;
  block[3] = &unk_1E8B608F0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __46__SMCAirplaneModeObserver_airplaneModeChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "airplaneModeChanged");

}

- (SMCAirplaneModeObserverDelegate)delegate
{
  return (SMCAirplaneModeObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

@end
