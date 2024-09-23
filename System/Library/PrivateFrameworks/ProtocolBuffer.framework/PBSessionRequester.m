@implementation PBSessionRequester

- (PBSessionRequester)initWithURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  PBSessionRequester *v12;
  PBSessionRequester *v13;
  id v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  char v18;
  __int16 v19;
  NSOperationQueue *v20;
  NSOperationQueue *sessionDelegateQ;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PBSessionRequester;
  v12 = -[PBSessionRequester init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_delegateQueue, a5);
    v14 = objc_loadWeakRetained((id *)&v13->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 32;
    else
      v15 = 0;
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFFDF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 64;
    else
      v16 = 0;
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFFBF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 128;
    else
      v17 = 0;
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFF7F | v17;
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) != 0)
      v19 = 256;
    else
      v19 = 0;
    *(_WORD *)&v13->_flags = *(_WORD *)&v13->_flags & 0xFEFF | v19;

    v13->_timeoutSeconds = -1.0;
    v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    sessionDelegateQ = v13->_sessionDelegateQ;
    v13->_sessionDelegateQ = v20;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_sessionDelegateQ, "setMaxConcurrentOperationCount:", 1);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSessionTask cancel](self->_currentTask, "cancel");
  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
  v3.receiver = self;
  v3.super_class = (Class)PBSessionRequester;
  -[PBSessionRequester dealloc](&v3, sel_dealloc);
}

- (BOOL)ignoresResponse
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)setIgnoresResponse:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (void)setNeedsCancel
{
  if (self)
    *(_WORD *)&self->_flags |= 4u;
}

- (NSArray)requests
{
  return (NSArray *)self->_requests;
}

- (void)clearRequests
{
  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
}

- (void)addRequest:(id)a3
{
  id v4;
  NSMutableArray *requests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    requests = self->_requests;
    v8 = v4;
    if (!requests)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_requests;
      self->_requests = v6;

      requests = self->_requests;
    }
    -[NSMutableArray addObject:](requests, "addObject:", v8);
    v4 = v8;
  }

}

- (id)responseForRequest:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  if (!-[NSMutableArray count](self->_requests, "count")
    || (v5 = -[NSMutableArray indexOfObject:](self->_requests, "indexOfObject:", v4), v5 == 0x7FFFFFFFFFFFFFFFLL)
    || (v6 = v5, v5 >= -[NSMutableArray count](self->_responses, "count")))
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_responses, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)internalRequests
{
  return self->_internalRequests;
}

- (void)addInternalRequest:(id)a3
{
  id v4;
  NSMutableArray *internalRequests;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    internalRequests = self->_internalRequests;
    v8 = v4;
    if (!internalRequests)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_internalRequests;
      self->_internalRequests = v6;

      internalRequests = self->_internalRequests;
    }
    -[NSMutableArray addObject:](internalRequests, "addObject:", v8);
    v4 = v8;
  }

}

- (id)responseForInternalRequest:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  if (!-[NSMutableArray count](self->_internalRequests, "count")
    || (v5 = -[NSMutableArray indexOfObject:](self->_internalRequests, "indexOfObject:", v4), v5 == 0x7FFFFFFFFFFFFFFFLL)
    || (v6 = v5, v5 >= -[NSMutableArray count](self->_internalResponses, "count")))
  {
    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_internalResponses, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (NSDictionary)httpRequestHeaders
{
  return (NSDictionary *)self->_httpRequestHeaders;
}

- (void)setHttpRequestHeaders:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *httpRequestHeaders;

  if (self->_httpRequestHeaders != a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    httpRequestHeaders = self->_httpRequestHeaders;
    self->_httpRequestHeaders = v4;

  }
}

- (void)setHttpRequestHeader:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *httpRequestHeaders;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6)
  {
    httpRequestHeaders = self->_httpRequestHeaders;
    if (!httpRequestHeaders)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_httpRequestHeaders;
      self->_httpRequestHeaders = v8;

      httpRequestHeaders = self->_httpRequestHeaders;
    }
    -[NSMutableDictionary setObject:forKey:](httpRequestHeaders, "setObject:forKey:", v10, v6);
  }

}

- (id)requestPreamble
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  PBDataWriter *v10;
  void *v11;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PBSessionRequester_requestPreamble__block_invoke;
  block[3] = &unk_1E4FACB90;
  block[4] = self;
  if (requestPreamble__once == -1)
  {
    if (self)
      goto LABEL_3;
LABEL_12:
    v9 = 0;
    goto LABEL_9;
  }
  dispatch_once(&requestPreamble__once, block);
  if (!self)
    goto LABEL_12;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "objectAtIndex:", 0), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C997B0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v5;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
  }

  v9 = v8;
