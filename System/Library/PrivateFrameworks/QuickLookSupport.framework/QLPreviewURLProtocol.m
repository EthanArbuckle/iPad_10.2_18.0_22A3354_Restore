@implementation QLPreviewURLProtocol

+ (void)initialize
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;

  if ((id)objc_opt_class() == a1)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = (void *)urlToPreviews;
    urlToPreviews = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = (void *)urlToAttachmentData;
    urlToAttachmentData = (uint64_t)v5;

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = (void *)urlToProtocols;
    urlToProtocols = (uint64_t)v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = (void *)urlToAttachmentDescriptions;
    urlToAttachmentDescriptions = (uint64_t)v9;

    objc_msgSend(MEMORY[0x24BDD1830], "registerClass:", a1);
    v11 = dispatch_queue_create("quicklook.urlloading", 0);
    v12 = (void *)protocolQueue;
    protocolQueue = (uint64_t)v11;

  }
}

+ (id)newUniqueURLWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "URLPathAllowedCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "protocolScheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@://%@/%@/%@"), v10, v6, CFSTR("x-apple-ql-magic"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "protocolScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@://%@/%@/"), v8, v6, CFSTR("x-apple-ql-magic"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)newURLWithContentID:(id)a3 baseURL:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  CFURLRef v14;

  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "URLPathAllowedCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "protocolScheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFStringCreateWithFormat(0, 0, CFSTR("%@://%@/%@/%@"), v12, v11, CFSTR("x-apple-ql-attachment"), v10);

  v14 = CFURLCreateWithString(0, v13, 0);
  CFRelease(v13);

  return v14;
}

+ (void)registerPreview:(id)a3 forPreviewURL:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hash");
  v7 = protocolQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke;
  v10[3] = &unk_24C71AF38;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

uint64_t __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke(uint64_t a1)
{
  NSObject *v2;

  _log_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke_cold_1();

  return objc_msgSend((id)urlToPreviews, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = protocolQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke;
  block[3] = &unk_24C71B380;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_sync(v10, block);

}

void __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  _log_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke_cold_1();

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = v3;
  v5 = a1[5];
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mimeType"));
  v6 = a1[6];
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("textEncoding"));
  v21 = v4;
  objc_msgSend((id)urlToAttachmentDescriptions, "setObject:forKey:", v4, a1[4]);
  objc_msgSend((id)urlToProtocols, "objectForKey:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        objc_msgSend(v12, "client");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _log_2();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v16 = a1[4];
          v17 = (const __CFString *)a1[5];
          if (!v17)
            v17 = CFSTR("unknown");
          v18 = (const __CFString *)a1[6];
          if (!v18)
            v18 = CFSTR("unknown");
          *(_DWORD *)buf = 138412802;
          v27 = v16;
          v28 = 2112;
          v29 = v17;
          v30 = 2112;
          v31 = v18;
          _os_log_debug_impl(&dword_20D4C7000, v14, OS_LOG_TYPE_DEBUG, "Will send response for %@ of type %@ - %@", buf, 0x20u);
        }

        v15 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1848]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", a1[4], a1[5], -1, a1[6]);
        objc_msgSend(v13, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", v12, v15, 2);

        ++v11;
      }
      while (v9 != v11);
      v19 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      v9 = v19;
    }
    while (v19);
  }
  v20 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend((id)urlToAttachmentData, "setObject:forKey:", v20, a1[4]);

}

+ (id)_errorForAbort
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)_errorForAbort_result;
  if (!_errorForAbort_result)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1540]);
    v4 = objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1008, 0);
    v5 = (void *)_errorForAbort_result;
    _errorForAbort_result = v4;

    v2 = (void *)_errorForAbort_result;
  }
  return v2;
}

+ (id)_errorForCancel
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)_errorForCancel_result;
  if (!_errorForCancel_result)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1540]);
    v4 = objc_msgSend(v3, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -999, 0);
    v5 = (void *)_errorForCancel_result;
    _errorForCancel_result = v4;

    v2 = (void *)_errorForCancel_result;
  }
  return v2;
}

