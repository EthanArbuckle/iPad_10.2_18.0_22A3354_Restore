@implementation UIView(UIPrintFormatter)

- (uint64_t)_printFormatterClass
{
  return objc_opt_class();
}

- (id)viewPrintFormatter
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_printFormatterClass")), "_initWithView:", a1);
}

@end
