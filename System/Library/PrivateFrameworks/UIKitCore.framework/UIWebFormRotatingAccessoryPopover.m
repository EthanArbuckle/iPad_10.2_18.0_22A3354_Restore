@implementation UIWebFormRotatingAccessoryPopover

- (UIWebFormRotatingAccessoryPopover)initWithDOMNode:(id)a3
{
  UIWebFormRotatingAccessoryPopover *v3;
  UIWebFormRotatingAccessoryPopover *v4;
  UIWebFormRotatingAccessoryPopover *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebFormRotatingAccessoryPopover;
  v3 = -[UIWebRotatingNodePopover initWithDOMNode:](&v7, sel_initWithDOMNode_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIWebRotatingNodePopover setDismissDelegate:](v3, "setDismissDelegate:", v3);
    v5 = v4;
  }

  return v4;
}

- (void)accessoryDone
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WebThreadLock();
  -[UIWebRotatingNodePopover node](self, "node");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ownerDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webFrame");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  +[UIWebBrowserView getUIWebBrowserViewForWebFrame:](UIWebBrowserView, "getUIWebBrowserViewForWebFrame:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryDone");

}

- (unint64_t)popoverArrowDirections
{
  if ((unint64_t)(objc_msgSend((id)UIApp, "_defaultSceneInterfaceOrientationReturningUnknownForNilScene:", 0)
                        - 3) > 1)
    return 3;
  if (UIKeyboardAutomaticIsOnScreen())
    return 12;
  return 3;
}

- (void)popoverWasDismissed:(id)a3
{
  void *v4;

  -[UIWebRotatingNodePopover node](self, "node", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[UIWebFormRotatingAccessoryPopover accessoryDone](self, "accessoryDone");
}

@end
