@implementation PKBluetoothMonitorer

- (PKBluetoothMonitorer)initWithManagerOptions:(id)a3
{
  id v4;
  PKBluetoothMonitorer *v5;
  uint64_t v6;
  CBCentralManager *bluetoothManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKBluetoothMonitorer;
  v5 = -[PKBluetoothMonitorer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97728]), "initWithDelegate:queue:options:", v5, 0, v4);
    bluetoothManager = v5->_bluetoothManager;
    v5->_bluetoothManager = (CBCentralManager *)v6;

  }
  return v5;
}

- (int64_t)state
{
  int64_t result;

  result = -[CBCentralManager state](self->_bluetoothManager, "state");
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  v4 = objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 1) >= 5)
    v5 = 0;
  else
    v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "bluetoothMonitorerRecievedUpdatedBluetoothState:", v5);

}

- (PKBluetoothMonitorerDelegate)delegate
{
  return (PKBluetoothMonitorerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

@end
