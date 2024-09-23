@implementation WFCompactHighlightedView

- (WFCompactHighlightedView)initWithFrame:(CGRect)a3
{
  WFCompactHighlightedView *v3;
  void *v4;
  WFCompactHighlightedView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFCompactHighlightedView;
  v3 = -[WFCompactHighlightedView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setHidden:", 1);
    -[WFCompactHighlightedView bounds](v3, "bounds");
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[WFCompactHighlightedView addSubview:](v3, "addSubview:", v4);
    objc_storeWeak((id *)&v3->_backgroundView, v4);
    v5 = v3;

  }
  return v3;
}

- (void)didAddSubview:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFCompactHighlightedView;
  -[WFCompactHighlightedView didAddSubview:](&v5, sel_didAddSubview_, a3);
  -[WFCompactHighlightedView backgroundView](self, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactHighlightedView bringSubviewToFront:](self, "bringSubviewToFront:", v4);

}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24E631838;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v5;
  id v6;

  if (a4 == 2)
  {
    v5 = a3;
    -[WFCompactHighlightedView backgroundView](self, "backgroundView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "automaticallyUpdateView:withStyle:", v6, 4);

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCompactHighlightedView;
  -[WFCompactHighlightedView touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  -[WFCompactHighlightedView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  _BOOL8 v18;
  void *v19;
  objc_super v20;
  CGPoint v21;
  CGRect v22;

  v20.receiver = self;
  v20.super_class = (Class)WFCompactHighlightedView;
  v6 = a3;
  -[WFCompactHighlightedView touchesMoved:withEvent:](&v20, sel_touchesMoved_withEvent_, v6, a4);
  -[WFCompactHighlightedView bounds](self, "bounds", v20.receiver, v20.super_class);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "anyObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "locationInView:", self);
  v21.x = v16;
  v21.y = v17;
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  v18 = !CGRectContainsPoint(v22, v21);
  -[WFCompactHighlightedView backgroundView](self, "backgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", v18);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCompactHighlightedView;
  -[WFCompactHighlightedView touchesCancelled:withEvent:](&v6, sel_touchesCancelled_withEvent_, a3, a4);
  -[WFCompactHighlightedView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCompactHighlightedView;
  -[WFCompactHighlightedView touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  -[WFCompactHighlightedView backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)backgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_backgroundView);
}

- (void)setBackgroundView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundView, a3);
}

- (UIView)contentDimmingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentDimmingView);
}

- (void)setContentDimmingView:(id)a3
{
  objc_storeWeak((id *)&self->_contentDimmingView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentDimmingView);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