+ (void)_unregisterURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _log_2();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[QLPreviewURLProtocol _unregisterURL:].cold.1();

  objc_msgSend((id)urlToProtocols, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v18;
    *(_QWORD *)&v8 = 138412546;
    v16 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "client", v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _log_2();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v16;
          v22 = v12;
          v23 = 2112;
          v24 = v4;
          _os_log_debug_impl(&dword_20D4C7000, v14, OS_LOG_TYPE_DEBUG, "Aborting %@ loading %@", buf, 0x16u);
        }

        objc_msgSend(a1, "_errorForAbort");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URLProtocol:didFailWithError:", v12, v15);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v9);
  }
  objc_msgSend((id)urlToProtocols, "removeObjectForKey:", v4);
  objc_msgSend((id)urlToAttachmentData, "removeObjectForKey:", v4);
  objc_msgSend((id)urlToAttachmentDescriptions, "removeObjectForKey:", v4);

}

+ (void)unregisterURLs:(id)a3 andPreviewURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = protocolQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke;
  block[3] = &unk_24C71B3A8;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

uint64_t __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 48), "_unregisterURL:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++), (_QWORD)v9);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  _log_2();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke_cold_1();

  return objc_msgSend((id)urlToPreviews, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

+ (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  BOOL v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "hash");
  v9 = protocolQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__QLPreviewURLProtocol_appendData_forURL_lastChunk___block_invoke;
  block[3] = &unk_24C71B3D0;
  v13 = v8;
  v14 = v7;
  v15 = a5;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

void __52__QLPreviewURLProtocol_appendData_forURL_lastChunk___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)urlToProtocols, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v22;
    *(_QWORD *)&v4 = 134218498;
    v20 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_msgSend(v8, "client", v20);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);
        if (v10 && objc_msgSend(v10, "length"))
        {
          _log_2();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v14 = objc_msgSend(*(id *)(a1 + 40), "length");
            v15 = *(_QWORD *)(a1 + 32);
            v16 = "(last chunk)";
            if (!*(_BYTE *)(a1 + 48))
              v16 = "";
            *(_DWORD *)buf = v20;
            v26 = v14;
            v27 = 2112;
            v28 = v15;
            v29 = 2080;
            v30 = v16;
            _os_log_debug_impl(&dword_20D4C7000, v11, OS_LOG_TYPE_DEBUG, "Appending %lu bytes for %@%s", buf, 0x20u);
          }

          objc_msgSend(v9, "URLProtocol:didLoadData:", v8, *(_QWORD *)(a1 + 40));
        }
        if (*(_BYTE *)(a1 + 48))
        {
          _log_2();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v13 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v26 = v13;
            _os_log_debug_impl(&dword_20D4C7000, v12, OS_LOG_TYPE_DEBUG, "Finishing load of %@", buf, 0xCu);
          }

          objc_msgSend(v9, "URLProtocolDidFinishLoading:", v8);
        }

        ++v7;
      }
      while (v5 != v7);
      v17 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
      v5 = v17;
    }
    while (v17);
  }
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend((id)urlToProtocols, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend((id)urlToAttachmentData, "objectForKey:", *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "appendData:", *(_QWORD *)(a1 + 40));

  }
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend((id)urlToAttachmentDescriptions, "objectForKey:", *(_QWORD *)(a1 + 32));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", *MEMORY[0x24BDBD270], CFSTR("complete"));

  }
}

+ (void)setError:(id)a3 forURL:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hash");
  v7 = protocolQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __40__QLPreviewURLProtocol_setError_forURL___block_invoke;
  v10[3] = &unk_24C71AF38;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __40__QLPreviewURLProtocol_setError_forURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)urlToProtocols, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138412802;
    v14 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "client", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _log_2();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v12 = *(_QWORD *)(a1 + 32);
          v11 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = v14;
          v20 = v11;
          v21 = 2112;
          v22 = v8;
          v23 = 2112;
          v24 = v12;
          _os_log_debug_impl(&dword_20D4C7000, v10, OS_LOG_TYPE_DEBUG, "Notifying %@ for %@ loading %@", buf, 0x20u);
        }

        objc_msgSend(v9, "URLProtocol:didFailWithError:", v8, *(_QWORD *)(a1 + 40));
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    }
    while (v5);
  }
  objc_msgSend((id)urlToProtocols, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  objc_msgSend((id)urlToAttachmentDescriptions, "objectForKey:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", *MEMORY[0x24BDBD270], CFSTR("complete"));
  objc_msgSend(v13, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("error"));

}

