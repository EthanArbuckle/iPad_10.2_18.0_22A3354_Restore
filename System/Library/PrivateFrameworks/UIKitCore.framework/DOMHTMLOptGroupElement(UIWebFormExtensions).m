@implementation DOMHTMLOptGroupElement(UIWebFormExtensions)

- (UIDOMHTMLOptGroupSelectedItem)createSelectedItem
{
  return -[UIDOMHTMLOptGroupSelectedItem initWithHTMLOptGroupNode:]([UIDOMHTMLOptGroupSelectedItem alloc], "initWithHTMLOptGroupNode:", a1);
}

- (UIDOMHTMLOptGroupCell)createPickerCell
{
  return -[UIDOMHTMLOptGroupCell initWithHTMLOptGroupNode:]([UIDOMHTMLOptGroupCell alloc], "initWithHTMLOptGroupNode:", a1);
}

- (uint64_t)itemTitle
{
  void *v2;
  unsigned __int8 v4;
  uint64_t v5;

  v5 = 0;
  v4 = 0;
  objc_msgSend(a1, "getTextWritingDirection:override:", &v5, &v4);
  v2 = (void *)objc_msgSend(a1, "label");
  return objc_msgSend(v2, "_uikit_stringWithWritingDirection:asOverride:", v5, v4);
}

@end
