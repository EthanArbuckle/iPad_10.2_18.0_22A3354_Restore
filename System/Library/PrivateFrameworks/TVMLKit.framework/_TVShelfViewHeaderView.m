@implementation _TVShelfViewHeaderView

- (_TVShelfViewHeaderView)initWithFrame:(CGRect)a3
{
  _TVShelfViewHeaderView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVShelfViewHeaderView;
  v3 = -[_TVShelfViewHeaderView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVShelfViewHeaderView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setWantsDimmingOverlay:", 1);
    -[_TVShelfViewHeaderView _setIdleModeLayoutAttributes:](v3, "_setIdleModeLayoutAttributes:", v5);

  }
  return v3;
}

@end