LABEL_9:
  v10 = objc_alloc_init(PBDataWriter);
  -[PBDataWriter writeBigEndianFixed16:](v10, "writeBigEndianFixed16:", 1);
  -[PBDataWriter writeBigEndianShortThenString:](v10, "writeBigEndianShortThenString:", v9);
  -[PBDataWriter writeBigEndianShortThenString:](v10, "writeBigEndianShortThenString:", requestPreamble_applicationID);
  -[PBDataWriter writeBigEndianShortThenString:](v10, "writeBigEndianShortThenString:", requestPreamble_osVersion);
  -[PBDataWriter immutableData](v10, "immutableData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)writeRequest:(id)a3 into:(id)a4
{
  id v5;
  id v6;
  void *v7;
  PBDataWriter *v8;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "writeBigEndianFixed32:", objc_msgSend(v6, "requestTypeCode"));
  v8 = objc_alloc_init(PBDataWriter);
  objc_msgSend(v6, "writeTo:", v8);

  -[PBDataWriter immutableData](v8, "immutableData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeProtoBuffer:", v7);

}

- (void)cancel
{
  NSOperationQueue *v3;
  NSOperationQueue *sessionDelegateQ;
  NSOperationQueue *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  _QWORD v9[5];
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0CB3828], "currentQueue");
  v3 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue();
  sessionDelegateQ = self->_sessionDelegateQ;

  if (v3 == sessionDelegateQ)
  {
    -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
    if (!self->_didNotifyRequestCompleted)
    {
      self->_didNotifyRequestCompleted = 1;
      if ((*(_WORD *)&self->_flags & 0x80) != 0)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __28__PBSessionRequester_cancel__block_invoke_2;
        v9[3] = &unk_1E4FACB90;
        v9[4] = self;
        -[NSOperationQueue addOperationWithBlock:](self->_delegateQueue, "addOperationWithBlock:", v9);
      }
      -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1A5E0D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "pbSessionRequester, activity, cancelled", v8, 2u);
        }
        -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        nw_activity_complete_with_reason();

      }
    }
  }
  else
  {
    v5 = self->_sessionDelegateQ;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__PBSessionRequester_cancel__block_invoke;
    v10[3] = &unk_1E4FACB90;
    v10[4] = self;
    -[NSOperationQueue addOperationWithBlock:](v5, "addOperationWithBlock:", v10);
  }
}

- (void)pause
{
  uint64_t v3;
  NSURLSessionTask *currentTask;
  NSURLSession *session;
  NSMutableData *data;
  PBDataReader *dataReader;

  if ((*(_WORD *)&self->_flags & 0x206) == 2)
  {
    v3 = -[NSMutableArray count](self->_responses, "count");
    if (v3 == -[NSMutableArray count](self->_requests, "count"))
    {
      *(_WORD *)&self->_flags |= 0x200u;
      -[NSURLSessionTask cancel](self->_currentTask, "cancel");
      currentTask = self->_currentTask;
      self->_currentTask = 0;

      -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");
      session = self->_session;
      self->_session = 0;

      -[NSMutableArray removeAllObjects](self->_internalResponses, "removeAllObjects");
      data = self->_data;
      self->_data = 0;

      dataReader = self->_dataReader;
      self->_dataReader = 0;

      -[PBSessionRequester setHttpResponseHeaders:](self, "setHttpResponseHeaders:", 0);
      *(_WORD *)&self->_flags &= ~8u;
    }
  }
}

- (BOOL)isPaused
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (void)resume
{
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF9FF | 0x400;
    -[PBSessionRequester start](self, "start");
    *(_WORD *)&self->_flags &= ~0x400u;
  }
}

- (void)cancelWithErrorCode:(int64_t)a3
{
  -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, a3, 0);
}

- (BOOL)readResponsePreamble:(id)a3
{
  id v4;
  unsigned int v5;
  char v6;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "readBigEndianFixed16");
  v6 = objc_msgSend(v4, "hasError");

  if ((v6 & 1) == 0)
  {
    if (v5 == 1)
      return 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect protocol version: %i (expected %i)."), v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6001, v8);

  }
  return 0;
}

- (id)tryReadResponseData:(id)a3 forRequest:(id)a4 forResponseClass:(Class)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "readBigEndianFixed32");
  if ((objc_msgSend(v7, "hasError") & 1) != 0)
    goto LABEL_5;
  if ((_DWORD)v9 != objc_msgSend(v8, "requestTypeCode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect requestTypeCode: %i (expected %i)."), v9, objc_msgSend(v8, "requestTypeCode"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6001, v11);

LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v7, "readProtoBuffer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void (*v12)(void);
  void *v13;
  int64_t v14;
  int64_t v15;
  FILE *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  __int16 flags;
  id v23;

  v23 = a5;
  v10 = a6;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (*(_OWORD *)&self->_session == __PAIR128__((unint64_t)a4, (unint64_t)a3))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11[2](v11, 0);
      -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]((uint64_t)self, (void *)*MEMORY[0x1E0CB32E8], -1011, 0);
      -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
      *(_WORD *)&self->_flags &= 0xFFF9u;
      goto LABEL_4;
    }
    objc_msgSend(v23, "allHeaderFields");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBSessionRequester setHttpResponseHeaders:](self, "setHttpResponseHeaders:", v13);

    v14 = objc_msgSend(v23, "statusCode");
    v15 = v14;
    if ((unint64_t)(v14 - 400) <= 0xFFFFFFFFFFFFFED3)
    {
      v11[2](v11, 0);
      v16 = (FILE *)*MEMORY[0x1E0C80C10];
      objc_msgSend(v23, "URL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "absoluteString");
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      fprintf(v16, "%s:%d server (%s) returned error: %zd\n", "/Library/Caches/com.apple.xbs/Sources/ProtocolBuffer/Runtime/PBSessionRequester.m", 795, (const char *)objc_msgSend(v18, "UTF8String"), objc_msgSend(v23, "statusCode"));

      v19 = objc_alloc(MEMORY[0x1E0C99D80]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", v20, CFSTR("PBHTTPStatusCode"), 0);

      -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]((uint64_t)self, (void *)*MEMORY[0x1E0CB32E8], -1011, v21);
      -[PBSessionRequester _cancelNoNotify]((id *)&self->super.isa);
      *(_WORD *)&self->_flags &= 0xFFF9u;

      goto LABEL_4;
    }
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
      self->_responseStatusCode = v14;
      *(_WORD *)&self->_flags = flags | 8;
    }
    v12 = (void (*)(void))v11[2];
  }
  else
  {
    v12 = (void (*)(void))*((_QWORD *)v10 + 2);
  }
  v12();
