@implementation SUScriptXMLHTTPStoreRequest

- (SUScriptXMLHTTPStoreRequest)initWithDelegate:(id)a3
{
  id v4;
  SUScriptXMLHTTPStoreRequest *v5;
  SUScriptXMLHTTPStoreRequest *v6;

  v4 = a3;
  v5 = -[SUScriptObject init](self, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_functions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_6);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptXMLHTTPStoreRequest;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

uint64_t __38__SUScriptXMLHTTPStoreRequest_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setThisObject:", 0);
}

- (void)abort
{
  SUXMLHTTPStoreRequestOperation *operation;
  NSString *responseText;
  NSString *statusText;
  SUXMLHTTPStoreRequestOperation *v6;
  SUXMLHTTPStoreRequestOperation *v7;

  -[SUScriptObject lock](self, "lock");
  v7 = self->_operation;
  operation = self->_operation;
  self->_operation = 0;

  self->_readyState = 4;
  responseText = self->_responseText;
  self->_responseText = 0;

  self->_shouldSendGUIDHeader = 0;
  self->_status = 0;
  statusText = self->_statusText;
  self->_statusText = 0;

  -[SUScriptObject unlock](self, "unlock");
  v6 = v7;
  if (v7)
  {
    -[SUXMLHTTPStoreRequestOperation cancel](v7, "cancel");
    -[SUScriptXMLHTTPStoreRequest _callFunctionWithName:arguments:](self, "_callFunctionWithName:arguments:", CFSTR("onreadystatechange"), 0);
    -[SUScriptXMLHTTPStoreRequest _callFunctionWithName:arguments:](self, "_callFunctionWithName:arguments:", CFSTR("onabort"), 0);
    -[SUScriptXMLHTTPStoreRequest _callFunctionWithName:arguments:](self, "_callFunctionWithName:arguments:", CFSTR("onloadend"), 0);
    v6 = v7;
  }

}

- (id)getAllResponseHeaders
{
  void *v3;
  NSDictionary *responseHeaders;
  id v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[4];

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptObject lock](self, "lock");
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  responseHeaders = self->_responseHeaders;
  v13[3] = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __52__SUScriptXMLHTTPStoreRequest_getAllResponseHeaders__block_invoke;
  v10 = &unk_24DE7BD68;
  v12 = v13;
  v5 = v3;
  v11 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](responseHeaders, "enumerateKeysAndObjectsUsingBlock:", &v7);
  -[SUScriptObject unlock](self, "unlock", v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
  return v5;
}

void __52__SUScriptXMLHTTPStoreRequest_getAllResponseHeaders__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\r\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(": "));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (id)getResponseHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    -[NSDictionary objectForKey:](self->_responseHeaders, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v6 = 0;
  }

  return v6;
}

- (void)openWithHTTPMethod:(id)a3 URL:(id)a4 isAsync:(id)a5 username:(id)a6 password:(id)a7
{
  id v9;
  id v10;
  void *v11;
  SSMutableURLRequestProperties *v12;
  SSMutableURLRequestProperties *requestProperties;
  id WeakRetained;
  char v15;
  id v16;
  uint64_t v17;
  id v18;

  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(v9, "uppercaseString");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!v18
      || (objc_msgSend(v18, "isEqualToString:", CFSTR("GET")) & 1) != 0
      || (objc_msgSend(v18, "isEqualToString:", CFSTR("POST")) & 1) != 0)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v10);
      v12 = (SSMutableURLRequestProperties *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F30]), "initWithURL:", v11);
      requestProperties = self->_requestProperties;
      self->_requestProperties = v12;

      -[SSMutableURLRequestProperties setITunesStoreRequest:](self->_requestProperties, "setITunesStoreRequest:", 1);
      if (v18)
        -[SSMutableURLRequestProperties setHTTPMethod:](self->_requestProperties, "setHTTPMethod:");
      if (self->_useJSONEncoding)
        -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](self->_requestProperties, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v16 = objc_loadWeakRetained((id *)&self->_delegate);
        v17 = objc_msgSend(v16, "scriptXMLHTTPStoreRequest:requiresCellularForURL:", self, v11);

        -[SSMutableURLRequestProperties setRequiresCellularDataNetwork:](self->_requestProperties, "setRequiresCellularDataNetwork:", v17);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    v18 = v9;
  }

}

