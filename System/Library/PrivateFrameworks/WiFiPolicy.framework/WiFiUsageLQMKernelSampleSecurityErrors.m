@implementation WiFiUsageLQMKernelSampleSecurityErrors

+ (id)sampleWithStruct:(rxSecurityInfo *)a3 andTimestamp:(id)a4
{
  id v5;
  uint64_t var0;
  WiFiUsageLQMKernelSampleSecurityErrors *v7;

  v5 = a4;
  var0 = a3->var0;
  if ((_DWORD)var0)
  {
    NSLog(CFSTR("%s - Unknown version: %u"), "+[WiFiUsageLQMKernelSampleSecurityErrors sampleWithStruct:andTimestamp:]", var0);
    v7 = 0;
  }
  else
  {
    v7 = -[WiFiUsageLQMKernelSampleSecurityErrors initWithStruct:andTimestamp:]([WiFiUsageLQMKernelSampleSecurityErrors alloc], "initWithStruct:andTimestamp:", a3, v5);
  }

  return v7;
}

- (WiFiUsageLQMKernelSampleSecurityErrors)initWithStruct:(rxSecurityInfo *)a3 andTimestamp:(id)a4
{
  NSDate *v6;
  WiFiUsageLQMKernelSampleSecurityErrors *v7;
  NSDate *timestamp;
  unint64_t var2;
  unint64_t var4;
  objc_super v12;

  v6 = (NSDate *)a4;
  v12.receiver = self;
  v12.super_class = (Class)WiFiUsageLQMKernelSampleSecurityErrors;
  v7 = -[WiFiUsageLQMKernelSampleSecurityErrors init](&v12, sel_init);
  timestamp = v7->_timestamp;
  v7->_timestamp = v6;

  var2 = a3->var2;
  v7->_rxUcastReplayError = a3->var1;
  v7->_rxucastDecryptError = var2;
  var4 = a3->var4;
  v7->_rxmcastReplayError = a3->var3;
  v7->_rxmcastDecryptError = var4;
  return v7;
}

+ (id)featureFromFieldName:(id)a3
{
  return CFSTR("sum");
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)rxUcastReplayError
{
  return self->_rxUcastReplayError;
}

- (void)setRxUcastReplayError:(unint64_t)a3
{
  self->_rxUcastReplayError = a3;
}

- (unint64_t)rxucastDecryptError
{
  return self->_rxucastDecryptError;
}

- (void)setRxucastDecryptError:(unint64_t)a3
{
  self->_rxucastDecryptError = a3;
}

- (unint64_t)rxmcastReplayError
{
  return self->_rxmcastReplayError;
}

- (void)setRxmcastReplayError:(unint64_t)a3
{
  self->_rxmcastReplayError = a3;
}

- (unint64_t)rxmcastDecryptError
{
  return self->_rxmcastDecryptError;
}

- (void)setRxmcastDecryptError:(unint64_t)a3
{
  self->_rxmcastDecryptError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
