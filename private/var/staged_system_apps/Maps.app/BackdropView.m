@implementation BackdropView

- (BackdropView)initWithFrame:(CGRect)a3
{
  BackdropView *v3;
  BackdropView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BackdropView;
  v3 = -[BackdropView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BackdropView setRenderMode:](v3, "setRenderMode:", 1);
  return v4;
}

@end
