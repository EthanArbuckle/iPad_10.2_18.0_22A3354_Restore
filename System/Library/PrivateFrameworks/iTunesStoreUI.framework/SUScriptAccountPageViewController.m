@implementation SUScriptAccountPageViewController

- (id)newNativeViewController
{
  SUAccountViewController *v3;
  NSArray *v4;

  v3 = objc_alloc_init(SUAccountViewController);
  -[SUViewController setClientInterface:](v3, "setClientInterface:", -[SUScriptObject clientInterface](self, "clientInterface"));
  v4 = -[SUScriptStorePageViewController URLStrings](self, "URLStrings");
  if (v4)
    -[SUScriptStorePageViewController applyURLStrings:toViewController:](self, "applyURLStrings:toViewController:", v4, v3);
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesAccountPageViewController");
}

- (void)setStyle:(id)a3
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

uint64_t __46__SUScriptAccountPageViewController_setStyle___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "nativeViewController");
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "styleNameSignUp")) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "styleNameViewAccount")))
  {
    v3 = 2;
  }
  else
  {
    v3 = 0;
  }
  return objc_msgSend(v2, "setStyle:", v3);
}

- (NSString)style
{
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
  v12 = __Block_byref_object_copy__39;
  v13 = __Block_byref_object_dispose__39;
  v14 = 0;
  v7 = MEMORY[0x24BDAC760];
  WebThreadRunOnMainThread();
  v3 = (void *)v10[5];
  if (v3)
    v4 = v3;
  else
    v4 = -[SUScriptAccountPageViewController styleNameDefault](self, "styleNameDefault", v7, 3221225472, __42__SUScriptAccountPageViewController_style__block_invoke, &unk_24DE7BE08, self, &v9);
  v5 = v4;
  _Block_object_dispose(&v9, 8);
  return v5;
}

id __42__SUScriptAccountPageViewController_style__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "nativeViewController"), "style");
  if (v2 == 2)
    goto LABEL_4;
  if (v2 == 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 32), "styleNameSignUp");
LABEL_4:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 32), "styleNameViewAccount");
  }
  result = (id)objc_msgSend(*(id *)(a1 + 32), "styleNameDefault");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSString)styleNameDefault
{
  return (NSString *)CFSTR("default");
}

- (NSString)styleNameSignUp
{
  return (NSString *)CFSTR("signup");
}

- (NSString)styleNameViewAccount
{
  return (NSString *)CFSTR("viewaccount");
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_51, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAccountPageViewController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAccountPageViewController;
  v2 = -[SUScriptStorePageViewController scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  objc_msgSend(v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_51, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    __KeyMapping_51 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("style"), CFSTR("STYLE_DEFAULT"), CFSTR("styleNameDefault"), CFSTR("STYLE_SIGN_UP"), CFSTR("styleNameSignUp"), CFSTR("STYLE_VIEW_ACCOUNT"), CFSTR("styleNameViewAccount"), 0);
}

@end
