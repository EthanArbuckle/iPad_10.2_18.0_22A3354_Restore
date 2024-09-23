@implementation _NSAttributedStringAsyncReadReply

+ (id)readReplyWithConnection:(id)a3 reply:(id)a4
{
  _QWORD *v6;

  v6 = objc_alloc_init((Class)a1);
  if (v6)
  {
    v6[2] = a3;
    v6[3] = objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringAsyncReadReply;
  -[_NSAttributedStringAsyncReadReply dealloc](&v3, sel_dealloc);
}

- (void)cancelWithError:(id)a3
{
  -[_NSAttributedStringAsyncReadReply deliverAttributedString:documentAttributes:error:](self, "deliverAttributedString:documentAttributes:error:", 0, 0, a3);
}

- (void)deliverAttributedString:(id)a3 documentAttributes:(id)a4 error:(id)a5
{
  void (**v9)(id, id, id, id);

  if (!self->_delivered)
  {
    v9 = -[_NSAttributedStringAsyncReadReply reply](self, "reply");
    v9[2](v9, a3, a4, a5);
    -[NSXPCConnection invalidate](-[_NSAttributedStringAsyncReadReply connection](self, "connection"), "invalidate");
    self->_delivered = 1;
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (id)reply
{
  return self->_reply;
}

- (BOOL)delivered
{
  return self->_delivered;
}

@end
