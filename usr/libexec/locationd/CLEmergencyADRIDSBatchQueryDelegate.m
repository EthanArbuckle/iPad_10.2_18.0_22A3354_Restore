@implementation CLEmergencyADRIDSBatchQueryDelegate

- (CLEmergencyADRIDSBatchQueryDelegate)initWithADRPointer:(void *)a3
{
  CLEmergencyADRIDSBatchQueryDelegate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLEmergencyADRIDSBatchQueryDelegate;
  v4 = -[CLEmergencyADRIDSBatchQueryDelegate init](&v6, "init");
  -[CLEmergencyADRIDSBatchQueryDelegate setFADR:](v4, "setFADR:", a3);
  return v4;
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  sub_1012BD558((uint64_t)-[CLEmergencyADRIDSBatchQueryDelegate fADR](self, "fADR", a3), a4, a5, (uint64_t)a6);
}

- (void)fADR
{
  return self->_fADR;
}

- (void)setFADR:(void *)a3
{
  self->_fADR = a3;
}

@end
