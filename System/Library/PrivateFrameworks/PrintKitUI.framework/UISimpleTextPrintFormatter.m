@implementation UISimpleTextPrintFormatter

- (UISimpleTextPrintFormatter)initWithText:(NSString *)text
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  UISimpleTextPrintFormatter *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC3E50];
  v5 = text;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
  objc_msgSend(v6, "setText:", v5);

  v7 = -[UIViewPrintFormatter _initWithView:]([UITextViewPrintFormatter alloc], "_initWithView:", v6);
  return v7;
}

- (UISimpleTextPrintFormatter)initWithAttributedText:(NSAttributedString *)attributedText
{
  objc_class *v4;
  NSAttributedString *v5;
  void *v6;
  UISimpleTextPrintFormatter *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC3E50];
  v5 = attributedText;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFrame:", 0.0, 0.0, 612.0, 798.0);
  objc_msgSend(v6, "setAttributedText:", v5);

  v7 = -[UIViewPrintFormatter _initWithView:]([UITextViewPrintFormatter alloc], "_initWithView:", v6);
  return v7;
}

@end
