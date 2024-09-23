@implementation SUScriptRedeemCameraViewController

- (NSString)backButtonTitle
{
  return self->_backButtonTitle;
}

- (id)_className
{
  return CFSTR("iTunesRedeemCameraViewController");
}

- (WebScriptObject)codeHandler
{
  return self->_codeHandler;
}

- (void)setBackButtonTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_backButtonTitle, a3);
  v5 = a3;
  -[SUScriptRedeemCameraViewController _performAction:withObject:](self, "_performAction:withObject:", 6, v5);

}

- (void)setCodeHandler:(id)a3
{
  id v5;

  v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
  else
    objc_storeStrong((id *)&self->_codeHandler, a3);

}

- (void)codeDetected:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  WebThreadRunOnMainThread();

}

void __51__SUScriptRedeemCameraViewController_codeDetected___block_invoke(uint64_t a1)
{
  SUScriptFunction *v2;
  void *v3;
  SUScriptFunction *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = [SUScriptFunction alloc];
  objc_msgSend(*(id *)(a1 + 32), "codeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUScriptFunction initWithScriptObject:](v2, "initWithScriptObject:", v3);

  -[SUScriptFunction setThisObject:](v4, "setThisObject:", *(_QWORD *)(a1 + 32));
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUScriptFunction callWithArguments:](v4, "callWithArguments:", v5);

  -[SUScriptFunction setThisObject:](v4, "setThisObject:", 0);
}

- (void)dismiss
{
  -[SUScriptRedeemCameraViewController _performAction:withObject:](self, "_performAction:withObject:", 0, 0);
}

- (void)pauseCamera
{
  -[SUScriptRedeemCameraViewController _performAction:withObject:](self, "_performAction:withObject:", 2, 0);
}

- (void)present
{
  -[SUScriptRedeemCameraViewController _performAction:withObject:](self, "_performAction:withObject:", 1, self);
}

- (void)recognitionError
{
  -[SUScriptRedeemCameraViewController _performAction:withObject:](self, "_performAction:withObject:", 4, 0);
}

- (void)recognitionSuccess
{
  -[SUScriptRedeemCameraViewController _performAction:withObject:](self, "_performAction:withObject:", 5, 0);
}

- (void)resumeCamera
{
  -[SUScriptRedeemCameraViewController _performAction:withObject:](self, "_performAction:withObject:", 3, 0);
}

- (void)_performAction:(int64_t)a3 withObject:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  WebThreadRunOnMainThread();

}

void __64__SUScriptRedeemCameraViewController__performAction_withObject___block_invoke(uint64_t a1)
{
  void *v2;
  SURedeemCameraViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (*(_QWORD *)(a1 + 48) == 1
    && (objc_msgSend(*(id *)(a1 + 32), "redeemCameraViewController"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    v3 = objc_alloc_init(SURedeemCameraViewController);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__SUScriptRedeemCameraViewController__performAction_withObject___block_invoke_2;
    v8[3] = &unk_24DE7B790;
    objc_copyWeak(&v9, &location);
    -[SURedeemCameraViewController setCodeHandler:](v3, "setCodeHandler:", v8);
    objc_msgSend(*(id *)(a1 + 32), "clientInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURedeemCameraViewController setIgnoreDefaultKeyboardNotifications:](v3, "setIgnoreDefaultKeyboardNotifications:", objc_msgSend(v4, "ignoreDefaultKeyboardNotifications"));

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v3);
    objc_msgSend(v5, "setModalPresentationStyle:", 2);
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "setRedeemCameraViewController:", v3);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "redeemCameraViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performAction:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

void __64__SUScriptRedeemCameraViewController__performAction_withObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "codeDetected:", v3);

  objc_destroyWeak(&to);
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemCameraViewController;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_1, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptRedeemCameraViewController;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptRedeemCameraViewController;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_3, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_1 = (uint64_t)sel_dismiss;
    *(_QWORD *)algn_255185E48 = CFSTR("dismiss");
    qword_255185E50 = (uint64_t)sel_pauseCamera;
    unk_255185E58 = CFSTR("pauseCamera");
    qword_255185E60 = (uint64_t)sel_present;
    unk_255185E68 = CFSTR("present");
    qword_255185E70 = (uint64_t)sel_recognitionError;
    unk_255185E78 = CFSTR("recognitionError");
    qword_255185E80 = (uint64_t)sel_recognitionSuccess;
    unk_255185E88 = CFSTR("recognitionSuccess");
    qword_255185E90 = (uint64_t)sel_resumeCamera;
    unk_255185E98 = CFSTR("resumeCamera");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("backButtonTitle"), CFSTR("codeHandler"), CFSTR("codeHandler"), 0);
    v3 = (void *)__KeyMapping_3;
    __KeyMapping_3 = v2;

  }
}

- (SURedeemCameraViewController)redeemCameraViewController
{
  return (SURedeemCameraViewController *)objc_loadWeakRetained((id *)&self->_redeemCameraViewController);
}

- (void)setRedeemCameraViewController:(id)a3
{
  objc_storeWeak((id *)&self->_redeemCameraViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_redeemCameraViewController);
  objc_storeStrong((id *)&self->_codeHandler, 0);
  objc_storeStrong((id *)&self->_backButtonTitle, 0);
}

@end
