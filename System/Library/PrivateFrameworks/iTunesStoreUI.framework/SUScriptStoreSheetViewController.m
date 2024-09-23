@implementation SUScriptStoreSheetViewController

- (id)newNativeViewController
{
  id v3;

  -[SUScriptObject lock](self, "lock");
  v3 = objc_alloc_init((Class)ISWeakLinkedClassForString());
  objc_msgSend(v3, "setAutomaticallyDismisses:", 1);
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)loadWithProductParameters:(id)a3
{
  int v5;
  char isKindOfClass;
  OpaqueJSContext *v7;

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
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
        return;
      }
      v5 = 1;
    }
  }
  v7 = -[WebFrame globalContext](-[SUScriptObject webFrame](self, "webFrame"), "globalContext");
  if (v5)
  {
    if (v7)
      WebThreadRunOnMainThread();
  }
}

void __62__SUScriptStoreSheetViewController_loadWithProductParameters___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copyArrayOrDictionaryWithContext:", *(_QWORD *)(a1 + 48));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeViewController"), "loadProductWithParameters:completionBlock:", v2, 0);

}

- (void)loadWithProductURL:(id)a3
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

uint64_t __55__SUScriptStoreSheetViewController_loadWithProductURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  if (result)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "nativeViewController"), "loadProductWithURL:completionBlock:", result, 0);
  return result;
}

- (id)_className
{
  return CFSTR("iTunesStoreSheetViewController");
}

- (int64_t)productPageStyle
{
  int64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  WebThreadRunOnMainThread();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __52__SUScriptStoreSheetViewController_productPageStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "productPageStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setProductPageStyle:(int64_t)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __56__SUScriptStoreSheetViewController_setProductPageStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "setProductPageStyle:", *(_QWORD *)(a1 + 40));
}

- (int64_t)productPageStyleAutomatic
{
  return 0;
}

- (int64_t)productPageStylePad
{
  return 3;
}

- (int64_t)productPageStylePhone
{
  return 2;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_83, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_63, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptStoreSheetViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptStoreSheetViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_83, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_63 = (uint64_t)sel_loadWithProductParameters_;
    unk_255187250 = CFSTR("loadWithProductParameters");
    qword_255187258 = (uint64_t)sel_loadWithProductURL_;
    unk_255187260 = CFSTR("loadWithProductURL");
    __KeyMapping_83 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("sheetStyle"), CFSTR("productPageStyle"), CFSTR("SHEET_STYLE_AUTOMATIC"), CFSTR("productPageStyleAutomatic"), CFSTR("SHEET_STYLE_PAD"), CFSTR("productPageStylePad"), CFSTR("SHEET_STYLE_PHONE"), CFSTR("productPageStylePhone"), 0);
  }
}

@end
