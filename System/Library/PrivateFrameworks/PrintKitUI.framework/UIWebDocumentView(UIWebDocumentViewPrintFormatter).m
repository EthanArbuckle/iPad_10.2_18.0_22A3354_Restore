@implementation UIWebDocumentView(UIWebDocumentViewPrintFormatter)

- (uint64_t)_printFormatterClass
{
  return objc_opt_class();
}

@end
