@implementation NSHttpRequest

+ (id)UrlFromUtf8String:(const void *)a3
{
  void *v3;
  void *v4;

  if (*((char *)a3 + 23) < 0)
    a3 = *(const void **)a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));

  return v4;
}

+ (id)header:(id)a3 valueForKey:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", v5));
  if (!v6)
    goto LABEL_7;
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v9 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
      goto LABEL_8;
    }
    v10 = objc_opt_class(v6);
    NSLog(CFSTR("Bad object type %@ stored for header %@"), v10, v5);
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v8 = v6;
LABEL_8:

  return v8;
}

+ (id)header:(id)a3 valuesForKey:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", v5));
  if (!v6)
    goto LABEL_7;
  v7 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v9 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6));
      goto LABEL_8;
    }
    v10 = objc_opt_class(v6);
    NSLog(CFSTR("Bad object type %@ stored for header %@"), v10, v5);
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v8 = v6;
LABEL_8:

  return v8;
}

+ (id)requestWithUrl:(id)a3
{
  id v3;
  NSHttpRequest *v4;

  v3 = a3;
  v4 = -[NSHttpRequest initWithUrl:]([NSHttpRequest alloc], "initWithUrl:", v3);

  return v4;
}

+ (id)getCookiesForUrl:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSHTTPCookieStorage sharedHTTPCookieStorage](NSHTTPCookieStorage, "sharedHTTPCookieStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cookiesForURL:", v3));

  return v5;
}

+ (id)getCookie:(id)a3 forUrl:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSHttpRequest getCookiesForUrl:](NSHttpRequest, "getCookiesForUrl:", a4));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name", (_QWORD)v14));
        v12 = objc_msgSend(v11, "isEqualToString:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)encodeFormValues:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v15 = a3;
  v3 = objc_alloc_init((Class)NSMutableData);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v15;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v7);
        if (objc_msgSend(v3, "length"))
          objc_msgSend(v3, "appendBytes:length:", "&", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ps_urlEncode"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ps_urlEncode"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%@"), v10, v11));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dataUsingEncoding:", 4));
        objc_msgSend(v3, "appendData:", v13);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v3;
}

- (NSHttpRequest)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-init is not a valid initializer for the class LoginImpl"), 0));
  objc_exception_throw(v2);
}

- (NSHttpRequest)initWithUrl:(id)a3
{
  id v4;
  NSHttpRequest *v5;
  NSHttpRequest *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  objc_super v15;
  uint64_t v16[4];

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NSHttpRequest;
  v5 = -[NSHttpRequest init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    -[NSHttpRequest setFUrl:](v5, "setFUrl:", v4);
    -[NSHttpRequest setOnResponse:](v6, "setOnResponse:", 0);
    -[NSHttpRequest setOnHeaders:](v6, "setOnHeaders:", 0);
    -[NSHttpRequest setOnError:](v6, "setOnError:", 0);
    -[NSHttpRequest setFReceivedData:](v6, "setFReceivedData:", 0);
    -[NSHttpRequest setFFinished:](v6, "setFFinished:", 0);
    -[NSHttpRequest setFExecuting:](v6, "setFExecuting:", 0);
    -[NSHttpRequest setFHttpResponse:](v6, "setFHttpResponse:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v4));
    -[NSHttpRequest setFActiveRequest:](v6, "setFActiveRequest:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](v6, "fActiveRequest"));
    objc_msgSend(v8, "setHTTPShouldUsePipelining:", 1);

    v9 = sub_10016E208();
    sub_1000B3964((uint64_t)v9);
    LODWORD(v8) = v16[0];
    sub_1000B3D5C((uint64_t)v16);
    if ((_DWORD)v8 != (int)v8 >> 31)
    {
      v16[0] = (uint64_t)sub_10016E208();
      v16[1] = v10;
      sub_100310C94(v16);
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](v6, "fActiveRequest", 0));
      objc_msgSend(v13, "setTimeoutInterval:", v12);

    }
  }

  return v6;
}

- (void)setMainDocumentUrl:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  objc_msgSend(v4, "setMainDocumentURL:", v5);

}

- (void)handleCancelled:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    objc_msgSend(v4, "cancel");
  -[NSHttpRequest handleCompleted](self, "handleCompleted");

}

