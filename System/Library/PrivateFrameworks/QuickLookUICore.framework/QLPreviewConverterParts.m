@implementation QLPreviewConverterParts

+ (Class)urlProtocolClass
{
  return (Class)objc_opt_class();
}

- (void)setDelegate:(id)a3
{
  id *p_delegate;
  id WeakRetained;
  QLPreviewConverterParts *v6;
  id obj;

  obj = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (WeakRetained != obj)
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_storeWeak(p_delegate, obj);
    objc_sync_exit(v6);

  }
}

+ (void)registerPreview:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void **v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_sync_enter(v3);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v3, "setRegisteredURLs:", v4);

  objc_msgSend(v3, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[QLPreviewURLProtocol newUniqueURLWithName:](QLPreviewConverterURLProtocol, "newUniqueURLWithName:", v5);
  objc_msgSend(v3, "setPreviewURL:", v6);

  v7 = (void **)MEMORY[0x1E0D83678];
  v8 = (void *)*MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "previewURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_DEFAULT, "%@ #Conversion", (uint8_t *)&v12, 0xCu);

  }
  +[QLPreviewConverterURLProtocol registerPreview:](QLPreviewConverterURLProtocol, "registerPreview:", v3);
  objc_sync_exit(v3);

}

+ (void)unregisterPreview:(id)a3
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (NSObject **)MEMORY[0x1E0D83678];
  v5 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v3, "previewURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1D936E000, v6, OS_LOG_TYPE_DEFAULT, "%@ #Conversion", (uint8_t *)&v12, 0xCu);

  }
  v9 = v3;
  objc_sync_enter(v9);
  objc_msgSend(v9, "registeredURLs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[QLPreviewConverterURLProtocol unregisterURLs:andPreview:](QLPreviewConverterURLProtocol, "unregisterURLs:andPreview:", v10, v9);

  objc_msgSend(v9, "setRegisteredURLs:", 0);
  objc_msgSend(v9, "setPreviewURL:", 0);
  v11 = (void *)v9[15];
  v9[15] = 0;

  objc_sync_exit(v9);
}

- (void)dealloc
{
  NSThread *delegateCallbackThread;
  NSError *mainError;
  objc_super v5;

  -[QLPreviewConverterParts setUrl:](self, "setUrl:", 0);
  -[QLPreviewConverterParts setData:](self, "setData:", 0);
  -[QLPreviewConverterParts setFileName:](self, "setFileName:", 0);
  -[QLPreviewConverterParts setUti:](self, "setUti:", 0);
  -[QLPreviewConverterParts setPassword:](self, "setPassword:", 0);
  -[QLPreviewConverterParts setConnection:](self, "setConnection:", 0);
  -[QLPreviewConverterParts setDelegate:](self, "setDelegate:", 0);
  delegateCallbackThread = self->delegateCallbackThread;
  self->delegateCallbackThread = 0;

  mainError = self->mainError;
  self->mainError = 0;

  v5.receiver = self;
  v5.super_class = (Class)QLPreviewConverterParts;
  -[QLPreviewParts dealloc](&v5, sel_dealloc);
}

- (void)cancel
{
  self->cancelled = 1;
}

- (id)safeRequestForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  QLPreviewConverterParts *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isFileURL"))
  {
    objc_msgSend(v4, "HTTPMethod");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("get")))
    {
      -[QLPreviewParts voidRequest](self, "voidRequest");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      goto LABEL_14;
    }
    objc_msgSend(v5, "scheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isEqual:", CFSTR("about")))
    {
      v11 = v4;
    }
    else
    {
      if ((objc_msgSend(v10, "isEqual:", CFSTR("applewebdata")) & 1) == 0
        && !objc_msgSend(v10, "isEqual:", CFSTR("data")))
      {
        v13 = self;
        objc_sync_enter(v13);
        -[QLPreviewParts previewURL](v13, "previewURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_21;
        -[QLPreviewParts previewURL](v13, "previewURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v5, "isEqual:", v15);

        if ((v16 & 1) != 0)
          goto LABEL_17;
        if (!objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "isSafeRequest:", v4))goto LABEL_21;
        objc_msgSend(v5, "host");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewParts previewURL](v13, "previewURL");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "host");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "isEqual:", v20);

        if ((v21 & 1) != 0
          || (-[QLPreviewParts registeredURLs](v13, "registeredURLs"),
              v22 = (void *)objc_claimAutoreleasedReturnValue(),
              v23 = objc_msgSend(v22, "containsObject:", v5),
              v22,
              (v23 & 1) != 0))
        {
LABEL_17:
          v17 = v4;
        }
        else
        {
LABEL_21:
          -[QLPreviewParts voidRequest](v13, "voidRequest");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v6 = v17;
        objc_sync_exit(v13);

        goto LABEL_12;
      }
      -[QLPreviewParts requestForURL:](self, "requestForURL:", v5);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v11;
