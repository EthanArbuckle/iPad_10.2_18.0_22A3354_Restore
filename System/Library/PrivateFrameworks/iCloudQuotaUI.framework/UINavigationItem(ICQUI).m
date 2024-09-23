@implementation UINavigationItem(ICQUI)

- (void)icqui_showNavigationBarSpinner
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setColor:", v3);

  objc_msgSend(v2, "startAnimating");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v2);
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setRightBarButtonItems:", v5);

}

- (uint64_t)icqui_hideNavigationBarSpinner
{
  return objc_msgSend(a1, "setRightBarButtonItems:", MEMORY[0x24BDBD1A8]);
}

@end
