@implementation NFSecureTransactionServicesHandoverSessionCallbacksInterface

+ (id)interface
{
  if (qword_10032A938 != -1)
    dispatch_once(&qword_10032A938, &stru_1002E6F58);
  return (id)qword_10032A930;
}

- (NFSecureTransactionServicesHandoverSessionCallbacksInterface)initWithProtocol:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  return -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface initWithProtocol:](&v4, "initWithProtocol:", a3);
}

- (void)setupInterface
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface setupInterface](&v4, "setupInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface protocolInterface](self, "protocolInterface"));
  sub_1002378F8(v3);

}

@end
