@implementation UITextView(UITextViewPrintFormatter)

- (uint64_t)_printFormatterClass
{
  return objc_opt_class();
}

- (void)drawRect:()UITextViewPrintFormatter forViewPrintFormatter:
{
  id v9;

  objc_msgSend(a1, "_containerView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "drawRect:", a2, a3, a4, a5);

}

@end
