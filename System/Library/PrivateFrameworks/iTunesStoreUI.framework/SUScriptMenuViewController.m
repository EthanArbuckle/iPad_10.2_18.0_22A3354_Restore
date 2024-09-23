@implementation SUScriptMenuViewController

- (void)dealloc
{
  objc_super v3;

  -[SUScriptFunction setScriptObject:](self->_action, "setScriptObject:", 0);
  -[SUScriptFunction setThisObject:](self->_action, "setThisObject:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScriptMenuViewController;
  -[SUScriptViewController dealloc](&v3, sel_dealloc);
}

- (id)newNativeViewController
{
  SUNativeScriptMenuViewController *v3;

  v3 = objc_alloc_init(SUNativeScriptMenuViewController);
  -[SUViewController setClientInterface:](v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  return v3;
}

- (id)itemWithTitle:(id)a3 userInfo:(id)a4
{
  SUScriptMenuItem *v6;

  v6 = objc_alloc_init(SUScriptMenuItem);
  -[SUScriptMenuItem setTitle:](v6, "setTitle:", a3);
  -[SUScriptMenuItem setUserInfo:](v6, "setUserInfo:", a4);
  return v6;
}

- (WebScriptObject)action
{
  void *v2;
  WebScriptObject *v3;
  WebScriptObject *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (WebScriptObject *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __36__SUScriptMenuViewController_action__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __36__SUScriptMenuViewController_action__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "action"), "scriptObject");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesMenuViewController");
}

- (id)items
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __35__SUScriptMenuViewController_items__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __35__SUScriptMenuViewController_items__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "menuItems");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSNumber)selectedIndex
{
  NSNumber *v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  v4 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (NSNumber *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7[3], v4, 3221225472, __43__SUScriptMenuViewController_selectedIndex__block_invoke, &unk_24DE7BE30, self, &v6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __43__SUScriptMenuViewController_selectedIndex__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "selectedIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setAction:(id)a3
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

uint64_t __40__SUScriptMenuViewController_setAction___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = objc_alloc_init(SUScriptFunction);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setThisObject:");
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  objc_msgSend(v2, "setScriptObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "setAction:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setItems:(id)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v3 = a3;
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      v3 = 0;
      goto LABEL_11;
    }
    v3 = (id)objc_msgSend(v3, "copyArrayValueWithValidator:context:", SUISAValidator, objc_opt_class());
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
      goto LABEL_11;
    }
  }
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__18;
  v9 = __Block_byref_object_dispose__18;
  v10 = 0;
  WebThreadRunOnMainThread();
  if (v6[5])
  {
    -[SUScriptObject checkOutScriptObjects:](self, "checkOutScriptObjects:");

  }
  if (v3)
    -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3);
  WebThreadRunOnMainThread();
  _Block_object_dispose(&v5, 8);
LABEL_11:

}

id __39__SUScriptMenuViewController_setItems___block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "menuItems");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __39__SUScriptMenuViewController_setItems___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "setMenuItems:", *(_QWORD *)(a1 + 40));
}

- (void)setSelectedIndex:(id)a3
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !a3)
    || (isKindOfClass & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  }
}

uint64_t __47__SUScriptMenuViewController_setSelectedIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_viewController");
  v3 = *(void **)(a1 + 40);
  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = -1;
  return objc_msgSend(v2, "setSelectedIndex:", v4);
}

- (void)setTitle:(id)a3
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

uint64_t __39__SUScriptMenuViewController_setTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "setTitle:", *(_QWORD *)(a1 + 40));
}

- (NSString)title
{
  void *v2;
  NSString *v3;
  NSString *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __35__SUScriptMenuViewController_title__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

id __35__SUScriptMenuViewController_title__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_viewController"), "title");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_viewController
{
  UIViewController *v2;

  v2 = -[SUScriptViewController nativeViewController](self, "nativeViewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_29, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMenuViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_23, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptMenuViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptMenuViewController;
  v2 = -[SUScriptViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_29, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_23 = (uint64_t)sel_itemWithTitle_userInfo_;
    *(_QWORD *)algn_255186538 = CFSTR("createItem");
    __KeyMapping_29 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("action"), CFSTR("items"), CFSTR("items"), CFSTR("selectedIndex"), CFSTR("selectedIndex"), CFSTR("title"), CFSTR("title"), 0);
  }
}

@end