- (void)sendWithBodyData:(id)a3
{
  id v4;
  SSMutableURLRequestProperties *requestProperties;
  unint64_t timeout;
  void *v7;
  SSMutableURLRequestProperties *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  id v19;
  void *v20;
  id *v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  int v26;
  id v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  SUXMLHTTPStoreRequestOperation *v32;
  SUXMLHTTPStoreRequestOperation *operation;
  SUXMLHTTPStoreRequestOperation *v34;
  void *v35;
  SUXMLHTTPStoreRequestOperation *v36;
  void *v37;
  SUXMLHTTPStoreRequestOperation *v38;
  void *v39;
  id *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v4 = 0;
  }
  -[SUScriptObject lock](self, "lock");
  if (!self->_operation)
  {
    requestProperties = self->_requestProperties;
    if (requestProperties)
    {
      timeout = self->_timeout;
      if (timeout)
        -[SSMutableURLRequestProperties setTimeoutInterval:](requestProperties, "setTimeoutInterval:", (double)timeout / 1000.0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "dataUsingEncoding:", 4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSMutableURLRequestProperties setHTTPBody:](self->_requestProperties, "setHTTPBody:", v7);

      }
      if (self->_shouldSendGUIDHeader)
      {
        v8 = self->_requestProperties;
        objc_msgSend(MEMORY[0x24BEC8B88], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "guid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](v8, "setValue:forHTTPHeaderField:", v10, *MEMORY[0x24BEB2508]);

      }
      objc_msgSend(MEMORY[0x24BDB4398], "ams_sharedAccountStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ams_activeiCloudAccount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "aida_accountForiCloudAccount:", v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (v42)
        {
          -[SUScriptXMLHTTPStoreRequest _gsTokenForAIDAAccount:accountStore:](self, "_gsTokenForAIDAAccount:accountStore:", v42, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](self->_requestProperties, "setValue:forHTTPHeaderField:", v13, *MEMORY[0x24BEB2558]);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "shouldLog");
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v24 = v23 | 2;
          else
            v24 = v23;
          objc_msgSend(v22, "OSLogObject");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            v26 = v24;
          else
            v26 = v24 & 2;
          if (v26)
          {
            LODWORD(location[0]) = 138412290;
            *(id *)((char *)location + 4) = (id)objc_opt_class();
            v27 = *(id *)((char *)location + 4);
            LODWORD(v41) = 12;
            v40 = location;
            v28 = (void *)_os_log_send_and_compose_impl();

            if (v28)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v28, 4, location, v41);
              v29 = (id *)objc_claimAutoreleasedReturnValue();
              free(v28);
              v40 = v29;
              SSFileLog();

            }
          }
          else
          {

          }
        }
        objc_msgSend(v12, "ams_altDSID", v40);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](self->_requestProperties, "setValue:forHTTPHeaderField:", v14, *MEMORY[0x24BEB2520]);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "shouldLog");
        if (objc_msgSend(v14, "shouldLogToDisk"))
          v16 = v15 | 2;
        else
          v16 = v15;
        objc_msgSend(v14, "OSLogObject");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          v18 = v16;
        else
          v18 = v16 & 2;
        if (v18)
        {
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = (id)objc_opt_class();
          v19 = *(id *)((char *)location + 4);
          LODWORD(v41) = 12;
          v40 = location;
          v20 = (void *)_os_log_send_and_compose_impl();

          if (v20)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v20, 4, location, v41);
            v21 = (id *)objc_claimAutoreleasedReturnValue();
            free(v20);
            v40 = v21;
            SSFileLog();

          }
        }
        else
        {

        }
      }

      -[SUScriptXMLHTTPStoreRequest _clientInfoHeader](self, "_clientInfoHeader");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
        -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](self->_requestProperties, "setValue:forHTTPHeaderField:", v30, *MEMORY[0x24BEB2578]);
      -[SUScriptXMLHTTPStoreRequest _uniqueDeviceID](self, "_uniqueDeviceID", v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        -[SSMutableURLRequestProperties setValue:forHTTPHeaderField:](self->_requestProperties, "setValue:forHTTPHeaderField:", v31, *MEMORY[0x24BEB2580]);
      v32 = -[SUXMLHTTPStoreRequestOperation initWithRequestProperties:]([SUXMLHTTPStoreRequestOperation alloc], "initWithRequestProperties:", self->_requestProperties);
      operation = self->_operation;
      self->_operation = v32;

      v34 = self->_operation;
      -[SUScriptXMLHTTPStoreRequest authenticationContext](self, "authenticationContext");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUXMLHTTPStoreRequestOperation setAuthenticationContext:](v34, "setAuthenticationContext:", v35);

      v36 = self->_operation;
      -[SUScriptXMLHTTPStoreRequest dataProvider](self, "dataProvider");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUXMLHTTPStoreRequestOperation setDataProvider:](v36, "setDataProvider:", v37);

      objc_initWeak(location, self);
      v38 = self->_operation;
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __48__SUScriptXMLHTTPStoreRequest_sendWithBodyData___block_invoke;
      v43[3] = &unk_24DE7BD90;
      objc_copyWeak(&v44, location);
      -[SUXMLHTTPStoreRequestOperation setOutputBlock:](v38, "setOutputBlock:", v43);
      objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "addOperation:", self->_operation);

      objc_destroyWeak(&v44);
      objc_destroyWeak(location);

    }
  }
  -[SUScriptObject unlock](self, "unlock");

}

