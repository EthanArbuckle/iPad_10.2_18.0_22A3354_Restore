@implementation DOMHTMLOptionElement(UIWebFormExtensions)

- (UIDOMHTMLOptionSelectedItem)createSelectedItem
{
  return -[UIDOMHTMLOptionSelectedItem initWithHTMLOptionNode:]([UIDOMHTMLOptionSelectedItem alloc], "initWithHTMLOptionNode:", a1);
}

- (UIDOMHTMLOptionPickerCell)createPickerCell
{
  return -[UIDOMHTMLOptionPickerCell initWithHTMLOptionNode:]([UIDOMHTMLOptionPickerCell alloc], "initWithHTMLOptionNode:", a1);
}

- (uint64_t)populateCell:()UIWebFormExtensions
{
  uint64_t v5;

  objc_msgSend((id)objc_msgSend(a3, "textLabel"), "setText:", objc_msgSend(a1, "itemTitle"));
  objc_msgSend((id)objc_msgSend(a3, "textLabel"), "setEnabled:", objc_msgSend(a1, "disabled") ^ 1);
  objc_msgSend(a3, "setSelectionStyle:", objc_msgSend(a1, "disabled") ^ 1);
  if (objc_msgSend(a1, "selected"))
    v5 = 3;
  else
    v5 = 0;
  return objc_msgSend(a3, "setAccessoryType:", v5);
}

- (uint64_t)itemTitle
{
  void *v2;
  unsigned __int8 v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "text"), "_uikit_stringByTrimmingWhitespaceAndNewlines");
  v5 = 0;
  v4 = 0;
  objc_msgSend(a1, "getTextWritingDirection:override:", &v5, &v4);
  return objc_msgSend(v2, "_uikit_stringWithWritingDirection:asOverride:", v5, v4);
}

@end