LABEL_4:

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSURLSessionTask *v8;
  id v9;
  void *v10;
  int v11;
  NSMutableData *data;
  NSMutableData *v13;
  NSMutableData *v14;
  NSMutableData *v15;
  NSMutableData *v16;
  PBDataReader *v17;
  PBDataReader *dataReader;
  NSURLSession *v19;

  v19 = (NSURLSession *)a3;
  v8 = (NSURLSessionTask *)a4;
  v9 = a5;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    -[PBSessionRequester cancel](self, "cancel");
  }
  else if (self->_session == v19 && self->_currentTask == v8 && (*(_WORD *)&self->_flags & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1A85B6664]();
    v11 = objc_msgSend((id)objc_opt_class(), "usesEncodedMessages");
    data = self->_data;
    if (v11)
    {
      if (data)
      {
        -[NSMutableData appendData:](data, "appendData:", v9);
      }
      else
      {
        v13 = (NSMutableData *)objc_msgSend(v9, "mutableCopy");
        v14 = self->_data;
        self->_data = v13;

      }
    }
    else
    {
      if (data)
      {
        -[NSMutableData appendData:](data, "appendData:", v9);
        -[PBDataReader updateData:](self->_dataReader, "updateData:", self->_data);
      }
      else
      {
        v15 = (NSMutableData *)objc_msgSend(v9, "mutableCopy");
        v16 = self->_data;
        self->_data = v15;

        v17 = -[PBDataReader initWithData:]([PBDataReader alloc], "initWithData:", self->_data);
        dataReader = self->_dataReader;
        self->_dataReader = v17;

      }
      if ((*(_WORD *)&self->_flags & 0x10) == 0)
      {
        -[PBDataReader seekToOffset:](self->_dataReader, "seekToOffset:", self->_lastGoodDataOffset);
        if (-[PBSessionRequester readResponsePreamble:](self, "readResponsePreamble:", self->_dataReader))
        {
          if (!-[PBDataReader hasError](self->_dataReader, "hasError"))
          {
            self->_lastGoodDataOffset = -[PBDataReader offset](self->_dataReader, "offset");
            *(_WORD *)&self->_flags |= 0x10u;
          }
        }
      }
      if ((*(_WORD *)&self->_flags & 0x10) != 0)
      {
        while ((-[PBSessionRequester _tryParseData]((uint64_t)self) & 1) != 0)
          ;
      }
    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSURLSession *v8;
  NSURLSessionTask *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PBDataReader *v16;
  PBDataReader *dataReader;
  void *v18;
  NSMutableData *data;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSMutableArray *responses;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[8];
  _QWORD v37[5];

  v8 = (NSURLSession *)a3;
  v9 = (NSURLSessionTask *)a4;
  v10 = a5;
  v11 = v10;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    -[PBSessionRequester cancel](self, "cancel");
  }
  else if (self->_session == v8 && self->_currentTask == v9 && (*(_WORD *)&self->_flags & 1) == 0)
  {
    if (v10)
    {
      -[PBSessionRequester _failWithError:]((uint64_t)self, v10);
LABEL_28:
      -[PBSessionRequester _cleanup]((uint64_t)self);
      goto LABEL_9;
    }
    self->_downloadPayloadSize = -[NSMutableData length](self->_data, "length");
    self->_timeResponseReceived = mach_absolute_time();
    if (objc_msgSend((id)objc_opt_class(), "usesEncodedMessages"))
    {
      v12 = (void *)MEMORY[0x1A85B6664]();
      -[PBSessionRequester decodeResponseData:](self, "decodeResponseData:", self->_data);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "writeToFile:atomically:", v15, 0);

        }
        v16 = -[PBDataReader initWithData:]([PBDataReader alloc], "initWithData:", v13);
        dataReader = self->_dataReader;
        self->_dataReader = v16;

        if (!-[PBSessionRequester readResponsePreamble:](self, "readResponsePreamble:", self->_dataReader))
          goto LABEL_19;
        if (-[PBDataReader hasError](self->_dataReader, "hasError"))
          goto LABEL_19;
        *(_WORD *)&self->_flags |= 0x10u;
        self->_lastGoodDataOffset = -[PBDataReader offset](self->_dataReader, "offset");
        while ((-[PBSessionRequester _tryParseData]((uint64_t)self) & 1) != 0)
          ;
        if (!self->_didNotifyRequestCompleted)
        {
LABEL_19:

          objc_autoreleasePoolPop(v12);
LABEL_22:
          if ((*(_WORD *)&self->_flags & 0x10) != 0
            && (v21 = -[NSMutableArray count](self->_responses, "count"),
                v21 == -[NSMutableArray count](self->_requests, "count")))
          {
            -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              v23 = -[NSMutableArray count](self->_responses, "count");
              responses = self->_responses;
              if (v23 == 1)
              {
                -[NSMutableArray objectAtIndex:](responses, "objectAtIndex:", 0);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "stringByAppendingString:", CFSTR(".txt"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "formattedText");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "writeToFile:atomically:encoding:error:", v27, 0, 4, 0);

              }
              else if (-[NSMutableArray count](responses, "count"))
              {
                v29 = 0;
                do
                {
                  -[NSMutableArray objectAtIndex:](self->_responses, "objectAtIndex:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "stringByAppendingFormat:", CFSTR(".part_%d.txt"), v29);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v30, "formattedText");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "writeToFile:atomically:encoding:error:", v32, 0, 4, 0);

                  ++v29;
                }
                while (v29 < -[NSMutableArray count](self->_responses, "count"));
              }
            }
            -[PBDataReader data](self->_dataReader, "data");

            if (!self->_didNotifyRequestCompleted)
            {
              self->_didNotifyRequestCompleted = 1;
              if ((*(_WORD *)&self->_flags & 0x40) != 0)
              {
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = __59__PBSessionRequester_URLSession_task_didCompleteWithError___block_invoke;
                v37[3] = &unk_1E4FACB90;
                v37[4] = self;
                -[NSOperationQueue addOperationWithBlock:](self->_delegateQueue, "addOperationWithBlock:", v37);
              }
              -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A5E0D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "pbSessionRequester, activity, success", buf, 2u);
                }
                -[NSURLSessionTask _nw_activity](self->_currentTask, "_nw_activity");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                nw_activity_complete_with_reason();

              }
            }
          }
          else
          {
            -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:]((uint64_t)self, CFSTR("PBRequesterErrorDomain"), 6001, 0);
          }
          goto LABEL_28;
        }
      }
      else
      {
        -[PBSessionRequester cancelWithErrorCode:description:]((uint64_t)self, 6003, CFSTR("Decryption failed."));
      }
      -[PBSessionRequester _cleanup]((uint64_t)self);

      objc_autoreleasePoolPop(v12);
      goto LABEL_9;
    }
    -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      data = self->_data;
      -[PBSessionRequester logResponseToFile](self, "logResponseToFile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableData writeToFile:atomically:](data, "writeToFile:atomically:", v20, 0);

    }
    goto LABEL_22;
  }
