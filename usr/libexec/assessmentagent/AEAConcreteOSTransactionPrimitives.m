@implementation AEAConcreteOSTransactionPrimitives

- (id)acquireAssessmentModeTransaction
{
  void *v2;
  id *v3;

  v2 = (void *)os_transaction_create("com.apple.assessmentagent.assessment-mode-active", a2);
  v3 = sub_100004410((id *)[AEAConcreteOSTransactionToken alloc], v2);

  return v3;
}

@end
