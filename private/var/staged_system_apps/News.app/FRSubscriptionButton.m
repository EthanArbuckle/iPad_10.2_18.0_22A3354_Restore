@implementation FRSubscriptionButton

- (FRSubscriptionButton)initWithStyle:(unint64_t)a3
{
  FRSubscriptionButton *v4;
  FRSubscriptionButton *v5;
  UIImageView *v6;
  UIImageView *iconImageView;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)FRSubscriptionButton;
  v4 = -[FRSubscriptionButton initWithFrame:](&v27, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", 0);
    iconImageView = v5->_iconImageView;
    v5->_iconImageView = v6;

    -[UIImageView setContentMode:](v5->_iconImageView, "setContentMode:", 1);
    -[FRSubscriptionButton addSubview:](v5, "addSubview:", v5->_iconImageView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
    objc_msgSend(v8, "setDuration:", 0.15);
    objc_msgSend(v8, "setFromValue:", &off_1000E4B18);
    objc_msgSend(v8, "setToValue:", &off_1000E4B28);
    LODWORD(v9) = 1041865114;
    LODWORD(v10) = 0;
    LODWORD(v11) = 1.0;
    LODWORD(v12) = 1045220557;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v12, v10, v9, v11));
    objc_msgSend(v8, "setTimingFunction:", v13);

    objc_msgSend(v8, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v8, "setRemovedOnCompletion:", 0);
    -[FRSubscriptionButton setScaleAnimationDown:](v5, "setScaleAnimationDown:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.scale.xy")));
    objc_msgSend(v14, "setMass:", 1.0);
    objc_msgSend(v14, "setStiffness:", 240.0);
    objc_msgSend(v14, "setDamping:", 18.0);
    objc_msgSend(v14, "setInitialVelocity:", 0.0);
    objc_msgSend(v14, "settlingDuration");
    objc_msgSend(v14, "setDuration:");
    objc_msgSend(v8, "setFromValue:", &off_1000E4B28);
    objc_msgSend(v14, "setToValue:", &off_1000E4B18);
    LODWORD(v15) = 0;
    LODWORD(v16) = 1.0;
    LODWORD(v17) = 1045220557;
    LODWORD(v18) = 1045220557;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v17, v15, v18, v16));
    objc_msgSend(v14, "setTimingFunction:", v19);

    objc_msgSend(v14, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v14, "setRemovedOnCompletion:", 0);
    -[FRSubscriptionButton setScaleAnimationUp:](v5, "setScaleAnimationUp:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
    objc_msgSend(v20, "setDuration:", 0.2);
    LODWORD(v21) = 0.25;
    LODWORD(v22) = 0;
    LODWORD(v23) = 0.25;
    LODWORD(v24) = 1.0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v21, v22, v23, v24));
    objc_msgSend(v20, "setTimingFunction:", v25);

    -[FRSubscriptionButton setCrossfadeAnimation:](v5, "setCrossfadeAnimation:", v20);
    -[FRSubscriptionButton _configureIconImageView](v5, "_configureIconImageView");
    -[FRSubscriptionButton _finishTransition](v5, "_finishTransition");

  }
  return v5;
}

- (FRSubscriptionButton)initWithFrame:(CGRect)a3
{
  return -[FRSubscriptionButton initWithStyle:](self, "initWithStyle:", 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (FRSubscriptionButton)initWithCoder:(id)a3
{
  FRSubscriptionButton *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FRSubscriptionButton;
  result = -[FRSubscriptionButton initWithCoder:](&v4, "initWithCoder:", a3);
  if (result)
    result->_style = 2;
  return result;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FRSubscriptionButton;
  -[FRSubscriptionButton layoutSubviews](&v12, "layoutSubviews");
  -[FRSubscriptionButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)_configureIconImageView
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = -[FRSubscriptionButton style](self, "style");
  switch(v3)
  {
    case 2uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSImages iconSubscriptionButtonLikeSelectedHeart](TSImages, "iconSubscriptionButtonLikeSelectedHeart"));
      v5 = objc_claimAutoreleasedReturnValue(+[TSImages iconSubscriptionButtonLikeHeart](TSImages, "iconSubscriptionButtonLikeHeart"));
      goto LABEL_7;
    case 1uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSImages iconSubscriptionButtonLikeSelectedOpaque](TSImages, "iconSubscriptionButtonLikeSelectedOpaque"));
      v5 = objc_claimAutoreleasedReturnValue(+[TSImages iconSubscriptionButtonLikeOpaque](TSImages, "iconSubscriptionButtonLikeOpaque"));
      goto LABEL_7;
    case 0uLL:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSImages iconSubscriptionButtonLikeSelected](TSImages, "iconSubscriptionButtonLikeSelected"));
      v5 = objc_claimAutoreleasedReturnValue(+[TSImages iconSubscriptionButtonLike](TSImages, "iconSubscriptionButtonLike"));
