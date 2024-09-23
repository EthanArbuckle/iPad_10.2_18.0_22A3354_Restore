@implementation PKUsageNotificationClient

- (PKUsageNotificationClient)init
{
  PKUsageNotificationClient *v2;
  PKXPCService *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PKXPCService *connection;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKUsageNotificationClient;
  v2 = -[PKUsageNotificationClient init](&v9, sel_init);
  if (v2)
  {
    v3 = [PKXPCService alloc];
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2338A8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKUsageNotificationClientInterface();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:options:](v3, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:options:", CFSTR("com.apple.passd.usage"), v4, v5, v2, CFSTR("com.apple.passd.listener.resumed"), 1);
    connection = v2->_connection;
    v2->_connection = (PKXPCService *)v6;

  }
  return v2;
}

- (void)setPassUsageHandler:(id)a3
{
  void *v4;
  id handler;

  v4 = (void *)objc_msgSend(a3, "copy");
  handler = self->_handler;
  self->_handler = v4;

}

- (void)setPaymentUsageHandler:(id)a3
{
  void *v4;
  id paymentHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  paymentHandler = self->_paymentHandler;
  self->_paymentHandler = v4;

}

- (void)setPaymentPassUsageHandler:(id)a3
{
  void *v4;
  id paymentPassUsageHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  paymentPassUsageHandler = self->_paymentPassUsageHandler;
  self->_paymentPassUsageHandler = v4;

}

- (void)usedPassFromSource:(int64_t)a3 withTypeIdentifier:(id)a4 info:(id)a5
{
  void (**handler)(id, id, int64_t, id);

  handler = (void (**)(id, id, int64_t, id))self->_handler;
  if (handler)
    handler[2](handler, a4, a3, a5);
}

- (void)usedPaymentPassWithUniqueIdentifier:(id)a3 transactionIdentifier:(id)a4 info:(id)a5
{
  void (**paymentHandler)(id, id, id, id);

  paymentHandler = (void (**)(id, id, id, id))self->_paymentHandler;
  if (paymentHandler)
    paymentHandler[2](paymentHandler, a3, a4, a5);
}

- (void)usedPaymentPassWithTransactionIdentifier:(id)a3 info:(id)a4
{
  void (**paymentPassUsageHandler)(id, id, id);

  paymentPassUsageHandler = (void (**)(id, id, id))self->_paymentPassUsageHandler;
  if (paymentPassUsageHandler)
    paymentPassUsageHandler[2](paymentPassUsageHandler, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_paymentPassUsageHandler, 0);
  objc_storeStrong(&self->_paymentHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
