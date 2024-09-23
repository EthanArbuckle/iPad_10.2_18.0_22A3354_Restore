@implementation SiriUIAceObjectControllerCell

- (SiriUIAceObjectControllerCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SiriUIAceObjectControllerCell *v7;
  uint64_t v8;
  UIView *animationView;
  void *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  _OWORD v17[5];
  uint64_t v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)SiriUIAceObjectControllerCell;
  v7 = -[SiriUIClearBackgroundCell initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", x, y, width, height);
    animationView = v7->_animationView;
    v7->_animationView = (UIView *)v8;

    -[UIView layer](v7->_animationView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v17[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v17[3] = v11;
    v17[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v12 = *(_QWORD *)(MEMORY[0x24BDE5598] + 80);
    v13 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v17[0] = *MEMORY[0x24BDE5598];
    v17[1] = v13;
    v18 = v12;
    v19 = 0xBF670B6208DEA0E0;
    v14 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v20 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v21 = v14;
    objc_msgSend(v10, "setSublayerTransform:", v17);

    -[UIView layer](v7->_animationView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAnchorPoint:", 0.5, 0.6);

  }
  return v7;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIAceObjectControllerCell;
  -[SiriUIAceObjectControllerCell prepareForReuse](&v4, sel_prepareForReuse);
  self->_topPadding = 0.0;
  -[UIView removeFromSuperview](self->_animationView, "removeFromSuperview");
  -[UIView subviews](self->_animationView, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);

  -[SiriUIAceObjectControllerCell setReplacedView:](self, "setReplacedView:", 0);
  -[SiriUIAceObjectControllerCell setAceViewController:](self, "setAceViewController:", 0);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SiriUIAceObjectControllerCell;
  -[SiriUIAceObjectControllerCell layoutSubviews](&v13, sel_layoutSubviews);
  -[SiriUIAceObjectControllerCell bounds](self, "bounds");
  UIRectInset();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_animationView, "setFrame:");
  -[SiriUIAceObjectControllerCell aceViewController](self, "aceViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

}

- (void)setAceViewController:(id)a3
{
  SiriUIAceObjectViewController *v5;
  SiriUIAceObjectViewController **p_aceViewController;
  SiriUIAceObjectViewController *aceViewController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SiriUIAceObjectViewController *v12;

  v5 = (SiriUIAceObjectViewController *)a3;
  p_aceViewController = &self->_aceViewController;
  aceViewController = self->_aceViewController;
  if (aceViewController != v5)
  {
    v12 = v5;
    -[SiriUIAceObjectViewController view](aceViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllAnimations");

    -[SiriUIAceObjectViewController view](*p_aceViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIAceObjectControllerCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "isDescendantOfView:", v11);

    if ((_DWORD)v9)
      objc_msgSend(v10, "removeFromSuperview");
    objc_storeStrong((id *)p_aceViewController, a3);

    v5 = v12;
  }

}

- (void)setReplacedView:(id)a3
{
  UIView *v5;
  UIView **p_replacedView;
  UIView *replacedView;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  p_replacedView = &self->_replacedView;
  replacedView = self->_replacedView;
  if (replacedView != v5)
  {
    v11 = v5;
    -[UIView superview](replacedView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIAceObjectControllerCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      -[UIView removeFromSuperview](*p_replacedView, "removeFromSuperview");
      -[UIView layer](*p_replacedView, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllAnimations");

    }
    objc_storeStrong((id *)p_replacedView, a3);
    v5 = v11;
  }

}

- (void)configureSubviewsForAnimationType
{
  void *v3;

  -[UIView layer](self->_animationView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[UIView removeFromSuperview](self->_animationView, "removeFromSuperview");
  if (*(_OWORD *)&self->_insertionAnimationType == 0)
  {
    -[SiriUIAceObjectControllerCell _parentViewInCell](self, "_parentViewInCell");
  }
  else if (self->_replacedView)
  {
    -[SiriUIAceObjectControllerCell _parentPreviousViewInCell](self, "_parentPreviousViewInCell");
  }
  -[SiriUIAceObjectControllerCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)_parentViewInCell
{
  void *v3;
  id v4;

  -[SiriUIAceObjectControllerCell contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SiriUIAceObjectViewController view](self->_aceViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

- (void)_parentPreviousViewInCell
{
  id v3;

  -[SiriUIAceObjectControllerCell contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_replacedView);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  int v6;
  id v7;

  -[SiriUIAceObjectViewController view](self->_aceViewController, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDescendantOfView:", self->_animationView);

  if (v6)
    -[SiriUIAceObjectControllerCell _parentViewInCell](self, "_parentViewInCell");
  -[UIView removeFromSuperview](self->_animationView, "removeFromSuperview");
  -[UIView subviews](self->_animationView, "subviews");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "makeObjectsPerformSelector:", sel_removeFromSuperview);

}

+ (id)reuseIdentifier
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("ReuseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)beginAnimation
{
  int64_t insertionAnimationType;

  insertionAnimationType = self->_insertionAnimationType;
  if (insertionAnimationType == 3)
  {
    -[SiriUIAceObjectControllerCell _animateInsertionFadeIn](self, "_animateInsertionFadeIn");
  }
  else if (insertionAnimationType == 1)
  {
    -[SiriUIAceObjectControllerCell _animateInsertionFlyIn](self, "_animateInsertionFlyIn");
  }
  else if (self->_replacementAnimationType == 2)
  {
    -[SiriUIAceObjectControllerCell _animateReplacementCrossFade](self, "_animateReplacementCrossFade");
  }
}

- (void)_animateInsertionFadeIn
{
  void *v3;
  _QWORD v4[5];

  -[SiriUIAceObjectControllerCell _parentViewInCell](self, "_parentViewInCell");
  -[SiriUIAceObjectViewController view](self->_aceViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__SiriUIAceObjectControllerCell__animateInsertionFadeIn__block_invoke;
  v4[3] = &unk_24D7D91F8;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.5);
}

void __56__SiriUIAceObjectControllerCell__animateInsertionFadeIn__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_animateReplacementCrossFade
{
  SiriUIAceObjectViewController *v3;
  void *v4;
  UIView *v5;
  UIView *replacedView;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIView *v13;
  SiriUIAceObjectViewController *v14;
  _QWORD v15[4];
  UIView *v16;
  _QWORD v17[4];
  UIView *v18;
  SiriUIAceObjectViewController *v19;

  -[SiriUIAceObjectControllerCell _parentViewInCell](self, "_parentViewInCell");
  v3 = self->_aceViewController;
  -[SiriUIAceObjectViewController view](v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  -[SiriUIAceObjectControllerCell _parentPreviousViewInCell](self, "_parentPreviousViewInCell");
  v5 = self->_replacedView;
  replacedView = self->_replacedView;
  self->_replacedView = 0;

  -[UIView layer](v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[UIView setAlpha:](v5, "setAlpha:", 1.0);
  -[UIView layer](v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 1.0;
  objc_msgSend(v8, "setOpacity:", v9);

  -[UIView layer](v5, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setZPosition:", 0.0);

  v11 = (void *)MEMORY[0x24BDF6F90];
  v12 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke;
  v17[3] = &unk_24D7D9518;
  v18 = v5;
  v19 = v3;
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_4;
  v15[3] = &unk_24D7D9270;
  v16 = v18;
  v13 = v18;
  v14 = v3;
  objc_msgSend(v11, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v17, v15, 0.3, 0.0);

}

void __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BDF6F90];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_2;
  v7[3] = &unk_24D7D91F8;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 0.5);
  v4 = (void *)MEMORY[0x24BDF6F90];
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_3;
  v5[3] = &unk_24D7D91F8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.25, 0.75);

}

uint64_t __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __61__SiriUIAceObjectControllerCell__animateReplacementCrossFade__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_animateInsertionFlyIn
{
  void *v3;
  UIView *animationView;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  id v14;

  -[SiriUIAceObjectControllerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", self->_animationView);

  animationView = self->_animationView;
  v5 = *MEMORY[0x24BDBEFB0];
  v6 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  -[UIView setFrame:](animationView, "setFrame:", v5, v6);

  -[SiriUIAceObjectControllerCell aceViewController](self, "aceViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[UIView addSubview:](self->_animationView, "addSubview:", v14);
  objc_msgSend(v14, "frame");
  objc_msgSend(v14, "setFrame:", v5, v6);
  -[SiriUIAceObjectControllerCell aceViewController](self, "aceViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIAceObjectControllerCell _flyInAnimationForAceViewController:](self, "_flyInAnimationForAceViewController:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v14, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAnimation:forKey:", v10, CFSTR("Insertion Animation"));

  objc_msgSend(v14, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 1.0;
  objc_msgSend(v12, "setOpacity:", v13);

}

- (id)_flyInAnimationForAceViewController:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDE5638];
  v4 = a3;
  objc_msgSend(v3, "animation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemovedOnCompletion:", 1);
  objc_msgSend(MEMORY[0x24BEA6268], "defaultAnimationDuration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(v5, "setBeginTime:", CACurrentMediaTime());
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(MEMORY[0x24BEA6268], "defaultTimingFunction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v6);

  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyPath:", CFSTR("zPosition"));
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "_insertionAnimatedZPosition");
  v10 = v9;

  objc_msgSend(v8, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromValue:", v11);

  objc_msgSend(v7, "setToValue:", &unk_24D7EF6B0);
  objc_msgSend(v7, "setMass:", 4.0);
  objc_msgSend(v7, "setStiffness:", 600.0);
  objc_msgSend(v7, "setDamping:", 800.0);
  objc_msgSend(MEMORY[0x24BDE5760], "animation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v12, "setFromValue:", &unk_24D7EF6B0);
  objc_msgSend(v12, "setToValue:", &unk_24D7EF6C0);
  objc_msgSend(v12, "setMass:", 4.0);
  objc_msgSend(v12, "setStiffness:", 600.0);
  objc_msgSend(v12, "setDamping:", 800.0);
  v15[0] = v7;
  v15[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimations:", v13);

  return v5;
}

- (void)setTopPadding:(double)a3
{
  self->_topPadding = a3;
  -[SiriUIAceObjectControllerCell setNeedsLayout](self, "setNeedsLayout");
}

- (SiriUIAceObjectViewController)aceViewController
{
  return self->_aceViewController;
}

- (int64_t)insertionAnimationType
{
  return self->_insertionAnimationType;
}

- (void)setInsertionAnimationType:(int64_t)a3
{
  self->_insertionAnimationType = a3;
}

- (int64_t)replacementAnimationType
{
  return self->_replacementAnimationType;
}

- (void)setReplacementAnimationType:(int64_t)a3
{
  self->_replacementAnimationType = a3;
}

- (UIView)replacedView
{
  return self->_replacedView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedView, 0);
  objc_storeStrong((id *)&self->_aceViewController, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
}

@end
