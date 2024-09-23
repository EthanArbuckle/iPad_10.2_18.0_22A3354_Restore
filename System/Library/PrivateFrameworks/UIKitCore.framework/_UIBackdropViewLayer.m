@implementation _UIBackdropViewLayer

- (void)setBackdropView:(id)a3
{
  self->_backdropView = (_UIBackdropView *)a3;
}

- (void)dealloc
{
  objc_super v2;

  self->_backdropView = 0;
  v2.receiver = self;
  v2.super_class = (Class)_UIBackdropViewLayer;
  -[_UIBackdropViewLayer dealloc](&v2, sel_dealloc);
}

- (void)renderInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  -[_UIBackdropViewLayer backdropView](self, "backdropView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willCallRenderInContextOnBackdropViewLayer");

  v7.receiver = self;
  v7.super_class = (Class)_UIBackdropViewLayer;
  -[_UIBackdropViewLayer renderInContext:](&v7, sel_renderInContext_, a3);
  -[_UIBackdropViewLayer backdropView](self, "backdropView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didCallRenderInContextOnBackdropViewLayer");

}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

@end
