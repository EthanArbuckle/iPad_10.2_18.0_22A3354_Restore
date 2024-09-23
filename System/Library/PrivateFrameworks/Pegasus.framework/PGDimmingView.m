@implementation PGDimmingView

- (PGDimmingView)initWithFrame:(CGRect)a3
{
  PGDimmingView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGDimmingView;
  v3 = -[PGDimmingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGDimmingView setBackgroundColor:](v3, "setBackgroundColor:", v4);
    -[PGDimmingView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);

  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end
