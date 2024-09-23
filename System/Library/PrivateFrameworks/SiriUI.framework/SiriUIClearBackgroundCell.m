@implementation SiriUIClearBackgroundCell

- (SiriUIClearBackgroundCell)initWithFrame:(CGRect)a3
{
  SiriUIClearBackgroundCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriUIClearBackgroundCell;
  v3 = -[SiriUIClearBackgroundCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIClearBackgroundCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

+ (id)reuseIdentifier
{
  return 0;
}

+ (double)defaultHeight
{
  return 0.0;
}

+ (id)elementKind
{
  return 0;
}

@end
