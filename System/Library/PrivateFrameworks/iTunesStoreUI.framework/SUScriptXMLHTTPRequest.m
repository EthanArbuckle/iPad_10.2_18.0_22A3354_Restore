@implementation SUScriptXMLHTTPRequest

- (SUScriptXMLHTTPRequest)initWithDelegate:(id)a3
{
  id v4;
  SUScriptXMLHTTPRequest *v5;
  SUScriptXMLHTTPRequest *v6;

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

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_functions, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptXMLHTTPRequest;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

uint64_t __33__SUScriptXMLHTTPRequest_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setThisObject:");
}

- (void)abort
{
  SUXMLHTTPRequestOperation *operation;
  NSString *responseText;
  NSString *statusText;
  SUXMLHTTPRequestOperation *v6;
  SUXMLHTTPRequestOperation *v7;

  -[SUScriptObject lock](self, "lock");
  v7 = self->_operation;
  operation = self->_operation;
  self->_operation = 0;

  self->_readyState = 4;
  responseText = self->_responseText;
  self->_responseText = 0;

  self->_status = 0;
  statusText = self->_statusText;
  self->_statusText = 0;

  -[SUScriptObject unlock](self, "unlock");
  v6 = v7;
  if (v7)
  {
    -[SUXMLHTTPRequestOperation cancel](v7, "cancel");
    -[SUScriptXMLHTTPRequest _callFunctionWithName:arguments:](self, "_callFunctionWithName:arguments:", CFSTR("onreadystatechange"), 0);
    -[SUScriptXMLHTTPRequest _callFunctionWithName:arguments:](self, "_callFunctionWithName:arguments:", CFSTR("onabort"), 0);
    -[SUScriptXMLHTTPRequest _callFunctionWithName:arguments:](self, "_callFunctionWithName:arguments:", CFSTR("onloadend"), 0);
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
  v9 = __47__SUScriptXMLHTTPRequest_getAllResponseHeaders__block_invoke;
  v10 = &unk_24DE7BD68;
  v12 = v13;
  v5 = v3;
  v11 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](responseHeaders, "enumerateKeysAndObjectsUsingBlock:", &v7);
  -[SUScriptObject unlock](self, "unlock", v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
  return v5;
}

void __47__SUScriptXMLHTTPRequest_getAllResponseHeaders__block_invoke(uint64_t a1, void *a2, void *a3)
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

      -[SSMutableURLRequestProperties setITunesStoreRequest:](self->_requestProperties, "setITunesStoreRequest:", 0);
      if (v18)
        -[SSMutableURLRequestProperties setHTTPMethod:](self->_requestProperties, "setHTTPMethod:");
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        v16 = objc_loadWeakRetained((id *)&self->_delegate);
        v17 = objc_msgSend(v16, "scriptXMLHTTPRequest:requiresCellularForURL:", self, v11);

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
  SUXMLHTTPRequestOperation *v8;
  SUXMLHTTPRequestOperation *operation;
  SUXMLHTTPRequestOperation *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *, void *, void *);
  void *v15;
  id v16;
  id location;

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
      v8 = -[SUXMLHTTPRequestOperation initWithRequestProperties:]([SUXMLHTTPRequestOperation alloc], "initWithRequestProperties:", self->_requestProperties);
      operation = self->_operation;
      self->_operation = v8;

      objc_initWeak(&location, self);
      v10 = self->_operation;
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __43__SUScriptXMLHTTPRequest_sendWithBodyData___block_invoke;
      v15 = &unk_24DE7C770;
      objc_copyWeak(&v16, &location);
      -[SUXMLHTTPRequestOperation setOutputBlock:](v10, "setOutputBlock:", &v12);
      objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addOperation:", self->_operation);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
  -[SUScriptObject unlock](self, "unlock");

}

void __43__SUScriptXMLHTTPRequest_sendWithBodyData___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  _QWORD *WeakRetained;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;

  v19 = a3;
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
      v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
      v13 = (void *)WeakRetained[15];
      WeakRetained[15] = v12;

    }
    v14 = (void *)WeakRetained[11];
    WeakRetained[11] = 0;

    WeakRetained[12] = 4;
    WeakRetained[16] = v11;
    objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)WeakRetained[17];
    WeakRetained[17] = v15;

    objc_msgSend(WeakRetained, "unlock");
    objc_msgSend(WeakRetained, "_callFunctionWithName:arguments:", CFSTR("onreadystatechange"), 0);
    if ((unint64_t)(v11 - 200) >= 0x64)
      v17 = CFSTR("onerror");
    else
      v17 = CFSTR("onload");
    if (v11 == 408)
      v18 = CFSTR("ontimeout");
    else
      v18 = v17;
    objc_msgSend(WeakRetained, "_callFunctionWithName:arguments:", v18, 0);
    objc_msgSend(WeakRetained, "_callFunctionWithName:arguments:", CFSTR("onloadend"), 0);
  }

}

