@implementation UIWebViewPrintFormatter

- (id)_webDocumentView
{
  void *v2;
  void *v3;

  -[UIViewPrintFormatter view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_documentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
