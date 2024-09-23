@implementation OBBulletedListItemLinkButton

+ (id)linkButton
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___OBBulletedListItemLinkButton;
  objc_msgSendSuper2(&v6, sel_buttonWithType_, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseBackgroundColor:", v4);

  objc_msgSend(v3, "setButtonSize:", 3);
  objc_msgSend(v3, "setTitleAlignment:", 2);
  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
  objc_msgSend(v2, "setConfiguration:", v3);

  return v2;
}

@end
