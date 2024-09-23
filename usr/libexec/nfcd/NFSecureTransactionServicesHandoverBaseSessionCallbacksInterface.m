@implementation NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface

+ (id)interface
{
  if (qword_10032AA90 != -1)
    dispatch_once(&qword_10032AA90, &stru_1002EA058);
  return (id)qword_10032AA88;
}

- (NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface)initWithProtocol:(id)a3
{
  id v4;
  NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *v5;
  uint64_t v6;
  NSXPCInterface *protocolInterface;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface;
  v5 = -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", v4));
    protocolInterface = v5->_protocolInterface;
    v5->_protocolInterface = (NSXPCInterface *)v6;

    -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface setupInterface](v5, "setupInterface");
  }

  return v5;
}

- (NSXPCInterface)protocolInterface
{
  return self->_protocolInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolInterface, 0);
}

@end
