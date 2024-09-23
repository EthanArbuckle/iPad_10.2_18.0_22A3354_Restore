@implementation ToLookAroundModeTransitionController

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
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  double v24;
  double v25;
  _QWORD v26[4];
  _QWORD *v27;
  _QWORD v28[4];
  _QWORD *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  objc_msgSend(v4, "finalFrameForViewController:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v5, "addSubview:", v16);
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v7, "animateToModeTransition:", v4);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10084926C;
  v34[3] = &unk_1011AC8B0;
  v17 = v6;
  v35 = v17;
  v18 = v7;
  v36 = v18;
  v19 = objc_retainBlock(v34);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10084929C;
  v30[3] = &unk_1011AD238;
  v20 = v4;
  v31 = v20;
  v21 = v17;
  v32 = v21;
  v22 = v18;
  v33 = v22;
  v23 = objc_retainBlock(v30);
  if (objc_msgSend(v20, "isAnimated"))
  {
    objc_msgSend(v22, "applyTransitionWithProgress:", 0.0);
    -[ToLookAroundModeTransitionController transitionDuration:](self, "transitionDuration:", v20);
    v25 = v24;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1008492D4;
    v28[3] = &unk_1011ADA00;
    v29 = v19;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1008492E0;
    v26[3] = &unk_1011B1B90;
    v27 = v23;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v28, v26, v25);

  }
  else
  {
    ((void (*)(_QWORD *))v19[2])(v19);
    ((void (*)(_QWORD *))v23[2])(v23);
  }

}

@end
