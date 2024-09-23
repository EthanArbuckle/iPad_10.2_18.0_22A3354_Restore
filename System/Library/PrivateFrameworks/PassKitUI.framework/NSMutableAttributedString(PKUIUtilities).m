@implementation NSMutableAttributedString(PKUIUtilities)

- (void)pk_addLinkURL:()PKUIUtilities toRange:withColor:isUnderlined:
{
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v12 = a6;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL && a5 && a4 + a5 <= (unint64_t)objc_msgSend(a1, "length"))
  {
    if (v12)
      objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v12, a4, a5);
    objc_msgSend(a1, "addAttribute:value:range:", *MEMORY[0x1E0DC1160], v15, a4, a5);
    v13 = *MEMORY[0x1E0DC1248];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addAttribute:value:range:", v13, v14, a4, a5);

  }
}

@end
