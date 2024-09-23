@implementation TSWPEffectsWindow

- (TSWPEffectsWindow)initWithFrame:(CGRect)a3
{
  TSWPEffectsWindow *v3;
  UITextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPEffectsWindow;
  v3 = -[TSWPEffectsWindow initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6EF8]), "initWithFrame:", 0.0, 0.0, 10.0, 10.0);
    v3->_dummyToReclaimFirstResponder = v4;
    -[UITextView setHidden:](v4, "setHidden:", 1);
    -[TSWPEffectsWindow addSubview:](v3, "addSubview:", v3->_dummyToReclaimFirstResponder);
    v3->_readyToGo = 1;
  }
  return v3;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[UITextView removeFromSuperview](self->_dummyToReclaimFirstResponder, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)TSWPEffectsWindow;
  -[TSWPEffectsWindow dealloc](&v3, sel_dealloc);
}

- (void)didAddSubview:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPEffectsWindow;
  -[TSWPEffectsWindow didAddSubview:](&v4, sel_didAddSubview_, a3);
  if (self->_readyToGo)
  {
    if (!self->_activeEffectsCount || -[TSWPEffectsWindow isHidden](self, "isHidden"))
      -[TSWPEffectsWindow setHidden:](self, "setHidden:", 0);
    ++self->_activeEffectsCount;
  }
}

- (void)willRemoveSubview:(id)a3
{
  unsigned int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPEffectsWindow;
  -[TSWPEffectsWindow willRemoveSubview:](&v6, sel_willRemoveSubview_);
  if (self->_readyToGo)
  {
    v5 = self->_activeEffectsCount - 1;
    self->_activeEffectsCount = v5;
    if (!v5)
      -[TSWPEffectsWindow setHidden:](self, "setHidden:", 1);
    objc_opt_class();
    TSUFindFirstResponderView();
    if (objc_msgSend((id)TSUDynamicCast(), "isDescendantOfView:", a3))
    {
      -[UITextView becomeFirstResponder](self->_dummyToReclaimFirstResponder, "becomeFirstResponder");
      -[UITextView resignFirstResponder](self->_dummyToReclaimFirstResponder, "resignFirstResponder");
    }
  }
}

- (void)p_updateForOrientation:(int64_t)a3
{
  -[TSWPEffectsWindow _setWindowInterfaceOrientation:](self, "_setWindowInterfaceOrientation:", a3);
  -[TSWPEffectsWindow _updateTransformLayer](self, "_updateTransformLayer");
}

+ (id)sharedEffectsWindowAboveStatusBar
{
  void *v2;
  TSWPEffectsWindow *v3;
  uint64_t v4;

  v2 = (void *)sEffectsWindowAboveStatusBar;
  if (!sEffectsWindowAboveStatusBar)
  {
    v3 = [TSWPEffectsWindow alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    sEffectsWindowAboveStatusBar = -[TSWPEffectsWindow initWithFrame:](v3, "initWithFrame:");
    objc_msgSend((id)sEffectsWindowAboveStatusBar, "setUserInteractionEnabled:", 1);
    objc_msgSend((id)sEffectsWindowAboveStatusBar, "setWindowLevel:", *MEMORY[0x24BDF8010] + 1.0);
    objc_msgSend((id)sEffectsWindowAboveStatusBar, "setAutoresizesSubviews:", 0);
    v2 = (void *)sEffectsWindowAboveStatusBar;
  }
  objc_msgSend(v2, "p_updateForOrientation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation"));
  v4 = objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  objc_msgSend((id)sEffectsWindowAboveStatusBar, "setBackgroundColor:", v4);
  return (id)sEffectsWindowAboveStatusBar;
}

+ (id)sharedEffectsWindowAboveStatusBarForView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  TSWPEffectsWindow *AssociatedObject;
  TSWPEffectsWindow *v10;

  if (!a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEffectsWindow.mm"), 160, CFSTR("invalid nil value for '%s'"), "view");
  }
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "window"), "windowScene");
  if (!v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPEffectsWindow sharedEffectsWindowAboveStatusBarForView:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPEffectsWindow.mm"), 164, CFSTR("invalid nil value for '%s'"), "viewScene");
  }
  AssociatedObject = (TSWPEffectsWindow *)objc_getAssociatedObject(v6, (const void *)kTSWPEffectsWindow);
  if (!AssociatedObject)
  {
    v10 = [TSWPEffectsWindow alloc];
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "bounds");
    AssociatedObject = -[TSWPEffectsWindow initWithFrame:](v10, "initWithFrame:");
    -[TSWPEffectsWindow setUserInteractionEnabled:](AssociatedObject, "setUserInteractionEnabled:", 1);
    -[TSWPEffectsWindow setWindowLevel:](AssociatedObject, "setWindowLevel:", *MEMORY[0x24BDF8010] + 1.0);
    -[TSWPEffectsWindow setAutoresizesSubviews:](AssociatedObject, "setAutoresizesSubviews:", 0);
    -[TSWPEffectsWindow setWindowScene:](AssociatedObject, "setWindowScene:", v6);
    objc_setAssociatedObject(v6, (const void *)kTSWPEffectsWindow, AssociatedObject, (void *)1);
  }
  -[TSWPEffectsWindow p_updateForOrientation:](AssociatedObject, "p_updateForOrientation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "interfaceOrientation"));
  -[TSWPEffectsWindow setBackgroundColor:](AssociatedObject, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BDF6950], "clearColor"));
  return AssociatedObject;
}

- (void)pDidChangeStatusBarOrientation:(id)a3
{
  objc_msgSend((id)sEffectsWindowAboveStatusBar, "p_updateForOrientation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "keyWindow"), "windowScene"), "interfaceOrientation"));
}

@end
