@implementation NSAttributedString(Weather)

- (id)wa_font
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BDF65F8], 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
  {
    v2 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
    objc_msgSend(v2, "systemFontOfSize:");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

@end
