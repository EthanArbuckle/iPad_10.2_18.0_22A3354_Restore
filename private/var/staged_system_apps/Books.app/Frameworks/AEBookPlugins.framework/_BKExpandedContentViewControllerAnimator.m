@implementation _BKExpandedContentViewControllerAnimator

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  _OWORD v41[3];
  _OWORD v42[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "snapshotViewAfterScreenUpdates:", 0));

  v10 = objc_msgSend(v7, "bounds");
  UIRectGetCenter(v10, v11, v12, v13, v14);
  objc_msgSend(v9, "setCenter:");
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);
  objc_msgSend(v7, "addSubview:", v9);
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);
  _UIScaleTransformForAspectFitOfSizeInTargetSize(v42, objc_msgSend(v23, "setAlpha:", 0.0), v20, v22, self->_sourceRect.size.width, self->_sourceRect.size.height);
  v41[0] = v42[0];
  v41[1] = v42[1];
  v41[2] = v42[2];
  UIRectGetCenter(objc_msgSend(v23, "setTransform:", v41), self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  objc_msgSend(v23, "setCenter:");
  objc_msgSend(v7, "addSubview:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v24, "setUserInteractionEnabled:", 0);

  -[_BKExpandedContentViewControllerAnimator transitionDuration:](self, "transitionDuration:", v4);
  v26 = v25;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_6A1D8;
  v35[3] = &unk_1C0650;
  v36 = v23;
  v37 = v16;
  v38 = v18;
  v39 = v20;
  v40 = v22;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_6A240;
  v31[3] = &unk_1C0678;
  v32 = v5;
  v33 = v9;
  v34 = v4;
  v27 = v4;
  v28 = v9;
  v29 = v5;
  v30 = v23;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 262145, v35, v31, v26, 0.0);

}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

@end