void __48__SUScriptXMLHTTPStoreRequest_sendWithBodyData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  _QWORD *WeakRetained;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = objc_msgSend(v8, "statusCode");
    if (ISErrorIsEqual())
      v11 = 408;
    objc_msgSend(WeakRetained, "lock");
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
        v13 = (void *)WeakRetained[15];
        WeakRetained[15] = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v9, 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
          v15 = (void *)WeakRetained[15];
          WeakRetained[15] = v14;

        }
        else
        {
          v16 = v9;
          v13 = (void *)WeakRetained[15];
          WeakRetained[15] = v16;
        }
      }

    }
    v17 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;

    WeakRetained[12] = 4;
    WeakRetained[17] = v11;
    objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)WeakRetained[18];
    WeakRetained[18] = v18;

    objc_msgSend(WeakRetained, "unlock");
    objc_msgSend(WeakRetained, "_callFunctionWithName:arguments:", CFSTR("onreadystatechange"), 0);
    if ((unint64_t)(v11 - 200) >= 0x64)
      v20 = CFSTR("onerror");
    else
      v20 = CFSTR("onload");
    if (v11 == 408)
      v21 = CFSTR("ontimeout");
    else
      v21 = v20;
    objc_msgSend(WeakRetained, "_callFunctionWithName:arguments:", v21, 0);
    objc_msgSend(WeakRetained, "_callFunctionWithName:arguments:", CFSTR("onloadend"), 0);
  }

}

- (id)_className
{
  return CFSTR("iTunesXMLHTTPStoreRequest");
}

