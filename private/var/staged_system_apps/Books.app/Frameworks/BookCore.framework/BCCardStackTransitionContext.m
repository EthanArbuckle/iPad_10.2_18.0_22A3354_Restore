@implementation BCCardStackTransitionContext

- (BCCardStackTransitionContext)initWithFromViewController:(id)a3 toViewController:(id)a4 push:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  BCCardStackTransitionContext *v10;
  BCCardStackTransitionContext *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  id v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  CGFloat Height;
  double x;
  double y;
  double width;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v49;
  void *v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v51.receiver = self;
  v51.super_class = (Class)BCCardStackTransitionContext;
  v10 = -[BCCardStackTransitionContext init](&v51, "init");
  v11 = v10;
  if (!v10)
    goto LABEL_30;
  -[BCCardStackTransitionContext setPresentationStyle:](v10, "setPresentationStyle:", 4);
  if (!v8)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parentViewController"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "view"));
    -[BCCardStackTransitionContext setContainerView:](v11, "setContainerView:", v50);

    v14 = objc_opt_new(NSMutableDictionary);
    if (!v9)
      goto LABEL_5;
    goto LABEL_4;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  -[BCCardStackTransitionContext setContainerView:](v11, "setContainerView:", v13);

  v14 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v8, UITransitionContextFromViewControllerKey);
  if (v9)
LABEL_4:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v9, UITransitionContextToViewControllerKey);
LABEL_5:
  v15 = -[NSMutableDictionary copy](v14, "copy");
  -[BCCardStackTransitionContext setViewControllers:](v11, "setViewControllers:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext containerView](v11, "containerView"));
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext containerView](v11, "containerView"));
  objc_msgSend(v25, "bounds");
  Height = CGRectGetHeight(v52);
  v53.origin.x = v18;
  v53.origin.y = v20;
  v53.size.width = v22;
  v53.size.height = v24;
  v54 = CGRectOffset(v53, 0.0, Height);
  x = v54.origin.x;
  y = v54.origin.y;
  width = v54.size.width;
  v30 = v54.size.height;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext containerView](v11, "containerView"));
  objc_msgSend(v31, "bounds");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  if (v5)
    v40 = v30;
  else
    v40 = v39;
  if (v5)
    v41 = width;
  else
    v41 = v37;
  if (v5)
    v42 = y;
  else
    v42 = v35;
  if (v5)
    v43 = x;
  else
    v43 = v33;
  -[BCCardStackTransitionContext setAppearingFromRect:](v11, "setAppearingFromRect:", v43, v42, v41, v40);
  if (v5)
    v44 = v39;
  else
    v44 = v30;
  if (v5)
    v45 = v37;
  else
    v45 = width;
  if (v5)
    v46 = v35;
  else
    v46 = y;
  if (v5)
    v47 = v33;
  else
    v47 = x;
  -[BCCardStackTransitionContext setAppearingToRect:](v11, "setAppearingToRect:", v47, v46, v45, v44);

LABEL_30:
  return v11;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setInnerContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_innerContainerView, a3);
}

- (id)viewForKey:(id)a3
{
  id v4;
  const UITransitionContextViewControllerKey *v5;
  void *v6;
  UILabel *v7;
  UILabel *backgroundView;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", UITransitionContextFromViewKey))
  {
    v5 = &UITransitionContextFromViewControllerKey;
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext viewControllerForKey:](self, "viewControllerForKey:", *v5));
    v7 = (UILabel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

    goto LABEL_13;
  }
  if (objc_msgSend(v4, "isEqualToString:", UITransitionContextToViewKey))
  {
    v5 = &UITransitionContextToViewControllerKey;
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUITransitionContextBackgroundViewKey")))
  {
    backgroundView = (UILabel *)self->_backgroundView;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("BCUITransitionContextTitleLabelKey")))
  {
    backgroundView = self->_titleLabel;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("BCUITransitionContextClippedCoverContainerViewKey")))
    {
      v7 = 0;
      goto LABEL_13;
    }
    backgroundView = (UILabel *)self->_innerContainerView;
  }
  v7 = backgroundView;
LABEL_13:

  return v7;
}

- (id)viewControllerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext viewControllers](self, "viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (BOOL)transitionWasCancelled
{
  return 0;
}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext outerContext](self, "outerContext"));
  objc_msgSend(v5, "completeTransition:", v3);

  -[BCCardStackTransitionContext setOuterContext:](self, "setOuterContext:", 0);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[BCCardStackTransitionContext completionBlock](self, "completionBlock"));
  if (v6)
  {
    v7 = v6;
    v6[2](v6, v3);
    v6 = (void (**)(_QWORD, _QWORD))v7;
  }

}

- (CGAffineTransform)targetTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (CGRect)initialFrameForViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[BCCardStackTransitionContext appearingFromRect](self, "appearingFromRect", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)finalFrameForViewController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[BCCardStackTransitionContext appearingToRect](self, "appearingToRect", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIViewControllerContextTransitioning)outerContext
{
  return self->_outerContext;
}

- (void)setOuterContext:(id)a3
{
  objc_storeStrong((id *)&self->_outerContext, a3);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->_presentationStyle = a3;
}

- (NSDictionary)viewControllers
{
  return self->_viewControllers;
}

- (void)setViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllers, a3);
}

- (CGRect)appearingFromRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_appearingFromRect.origin.x;
  y = self->_appearingFromRect.origin.y;
  width = self->_appearingFromRect.size.width;
  height = self->_appearingFromRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAppearingFromRect:(CGRect)a3
{
  self->_appearingFromRect = a3;
}

- (CGRect)appearingToRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_appearingToRect.origin.x;
  y = self->_appearingToRect.origin.y;
  width = self->_appearingToRect.size.width;
  height = self->_appearingToRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAppearingToRect:(CGRect)a3
{
  self->_appearingToRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllers, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_outerContext, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_innerContainerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
