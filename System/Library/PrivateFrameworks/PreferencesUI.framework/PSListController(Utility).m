@implementation PSListController(Utility)

- (void)configureSpin:()Utility ofCellForSpecifier:setEnabled:
{
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    if (a3)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v8, "startAnimating");
      objc_msgSend(v9, "setAccessoryView:", v8);

    }
    else
    {
      objc_msgSend(v7, "setAccessoryView:", 0);
    }
    objc_msgSend(v9, "setCellEnabled:", a5);
    v7 = v9;
  }

}

@end
