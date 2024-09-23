@implementation SSHTTPServerRequestHandler

- (SSHTTPServerRequestHandler)initWithReadStream:(id)a3 writeStream:(id)a4 runLoop:(id)a5
{
  id v9;
  id v10;
  id v11;
  SSHTTPServerRequestHandler *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *requestQueue;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SSHTTPServerRequestHandler;
  v12 = -[SSHTTPServerRequestHandler init](&v16, sel_init);
  if (v12)
  {
    v13 = dispatch_queue_create("com.apple.StoreServices.HTTPServerResponse", 0);
    requestQueue = v12->_requestQueue;
    v12->_requestQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_output, a4);
    -[NSOutputStream open](v12->_output, "open");
    objc_storeStrong((id *)&v12->_input, a3);
    -[NSInputStream scheduleInRunLoop:forMode:](v12->_input, "scheduleInRunLoop:forMode:", v11, *MEMORY[0x1E0C99748]);
    -[NSInputStream setDelegate:](v12->_input, "setDelegate:", v12);
    -[NSInputStream open](v12->_input, "open");
  }

  return v12;
}

- (void)dealloc
{
  __CFHTTPMessage *incommingMessage;
  objc_super v4;

  -[SSHTTPServerRequestHandler _close](self, "_close");
  incommingMessage = self->_incommingMessage;
  if (incommingMessage)
  {
    CFRelease(incommingMessage);
    self->_incommingMessage = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SSHTTPServerRequestHandler;
  -[SSHTTPServerRequestHandler dealloc](&v4, sel_dealloc);
}

- (void)close
{
  NSObject *requestQueue;
  _QWORD block[5];

  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SSHTTPServerRequestHandler_close__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_sync(requestQueue, block);
}

uint64_t __35__SSHTTPServerRequestHandler_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_close");
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  NSObject *requestQueue;
  _QWORD v5[6];

  requestQueue = self->_requestQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SSHTTPServerRequestHandler_stream_handleEvent___block_invoke;
  v5[3] = &unk_1E47BA600;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(requestQueue, v5);
}

void __49__SSHTTPServerRequestHandler_stream_handleEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 40);
  switch(v2)
  {
    case 16:
      v5 = 0;
      v4 = 1;
      break;
    case 8:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "streamError");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v4 = 0;
      break;
    case 2:
      v3 = *(void **)(a1 + 32);
      v11 = 0;
      v4 = objc_msgSend(v3, "_handleReceivedDataWithError:", &v11);
      v5 = v11;
      break;
    default:
      v4 = 0;
      v5 = 0;
      break;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
    v7 = 1;
  else
    v7 = v4;
  if (*(_QWORD *)(v6 + 40))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(*(id *)(v6 + 32), "setDelegate:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "close");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(_QWORD *)(v9 + 32) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_respondWithRequest:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), v5);
  }

}

