@implementation NFSecureTransactionServicesHandoverBaseSessionInterface

+ (id)interface
{
  if (qword_10032AA80 != -1)
    dispatch_once(&qword_10032AA80, &stru_1002EA038);
  return (id)qword_10032AA78;
}

- (NFSecureTransactionServicesHandoverBaseSessionInterface)initWithProtocol:(id)a3
{
  id v4;
  NFSecureTransactionServicesHandoverBaseSessionInterface *v5;
  uint64_t v6;
  NSXPCInterface *protocolInterface;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionInterface;
  v5 = -[NFSecureTransactionServicesHandoverBaseSessionInterface init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", v4));
    protocolInterface = v5->_protocolInterface;
    v5->_protocolInterface = (NSXPCInterface *)v6;

    -[NFSecureTransactionServicesHandoverBaseSessionInterface setupInterface](v5, "setupInterface");
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