+ (id)errorForURL:(id)a3
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
  v8[2] = __36__QLPreviewURLProtocol_errorForURL___block_invoke;
  v8[3] = &unk_24C71B3F8;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __36__QLPreviewURLProtocol_errorForURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend((id)urlToAttachmentDescriptions, "objectForKey:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)startLoadingProtocol:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  v6 = protocolQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke;
  v9[3] = &unk_24C71AF38;
  v10 = v3;
  v11 = v5;
  v7 = v5;
  v8 = v3;
  dispatch_async(v6, v9);

}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;

  _log_2();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_8();

  v3 = (_QWORD *)(a1 + 40);
  objc_msgSend((id)urlToAttachmentDescriptions, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("error"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)urlToAttachmentData, "objectForKey:", *v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 && (!v7 || !objc_msgSend(v7, "length")))
      goto LABEL_15;
    _log_2();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_7(a1 + 40, v4);

    v10 = objc_allocWithZone(MEMORY[0x24BDD1848]);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "objectForKey:", CFSTR("mimeType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("textEncoding"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v10, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v11, v12, -1, v13);

    objc_msgSend(v5, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", *(_QWORD *)(a1 + 32), v14, 2);
    if (v8 && objc_msgSend(v8, "length"))
    {
      _log_2();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_6(v8, a1 + 40, v15);

      objc_msgSend(v5, "URLProtocol:didLoadData:", *(_QWORD *)(a1 + 32), v8);
    }

    if (v6)
    {
LABEL_15:
      _log_2();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_5();

      objc_msgSend(v5, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v6);
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("complete"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)*MEMORY[0x24BDBD270];

    _log_2();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (v17 != v18)
    {
      if (v20)
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_4();

LABEL_26:
      objc_msgSend((id)urlToProtocols, "objectForKey:", *v3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        objc_msgSend((id)urlToProtocols, "setObject:forKey:", v6, *v3);
      }
      objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 32));
      goto LABEL_35;
    }
    if (v20)
      __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_3();

    objc_msgSend(v5, "URLProtocolDidFinishLoading:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend((id)urlToPreviews, "objectForKey:", *v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    _log_2();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v22)
        __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_2();

      objc_msgSend(v6, "startComputingPreview");
      goto LABEL_26;
    }
    if (v22)
      __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_1();

    v23 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryWithObjectsAndKeys:", v24, *MEMORY[0x24BDD1320], 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1308], -1008, v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLProtocol:didFailWithError:", *(_QWORD *)(a1 + 32), v25);

  }
LABEL_35:

}

+ (void)stopLoadingProtocol:(id)a3 isCancel:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  BOOL v16;

  v6 = a3;
  objc_msgSend(v6, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hash");
  v9 = protocolQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke;
  v12[3] = &unk_24C71B420;
  v16 = a4;
  v13 = v8;
  v14 = v6;
  v15 = a1;
  v10 = v6;
  v11 = v8;
  dispatch_async(v9, v12);

}

void __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend((id)urlToPreviews, "objectForKey:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend((id)urlToAttachmentDescriptions, "objectForKey:", *(_QWORD *)(a1 + 32));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKey:", CFSTR("complete"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)*MEMORY[0x24BDBD268];

      if (v4 == v5)
        objc_msgSend(v2, "cancel");

    }
  }
  v6 = (_QWORD *)(a1 + 32);
  objc_msgSend((id)urlToProtocols, "objectForKey:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (_QWORD *)(a1 + 40);
    if (objc_msgSend(v7, "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 40), "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(a1 + 48);
      if (*(_BYTE *)(a1 + 56))
        objc_msgSend(v11, "_errorForCancel");
      else
        objc_msgSend(v11, "_errorForAbort");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLProtocol:didFailWithError:", v12, v13);

      objc_msgSend(v8, "removeObject:", *v9);
      if (!objc_msgSend(v8, "count"))
        objc_msgSend((id)urlToProtocols, "removeObjectForKey:", *v6);
      _log_2();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke_cold_1();

    }
  }

}

+ (void)stopLoadingProtocol:(id)a3
{
  objc_msgSend(a1, "stopLoadingProtocol:isCancel:", a3, 0);
}

+ (void)cancelLoadingProtocol:(id)a3
{
  objc_msgSend(a1, "stopLoadingProtocol:isCancel:", a3, 1);
}

+ (void)_dumpPendingProtocols
{
  dispatch_async((dispatch_queue_t)protocolQueue, &__block_literal_global_3);
}

void __45__QLPreviewURLProtocol__dumpPendingProtocols__block_invoke()
{
  NSObject *v0;

  _log_2();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __45__QLPreviewURLProtocol__dumpPendingProtocols__block_invoke_cold_1(v0);

}

+ (id)protocolScheme
{
  return CFSTR("x-apple-ql-id2");
}