- (void)startExecuting
{
  -[NSHttpRequest willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[NSHttpRequest setFExecuting:](self, "setFExecuting:", 1);
  -[NSHttpRequest didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (void)stopExecuting
{
  -[NSHttpRequest willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[NSHttpRequest setFExecuting:](self, "setFExecuting:", 0);
  -[NSHttpRequest didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));

  return (NSString *)v4;
}

- (void)handleCompleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSHttpRequest setFBody:](self, "setFBody:", 0);
  -[NSHttpRequest setFReceivedData:](self, "setFReceivedData:", 0);
  -[NSHttpRequest setFHttpResponse:](self, "setFHttpResponse:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fOriginalThreadName](self, "fOriginalThreadName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  objc_msgSend(v4, "setName:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fUrl](self, "fUrl"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v5));
  -[NSHttpRequest setFActiveRequest:](self, "setFActiveRequest:", v6);

  -[NSHttpRequest willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[NSHttpRequest willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[NSHttpRequest setFFinished:](self, "setFFinished:", 1);
  -[NSHttpRequest setFExecuting:](self, "setFExecuting:", 0);
  -[NSHttpRequest didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[NSHttpRequest didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (void)start
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fBody](self, "fBody"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fBody](self, "fBody"));
    -[NSHttpRequest setContentLength:](self, "setContentLength:", objc_msgSend(v4, "length"));

  }
  if (-[NSHttpRequest isCancelled](self, "isCancelled"))
  {
    -[NSHttpRequest handleCancelled:](self, "handleCancelled:", 0);
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue"));
    -[NSHttpRequest startExecuting](self, "startExecuting");
    if (v5)
      -[NSHttpRequest main](self, "main");
    else
      +[NSThread detachNewThreadSelector:toTarget:withObject:](NSThread, "detachNewThreadSelector:toTarget:withObject:", "main", self, 0);

  }
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  id v13;

  if (-[NSHttpRequest isCancelled](self, "isCancelled"))
  {
    -[NSHttpRequest handleCancelled:](self, "handleCancelled:", 0);
  }
  else
  {
    -[NSHttpRequest setFHttpResponse:](self, "setFHttpResponse:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    -[NSHttpRequest setFOriginalThreadName:](self, "setFOriginalThreadName:", v3);

    v12 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fUrl](self, "fUrl"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HttpRequest@%@"), v12));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
    objc_msgSend(v5, "setName:", v4);

    v6 = objc_alloc((Class)NSURLConnection);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
    v13 = objc_msgSend(v6, "initWithRequest:delegate:startImmediately:", v7, self, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v13, "scheduleInRunLoop:forMode:", v8, NSRunLoopCommonModes);
    objc_msgSend(v13, "start");
    -[NSHttpRequest stopExecuting](self, "stopExecuting");
    do
    {
      if (-[NSHttpRequest fFinished](self, "fFinished"))
        break;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
      v10 = objc_msgSend(v8, "runMode:beforeDate:", NSDefaultRunLoopMode, v9);

    }
    while ((v10 & 1) != 0);

  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return -[NSHttpRequest fExecuting](self, "fExecuting");
}

- (void)setRequestType:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  objc_msgSend(v4, "setNetworkServiceType:", a3);

}

- (void)setCachePolicy:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  objc_msgSend(v4, "setCachePolicy:", a3);

}

- (void)setHttpMethod:(int)a3
{
  id v3;
  _BYTE v4[24];
  std::string v5;
  std::runtime_error v6;

  if (a3)
  {
    if (a3 != 1)
    {
      __cxa_allocate_exception(0x40uLL);
      sub_1000D5048(&v5, "Unknown http method");
      std::runtime_error::runtime_error(&v6, &v5);
      v6.__vftable = (std::runtime_error_vtbl *)&off_1003EF830;
      sub_10018D04C((uint64_t)v4);
      sub_1000F2F7C(&v6, (uint64_t)"-[NSHttpRequest setHttpMethod:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/purpleslam/common/http/NSHttpRequest.mm", 292, (uint64_t)v4);
    }
    v3 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
    objc_msgSend(v3, "setHTTPMethod:", CFSTR("GET"));
  }
  else
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
    objc_msgSend(v3, "setHTTPMethod:", CFSTR("POST"));
  }

}

- (void)setContentType:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", v5, CFSTR("Content-Type"));

}

- (void)setContentLength:(unint64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%zu"), a3));
  objc_msgSend(v5, "setValue:forHTTPHeaderField:", v4, CFSTR("Content-Length"));

}

- (void)setHttpHeaders:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  objc_msgSend(v4, "setAllHTTPHeaderFields:", v5);

}

- (void)addValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  objc_msgSend(v7, "addValue:forHTTPHeaderField:", v8, v6);

}

- (void)setHttpBody:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
  objc_msgSend(v4, "setHTTPBody:", v5);

  -[NSHttpRequest setContentLength:](self, "setContentLength:", objc_msgSend(v5, "length"));
}

