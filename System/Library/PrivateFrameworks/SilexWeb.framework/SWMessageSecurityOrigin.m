@implementation SWMessageSecurityOrigin

- (SWMessageSecurityOrigin)initWithProtocol:(id)a3 host:(id)a4 request:(id)a5
{
  id v8;
  id v9;
  id v10;
  SWMessageSecurityOrigin *v11;
  uint64_t v12;
  NSString *protocol;
  uint64_t v14;
  NSString *host;
  uint64_t v16;
  NSURLRequest *request;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SWMessageSecurityOrigin;
  v11 = -[SWMessageSecurityOrigin init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    protocol = v11->_protocol;
    v11->_protocol = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    host = v11->_host;
    v11->_host = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    request = v11->_request;
    v11->_request = (NSURLRequest *)v16;

  }
  return v11;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)host
{
  return self->_host;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

@end