LABEL_9:

}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  id v14;
  void *v15;
  char v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  void (**v20)(id, _QWORD);
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a6;
  if (self && (*(_WORD *)&self->_flags & 4) != 0)
  {
    -[PBSessionRequester cancel](self, "cancel");
    v13[2](v13, 0);
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v14 = v12;
  v27 = v14;
  -[PBSessionRequester delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[PBSessionRequester delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
    v18[3] = &unk_1E4FACC58;
    v18[4] = self;
    v20 = v13;
    v19 = v14;
    v21 = &v22;
    objc_msgSend(v17, "requesterWillSendRequestForEstablishedConnection:callback:", self, v18);

  }
  else
  {
    v13[2](v13, v23[5]);
  }
  _Block_object_dispose(&v22, 8);

}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(id, _QWORD, void *);

  v14 = (void (**)(id, _QWORD, void *))a5;
  v7 = (void *)*MEMORY[0x1E0CB32A8];
  objc_msgSend(a4, "protectionSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authenticationMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v9)
  {
    v10 = -[NSArray count](self->_clientCertificates, "count");

    if (v10)
    {
      -[NSArray objectAtIndexedSubscript:](self->_clientCertificates, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray subarrayWithRange:](self->_clientCertificates, "subarrayWithRange:", 1, -[NSArray count](self->_clientCertificates, "count") - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB39A8], "credentialWithIdentity:certificates:persistence:", v11, v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, 0, v13);

      goto LABEL_6;
    }
  }
  else
  {

  }
  v14[2](v14, 1, 0);
LABEL_6:

}

- (unint64_t)requestResponseTime
{
  if (requestResponseTime_onceToken != -1)
    dispatch_once(&requestResponseTime_onceToken, &__block_literal_global_436);
  return (self->_timeResponseReceived - self->_timeRequestSent)
       * requestResponseTime_sTimebaseInfo
       / (1000000
        * (unint64_t)*(unsigned int *)algn_1EE809C14);
}

