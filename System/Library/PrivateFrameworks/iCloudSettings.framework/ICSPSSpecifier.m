@implementation ICSPSSpecifier

+ (BOOL)_startSpinnerWithSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setColor:", v5);

    objc_msgSend(v4, "startAnimating");
    objc_msgSend(v3, "setAccessoryView:", v4);

  }
  return v3 != 0;
}

+ (BOOL)_stopSpinnerWithSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "propertyForKey:", *MEMORY[0x24BE759A0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessoryView:", v5);

  }
  return v4 != 0;
}

@end
