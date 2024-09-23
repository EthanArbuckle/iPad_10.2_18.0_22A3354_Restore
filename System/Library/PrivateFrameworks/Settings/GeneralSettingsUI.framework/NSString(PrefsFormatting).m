@implementation NSString(PrefsFormatting)

- (id)ICCIDString
{
  void *v2;
  int v3;
  unint64_t v4;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  if ((unint64_t)objc_msgSend(a1, "length") >= 4 && (unint64_t)objc_msgSend(a1, "length") >= 5)
  {
    v3 = 0;
    v4 = 4;
    do
    {
      if (objc_msgSend(a1, "length") > v4)
        objc_msgSend(v2, "insertString:atIndex:", CFSTR(" "), (int)v4 + v3++);
      v4 += 4;
    }
    while (objc_msgSend(a1, "length") > v4);
  }
  return v2;
}

- (id)IMEIString
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  if ((unint64_t)objc_msgSend(v1, "length") >= 3)
    objc_msgSend(v1, "insertString:atIndex:", CFSTR(" "), 2);
  if ((unint64_t)objc_msgSend(v1, "length") >= 0xA)
    objc_msgSend(v1, "insertString:atIndex:", CFSTR(" "), 9);
  if ((unint64_t)objc_msgSend(v1, "length") >= 0x11)
    objc_msgSend(v1, "insertString:atIndex:", CFSTR(" "), 16);
  return v1;
}

@end