- (void)encodeRequestData:(id)a3 startRequestCallback:(id)a4
{
  (*((void (**)(id, id, _QWORD))a4 + 2))(a4, a3, 0);
}

- (id)decodeResponseData:(id)a3
{
  return a3;
}

- (id)newMutableURLRequestWithURL:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:cachePolicy:timeoutInterval:", a3, 0, 60.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4
{
  return (id)-[PBSessionRequester _newSessionWithDelegate:delegateQueue:connectionProperties:]((uint64_t)self, a3, a4, 0);
}

- (id)newSessionWithDelegate:(id)a3 delegateQueue:(id)a4 connectionProperties:(id)a5
{
  return (id)-[PBSessionRequester _newSessionWithDelegate:delegateQueue:connectionProperties:]((uint64_t)self, a3, a4, a5);
}

- (id)newSessionTaskOnSession:(id)a3 withURLRequest:(id)a4
{
  objc_msgSend(a3, "dataTaskWithRequest:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)startWithConnectionProperties:(id)a3
{
  objc_storeStrong((id *)&self->_connectionProperties, a3);
  -[PBSessionRequester _start]((uint64_t)self);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (PBSessionRequesterDelegate)delegate
{
  return (PBSessionRequesterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURLSessionTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (NSDictionary)httpResponseHeaders
{
  return self->_httpResponseHeaders;
}

- (void)setHttpResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponseHeaders, a3);
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (NSString)logRequestToFile
{
  return self->_logRequestToFile;
}

- (void)setLogRequestToFile:(id)a3
{
  objc_storeStrong((id *)&self->_logRequestToFile, a3);
}

- (NSString)logResponseToFile
{
  return self->_logResponseToFile;
}

- (void)setLogResponseToFile:(id)a3
{
  objc_storeStrong((id *)&self->_logResponseToFile, a3);
}

- (unint64_t)uploadPayloadSize
{
  return self->_uploadPayloadSize;
}

- (unint64_t)downloadPayloadSize
{
  return self->_downloadPayloadSize;
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
  objc_storeStrong((id *)&self->_clientCertificates, a3);
}

- (BOOL)shouldHandleCookies
{
  return self->_shouldHandleCookies;
}

- (void)setShouldHandleCookies:(BOOL)a3
{
  self->_shouldHandleCookies = a3;
}

- (NSString)apsRelayTopic
{
  return self->_apsRelayTopic;
}

- (void)setApsRelayTopic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (unint64_t)nwActivityDomain
{
  return self->_nwActivityDomain;
}

- (void)setNwActivityDomain:(unint64_t)a3
{
  self->_nwActivityDomain = a3;
}

- (unint64_t)nwActivityLabel
{
  return self->_nwActivityLabel;
}

- (void)setNwActivityLabel:(unint64_t)a3
{
  self->_nwActivityLabel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsRelayTopic, 0);
  objc_storeStrong((id *)&self->_connectionProperties, 0);
  objc_storeStrong((id *)&self->_clientCertificates, 0);
  objc_storeStrong((id *)&self->_logResponseToFile, 0);
  objc_storeStrong((id *)&self->_logRequestToFile, 0);
  objc_storeStrong((id *)&self->_httpRequestHeaders, 0);
  objc_storeStrong((id *)&self->_httpResponseHeaders, 0);
  objc_storeStrong((id *)&self->_internalResponses, 0);
  objc_storeStrong((id *)&self->_internalRequests, 0);
  objc_storeStrong((id *)&self->_responses, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_dataReader, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_sessionDelegateQ, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (void)_start
{
  void *v2;
  _QWORD v3[5];

  if (a1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __28__PBSessionRequester__start__block_invoke;
    v3[3] = &unk_1E4FACBB8;
    v3[4] = a1;
    v2 = (void *)MEMORY[0x1A85B67B4](v3);
    -[PBSessionRequester _serializePayload:](a1, v2);

  }
}

void __28__PBSessionRequester__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned __int8 *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  os_log_type_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 *v40;
  unsigned __int8 *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  int v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 **)(a1 + 32);
  if (a3)
  {
    -[PBSessionRequester _failWithError:](*(_QWORD *)(a1 + 32), a3);
    return;
  }
  v5 = a2;
  if (v3)
  {
    v6 = (void *)*((_QWORD *)v3 + 5);
    if (v6)
    {
      objc_msgSend(v6, "cancel");
      v7 = (void *)*((_QWORD *)v3 + 5);
      *((_QWORD *)v3 + 5) = 0;

    }
    v8 = (void *)*((_QWORD *)v3 + 4);
    if (v8)
    {
      objc_msgSend(v8, "invalidateAndCancel");
      v9 = (void *)*((_QWORD *)v3 + 4);
      *((_QWORD *)v3 + 4) = 0;

    }
    v10 = (void *)*((_QWORD *)v3 + 7);
    if (v10)
    {
      *((_QWORD *)v3 + 7) = 0;

    }
    v11 = (void *)*((_QWORD *)v3 + 16);
    if (v11 && (*((_WORD *)v3 + 124) & 0x400) == 0)
    {
      *((_QWORD *)v3 + 16) = 0;

    }
    v12 = (void *)*((_QWORD *)v3 + 18);
    if (v12)
    {
      *((_QWORD *)v3 + 18) = 0;

    }
    v13 = (void *)*((_QWORD *)v3 + 8);
    if (v13)
    {
      *((_QWORD *)v3 + 8) = 0;

    }
    *((_QWORD *)v3 + 9) = 0;
    *((_QWORD *)v3 + 10) = 0;
    *((_WORD *)v3 + 124) &= ~0x10u;
    v14 = (void *)MEMORY[0x1A85B6664]();
    *((_QWORD *)v3 + 10) = objc_msgSend(v5, "length");
    *((_WORD *)v3 + 124) |= 2u;
    *((_QWORD *)v3 + 12) = mach_absolute_time();
    if (*((_QWORD *)v3 + 1))
    {
      v42 = v14;
      v43 = v5;
      v15 = (void *)objc_msgSend(v3, "newMutableURLRequestWithURL:");
      if (objc_msgSend(*((id *)v3 + 25), "count"))
        objc_msgSend(v15, "setCachePolicy:", 1);
      v16 = *((double *)v3 + 21);
      if (v16 == -1.0)
        v16 = 60.0;
      objc_msgSend(v15, "setTimeoutInterval:", v16);
      objc_msgSend(v15, "setHTTPMethod:", CFSTR("POST"));
      objc_msgSend(v15, "setHTTPShouldHandleCookies:", v3[216]);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v3, "httpRequestHeaders");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "allKeys");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v45 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v3, "httpRequestHeaders");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setValue:forHTTPHeaderField:", v25, v23);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v20);
      }

      v5 = v43;
      objc_msgSend(v15, "setHTTPBody:", v43);
      v26 = objc_msgSend(v3, "newSessionWithDelegate:delegateQueue:connectionProperties:", v3, *((_QWORD *)v3 + 6), *((_QWORD *)v3 + 26));
      v27 = (void *)*((_QWORD *)v3 + 4);
      *((_QWORD *)v3 + 4) = v26;

      v28 = objc_msgSend(v3, "newSessionTaskOnSession:withURLRequest:", *((_QWORD *)v3 + 4), v15);
      v29 = (void *)*((_QWORD *)v3 + 5);
      *((_QWORD *)v3 + 5) = v28;

      if (*((_QWORD *)v3 + 28))
        objc_msgSend(*((id *)v3 + 5), "set_APSRelayTopic:");
      if (!*((_QWORD *)v3 + 29) || !*((_QWORD *)v3 + 30))
      {
        objc_msgSend(*((id *)v3 + 5), "set_nw_activity:", 0);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A5E0D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "pbSessionRequester, activity, nil", buf, 2u);
        }
        goto LABEL_44;
      }
      v30 = (void *)nw_activity_create();
      v31 = (void *)*((_QWORD *)v3 + 5);
      if (v30)
      {
        objc_msgSend(v31, "set_nw_activity:", v30);
        nw_activity_activate();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v32 = *((_QWORD *)v3 + 29);
          v33 = *((_QWORD *)v3 + 30);
          *(_DWORD *)buf = 67109376;
          v49 = v32;
          v50 = 1024;
          v51 = v33;
          v34 = MEMORY[0x1E0C81028];
          v35 = "pbSessionRequester, activity, activate, %d, %d";
          v36 = OS_LOG_TYPE_INFO;
LABEL_42:
          _os_log_impl(&dword_1A5E0D000, v34, v36, v35, buf, 0xEu);
        }
      }
      else
      {
        objc_msgSend(v31, "set_nw_activity:", 0);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v38 = *((_QWORD *)v3 + 29);
          v39 = *((_QWORD *)v3 + 30);
          *(_DWORD *)buf = 67109376;
          v49 = v38;
          v50 = 1024;
          v51 = v39;
          v34 = MEMORY[0x1E0C81028];
          v35 = "pbSessionRequester, activity, createnil, %d, %d";
          v36 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_42;
        }
      }

