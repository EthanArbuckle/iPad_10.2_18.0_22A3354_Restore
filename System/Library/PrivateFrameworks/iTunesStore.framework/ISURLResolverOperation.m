@implementation ISURLResolverOperation

- (ISURLResolverOperation)initWithURL:(id)a3
{
  id v4;
  ISURLResolverOperation *v5;
  uint64_t v6;
  NSURL *url;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ISURLResolverOperation;
  v5 = -[ISOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

  }
  return v5;
}

- (void)dealloc
{
  __CFHost *host;
  objc_super v4;

  host = self->_host;
  if (host)
    CFRelease(host);
  v4.receiver = self;
  v4.super_class = (Class)ISURLResolverOperation;
  -[ISURLResolverOperation dealloc](&v4, sel_dealloc);
}

- (NSArray)resolvedAddresses
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  Boolean hasBeenResolved;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  hasBeenResolved = 0;
  CFHostGetAddressing(self->_host, &hasBeenResolved);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (hasBeenResolved)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "copy", (_QWORD)v11);
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSArray)resolvedAddressStrings
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16[1025];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ISURLResolverOperation resolvedAddresses](self, "resolvedAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i));
          if (getnameinfo((const sockaddr *)objc_msgSend(v9, "bytes", (_QWORD)v12), objc_msgSend(v9, "length"), v16, 0x401u, 0, 0, 2))
          {

            v3 = 0;
            goto LABEL_12;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)setUrl:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *url;

  v4 = a3;
  -[ISOperation lock](self, "lock");
  v5 = (NSURL *)objc_msgSend(v4, "copy");

  url = self->_url;
  self->_url = v5;

  -[ISOperation unlock](self, "unlock");
}

- (id)url
{
  void *v3;

  -[ISOperation lock](self, "lock");
  v3 = (void *)-[NSURL copy](self->_url, "copy");
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)run
{
  void *v3;
  void *v4;
  id v5;

  +[ISNetworkObserver sharedInstance](ISNetworkObserver, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUsingNetwork");
  -[ISURLResolverOperation url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[ISURLResolverOperation _runLookupForHostname:](self, "_runLookupForHostname:", v4);

  objc_msgSend(v5, "endUsingNetwork");
}

- (void)_resolutionCompletedWithError:(id)a3
{
  id v4;
  void *v5;
  __CFRunLoop *v6;

  v4 = a3;
  -[ISOperation stopRunLoop](self, "stopRunLoop");
  -[ISOperation operationRunLoop](self, "operationRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFRunLoop *)objc_msgSend(v5, "getCFRunLoop");

  CFHostSetClient(self->_host, 0, 0);
  CFHostUnscheduleFromRunLoop(self->_host, v6, (CFStringRef)*MEMORY[0x24BDBD5A0]);
  CFHostCancelInfoResolution(self->_host, kCFHostAddresses);
  -[ISOperation setError:](self, "setError:", v4);

  -[ISOperation setSuccess:](self, "setSuccess:", v4 == 0);
}

- (void)_runLookupForHostname:(id)a3
{
  __CFHost *v4;
  void *v5;
  __CFRunLoop *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _WORD v16[8];
  CFStreamError error;
  CFHostClientContext clientContext;

  clientContext.version = 0;
  memset(&clientContext.retain, 0, 24);
  clientContext.info = self;
  error.domain = 0;
  *(_QWORD *)&error.error = 0;
  v4 = CFHostCreateWithName((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)a3);
  self->_host = v4;
  if (!CFHostSetClient(v4, (CFHostClientCallBack)_HostResolutionCallback, &clientContext))
  {
LABEL_16:
    ISError();
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  -[ISOperation operationRunLoop](self, "operationRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFRunLoop *)objc_msgSend(v5, "getCFRunLoop");

  CFHostScheduleWithRunLoop(self->_host, v6, (CFStringRef)*MEMORY[0x24BDBD5A0]);
  if (CFHostStartInfoResolution(self->_host, kCFHostAddresses, &error))
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      v11 = v9;
    else
      v11 = v9 & 2;
    if (v11)
    {
      v16[0] = 0;
      LODWORD(v15) = 2;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, v16, v15);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog();
    }

LABEL_15:
    -[ISOperation runRunLoopUntilStopped](self, "runRunLoopUntilStopped");
    if (!-[ISURLResolverOperation isCancelled](self, "isCancelled"))
      return;
    goto LABEL_16;
  }
  _errorForStreamError(&error);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_18:
  v14 = (void *)v13;
  if (v13)
  {
    -[ISURLResolverOperation _resolutionCompletedWithError:](self, "_resolutionCompletedWithError:", v13);

  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
