@implementation UIInputViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIInputViewController;
  -[UIViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIInputViewController;
  -[UIViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (BOOL)_isPlaceholder
{
  return self->_viewConformsToRemotePlaceholder;
}

- (UIInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIInputViewController *v4;
  UIInputViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIInputViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[UIInputViewController _setupInputController](v4, "_setupInputController");
  return v5;
}

- (void)_setupInputController
{
  _UITextDocumentInterface *v3;
  UITextDocumentProxy *textDocumentProxy;

  if (objc_msgSend((id)objc_opt_class(), "_requiresProxyInterface"))
  {
    v3 = objc_alloc_init(_UITextDocumentInterface);
    -[_UITextDocumentInterface setDelegate:](v3, "setDelegate:", self);
    textDocumentProxy = self->_textDocumentProxy;
    self->_textDocumentProxy = (UITextDocumentProxy *)v3;

  }
}

- (void)setView:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIInputViewController;
  -[UIViewController setView:](&v5, sel_setView_, a3);
  -[UIInputViewController _updateConformanceCache](self, "_updateConformanceCache");
  if (objc_msgSend((id)objc_opt_class(), "_requiresProxyInterface"))
  {
    -[UIInputViewController inputView](self, "inputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setDisableSplitSupport:", 1);

  }
}

- (void)_updateConformanceCache
{
  id v3;

  -[UIViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  self->_viewConformsToRemotePlaceholder = objc_opt_respondsToSelector() & 1;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  UITextDocumentProxy *textDocumentProxy;
  objc_super v6;

  -[UIInputViewController _proxyInterface](self, "_proxyInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForwardingInterface:", 0);

  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  textDocumentProxy = self->_textDocumentProxy;
  self->_textDocumentProxy = 0;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewController;
  -[UIViewController dealloc](&v6, sel_dealloc);
}

- (id)_textDocumentInterface
{
  void *v2;
  void *v3;
  id v4;

  -[UIInputViewController textDocumentProxy](self, "textDocumentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMemberOfClass:", objc_opt_class()))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)_proxyInterface
{
  void *v2;
  void *v3;
  id v4;

  -[UIInputViewController textDocumentProxy](self, "textDocumentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EDF79EA8))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)textDocumentProxy
{
  return self->_textDocumentProxy;
}

- (void)_setExtensionContextUUID:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIInputViewController;
  -[UIViewController _setExtensionContextUUID:](&v7, sel__setExtensionContextUUID_, a3);
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewController;
  -[UIViewController extensionContext](&v6, sel_extensionContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[UIInputViewController _proxyInterface](self, "_proxyInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setForwardingInterface:", v5);

  }
}

- (BOOL)_alignsToContentViewController
{
  return self->_alignsToContentViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_textDocumentProxy, 0);
}

- (UIInputViewController)initWithCoder:(id)a3
{
  UIInputViewController *v3;
  UIInputViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIInputViewController;
  v3 = -[UIViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[UIInputViewController _setupInputController](v3, "_setupInputController");
  return v4;
}

- (void)_setTextDocumentProxy:(id)a3
{
  UITextDocumentProxy *v4;
  void *v5;
  UITextDocumentProxy *textDocumentProxy;

  v4 = (UITextDocumentProxy *)a3;
  -[UIInputViewController _proxyInterface](self, "_proxyInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForwardingInterface:", 0);

  textDocumentProxy = self->_textDocumentProxy;
  self->_textDocumentProxy = v4;

}

- (void)_setAutosizeToCurrentKeyboard:(BOOL)a3
{
  _BOOL4 autosizeToCurrentKeyboard;
  void *v5;
  void *v6;
  id v7;

  autosizeToCurrentKeyboard = self->_autosizeToCurrentKeyboard;
  self->_autosizeToCurrentKeyboard = a3;
  if (autosizeToCurrentKeyboard != a3)
  {
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelfSizingChanged:", 1);
    -[UIViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_didChangeKeyplaneWithContext:", v7);

  }
}

- (void)loadView
{
  uint64_t v3;
  void *v4;
  void *v5;
  UIInputView *v6;
  UIInputView *v7;
  objc_super v8;

  -[UIViewController nibName](self, "nibName");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[UIViewController nibBundle](self, "nibBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInputViewController;
    -[UIViewController loadView](&v8, sel_loadView);
    -[UIInputViewController _updateConformanceCache](self, "_updateConformanceCache");
  }
  else
  {
    v6 = [UIInputView alloc];
    v7 = -[UIInputView initWithFrame:inputViewStyle:](v6, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIInputViewController setView:](self, "setView:", v7);

  }
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIInputViewController;
  -[UIViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (id)_extensionContext
{
  return 0;
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGSize result;

  v8.receiver = self;
  v8.super_class = (Class)UIInputViewController;
  LODWORD(v5) = 1148846080;
  -[UIViewController _systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v8, sel__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, 0.0, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 1;
}

- (BOOL)_shouldForwardSystemLayoutFittingSizeChanges
{
  return 1;
}

- (UIKeyboard)_keyboard
{
  return 0;
}

- (UIInputView)inputView
{
  void *v3;
  void *v4;

  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (UIInputView *)v4;
}

- (id)_compatibilityController
{
  return 0;
}

+ (BOOL)_requiresProxyInterface
{
  return 1;
}

- (void)setPrimaryLanguage:(NSString *)primaryLanguage
{
  NSString *v4;
  id v5;

  v4 = primaryLanguage;
  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setPrimaryLanguage:", v4);

}

- (BOOL)hasFullAccess
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v2 = (id *)qword_1ECD7C620;
  v13 = (void *)qword_1ECD7C620;
  if (!qword_1ECD7C620)
  {
    v3 = TCCLibrary();
    v2 = (id *)dlsym(v3, "kTCCServiceKeyboardNetwork");
    v11[3] = (uint64_t)v2;
    qword_1ECD7C620 = (uint64_t)v2;
  }
  _Block_object_dispose(&v10, 8);
  if (v2)
  {
    v4 = objc_retainAutorelease(*v2);
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v5 = off_1ECD7C618;
    v13 = off_1ECD7C618;
    if (!off_1ECD7C618)
    {
      v6 = TCCLibrary();
      v5 = dlsym(v6, "TCCAccessPreflight");
      v11[3] = (uint64_t)v5;
      off_1ECD7C618 = v5;
    }
    _Block_object_dispose(&v10, 8);
    if (v5)
      return ((unsigned int (*)(id, _QWORD))v5)(v4, 0) == 0;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TCCAccessPreflightResult __TCCAccessPreflight(CFStringRef, CFDictionaryRef)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("UIInputViewController.m"), 60, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getkTCCServiceKeyboardNetwork(void)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("UIInputViewController.m"), 61, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (BOOL)needsInputModeSwitchKey
{
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forwardingInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = needsInputModeSwitchKey___s_category;
    if (!needsInputModeSwitchKey___s_category)
    {
      v5 = __UILogCategoryGetNode("External", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v5, (unint64_t *)&needsInputModeSwitchKey___s_category);
    }
    v6 = *(NSObject **)(v5 + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      objc_msgSend(v7, "stringWithUTF8String:", "-[UIInputViewController needsInputModeSwitchKey]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "%@ was called before a connection was established to the host application. This will produce an inaccurate result. Please make sure to call this after your primary view controller has been initialized.", (uint8_t *)&v13, 0xCu);

    }
  }
  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "needsInputModeSwitchKey");

  return v11;
}

- (void)dismissKeyboard
{
  void *v2;
  id v3;

  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setShouldDismiss");

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboard");

}

- (void)proceedShouldReturnIfPossibleForASP
{
  id v2;

  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setProceedShouldReturnIfPossibleForASP");

}

- (void)advanceToNextInputMode
{
  id v2;

  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setShouldAdvanceInputMode");

}

- (void)setHasDictationKey:(BOOL)hasDictationKey
{
  _BOOL8 v3;
  void *v5;

  v3 = hasDictationKey;
  -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setHasDictation:", v3);

  self->_hasDictationKey = v3;
}

- (void)handleInputModeListFromView:(UIView *)view withEvent:(UIEvent *)event
{
  UIView *v6;
  void *v7;
  void *v8;
  double MidX;
  double MinY;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  dispatch_time_t v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  void *v36;
  double touchBegan;
  uint64_t v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  _QWORD block[9];
  CGPoint v50;
  CGPoint v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v6 = view;
  -[UIEvent touchesForView:](event, "touchesForView:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](v6, "bounds");
  MidX = CGRectGetMidX(v52);
  -[UIView bounds](v6, "bounds");
  MinY = CGRectGetMinY(v53);
  -[UIViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:toView:](v6, "convertPoint:toView:", v11, MidX, MinY);
  v13 = v12;
  v15 = v14;

  -[UIViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", v16);
  v18 = v17;
  v20 = v19;

  switch(objc_msgSend(v8, "phase"))
  {
    case 0:
      self->_inputModeListIsShown = 0;
      self->_commitInputModeOnTouchEnd = 0;
      objc_msgSend(v8, "timestamp");
      self->_touchBegan = v21;
      v22 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__UIInputViewController_handleInputModeListFromView_withEvent___block_invoke;
      block[3] = &unk_1E16B20D8;
      block[4] = self;
      *(double *)&block[5] = v13;
      *(double *)&block[6] = v15;
      *(double *)&block[7] = v18;
      *(double *)&block[8] = v20;
      dispatch_after(v22, MEMORY[0x1E0C80D38], block);
      goto LABEL_14;
    case 1:
      if (self->_inputModeListIsShown || (v23 = v15 - v20, v15 - v20 > 10.0))
      {
        -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_setInputModeList:touchBegan:fromLocation:updatePoint:", 1, self->_touchBegan, v13, v15, v18, v20);

        self->_inputModeListIsShown = 1;
      }
      if (!self->_commitInputModeOnTouchEnd)
      {
        -[UIView bounds](v6, "bounds", v23);
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        objc_msgSend(v8, "locationInView:", v6);
        v50.x = v33;
        v50.y = v34;
        v54.origin.x = v26;
        v54.origin.y = v28;
        v54.size.width = v30;
        v54.size.height = v32;
        if (!CGRectContainsPoint(v54, v50))
          self->_commitInputModeOnTouchEnd = 1;
      }
      goto LABEL_14;
    case 3:
      if (self->_inputModeListIsShown)
        goto LABEL_10;
      -[UIView bounds](v6, "bounds");
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      objc_msgSend(v8, "locationInView:", v6);
      v51.x = v47;
      v51.y = v48;
      v55.origin.x = v40;
      v55.origin.y = v42;
      v55.size.width = v44;
      v55.size.height = v46;
      if (CGRectContainsPoint(v55, v51))
      {
        self->_inputModeListIsShown = 1;
        -[UIInputViewController advanceToNextInputMode](self, "advanceToNextInputMode");
      }
      else if (self->_inputModeListIsShown)
      {
LABEL_10:
        if (self->_commitInputModeOnTouchEnd)
        {
          -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v35;
          touchBegan = self->_touchBegan;
          v38 = 3;
          goto LABEL_13;
        }
      }
LABEL_14:

      return;
    case 4:
      -[UIInputViewController _textDocumentInterface](self, "_textDocumentInterface");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      touchBegan = self->_touchBegan;
      v38 = 4;
LABEL_13:
      objc_msgSend(v35, "_setInputModeList:touchBegan:fromLocation:updatePoint:", v38, touchBegan, v13, v15, v18, v20);

      goto LABEL_14;
    default:
      goto LABEL_14;
  }
}

void __63__UIInputViewController_handleInputModeListFromView_withEvent___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[969])
  {
    objc_msgSend(v2, "_textDocumentInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setInputModeList:touchBegan:fromLocation:updatePoint:", 0, *(double *)(*(_QWORD *)(a1 + 32) + 976), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 969) = 1;
  }
}

- (void)requestSupplementaryLexiconWithCompletion:(void *)completionHandler
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = completionHandler;
  v4 = (void *)MEMORY[0x1E0DBDC80];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__UIInputViewController_requestSupplementaryLexiconWithCompletion___block_invoke;
  v8[3] = &unk_1E16CD6A0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "requestLexiconFromBundlePath:completionHandler:", v6, v8);

}

void __67__UIInputViewController_requestSupplementaryLexiconWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[UILexicon _lexiconWithTILexicon:](UILexicon, "_lexiconWithTILexicon:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)_willResetDocumentState
{
  _QWORD block[5];

  if (pthread_main_np() == 1)
  {
    -[UIInputViewController textWillChange:](self, "textWillChange:", 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__UIInputViewController__willResetDocumentState__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __48__UIInputViewController__willResetDocumentState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "textWillChange:", 0);
}

- (void)_didResetDocumentState
{
  _QWORD block[5];

  if (pthread_main_np() == 1)
  {
    -[UIInputViewController textDidChange:](self, "textDidChange:", 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__UIInputViewController__didResetDocumentState__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __47__UIInputViewController__didResetDocumentState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "textDidChange:", 0);
}

- (BOOL)_canBecomeFirstResponder
{
  return 0;
}

- (BOOL)_usesCustomBackground
{
  return 0;
}

+ (void)presentDialogForAddingKeyboard
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  SEL v8;
  id v9;
  uint64_t v10;
  id v11;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  if (v4)
  {
    if (!objc_msgSend(v4, "_isHostedInAnotherProcess"))
    {
      +[_UIDialogForAddingKeyboard presentDialogForAddingKeyboard](_UIDialogForAddingKeyboard, "presentDialogForAddingKeyboard");
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("The dialog could not be launch from keyboard extension");
    v8 = a2;
    v9 = a1;
    v10 = 412;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("No keyWindow");
    v8 = a2;
    v9 = a1;
    v10 = 410;
  }
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("UIInputViewController.m"), v10, v7);

LABEL_7:
}

- (void)set_alignsToContentViewController:(BOOL)a3
{
  self->_alignsToContentViewController = a3;
}

- (BOOL)_autosizeToCurrentKeyboard
{
  return self->_autosizeToCurrentKeyboard;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (BOOL)hasDictationKey
{
  return self->_hasDictationKey;
}

@end
