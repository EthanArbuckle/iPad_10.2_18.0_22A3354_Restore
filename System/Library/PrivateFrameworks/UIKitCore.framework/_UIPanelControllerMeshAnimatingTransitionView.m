@implementation _UIPanelControllerMeshAnimatingTransitionView

- (_UIPanelControllerMeshAnimatingTransitionView)initWithView:(id)a3
{
  id v4;
  _UIPanelControllerMeshAnimatingTransitionView *v5;
  _UIPanelControllerMeshAnimatingTransitionView *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v8.receiver = self;
  v8.super_class = (Class)_UIPanelControllerMeshAnimatingTransitionView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    -[UIView setAutoresizesSubviews:](v5, "setAutoresizesSubviews:", 1);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setClipsToBounds:](v6, "setClipsToBounds:", 1);
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[UIView bounds](v6, "bounds");
    objc_msgSend(v4, "setFrame:");
    -[UIView addSubview:](v6, "addSubview:", v4);
  }

  return v6;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("meshTransform")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPanelControllerMeshAnimatingTransitionView;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

@end