LABEL_12:

    goto LABEL_13;
  }
  -[QLPreviewParts voidRequest](self, "voidRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v6;
}

- (void)startComputingPreview
{
  NSThread *v3;
  NSThread *delegateCallbackThread;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (NSThread *)objc_claimAutoreleasedReturnValue();
  delegateCallbackThread = self->delegateCallbackThread;
  self->delegateCallbackThread = v3;

  v5.receiver = self;
  v5.super_class = (Class)QLPreviewConverterParts;
  -[QLPreviewParts startComputingPreview](&v5, sel_startComputingPreview);
}

- (void)computePreviewInThread
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  QLPreviewConverterParts *v11;
  NSData *data;
  void *v13;
  NSObject *v14;
  NSURL *url;
  NSURL *v16;
  char v17;
  NSURL *v18;
  NSObject *v19;
  NSURL *v20;
  _BOOL4 v21;
  QLPreviewConverterParts *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSError *mainError;
  NSError *v31;
  NSError *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  NSError *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  int v47;
  NSError *v48;
  NSError *v49;
  id WeakRetained;
  char v51;
  QLThreadInvoker *v52;
  NSThread *delegateCallbackThread;
  id v54;
  QLPreviewConverterParts *obj;
  id obja;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  NSURL *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[QLPreviewParts setOutstandingURLs:](self, "setOutstandingURLs:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[QLPreviewParts setEncodingsForURLs:](self, "setEncodingsForURLs:", v4);

  obj = self;
  objc_sync_enter(obj);
  -[QLPreviewParts previewURL](obj, "previewURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[QLPreviewParts setOutstandingURLs:](obj, "setOutstandingURLs:", 0);
    -[QLPreviewParts setEncodingsForURLs:](obj, "setEncodingsForURLs:", 0);
    objc_sync_exit(obj);

    return;
  }
  -[QLPreviewParts outstandingURLs](obj, "outstandingURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewParts previewURL](obj, "previewURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_sync_exit(obj);
  v8 = (NSObject **)MEMORY[0x1E0D83678];
  v9 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_DEFAULT, "will compute preview #Conversion", buf, 2u);
  }
  if (!-[QLPreviewConverterParts isCancelled](obj, "isCancelled"))
    -[QLPreviewConverterParts computePreview](obj, "computePreview");
  v10 = *v8;
  if (!*v8)
  {
    QLSInitLogging();
    v10 = *v8;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v10, OS_LOG_TYPE_DEFAULT, "did compute preview #Conversion", buf, 2u);
  }
  v11 = obj;
  data = obj->_data;
  if (data)
  {
    obj->_data = 0;

    v11 = obj;
  }
  if (v11->_url && v11->_shouldRemoveURLAfterGeneration)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *v8;
    if (!*v8)
    {
      QLSInitLogging();
      v14 = *v8;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      url = obj->_url;
      *(_DWORD *)buf = 138412290;
      v64 = url;
      _os_log_impl(&dword_1D936E000, v14, OS_LOG_TYPE_DEFAULT, "Deleting temporary file created for the conversion %@. #Conversion", buf, 0xCu);
    }
    v16 = obj->_url;
    v61 = 0;
    v17 = objc_msgSend(v13, "removeItemAtURL:error:", v16, &v61);
    v18 = (NSURL *)v61;
    if ((v17 & 1) == 0)
    {
      v19 = *v8;
      if (!*v8)
      {
        QLSInitLogging();
        v19 = *v8;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v64 = v18;
        _os_log_impl(&dword_1D936E000, v19, OS_LOG_TYPE_DEFAULT, "Problem deleting the temporary file for the preview converter (%@) #Conversion", buf, 0xCu);
      }
    }
    v20 = obj->_url;
    obj->_url = 0;

    v11 = obj;
  }
  v21 = -[QLPreviewConverterParts htmlErrorDisabled](v11, "htmlErrorDisabled");
  v22 = obj;
  objc_sync_enter(v22);
  -[QLPreviewParts registeredURLs](v22, "registeredURLs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLPreviewParts previewURL](v22, "previewURL");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "containsObject:", v24);

  v26 = v21 | v25;
  if (-[NSError code](v22->mainError, "code") == 4)
  {
    -[NSError domain](v22->mainError, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("QuickLookErrorDomain"));

    objc_sync_exit(v22);
    if (((v26 | v28) & 1) != 0)
      goto LABEL_39;
LABEL_31:
    v29 = *v8;
    if (!*v8)
    {
      QLSInitLogging();
      v29 = *v8;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v29, OS_LOG_TYPE_DEFAULT, "Preview failed #Conversion", buf, 2u);
    }
    mainError = v22->mainError;
    if (mainError)
    {
      v31 = mainError;
    }
    else
    {
      +[QLPreviewConverterURLProtocol _errorForNoPreview](QLPreviewConverterURLProtocol, "_errorForNoPreview");
      v31 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    v32 = v31;
    -[NSError localizedDescription](v31, "localizedDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSError localizedRecoverySuggestion](v32, "localizedRecoverySuggestion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<html><meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, maximum-scale=1.6\"><style type=\"text/css\"> div {font-family: Arial;font-size: 18;}</style><body><div align=\"center\"><br><b>%@</b></div><br><div align=\"center\">%@</div></body></html>"),
      v33,
      v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("text/html"), CFSTR("MimeType"), CFSTR("UTF-8"), CFSTR("TextEncoding"), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC518], "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts startDataRepresentationWithContentType:properties:](v22, "startDataRepresentationWithContentType:properties:", v37, v36);

    objc_msgSend(v35, "dataUsingEncoding:", 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts appendData:forURL:lastChunk:](v22, "appendData:forURL:lastChunk:", v38, 0, 0);

    goto LABEL_39;
  }
  objc_sync_exit(v22);

  if ((v26 & 1) == 0)
    goto LABEL_31;
