@implementation SUScriptDocumentInteractionController

- (void)dealloc
{
  objc_super v3;

  -[SUScriptFunction setThisObject:](self->_cancelFunction, "setThisObject:", 0);

  -[SUScriptFunction setThisObject:](self->_openWithFunction, "setThisObject:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDocumentInteractionController;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)dismissMenuAnimated:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "BOOLValue");
  WebThreadRunOnMainThread();
}

uint64_t __61__SUScriptDocumentInteractionController_dismissMenuAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDocumentInteractionController"), "dismissMenuAnimated:", *(unsigned __int8 *)(a1 + 40));
}

- (void)showOpenWithMenuFromDOMElement:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_10:
      WebThreadRunOnMainThread();
      return;
    }
  }
  else
  {
    if (!a3)
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

uint64_t __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];
  char v7;

  if (*(_QWORD *)(a1 + 32))
    v2 = objc_msgSend(*(id *)(a1 + 40), "DOMElementWithElement:");
  else
    v2 = 0;
  v3 = objc_msgSend(*(id *)(a1 + 40), "_nativeDocumentInteractionController");
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "_nativeObject");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_2;
  v6[3] = &unk_24DE7C310;
  v7 = *(_BYTE *)(a1 + 48);
  v6[4] = v2;
  v6[5] = v3;
  return objc_msgSend(v4, "presentUsingBlock:", v6);
}

void __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  SUScrollViewScroller *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  SUScrollViewScroller *v17;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "webView");
  v3 = v2;
  if (*(_QWORD *)(a1 + 32) && *(_BYTE *)(a1 + 48))
  {
    v4 = objc_alloc_init(SUScrollViewScroller);
    v5 = (void *)objc_msgSend(v3, "scrollView");
    objc_msgSend(*(id *)(a1 + 32), "frame");
    objc_msgSend(v5, "convertRect:fromView:", 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SUScrollViewScroller attachToScrollView:](v4, "attachToScrollView:", v5);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_3;
    v15[3] = &unk_24DE7BEF0;
    v15[4] = v3;
    v16 = *(_OWORD *)(a1 + 32);
    v17 = v4;
    -[SUScrollViewScroller scrollFrameToVisible:animated:completionBlock:](v4, "scrollFrameToVisible:animated:completionBlock:", 1, v15, v7, v9, v11, v13);

  }
  else
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v2, "bounds");
    objc_msgSend(v14, "presentOpenInMenuFromRect:inView:animated:", v3, 1);
  }
}

uint64_t __72__SUScriptDocumentInteractionController_showOpenWithMenuFromDOMElement___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "frame");
  objc_msgSend(v2, "convertRect:fromView:", 0);
  objc_msgSend(*(id *)(a1 + 48), "presentOpenInMenuFromRect:inView:animated:", *(_QWORD *)(a1 + 32), 1);
  return objc_msgSend(*(id *)(a1 + 56), "detachFromScrollView");
}

- (void)showOpenWithMenuFromNavigationItem:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if (((objc_opt_respondsToSelector() & 1) != 0
     && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1
     || a3)
    && (objc_msgSend(a3, "conformsToProtocol:", &unk_2551CCDD0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
  else
  {
    WebThreadRunOnMainThread();
  }
}

uint64_t __76__SUScriptDocumentInteractionController_showOpenWithMenuFromNavigationItem___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "_nativeDocumentInteractionController");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_nativeObject");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__SUScriptDocumentInteractionController_showOpenWithMenuFromNavigationItem___block_invoke_2;
  v6[3] = &unk_24DE7AFB8;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = v2;
  v6[5] = v4;
  return objc_msgSend(v3, "presentUsingBlock:", v6);
}

uint64_t __76__SUScriptDocumentInteractionController_showOpenWithMenuFromNavigationItem___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentOpenInMenuFromBarButtonItem:animated:", objc_msgSend(*(id *)(a1 + 40), "buttonItem"), 1);
}

