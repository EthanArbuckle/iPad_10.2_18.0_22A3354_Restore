@implementation PNPPlatterContainerView

- (CGRect)presentedFrameForViewWithSize:(CGSize)a3 edge:(unint64_t)a4 inRect:(CGRect)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  unint64_t v18;
  double v19;
  void *v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  UIRectCenteredIntegralRect();
  v13 = v12;
  v14 = v10;
  v15 = v11;
  v16 = 24.0;
  switch(a4)
  {
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      v13 = 24.0;
      goto LABEL_5;
    case 4uLL:
      v16 = height - (v11 + 44.0);
      goto LABEL_6;
    case 8uLL:
      v13 = width - (v10 + 24.0);
      goto LABEL_5;
    default:
LABEL_5:
      v16 = v9;
LABEL_6:
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "statusBarOrientation") - 3;

      if (v18 <= 1 && (a4 == 4 || a4 == 1))
      {
        -[PNPPlatterContainerView pencilOffset](self, "pencilOffset");
        v13 = v13 + v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "statusBarOrientation") - 1;

        if (v21 <= 1 && (a4 == 8 || a4 == 2))
        {
          -[PNPPlatterContainerView pencilOffset](self, "pencilOffset");
          v16 = v16 + v22;
        }
      }
      v23 = v13;
      v24 = v16;
      v25 = v14;
      v26 = v15;
      result.size.height = v26;
      result.size.width = v25;
      result.origin.y = v24;
      result.origin.x = v23;
      return result;
  }
}

- (CGAffineTransform)_dismissedTransformForEdge:(SEL)a3
{
  uint64_t v4;
  __int128 v5;

  if (!a4)
    return CGAffineTransformMakeScale(retstr, 0.9, 0.9);
  v4 = MEMORY[0x24BDBD8B8];
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  return self;
}

- (double)_dismissedAlphaForEdge:(double)a3
{
  return 0.0;
}

