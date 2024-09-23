@implementation GTServiceProviderReplyStream

- (GTServiceProviderReplyStream)initWithObserver:(id)a3
{
  id v5;
  void *v6;
  GTServiceProviderReplyStream *v7;
  objc_super v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &OBJC_PROTOCOL___GTServiceProviderObserver));
  v9.receiver = self;
  v9.super_class = (Class)GTServiceProviderReplyStream;
  v7 = -[GTXPCDispatcher initWithProtocolMethods:](&v9, "initWithProtocolMethods:", v6);

  if (v7)
    objc_storeStrong((id *)&v7->_observer, a3);

  return v7;
}

- (void)notifyServiceListChanged_:(id)a3 replyConnection:(id)a4
{
  id v5;
  uint64_t v6;
  id nsarray;

  v5 = a3;
  v6 = objc_opt_class(GTProcessService);
  nsarray = (id)xpc_dictionary_get_nsarray(v5, "serviceList", v6);

  -[GTServiceProviderObserver notifyServiceListChanged:](self->_observer, "notifyServiceListChanged:", nsarray);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
