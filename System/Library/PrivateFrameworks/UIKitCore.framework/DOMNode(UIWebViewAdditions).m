@implementation DOMNode(UIWebViewAdditions)

- (uint64_t)convertRect:()UIWebViewAdditions toView:
{
  void *v13;
  uint64_t result;

  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "documentView"), "convertRect:toView:", 0, a2, a3, a4, a5);
  if (v13 != a7)
    return objc_msgSend(v13, "convertRect:toView:", a7);
  return result;
}

- (uint64_t)isTextControl
{
  return 0;
}

- (uint64_t)isSecure
{
  return 0;
}

- (uint64_t)keyboardType
{
  return 0;
}

@end
