@implementation UIWebScrollView

- (UIWebScrollView)initWithFrame:(CGRect)a3
{
  UIWebScrollView *v3;
  UIWebScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebScrollView;
  v3 = -[UIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIScrollView setDirectionalLockEnabled:](v3, "setDirectionalLockEnabled:", 1);
    -[UIScrollView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 1);
  }
  return v4;
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return 1;
}

- (void)didMoveToWindow
{
  void *v3;
  id WeakRetained;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIWebScrollView;
  -[UIView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      return;
    v3 = objc_loadWeakRetained(&self->super._delegate);
    objc_msgSend(v3, "performSelector:withObject:", sel_scrollViewWasRemoved_, self);
  }

}

@end