+ (BOOL)isSafeURL:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "protocolScheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "caseInsensitiveCompare:", v4) == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isSafeRequest:(id)a3
{
  void *v4;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isSafeURL:", v4);

  return (char)a1;
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;

  v4 = a3;
  v5 = objc_msgSend(a1, "isSafeRequest:", v4);
  _log_2();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[QLPreviewURLProtocol canInitWithRequest:].cold.1(v4);

  return v5;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  _log_2();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[QLPreviewURLProtocol canonicalRequestForRequest:].cold.1(v3, v4);

  return v3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  _log_2();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "URL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URL");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = "NO";
    v16 = 138412802;
    v17 = v12;
    if (v9)
      v15 = "YES";
    v18 = 2112;
    v19 = v13;
    v20 = 2080;
    v21 = v15;
    _os_log_debug_impl(&dword_20D4C7000, v10, OS_LOG_TYPE_DEBUG, "Testing cache equivalent %@ vs. %@: %s", (uint8_t *)&v16, 0x20u);

  }
  return v9;
}

+ (id)mimeTypeForAttachmentURL:(id)a3
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
  v8[2] = __49__QLPreviewURLProtocol_mimeTypeForAttachmentURL___block_invoke;
  v8[3] = &unk_24C71B3F8;
  v9 = v3;
  v10 = &v11;
  v5 = v3;
  dispatch_sync(v4, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __49__QLPreviewURLProtocol_mimeTypeForAttachmentURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)urlToAttachmentDescriptions, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("mimeType"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)startLoading
{
  objc_msgSend((id)objc_opt_class(), "startLoadingProtocol:", self);
}

- (void)stopLoading
{
  objc_msgSend((id)objc_opt_class(), "stopLoadingProtocol:", self);
}

void __54__QLPreviewURLProtocol_registerPreview_forPreviewURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_20D4C7000, v0, v1, "Registering %@ at url %@", v2);
  OUTLINED_FUNCTION_2();
}

void __58__QLPreviewURLProtocol_registerURL_mimeType_textEncoding___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, v0, v1, "Registering %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_unregisterURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, v0, v1, "Unregistering %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__QLPreviewURLProtocol_unregisterURLs_andPreviewURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_20D4C7000, v0, (uint64_t)v0, "Unregistering preview url %@ and URLs %@", v1);
  OUTLINED_FUNCTION_2();
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, v0, v1, "  No resource available at %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_20D4C7000, v0, (uint64_t)v0, "  Starting computing %@ (url: %@)", v1);
  OUTLINED_FUNCTION_2();
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, v0, v1, "  Resource at %@ is already complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_1(&dword_20D4C7000, v0, v1, "  Resource at %@ is not yet complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  OUTLINED_FUNCTION_10(*MEMORY[0x24BDAC8D0]);
  v3 = 138412546;
  v4 = v0;
  v5 = 2112;
  v6 = v1;
  OUTLINED_FUNCTION_3_0(&dword_20D4C7000, v2, (uint64_t)v2, "  Found resource at %@ with error %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_6(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "length");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(&dword_20D4C7000, a3, v4, "  Already have %lu bytes for %@", v5);
  OUTLINED_FUNCTION_1_0();
}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a2, "objectForKey:", CFSTR("mimeType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "objectForKey:", CFSTR("textEncoding"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_20D4C7000, v5, v6, "  Found resource at %@ of type %@ - %@", v7, v8, v9, v10, 2u);

}

void __45__QLPreviewURLProtocol_startLoadingProtocol___block_invoke_cold_8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_1_1(&dword_20D4C7000, v2, v3, "Starting load of <%@ %p> for %@", v4, v5, v6, v7, v8);

}

void __53__QLPreviewURLProtocol_stopLoadingProtocol_isCancel___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_4(v0);
  OUTLINED_FUNCTION_1_1(&dword_20D4C7000, v2, v3, "Stopping load of <%@ %p> for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

void __45__QLPreviewURLProtocol__dumpPendingProtocols__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)urlToProtocols, "count");
  objc_msgSend((id)urlToProtocols, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v2;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_3_0(&dword_20D4C7000, a1, v5, "%ld URLs for protocols remaining:\n%@", (uint8_t *)&v6);

}

+ (void)canInitWithRequest:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mainDocumentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_20D4C7000, v4, v5, "Will support request %@ (%@): %s", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_8();
}

+ (void)canonicalRequestForRequest:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_20D4C7000, a2, OS_LOG_TYPE_DEBUG, "Asked for canonical request for %@", v4, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

@end
