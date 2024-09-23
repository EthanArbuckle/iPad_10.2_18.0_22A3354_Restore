@implementation RBSXPCMessageReply

- (RBSXPCEncoding)payload
{
  return (RBSXPCEncoding *)self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)prepareForHandoff
{
  if (!self->_sent)
    -[RBSXPCMessageContext _set]((uint64_t)self->_context);
}

- (void)send
{
  _xpc_connection_s *v3;
  void *v4;
  RBSXPCMessageContext *context;
  RBSXPCCoder *payload;

  if (!self->_sent)
  {
    self->_sent = 1;
    -[RBSXPCMessageContext connection](self->_context, "connection");
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    -[RBSXPCCoder createMessage](self->_payload, "createMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_send_message(v3, v4);

    -[RBSXPCMessageContext _unset](self->_context);
    context = self->_context;
    self->_context = 0;

    payload = self->_payload;
    self->_payload = 0;

  }
}

- (_QWORD)_initWithMessage:(_QWORD *)a1
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3 || MEMORY[0x194019424](v3) != MEMORY[0x1E0C812F8])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithMessage_, a1, CFSTR("RBSXPCUtilities.m"), 110, CFSTR("reply is not a dictionary"));

    }
    a1 = (_QWORD *)objc_msgSend(a1, "init");
    if (a1)
    {
      v5 = -[RBSXPCMessageContext _initWithHandoffToken:]([RBSXPCMessageContext alloc], v4);
      v6 = (void *)a1[2];
      a1[2] = v5;

      +[RBSXPCCoder coderWithMessage:](RBSXPCCoder, "coderWithMessage:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)a1[1];
      a1[1] = v7;

    }
  }

  return a1;
}

@end
