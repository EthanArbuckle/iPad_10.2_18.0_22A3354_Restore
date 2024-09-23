@implementation GTServiceObserver

- (GTServiceObserver)initWithMessage:(id)a3 notifyConnection:(id)a4
{
  id v6;
  id v7;
  GTServiceObserver *v8;
  xpc_object_t array;
  uint64_t v10;
  OS_xpc_object *replyPath;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GTServiceObserver;
  v8 = -[GTServiceObserver init](&v13, "init");
  if (v8)
  {
    v8->_replyStream = xpc_dictionary_get_uint64(v6, "_replyStreamId");
    array = xpc_dictionary_get_array(v6, "_pathHistory");
    v10 = objc_claimAutoreleasedReturnValue(array);
    replyPath = v8->_replyPath;
    v8->_replyPath = (OS_xpc_object *)v10;

    objc_storeStrong((id *)&v8->_connection, a4);
  }

  return v8;
}

- (unint64_t)replyStream
{
  return self->_replyStream;
}

- (OS_xpc_object)replyPath
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (GTXPCConnection)connection
{
  return (GTXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_replyPath, 0);
}

@end
