@implementation WebFrame(UIWebDocumentViewTextSelecting)

- (BOOL)hasBodyElement
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_msgSend(a1, "DOMDocument");
  v2 = objc_msgSend(v1, "documentElement");
  return !v1 || v2 == 0;
}

@end
