@implementation GTLoopbackReplyStream

- (GTLoopbackReplyStream)initWithCallback:(id)a3
{
  id v4;
  GTLoopbackReplyStream *v5;
  id v6;
  id callback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTLoopbackReplyStream;
  v5 = -[GTLoopbackReplyStream init](&v9, "init");
  if (v5)
  {
    v6 = objc_retainBlock(v4);
    callback = v5->_callback;
    v5->_callback = v6;

  }
  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6;
  id nsdictionary_any;
  xpc_object_t reply;
  void *v9;
  xpc_object_t xdict;

  xdict = a3;
  v6 = a4;
  nsdictionary_any = xpc_dictionary_get_nsdictionary_any(xdict, "data");
  (*((void (**)(void))self->_callback + 2))();
  if (MessageHasReply(xdict))
  {
    reply = gt_xpc_dictionary_create_reply(xdict);
    v9 = (void *)objc_claimAutoreleasedReturnValue(reply);
    objc_msgSend(v6, "sendMessage:", v9);

  }
  if (xpc_dictionary_get_BOOL(xdict, "_endOfStream"))
    objc_msgSend(v6, "deregisterDispatcher:", self->dispatcherId);

}

- (unint64_t)dispatcherId
{
  return self->dispatcherId;
}

- (void)setDispatcherId:(unint64_t)a3
{
  self->dispatcherId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
}

@end
