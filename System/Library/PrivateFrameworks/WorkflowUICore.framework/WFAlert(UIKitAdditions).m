@implementation WFAlert(UIKitAdditions)

- (void)setPresentationSource:()UIKitAdditions
{
  objc_setAssociatedObject(a1, sel_presentationSource, a3, (void *)1);
}

- (id)presentationSource
{
  return objc_getAssociatedObject(a1, sel_presentationSource);
}

- (void)setContentView:()UIKitAdditions
{
  objc_setAssociatedObject(a1, sel_contentView, a3, (void *)1);
}

- (id)contentView
{
  return objc_getAssociatedObject(a1, sel_contentView);
}

- (void)setContentViewPadding:()UIKitAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_contentViewPadding, v2, (void *)1);

}

- (double)contentViewPadding
{
  void *v1;
  double v2;
  double v3;

  objc_getAssociatedObject(a1, sel_contentViewPadding);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UIEdgeInsetsValue");
  v3 = v2;

  return v3;
}

- (id)keyCommands
{
  return objc_getAssociatedObject(a1, sel_keyCommands);
}

- (void)addKeyCommand:()UIKitAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id value;

  v4 = a3;
  objc_msgSend(a1, "keyCommands");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x24BDBD1A8];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v8, "arrayByAddingObject:", v4);
  value = (id)objc_claimAutoreleasedReturnValue();

  objc_setAssociatedObject(a1, sel_keyCommands, value, (void *)1);
}

@end
