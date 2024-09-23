@implementation DOMHTMLTextAreaElement(UIWebInteraction)

- (uint64_t)nodeCanBecomeFirstResponder
{
  return objc_msgSend(a1, "readOnly") ^ 1;
}

@end
