@implementation SBZoomView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (id)_initWithFrame:(CGRect)a3
{
  SBZoomView *v3;
  SBZoomView *v4;
  id v5;
  uint64_t v6;
  UIView *contentView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBZoomView;
  v3 = -[SBZoomView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBZoomView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBZoomView bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    contentView = v4->_contentView;
    v4->_contentView = (UIView *)v6;

    -[SBZoomView addSubview:](v4, "addSubview:", v4->_contentView);
  }
  return v4;
}

- (SBZoomView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBZoomView.m"), 41, CFSTR("call to abstract base class initializer"));

  return 0;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("zPosition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBZoomView;
    v5 = -[SBZoomView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (UIView)contentView
{
  return self->_contentView;
}

@end