LABEL_44:
      objc_msgSend(*((id *)v3 + 5), "resume");

      objc_autoreleasePoolPop(v42);
      v3 = 0;
      v37 = 1;
      goto LABEL_45;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PBRequesterErrorDomain"), 6004, 0);
    v3 = (unsigned __int8 *)(id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v14);
  }
  v37 = 0;
LABEL_45:

  v40 = v3;
  v41 = v40;
  if ((v37 & 1) == 0)
  {
    if (v40)
      -[PBSessionRequester _failWithError:](*(_QWORD *)(a1 + 32), v40);
  }

}

- (void)_serializePayload:(uint64_t)a1
{
  void (**v3)(id, void *, _QWORD);
  PBDataWriter *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(PBDataWriter);
    objc_msgSend((id)a1, "requestPreamble");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[PBDataWriter writeData:](v4, "writeData:", v5);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v6 = *(id *)(a1 + 136);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend((id)a1, "writeRequest:into:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v10++), v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v8);
    }

    v11 = *(id *)(a1 + 120);
    if ((*(_WORD *)(a1 + 248) & 0x400) != 0)
    {
      v12 = objc_msgSend(*(id *)(a1 + 128), "count");
      objc_msgSend(v11, "subarrayWithRange:", v12, objc_msgSend(*(id *)(a1 + 120), "count") - v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v13;
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend((id)a1, "writeRequest:into:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v18++), v4);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v16);
    }

    objc_msgSend((id)a1, "logRequestToFile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[PBDataWriter immutableData](v4, "immutableData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "logRequestToFile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "writeToFile:atomically:", v21, 0);

      v22 = objc_msgSend(*(id *)(a1 + 120), "count");
      v23 = *(void **)(a1 + 120);
      if (v22 == 1)
      {
        objc_msgSend(v23, "objectAtIndex:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "logRequestToFile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingString:", CFSTR(".txt"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)a1, "URL");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "formattedText");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("URL: %@\n\n%@"), v28, v29, (_QWORD)v37);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "writeToFile:atomically:encoding:error:", v26, 0, 4, 0);
      }
      else if (objc_msgSend(v23, "count"))
      {
        v31 = 0;
        do
        {
          objc_msgSend(*(id *)(a1 + 120), "objectAtIndex:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)a1, "logRequestToFile");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringByAppendingFormat:", CFSTR(".part_%d.txt"), v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "formattedText");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "writeToFile:atomically:encoding:error:", v34, 0, 4, 0);

          ++v31;
        }
        while (v31 < objc_msgSend(*(id *)(a1 + 120), "count"));
      }
    }
    -[PBDataWriter immutableData](v4, "immutableData");

    if (objc_msgSend((id)objc_opt_class(), "usesEncodedMessages"))
    {
      -[PBDataWriter immutableData](v4, "immutableData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "encodeRequestData:startRequestCallback:", v36, v3);
    }
    else
    {
      -[PBDataWriter immutableData](v4, "immutableData");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v36, 0);
    }

  }
}

- (void)_failWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1 && !*(_BYTE *)(a1 + 192))
  {
    *(_BYTE *)(a1 + 192) = 1;
    v5 = v3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v5, "code");
      objc_msgSend((id)a1, "currentTask");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v18 = v6;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1A5E0D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "pbSessionRequester, didFailWithError, %{public}ld, %{public}@", buf, 0x16u);

    }
    if ((*(_WORD *)(a1 + 248) & 0x100) != 0)
    {
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __37__PBSessionRequester__failWithError___block_invoke;
      v14 = &unk_1E4FACBE0;
      v15 = a1;
      v16 = v5;
      objc_msgSend(*(id *)(a1 + 24), "addOperationWithBlock:", &v11);

    }
    objc_msgSend(*(id *)(a1 + 40), "_nw_activity", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A5E0D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "pbSessionRequester, activity, failure", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 40), "_nw_activity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      nw_activity_complete_with_reason();

    }
  }

}

