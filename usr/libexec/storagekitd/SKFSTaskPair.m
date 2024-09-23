@implementation SKFSTaskPair

- (SKFSTaskPair)initWithMessageHandler:(id)a3
{
  id v5;
  SKFSTaskPair *v6;
  SKFSTaskPair *v7;
  uint64_t v8;
  FSMessageReceiver *receiver;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKFSTaskPair;
  v6 = -[SKFSTaskPair init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_msgHandler, a3);
    v8 = objc_claimAutoreleasedReturnValue(+[FSMessageReceiver receiverWithDelegate:](FSMessageReceiver, "receiverWithDelegate:", v5));
    receiver = v7->_receiver;
    v7->_receiver = (FSMessageReceiver *)v8;

  }
  return v7;
}

- (SKFSTaskMessageHandler)msgHandler
{
  return (SKFSTaskMessageHandler *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMsgHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (FSMessageReceiver)receiver
{
  return (FSMessageReceiver *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReceiver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_msgHandler, 0);
}

@end
