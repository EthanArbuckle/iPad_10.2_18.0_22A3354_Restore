@implementation BKHardCutTransition

+ (id)transition
{
  return objc_alloc_init((Class)a1);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  id v23;
  _QWORD block[4];
  id v25;
  CGRect v26;
  CGRect v27;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForKey:", UITransitionContextFromViewKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewForKey:", UITransitionContextToViewKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
  objc_msgSend(v5, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v4, "frame");
  v27.origin.x = v15;
  v27.origin.y = v16;
  v27.size.width = v17;
  v27.size.height = v18;
  v26.origin.x = v8;
  v26.origin.y = v10;
  v26.size.width = v12;
  v26.size.height = v14;
  if (!CGRectEqualToRect(v26, v27))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForKey:", UITransitionContextToViewControllerKey));
    v20 = objc_alloc_init((Class)IMViewControllerNullAnimationTransitionCoordinator);
    objc_msgSend(v20, "setContainerView:", v6);
    objc_msgSend(v4, "frame");
    objc_msgSend(v19, "viewWillTransitionToSize:withTransitionCoordinator:", v20, v21, v22);
    objc_msgSend(v4, "frame");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(v20, "_runAlongsideAnimations");
    objc_msgSend(v20, "_runAlongsideCompletionsAfterCommit");

  }
  objc_msgSend(v6, "insertSubview:belowSubview:", v5, v4);
  objc_msgSend(v4, "removeFromSuperview");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100128604;
  block[3] = &unk_1008E72C0;
  v25 = v3;
  v23 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

@end