void __37__PBSessionRequester__failWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requester:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (uint64_t)_newSessionWithDelegate:(void *)a3 delegateQueue:(void *)a4 connectionProperties:
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (void *)MEMORY[0x1E0CB39F8];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v6, "ephemeralSessionConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C932C0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v22 = v8;
      v12 = v11;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        v16 = *MEMORY[0x1E0C93278];
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v18, "isEqualToString:", v16))
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "set_sourceApplicationAuditTokenData:", v19);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v14);
      }

      v8 = v22;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v10, v9, v8);
  v20 = objc_claimAutoreleasedReturnValue();

  return v20;
}

uint64_t __41__PBSessionRequester_requestResponseTime__block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&requestResponseTime_sTimebaseInfo);
}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4FACC58;
  v6[4] = v2;
  v8 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = v4;
  v9 = v5;
  objc_msgSend(v3, "addOperationWithBlock:", v6);

}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 40) || (*(_WORD *)(v2 + 248) & 4) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3;
    v6[3] = &unk_1E4FACC30;
    v6[4] = v2;
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 56);
    v7 = v3;
    v8 = v4;
    v5 = (void *)MEMORY[0x1A85B67B4](v6);
    -[PBSessionRequester _serializePayload:](*(_QWORD *)(a1 + 32), v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __97__PBSessionRequester_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    -[PBSessionRequester _failWithError:](*(_QWORD *)(a1 + 32), a3);
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
    objc_msgSend(v5, "setHTTPBody:", v8);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (uint64_t)_cleanup
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 40);
    *(_QWORD *)(result + 40) = 0;

    objc_msgSend(*(id *)(v1 + 32), "invalidateAndCancel");
    v3 = *(void **)(v1 + 32);
    *(_QWORD *)(v1 + 32) = 0;

    v4 = *(void **)(v1 + 56);
    *(_QWORD *)(v1 + 56) = 0;

    v5 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = 0;

    result = objc_msgSend((id)v1, "setHttpResponseHeaders:", 0);
    *(_WORD *)(v1 + 248) &= 0xF9F1u;
  }
  return result;
}

