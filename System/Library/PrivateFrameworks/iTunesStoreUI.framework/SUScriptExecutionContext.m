@implementation SUScriptExecutionContext

- (void)dealloc
{
  objc_super v3;

  -[ISStoreURLOperation setDelegate:](self->_loadOperation, "setDelegate:", 0);

  -[SUWebView setDelegate:](self->_webView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptExecutionContext;
  -[SUScriptExecutionContext dealloc](&v3, sel_dealloc);
}

- (BOOL)evaluateData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
  CFStringEncoding v11;
  uint64_t v12;
  void *v13;

  if (objc_msgSend(a4, "rangeOfString:options:", CFSTR("javascript"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(-[SUScriptExecutionContext _webView](self, "_webView"), "loadData:MIMEType:textEncodingName:baseURL:", a3, a4, a5, a6);
  }
  else
  {
    if (a5)
      v11 = CFStringConvertIANACharSetNameToEncoding((CFStringRef)a5);
    else
      v11 = 134217984;
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", a3, CFStringConvertEncodingToNSStringEncoding(v11));
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(-[SUScriptExecutionContext _webView](self, "_webView"), "stringByEvaluatingJavaScriptFromString:", v12);

    }
  }
  return 1;
}

- (void)callWebScriptMethod:(id)a3 withArguments:(id)a4
{
  WebThreadRun();
}

uint64_t __62__SUScriptExecutionContext_callWebScriptMethod_withArguments___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_webView"), "_browserView"), "webView"), "windowScriptObject"), "callWebScriptMethod:withArguments:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)evaluateScriptAtURL:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v7 &= 2u;
  if (v7)
  {
    v14 = 138412546;
    v15 = objc_opt_class();
    v16 = 2112;
    v17 = a3;
    LODWORD(v13) = 22;
    v12 = &v14;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v14, v13);
      free(v9);
      v12 = (int *)v10;
      SSFileLog();
    }
  }
  -[SUScriptExecutionContext _cancelLoadOperation](self, "_cancelLoadOperation", v12);
  self->_loadOperation = (ISStoreURLOperation *)-[SUScriptExecutionContext _newLoadOperation](self, "_newLoadOperation");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2008]), "initWithURL:", a3);
  -[ISStoreURLOperation setRequestProperties:](self->_loadOperation, "setRequestProperties:", v11);

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", self->_loadOperation);
}

- (void)evaluateScriptWithURLBagKey:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v7 &= 2u;
  if (v7)
  {
    v14 = 138412546;
    v15 = objc_opt_class();
    v16 = 2112;
    v17 = a3;
    LODWORD(v13) = 22;
    v12 = &v14;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v14, v13);
      free(v9);
      v12 = (int *)v10;
      SSFileLog();
    }
  }
  -[SUScriptExecutionContext _cancelLoadOperation](self, "_cancelLoadOperation", v12);
  self->_loadOperation = (ISStoreURLOperation *)-[SUScriptExecutionContext _newLoadOperation](self, "_newLoadOperation");
  v11 = objc_alloc_init(MEMORY[0x24BEB1F30]);
  objc_msgSend(v11, "setURLBagKey:", a3);
  -[ISStoreURLOperation setRequestProperties:](self->_loadOperation, "setRequestProperties:", v11);

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue"), "addOperation:", self->_loadOperation);
}

- (OpaqueJSContext)globalExecutionContext
{
  return (OpaqueJSContext *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[SUWebView _browserView](self->_webView, "_browserView"), "webView"), "mainFrame"), "globalContext");
}

- (id)windowScriptObject
{
  return -[SUWebView windowScriptObject](self->_webView, "windowScriptObject");
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig", a3, a4);
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v7 &= 2u;
  if (v7)
  {
    v13 = 138412290;
    v14 = objc_opt_class();
    LODWORD(v12) = 12;
    v11 = &v13;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v13, v12);
      free(v9);
      v11 = (int *)v10;
      SSFileLog();
    }
  }
  -[SUScriptExecutionContext _cancelLoadOperation](self, "_cancelLoadOperation", v11);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  void *v7;
  CFStringRef v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a4, "length"))
  {
    v7 = (void *)objc_msgSend(a3, "response");
    v8 = (CFStringRef)objc_msgSend(v7, "textEncodingName");
    if (!v8)
      v8 = CFStringConvertEncodingToIANACharSetName(0x8000100u);
    -[SUScriptExecutionContext evaluateData:MIMEType:textEncodingName:baseURL:](self, "evaluateData:MIMEType:textEncodingName:baseURL:", a4, objc_msgSend(v7, "MIMEType"), v8, objc_msgSend((id)objc_msgSend(a3, "response"), "URL"));
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      v17 = 138412290;
      v18 = objc_opt_class();
      LODWORD(v16) = 12;
      v15 = &v17;
      v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v17, v16);
        free(v13);
        v15 = (int *)v14;
        SSFileLog();
      }
    }
  }
  -[SUScriptExecutionContext _cancelLoadOperation](self, "_cancelLoadOperation", v15);
}

- (id)parentViewControllerForWebView:(id)a3
{
  id v3;
  void *v4;

  v3 = +[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController", a3);
  v4 = (void *)objc_msgSend(v3, "presentedViewController");
  if (!v4)
    v4 = (void *)objc_msgSend(v3, "selectedViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (void *)objc_msgSend(v4, "topViewController");
  if (v4)
    return v4;
  else
    return v3;
}

- (void)_cancelLoadOperation
{
  -[ISStoreURLOperation setDelegate:](self->_loadOperation, "setDelegate:", 0);
  -[ISStoreURLOperation cancel](self->_loadOperation, "cancel");

  self->_loadOperation = 0;
}

- (id)_newLoadOperation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BEC8C30]);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setShouldMessageMainThread:", 1);
  return v3;
}

- (id)_webView
{
  id result;
  SUWebView *v4;

  result = self->_webView;
  if (!result)
  {
    v4 = objc_alloc_init(SUWebView);
    self->_webView = v4;
    -[SUWebView setDelegate:](v4, "setDelegate:", self);
    return self->_webView;
  }
  return result;
}

@end
