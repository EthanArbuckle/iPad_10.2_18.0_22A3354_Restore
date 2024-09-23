@implementation DOMHTMLSelectElement(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return objc_msgSend(a3, "_startAssistingNode:", a1);
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return objc_msgSend(a3, "_stopAssistingNode:", a1);
}

- (BOOL)_requiresAccessoryView
{
  return (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (BOOL)_requiresInputView
{
  return (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1;
}

- (uint64_t)_supportsAutoFill
{
  return 0;
}

@end
