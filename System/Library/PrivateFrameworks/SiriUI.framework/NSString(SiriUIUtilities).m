@implementation NSString(SiriUIUtilities)

- (id)siriUIAttributedStringWithSubscriptAtRange:()SiriUIUtilities font:
{
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (objc_class *)MEMORY[0x24BDD1688];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithString:", a1);
  objc_msgSend(v9, "_fontScaledByScaleFactor:", 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v11, a3, a4);
  objc_msgSend(v10, "addAttribute:value:range:", *MEMORY[0x24BDF65D8], &unk_24D7EF6D0, a3, a4);

  return v10;
}

@end
