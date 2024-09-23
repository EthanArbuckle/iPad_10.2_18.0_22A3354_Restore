@implementation REHTTPRequest

- (REHTTPRequest)initWithConnect:(id)a3 request:(_CFHTTPServerRequest *)a4
{
  id v7;
  REHTTPRequest *v8;
  REHTTPRequest *v9;
  uint64_t v10;
  NSURL *url;
  uint64_t v12;
  NSString *method;
  void *v14;
  uint64_t v15;
  NSDictionary *headerFields;
  uint64_t v17;
  NSInputStream *stream;
  uint64_t v19;
  NSMutableData *bodyData;
  objc_super v22;

  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)REHTTPRequest;
  v8 = -[REHTTPRequest init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_request = (_CFHTTPServerRequest *)CFRetain(a4);
    _CFHTTPServerRequestCopyProperty();
    v10 = objc_claimAutoreleasedReturnValue();
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    _CFHTTPServerRequestCopyProperty();
    v12 = objc_claimAutoreleasedReturnValue();
    method = v9->_method;
    v9->_method = (NSString *)v12;

    v14 = (void *)_CFHTTPServerRequestCopyProperty();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDB75E8]);
      v15 = objc_claimAutoreleasedReturnValue();
      headerFields = v9->_headerFields;
      v9->_headerFields = (NSDictionary *)v15;
    }
    else
    {
      headerFields = v9->_headerFields;
      v9->_headerFields = (NSDictionary *)MEMORY[0x24BDBD1B8];
    }

    _CFHTTPServerRequestCopyBodyStream();
    v17 = objc_claimAutoreleasedReturnValue();
    stream = v9->_stream;
    v9->_stream = (NSInputStream *)v17;

    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v19 = objc_claimAutoreleasedReturnValue();
    bodyData = v9->_bodyData;
    v9->_bodyData = (NSMutableData *)v19;

  }
  return v9;
}

- (void)dealloc
{
  _CFHTTPServerRequest *request;
  objc_super v4;

  request = self->_request;
  if (request)
  {
    CFRelease(request);
    self->_request = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)REHTTPRequest;
  -[REHTTPRequest dealloc](&v4, sel_dealloc);
}

- (id)responseWithStatusCode:(int64_t)a3
{
  return -[REHTTPResponse initWithRequest:statusCode:]([REHTTPResponse alloc], "initWithRequest:statusCode:", self, a3);
}

- (NSData)bodyData
{
  return (NSData *)(id)-[NSMutableData copy](self->_bodyData, "copy");
}

- (void)appendData:(id)a3
{
  -[NSMutableData appendData:](self->_bodyData, "appendData:", a3);
}

- (NSInputStream)stream
{
  return self->_stream;
}

- (REHTTPConnection)connection
{
  return self->_connection;
}

- (NSString)method
{
  return self->_method;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (_CFHTTPServerRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