- (WebScriptObject)cancelFunction
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUScriptFunction scriptObject](self->_cancelFunction, "scriptObject");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesDocumentInteractionController");
}

- (WebScriptObject)openWithFunction
{
  WebScriptObject *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = -[SUScriptFunction scriptObject](self->_openWithFunction, "scriptObject");
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setCancelFunction:(id)a3
{
  id v5;
  char isKindOfClass;
  SUScriptFunction *cancelFunction;
  SUScriptFunction *v8;

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
        v5 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  cancelFunction = self->_cancelFunction;
  if (!cancelFunction)
  {
    v8 = objc_alloc_init(SUScriptFunction);
    self->_cancelFunction = v8;
    -[SUScriptFunction setThisObject:](v8, "setThisObject:", self);
    cancelFunction = self->_cancelFunction;
  }
  -[SUScriptFunction setScriptObject:](cancelFunction, "setScriptObject:", v5);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setOpenWithFunction:(id)a3
{
  id v5;
  char isKindOfClass;
  SUScriptFunction *openWithFunction;
  SUScriptFunction *v8;

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
        v5 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  -[SUScriptObject lock](self, "lock");
  openWithFunction = self->_openWithFunction;
  if (!openWithFunction)
  {
    v8 = objc_alloc_init(SUScriptFunction);
    self->_openWithFunction = v8;
    -[SUScriptFunction setThisObject:](v8, "setThisObject:", self);
    openWithFunction = self->_openWithFunction;
  }
  -[SUScriptFunction setScriptObject:](openWithFunction, "setScriptObject:", v5);
  -[SUScriptObject unlock](self, "unlock");
}

- (void)setUTI:(id)a3
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    WebThreadRunOnMainThread();
}

uint64_t __48__SUScriptDocumentInteractionController_setUTI___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDocumentInteractionController"), "setUTI:", *(_QWORD *)(a1 + 40));
}

- (NSString)UTI
{
  NSString *v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__43;
  v8 = __Block_byref_object_dispose__43;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (NSString *)(id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

id __44__SUScriptDocumentInteractionController_UTI__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeDocumentInteractionController"), "UTI");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_cancelFunction
{
  SUScriptFunction *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_cancelFunction;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_nativeDocumentInteractionController
{
  return (id)objc_msgSend(-[SUScriptDocumentInteractionController _nativeObject](self, "_nativeObject"), "object");
}

- (id)_nativeObject
{
  SUScriptDocumentInteractionControllerNativeObject *v3;
  id v4;
  id v5;

  v3 = -[SUScriptObject nativeObject](self, "nativeObject");
  if (!-[SUScriptNativeObject object](v3, "object"))
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF69D8]);
    objc_msgSend(v4, "setName:", &stru_24DE83F60);
    v3 = +[SUScriptNativeObject objectWithNativeObject:](SUScriptDocumentInteractionControllerNativeObject, "objectWithNativeObject:", v4);
    -[SUScriptObject setNativeObject:](self, "setNativeObject:", v3);
    v5 = v4;
  }
  return v3;
}

- (id)_openWithFunction
{
  SUScriptFunction *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_openWithFunction;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_56, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDocumentInteractionController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_41, 3);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDocumentInteractionController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptDocumentInteractionController;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_56, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_41 = (uint64_t)sel_dismissMenuAnimated_;
    *(_QWORD *)algn_255186CF8 = CFSTR("dismissMenu");
    qword_255186D00 = (uint64_t)sel_showOpenWithMenuFromDOMElement_;
    unk_255186D08 = CFSTR("showOpenWithMenuFromDOMElement");
    qword_255186D10 = (uint64_t)sel_showOpenWithMenuFromNavigationItem_;
    unk_255186D18 = CFSTR("showOpenWithMenuFromNavigationItem");
    __KeyMapping_56 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("cancelFunction"), CFSTR("openWithFunction"), CFSTR("openWithFunction"), CFSTR("UTI"), CFSTR("UTI"), 0);
  }
}

@end