- (id)isJSONEncoded
{
  id *v3;
  id v4;

  -[SUScriptObject lock](self, "lock");
  if (self->_useJSONEncoding)
    v3 = (id *)MEMORY[0x24BDBD270];
  else
    v3 = (id *)MEMORY[0x24BDBD268];
  v4 = *v3;
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (WebScriptObject)onabort
{
  return (WebScriptObject *)-[SUScriptXMLHTTPStoreRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onabort"));
}

- (WebScriptObject)onerror
{
  return (WebScriptObject *)-[SUScriptXMLHTTPStoreRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onerror"));
}

- (WebScriptObject)onload
{
  return (WebScriptObject *)-[SUScriptXMLHTTPStoreRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onload"));
}

- (WebScriptObject)onloadend
{
  return (WebScriptObject *)-[SUScriptXMLHTTPStoreRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onloadend"));
}

- (WebScriptObject)onreadystatechange
{
  return (WebScriptObject *)-[SUScriptXMLHTTPStoreRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onreadystatechange"));
}

- (WebScriptObject)ontimeout
{
  return (WebScriptObject *)-[SUScriptXMLHTTPStoreRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("ontimeout"));
}

- (unint64_t)readyState
{
  unint64_t readyState;

  -[SUScriptObject lock](self, "lock");
  readyState = self->_readyState;
  -[SUScriptObject unlock](self, "unlock");
  return readyState;
}

- (NSString)responseText
{
  void *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)-[NSString copy](self->_responseText, "copy");
  -[SUScriptObject unlock](self, "unlock");
  return (NSString *)v3;
}

- (void)setJSONEncoded:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  -[SUScriptObject lock](self, "lock");
  v5 = objc_msgSend(v4, "BOOLValue");

  self->_useJSONEncoding = v5;
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setOnabort:(id)a3
{
  -[SUScriptXMLHTTPStoreRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onabort"));
}

- (void)setOnerror:(id)a3
{
  -[SUScriptXMLHTTPStoreRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onerror"));
}

- (void)setOnload:(id)a3
{
  -[SUScriptXMLHTTPStoreRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onload"));
}

- (void)setOnloadend:(id)a3
{
  -[SUScriptXMLHTTPStoreRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onloadend"));
}

- (void)setOnreadystatechange:(id)a3
{
  -[SUScriptXMLHTTPStoreRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onreadystatechange"));
}

- (void)setOntimeout:(id)a3
{
  -[SUScriptXMLHTTPStoreRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("ontimeout"));
}

- (void)setShouldSendGUIDHeader:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  -[SUScriptObject lock](self, "lock");
  v5 = objc_msgSend(v4, "BOOLValue");

  self->_shouldSendGUIDHeader = v5;
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setTimeout:(unint64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_timeout = a3;
  -[SUScriptObject unlock](self, "unlock");
}

- (id)shouldSendGUIDHeader
{
  id *v2;

  if (self->_shouldSendGUIDHeader)
    v2 = (id *)MEMORY[0x24BDBD270];
  else
    v2 = (id *)MEMORY[0x24BDBD268];
  return *v2;
}

- (unint64_t)status
{
  unint64_t status;

  -[SUScriptObject lock](self, "lock");
  status = self->_status;
  -[SUScriptObject unlock](self, "unlock");
  return status;
}

- (NSString)statusText
{
  void *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)-[NSString copy](self->_statusText, "copy");
  -[SUScriptObject unlock](self, "unlock");
  return (NSString *)v3;
}

- (unint64_t)timeout
{
  unint64_t timeout;

  -[SUScriptObject lock](self, "lock");
  timeout = self->_timeout;
  -[SUScriptObject unlock](self, "unlock");
  return timeout;
}

- (void)_callFunctionWithName:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SUScriptObject lock](self, "lock");
  -[NSMutableDictionary objectForKey:](self->_functions, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SUScriptObject unlock](self, "unlock");
  objc_msgSend(v8, "callWithArguments:", v6);

}

- (id)_clientInfoHeader
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE04958], "clientInfoHeader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      v5 &= 2u;
    if (v5)
    {
      LODWORD(v11) = 138543362;
      *(_QWORD *)((char *)&v11 + 4) = objc_opt_class();
      v7 = *(id *)((char *)&v11 + 4);
      LODWORD(v10) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_11:

        return v2;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v11, v10, v11);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog();
    }

    goto LABEL_11;
  }
  return v2;
}

- (id)_gsTokenForAIDAAccount:(id)a3 accountStore:(id)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE060A8];
  v18 = 0;
  objc_msgSend(a4, "credentialForAccount:serviceID:error:", a3, v5, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (!v7)
  {
    objc_msgSend(v6, "token");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v10 = v9 | 2;
  else
    v10 = v9;
  objc_msgSend(v8, "OSLogObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    v10 &= 2u;
  if (!v10)
    goto LABEL_10;
  v12 = (void *)objc_opt_class();
  v19 = 138543618;
  v20 = v12;
  v21 = 2114;
  v22 = v7;
  v13 = v12;
  LODWORD(v17) = 22;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v19, v17);
    v11 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog();
LABEL_10:

  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (id)_scriptObjectForFunctionName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUScriptObject lock](self, "lock");
  -[NSMutableDictionary objectForKey:](self->_functions, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "scriptObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptObject unlock](self, "unlock");

  return v6;
}

- (void)_setScriptObject:(id)a3 forFunctionName:(id)a4
{
  id v6;
  SUScriptFunction *v7;
  NSMutableDictionary *functions;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v11 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    if (v11)
    {
      v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v11);
      -[SUScriptFunction setThisObject:](v7, "setThisObject:", self);
      functions = self->_functions;
      if (!functions)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        v10 = self->_functions;
        self->_functions = v9;

        functions = self->_functions;
      }
      -[NSMutableDictionary setObject:forKey:](functions, "setObject:forKey:", v7, v6);
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_functions, "objectForKey:", v6);
      v7 = (SUScriptFunction *)objc_claimAutoreleasedReturnValue();
      -[SUScriptFunction setThisObject:](v7, "setThisObject:", 0);
      -[NSMutableDictionary removeObjectForKey:](self->_functions, "removeObjectForKey:", v6);
    }

    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }

}

