@implementation SCUIResources

+ (id)mainBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

+ (id)localizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_2516ED0A8, CFSTR("SensitiveContentAnalysisLocalizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
