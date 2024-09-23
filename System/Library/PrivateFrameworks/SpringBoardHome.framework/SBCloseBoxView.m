@implementation SBCloseBoxView

- (BOOL)shouldTrack
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBCloseBoxView;
  if (!-[SBCloseBoxView shouldTrack](&v7, sel_shouldTrack))
    return 0;
  -[SBCloseBoxView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "closeBoxShouldTrack:", self);
  else
    v5 = 1;

  return v5;
}

- (UIEdgeInsets)backgroundInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 1.0;
  v3 = 1.0;
  v4 = 1.0;
  v5 = 1.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SBCloseBoxView listLayout](self, "listLayout", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 26.0;
  v5 = 26.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "iconAccessoryVisualConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v5 = v7;
    v4 = v8;

  }
  v9 = v5;
  v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIEdgeInsets)hitTestPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = -9.0;
  v3 = -9.0;
  v4 = -9.0;
  v5 = -9.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  -[SBCloseBoxView bounds](self, "bounds", a4);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[SBCloseBoxView hitTestPadding](self, "hitTestPadding");
  v16 = v10 + v15;
  v19 = v12 - (v17 + v18);
  v23.size.height = v14 - (v15 + v20);
  v23.origin.x = v8 + v17;
  v23.origin.y = v16;
  v23.size.width = v19;
  v22.x = x;
  v22.y = y;
  return CGRectContainsPoint(v23, v22);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v6 = (void *)MEMORY[0x1E0DC3508];
  -[SBCloseBoxView bounds](self, "bounds");
  v14 = CGRectInset(v13, 1.0, 1.0);
  objc_msgSend(v6, "bezierPathWithOvalInRect:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowPath:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0DC3B20], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UITapGestureRecognizer)actionTapGestureRecognizer
{
  return self->_actionTapGestureRecognizer;
}

- (void)setActionTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_actionTapGestureRecognizer, a3);
}

- (SBCloseBoxViewDelegate)delegate
{
  return (SBCloseBoxViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBIconListLayout)listLayout
{
  return self->_listLayout;
}

- (void)setListLayout:(id)a3
{
  objc_storeStrong((id *)&self->_listLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionTapGestureRecognizer, 0);
}

@end
