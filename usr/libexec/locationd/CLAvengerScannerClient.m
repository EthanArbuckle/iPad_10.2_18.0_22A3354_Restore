@implementation CLAvengerScannerClient

- (void)onAggressiveScanStarted
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onAggressiveScanStarted") & 1) != 0)
    -[CLAvengerScannerClientDelegateProtocol onAggressiveScanStarted](-[CLAvengerScannerClient delegate](self, "delegate"), "onAggressiveScanStarted");
}

- (void)onAdvertisementBufferEmptied
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onAdvertisementBufferEmptied") & 1) != 0)-[CLAvengerScannerClientDelegateProtocol onAdvertisementBufferEmptied](-[CLAvengerScannerClient delegate](self, "delegate"), "onAdvertisementBufferEmptied");
}

- (CLAvengerScannerClientDelegateProtocol)delegate
{
  return (CLAvengerScannerClientDelegateProtocol *)objc_loadWeak((id *)&self->_delegate);
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  -[CLAvengerScannerClientController centralManager:didDiscoverMultiplePeripherals:](-[CLAvengerScannerClient controller](self, "controller"), "centralManager:didDiscoverMultiplePeripherals:", a3, a4);
}

- (CLAvengerScannerClientController)controller
{
  return self->_controller;
}

- (void)takePowerAssertion
{
  if (-[CLAvengerScannerClient hasPowerAssertion](self, "hasPowerAssertion"))
    -[CLAvengerScannerClient releasePowerAssertion](self, "releasePowerAssertion");
  objc_msgSend(-[CLAvengerScannerClient getPowerAssertionIdentifier](self, "getPowerAssertionIdentifier"), "UTF8String");
  operator new();
}

- (BOOL)performTemporaryAggressiveScan
{
  return -[CLAvengerScannerClientController performTemporaryAggressiveScan](-[CLAvengerScannerClient controller](self, "controller"), "performTemporaryAggressiveScan");
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  -[CLAvengerScannerClientDelegateProtocol onAvengerAdvertisement:reconciledInformation:](-[CLAvengerScannerClient delegate](self, "delegate"), "onAvengerAdvertisement:reconciledInformation:", a3, a4);
}

- (BOOL)hasPowerAssertion
{
  return self->_powerAssertion.__ptr_.__value_ != 0;
}

- (id)getPowerAssertionIdentifier
{
  return objc_msgSend(CFSTR("CLAvengerScannerClient/"), "stringByAppendingString:", -[CLAvengerScannerClientDelegateProtocol clientIdentifier](-[CLAvengerScannerClient delegate](self, "delegate"), "clientIdentifier"));
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  -[CLAvengerScannerClientController centralManager:didDiscoverPeripheral:advertisementData:RSSI:](-[CLAvengerScannerClient controller](self, "controller", a3), "centralManager:didDiscoverPeripheral:advertisementData:RSSI:", -[CLAvengerScannerClient centralManager](self, "centralManager"), a4, a5, a6);
}

- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4
{
  return -[CLAvengerScannerClient initWithDelegate:queue:optedIn:](self, "initWithDelegate:queue:optedIn:", a3, a4, 0);
}

- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4 optedIn:(BOOL)a5
{
  _BOOL8 v5;
  CLAvengerScannerClient *v8;
  CLAvengerScannerClient *result;
  id v10;
  OS_dispatch_queue *queue;
  CLPowerAssertion *value;
  objc_super v13;
  uint64_t v14;
  void *v15;

  v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CLAvengerScannerClient;
  v8 = -[CLAvengerScannerClient init](&v13, "init");
  result = 0;
  if (a3 && v8)
  {
    objc_storeWeak((id *)&v8->_delegate, a3);
    v8->_queue = (OS_dispatch_queue *)a4;
    v10 = objc_alloc((Class)CBCentralManager);
    queue = v8->_queue;
    v14 = CBManagerNeedsRestrictedStateOperation;
    v15 = &__kCFBooleanTrue;
    v8->_centralManager = (CBCentralManager *)objc_msgSend(v10, "initWithDelegate:queue:options:", v8, queue, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v8->_reconciler = -[CLAvengerReconciler initWithQueue:]([CLAvengerReconciler alloc], "initWithQueue:", v8->_queue);
    value = v8->_powerAssertion.__ptr_.__value_;
    v8->_powerAssertion.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);
    v8->_controller = -[CLAvengerScannerClientController initWithDelegate:centralManager:optedIn:reconciler:queue:powerAssertionDelegate:]([CLAvengerScannerClientController alloc], "initWithDelegate:centralManager:optedIn:reconciler:queue:powerAssertionDelegate:", v8, v8->_centralManager, v5, v8->_reconciler, v8->_queue, v8);
    return v8;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_centralManager = 0;
  self->_controller = 0;

  self->_reconciler = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScannerClient;
  -[CLAvengerScannerClient dealloc](&v3, "dealloc");
}

- (BOOL)performTemporaryLongAggressiveScan
{
  return -[CLAvengerScannerClientController performTemporaryLongAggressiveScan](-[CLAvengerScannerClient controller](self, "controller"), "performTemporaryLongAggressiveScan");
}

- (BOOL)stopTemporaryLongAggressiveScan
{
  return -[CLAvengerScannerClientController stopTemporaryLongAggressiveScan](-[CLAvengerScannerClient controller](self, "controller"), "stopTemporaryLongAggressiveScan");
}

- (BOOL)performTemporaryHawkeyeLowEnergyScan
{
  return -[CLAvengerScannerClientController performTemporaryHawkeyeLowEnergyScan](-[CLAvengerScannerClient controller](self, "controller"), "performTemporaryHawkeyeLowEnergyScan");
}

- (BOOL)startBTFindingScan
{
  return -[CLAvengerScannerClientController startBTFindingScan](-[CLAvengerScannerClient controller](self, "controller"), "startBTFindingScan");
}

- (BOOL)stopBTFindingScan
{
  return -[CLAvengerScannerClientController stopBTFindingScan](-[CLAvengerScannerClient controller](self, "controller"), "stopBTFindingScan");
}

- (BOOL)isScanning
{
  return -[CLAvengerScannerClientController isScanning](-[CLAvengerScannerClient controller](self, "controller"), "isScanning");
}

- (BOOL)getOptedIn
{
  return -[CLAvengerScannerClientController getOptedIn](-[CLAvengerScannerClient controller](self, "controller"), "getOptedIn");
}

- (void)setOptedIn:(BOOL)a3
{
  -[CLAvengerScannerClientController setOptedIn:](-[CLAvengerScannerClient controller](self, "controller"), "setOptedIn:", a3);
}

- (BOOL)poweredOn
{
  return -[CLAvengerScannerClientController poweredOn](-[CLAvengerScannerClient controller](self, "controller"), "poweredOn");
}

- (BOOL)performNotOptedInBOMScan
{
  return -[CLAvengerScannerClientController performNotOptedInBOMScan](-[CLAvengerScannerClient controller](self, "controller"), "performNotOptedInBOMScan");
}

- (void)centralManagerDidUpdateState:(id)a3
{
  -[CLAvengerScannerClientController centralManagerDidUpdateState:](-[CLAvengerScannerClient controller](self, "controller"), "centralManagerDidUpdateState:", a3);
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  -[CLAvengerScannerClientController centralManager:didFailToScanWithError:](-[CLAvengerScannerClient controller](self, "controller"), "centralManager:didFailToScanWithError:", a3, a4);
}

- (id)clientIdentifier
{
  return -[CLAvengerScannerClientDelegateProtocol clientIdentifier](-[CLAvengerScannerClient delegate](self, "delegate"), "clientIdentifier");
}

- (void)onAggressiveScanEnded
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onAggressiveScanEnded") & 1) != 0)
    -[CLAvengerScannerClientDelegateProtocol onAggressiveScanEnded](-[CLAvengerScannerClient delegate](self, "delegate"), "onAggressiveScanEnded");
}

- (void)onUpdatedPowerState
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onUpdatedPowerState") & 1) != 0)
    -[CLAvengerScannerClientDelegateProtocol onUpdatedPowerState](-[CLAvengerScannerClient delegate](self, "delegate"), "onUpdatedPowerState");
}

- (void)onNotOptedInBOMScanEnded
{
  if ((objc_opt_respondsToSelector(-[CLAvengerScannerClient delegate](self, "delegate"), "onNotOptedInBOMScanEnded") & 1) != 0)
    -[CLAvengerScannerClientDelegateProtocol onNotOptedInBOMScanEnded](-[CLAvengerScannerClient delegate](self, "delegate"), "onNotOptedInBOMScanEnded");
}

- (void)releasePowerAssertion
{
  CLPowerAssertion *value;

  if (-[CLAvengerScannerClient hasPowerAssertion](self, "hasPowerAssertion"))
  {
    value = self->_powerAssertion.__ptr_.__value_;
    self->_powerAssertion.__ptr_.__value_ = 0;
    if (value)
      (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void)setCentralManager:(id)a3
{
  self->_centralManager = (CBCentralManager *)a3;
}

- (void)setController:(id)a3
{
  self->_controller = (CLAvengerScannerClientController *)a3;
}

- (CLAvengerReconciler)reconciler
{
  return self->_reconciler;
}

- (void)setReconciler:(id)a3
{
  self->_reconciler = (CLAvengerReconciler *)a3;
}

- (void).cxx_destruct
{
  CLPowerAssertion *value;

  objc_destroyWeak((id *)&self->_delegate);
  value = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(CLPowerAssertion *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
