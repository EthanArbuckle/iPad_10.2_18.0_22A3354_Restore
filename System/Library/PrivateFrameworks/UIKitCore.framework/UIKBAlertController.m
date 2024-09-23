@implementation UIKBAlertController

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKBAlertController;
  -[UIAlertController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  -[UIKBAlertController kbDelegate](self, "kbDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UIKBAlertController kbDelegate](self, "kbDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertDidDismiss");

  }
}

- (UIKBAlertControllerDelegate)kbDelegate
{
  return self->_kbDelegate;
}

- (void)setKbDelegate:(id)a3
{
  self->_kbDelegate = (UIKBAlertControllerDelegate *)a3;
}

@end
