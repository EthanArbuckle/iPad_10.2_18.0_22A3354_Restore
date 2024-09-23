@implementation WBSHistoryConnectionProxyForTesting

- (WBSHistoryConnectionProxyForTesting)initWithListenerEndpoint:(id)a3
{
  id v5;
  WBSHistoryConnectionProxyForTesting *v6;
  objc_super v8;

  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WBSHistoryConnectionProxyForTesting;
  v6 = -[WBSHistoryConnectionProxy init](&v8, sel_init);

  return v6;
}

- (id)_createConnection
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_listenerEndpoint);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
}

@end
