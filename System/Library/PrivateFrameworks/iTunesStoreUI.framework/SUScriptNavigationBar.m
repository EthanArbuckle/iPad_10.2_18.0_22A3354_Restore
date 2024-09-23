@implementation SUScriptNavigationBar

- (SUScriptNavigationBar)init
{
  return -[SUScriptNavigationBar initWithNativeNavigationBar:](self, "initWithNativeNavigationBar:", 0);
}

- (SUScriptNavigationBar)initWithNativeNavigationBar:(id)a3
{
  SUScriptNavigationBar *v4;
  SUScriptNavigationBar *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUScriptNavigationBar;
  v4 = -[SUScriptObject init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    -[SUScriptObject setNativeObject:](v4, "setNativeObject:", +[SUScriptNativeObject objectWithNativeObject:](SUScriptNativeObject, "objectWithNativeObject:", a3));
  return v5;
}

- (void)tearDownUserInterface
{
  objc_super v3;

  +[SUScriptNavigationItem disconnectNavigationItem:forScriptObject:](SUScriptNavigationItem, "disconnectNavigationItem:forScriptObject:", objc_msgSend(-[SUScriptNavigationBar _nativeNavigationBar](self, "_nativeNavigationBar"), "topItem"), self);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNavigationBar;
  -[SUScriptObject tearDownUserInterface](&v3, sel_tearDownUserInterface);
}

- (SUScriptNavigationItem)backNavigationItem
{
  void *v3;
  SUScriptNavigationItem *v4;
  SUScriptNavigationItem *v5;
  uint64_t v7;
  uint64_t v8;
  SUScriptNavigationItem *(*v9)(uint64_t);
  void *v10;
  SUScriptNavigationBar *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __43__SUScriptNavigationBar_backNavigationItem__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __43__SUScriptNavigationBar_backNavigationItem__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptNavigationItem *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

SUScriptNavigationItem *__43__SUScriptNavigationBar_backNavigationItem__block_invoke(uint64_t a1)
{
  SUScriptNavigationItem *result;

  result = (SUScriptNavigationItem *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "backItem");
  if (result)
  {
    result = -[SUScriptNavigationItem initWithNativeNavigationItem:]([SUScriptNavigationItem alloc], "initWithNativeNavigationItem:", result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (int64_t)barStyle
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

uint64_t __33__SUScriptNavigationBar_barStyle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "barStyle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesNavigationBar");
}

- (SUScriptNavigationItem)leftItem
{
  return (SUScriptNavigationItem *)objc_msgSend(-[SUScriptNavigationBar _topNavigationItem](self, "_topNavigationItem"), "leftItem");
}

- (NSArray)navigationItems
{
  void *v3;
  NSArray *v4;
  NSArray *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptNavigationBar *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __40__SUScriptNavigationBar_navigationItems__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v7, 3221225472, __40__SUScriptNavigationBar_navigationItems__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (NSArray *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __40__SUScriptNavigationBar_navigationItems__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SUScriptNavigationItem *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "items");
  result = objc_msgSend(v2, "count");
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          v7 = -[SUScriptNavigationItem initWithNativeNavigationItem:]([SUScriptNavigationItem alloc], "initWithNativeNavigationItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v7);

          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (NSString)prompt
{
  return (NSString *)objc_msgSend(-[SUScriptNavigationBar _topNavigationItem](self, "_topNavigationItem"), "prompt");
}

- (SUScriptNavigationItem)rightItem
{
  return (SUScriptNavigationItem *)objc_msgSend(-[SUScriptNavigationBar _topNavigationItem](self, "_topNavigationItem"), "rightItem");
}

- (void)setBackNavigationItem:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("topNavigationItem")));
}

- (void)setBarStyle:(int64_t)a3
{
  WebThreadRunOnMainThread();
}

uint64_t __37__SUScriptNavigationBar_setBarStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "setBarStyle:", *(_QWORD *)(a1 + 40));
}

- (void)setLeftItem:(id)a3
{
  -[SUScriptNavigationBar setLeftItem:animated:](self, "setLeftItem:animated:", a3, 0);
}

- (void)setLeftItem:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(-[SUScriptNavigationBar _topNavigationItem](self, "_topNavigationItem"), "setLeftItem:animated:", a3, a4);
}

- (void)setNavigationItems:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("navigationItems")));
}

- (void)setPrompt:(id)a3
{
  objc_msgSend(-[SUScriptNavigationBar _topNavigationItem](self, "_topNavigationItem"), "setPrompt:", a3);
}

- (void)setRightItem:(id)a3
{
  -[SUScriptNavigationBar setRightItem:animated:](self, "setRightItem:animated:", a3, 0);
}

- (void)setRightItem:(id)a3 animated:(BOOL)a4
{
  objc_msgSend(-[SUScriptNavigationBar _topNavigationItem](self, "_topNavigationItem"), "setRightItem:animated:", a3, a4);
}

- (void)setTopNavigationItem:(id)a3
{
  objc_msgSend(MEMORY[0x24BDFA950], "throwException:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), CFSTR("topNavigationItem")));
}

- (void)setTranslucent:(id)a3
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

uint64_t __40__SUScriptNavigationBar_setTranslucent___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "setTranslucent:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
}