LABEL_7:
      v6 = (void *)v5;
      goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007E6C4();
  v6 = 0;
  v4 = 0;
LABEL_11:
  -[FRSubscriptionButton setFilledStateImage:](self, "setFilledStateImage:", v4);
  -[FRSubscriptionButton setUnfilledStateImage:](self, "setUnfilledStateImage:", v6);
  if (-[FRSubscriptionButton isOn](self, "isOn"))
    v7 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton filledStateImage](self, "filledStateImage"));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton unfilledStateImage](self, "unfilledStateImage"));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
  objc_msgSend(v9, "setImage:", v8);

  -[FRSubscriptionButton setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setSubscriptionState:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  uint64_t v10;
  void (**v11)(_QWORD);

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = v8;
  if (self->_subscriptionState == a3)
    goto LABEL_9;
  self->_subscriptionState = a3;
  v11 = v8;
  if (a3 == 2)
  {
    v10 = 1;
  }
  else
  {
    if (a3 != 1)
      goto LABEL_7;
    v10 = 0;
  }
  -[FRSubscriptionButton _setOn:animationStyle:completion:](self, "_setOn:animationStyle:completion:", v10, v5, v8);
  v9 = v11;
LABEL_7:
  if (v9)
  {
    v9[2](v9);
    v9 = v11;
  }
LABEL_9:

}

- (void)_setOn:(BOOL)a3 animationStyle:(unint64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v14 = a5;
  if (v14)
  {
    -[FRSubscriptionButton _runAndDrainCompletionBlocksForState:finished:](self, "_runAndDrainCompletionBlocksForState:finished:", !v6, 0);
    if (v6)
      v8 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton onCompletionBlocks](self, "onCompletionBlocks"));
    else
      v8 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton offCompletionBlocks](self, "offCompletionBlocks"));
    v9 = (void *)v8;
    v10 = objc_retainBlock(v14);
    objc_msgSend(v9, "addObject:", v10);

  }
  if (self->_on != v6)
  {
    self->_on = v6;
    if (a4)
    {
      -[FRSubscriptionButton _performTransitionAnimationsForStyle:](self, "_performTransitionAnimationsForStyle:", a4);
    }
    else
    {
      if (v6)
        v11 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton filledStateImage](self, "filledStateImage"));
      else
        v11 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton unfilledStateImage](self, "unfilledStateImage"));
      v12 = (void *)v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
      objc_msgSend(v13, "setImage:", v12);

      -[FRSubscriptionButton _finishTransition](self, "_finishTransition");
    }
  }

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRSubscriptionButton;
  -[FRSubscriptionButton touchesBegan:withEvent:](&v5, "touchesBegan:withEvent:", a3, a4);
  -[FRSubscriptionButton _scaleImageViewDown](self, "_scaleImageViewDown");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRSubscriptionButton;
  -[FRSubscriptionButton touchesEnded:withEvent:](&v5, "touchesEnded:withEvent:", a3, a4);
  -[FRSubscriptionButton _scaleImageViewUp](self, "_scaleImageViewUp");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FRSubscriptionButton;
  -[FRSubscriptionButton touchesCancelled:withEvent:](&v5, "touchesCancelled:withEvent:", a3, a4);
  -[FRSubscriptionButton _scaleImageViewUp](self, "_scaleImageViewUp");
}

