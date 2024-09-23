@implementation SUScriptSectionsController

- (SUScriptSectionsController)init
{
  SUScriptSectionsController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSectionsController;
  v2 = -[SUScriptObject init](&v4, sel_init);
  if (v2)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__tabBarConfigurationChangedNotification_, CFSTR("SUTabBarConfigurationChangedNotification"), 0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("SUTabBarConfigurationChangedNotification"), 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSectionsController;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (id)sectionWithIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  v12 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  v3 = (void *)v8[5];
  if (v3)
    v4 = v3;
  else
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = v4;
  _Block_object_dispose(&v7, 8);
  return v5;
}

uint64_t __52__SUScriptSectionsController_sectionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copySectionWithIdentifier:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return CFSTR("iTunesSectionsController");
}

- (id)sections
{
  id v3;
  uint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3, v5, 3221225472, __38__SUScriptSectionsController_sections__block_invoke, &unk_24DE7AFB8, self, v3);
  return v3;
}

uint64_t __38__SUScriptSectionsController_sections__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  SUScriptSection *v7;
  SUScriptSection *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "sections");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = -[SUScriptSection initWithNativeSection:]([SUScriptSection alloc], "initWithNativeSection:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
        if (v7)
        {
          v8 = v7;
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

        }
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (SUScriptSection)selectedSection
{
  void *v2;
  SUScriptSection *v3;
  SUScriptSection *v4;
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
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = 0;
  v6 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2)
    v3 = v2;
  else
    v3 = (SUScriptSection *)objc_msgSend(MEMORY[0x24BDBCEF8], "null", v6, 3221225472, __45__SUScriptSectionsController_selectedSection__block_invoke, &unk_24DE7BE08, self, &v8);
  v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __45__SUScriptSectionsController_selectedSection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_fixedSelectedIdentifier");
  if (result)
    result = objc_msgSend(*(id *)(a1 + 32), "_copySectionWithIdentifier:", result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setSelectedSection:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend((id)objc_msgSend(a3, "identifier"), "length"))
    objc_msgSend(-[SUScriptObject webThreadMainThreadBatchProxy](self, "webThreadMainThreadBatchProxy"), "_setSelectedIdentifier:", objc_msgSend(a3, "identifier"));
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

- (void)setRootViewController:(id)a3 forSection:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    WebThreadRunOnMainThread();
  else
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
}

void *__63__SUScriptSectionsController_setRootViewController_forSection___block_invoke(id *a1)
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(a1[4], "clientInterface"), "tabBarController");
  if (result)
    return (void *)objc_msgSend(result, "setTransientViewController:onSectionWithIdentifier:", objc_msgSend(a1[5], "nativeViewController"), objc_msgSend(a1[6], "identifier"));
  return result;
}

- (void)_tabBarConfigurationChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("sectionschange"));
}

- (id)_copySectionWithIdentifier:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  SUScriptSection *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = -[SUTabBarController sections](-[SUClientInterface tabBarController](-[SUScriptObject clientInterface](self, "clientInterface"), "tabBarController"), "sections");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "identifier")))
        {
          v11 = -[SUScriptSection initWithNativeSection:]([SUScriptSection alloc], "initWithNativeSection:", v10);
          -[SUScriptObject checkInScriptObject:](self, "checkInScriptObject:", v11);
          return v11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 0;
}

- (id)_fixedSelectedIdentifier
{
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[SUTabBarController selectedIdentifier](-[SUClientInterface tabBarController](-[SUScriptObject clientInterface](self, "clientInterface"), "tabBarController"), "selectedIdentifier");
  v4 = (void *)objc_msgSend(-[SUScriptObject invocationBatch:](self, "invocationBatch:", 0), "copyQueuedInvocationsForObject:", self);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (sel_isEqual((SEL)objc_msgSend(v9, "selector"), sel__setSelectedIdentifier_))
        {
          v11 = 0;
          objc_msgSend(v9, "getArgument:atIndex:", &v11, 2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v3 = (NSString *)v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_setSelectedIdentifier:(id)a3
{
  -[SUTabBarController setSelectedIdentifier:](-[SUClientInterface tabBarController](-[SUScriptObject clientInterface](self, "clientInterface"), "tabBarController"), "setSelectedIdentifier:", a3);
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_24, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSectionsController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_19, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSectionsController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptSectionsController;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_24, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_19 = (uint64_t)sel_sectionWithIdentifier_;
    unk_255186460 = CFSTR("sectionWithIdentifier");
    qword_255186468 = (uint64_t)sel_setRootViewController_forSection_;
    unk_255186470 = CFSTR("setRootViewControllerForSection");
    __KeyMapping_24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("sections"), CFSTR("selectedSection"), CFSTR("selectedSection"), 0);
  }
}

@end
