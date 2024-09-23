@implementation BKCrossFadeTransition

+ (id)transition
{
  return objc_alloc_init((Class)objc_opt_class(a1));
}

+ (id)transitionWithDuration:(double)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class(a1));
  objc_msgSend(v4, "setDuration:", a3);
  return v4;
}

- (double)transitionDuration:(id)a3
{
  return self->_duration;
}

- (BKCrossFadeTransition)init
{
  BKCrossFadeTransition *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKCrossFadeTransition;
  result = -[BKCrossFadeTransition init](&v3, "init");
  if (result)
    result->_duration = 0.25;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  objc_msgSend(v10, "setUserInteractionEnabled:", 0);

  objc_msgSend(v5, "addSubview:", v9);
  objc_msgSend(v8, "frame");
  objc_msgSend(v9, "setFrame:");
  +[CATransaction begin](CATransaction, "begin");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
  objc_msgSend(v11, "setType:", kCATransitionFade);
  -[BKCrossFadeTransition transitionDuration:](self, "transitionDuration:", v4);
  objc_msgSend(v11, "setDuration:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v12, "addAnimation:forKey:", v11, CFSTR("fade"));

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  objc_msgSend(v8, "setHidden:", 1);
  objc_msgSend(v9, "setHidden:", 0);
  objc_msgSend(v9, "setAlpha:", 1.0);
  +[CATransaction commit](CATransaction, "commit");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000CD550;
  v16[3] = &unk_1008E7928;
  v17 = v5;
  v18 = v8;
  v19 = v4;
  v13 = v4;
  v14 = v8;
  v15 = v5;
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v16);
  +[CATransaction commit](CATransaction, "commit");

}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

@end
