@implementation TSKUIAlert

+ (void)setUseMockUIAlert:(BOOL)a3
{
  gUseMockUIAlert = a3;
}

+ (id)alertWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6
{
  __objc2_class **v6;

  if (gUseMockUIAlert)
    v6 = off_24D826E18;
  else
    v6 = off_24D826EE8;
  return (id)objc_msgSend(objc_alloc(*v6), "initWithTitle:message:cancelButtonTitle:otherButtonTitle:", a3, a4, a5, a6);
}

- (TSKUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6
{
  TSKUIAlert *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSKUIAlert;
  v10 = -[TSKAbstractAlert init](&v12, sel_init);
  if (v10)
    v10->_alertView = (UIAlertView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67F8]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", a3, a4, v10, a5, a6, 0);
  return v10;
}

- (TSKUIAlert)initWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 otherOtherButtonTitle:(id)a7
{
  TSKUIAlert *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSKUIAlert;
  v12 = -[TSKAbstractAlert init](&v14, sel_init);
  if (v12)
    v12->_alertView = (UIAlertView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67F8]), "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", a3, a4, v12, a5, a6, a7, 0);
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[UIAlertView setDelegate:](self->_alertView, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSKUIAlert;
  -[TSKAbstractAlert dealloc](&v3, sel_dealloc);
}

- (void)showAlert
{
  -[UIAlertView show](self->_alertView, "show");
}

- (int64_t)addButtonWithTitle:(id)a3
{
  return -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", a3);
}

- (id)buttonTitleAtIndex:(int64_t)a3
{
  return -[UIAlertView buttonTitleAtIndex:](self->_alertView, "buttonTitleAtIndex:", a3);
}

- (int64_t)numberOfButtons
{
  return -[UIAlertView numberOfButtons](self->_alertView, "numberOfButtons");
}

- (int64_t)cancelButtonIndex
{
  return -[UIAlertView cancelButtonIndex](self->_alertView, "cancelButtonIndex");
}

- (void)setCancelButtonIndex:(int64_t)a3
{
  -[UIAlertView setCancelButtonIndex:](self->_alertView, "setCancelButtonIndex:", a3);
}

- (int64_t)firstOtherButtonIndex
{
  return -[UIAlertView firstOtherButtonIndex](self->_alertView, "firstOtherButtonIndex");
}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  -[UIAlertView dismissWithClickedButtonIndex:animated:](self->_alertView, "dismissWithClickedButtonIndex:animated:", a3, a4);
  if (self->super._inBackground)
  {
    -[TSKUIAlert alertView:willDismissWithButtonIndex:](self, "alertView:willDismissWithButtonIndex:", self->_alertView, a3);
    -[TSKUIAlert alertView:didDismissWithButtonIndex:](self, "alertView:didDismissWithButtonIndex:", self->_alertView, a3);
  }
}

- (void)alertView:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  if (self->_alertView != a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIAlert alertView:clickedButtonAtIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 465, CFSTR("Wrong alert view"));
  }
  -[TSKAbstractAlert clickedButtonAtIndex:](self, "clickedButtonAtIndex:", a4);
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  if (self->_alertView != a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIAlert alertView:didDismissWithButtonIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 471, CFSTR("Wrong alert view"));
  }
  -[TSKAbstractAlert didDismissWithButtonIndex:](self, "didDismissWithButtonIndex:", a4);
}

- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  if (self->_alertView != a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIAlert alertView:willDismissWithButtonIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 481, CFSTR("Wrong alert view"));
  }
  -[TSKAbstractAlert willDismissWithButtonIndex:](self, "willDismissWithButtonIndex:", a4);
}

- (void)didPresentAlertView:(id)a3
{
  void *v5;
  uint64_t v6;

  if (self->_alertView != a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIAlert didPresentAlertView:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 488, CFSTR("Wrong alert view"));
  }
  -[TSKAbstractAlert _didPresentAlertView:](self, "_didPresentAlertView:", a3);
}

- (void)willPresentAlertView:(id)a3
{
  void *v4;
  uint64_t v5;

  if (self->_alertView != a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIAlert willPresentAlertView:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 495, CFSTR("Wrong alert view"));
  }
  -[TSKAbstractAlert willPresentAlertView](self, "willPresentAlertView");
}

@end