- (void)setHttpBodyStream:(pair<NSInputStream *)
{
  NSInputStream *first;
  void *v5;

  first = a3.first;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest", a3.first, a3.second));
  objc_msgSend(v5, "setHTTPBodyStream:", first->super.super.isa);

  -[NSHttpRequest setContentLength:](self, "setContentLength:", first[1].super.super.isa);
}

- (void)setMultiPart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMultiPartInputStream *v7;
  id v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fBody](self, "fBody"));

  if (!v3)
  {
    v7 = objc_alloc_init(NSMultiPartInputStream);
    -[NSHttpRequest setFBody:](self, "setFBody:");

    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fActiveRequest](self, "fActiveRequest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fBody](self, "fBody"));
    objc_msgSend(v8, "setHTTPBodyStream:", v4);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fBody](self, "fBody"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boundary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"),
                     v5));
    -[NSHttpRequest setContentType:](self, "setContentType:", v6);

  }
}

- (void)addFormPart:(id)a3 withFilename:(id)a4 andPath:(const void *)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  -[NSHttpRequest setMultiPart](self, "setMultiPart");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fBody](self, "fBody"));
  objc_msgSend(v9, "addPart:withPath:andFilename:", v10, a5, v8);

}

- (void)addFormPart:(id)a3 withFilename:(id)a4 andDataStreams:(const void *)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  -[NSHttpRequest setMultiPart](self, "setMultiPart");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fBody](self, "fBody"));
  objc_msgSend(v9, "addPart:withData:andFilename:", v10, a5, v8);

}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20[2];
  char v21;
  std::string __p;

  v6 = a3;
  v7 = a4;
  -[NSHttpRequest startExecuting](self, "startExecuting");
  if (-[NSHttpRequest isCancelled](self, "isCancelled"))
  {
    -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v6);
  }
  else
  {
    v8 = objc_opt_class(NSHTTPURLResponse);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
    {
      sub_1000D5048(v20, "");
      sub_10023DBCC("Non-http response received", &__p);
      sub_100174738((uint64_t)v20, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v21 < 0)
        operator delete(v20[0]);
      sub_1000F2AE4((uint64_t)&v19);
    }
    -[NSHttpRequest setFHttpResponse:](self, "setFHttpResponse:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest onHeaders](self, "onHeaders"));
    v10 = v9 == 0;

    if (!v10)
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSHttpRequest onHeaders](self, "onHeaders"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fHttpResponse](self, "fHttpResponse"));
      ((void (**)(_QWORD, void *, std::string *))v11)[2](v11, v12, &__p);

      if (__p.__r_.__value_.__s.__data_[0])
        goto LABEL_6;
    }
    v13 = objc_alloc_init((Class)NSMutableData);
    -[NSHttpRequest setFReceivedData:](self, "setFReceivedData:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest onProgress](self, "onProgress"));
    LOBYTE(v13) = v14 == 0;

    if ((v13 & 1) != 0)
      goto LABEL_9;
    __p.__r_.__value_.__s.__data_[0] = 0;
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSHttpRequest onProgress](self, "onProgress"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fReceivedData](self, "fReceivedData"));
    v17 = objc_msgSend(v16, "length");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fHttpResponse](self, "fHttpResponse"));
    ((void (**)(_QWORD, id, id, std::string *))v15)[2](v15, v17, objc_msgSend(v18, "expectedContentLength"), &__p);

    if (__p.__r_.__value_.__s.__data_[0])
    {
LABEL_6:
      -[NSHttpRequest cancel](self, "cancel");
      -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v6);
    }
    else
    {
LABEL_9:
      -[NSHttpRequest stopExecuting](self, "stopExecuting");
    }
  }

}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v12;

  v9 = a3;
  -[NSHttpRequest startExecuting](self, "startExecuting");
  if (-[NSHttpRequest isCancelled](self, "isCancelled"))
  {
    -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v9);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest onUploadProgress](self, "onUploadProgress"));

    if (v10
      && (v12 = 0,
          v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSHttpRequest onUploadProgress](self, "onUploadProgress")), ((void (**)(_QWORD, int64_t, int64_t, char *))v11)[2](v11, a5, a6, &v12), v11, v12))
    {
      -[NSHttpRequest cancel](self, "cancel");
      -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v9);
    }
    else
    {
      -[NSHttpRequest stopExecuting](self, "stopExecuting");
    }
  }

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;
  void *v13;
  char v14;

  v6 = a3;
  v7 = a4;
  -[NSHttpRequest startExecuting](self, "startExecuting");
  if (-[NSHttpRequest isCancelled](self, "isCancelled"))
  {
    -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v6);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fReceivedData](self, "fReceivedData"));
    objc_msgSend(v8, "appendData:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest onProgress](self, "onProgress"));
    if (!v9)
      goto LABEL_6;
    v14 = 0;
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSHttpRequest onProgress](self, "onProgress"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fReceivedData](self, "fReceivedData"));
    v12 = objc_msgSend(v11, "length");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fHttpResponse](self, "fHttpResponse"));
    ((void (**)(_QWORD, id, id, char *))v10)[2](v10, v12, objc_msgSend(v13, "expectedContentLength"), &v14);

    if (v14)
    {
      -[NSHttpRequest cancel](self, "cancel");
      -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v6);
    }
    else
    {
LABEL_6:
      -[NSHttpRequest stopExecuting](self, "stopExecuting");
    }
  }

}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSHttpRequest startExecuting](self, "startExecuting");
  if (-[NSHttpRequest isCancelled](self, "isCancelled"))
  {
    -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v10);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest onError](self, "onError"));

    if (v7)
    {
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSHttpRequest onError](self, "onError"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fHttpResponse](self, "fHttpResponse"));
      ((void (**)(_QWORD, void *, id))v8)[2](v8, v9, v6);

    }
    -[NSHttpRequest handleCompleted](self, "handleCompleted");
  }

}