- (id)_className
{
  return CFSTR("iTunesXMLHTTPRequest");
}

- (WebScriptObject)onabort
{
  return (WebScriptObject *)-[SUScriptXMLHTTPRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onabort"));
}

- (WebScriptObject)onerror
{
  return (WebScriptObject *)-[SUScriptXMLHTTPRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onerror"));
}

- (WebScriptObject)onload
{
  return (WebScriptObject *)-[SUScriptXMLHTTPRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onload"));
}

- (WebScriptObject)onloadend
{
  return (WebScriptObject *)-[SUScriptXMLHTTPRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onloadend"));
}

- (WebScriptObject)onreadystatechange
{
  return (WebScriptObject *)-[SUScriptXMLHTTPRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("onreadystatechange"));
}

- (WebScriptObject)ontimeout
{
  return (WebScriptObject *)-[SUScriptXMLHTTPRequest _scriptObjectForFunctionName:](self, "_scriptObjectForFunctionName:", CFSTR("ontimeout"));
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

- (void)setOnabort:(id)a3
{
  -[SUScriptXMLHTTPRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onabort"));
}

- (void)setOnerror:(id)a3
{
  -[SUScriptXMLHTTPRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onerror"));
}

- (void)setOnload:(id)a3
{
  -[SUScriptXMLHTTPRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onload"));
}

- (void)setOnloadend:(id)a3
{
  -[SUScriptXMLHTTPRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onloadend"));
}

- (void)setOnreadystatechange:(id)a3
{
  -[SUScriptXMLHTTPRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("onreadystatechange"));
}

- (void)setOntimeout:(id)a3
{
  -[SUScriptXMLHTTPRequest _setScriptObject:forFunctionName:](self, "_setScriptObject:forFunctionName:", a3, CFSTR("ontimeout"));
}

- (void)setTimeout:(unint64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  self->_timeout = a3;
  -[SUScriptObject unlock](self, "unlock");
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

  v6 = a3;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    -[SUScriptObject lock](self, "lock");
LABEL_4:
    -[NSMutableDictionary objectForKey:](self->_functions, "objectForKey:", v11);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setThisObject:", 0);
    -[NSMutableDictionary removeObjectForKey:](self->_functions, "removeObjectForKey:", v11);
    goto LABEL_5;
  }
  -[SUScriptObject lock](self, "lock");
  if (!v6)
    goto LABEL_4;
  v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v6);
  -[SUScriptFunction setThisObject:](v7, "setThisObject:", self);
  functions = self->_functions;
  if (!functions)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = self->_functions;
    self->_functions = v9;

    functions = self->_functions;
  }
  -[NSMutableDictionary setObject:forKey:](functions, "setObject:forKey:", v7, v11);

LABEL_5:
  -[SUScriptObject unlock](self, "unlock");

}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_26, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPRequest;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_21, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptXMLHTTPRequest;
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
  v5.super_class = (Class)SUScriptXMLHTTPRequest;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_26, "allKeys");
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
    __SelectorMapping_21 = (uint64_t)sel_abort;
    unk_2551864A0 = CFSTR("abort");
    qword_2551864A8 = (uint64_t)sel_getAllResponseHeaders;
    unk_2551864B0 = CFSTR("getAllResponseHeaders");
    qword_2551864B8 = (uint64_t)sel_getResponseHeader_;
    unk_2551864C0 = CFSTR("getResponseHeader");
    qword_2551864C8 = (uint64_t)sel_openWithHTTPMethod_URL_isAsync_username_password_;
    unk_2551864D0 = CFSTR("open");
    qword_2551864D8 = (uint64_t)sel_sendWithBodyData_;
    unk_2551864E0 = CFSTR("send");
    qword_2551864E8 = (uint64_t)sel_setValue_forHTTPHeaderField_;
    unk_2551864F0 = CFSTR("setRequestHeader");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("onabort"), CFSTR("onerror"), CFSTR("onerror"), CFSTR("onload"), CFSTR("onload"), CFSTR("onloadend"), CFSTR("onloadend"), CFSTR("onreadystatechange"), CFSTR("onreadystatechange"), CFSTR("ontimeout"), CFSTR("ontimeout"), CFSTR("readyState"), CFSTR("readyState"), CFSTR("responseText"), CFSTR("responseText"), CFSTR("status"), CFSTR("status"),
           CFSTR("statusText"),
           CFSTR("statusText"),
           CFSTR("timeout"),
           CFSTR("timeout"),
           0);
    v3 = (void *)__KeyMapping_26;
    __KeyMapping_26 = v2;

  }
}

- (SUScriptXMLHTTPRequestDelegate)delegate
{
  return (SUScriptXMLHTTPRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_responseHeaders, 0);
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_operation, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
