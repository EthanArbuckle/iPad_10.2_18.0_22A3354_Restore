@implementation FromLookAroundModeTransitionController

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
  id v21;
  _QWORD *v22;
  double v23;
  double v24;
  _QWORD v25[4];
  _QWORD *v26;
  _QWORD v27[4];
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;

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
  objc_msgSend(v5, "insertSubview:belowSubview:", v16, v17);
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v16, "layoutIfNeeded");
  objc_msgSend(v6, "lookAroundButtonFrame");
  objc_msgSend(v7, "setLookAroundButtonFrame:");
  objc_msgSend(v7, "animateFromModeTransition:", v4);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100849594;
  v31[3] = &unk_1011AC8B0;
  v18 = v7;
  v32 = v18;
  v19 = v6;
  v33 = v19;
  v20 = objc_retainBlock(v31);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1008495C4;
  v29[3] = &unk_1011AC860;
  v21 = v4;
  v30 = v21;
  v22 = objc_retainBlock(v29);
  if (objc_msgSend(v21, "isAnimated"))
  {
    objc_msgSend(v19, "applyTransitionWithProgress:", 0.0);
    -[FromLookAroundModeTransitionController transitionDuration:](self, "transitionDuration:", v21);
    v24 = v23;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1008495D0;
    v27[3] = &unk_1011ADA00;
    v28 = v20;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1008495DC;
    v25[3] = &unk_1011B1B90;
    v26 = v22;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v27, v25, v24);

  }
  else
  {
    ((void (*)(_QWORD *))v20[2])(v20);
    ((void (*)(_QWORD *))v22[2])(v22);
  }

}

@end