- (void)connectionDidFinishLoading:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[NSHttpRequest isCancelled](self, "isCancelled"))
  {
    -[NSHttpRequest handleCancelled:](self, "handleCancelled:", v8);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest onResponse](self, "onResponse"));

    if (v4)
    {
      v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSHttpRequest onResponse](self, "onResponse"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fHttpResponse](self, "fHttpResponse"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHttpRequest fReceivedData](self, "fReceivedData"));
      ((void (**)(_QWORD, void *, void *))v5)[2](v5, v6, v7);

    }
    -[NSHttpRequest handleCompleted](self, "handleCompleted");
  }

}

- (id)onResponse
{
  return self->_onResponse;
}

- (void)setOnResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)onProgress
{
  return self->_onProgress;
}

- (void)setOnProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)onUploadProgress
{
  return self->_onUploadProgress;
}

- (void)setOnUploadProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)onHeaders
{
  return self->_onHeaders;
}

- (void)setOnHeaders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)onError
{
  return self->_onError;
}

- (void)setOnError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)fUrl
{
  return self->_fUrl;
}

- (void)setFUrl:(id)a3
{
  objc_storeStrong((id *)&self->_fUrl, a3);
}

- (NSMutableURLRequest)fActiveRequest
{
  return self->_fActiveRequest;
}

- (void)setFActiveRequest:(id)a3
{
  objc_storeStrong((id *)&self->_fActiveRequest, a3);
}

- (NSMutableData)fReceivedData
{
  return self->_fReceivedData;
}

- (void)setFReceivedData:(id)a3
{
  objc_storeStrong((id *)&self->_fReceivedData, a3);
}

- (NSURLConnection)fUrlConnection
{
  return self->_fUrlConnection;
}

- (void)setFUrlConnection:(id)a3
{
  objc_storeStrong((id *)&self->_fUrlConnection, a3);
}

- (BOOL)fFinished
{
  return self->_fFinished;
}

- (void)setFFinished:(BOOL)a3
{
  self->_fFinished = a3;
}

- (BOOL)fExecuting
{
  return self->_fExecuting;
}

- (void)setFExecuting:(BOOL)a3
{
  self->_fExecuting = a3;
}

- (NSString)fOriginalThreadName
{
  return self->_fOriginalThreadName;
}

- (void)setFOriginalThreadName:(id)a3
{
  objc_storeStrong((id *)&self->_fOriginalThreadName, a3);
}

- (NSMultiPartInputStream)fBody
{
  return self->_fBody;
}

- (void)setFBody:(id)a3
{
  objc_storeStrong((id *)&self->_fBody, a3);
}

- (NSHTTPURLResponse)fHttpResponse
{
  return self->_fHttpResponse;
}

- (void)setFHttpResponse:(id)a3
{
  objc_storeStrong((id *)&self->_fHttpResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fHttpResponse, 0);
  objc_storeStrong((id *)&self->_fBody, 0);
  objc_storeStrong((id *)&self->_fOriginalThreadName, 0);
  objc_storeStrong((id *)&self->_fUrlConnection, 0);
  objc_storeStrong((id *)&self->_fReceivedData, 0);
  objc_storeStrong((id *)&self->_fActiveRequest, 0);
  objc_storeStrong((id *)&self->_fUrl, 0);
  objc_storeStrong(&self->_onError, 0);
  objc_storeStrong(&self->_onHeaders, 0);
  objc_storeStrong(&self->_onUploadProgress, 0);
  objc_storeStrong(&self->_onProgress, 0);
  objc_storeStrong(&self->_onResponse, 0);
}

@end
