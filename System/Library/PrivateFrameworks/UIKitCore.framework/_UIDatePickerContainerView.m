@implementation _UIDatePickerContainerView

- (_UIDatePickerContainerView)initWithFrame:(CGRect)a3
{
  _UIDatePickerContainerView *v3;
  void *v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerContainerView;
  v3 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[_UIDatePickerContainerView setPassthroughInteraction:](v3, "setPassthroughInteraction:", v4);

    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    v5 = [UIView alloc];
    -[UIView bounds](v3, "bounds");
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    -[_UIDatePickerContainerView setContentView:](v3, "setContentView:", v6);

    -[_UIDatePickerContainerView contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutoresizingMask:", 18);

    -[_UIDatePickerContainerView contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v3, "addSubview:", v8);

  }
  return v3;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  char v13;
  objc_super v14;
  _QWORD block[5];
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v17.origin.x = v8;
  v17.origin.y = v9;
  v17.size.width = v10;
  v17.size.height = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectEqualToRect(v16, v17))
  {
    -[_UIDatePickerContainerView presentation](self, "presentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isBeingDismissedOrPresented");

    if ((v13 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39___UIDatePickerContainerView_setFrame___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerContainerView;
  -[UIView setFrame:](&v14, sel_setFrame_, x, y, width, height);
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  char v13;
  objc_super v14;
  _QWORD block[5];
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v17.origin.x = v8;
  v17.origin.y = v9;
  v17.size.width = v10;
  v17.size.height = v11;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (!CGRectEqualToRect(v16, v17))
  {
    -[_UIDatePickerContainerView presentation](self, "presentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isBeingDismissedOrPresented");

    if ((v13 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40___UIDatePickerContainerView_setBounds___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDatePickerContainerView;
  -[UIView setBounds:](&v14, sel_setBounds_, x, y, width, height);
}

- (void)willMoveToWindow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerContainerView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_, a3);
  -[_UIDatePickerContainerView passthroughInteraction](self, "passthroughInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView removeInteraction:](self, "removeInteraction:", v4);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerContainerView;
  -[UIView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIDatePickerContainerView passthroughInteraction](self, "passthroughInteraction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addInteraction:](self, "addInteraction:", v4);

  }
}

- (BOOL)isTransparentFocusItem
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _UIDatePickerContainerView *v8;
  _UIDatePickerContainerView *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  _UIDatePickerContainerView *v22;
  objc_super v24;
  CGPoint v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIDatePickerContainerView;
  -[UIView hitTest:withEvent:](&v24, sel_hitTest_withEvent_, v7, x, y);
  v8 = (_UIDatePickerContainerView *)objc_claimAutoreleasedReturnValue();
  if (v8 != self)
  {
    -[_UIDatePickerContainerView contentView](self, "contentView");
    v9 = (_UIDatePickerContainerView *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      goto LABEL_18;
  }
  -[_UIDatePickerContainerView presentation](self, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertPoint:fromView:", self, x, y);
  v13 = v12;
  v15 = v14;
  -[_UIDatePickerContainerView presentation](self, "presentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "overlayAnchor") != 2)
  {

    goto LABEL_7;
  }
  -[_UIDatePickerContainerView presentation](self, "presentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sourceRect");
  v25.x = v13;
  v25.y = v15;
  v18 = CGRectContainsPoint(v26, v25);

  if (v18)
  {
LABEL_7:
    objc_msgSend(v11, "hitTest:withEvent:", v7, v13, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v19 = 0;
LABEL_8:
  v20 = +[_UIPassthroughScrollInteraction _shouldEventBePassedThrough:](_UIPassthroughScrollInteraction, "_shouldEventBePassedThrough:", v7);
  if (v19 && v19 != v11)
  {
    if (v20)
    {
      -[_UIDatePickerContainerView presentation](self, "presentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDatePickerContainerView setLastHitTestWasPassedThrough:](self, "setLastHitTestWasPassedThrough:", objc_msgSend(v21, "ignoresPassthroughOnSourceView") ^ 1);

    }
    else
    {
      -[_UIDatePickerContainerView setLastHitTestWasPassedThrough:](self, "setLastHitTestWasPassedThrough:", 0);
    }
    v22 = v19;
    goto LABEL_16;
  }
  if (!v20)
  {

LABEL_18:
    v22 = v8;
    goto LABEL_19;
  }
  -[_UIDatePickerContainerView setLastHitTestWasPassedThrough:](self, "setLastHitTestWasPassedThrough:", 1);
  v22 = 0;
LABEL_16:

LABEL_19:
  return v22;
}

- (_UIDatePickerOverlayPresentation)presentation
{
  return self->_presentation;
}

- (void)setPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_presentation, a3);
}

- (_UIPassthroughScrollInteraction)passthroughInteraction
{
  return self->_passthroughInteraction;
}

- (void)setPassthroughInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_passthroughInteraction, a3);
}

- (BOOL)lastHitTestWasPassedThrough
{
  return self->_lastHitTestWasPassedThrough;
}

- (void)setLastHitTestWasPassedThrough:(BOOL)a3
{
  self->_lastHitTestWasPassedThrough = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
}

@end
