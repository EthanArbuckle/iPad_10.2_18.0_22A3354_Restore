@implementation CLAvengerScannerStateContext

- (CLAvengerScannerStateContext)init
{
  CLAvengerScannerStateContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScannerStateContext;
  result = -[CLAvengerScannerStateContext init](&v3, "init");
  if (result)
  {
    *(_WORD *)&result->startScanningAwaitingResponse = 0;
    result->currentWPState = 0;
    result->requestedScanType = 0;
  }
  return result;
}

- (int64_t)currentWPState
{
  return self->currentWPState;
}

- (void)setCurrentWPState:(int64_t)a3
{
  self->currentWPState = a3;
}

- (BOOL)startScanningAwaitingResponse
{
  return self->startScanningAwaitingResponse;
}

- (void)setStartScanningAwaitingResponse:(BOOL)a3
{
  self->startScanningAwaitingResponse = a3;
}

- (BOOL)stopScanningAwaitingResponse
{
  return self->stopScanningAwaitingResponse;
}

- (void)setStopScanningAwaitingResponse:(BOOL)a3
{
  self->stopScanningAwaitingResponse = a3;
}

- (int64_t)requestedScanType
{
  return self->requestedScanType;
}

- (void)setRequestedScanType:(int64_t)a3
{
  self->requestedScanType = a3;
}

@end
