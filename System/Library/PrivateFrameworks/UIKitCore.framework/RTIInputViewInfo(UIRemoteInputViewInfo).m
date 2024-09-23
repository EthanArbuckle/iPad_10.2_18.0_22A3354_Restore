@implementation RTIInputViewInfo(UIRemoteInputViewInfo)

- (UIRemoteInputViewInfo)uiRemoteInputViewInfoForProcessId:()UIRemoteInputViewInfo
{
  UIRemoteInputViewInfo *v5;

  v5 = objc_alloc_init(UIRemoteInputViewInfo);
  -[UIRemoteInputViewInfo setProcessId:](v5, "setProcessId:", a3);
  -[UIRemoteInputViewInfo setContextId:](v5, "setContextId:", objc_msgSend(a1, "contextId"));
  objc_msgSend(a1, "insets");
  -[UIRemoteInputViewInfo setInsets:](v5, "setInsets:");
  objc_msgSend(a1, "size");
  -[UIRemoteInputViewInfo setSize:](v5, "setSize:");
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    -[UIRemoteInputViewInfo setShouldShowDockView:](v5, "setShouldShowDockView:", objc_msgSend(a1, "performSelector:", sel_shouldShowDockView) != 0);
  return v5;
}

@end
