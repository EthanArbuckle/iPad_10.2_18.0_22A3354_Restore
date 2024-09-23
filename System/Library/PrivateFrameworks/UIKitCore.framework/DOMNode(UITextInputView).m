@implementation DOMNode(UITextInputView)

- (id)textInputView
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "ownerDocument");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "webFrame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_UIKitDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
