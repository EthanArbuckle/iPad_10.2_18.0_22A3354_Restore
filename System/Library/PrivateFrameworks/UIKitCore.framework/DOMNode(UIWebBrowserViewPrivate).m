@implementation DOMNode(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  uint64_t result;

  result = objc_msgSend(a1, "isContentEditable");
  if ((_DWORD)result)
    return objc_msgSend(a3, "_startAssistingKeyboard");
  return result;
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  uint64_t result;

  result = objc_msgSend(a1, "isContentEditable");
  if ((_DWORD)result)
    return objc_msgSend(a3, "_stopAssistingKeyboard");
  return result;
}

- (uint64_t)_supportsAutoFill
{
  return 0;
}

- (uint64_t)_supportsAccessoryClear
{
  return 0;
}

- (void)_nextAssistedNode
{
  void *v1;
  void *v2;

  while (1)
  {
    v1 = (void *)objc_msgSend(a1, "nextFocusNode");
    v2 = v1;
    if (!v1 || (objc_msgSend(v1, "nodeCanBecomeFirstResponder") & 1) != 0)
      break;
    a1 = v2;
  }
  return v2;
}

- (void)_previousAssistedNode
{
  void *v1;
  void *v2;

  while (1)
  {
    v1 = (void *)objc_msgSend(a1, "previousFocusNode");
    v2 = v1;
    if (!v1 || (objc_msgSend(v1, "nodeCanBecomeFirstResponder") & 1) != 0)
      break;
    a1 = v2;
  }
  return v2;
}

- (void)_textFormElement
{
  if (objc_msgSend(a1, "isContentEditable"))
    return a1;
  else
    return 0;
}

@end
