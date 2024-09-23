@implementation QLPreviewParts

+ (Class)urlProtocolClass
{
  return (Class)objc_opt_class();
}

+ (void)registerPreview:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_sync_enter(v4);
  _log_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[QLPreviewParts registerPreview:].cold.1();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v4, "setRegisteredURLs:", v6);

  v7 = (void *)objc_msgSend((id)objc_msgSend(a1, "urlProtocolClass"), "newUniqueURLWithName:", 0);
  objc_msgSend(v4, "setPreviewURL:", v7);

  v8 = (void *)objc_msgSend(a1, "urlProtocolClass");
  objc_msgSend(v4, "previewURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerPreview:forPreviewURL:", v4, v9);

  objc_sync_exit(v4);
}

+ (void)unregisterPreview:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_sync_enter(v4);
  _log_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[QLPreviewParts unregisterPreview:].cold.1();

  v6 = (void *)objc_msgSend(a1, "urlProtocolClass");
  objc_msgSend(v4, "registeredURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterURLs:andPreviewURL:", v7, v8);

  objc_msgSend(v4, "setRegisteredURLs:", 0);
  objc_msgSend(v4, "setPreviewURL:", 0);
  objc_msgSend(v4, "setOutstandingURLs:", 0);
  objc_msgSend(v4, "setEncodingsForURLs:", 0);
  objc_sync_exit(v4);

}

+ (id)registeredPreviewForURL:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v4 = protocolQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__QLPreviewParts_registeredPreviewForURL___block_invoke;
  v8[3] = &unk_24C71B2A0;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __42__QLPreviewParts_registeredPreviewForURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)urlToPreviews, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)relativeStringForSafeURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/"), v7, CFSTR("x-apple-ql-magic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/"), v7, CFSTR("x-apple-ql-attachment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "hasPrefix:", v8);
  v12 = v8;
  if ((v11 & 1) != 0
    || (objc_msgSend(v10, "hasPrefix:", v9) & 1) == 0 && (v13 = objc_msgSend(v10, "hasPrefix:", v7), v12 = v7, v13))
  {
    objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v12, "length"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)QLPreviewParts;
  -[QLPreviewParts dealloc](&v2, sel_dealloc);
}

- (void)startComputingPreview
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__QLPreviewParts_startComputingPreview__block_invoke;
  block[3] = &unk_24C71AF10;
  block[4] = self;
  dispatch_async(v3, block);

}

void __39__QLPreviewParts_startComputingPreview__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x212BA2710]();
  objc_msgSend(*(id *)(a1 + 32), "computePreviewInThread");
  objc_autoreleasePoolPop(v2);
}

- (void)computePreviewInThread
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_20D4C7000, v1, OS_LOG_TYPE_ERROR, "Exception during preview computation of %@: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __40__QLPreviewParts_computePreviewInThread__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "outstandingURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDD1540]);
    v5 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1005, 0);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(WeakRetained, "outstandingURLs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v16;
      *(_QWORD *)&v8 = 138412290;
      v14 = v8;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          _log_2();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v14;
            v20 = v12;
            _os_log_impl(&dword_20D4C7000, v13, OS_LOG_TYPE_INFO, "Discarding loading of %@", buf, 0xCu);
          }

          objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "setError:forURL:", v5, v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v9);
    }

  }
  objc_msgSend(WeakRetained, "setOutstandingURLs:", 0, v14);
  objc_msgSend(WeakRetained, "setEncodingsForURLs:", 0);

}

- (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  NSMutableSet *registeredURLs;
  id v8;
  id v9;
  id v10;

  registeredURLs = self->_registeredURLs;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSMutableSet addObject:](registeredURLs, "addObject:", v10);
  objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "registerURL:mimeType:textEncoding:", v10, v9, v8);

}

- (void)startDataRepresentationWithMimeType:(id)a3 textEncoding:(id)a4
{
  __CFString *v6;
  QLPreviewParts *v7;
  void *v8;
  uint64_t v9;
  CFStringEncoding v10;
  NSMutableDictionary *encodingsForURLs;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = (__CFString *)a4;
  v7 = self;
  objc_sync_enter(v7);
  -[QLPreviewParts previewURL](v7, "previewURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = 134217984;
    if (v6)
    {
      v10 = CFStringConvertIANACharSetNameToEncoding(v6);
      if (v10 == -1)
        v9 = 134217984;
      else
        v9 = v10;
    }
    encodingsForURLs = v7->_encodingsForURLs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](encodingsForURLs, "setObject:forKey:", v12, v7->_previewURL);

    -[QLPreviewParts previewURL](v7, "previewURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewParts registerURL:mimeType:textEncoding:](v7, "registerURL:mimeType:textEncoding:", v13, v14, v6);

  }
  objc_sync_exit(v7);

}

- (void)startAttachmentWithURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v8;
  __CFString *v9;
  QLPreviewParts *v10;
  void *v11;
  uint64_t v12;
  CFStringEncoding v13;
  NSMutableDictionary *encodingsForURLs;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  v10 = self;
  objc_sync_enter(v10);
  -[QLPreviewParts previewURL](v10, "previewURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = 134217984;
    if (v9)
    {
      v13 = CFStringConvertIANACharSetNameToEncoding(v9);
      if (v13 == -1)
        v12 = 134217984;
      else
        v12 = v13;
    }
    encodingsForURLs = v10->_encodingsForURLs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](encodingsForURLs, "setObject:forKey:", v15, v16);

    -[NSMutableSet addObject:](v10->_outstandingURLs, "addObject:", v16);
    -[QLPreviewParts registerURL:mimeType:textEncoding:](v10, "registerURL:mimeType:textEncoding:", v16, v8, v9);
  }
  objc_sync_exit(v10);

}

