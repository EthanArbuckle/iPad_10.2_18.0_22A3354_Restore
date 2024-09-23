@implementation SUScriptSection

- (SUScriptSection)initWithNativeSection:(id)a3
{
  SUScriptSection *v4;

  v4 = -[SUScriptObject init](self, "init");
  if (v4)
  {
    v4->_identifier = (NSString *)(id)objc_msgSend(a3, "identifier");
    v4->_transient = objc_msgSend(a3, "isTransient");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_badgeValue = 0;
  self->_identifier = 0;

  self->_viewController = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSection;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)setBadgeValue:(id)a3 animated:(BOOL)a4 blink:(BOOL)a5
{
  id v9;
  char isKindOfClass;
  id v11;
  _QWORD block[6];
  BOOL v13;
  BOOL v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v9 = 0;
    if (a3)
    {
      if ((isKindOfClass & 1) == 0)
      {
        objc_opt_class();
        v9 = a3;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
          return;
        }
      }
    }
  }
  if (objc_msgSend(v9, "length"))
    v11 = v9;
  else
    v11 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUScriptSection_setBadgeValue_animated_blink___block_invoke;
  block[3] = &unk_24DE7C728;
  block[4] = self;
  block[5] = v11;
  v13 = a4;
  v14 = a5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __48__SUScriptSection_setBadgeValue_animated_blink___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "viewControllerForSectionIdentifier:", objc_msgSend(*(id *)(a1 + 32), "identifier"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (void *)objc_msgSend(v2, "firstViewController");
  return objc_msgSend(v2, "setBadgeValue:animated:blink:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

- (NSString)badgeValue
{
  uint64_t v2;
  void *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  v7 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = objc_msgSend((id)v10[5], "length", v7, 3221225472, __29__SUScriptSection_badgeValue__block_invoke, &unk_24DE7BE08, self, &v9);
  v3 = (void *)v10[5];
  if (!v2)
  {

    v10[5] = 0;
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    v4 = (NSString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    goto LABEL_6;
  }
  v4 = v3;
LABEL_6:
  v5 = v4;
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __29__SUScriptSection_badgeValue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "viewControllerForSectionIdentifier:", objc_msgSend(*(id *)(a1 + 32), "identifier")), "tabBarItem"), "badgeValue"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesSection");
}

- (NSString)identifier
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_identifier;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (void)setBadgeValue:(id)a3
{
  -[SUScriptSection setBadgeValue:animated:blink:](self, "setBadgeValue:animated:blink:", a3, 0, 0);
}

- (BOOL)transient
{
  BOOL transient;

  -[SUScriptObject lock](self, "lock");
  transient = self->_transient;
  -[SUScriptObject unlock](self, "unlock");
  return transient;
}

- (SUScriptViewController)viewController
{
  void *v3;
  SUScriptViewController *v4;
  SUScriptViewController *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SUScriptSection *v11;
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
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = 0;
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __33__SUScriptSection_viewController__block_invoke;
  v10 = &unk_24DE7BE08;
  v11 = self;
  v12 = &v13;
  WebThreadRunOnMainThread();
  if (v14[5]
    && (-[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v7, 3221225472, __33__SUScriptSection_viewController__block_invoke, &unk_24DE7BE08, v11, &v13), (v3 = (void *)v14[5]) != 0))
  {
    v4 = v3;
  }
  else
  {
    v4 = (SUScriptViewController *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v7, v8, v9, v10, v11, v12);
  }
  v5 = v4;
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __33__SUScriptSection_viewController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "viewControllerForSectionIdentifier:", objc_msgSend(*(id *)(a1 + 32), "identifier")), "copyScriptViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_25, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSection;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_20, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSection;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSection;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_25, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_20 = (uint64_t)sel_setBadgeValue_animated_blink_;
    *(_QWORD *)algn_255186488 = CFSTR("setBadgeValue");
    __KeyMapping_25 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("badgeValue"), CFSTR("identifier"), CFSTR("identifier"), CFSTR("isTransient"), CFSTR("transient"), CFSTR("viewController"), CFSTR("viewController"), 0);
  }
}

@end
