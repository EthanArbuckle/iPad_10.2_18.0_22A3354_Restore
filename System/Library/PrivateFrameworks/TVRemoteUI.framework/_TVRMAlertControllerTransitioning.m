@implementation _TVRMAlertControllerTransitioning

- (double)transitionDuration:(id)a3
{
  return 0.404;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  _OWORD *v6;
  void *v7;
  _BOOL4 isPresentation;
  double v9;
  double v10;
  __int128 v11;
  UIView *contentView;
  void *v13;
  __int128 v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_OWORD *)MEMORY[0x24BDBD8B8];
  if (self->_isPresentation
    && (objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9B8]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "addSubview:", v7),
        objc_msgSend(v5, "layoutIfNeeded"),
        v7,
        isPresentation = self->_isPresentation,
        memset(&v24, 0, sizeof(v24)),
        isPresentation))
  {
    CGAffineTransformMakeScale(&v24, 1.2, 1.2);
    v9 = 1.0;
    v10 = 0.0;
  }
  else
  {
    v11 = v6[1];
    *(_OWORD *)&v24.a = *v6;
    *(_OWORD *)&v24.c = v11;
    *(_OWORD *)&v24.tx = v6[2];
    v9 = 0.0;
    v10 = 1.0;
  }
  contentView = self->_contentView;
  v23 = v24;
  -[UIView setTransform:](contentView, "setTransform:", &v23);
  -[UIView setAlpha:](self->_contentView, "setAlpha:", v10);
  -[UIView setAlpha:](self->_dimmingView, "setAlpha:", v10);
  v13 = (void *)MEMORY[0x24BEBDB00];
  v18[0] = MEMORY[0x24BDAC760];
  v14 = v6[1];
  v19 = *v6;
  v18[1] = 3221225472;
  v18[2] = __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke;
  v18[3] = &unk_24DE2C368;
  v18[4] = self;
  v20 = v14;
  v21 = v6[2];
  v22 = v9;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke_2;
  v16[3] = &unk_24DE2C390;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v13, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v18, v16, 0.404, 0.0, 600.0, 0.0);

}

- (BOOL)isPresentation
{
  return self->_isPresentation;
}

- (void)setIsPresentation:(BOOL)a3
{
  self->_isPresentation = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