- (void)_performTransitionAnimationsForStyle:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  if (!a3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007E780();
  +[CATransaction begin](CATransaction, "begin");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100043710;
  v15[3] = &unk_1000D9758;
  v15[4] = self;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v15);
  if (-[FRSubscriptionButton isOn](self, "isOn"))
  {
    v5 = -[FRSubscriptionButton style](self, "style");
    if (a3 == 1 && v5 == 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton crossfadeAnimation](self, "crossfadeAnimation"));
      objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("crossfadeAnimation"));

    }
    v9 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton filledStateImage](self, "filledStateImage"));
  }
  else
  {
    if (a3 == 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton crossfadeAnimation](self, "crossfadeAnimation"));
      objc_msgSend(v11, "addAnimation:forKey:", v12, CFSTR("crossfadeAnimation"));

    }
    v9 = objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton unfilledStateImage](self, "unfilledStateImage"));
  }
  v13 = (void *)v9;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
  objc_msgSend(v14, "setImage:", v13);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)_scaleImageViewDown
{
  void *v3;
  void *v4;
  void *v5;

  +[CATransaction begin](CATransaction, "begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton scaleAnimationDown](self, "scaleAnimationDown"));
  objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("scaleAnimationDown"));

  +[CATransaction commit](CATransaction, "commit");
}

- (void)_scaleImageViewUp
{
  void *v3;
  void *v4;
  void *v5;

  +[CATransaction begin](CATransaction, "begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton iconImageView](self, "iconImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton scaleAnimationUp](self, "scaleAnimationUp"));
  objc_msgSend(v4, "addAnimation:forKey:", v5, CFSTR("scaleAnimationUp"));

  +[CATransaction commit](CATransaction, "commit");
}

- (void)_finishTransition
{
  -[FRSubscriptionButton _runAndDrainCompletionBlocksForState:finished:](self, "_runAndDrainCompletionBlocksForState:finished:", -[FRSubscriptionButton isOn](self, "isOn"), 1);
}

- (void)_runAndDrainCompletionBlocksForState:(BOOL)a3 finished:(BOOL)a4
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (a3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton onCompletionBlocks](self, "onCompletionBlocks"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRSubscriptionButton offCompletionBlocks](self, "offCompletionBlocks"));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "removeAllObjects", (_QWORD)v10);
}

- (id)accessibilityLabel
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[FRSubscriptionButton subscriptionState](self, "subscriptionState");
  if (v2 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Following");
  }
  else
  {
    if (v2 != 1)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Follow");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1000DF290, 0));

  return v6;
}

- (id)accessibilityHint
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[FRSubscriptionButton subscriptionState](self, "subscriptionState");
  if (v2 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Double tap to unfollow this channel or topic.");
  }
  else
  {
    if (v2 != 1)
    {
      v6 = 0;
      return v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("Double tap to follow this channel or topic.");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1000DF290, 0));

  return v6;
}

- (unint64_t)subscriptionState
{
  return self->_subscriptionState;
}

- (void)setSubscriptionState:(unint64_t)a3
{
  self->_subscriptionState = a3;
}

- (BOOL)isOn
{
  return self->_on;
}

- (void)setOn:(BOOL)a3
{
  self->_on = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIImage)filledStateImage
{
  return self->_filledStateImage;
}

- (void)setFilledStateImage:(id)a3
{
  objc_storeStrong((id *)&self->_filledStateImage, a3);
}

- (UIImage)unfilledStateImage
{
  return self->_unfilledStateImage;
}

- (void)setUnfilledStateImage:(id)a3
{
  objc_storeStrong((id *)&self->_unfilledStateImage, a3);
}

- (NSMutableArray)onCompletionBlocks
{
  return self->_onCompletionBlocks;
}

- (void)setOnCompletionBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSMutableArray)offCompletionBlocks
{
  return self->_offCompletionBlocks;
}

- (void)setOffCompletionBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CASpringAnimation)scaleAnimationDown
{
  return self->_scaleAnimationDown;
}

- (void)setScaleAnimationDown:(id)a3
{
  objc_storeStrong((id *)&self->_scaleAnimationDown, a3);
}

- (CASpringAnimation)scaleAnimationUp
{
  return self->_scaleAnimationUp;
}

- (void)setScaleAnimationUp:(id)a3
{
  objc_storeStrong((id *)&self->_scaleAnimationUp, a3);
}

- (CATransition)crossfadeAnimation
{
  return self->_crossfadeAnimation;
}

- (void)setCrossfadeAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_crossfadeAnimation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeAnimation, 0);
  objc_storeStrong((id *)&self->_scaleAnimationUp, 0);
  objc_storeStrong((id *)&self->_scaleAnimationDown, 0);
  objc_storeStrong((id *)&self->_offCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_onCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_unfilledStateImage, 0);
  objc_storeStrong((id *)&self->_filledStateImage, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
