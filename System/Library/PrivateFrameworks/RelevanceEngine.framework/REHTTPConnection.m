@implementation REHTTPConnection

- (REHTTPConnection)initWithConnection:(_CFHTTPServerConnection *)a3
{
  REHTTPConnection *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMapTable *pendingRequests;
  uint64_t v9;
  NSMutableArray *pendingResponse;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REHTTPConnection;
  v4 = -[REHTTPConnection init](&v12, sel_init);
  if (v4)
  {
    v4->_connection = (_CFHTTPServerConnection *)CFRetain(a3);
    v5 = dispatch_queue_create("com.apple.HTTPConnection", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    pendingRequests = v4->_pendingRequests;
    v4->_pendingRequests = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    pendingResponse = v4->_pendingResponse;
    v4->_pendingResponse = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithWeakObject:", v4);
    _CFHTTPServerConnectionSetClient();
  }
  return v4;
}

- (void)dealloc
{
  _CFHTTPServerConnection *connection;
  objc_super v4;

  -[REHTTPConnection invalidate](self, "invalidate");
  connection = self->_connection;
  if (connection)
    CFRelease(connection);
  v4.receiver = self;
  v4.super_class = (Class)REHTTPConnection;
  -[REHTTPConnection dealloc](&v4, sel_dealloc);
}

- (BOOL)isValid
{
  _CFHTTPServerConnection *connection;

  connection = self->_connection;
  if (connection)
    LOBYTE(connection) = _CFHTTPServerConnectionIsValid() != 0;
  return (char)connection;
}

- (void)invalidate
{
  if (-[REHTTPConnection isValid](self, "isValid"))
    _CFHTTPServerConnectionInvalidate();
}

- (BOOL)open
{
  _BOOL4 v2;

  v2 = -[REHTTPConnection isValid](self, "isValid");
  if (v2)
    _CFHTTPServerConnectionSetDispatchQueue();
  return v2;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__REHTTPConnection_stream_handleEvent___block_invoke;
  block[3] = &unk_24CF8F720;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __39__REHTTPConnection_stream_handleEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BYTE v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 == 2 || v3 == 16)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "read:maxLength:", v10, 1024);
    if (v5 < 1)
    {
      v8 = *(void **)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      if (!v5)
      {
        objc_msgSend(v8, "_handleCompleteRequest:stream:error:", v2, v7, 0);
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v10, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendData:", v6);

  }
  else if (v3 == 8)
  {
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDBCA98], 500, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_handleCompleteRequest:stream:error:", v2, v7, v9);

  }
LABEL_12:

}

- (void)_handleCompleteRequest:(id)a3 stream:(id)a4 error:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDBCF18];
  v10 = a4;
  objc_msgSend(v9, "mainRunLoop");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromRunLoop:forMode:", v11, *MEMORY[0x24BDBCA90]);

  objc_msgSend(v10, "close");
  -[NSMapTable removeObjectForKey:](self->_pendingRequests, "removeObjectForKey:", v10);

  if (a5)
  {
    objc_msgSend(v8, "responseWithStatusCode:", 500);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[REHTTPConnection _sendResponse:](self, "_sendResponse:", v12);
  }
  else
  {
    -[REHTTPConnection delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke;
    v13[3] = &unk_24CF8F748;
    v13[4] = self;
    objc_msgSend(v12, "connection:didReceiveRequest:completion:", self, v8, v13);
  }

}

void __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke_2;
  v7[3] = &unk_24CF8AB18;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __56__REHTTPConnection__handleCompleteRequest_stream_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendResponse:", *(_QWORD *)(a1 + 40));
}

- (void)_sendResponse:(id)a3
{
  NSMutableArray *pendingResponse;
  id v4;

  pendingResponse = self->_pendingResponse;
  v4 = a3;
  -[NSMutableArray addObject:](pendingResponse, "addObject:", v4);
  objc_msgSend(v4, "response");

  _CFHTTPServerResponseEnqueue();
}

- (void)didRecieveRequest:(_CFHTTPServerRequest *)a3
{
  void *v4;
  void *v5;
  REHTTPRequest *v6;

  v6 = -[REHTTPRequest initWithConnect:request:]([REHTTPRequest alloc], "initWithConnect:request:", self, a3);
  -[REHTTPRequest stream](v6, "stream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v6, v4);
  if (objc_msgSend(v4, "streamStatus") == 7)
  {
    -[REHTTPConnection stream:handleEvent:](self, "stream:handleEvent:", v4, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduleInRunLoop:forMode:", v5, *MEMORY[0x24BDBCA90]);

    objc_msgSend(v4, "open");
  }

}

- (void)didCompleteResponse:(_CFHTTPServerResponse *)a3 error:(id)a4
{
  id v6;
  NSMutableArray *pendingResponse;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  pendingResponse = self->_pendingResponse;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__REHTTPConnection_didCompleteResponse_error___block_invoke;
  v8[3] = &unk_24CF8F770;
  v8[4] = &v9;
  v8[5] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](pendingResponse, "enumerateObjectsUsingBlock:", v8);
  if (v10[3] != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_pendingResponse, "removeObjectAtIndex:");
  _Block_object_dispose(&v9, 8);

}

uint64_t __46__REHTTPConnection_didCompleteResponse_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "response");
  if (result == *(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (REHTTPConnectionDelegate)delegate
{
  return (REHTTPConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_CFHTTPServerConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_pendingResponse, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