- (CGRect)dismissedFrameForViewWithSize:(CGSize)a3 edge:(unint64_t)a4 inRect:(CGRect)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  -[PNPPlatterContainerView presentedFrameForViewWithSize:edge:inRect:](self, "presentedFrameForViewWithSize:edge:inRect:", a3.width, a3.height, a5.origin.x, a5.origin.y);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (!-[PNPPlatterContainerView dismissUsingAlpha](self, "dismissUsingAlpha"))
  {
    switch(a4)
    {
      case 1uLL:
        v12 = v12 - (v16 + 48.0);
        break;
      case 2uLL:
        v10 = v10 - (v14 + 48.0);
        break;
      case 4uLL:
        v12 = height + 24.0;
        break;
      case 8uLL:
        v10 = width + 24.0;
        break;
      default:
        break;
    }
  }
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)_updateShadowForCenteredPlatter:(BOOL)a3
{
  PNPPlatterShadowView *shadowView;
  double v5;
  void *v6;

  shadowView = self->_shadowView;
  if (a3)
  {
    v5 = 0.0;
    -[PNPPlatterShadowView setShadowRadius:](self->_shadowView, "setShadowRadius:", 0.0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "platterShadowColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPPlatterShadowView setShadowColor:](shadowView, "setShadowColor:", v6);

    -[PNPPlatterShadowView setShadowOffset:](self->_shadowView, "setShadowOffset:", 0.0, 0.0);
    -[PNPPlatterShadowView setShadowRadius:](self->_shadowView, "setShadowRadius:", 30.0);
    v5 = 0.1;
  }
  -[PNPPlatterShadowView setShadowOpacity:](self->_shadowView, "setShadowOpacity:", v5);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  UIView *contentViewContainerView;
  UIView *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  _BOOL8 v45;
  double v46;
  double v47;
  void *v48;
  UIView *dimmingView;
  int64_t dimmingState;
  UIView *v51;
  void *v52;
  UIVisualEffectView *effectView;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v66;
  CGAffineTransform v67;

  -[UIView intrinsicContentSize](self->_contentView, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v62 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v63 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v67.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v67.c = v62;
  v61 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v67.tx = v61;
  v7 = -[PNPPlatterContainerView presented](self, "presented");
  v8 = -[PNPPlatterContainerView edge](self, "edge");
  -[PNPPlatterContainerView bounds](self, "bounds");
  if (v7)
  {
    -[PNPPlatterContainerView presentedFrameForViewWithSize:edge:inRect:](self, "presentedFrameForViewWithSize:edge:inRect:", v8, v4, v6, v9, v10, v11, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = 1.0;
  }
  else
  {
    -[PNPPlatterContainerView dismissedFrameForViewWithSize:edge:inRect:](self, "dismissedFrameForViewWithSize:edge:inRect:", v8, v4, v6, v9, v10, v11, v12);
    v14 = v22;
    v16 = v23;
    v18 = v24;
    v20 = v25;
    -[PNPPlatterContainerView _dismissedTransformForEdge:](self, "_dismissedTransformForEdge:", -[PNPPlatterContainerView edge](self, "edge"));
    -[PNPPlatterContainerView _dismissedAlphaForEdge:](self, "_dismissedAlphaForEdge:", (double)-[PNPPlatterContainerView edge](self, "edge"));
    v21 = v26;
  }
  t1 = v67;
  v27 = *(_OWORD *)&self->_animationTranslation.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_animationTranslation.a;
  *(_OWORD *)&t2.c = v27;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_animationTranslation.tx;
  CGAffineTransformConcat(&v66, &t1, &t2);
  v67 = v66;
  -[PNPPlatterContainerView bounds](self, "bounds");
  v30 = 1.0;
  if (v28 == *MEMORY[0x24BDBF148] && v29 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v30 = 0.0;
    v21 = 0.0;
  }
  -[PNPPlatterShadowView setAlpha:](self->_shadowView, "setAlpha:", v30);
  contentViewContainerView = self->_contentViewContainerView;
  *(_OWORD *)&v66.a = v63;
  *(_OWORD *)&v66.c = v62;
  *(_OWORD *)&v66.tx = v61;
  -[UIView setTransform:](contentViewContainerView, "setTransform:", &v66);
  -[UIView setFrame:](self->_contentViewContainerView, "setFrame:", v14, v16, v18, v20);
  v32 = self->_contentViewContainerView;
  v66 = v67;
  -[UIView setTransform:](v32, "setTransform:", &v66);
  -[UIView setAlpha:](self->_contentViewContainerView, "setAlpha:", v21);
  -[PNPPlatterContainerView contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_contentViewContainerView, "bounds");
  objc_msgSend(v33, "setFrame:");

  -[PNPPlatterContainerView preferredCornerRadius](self, "preferredCornerRadius");
  if (v34 == -1.0)
  {
    if (v4 >= v6)
      v37 = v6;
    else
      v37 = v4;
    v36 = v37 * 0.5;
  }
  else
  {
    -[PNPPlatterContainerView preferredCornerRadius](self, "preferredCornerRadius");
    v36 = v35;
  }
  -[UIView _setContinuousCornerRadius:](self->_contentViewContainerView, "_setContinuousCornerRadius:", v36);
  -[PNPPlatterShadowView setFrame:](self->_shadowView, "setFrame:", v14, v16, v18, v20);
  -[PNPPlatterShadowView _setCornerRadius:](self->_shadowView, "_setCornerRadius:", v36);
  v38 = (void *)MEMORY[0x24BDF6870];
  -[PNPPlatterShadowView bounds](self->_shadowView, "bounds");
  objc_msgSend(v38, "bezierPathWithRoundedRect:cornerRadius:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPlatterShadowView setShadowPath:](self->_shadowView, "setShadowPath:", v39);
  v40 = -[PNPPlatterContainerView edge](self, "edge");
  objc_msgSend(MEMORY[0x24BDF6950], "platterStrokeColor");
  v41 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v42 = objc_msgSend(v41, "CGColor");
  -[UIView layer](self->_contentViewContainerView, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setBorderColor:", v42);

  v44 = v40 == 0;
  v45 = v40 == 0;
  v46 = 0.0;
  if (v44)
    v47 = 0.0;
  else
    v47 = 0.5;
  -[UIView layer](self->_contentViewContainerView, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setBorderWidth:", v47);

  -[PNPPlatterContainerView _updateShadowForCenteredPlatter:](self, "_updateShadowForCenteredPlatter:", v45);
  dimmingView = self->_dimmingView;
  -[PNPPlatterContainerView bounds](self, "bounds");
  -[UIView setFrame:](dimmingView, "setFrame:");
  if (-[PNPPlatterContainerView presented](self, "presented"))
  {
    dimmingState = self->_dimmingState;
    if (dimmingState == 1)
    {
      v46 = 0.1;
    }
    else
    {
      if (dimmingState != 2)
        goto LABEL_26;
      v46 = 0.4;
    }
  }
  v51 = self->_dimmingView;
  objc_msgSend(MEMORY[0x24BDF6950], "dimmingViewColorWithAlpha:", v46);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v51, "setBackgroundColor:", v52);

  effectView = self->_effectView;
  if (self->_dimmingState)
  {
    -[UIVisualEffectView setHidden:](effectView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "platterContainerColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_contentViewContainerView, "setBackgroundColor:", v54);

  }
  else
  {
    -[UIVisualEffectView setHidden:](effectView, "setHidden:", 0);
    -[PNPPlatterContainerView traitCollection](self, "traitCollection");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "userInterfaceStyle");

    if (v56 == 2)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setBackgroundColor:](self->_effectView, "setBackgroundColor:", v57);
      v58 = 1203;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "colorWithAlphaComponent:", 0.9);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView setBackgroundColor:](self->_effectView, "setBackgroundColor:", v59);

      v58 = 1200;
    }

    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_effectView, "setEffect:", v60);

    -[UIView bounds](self->_contentViewContainerView, "bounds");
    -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
  }
LABEL_26:

}

