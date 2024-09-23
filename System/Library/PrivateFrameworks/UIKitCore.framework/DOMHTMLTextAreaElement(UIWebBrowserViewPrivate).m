@implementation DOMHTMLTextAreaElement(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return objc_msgSend(a3, "_startAssistingKeyboard");
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  return objc_msgSend(a3, "_stopAssistingKeyboard");
}

- (uint64_t)_requiresAccessoryView
{
  return 1;
}

- (uint64_t)_requiresInputView
{
  return 1;
}

- (uint64_t)_supportsAutoFill
{
  return 1;
}

@end
