@implementation NSNumberFormatter(SiriUIFoundationAdditions)

+ (id)sruif_localizedStringFromNumber:()SiriUIFoundationAdditions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD16F0];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  SRUIFGetLocale();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);

  objc_msgSend(v5, "stringFromNumber:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