- (void)setDimmingState:(int64_t)a3
{
  self->_dimmingState = a3;
  -[PNPPlatterContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentView:(id)a3
{
  id v5;

  v5 = a3;
  -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_contentView, a3);
  if (self->_contentView)
    -[UIView addSubview:](self->_contentViewContainerView, "addSubview:");
  -[PNPPlatterContainerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setEdge:(unint64_t)a3
{
  self->_edge = a3;
  -[PNPPlatterContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPreferredCornerRadius:(double)a3
{
  self->_preferredCornerRadius = a3;
  -[PNPPlatterContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPresented:(BOOL)a3
{
  self->_presented = a3;
  -[PNPPlatterContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setAnimationTranslation:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_animationTranslation.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_animationTranslation.c = v4;
  *(_OWORD *)&self->_animationTranslation.tx = v3;
  -[PNPPlatterContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  void *v15;
  objc_super v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PNPPlatterContainerView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  v10 = v9;
  v12 = v11;

  -[PNPPlatterContainerView contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  if (v14)
  {
    v17.receiver = self;
    v17.super_class = (Class)PNPPlatterContainerView;
    -[PNPPlatterContainerView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (PNPPlatterContainerView)initWithFrame:(CGRect)a3
{
  PNPPlatterContainerView *v3;
  PNPPlatterShadowView *v4;
  PNPPlatterShadowView *shadowView;
  UIView *v6;
  UIView *dimmingView;
  UIView *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  UIVisualEffectView *effectView;
  void *v15;
  void *v16;
  UIView *v17;
  UIView *contentViewContainerView;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PNPPlatterContainerView;
  v3 = -[PNPPlatterContainerView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3->_preferredCornerRadius = -1.0;
  v4 = objc_alloc_init(PNPPlatterShadowView);
  shadowView = v3->_shadowView;
  v3->_shadowView = v4;

  v6 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  dimmingView = v3->_dimmingView;
  v3->_dimmingView = v6;

  v8 = v3->_dimmingView;
  objc_msgSend(MEMORY[0x24BDF6950], "dimmingViewColorWithAlpha:", 0.5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

  v10 = MEMORY[0x24BDBD8B8];
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v3->_animationTranslation.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v3->_animationTranslation.c = v11;
  *(_OWORD *)&v3->_animationTranslation.tx = *(_OWORD *)(v10 + 32);
  objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1200);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v12);
  effectView = v3->_effectView;
  v3->_effectView = (UIVisualEffectView *)v13;

  objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundColor:](v3->_effectView, "setBackgroundColor:", v16);

  v17 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  contentViewContainerView = v3->_contentViewContainerView;
  v3->_contentViewContainerView = v17;

  -[UIView setClipsToBounds:](v3->_contentViewContainerView, "setClipsToBounds:", 1);
  -[PNPPlatterContainerView addSubview:](v3, "addSubview:", v3->_dimmingView);
  -[PNPPlatterContainerView addSubview:](v3, "addSubview:", v3->_shadowView);
  -[PNPPlatterContainerView addSubview:](v3, "addSubview:", v3->_contentViewContainerView);
  -[UIView addSubview:](v3->_contentViewContainerView, "addSubview:", v3->_effectView);

  return v3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (id)autoDismissBlock
{
  return self->_autoDismissBlock;
}

- (void)setAutoDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSDate)autoDismissDate
{
  return self->_autoDismissDate;
}

- (void)setAutoDismissDate:(id)a3
{
  objc_storeStrong((id *)&self->_autoDismissDate, a3);
}

- (unint64_t)edge
{
  return self->_edge;
}

- (double)preferredCornerRadius
{
  return self->_preferredCornerRadius;
}

- (BOOL)presented
{
  return self->_presented;
}

- (int64_t)dimmingState
{
  return self->_dimmingState;
}

- (double)pencilOffset
{
  return self->_pencilOffset;
}

- (void)setPencilOffset:(double)a3
{
  self->_pencilOffset = a3;
}

- (BOOL)dismissUsingAlpha
{
  return self->_dismissUsingAlpha;
}

- (void)setDismissUsingAlpha:(BOOL)a3
{
  self->_dismissUsingAlpha = a3;
}

- (CGAffineTransform)animationTranslation
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].c;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoDismissDate, 0);
  objc_storeStrong(&self->_autoDismissBlock, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentViewContainerView, 0);
}

@end
