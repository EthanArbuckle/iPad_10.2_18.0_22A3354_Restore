@implementation _TVFocusRedirectView

- (_TVFocusRedirectView)initWithFrame:(CGRect)a3
{
  _TVFocusRedirectView *v3;
  UIFocusContainerGuide *v4;
  UIFocusContainerGuide *containerGuide;
  UIFocusContainerGuide *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_TVFocusRedirectView;
  v3 = -[_TVFocusRedirectView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIFocusContainerGuide *)objc_alloc_init(MEMORY[0x24BDF6A50]);
    containerGuide = v3->_containerGuide;
    v3->_containerGuide = v4;

    -[_TVFocusRedirectView addLayoutGuide:](v3, "addLayoutGuide:", v3->_containerGuide);
    v6 = v3->_containerGuide;
    -[_TVFocusRedirectView bounds](v3, "bounds");
    -[UIFocusContainerGuide _setManualLayoutFrame:](v6, "_setManualLayoutFrame:");
  }
  return v3;
}

- (void)layoutSubviews
{
  UIFocusContainerGuide *containerGuide;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVFocusRedirectView;
  -[_TVFocusRedirectView layoutSubviews](&v4, sel_layoutSubviews);
  containerGuide = self->_containerGuide;
  -[_TVFocusRedirectView bounds](self, "bounds");
  -[UIFocusContainerGuide _setManualLayoutFrame:](containerGuide, "_setManualLayoutFrame:");
}

- (BOOL)_containsInertiaSelectionChanges
{
  return self->_containsInertia;
}

- (BOOL)containsInertia
{
  return self->_containsInertia;
}

- (void)setContainsInertia:(BOOL)a3
{
  self->_containsInertia = a3;
}

- (UIFocusContainerGuide)containerGuide
{
  return self->_containerGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerGuide, 0);
}

@end
