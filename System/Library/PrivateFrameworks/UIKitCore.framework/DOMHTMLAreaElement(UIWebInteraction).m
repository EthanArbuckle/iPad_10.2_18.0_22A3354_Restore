@implementation DOMHTMLAreaElement(UIWebInteraction)

- (id)absoluteQuadsAtPoint:()UIWebInteraction
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "ownerDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webFrame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "webView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "convertPoint:toView:", 0, a2, a3);
  objc_msgSend(v8, "elementAtPoint:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DD97E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "absoluteQuadsWithOwner:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
