@implementation NSNumberFormatter(SiriUI)

+ (id)siriui_localizedStringFromNumber:()SiriUI
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BDD16F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDD1488], "afui_assistantUIFrameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assistantUILocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v7);

  objc_msgSend(v5, "stringFromNumber:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