- (void)cancelWithErrorCode:(void *)a3 description:
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (a1)
  {
    v7 = v5;
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0C9AFB0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[PBSessionRequester _failWithErrorDomain:errorCode:userInfo:](a1, CFSTR("PBRequesterErrorDomain"), a2, v6);
    -[PBSessionRequester _cancelNoNotify]((id *)a1);
    *(_WORD *)(a1 + 248) &= 0xFFF9u;

    v5 = v7;
  }

}

- (uint64_t)_tryParseData
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  PBDataReader *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;

  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 64))
    return 0;
  v2 = objc_msgSend(*(id *)(a1 + 144), "count");
  v3 = objc_msgSend(*(id *)(a1 + 136), "count");
  v4 = objc_msgSend(*(id *)(a1 + 120), "count");
  if (v4 == objc_msgSend(*(id *)(a1 + 128), "count"))
    return 0;
  objc_msgSend(*(id *)(a1 + 64), "seekToOffset:", *(_QWORD *)(a1 + 72));
  v6 = 128;
  if (v2 >= v3)
  {
    v7 = 120;
  }
  else
  {
    v6 = 144;
    v7 = 136;
  }
  objc_msgSend(*(id *)(a1 + v7), "objectAtIndex:", objc_msgSend(*(id *)(a1 + v6), "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "responseClass");
  if ((objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request (%@) provided an invalid response class (needs to be a subclass of PBCodable): %@"), v8, objc_msgSend(v8, "responseClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", CFSTR("InvalidResponseClass"), v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

  }
  objc_msgSend((id)a1, "tryReadResponseData:forRequest:forResponseClass:", *(_QWORD *)(a1 + 64), v8, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_msgSend(*(id *)(a1 + 64), "hasError") & 1) == 0)
  {
    v14 = objc_alloc_init((Class)v9);
    v15 = -[PBDataReader initWithData:]([PBDataReader alloc], "initWithData:", v13);
    v5 = objc_msgSend(v14, "readFrom:", v15);
    if ((_DWORD)v5)
    {
      if (v2 >= v3)
      {
        v19 = *(void **)(a1 + 128);
        if (!v19)
        {
          v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
          v21 = *(void **)(a1 + 128);
          *(_QWORD *)(a1 + 128) = v20;

          v19 = *(void **)(a1 + 128);
        }
        objc_msgSend(v19, "addObject:", v14);
        *(_QWORD *)(a1 + 72) = objc_msgSend(*(id *)(a1 + 64), "offset");
        if ((*(_WORD *)(a1 + 248) & 0x20) != 0)
        {
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __35__PBSessionRequester__tryParseData__block_invoke;
          v23[3] = &unk_1E4FACC08;
          v23[4] = a1;
          v24 = v14;
          v25 = v8;
          objc_msgSend(*(id *)(a1 + 24), "addOperationWithBlock:", v23);

        }
      }
      else
      {
        v16 = *(void **)(a1 + 144);
        if (!v16)
        {
          v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
          v18 = *(void **)(a1 + 144);
          *(_QWORD *)(a1 + 144) = v17;

          v16 = *(void **)(a1 + 144);
        }
        objc_msgSend(v16, "addObject:", v14);
        *(_QWORD *)(a1 + 72) = objc_msgSend(*(id *)(a1 + 64), "offset");
        objc_msgSend((id)a1, "handleResponse:forInternalRequest:", v14, v8);
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_failWithErrorDomain:(uint64_t)a3 errorCode:(void *)a4 userInfo:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;

  if (a1)
  {
    v7 = (objc_class *)MEMORY[0x1E0CB35C8];
    v8 = a4;
    v9 = a2;
    v10 = (id)objc_msgSend([v7 alloc], "initWithDomain:code:userInfo:", v9, a3, v8);

    -[PBSessionRequester _failWithError:](a1, v10);
  }
}

void __59__PBSessionRequester_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requesterDidFinish:", *(_QWORD *)(a1 + 32));

}

void __35__PBSessionRequester__tryParseData__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requester:didReceiveResponse:forRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)_cancelNoNotify
{
  uint64_t v1;

  if (result)
  {
    v1 = (uint64_t)result;
    objc_msgSend(result[5], "cancel");
    -[PBSessionRequester _cleanup](v1);
    if (objc_msgSend(*(id *)(v1 + 128), "count"))
      objc_msgSend(*(id *)(v1 + 128), "removeAllObjects");
    result = *(id **)(v1 + 144);
    if (result)
      return (id *)objc_msgSend(result, "removeAllObjects");
  }
  return result;
}

uint64_t __28__PBSessionRequester_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __28__PBSessionRequester_cancel__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requesterDidCancel:", *(_QWORD *)(a1 + 32));

}

void __37__PBSessionRequester_requestPreamble__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  v4 = (void *)requestPreamble_applicationID;
  requestPreamble_applicationID = v3;

  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
    objc_msgSend(v5, "objectForKey:", CFSTR("ProductVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("ProductBuildVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)requestPreamble_osVersion;
  requestPreamble_osVersion = v8;

}

+ (BOOL)usesEncodedMessages
{
  return 0;
}

@end
