@implementation ChromeMapToMapTransition

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = a3;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  objc_msgSend(v3, "finalFrameForViewController:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v15, "addSubview:", v13);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100387F08;
  v16[3] = &unk_1011AFFE8;
  v17 = v4;
  v18 = v6;
  v19 = v8;
  v20 = v10;
  v21 = v12;
  v14 = v4;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v16);
  objc_msgSend(v3, "completeTransition:", 1);

}

@end