LABEL_39:
  -[QLPreviewParts outstandingURLs](v22, "outstandingURLs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count") == 0;

  if (!v40)
  {
    +[QLPreviewConverterURLProtocol _errorForNoPreview](QLPreviewConverterURLProtocol, "_errorForNoPreview");
    v41 = (NSError *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[QLPreviewParts outstandingURLs](v22, "outstandingURLs");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v58 != v43)
            objc_enumerationMutation(obja);
          v45 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
          -[QLPreviewParts previewURL](v22, "previewURL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v45, "isEqual:", v46);

          if (v47)
          {
            v48 = v22->mainError;
            if (!v48)
              v48 = v41;
            v49 = v48;
            +[QLPreviewURLProtocol setError:forURL:](QLPreviewConverterURLProtocol, "setError:forURL:", v49, v45);
            WeakRetained = objc_loadWeakRetained(&v22->_delegate);
            v51 = objc_opt_respondsToSelector();

            if ((v51 & 1) != 0)
            {
              v52 = -[QLThreadInvoker initWithConnection:data:error:]([QLThreadInvoker alloc], "initWithConnection:data:error:", v22->_connection, 0, v49);
              delegateCallbackThread = v22->delegateCallbackThread;
              v54 = objc_loadWeakRetained(&v22->_delegate);
              -[QLThreadInvoker performSelector:onThread:withObject:waitUntilDone:](v52, "performSelector:onThread:withObject:waitUntilDone:", sel_connectionDidFailWithError_, delegateCallbackThread, v54, 0);

            }
          }
          else
          {
            +[QLPreviewURLProtocol setError:forURL:](QLPreviewConverterURLProtocol, "setError:forURL:", v41, v45);
          }
        }
        v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v42);
    }

  }
  -[QLPreviewParts setOutstandingURLs:](v22, "setOutstandingURLs:", 0);
  -[QLPreviewParts setEncodingsForURLs:](v22, "setEncodingsForURLs:", 0);
  if (!-[QLPreviewConverterParts isCancelled](v22, "isCancelled"))
    v22->computed = 1;
}

