@implementation WBSAsynchronousRequestHelper

- (WBSAsynchronousRequestHelper)initWithRequest:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSAsynchronousRequestHelper *v11;
  WBSAsynchronousRequestHelper *v12;
  uint64_t v13;
  id handler;
  uint64_t v15;
  NSURLConnection *connection;
  WBSAsynchronousRequestHelper *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WBSAsynchronousRequestHelper;
  v11 = -[WBSAsynchronousRequestHelper init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a4);
    v13 = objc_msgSend(v10, "copy");
    handler = v12->_handler;
    v12->_handler = (id)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C92C58]), "initWithRequest:delegate:startImmediately:", v8, v12, 0);
    connection = v12->_connection;
    v12->_connection = (NSURLConnection *)v15;

    v17 = v12;
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLConnection cancel](self->_connection, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)WBSAsynchronousRequestHelper;
  -[WBSAsynchronousRequestHelper dealloc](&v3, sel_dealloc);
}

- (void)sendRequest
{
  NSURLConnection *connection;
  void *v4;

  connection = self->_connection;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURLConnection scheduleInRunLoop:forMode:](connection, "scheduleInRunLoop:forMode:", v4, *MEMORY[0x1E0C99860]);

  -[NSURLConnection start](self->_connection, "start");
  objc_storeStrong(&self->_lifetimeExtender, self);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  NSURLResponse *v7;
  NSOperationQueue *queue;
  id v9;
  NSURLResponse *v10;
  id v11;
  id lifetimeExtender;
  _QWORD v13[4];
  NSURLResponse *v14;
  id v15;
  id v16;

  v5 = a4;
  -[NSURLConnection cancel](self->_connection, "cancel");
  v6 = _Block_copy(self->_handler);
  v7 = self->_response;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__WBSAsynchronousRequestHelper_connection_didFailWithError___block_invoke;
  v13[3] = &unk_1E649D228;
  v15 = v5;
  v16 = v6;
  v14 = v7;
  v9 = v5;
  v10 = v7;
  v11 = v6;
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v13);
  lifetimeExtender = self->_lifetimeExtender;
  self->_lifetimeExtender = 0;

}

uint64_t __60__WBSAsynchronousRequestHelper_connection_didFailWithError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  NSURLResponse **p_response;
  NSURLResponse *response;
  id v9;

  v6 = a4;
  response = self->_response;
  p_response = &self->_response;
  if (!response)
  {
    v9 = v6;
    objc_storeStrong((id *)p_response, a4);
    v6 = v9;
  }

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  NSMutableData *data;
  NSMutableData *v6;
  NSMutableData *v7;

  data = self->_data;
  if (data)
  {
    -[NSMutableData appendData:](data, "appendData:", a4);
  }
  else
  {
    v6 = (NSMutableData *)objc_msgSend(a4, "mutableCopy", a3);
    v7 = self->_data;
    self->_data = v6;

  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  void *v4;
  NSURLResponse *v5;
  NSMutableData *v6;
  NSOperationQueue *queue;
  NSMutableData *v8;
  NSURLResponse *v9;
  id v10;
  id lifetimeExtender;
  _QWORD v12[4];
  NSURLResponse *v13;
  NSMutableData *v14;
  id v15;

  -[NSURLConnection cancel](self->_connection, "cancel", a3);
  v4 = _Block_copy(self->_handler);
  v5 = self->_response;
  v6 = self->_data;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__WBSAsynchronousRequestHelper_connectionDidFinishLoading___block_invoke;
  v12[3] = &unk_1E649D228;
  v14 = v6;
  v15 = v4;
  v13 = v5;
  v8 = v6;
  v9 = v5;
  v10 = v4;
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v12);
  lifetimeExtender = self->_lifetimeExtender;
  self->_lifetimeExtender = 0;

}

uint64_t __59__WBSAsynchronousRequestHelper_connectionDidFinishLoading___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

- (void)cancel
{
  id handler;
  void *v4;
  id lifetimeExtender;

  -[NSURLConnection cancel](self->_connection, "cancel");
  handler = self->_handler;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 89, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))handler + 2))(handler, 0, 0, v4);

  lifetimeExtender = self->_lifetimeExtender;
  self->_lifetimeExtender = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lifetimeExtender, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
