@implementation PSSpecifier(UIAdditions)

- (void)st_startSpinner
{
  void *v1;
  id v2;

  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v1, "startAnimating");
    objc_msgSend(v2, "setAccessoryView:", v1);

  }
}

- (void)st_stopSpinner
{
  void *v2;
  id v3;

  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "propertyForKey:", *MEMORY[0x24BE759A0]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessoryView:", v2);

  }
}

@end