- (SUScriptNavigationItem)topNavigationItem
{
  void *v2;
  SUScriptNavigationItem *v3;
  SUScriptNavigationItem *v4;
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
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (SUScriptNavigationItem *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __42__SUScriptNavigationBar_topNavigationItem__block_invoke, &unk_24DE7BE30, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __42__SUScriptNavigationBar_topNavigationItem__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyTopNavigationItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)translucent
{
  void **v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  WebThreadRunOnMainThread();
  if (*((_BYTE *)v6 + 24))
    v2 = (void **)MEMORY[0x24BDBD270];
  else
    v2 = (void **)MEMORY[0x24BDBD268];
  v3 = *v2;
  _Block_object_dispose(&v5, 8);
  return v3;
}

uint64_t __36__SUScriptNavigationBar_translucent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_nativeNavigationBar"), "isTranslucent");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)barStyleBlack
{
  return 1;
}

- (int64_t)barStyleDefault
{
  return 0;
}

- (id)buttonWithTitle:(id)a3 style:(id)a4 target:(id)a5 action:(id)a6
{
  SUScriptButton *v11;

  v11 = objc_alloc_init(SUScriptButton);
  -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[SUScriptButton setAction:](v11, "setAction:", a6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUScriptButton setStyle:](v11, "setStyle:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUScriptButton setTarget:](v11, "setTarget:", a5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SUScriptButton setTitle:](v11, "setTitle:", a3);
  return v11;
}

- (void)setLeftButton:(id)a3
{
  -[SUScriptNavigationBar setLeftButton:animated:](self, "setLeftButton:animated:", a3, 0);
}

- (void)setRightButton:(id)a3
{
  -[SUScriptNavigationBar setRightButton:animated:](self, "setRightButton:animated:", a3, 0);
}

- (id)_copyTopNavigationItem
{
  id v3;
  SUScriptNavigationItem *v4;
  id v5;
  void *v6;

  v3 = -[SUScriptNavigationBar _nativeNavigationBar](self, "_nativeNavigationBar");
  v4 = (SUScriptNavigationItem *)objc_msgSend(v3, "topItem");
  v5 = -[SUScriptObject parentViewController](self, "parentViewController");
  v6 = (void *)objc_msgSend(v5, "navigationController");
  if (v3 == (id)objc_msgSend(v6, "navigationBar")
    && objc_msgSend(v5, "isDescendantOfViewController:", objc_msgSend(v6, "topViewController")))
  {
    v4 = (SUScriptNavigationItem *)objc_msgSend(v5, "navigationItemForScriptInterface");
  }
  if (v4)
  {
    v4 = -[SUScriptNavigationItem initWithNativeNavigationItem:]([SUScriptNavigationItem alloc], "initWithNativeNavigationItem:", v4);
    -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v4);
  }
  return v4;
}

- (id)_nativeNavigationBar
{
  id v3;

  v3 = -[SUScriptNativeObject object](-[SUScriptObject nativeObject](self, "nativeObject"), "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return (id)objc_msgSend((id)objc_msgSend(-[SUScriptObject parentViewController](self, "parentViewController"), "navigationController"), "navigationBar");
}

- (id)_topNavigationItem
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__3;
  v8 = __Block_byref_object_dispose__3;
  v9 = 0;
  WebThreadRunOnMainThread();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __43__SUScriptNavigationBar__topNavigationItem__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyTopNavigationItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_5, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationBar;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_3, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationBar;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptNavigationBar;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_5, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_3 = (uint64_t)sel_setLeftItem_animated_;
    unk_255185FE0 = CFSTR("setLeftItem");
    qword_255185FE8 = (uint64_t)sel_setRightItem_animated_;
    unk_255185FF0 = CFSTR("setRightItem");
    qword_255185FF8 = (uint64_t)sel_buttonWithTitle_style_target_action_;
    unk_255186000 = CFSTR("createButton");
    qword_255186008 = (uint64_t)sel_setLeftButton_animated_;
    unk_255186010 = CFSTR("setLeftButton");
    qword_255186018 = (uint64_t)sel_setRightButton_animated_;
    unk_255186020 = CFSTR("setRightButton");
    __KeyMapping_5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("backNavigationItem"), CFSTR("barStyle"), CFSTR("barStyle"), CFSTR("leftItem"), CFSTR("leftItem"), CFSTR("navigationItems"), CFSTR("navigationItems"), CFSTR("prompt"), CFSTR("prompt"), CFSTR("rightItem"), CFSTR("rightItem"), CFSTR("topNavigationItem"), CFSTR("topNavigationItem"), CFSTR("translucent"), CFSTR("translucent"), CFSTR("BAR_STYLE_DEFAULT"), CFSTR("barStyleDefault"),
                       CFSTR("BAR_STYLE_BLACK"),
                       CFSTR("barStyleBlack"),
                       CFSTR("leftButton"),
                       CFSTR("leftButton"),
                       CFSTR("rightButton"),
                       CFSTR("rightButton"),
                       0);
  }
}

@end
