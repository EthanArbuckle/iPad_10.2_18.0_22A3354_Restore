@implementation SUScriptProtocol

- (void)setValuesFromDictionary:(id)a3
{
  WebThreadRunOnMainThread();
}

void __44__SUScriptProtocol_setValuesFromDictionary___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_copyProtocol");
  objc_msgSend(v2, "setValuesFromStorePageDictionary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setProtocol:", v2);

}

- (NSArray)allowedOrientations
{
  return (NSArray *)-[SUScriptProtocol _webThreadValueForProtocolKey:](self, "_webThreadValueForProtocolKey:", CFSTR("allowedOrientations"));
}

- (id)_className
{
  return CFSTR("iTunesProtocol");
}

- (NSString)clientIdentifier
{
  return -[SUClientInterface clientIdentifier](-[SUScriptObject clientInterface](self, "clientInterface"), "clientIdentifier");
}

- (NSString)copyright
{
  return (NSString *)-[SUScriptProtocol _webThreadValueForProtocolKey:](self, "_webThreadValueForProtocolKey:", CFSTR("copyright"));
}

- (BOOL)excludeFromNavigationHistory
{
  return objc_msgSend(-[SUScriptProtocol _webThreadValueForProtocolKey:](self, "_webThreadValueForProtocolKey:", CFSTR("shouldExcludeFromNavigationHistory")), "BOOLValue");
}

- (SUScriptURLRequest)overlayBackgroundURLRequest
{
  id v2;
  SUScriptURLRequest *v3;

  v2 = -[SUScriptProtocol _webThreadValueForProtocolKey:](self, "_webThreadValueForProtocolKey:", CFSTR("overlayBackgroundURLRequestProperties"));
  if (v2
    && (v3 = -[SUScriptURLRequest initWithNativeRequestProperties:]([SUScriptURLRequest alloc], "initWithNativeRequestProperties:", v2)) != 0)
  {
    return v3;
  }
  else
  {
    return (SUScriptURLRequest *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
}

- (NSString)protocolVersion
{
  return (NSString *)*MEMORY[0x24BEC8B28];
}

- (void)setAllowedOrientations:(id)a3
{
  uint64_t v4;
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v4 = objc_msgSend(a3, "copyArrayValueWithValidator:context:", __SUOrientationValidator, 0)) != 0)
  {
    v5 = (void *)v4;
    WebThreadRunOnMainThread();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __43__SUScriptProtocol_setAllowedOrientations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setValue:forProtocolKey:", *(_QWORD *)(a1 + 40), CFSTR("allowedOrientations"));
}

- (void)setCopyright:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __33__SUScriptProtocol_setCopyright___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setValue:forProtocolKey:", *(_QWORD *)(a1 + 40), CFSTR("copyright"));
}

- (void)setExcludeFromNavigationHistory:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __52__SUScriptProtocol_setExcludeFromNavigationHistory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setValue:forProtocolKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), CFSTR("shouldExcludeFromNavigationHistory"));
}

- (void)setOverlayBackgroundURLRequest:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;
  void *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
LABEL_6:
    v7 = (void *)objc_msgSend(v4, "copyNativeRequestProperties");
    WebThreadRunOnMainThread();

    return;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = 0;
  if (!a3)
    goto LABEL_6;
  if ((isKindOfClass & 1) != 0)
    goto LABEL_6;
  objc_opt_class();
  v6 = objc_opt_isKindOfClass();
  v4 = a3;
  if ((v6 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __51__SUScriptProtocol_setOverlayBackgroundURLRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setValue:forProtocolKey:", *(_QWORD *)(a1 + 40), CFSTR("overlayBackgroundURLRequestProperties"));
}

- (void)setShouldShowInOverlay:(BOOL)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __43__SUScriptProtocol_setShouldShowInOverlay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setValue:forProtocolKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), CFSTR("shouldDisplayInOverlay"));
}

- (BOOL)shouldShowInOverlay
{
  return objc_msgSend(-[SUScriptProtocol _webThreadValueForProtocolKey:](self, "_webThreadValueForProtocolKey:", CFSTR("shouldDisplayInOverlay")), "BOOLValue");
}

- (id)_copyProtocol
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "storePageProtocol"), "copy");
  if (!result)
    return objc_alloc_init(SUStorePageProtocol);
  return result;
}

- (void)_setProtocol:(id)a3
{
  objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "setStorePageProtocol:", a3);
}

- (void)_setValue:(id)a3 forProtocolKey:(id)a4
{
  id v7;

  v7 = -[SUScriptProtocol _copyProtocol](self, "_copyProtocol");
  objc_msgSend(v7, "setValue:forKey:", a3, a4);
  -[SUScriptProtocol _setProtocol:](self, "_setProtocol:", v7);

}

- (id)_webThreadValueForProtocolKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__10;
  v14 = __Block_byref_object_dispose__10;
  v15 = 0;
  v8 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v4 = (id)objc_msgSend((id)v11[5], "valueForKey:", a3, v8, 3221225472, __50__SUScriptProtocol__webThreadValueForProtocolKey___block_invoke, &unk_24DE7BE30, self, &v10);

  if (v4)
    v5 = v4;
  else
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = v5;
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __50__SUScriptProtocol__webThreadValueForProtocolKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyProtocol");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_17, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptProtocol;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptProtocol;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_17, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("allowedOrientations"), CFSTR("clientIdentifier"), CFSTR("clientIdentifier"), CFSTR("copyright"), CFSTR("copyright"), CFSTR("excludeFromNavigationHistory"), CFSTR("excludeFromNavigationHistory"), CFSTR("overlayBackgroundURLRequest"), CFSTR("overlayBackgroundURLRequest"), CFSTR("protocolVersion"), CFSTR("protocolVersion"), CFSTR("shouldShowInOverlay"), CFSTR("shouldShowInOverlay"), 0);
}

@end
