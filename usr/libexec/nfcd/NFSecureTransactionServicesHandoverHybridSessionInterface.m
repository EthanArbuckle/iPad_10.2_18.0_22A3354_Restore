@implementation NFSecureTransactionServicesHandoverHybridSessionInterface

+ (id)interface
{
  if (qword_10032A908 != -1)
    dispatch_once(&qword_10032A908, &stru_1002E6B78);
  return (id)qword_10032A900;
}

- (NFSecureTransactionServicesHandoverHybridSessionInterface)initWithProtocol:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  return -[NFSecureTransactionServicesHandoverBaseSessionInterface initWithProtocol:](&v4, "initWithProtocol:", a3);
}

- (void)setupInterface
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionInterface setupInterface](&v4, "setupInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureTransactionServicesHandoverBaseSessionInterface protocolInterface](self, "protocolInterface"));
  sub_100237718(v3);

}

@end