- (BOOL)_handleReceivedDataWithError:(id *)a3
{
  const __CFAllocator *v5;
  NSInteger v6;
  CFIndex v7;
  NSMutableData *incommingMessageBody;
  NSMutableData *v9;
  NSMutableData *v10;
  __CFHTTPMessage *incommingMessage;
  NSMutableURLRequest *v12;
  NSMutableURLRequest *request;
  CFURLRef v14;
  __CFString *v15;
  CFDictionaryRef v16;
  CFDataRef v17;
  CFDataRef v18;
  NSMutableData *v19;
  NSMutableData *v20;
  NSMutableData *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  UInt8 v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if (-[NSInputStream hasBytesAvailable](self->_input, "hasBytesAvailable"))
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      v6 = -[NSInputStream read:maxLength:](self->_input, "read:maxLength:", v26, 1024);
      if (v6 < 0)
        break;
      v7 = v6;
      if (!v6)
        return 1;
      if (self->_incommingHeadersComplete)
      {
        incommingMessageBody = self->_incommingMessageBody;
        if (!incommingMessageBody)
        {
          v9 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
          v10 = self->_incommingMessageBody;
          self->_incommingMessageBody = v9;

          incommingMessageBody = self->_incommingMessageBody;
        }
        -[NSMutableData appendBytes:length:](incommingMessageBody, "appendBytes:length:", v26, v7);
      }
      else
      {
        incommingMessage = self->_incommingMessage;
        if (!incommingMessage)
        {
          incommingMessage = CFHTTPMessageCreateEmpty(v5, 1u);
          self->_incommingMessage = incommingMessage;
        }
        CFHTTPMessageAppendBytes(incommingMessage, v26, v7);
        if (CFHTTPMessageIsHeaderComplete(self->_incommingMessage))
        {
          self->_incommingHeadersComplete = 1;
          v12 = (NSMutableURLRequest *)objc_alloc_init(MEMORY[0x1E0CB37A8]);
          request = self->_request;
          self->_request = v12;

          v14 = CFHTTPMessageCopyRequestURL(self->_incommingMessage);
          v15 = (__CFString *)CFHTTPMessageCopyRequestMethod(self->_incommingMessage);
          v16 = CFHTTPMessageCopyAllHeaderFields(self->_incommingMessage);
          -[NSMutableURLRequest setURL:](self->_request, "setURL:", v14);
          -[NSMutableURLRequest setHTTPMethod:](self->_request, "setHTTPMethod:", v15);
          -[NSMutableURLRequest setAllHTTPHeaderFields:](self->_request, "setAllHTTPHeaderFields:", v16);
          v17 = CFHTTPMessageCopyBody(self->_incommingMessage);
          v18 = v17;
          if (v17 && -[__CFData length](v17, "length"))
          {
            v19 = self->_incommingMessageBody;
            if (!v19)
            {
              v20 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
              v21 = self->_incommingMessageBody;
              self->_incommingMessageBody = v20;

              v19 = self->_incommingMessageBody;
            }
            -[NSMutableData appendData:](v19, "appendData:", v18);
          }

        }
      }
      if (!-[NSInputStream hasBytesAvailable](self->_input, "hasBytesAvailable"))
        goto LABEL_19;
    }
    if (a3)
    {
      SSError((uint64_t)CFSTR("SSHTTPServerResponseErrorDomain"), 500, (uint64_t)CFSTR("Socket Read Error"), (uint64_t)CFSTR("Length < 0"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
LABEL_19:
    if (!self->_incommingHeadersComplete)
      return 0;
    -[NSMutableURLRequest allHTTPHeaderFields](self->_request, "allHTTPHeaderFields");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Content-Length"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    if (-[NSMutableData length](self->_incommingMessageBody, "length") < v24)
      return 0;
    -[NSMutableURLRequest setHTTPBody:](self->_request, "setHTTPBody:", self->_incommingMessageBody);
  }
  return 1;
}

- (void)_respondWithRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SSHTTPServerResponse *v12;
  __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  __CFHTTPMessage *v17;
  CFDataRef v18;
  int64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  __int16 v41;
  SSHTTPServerRequestHandler *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[SSHTTPServerRequestHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responseBlockForPath:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v11;
  if (v7)
  {
    v12 = -[SSHTTPServerResponse initWithStatusCode:]([SSHTTPServerResponse alloc], "initWithStatusCode:", (__int16)objc_msgSend(v7, "code"));
    v13 = objc_msgSend(v7, "code");
    objc_msgSend(v7, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSHTTPServerRequestHandler _errorResponseDataWithStatus:message:](self, "_errorResponseDataWithStatus:message:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSHTTPServerResponse setBody:](v12, "setBody:", v15);

  }
  else if (v11)
  {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
    v12 = (SSHTTPServerResponse *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = -[SSHTTPServerResponse initWithStatusCode:]([SSHTTPServerResponse alloc], "initWithStatusCode:", 404);
    -[SSHTTPServerRequestHandler _errorResponseDataWithStatus:message:](self, "_errorResponseDataWithStatus:message:", 404, CFSTR("Page Not Found"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSHTTPServerResponse setBody:](v12, "setBody:", v16);

  }
  v17 = -[SSHTTPServerResponse copyHTTPMessage](v12, "copyHTTPMessage");
  v18 = CFHTTPMessageCopySerializedMessage(v17);
  CFRelease(v17);
  v38 = 0;
  v19 = -[SSHTTPServerRequestHandler _writeResponseData:error:](self, "_writeResponseData:error:", v18, &v38);
  v20 = v38;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v20)
  {
    if (!v21)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v23 |= 2u;
    objc_msgSend(v22, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      v23 &= 2u;
    if (!v23)
      goto LABEL_25;
    v25 = (void *)objc_opt_class();
    v39 = 138412802;
    v40 = v25;
    v41 = 2048;
    v42 = (SSHTTPServerRequestHandler *)v19;
    v43 = 2112;
    v44 = v20;
    v26 = v25;
    LODWORD(v36) = 32;
  }
  else
  {
    if (!v21)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v27 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v27 |= 2u;
    objc_msgSend(v22, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      v27 &= 2u;
    if (!v27)
      goto LABEL_25;
    v28 = (void *)objc_opt_class();
    v39 = 138412546;
    v40 = v28;
    v41 = 2114;
    v42 = self;
    v26 = v28;
    LODWORD(v36) = 22;
  }
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v39, v36, v37);
    v24 = objc_claimAutoreleasedReturnValue();
    free(v29);
    SSFileLog(v22, CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v24);
LABEL_25:

  }
  -[SSHTTPServerRequestHandler _close](self, "_close");

}

- (void)_close
{
  NSInputStream *input;
  NSInputStream *v4;
  NSOutputStream *output;
  NSOutputStream *v6;
  id v7;

  input = self->_input;
  if (input)
  {
    -[NSInputStream close](input, "close");
    v4 = self->_input;
    self->_input = 0;

  }
  output = self->_output;
  if (output)
  {
    -[NSOutputStream close](output, "close");
    v6 = self->_output;
    self->_output = 0;

  }
  -[SSHTTPServerRequestHandler delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestDidFinish:", self);

}

- (id)_errorResponseDataWithStatus:(signed __int16)a3 message:(id)a4
{
  int v4;
  id v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v6, "appendFormat:", CFSTR("<html><head><title>%d</title></head><body><div align='center'><h1>%d</h1>"), v4, v4);
  if (v5)
    objc_msgSend(v6, "appendFormat:", CFSTR("<p>%@</p>"), v5);
  objc_msgSend(v6, "appendString:", CFSTR("</div></body></html>"));
  objc_msgSend(v6, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)_throttledWriteSpeed
{
  int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  v3 = self->_downloadSpeed - 1;
  if (v3 > 5)
    return 0;
  else
    return qword_1A27A10B8[v3];
}

- (BOOL)_shouldKeepRunning
{
  NSObject *requestQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  requestQueue = self->_requestQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SSHTTPServerRequestHandler__shouldKeepRunning__block_invoke;
  v5[3] = &unk_1E47B8680;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(requestQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__SSHTTPServerRequestHandler__shouldKeepRunning__block_invoke(uint64_t result)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 32))
    v2 = 1;
  else
    v2 = *(_QWORD *)(v1 + 40) != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (int64_t)_writeResponseData:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  NSInteger v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if (v6 && objc_msgSend(v6, "length"))
  {
    v7 = -[SSHTTPServerRequestHandler _throttledWriteSpeed](self, "_throttledWriteSpeed");
    v8 = 0;
    if (v7)
      v9 = 0.5;
    else
      v9 = 0.0;
    if (v7)
      v10 = (unint64_t)((double)v7 * 0.5);
    else
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if (v8 >= objc_msgSend(v6, "length"))
      {
        v17 = 0;
        goto LABEL_26;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      if (v10 >= objc_msgSend(v6, "length") - v8)
        v12 = objc_msgSend(v6, "length") - v8;
      v13 = -[NSOutputStream write:maxLength:](self->_output, "write:maxLength:", objc_msgSend(objc_retainAutorelease(v6), "bytes") + v8, v12);
      if (v13 < 0)
        break;
      v8 += v13;
      objc_msgSend(v11, "timeIntervalSinceNow");
      if (v14 >= 0.0)
      {
        objc_msgSend(v11, "timeIntervalSinceNow");
      }
      else
      {
        objc_msgSend(v11, "timeIntervalSinceNow");
        v16 = -v15;
      }
      if (v9 - v16 > 0.0)
        objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:");

    }
    SSError((uint64_t)CFSTR("SSHTTPServerResponseErrorDomain"), 500, (uint64_t)CFSTR("Write Error"), (uint64_t)CFSTR("Error writing data to socket. [2]"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (a4 && v17)
    {
      v17 = objc_retainAutorelease(v17);
      *a4 = v17;
    }
LABEL_26:

  }
  else if (a4)
  {
    SSError((uint64_t)CFSTR("SSHTTPServerResponseErrorDomain"), 500, (uint64_t)CFSTR("Write Error"), (uint64_t)CFSTR("No data to write"));
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SSHTTPServerRequestHandlerDelegate)delegate
{
  return (SSHTTPServerRequestHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)downloadSpeed
{
  return self->_downloadSpeed;
}

- (void)setDownloadSpeed:(int)a3
{
  self->_downloadSpeed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_incommingMessageBody, 0);
}

@end
