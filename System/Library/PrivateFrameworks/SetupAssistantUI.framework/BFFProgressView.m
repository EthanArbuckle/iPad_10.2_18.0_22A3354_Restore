@implementation BFFProgressView

- (BFFProgressView)init
{
  BFFProgressView *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BFFProgressView;
  v2 = -[BFFProgressView initWithProgressViewStyle:](&v6, sel_initWithProgressViewStyle_, 0);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFProgressView setProgressTintColor:](v2, "setProgressTintColor:", v3);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFProgressView setTrackTintColor:](v2, "setTrackTintColor:", v4);

  }
  return v2;
}

@end
