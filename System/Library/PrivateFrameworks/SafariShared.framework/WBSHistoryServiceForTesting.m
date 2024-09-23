@implementation WBSHistoryServiceForTesting

- (WBSHistoryServiceForTesting)init
{
  WBSHistoryServiceForTesting *v2;
  uint64_t v3;
  NSXPCListener *listener;
  WBSHistoryServiceForTesting *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSHistoryServiceForTesting;
  v2 = -[WBSHistoryService init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v3 = objc_claimAutoreleasedReturnValue();
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)_createListener
{
  return self->_listener;
}

- (id)connectWithClass:(Class)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = [a3 alloc];
  -[NSXPCListener endpoint](self->_listener, "endpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithListenerEndpoint:", v5);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
