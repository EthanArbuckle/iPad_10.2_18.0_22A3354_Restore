@implementation SUScriptLookupRequest

- (SUScriptLookupRequest)init
{
  SUScriptLookupRequest *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptLookupRequest;
  v2 = -[SUScriptObject init](&v4, sel_init);
  if (v2)
    v2->_request = (SSLookupRequest *)objc_alloc_init(MEMORY[0x24BEB1EB0]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptLookupRequest;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3 forRequestParameter:(id)a4
{
  SSLookupRequest *request;
  id v8;
  void *v9;
  OpaqueJSContext *v10;
  id v11;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDFA950];
LABEL_11:
    objc_msgSend(v9, "throwException:", CFSTR("Invalid argument"));
    return;
  }
  if (!a3)
  {
    -[SUScriptObject lock](self, "lock");
    request = self->_request;
    v8 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x24BDFA950];
      goto LABEL_11;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    request = self->_request;
    v8 = a3;
LABEL_13:
    -[SSLookupRequest setValue:forRequestParameter:](request, "setValue:forRequestParameter:", v8, a4);
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  v10 = -[WebFrame globalContext](-[SUScriptObject webFrame](self, "webFrame"), "globalContext");
  if (v10)
  {
    v11 = (id)objc_msgSend(a3, "copyArrayOrDictionaryWithContext:", v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SUScriptObject lock](self, "lock");
      -[SSLookupRequest setValue:forRequestParameter:](self->_request, "setValue:forRequestParameter:", v11, a4);
      -[SUScriptObject unlock](self, "unlock");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
    }

  }
}

- (void)startWithLookupFunction:(id)a3
{
  id v5;
  char isKindOfClass;
  SUScriptFunction *v7;
  SSLookupRequest *request;
  _QWORD v9[5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    v7 = -[SUScriptFunction initWithScriptObject:]([SUScriptFunction alloc], "initWithScriptObject:", v5);
    -[SUScriptFunction setThisObject:](v7, "setThisObject:", self);
    request = self->_request;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__SUScriptLookupRequest_startWithLookupFunction___block_invoke;
    v9[3] = &unk_24DE7E118;
    v9[4] = v7;
    -[SSLookupRequest startWithLookupBlock:](request, "startWithLookupBlock:", v9);

    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void __49__SUScriptLookupRequest_startWithLookupFunction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  SUScriptError *v8;

  if (a3)
    v8 = -[SUScriptError initWithError:]([SUScriptError alloc], "initWithError:", a3);
  else
    v8 = 0;
  v5 = objc_msgSend(a2, "responseDictionary");
  if (!v5
    || (v6 = objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 0, 0)) == 0
    || (v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4)) == 0)
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDFA958], "undefined");
  }
  objc_msgSend(*(id *)(a1 + 32), "callWithArguments:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v7, v8, 0));
  objc_msgSend(*(id *)(a1 + 32), "setThisObject:", 0);

}

- (id)valueForRequestParameter:(id)a3
{
  void *v5;

  -[SUScriptObject lock](self, "lock");
  v5 = (void *)-[SSLookupRequest valueForRequestParameter:](self->_request, "valueForRequestParameter:", a3);
  -[SUScriptObject unlock](self, "unlock");
  return v5;
}

- (id)authenticatesIfNeeded
{
  uint64_t v3;
  id *v4;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SSLookupRequest personalizationStyle](self->_request, "personalizationStyle");
  -[SUScriptObject unlock](self, "unlock");
  v4 = (id *)MEMORY[0x24BDBD270];
  if (v3 != 1)
    v4 = (id *)MEMORY[0x24BDBD268];
  return *v4;
}

- (id)_className
{
  return CFSTR("iTunesLookupRequest");
}

- (NSString)keyProfile
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSString *)-[SSLookupRequest keyProfile](self->_request, "keyProfile");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (int64_t)localizationStyle
{
  int64_t v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SSLookupRequest localizationStyle](self->_request, "localizationStyle");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setAuthenticatesIfNeeded:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    -[SSLookupRequest setPersonalizationStyle:](self->_request, "setPersonalizationStyle:", objc_msgSend(a3, "BOOLValue"));
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setKeyProfile:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SSLookupRequest setKeyProfile:](self->_request, "setKeyProfile:", v5);
    -[SUScriptObject unlock](self, "unlock");
    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v5 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setLocalizationStyle:(int64_t)a3
{
  -[SUScriptObject lock](self, "lock");
  -[SSLookupRequest setLocalizationStyle:](self->_request, "setLocalizationStyle:", a3);
  -[SUScriptObject unlock](self, "unlock");
}

- (int64_t)localizationStyleDevice
{
  return 1;
}

- (int64_t)localizationStyleServer
{
  return 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_72, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptLookupRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_54, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptLookupRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptLookupRequest;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_72, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_54 = (uint64_t)sel_valueForRequestParameter_;
    *(_QWORD *)algn_255187048 = CFSTR("getRequestParameter");
    qword_255187050 = (uint64_t)sel_setValue_forRequestParameter_;
    unk_255187058 = CFSTR("setRequestParameter");
    qword_255187060 = (uint64_t)sel_startWithLookupFunction_;
    unk_255187068 = CFSTR("start");
    __KeyMapping_72 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("authenticatesIfNeeded"), CFSTR("keyProfile"), CFSTR("keyProfile"), CFSTR("localizationStyle"), CFSTR("localizationStyle"), CFSTR("LOCALIZATION_STYLE_DEVICE"), CFSTR("localizationStyleDevice"), CFSTR("LOCALIZATION_STYLE_SERVER"), CFSTR("localizationStyleServer"), 0);
  }
}

@end