- (BOOL)isCancelled
{
  BOOL v2;
  void *v3;

  if (self->cancelled)
    return 1;
  -[QLPreviewParts previewURL](self, "previewURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 == 0;

  return v2;
}

- (BOOL)isComputed
{
  return self->computed;
}

- (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v8;
  id v9;
  NSURLResponse *previewResponse;
  void *v11;
  int v12;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLPreviewConverterParts;
  -[QLPreviewParts registerURL:mimeType:textEncoding:](&v13, sel_registerURL_mimeType_textEncoding_, v8, v9, a5);
  previewResponse = self->previewResponse;
  if (previewResponse)
  {
    -[NSURLResponse URL](previewResponse, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v8);

    if (v12)
      -[NSURLResponse _setMIMEType:](self->previewResponse, "_setMIMEType:", v9);
  }

}

- (void)startDataRepresentationWithContentType:(id)a3 properties:(id)a4
{
  id v6;
  NSObject **v7;
  NSObject *v8;
  QLPreviewConverterParts *v9;
  void *v10;
  uint64_t v11;
  CFStringEncoding v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  float v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  __CFString *theString;
  void *v40;
  uint64_t v41;
  QLPreviewConverterParts *obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v6 = a4;
  v7 = (NSObject **)MEMORY[0x1E0D83678];
  v8 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v38;
    v50 = 2112;
    v51 = v6;
    _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_DEFAULT, "contentType = %@, properties = %@ #Conversion", buf, 0x16u);
  }
  v40 = v6;
  v9 = self;
  objc_sync_enter(v9);
  obj = v9;
  -[QLPreviewParts previewURL](v9, "previewURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v10 == 0;

  if ((v9 & 1) == 0)
  {
    v11 = 134217984;
    if (!v6)
    {
      v37 = 0;
      theString = 0;
      goto LABEL_24;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("TextEncoding"));
    theString = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (theString)
    {
      v12 = CFStringConvertIANACharSetNameToEncoding(theString);
      if (v12 == -1)
        v11 = 134217984;
      else
        v11 = v12;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("MimeType"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("HTMLPageCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      obj->_pageCount = (int)objc_msgSend(v13, "intValue");
    objc_msgSend(v6, "objectForKey:", CFSTR("Width"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "floatValue");
    }
    else
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("HTMLWidth"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      if (!v17)
      {
LABEL_19:
        objc_msgSend(v6, "objectForKey:", CFSTR("Height"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v18, "floatValue");
LABEL_23:
          obj->_pageHeight = v19;

          goto LABEL_24;
        }
        objc_msgSend(v6, "objectForKey:", CFSTR("HTMLHeight"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v20;
        if (v20)
        {
          objc_msgSend(v20, "floatValue");
          goto LABEL_23;
        }
LABEL_24:
        -[QLPreviewParts encodingsForURLs](obj, "encodingsForURLs");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewParts previewURL](obj, "previewURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v22, v23);

        -[QLPreviewParts previewURL](obj, "previewURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewConverterParts registerURL:mimeType:textEncoding:](obj, "registerURL:mimeType:textEncoding:", v24, v37, theString);

        objc_msgSend(v6, "objectForKey:", CFSTR("Attachments"));
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        if (v26)
        {
          v41 = *(_QWORD *)v44;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v44 != v41)
                objc_enumerationMutation(v25);
              v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v25, "objectForKey:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("MimeType"));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("TextEncoding"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("AttachmentData"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)MEMORY[0x1E0C99E98];
              -[QLPreviewParts previewURL](obj, "previewURL");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "URLWithString:relativeToURL:", v28, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "absoluteURL");
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              if (v36)
              {
                -[QLPreviewConverterParts registerURL:mimeType:textEncoding:](obj, "registerURL:mimeType:textEncoding:", v36, v30, v31);
                +[QLPreviewURLProtocol appendData:forURL:lastChunk:](QLPreviewConverterURLProtocol, "appendData:forURL:lastChunk:", v32, v36, 1);
              }

            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          }
          while (v26);
        }

        goto LABEL_34;
      }
      objc_msgSend(v17, "floatValue");
    }
    obj->_pageWidth = v16;
    goto LABEL_19;
  }
LABEL_34:
  objc_sync_exit(obj);

}

- (id)newAttachmentURLWithID:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", CFSTR("TextEncoding"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("MimeType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[QLPreviewParts newAttachmentURLWithID:mimeType:textEncoding:](self, "newAttachmentURLWithID:mimeType:textEncoding:", v7, v9, v8);
  return v10;
}

- (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  QLPreviewConverterParts *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  id WeakRetained;
  char **v21;
  QLThreadInvoker *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (NSObject **)MEMORY[0x1E0D83678];
  v11 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v9, "description");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = &stru_1E9EFCB88;
    if (v5)
      v15 = CFSTR("(last chunk)");
    v23 = 138412546;
    v24 = v13;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_DEFAULT, "%@ %@ #Conversion", (uint8_t *)&v23, 0x16u);

  }
  v16 = self;
  objc_sync_enter(v16);
  -[QLPreviewParts previewURL](v16, "previewURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    v19 = (uint64_t)v9;
    if (!v9)
    {
      -[QLPreviewParts previewURL](v16, "previewURL");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    WeakRetained = objc_loadWeakRetained(&v16->_delegate);
    objc_sync_exit(v16);

    +[QLPreviewURLProtocol appendData:forURL:lastChunk:](QLPreviewConverterURLProtocol, "appendData:forURL:lastChunk:", v8, v19, v5);
    if (v9)
    {
      if (!v5)
        goto LABEL_24;
LABEL_22:
      -[QLPreviewParts outstandingURLs](v16, "outstandingURLs");
      v16 = (QLPreviewConverterParts *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewConverterParts removeObject:](v16, "removeObject:", v19);
      v9 = (id)v19;
      goto LABEL_23;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = &selRef_connectionDidReceiveDataLengthReceived_;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:
        if (!v5)
        {
LABEL_24:
          v9 = (id)v19;
          goto LABEL_25;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "performSelector:onThread:withObject:waitUntilDone:", sel_connectionDidFinishLoading_, v16->delegateCallbackThread, v16->_connection, 0);
        goto LABEL_22;
      }
      v21 = &selRef_connectionDidReceiveData_;
    }
    v22 = -[QLThreadInvoker initWithConnection:data:error:]([QLThreadInvoker alloc], "initWithConnection:data:error:", v16->_connection, v8, 0);
    -[QLThreadInvoker performSelector:onThread:withObject:waitUntilDone:](v22, "performSelector:onThread:withObject:waitUntilDone:", *v21, v16->delegateCallbackThread, WeakRetained, 0);

    goto LABEL_19;
  }
  objc_sync_exit(v16);
  WeakRetained = 0;
