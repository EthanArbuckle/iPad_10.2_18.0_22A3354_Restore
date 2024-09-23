@implementation SUScriptAction

- (SUScriptAction)initWithActionType:(id)a3
{
  SUScriptAction *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptAction;
  v4 = -[SUScriptObject init](&v6, sel_init);
  if (v4)
    v4->_actionType = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptAction;
  -[SUScriptObject dealloc](&v3, sel_dealloc);
}

- (void)performAction
{
  NSString *v3;
  int IsCurrent;
  void *v5;
  void (*v6)(void *, _QWORD *);
  _QWORD *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = -[SUScriptAction actionType](self, "actionType");
  IsCurrent = WebThreadIsCurrent();
  if (IsCurrent)
    v5 = &__block_literal_global_14;
  else
    v5 = &__block_literal_global_3;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("SUScriptActionTypeReturnToLibrary")))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __31__SUScriptAction_performAction__block_invoke_3;
    v9[3] = &unk_24DE7AF90;
    v9[4] = self;
    v6 = (void (*)(void *, _QWORD *))__31__SUScriptAction_performAction__block_invoke_2;
    if (IsCurrent)
      v6 = (void (*)(void *, _QWORD *))__31__SUScriptAction_performAction__block_invoke;
    v7 = v9;
LABEL_16:
    v6(v5, v7);
    return;
  }
  if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("SUScriptActionTypeDismissWindows")))
  {
    if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("SUScriptActionTypeDismissSheet")))
      return;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __31__SUScriptAction_performAction__block_invoke_5;
    v8[3] = &unk_24DE7AF90;
    v8[4] = self;
    v6 = (void (*)(void *, _QWORD *))__31__SUScriptAction_performAction__block_invoke_2;
    if (IsCurrent)
      v6 = (void (*)(void *, _QWORD *))__31__SUScriptAction_performAction__block_invoke;
    v7 = v8;
    goto LABEL_16;
  }
  if (IsCurrent)
    ((void (*)(void *, void *))__31__SUScriptAction_performAction__block_invoke)(v5, &__block_literal_global_5);
  else
    __31__SUScriptAction_performAction__block_invoke_2((uint64_t)v5, &__block_literal_global_5);
}

uint64_t __31__SUScriptAction_performAction__block_invoke()
{
  return WebThreadRunOnMainThread();
}

void __31__SUScriptAction_performAction__block_invoke_2(uint64_t a1, void *a2)
{
  dispatch_async(MEMORY[0x24BDAC9B8], a2);
}

uint64_t __31__SUScriptAction_performAction__block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "_returnToLibrary");
}

uint64_t __31__SUScriptAction_performAction__block_invoke_4()
{
  return objc_msgSend((id)objc_msgSend(+[SUClientDispatch tabBarController](SUClientDispatch, "tabBarController"), "overlayBackgroundViewController"), "dismissAnimated:", 1);
}

uint64_t __31__SUScriptAction_performAction__block_invoke_5(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parentViewController"), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (NSString)actionType
{
  NSString *v3;

  -[SUScriptObject lock](self, "lock");
  v3 = self->_actionType;
  -[SUScriptObject unlock](self, "unlock");
  return v3;
}

- (id)_className
{
  return CFSTR("iTunesAction");
}

- (void)setActionType:(id)a3
{
  NSString *actionType;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    a3 = 0;
  -[SUScriptObject lock](self, "lock");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    actionType = self->_actionType;
    if (actionType != a3)
    {

      self->_actionType = (NSString *)objc_msgSend(a3, "copy");
    }
  }
  -[SUScriptObject unlock](self, "unlock");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SUScriptObject lock](self, "lock");
  v5[9] = -[NSString copyWithZone:](self->_actionType, "copyWithZone:", a3);
  -[SUScriptObject unlock](self, "unlock");
  return v5;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result;
  objc_super v6;

  result = (id)objc_msgSend((id)__KeyMapping_57, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAction;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_42, 1);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptAction;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  NSMutableArray *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptAction;
  v2 = -[SUScriptObject scriptAttributeKeys](&v4, sel_scriptAttributeKeys);
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", objc_msgSend((id)__KeyMapping_57, "allKeys"));
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_42 = (uint64_t)sel_performAction;
    unk_255186D30 = CFSTR("performAction");
    __KeyMapping_57 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("actionType"), 0);
  }
}

@end
