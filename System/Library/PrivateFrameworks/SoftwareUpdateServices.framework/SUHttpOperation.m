@implementation SUHttpOperation

- (SUHttpOperation)initWithRequest:(id)a3
{
  id v4;
  SUHttpOperation *v5;
  SUHttpOperation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUHttpOperation;
  v5 = -[SUHttpOperation init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SUHttpOperation setRequest:](v5, "setRequest:", v4);
    v6->_allowRedirects = 1;
    v6->_done = 0;
  }

  return v6;
}

- (void)main
{
  NSURLConnection *v3;
  NSURLConnection *connection;
  const __CFString *v5;

  v3 = (NSURLConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7478]), "initWithRequest:delegate:startImmediately:", self->_request, self, 1);
  connection = self->_connection;
  self->_connection = v3;

  if (!self->_done)
  {
    v5 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    while ((CFRunLoopRunInMode(v5, 5.0, 1u) - 1) > 1)
    {
      if (self->_done)
        return;
    }
    self->_done = 1;
  }
}

- (void)_finished
{
  self->_done = 1;
}

- (void)connectionDidFinishLoading:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  SULogDebug(CFSTR("Connection completed successfully."), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v9);
  -[SUHttpOperation _finished](self, "_finished");
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  SULogDebug(CFSTR("Connection failed with error: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  -[SUHttpOperation setData:](self, "setData:", 0);
  -[SUHttpOperation setResponse:](self, "setResponse:", 0);
  -[SUHttpOperation setError:](self, "setError:", v5);

  -[SUHttpOperation _finished](self, "_finished");
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("Connection received redirect request to: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);

  if (self->_allowRedirects)
  {
    v17 = (void *)objc_msgSend(v8, "mutableCopy");
    -[NSURLRequest HTTPBody](self->_request, "HTTPBody");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHTTPBody:", v18);

    -[NSURLRequest HTTPMethod](self->_request, "HTTPMethod");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHTTPMethod:", v19);

    objc_msgSend(v17, "setCachePolicy:", -[NSURLRequest cachePolicy](self->_request, "cachePolicy"));
    objc_msgSend(v17, "setHTTPShouldHandleCookies:", -[NSURLRequest HTTPShouldHandleCookies](self->_request, "HTTPShouldHandleCookies"));
    objc_msgSend(v17, "setHTTPShouldUsePipelining:", -[NSURLRequest HTTPShouldUsePipelining](self->_request, "HTTPShouldUsePipelining"));
    -[NSURLRequest timeoutInterval](self->_request, "timeoutInterval");
    objc_msgSend(v17, "setTimeoutInterval:");
    -[NSURLRequest allHTTPHeaderFields](self->_request, "allHTTPHeaderFields");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllHTTPHeaderFields:", v20);

    objc_msgSend(v8, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setURL:", v21);

    -[SUHttpOperation setRequest:](self, "setRequest:", v17);
  }
  else
  {
    objc_msgSend(v7, "cancel");
    v17 = 0;
  }

  return v17;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "statusCode");
  self->_statusCode = v7;
  SULogDebug(CFSTR("Connection received response: %d"), v8, v9, v10, v11, v12, v13, v14, v7);
  -[SUHttpOperation setResponse:](self, "setResponse:", v6);

  -[SUHttpOperation setData:](self, "setData:", 0);
  if ((unint64_t)(self->_statusCode - 200) > 0x63)
  {
    self->_saveData = 0;
    objc_msgSend(v16, "cancel");
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUHttpOperation setError:](self, "setError:", v15);

  }
  else
  {
    self->_saveData = 1;
  }

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableData *data;
  NSMutableData *v14;
  NSMutableData *v15;
  id v16;

  v16 = a4;
  v5 = objc_msgSend(v16, "length");
  SULogDebug(CFSTR("Connection received %d bytes of data."), v6, v7, v8, v9, v10, v11, v12, v5);
  if (self->_saveData)
  {
    data = self->_data;
    if (data)
    {
      -[NSMutableData appendData:](data, "appendData:", v16);
    }
    else
    {
      v14 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v16);
      v15 = self->_data;
      self->_data = v14;

    }
  }

}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (BOOL)allowRedirects
{
  return self->_allowRedirects;
}

- (void)setAllowRedirects:(BOOL)a3
{
  self->_allowRedirects = a3;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
