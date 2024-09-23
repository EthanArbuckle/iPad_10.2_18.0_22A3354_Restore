@implementation WFContentLocation(Icon)

- (id)icon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v2 = (void *)MEMORY[0x24BE19478];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sfSymbolNameForContentLocationWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BE19478];
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "symbolBackgroundColorForContentLocationWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc(MEMORY[0x24BEC1610]);
  v9 = objc_alloc(MEMORY[0x24BEC14D0]);
  v10 = v9;
  if (v4)
  {
    v11 = (void *)objc_msgSend(v9, "initWithColor:", v7);
    v12 = (void *)objc_msgSend(v8, "initWithSymbolName:background:", v4, v11);
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1398]), "initWithSystemColor:", 9);
    v13 = (void *)objc_msgSend(v10, "initWithColor:", v11);
    v12 = (void *)objc_msgSend(v8, "initWithSymbolName:background:", CFSTR("square.and.arrow.up.fill"), v13);

  }
  return v12;
}

@end
