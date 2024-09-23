@implementation UITextView(PKUIUtilities)

+ (void)pkui_styleTextView:()PKUIUtilities
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a3;
  objc_msgSend(v3, "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "setContentInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  objc_msgSend(v4, "textContainer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLineFragmentPadding:", 0.0);
}

+ (id)pkui_plainInteractiveTextViewWithFrame:()PKUIUtilities
{
  void *v6;

  v6 = (void *)objc_msgSend([a1 alloc], "initWithFrame:", a2, a3, a4, a5);
  -[objc_class pkui_styleTextView:](a1, "pkui_styleTextView:", v6);
  return v6;
}

+ (id)pkui_plainNonInteractiveTextViewWithFrame:()PKUIUtilities
{
  void *v6;

  v6 = (void *)objc_msgSend([a1 alloc], "initReadonlyAndUnselectableWithFrame:textContainer:", 0, a2, a3, a4, a5);
  -[objc_class pkui_styleTextView:](a1, "pkui_styleTextView:", v6);
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  objc_msgSend(v6, "setScrollEnabled:", 0);
  return v6;
}

- (double)pkui_frameForTextFrame:()PKUIUtilities
{
  double v3;

  objc_msgSend(a1, "textContainerInset");
  return a2 - v3;
}

- (double)pkui_textFrame
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "frame");
  v3 = v2;
  objc_msgSend(a1, "textContainerInset");
  return v3 + v4;
}

@end
