@implementation DOMElement(UIWebFormExtensions)

- (void)getTextWritingDirection:()UIWebFormExtensions override:
{
  void *result;
  void *v7;

  result = (void *)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "getComputedStyle:pseudoElement:", a1, &stru_1E16EDF20);
  v7 = result;
  if (a3)
  {
    result = (void *)objc_msgSend((id)objc_msgSend(result, "direction"), "isEqualToString:", CFSTR("ltr"));
    *a3 = result ^ 1;
  }
  if (a4)
  {
    result = (void *)objc_msgSend((id)objc_msgSend(v7, "unicodeBidi"), "isEqualToString:", CFSTR("bidi-override"));
    *a4 = (_BYTE)result;
  }
  return result;
}

@end
