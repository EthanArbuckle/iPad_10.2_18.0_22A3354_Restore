@implementation DOMHTMLInputElement(UIWebBrowserViewPrivate)

- (uint64_t)_startAssistingDocumentView:()UIWebBrowserViewPrivate
{
  if (objc_msgSend(a1, "isAssistedDateType"))
    return objc_msgSend(a3, "_startAssistingNode:", a1);
  else
    return objc_msgSend(a3, "_startAssistingKeyboard");
}

- (uint64_t)_stopAssistingDocumentView:()UIWebBrowserViewPrivate
{
  if (objc_msgSend(a1, "isAssistedDateType"))
    return objc_msgSend(a3, "_stopAssistingNode:", a1);
  else
    return objc_msgSend(a3, "_stopAssistingKeyboard");
}

- (BOOL)_requiresAccessoryView
{
  return (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1|| (objc_msgSend(a1, "isAssistedDateType") & 1) == 0;
}

- (BOOL)_requiresInputView
{
  return (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1|| (objc_msgSend(a1, "isAssistedDateType") & 1) == 0;
}

- (uint64_t)_supportsAutoFill
{
  return 1;
}

- (uint64_t)_supportsAccessoryClear
{
  if ((-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)return 0;
  else
    return objc_msgSend(a1, "isAssistedDateType");
}

- (uint64_t)_accessoryClear
{
  return objc_msgSend(a1, "setValueWithChangeEvent:", &stru_1E16EDF20);
}

@end
