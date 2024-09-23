@implementation TSKUIActionSheet

+ (id)alertWithTitle:(id)a3 cancelButtonTitle:(id)a4 destructiveButtonTitle:(id)a5 otherButtonTitle:(id)a6 targetView:(id)a7
{
  return -[TSKUIActionSheet initWithTitle:cancelButtonTitle:destructiveButtonTitle:otherButtonTitle:targetView:]([TSKUIActionSheet alloc], "initWithTitle:cancelButtonTitle:destructiveButtonTitle:otherButtonTitle:targetView:", a3, a4, a5, a6, a7);
}

- (TSKUIActionSheet)initWithTitle:(id)a3 cancelButtonTitle:(id)a4 destructiveButtonTitle:(id)a5 otherButtonTitle:(id)a6 targetView:(id)a7
{
  TSKUIActionSheet *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSKUIActionSheet;
  v12 = -[TSKAbstractAlert init](&v14, sel_init);
  if (v12)
  {
    v12->_actionSheet = (UIActionSheet *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67C0]), "initWithTitle:delegate:cancelButtonTitle:destructiveButtonTitle:otherButtonTitles:", a3, v12, a4, a5, a6, 0);
    v12->_targetView = (UIView *)a7;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[UIActionSheet setDelegate:](self->_actionSheet, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSKUIActionSheet;
  -[TSKAbstractAlert dealloc](&v3, sel_dealloc);
}

- (void)showAlert
{
  -[UIActionSheet showInView:](self->_actionSheet, "showInView:", self->_targetView);
}

- (int64_t)addButtonWithTitle:(id)a3
{
  return -[UIActionSheet addButtonWithTitle:](self->_actionSheet, "addButtonWithTitle:", a3);
}

- (id)buttonTitleAtIndex:(int64_t)a3
{
  return -[UIActionSheet buttonTitleAtIndex:](self->_actionSheet, "buttonTitleAtIndex:", a3);
}

- (int64_t)numberOfButtons
{
  return -[UIActionSheet numberOfButtons](self->_actionSheet, "numberOfButtons");
}

- (int64_t)cancelButtonIndex
{
  return -[UIActionSheet cancelButtonIndex](self->_actionSheet, "cancelButtonIndex");
}

- (void)setCancelButtonIndex:(int64_t)a3
{
  -[UIActionSheet setCancelButtonIndex:](self->_actionSheet, "setCancelButtonIndex:", a3);
}

- (int64_t)firstOtherButtonIndex
{
  return -[UIActionSheet firstOtherButtonIndex](self->_actionSheet, "firstOtherButtonIndex");
}

- (void)dismissWithClickedButtonIndex:(int64_t)a3 animated:(BOOL)a4
{
  -[UIActionSheet dismissWithClickedButtonIndex:animated:](self->_actionSheet, "dismissWithClickedButtonIndex:animated:", a3, a4);
}

- (void)actionSheet:(id)a3 clickedButtonAtIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  if (self->_actionSheet != a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIActionSheet actionSheet:clickedButtonAtIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 590, CFSTR("Wrong action sheet"));
  }
  -[TSKAbstractAlert clickedButtonAtIndex:](self, "clickedButtonAtIndex:", a4);
}

- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  if (self->_actionSheet != a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIActionSheet actionSheet:didDismissWithButtonIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 596, CFSTR("Wrong action sheet"));
  }
  -[TSKAbstractAlert didDismissWithButtonIndex:](self, "didDismissWithButtonIndex:", a4);
}

- (void)actionSheet:(id)a3 willDismissWithButtonIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;

  if (self->_actionSheet != a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIActionSheet actionSheet:willDismissWithButtonIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 606, CFSTR("Wrong action sheet"));
  }
  -[TSKAbstractAlert willDismissWithButtonIndex:](self, "willDismissWithButtonIndex:", a4);
}

- (void)didPresentActionSheet:(id)a3
{
  void *v5;
  uint64_t v6;

  if (self->_actionSheet != a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIActionSheet didPresentActionSheet:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 613, CFSTR("Wrong action sheet"));
  }
  -[TSKAbstractAlert _didPresentAlertView:](self, "_didPresentAlertView:", a3);
}

- (void)willPresentActionSheet:(id)a3
{
  void *v4;
  uint64_t v5;

  if (self->_actionSheet != a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKUIActionSheet willPresentActionSheet:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKUIAlert.mm"), 620, CFSTR("Wrong action sheet"));
  }
  -[TSKAbstractAlert willPresentAlertView](self, "willPresentAlertView");
}

@end
