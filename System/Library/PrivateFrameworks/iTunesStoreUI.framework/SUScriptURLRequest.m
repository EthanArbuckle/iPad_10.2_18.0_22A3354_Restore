@implementation SUScriptURLRequest

- (SUScriptURLRequest)init
{
  return -[SUScriptURLRequest initWithNativeRequestProperties:](self, "initWithNativeRequestProperties:", 0);
}

- (SUScriptURLRequest)initWithNativeRequestProperties:(id)a3
{
  SUScriptURLRequest *v4;
  SSMutableURLRequestProperties *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUScriptURLRequest;
  v4 = -[SUScriptObject init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (SSMutableURLRequestProperties *)objc_msgSend(a3, "mutableCopy");
    else
      v5 = (SSMutableURLRequestProperties *)objc_alloc_init(MEMORY[0x24BEB1F30]);
    v4->_requestProperties = v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptURLRequest;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)copyNativeRequestProperties
{
  void *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)-[SSMutableURLRequestProperties copy](self->_requestProperties, "copy");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesURLRequest");
}

- (void)setTimeoutInterval:(id)a3
{
  SSMutableURLRequestProperties *requestProperties;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SUScriptObject lock](self, "lock");
    requestProperties = self->_requestProperties;
    objc_msgSend(a3, "doubleValue");
    -[SSMutableURLRequestProperties setTimeoutInterval:](requestProperties, "setTimeoutInterval:");
    -[SUScriptObject unlock](self, "unlock");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

- (void)setURLBagKey:(id)a3
{
  id v5;
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
LABEL_6:
    -[SUScriptObject lock](self, "lock");
    -[SSMutableURLRequestProperties setURLBagKey:](self->_requestProperties, "setURLBagKey:", v5);
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

- (void)setURLs:(id)a3
{
  void *v5;
  char isKindOfClass;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
    if (a3 && (isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", a3, 0);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          v5 = 0;
          goto LABEL_19;
        }
        v5 = (void *)objc_msgSend(a3, "copyArrayValueWithValidator:context:", SUURLValidator, 0);
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          goto LABEL_19;
        }
      }
    }
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v5);
        v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v7, "addObject:", v12);

        }
      }
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  -[SUScriptObject lock](self, "lock");
  -[SSMutableURLRequestProperties setURLs:](self->_requestProperties, "setURLs:", v7);
  -[SUScriptObject unlock](self, "unlock");

LABEL_19:
}

- (NSNumber)timeoutInterval
{
  void *v3;
  NSNumber *v4;

  -[SUScriptObject lock](self, "lock");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[SSMutableURLRequestProperties timeoutInterval](self->_requestProperties, "timeoutInterval");
  v4 = (NSNumber *)objc_msgSend(v3, "numberWithDouble:");
  -[SUScriptObject unlock](self, "unlock");
  return v4;
}

- (NSString)URLBagKey
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (NSString *)-[SSMutableURLRequestProperties URLBagKey](self->_requestProperties, "URLBagKey");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)URLs
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = (id)-[SSMutableURLRequestProperties URLs](self->_requestProperties, "URLs");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_48, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptURLRequest;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptURLRequest;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_48, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_48 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("timeoutInterval"), CFSTR("URLBagKey"), CFSTR("URLBagKey"), CFSTR("urls"), CFSTR("URLs"), 0);
}

@end
