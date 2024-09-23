@implementation ModeTransitionController

- (double)transitionDuration:(id)a3
{
  return 0.449999988;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  double v21;
  double v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v5, "addSubview:", v16);
  objc_msgSend(v5, "addSubview:", v17);
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100848F60;
  v28[3] = &unk_1011AC8B0;
  v18 = v7;
  v29 = v18;
  v19 = v6;
  v30 = v19;
  v20 = objc_retainBlock(v28);
  if (objc_msgSend(v4, "isAnimated"))
  {
    objc_msgSend(v19, "applyTransitionWithProgress:", 0.0);
    -[ModeTransitionController transitionDuration:](self, "transitionDuration:", v4);
    v22 = v21;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100848F90;
    v26[3] = &unk_1011ADA00;
    v27 = v20;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100848F9C;
    v23[3] = &unk_1011ACCB8;
    v24 = v4;
    v25 = v18;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v26, v23, v22);

  }
  else
  {
    ((void (*)(_QWORD *))v20[2])(v20);
    objc_msgSend(v4, "completeTransition:", 1);
  }

}

@end
