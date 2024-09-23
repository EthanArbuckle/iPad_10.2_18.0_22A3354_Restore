@implementation UINavigationController(ICQUI)

- (void)addBlurEffect
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = objc_alloc(MEMORY[0x24BEBD640]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:", v3);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundImage:forBarMetrics:", v15, 0);

  objc_msgSend(a1, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowImage:", v15);

  v6 = objc_alloc(MEMORY[0x24BEBDB38]);
  objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEffect:", v7);

  objc_msgSend(a1, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "setFrame:");

  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v8, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setZPosition:", -1.0);

  objc_msgSend(v8, "setUserInteractionEnabled:", 0);
  objc_msgSend(a1, "navigationBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v8);

  objc_msgSend(a1, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendSubviewToBack:", v8);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "navigationBar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v13);

}

@end