- (id)_uniqueDeviceID
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE08118], "uniqueDeviceId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldLog");
    if (objc_msgSend(v3, "shouldLogToDisk"))
      v5 = v4 | 2;
    else
      v5 = v4;
    objc_msgSend(v3, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      v5 &= 2u;
    if (v5)
    {
      LODWORD(v11) = 138543362;
      *(_QWORD *)((char *)&v11 + 4) = objc_opt_class();
      v7 = *(id *)((char *)&v11 + 4);
      LODWORD(v10) = 12;
      v8 = (void *)_os_log_send_and_compose_impl();

      if (!v8)
      {
LABEL_11:

        return v2;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v11, v10, v11);
      v6 = objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog();
    }

    goto LABEL_11;
  }
  return v2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_4, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPStoreRequest;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_2, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPStoreRequest;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptXMLHTTPStoreRequest;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_4, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_2 = (uint64_t)sel_abort;
    *(_QWORD *)algn_255185F58 = CFSTR("abort");
    qword_255185F60 = (uint64_t)sel_getAllResponseHeaders;
    unk_255185F68 = CFSTR("getAllResponseHeaders");
    qword_255185F70 = (uint64_t)sel_getResponseHeader_;
    unk_255185F78 = CFSTR("getResponseHeader");
    qword_255185F80 = (uint64_t)sel_openWithHTTPMethod_URL_isAsync_username_password_;
    unk_255185F88 = CFSTR("open");
    qword_255185F90 = (uint64_t)sel_sendWithBodyData_;
    unk_255185F98 = CFSTR("send");
    qword_255185FA0 = (uint64_t)sel_setValue_forHTTPHeaderField_;
    unk_255185FA8 = CFSTR("setRequestHeader");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("isJSONEncoded"), CFSTR("JSONEncoded"), CFSTR("onabort"), CFSTR("onabort"), CFSTR("onerror"), CFSTR("onerror"), CFSTR("onload"), CFSTR("onload"), CFSTR("onloadend"), CFSTR("onloadend"), CFSTR("onreadystatechange"), CFSTR("onreadystatechange"), CFSTR("ontimeout"), CFSTR("ontimeout"), CFSTR("readyState"), CFSTR("readyState"), CFSTR("responseText"),
           CFSTR("responseText"),
           CFSTR("shouldSendGUIDHeader"),
           CFSTR("shouldSendGUIDHeader"),
           CFSTR("status"),
           CFSTR("status"),
           CFSTR("statusText"),
           CFSTR("statusText"),
           CFSTR("timeout"),
           CFSTR("timeout"),
           0);
    v3 = (void *)__KeyMapping_4;
    __KeyMapping_4 = v2;

  }
}

- (SUScriptXMLHTTPStoreRequestDelegate)delegate
{
  return (SUScriptXMLHTTPStoreRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SSAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationContext, a3);
}

- (ISDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
