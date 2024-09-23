@implementation STSTileOverlay

- (STSTileOverlay)initWithFrame:(CGRect)a3
{
  STSTileOverlay *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSTileOverlay;
  v3 = -[STSTileOverlay initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 0.3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSTileOverlay setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

@end
