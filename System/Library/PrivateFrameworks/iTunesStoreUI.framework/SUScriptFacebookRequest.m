@implementation SUScriptFacebookRequest

- (SUScriptFacebookRequest)initWithURL:(id)a3 requestMethod:(id)a4
{
  SUScriptFacebookRequest *v6;
  SUScriptFacebookRequest *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SUScriptFacebookRequest;
  v6 = -[SUScriptObject init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = -[SUScriptFacebookRequest requestMethodGet](v6, "requestMethodGet");
    if (objc_msgSend(a4, "caseInsensitiveCompare:", CFSTR("POST")))
    {
      if (objc_msgSend(a4, "caseInsensitiveCompare:", CFSTR("DELETE")))
      {
LABEL_7:
        v10 = objc_alloc((Class)ISWeakLinkedClassForString());
        v7->_request = (SLRequest *)objc_msgSend(v10, "initWithServiceType:URL:parameters:requestMethod:", ISWeakLinkedStringConstantForString(), a3, 0, v8);
        v7->_requestMethod = v8;
        v7->_url = (NSURL *)objc_msgSend(a3, "copy");
        return v7;
      }
      v9 = -[SUScriptFacebookRequest requestMethodDelete](v7, "requestMethodDelete");
    }
    else
    {
      v9 = -[SUScriptFacebookRequest requestMethodPost](v7, "requestMethodPost");
    }
    v8 = v9;
    goto LABEL_7;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptFacebookRequest;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (SUScriptAppleAccount)account
{
  SUScriptAppleAccount *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_scriptAccount;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesFacebookRequest");
}

- (int64_t)requestMethod
{
  int64_t requestMethod;

  -[SUScriptObject lock](self, "lock");
  requestMethod = self->_requestMethod;
  -[SUScriptObject unlock](self, "unlock");
  return requestMethod;
}

- (void)setAccount:(id)a3
{
  SUScriptAppleAccount *v5;
  char isKindOfClass;
  SUScriptAppleAccount *scriptAccount;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v5 = (SUScriptAppleAccount *)a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  scriptAccount = self->_scriptAccount;
  if (scriptAccount != v5)
  {

    self->_scriptAccount = v5;
  }
  -[SLRequest setAccount:](self->_request, "setAccount:", -[SUScriptAppleAccount nativeAccount](v5, "nativeAccount"));
  -[SUScriptObject unlock](self, "unlock");
}

- (NSURL)URL
{
  NSURL *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_url;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)addMultiPartData:(id)a3 withName:(id)a4 type:(id)a5
{
  uint64_t v9;
  void *v10;
  NSData *v11;
  NSData *v12;
  id v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    return;
  }
  if (objc_msgSend(a5, "hasPrefix:", CFSTR("text/")))
  {
    v9 = objc_msgSend(a3, "dataUsingEncoding:", 4);
    -[SUScriptObject lock](self, "lock");
    -[SLRequest addMultipartData:withName:type:filename:](self->_request, "addMultipartData:withName:type:filename:", v9, a4, a5, 0);
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a3);
  if (v10)
  {
    v13 = v10;
    if (objc_msgSend((id)objc_msgSend(v10, "scheme"), "caseInsensitiveCompare:", CFSTR("data")))
    {
      if (!objc_msgSend(v13, "host"))
      {
LABEL_15:

        return;
      }
      v11 = -[WebResource data](-[WebDataSource subresourceForURL:](-[WebFrame dataSource](-[SUScriptObject webFrame](self, "webFrame"), "dataSource"), "subresourceForURL:", v13), "data");
    }
    else
    {
      v11 = (NSData *)SUGetDataForDataURL((uint64_t)v13, 0);
    }
    v12 = v11;
    if (v11)
    {
      -[SUScriptObject lock](self, "lock");
      -[SLRequest addMultipartData:withName:type:filename:](self->_request, "addMultipartData:withName:type:filename:", v12, a4, a5, 0);
      -[SUScriptObject unlock](self, "unlock");
    }
    goto LABEL_15;
  }
}

- (void)addParameterWithKey:(id)a3 value:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a4 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    -[SUScriptObject lock](self, "lock");
    -[SLRequest setParameterValue:forKey:](self->_request, "setParameterValue:forKey:", a4, a3);
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)performRequestWithFunction:(id)a3
{
  SUScriptFunction *v5;
  SLRequest *v6;
  SUScriptFacebookResponse *v7;
  uint64_t v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", a3);
    -[SUScriptFunction setThisObject:](v5, "setThisObject:", self);
    v8 = 0;
    if (-[SUScriptFacebookRequest _isRequestAllowed:](self, "_isRequestAllowed:", &v8))
    {
      -[SUScriptObject lock](self, "lock");
      v6 = self->_request;
      -[SUScriptObject unlock](self, "unlock");
      -[SUScriptFacebookRequest _performRequest:withScriptFunction:](self, "_performRequest:withScriptFunction:", v6, v5);
    }
    else
    {
      v7 = [SUScriptFacebookResponse alloc];
      v6 = -[SUScriptFacebookResponse initWithData:response:error:](v7, "initWithData:response:error:", 0, 0, v8);
      -[SUScriptFunction callWithArguments:](v5, "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v6, 0));
      -[SUScriptFunction setThisObject:](v5, "setThisObject:", 0);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setParameters:(id)a3
{
  OpaqueJSContext *v5;
  OpaqueJSContext *v6;
  void *v7;
  _QWORD v8[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SUScriptObject copyJavaScriptContext](self, "copyJavaScriptContext");
    if (v5)
    {
      v6 = v5;
      v7 = (void *)objc_msgSend(a3, "copyArrayOrDictionaryWithContext:", v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SUScriptObject lock](self, "lock");
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __41__SUScriptFacebookRequest_setParameters___block_invoke;
        v8[3] = &unk_24DE7DF80;
        v8[4] = self;
        objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
        -[SUScriptObject unlock](self, "unlock");
      }

      JSGlobalContextRelease(v6);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __41__SUScriptFacebookRequest_setParameters___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setParameterValue:forKey:", a3, a2);
}

- (int64_t)requestMethodDelete
{
  return 2;
}

- (int64_t)requestMethodGet
{
  return 0;
}

- (int64_t)requestMethodPost
{
  return 1;
}

- (BOOL)_isRequestAllowed:(id *)a3
{
  SUScriptAccessSecurity *v5;
  BOOL v6;
  BOOL v7;
  void *v9;

  v9 = 0;
  v5 = objc_alloc_init(SUScriptAccessSecurity);
  v6 = -[SUScriptAccessSecurity canAccessFacebookWithURL:inFrame:error:](v5, "canAccessFacebookWithURL:inFrame:error:", self->_url, -[SUScriptObject webFrame](self, "webFrame"), &v9);
  v7 = v6;
  if (a3 && !v6)
    *a3 = v9;

  return v7;
}

- (void)_performRequest:(id)a3 withScriptFunction:(id)a4
{
  id v7;
  _QWORD v8[7];

  v7 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__SUScriptFacebookRequest__performRequest_withScriptFunction___block_invoke;
  v8[3] = &unk_24DE7DFA8;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  objc_msgSend(a3, "performRequestWithHandler:", v8);
}

void __62__SUScriptFacebookRequest__performRequest_withScriptFunction___block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  SUScriptFacebookResponse *v5;
  id v6;

  v5 = -[SUScriptFacebookResponse initWithData:response:error:]([SUScriptFacebookResponse alloc], "initWithData:response:error:", a2, a3, a4);
  v6 = a1[4];
  objc_msgSend(a1[5], "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v5, 0));
  objc_msgSend(a1[5], "setThisObject:", 0);

}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_62, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_48, 4);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptFacebookRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptFacebookRequest;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_62, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_48 = (uint64_t)sel_addMultiPartData_withName_type_;
    *(_QWORD *)algn_255186E98 = CFSTR("addMultiPartData");
    qword_255186EA0 = (uint64_t)sel_addParameterWithKey_value_;
    unk_255186EA8 = CFSTR("addParameter");
    qword_255186EB0 = (uint64_t)sel_performRequestWithFunction_;
    unk_255186EB8 = CFSTR("perform");
    qword_255186EC0 = (uint64_t)sel_setParameters_;
    unk_255186EC8 = CFSTR("setParameters");
    __KeyMapping_62 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("account"), CFSTR("requestMethod"), CFSTR("requestMethod"), CFSTR("URL"), CFSTR("URL"), CFSTR("REQUEST_METHOD_DELETE"), CFSTR("requestMethodDelete"), CFSTR("REQUEST_METHOD_GET"), CFSTR("requestMethodGet"), CFSTR("REQUEST_METHOD_POST"), CFSTR("requestMethodPost"), 0);
  }
}

@end