- (BOOL)isRegisteredURL:(id)a3
{
  id v4;
  QLPreviewParts *v5;
  char v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[NSMutableSet containsObject:](v5->_registeredURLs, "containsObject:", v4);
  objc_sync_exit(v5);

  return v6;
}

- (id)newAttachmentURLWithID:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  QLPreviewParts *v12;
  void *v13;
  uint64_t v14;
  CFStringEncoding v15;
  NSMutableDictionary *encodingsForURLs;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "newUniqueURLWithName:", v8);
  v12 = self;
  objc_sync_enter(v12);
  -[QLPreviewParts previewURL](v12, "previewURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = 134217984;
    if (v10)
    {
      v15 = CFStringConvertIANACharSetNameToEncoding(v10);
      if (v15 == -1)
        v14 = 134217984;
      else
        v14 = v15;
    }
    encodingsForURLs = v12->_encodingsForURLs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](encodingsForURLs, "setObject:forKey:", v17, v11);

    -[NSMutableSet addObject:](v12->_outstandingURLs, "addObject:", v11);
    -[QLPreviewParts registerURL:mimeType:textEncoding:](v12, "registerURL:mimeType:textEncoding:", v11, v9, v10);
  }
  objc_sync_exit(v12);

  return v11;
}

- (id)newSafeAttachmentURLWithID:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  QLPreviewParts *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CFStringEncoding v17;
  NSMutableDictionary *encodingsForURLs;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  v11 = self;
  objc_sync_enter(v11);
  -[QLPreviewParts previewURL](v11, "previewURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend((id)objc_opt_class(), "urlProtocolClass");
    -[QLPreviewParts previewURL](v11, "previewURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "newURLWithContentID:baseURL:", v8, v14);
    v16 = 134217984;

    if (v10)
    {
      v17 = CFStringConvertIANACharSetNameToEncoding(v10);
      if (v17 == -1)
        v16 = 134217984;
      else
        v16 = v17;
    }
    encodingsForURLs = v11->_encodingsForURLs;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](encodingsForURLs, "setObject:forKey:", v19, v15);

    -[NSMutableSet addObject:](v11->_outstandingURLs, "addObject:", v15);
    -[QLPreviewParts registerURL:mimeType:textEncoding:](v11, "registerURL:mimeType:textEncoding:", v15, v9, v10);
    objc_sync_exit(v11);

  }
  else
  {
    objc_sync_exit(v11);

    v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "newUniqueURLWithName:", v8);
  }

  return v15;
}

- (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  QLPreviewParts *v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  -[QLPreviewParts previewURL](v9, "previewURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!v8)
    {
      -[QLPreviewParts previewURL](v9, "previewURL");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "appendData:forURL:lastChunk:", v11, v8, v5);
    if (v5)
      -[NSMutableSet removeObject:](v9->_outstandingURLs, "removeObject:", v8);
  }
  objc_sync_exit(v9);

}

- (NSURLRequest)previewRequest
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD1840]);
  -[QLPreviewParts previewURL](self, "previewURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:cachePolicy:timeoutInterval:", v4, 1, 20.0);

  return (NSURLRequest *)v5;
}

- (id)voidRequest
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDD1840]);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("about:"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithURL:", v3);

  return v4;
}

- (id)requestForURL:(id)a3
{
  id v3;
  id v5;
  QLPreviewParts *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[QLPreviewParts previewURL](v6, "previewURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16B0]), "initWithURL:", v5);
      objc_msgSend(v8, "setHTTPShouldHandleCookies:", 0);
      objc_msgSend(v8, "setMainDocumentURL:", v7);
    }
    else
    {
      -[QLPreviewParts voidRequest](v6, "voidRequest");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 0;
    }

    objc_sync_exit(v6);
    if (v7)
      v3 = v8;

  }
  else
  {
    -[QLPreviewParts voidRequest](self, "voidRequest");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (unsigned)cfEncodingForAttachmentURL:(id)a3
{
  id v4;
  QLPreviewParts *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[QLPreviewParts previewURL](v5, "previewURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v4)
    {
      -[QLPreviewParts previewURL](v5, "previewURL");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary objectForKey:](v5->_encodingsForURLs, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_sync_exit(v5);

  v8 = 134217984;
  if (v6 && v7)
    v8 = objc_msgSend(v7, "unsignedIntValue");

  return v8;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (void)setPreviewURL:(id)a3
{
  objc_storeStrong((id *)&self->_previewURL, a3);
}

- (NSMutableSet)outstandingURLs
{
  return self->_outstandingURLs;
}

- (void)setOutstandingURLs:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingURLs, a3);
}

- (NSMutableDictionary)encodingsForURLs
{
  return self->_encodingsForURLs;
}

- (void)setEncodingsForURLs:(id)a3
{
  objc_storeStrong((id *)&self->_encodingsForURLs, a3);
}

- (NSMutableSet)registeredURLs
{
  return self->_registeredURLs;
}

- (void)setRegisteredURLs:(id)a3
{
  objc_storeStrong((id *)&self->_registeredURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredURLs, 0);
  objc_storeStrong((id *)&self->_encodingsForURLs, 0);
  objc_storeStrong((id *)&self->_outstandingURLs, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
}

+ (void)registerPreview:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, v0, v1, "Registering preview parts %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)unregisterPreview:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, v0, v1, "Unregistering preview parts %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
