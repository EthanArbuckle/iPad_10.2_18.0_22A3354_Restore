@implementation SPBLEStateMonitor

- (SPBLEStateMonitor)init
{
  SPBLEStateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SPBLEStateMonitor;
  result = -[SPBLEStateMonitor init](&v3, sel_init);
  if (result)
    result->_bleState = 0;
  return result;
}

- (void)startMonitoring
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SPBLEStateMonitor_startMonitoring__block_invoke;
  block[3] = &unk_1E5E16668;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __36__SPBLEStateMonitor_startMonitoring__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc(MEMORY[0x1E0C97728]);
  v3 = (void *)objc_msgSend(v2, "initWithDelegate:queue:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C80D38]);
  objc_msgSend(*(id *)(a1 + 32), "setCentralManager:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "centralManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centralManagerDidUpdateState:", v5);

}

- (void)notifyDelegate:(unint64_t)a3
{
  id v4;

  if (-[SPBLEStateMonitor bleState](self, "bleState") != a3)
  {
    -[SPBLEStateMonitor delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bleMonitor:didChangeState:", self, -[SPBLEStateMonitor bleState](self, "bleState"));

  }
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SPBLEStateMonitor bleState](self, "bleState");
  if (objc_msgSend(v4, "state") == 5)
    v6 = 1;
  else
    v6 = 2;
  -[SPBLEStateMonitor setBleState:](self, "setBleState:", v6);
  LogCategory_Unspecified();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v4, "state");
    _os_log_impl(&dword_1AEA79000, v7, OS_LOG_TYPE_DEFAULT, "BluetoothState: %lu", (uint8_t *)&v8, 0xCu);
  }

  -[SPBLEStateMonitor notifyDelegate:](self, "notifyDelegate:", v5);
}

- (unint64_t)bleState
{
  return self->_bleState;
}

- (void)setBleState:(unint64_t)a3
{
  self->_bleState = a3;
}

- (SPBLEStateMonitorDelegate)delegate
{
  return (SPBLEStateMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