LABEL_23:

LABEL_25:
}

- (void)setError:(id)a3
{
  NSError *v4;
  NSError *mainError;
  QLPreviewConverterParts *obj;

  v4 = (NSError *)a3;
  obj = self;
  objc_sync_enter(obj);
  mainError = obj->mainError;
  obj->mainError = v4;

  objc_sync_exit(obj);
}

- (id)previewRequest
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB39E0]);
  -[QLPreviewParts previewURL](self, "previewURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithURL:cachePolicy:timeoutInterval:", v4, 1, 300.0);

  return v5;
}

- (NSURLResponse)previewResponse
{
  NSURLResponse *previewResponse;
  void *v4;
  __CFString *v5;
  id v6;
  void *v7;
  NSURLResponse *v8;
  NSURLResponse *v9;

  previewResponse = self->previewResponse;
  if (!previewResponse)
  {
    -[QLPreviewParts previewURL](self, "previewURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[QLPreviewURLProtocol mimeTypeForAttachmentURL:](QLPreviewConverterURLProtocol, "mimeTypeForAttachmentURL:", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      v5 = CFSTR("text/html");
    v6 = objc_alloc(MEMORY[0x1E0CB39E8]);
    -[QLPreviewParts previewURL](self, "previewURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSURLResponse *)objc_msgSend(v6, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v7, v5, -1, CFSTR("UTF-8"));
    v9 = self->previewResponse;
    self->previewResponse = v8;

    previewResponse = self->previewResponse;
  }
  return previewResponse;
}

- (id)mimeTypeForAttachmentURL:(id)a3
{
  return +[QLPreviewURLProtocol mimeTypeForAttachmentURL:](QLPreviewConverterURLProtocol, "mimeTypeForAttachmentURL:", a3);
}

- (NSURLConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (float)pageWidth
{
  return self->_pageWidth;
}

- (float)pageHeight
{
  return self->_pageHeight;
}

- (BOOL)htmlErrorDisabled
{
  return self->htmlErrorDisabled;
}

- (void)setHtmlErrorDisabled:(BOOL)a3
{
  self->htmlErrorDisabled = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
  objc_storeStrong((id *)&self->_uti, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (BOOL)progressive
{
  return self->_progressive;
}

- (void)setProgressive:(BOOL)a3
{
  self->_progressive = a3;
}

- (BOOL)shouldRemoveURLAfterGeneration
{
  return self->_shouldRemoveURLAfterGeneration;
}

- (void)setShouldRemoveURLAfterGeneration:(BOOL)a3
{
  self->_shouldRemoveURLAfterGeneration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->mainError, 0);
  objc_storeStrong((id *)&self->delegateCallbackThread, 0);
  objc_storeStrong((id *)&self->previewResponse, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
