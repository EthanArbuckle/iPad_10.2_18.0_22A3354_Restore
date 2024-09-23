@implementation BCCardSetCustomPopNavigationTransition

- (void)setup
{
  void *v3;
  void *v4;
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
  double v16;
  double Center;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  CGFloat v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  CGFloat v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGRect v47;
  CGRect v48;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition fromView](self, "fromView"));
  -[BCCardSetCustomNavigationTransition setViewToSlide:](self, "setViewToSlide:", v3);

  -[BCCardSetCustomNavigationTransition onScreen](self, "onScreen");
  -[BCCardSetCustomNavigationTransition setStartingRect:](self, "setStartingRect:");
  -[BCCardSetCustomNavigationTransition offScreen](self, "offScreen");
  -[BCCardSetCustomNavigationTransition setEndingRect:](self, "setEndingRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition toViewController](self, "toViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentScrollViewForEdge:", 1));

  if (v5)
  {
    -[BCCardSetCustomNavigationTransition setViewToSnapshot:](self, "setViewToSnapshot:", v5);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition toView](self, "toView"));
    -[BCCardSetCustomNavigationTransition setViewToSnapshot:](self, "setViewToSnapshot:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition toView](self, "toView"));
  -[BCCardSetCustomNavigationTransition setViewToHide:](self, "setViewToHide:", v7);

  -[BCCardSetCustomNavigationTransition setGripperStartingAlpha:](self, "setGripperStartingAlpha:", 0.0);
  -[BCCardSetCustomNavigationTransition setGripperEndingAlpha:](self, "setGripperEndingAlpha:", 1.0);
  -[BCCardSetCustomNavigationTransition snapshotFrame](self, "snapshotFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = CGRectMakeWithSize(v12, v14);
  Center = CGRectGetCenter(v16);
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "configuration"));
  objc_msgSend(v21, "cardExpandedTopOffset");
  v23 = v15 - v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "configuration"));
  objc_msgSend(v25, "cardCornerRadius");
  v27 = v23 + v26;

  -[BCCardSetCustomNavigationTransition setSnapshotFrame:](self, "setSnapshotFrame:", v9, v11, v13, v27);
  v47.origin.x = v9;
  v47.origin.y = v11;
  v47.size.width = v13;
  v47.size.height = v27;
  v28 = Center / CGRectGetWidth(v47);
  v48.origin.x = v9;
  v48.origin.y = v11;
  v48.size.width = v13;
  v48.size.height = v27;
  -[BCCardSetCustomNavigationTransition setSnapshotAnchorPoint:](self, "setSnapshotAnchorPoint:", v28, v19 / CGRectGetHeight(v48));
  memset(&v46, 0, sizeof(v46));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "currentCardViewController"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "configuration"));
  objc_msgSend(v31, "cardExpandedTopOffset");
  CGAffineTransformMakeTranslation(&v46, 0.0, v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v34 = v33;
  if (v33)
    objc_msgSend(v33, "expandedTransform");
  else
    memset(&t1, 0, sizeof(t1));
  t2 = v46;
  CGAffineTransformConcat(&v45, &t1, &t2);
  v42 = v45;
  -[BCCardSetCustomNavigationTransition setStartingTransform:](self, "setStartingTransform:", &v42);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v36 = v35;
  if (v35)
    objc_msgSend(v35, "contractedTransform");
  else
    memset(&v40, 0, sizeof(v40));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v37, "scaledContractedOffset");
  CGAffineTransformTranslate(&v41, &v40, 0.0, v38);
  v39 = v41;
  -[BCCardSetCustomNavigationTransition setTargetTransform:](self, "setTargetTransform:", &v39);

  -[BCCardSetCustomNavigationTransition setAfterScreenUpdates:](self, "setAfterScreenUpdates:", 1);
}

- (void)updateAnimator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition animator](self, "animator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v5, "cardSetViewController:animatorForUnexpanding:", v6, v3);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8F634;
  v7[3] = &unk_28B960;
  v7[4] = self;
  objc_msgSend(v3, "addAnimations:", v7);

}

- (void)animationEnded:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  _OWORD v32[6];

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition toView](self, "toView"));
    objc_msgSend(v4, "setAlpha:", 1.0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition transitioningContext](self, "transitioningContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition toView](self, "toView"));
    objc_msgSend(v6, "addSubview:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition fromView](self, "fromView"));
    objc_msgSend(v8, "removeFromSuperview");

    -[BCCardSetCustomNavigationTransition targetTransform](self, "targetTransform");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
    v32[0] = v32[3];
    v32[1] = v32[4];
    v32[2] = v32[5];
    objc_msgSend(v10, "setTransform:", v32);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scrollView"));
    objc_msgSend(v12, "setScrollEnabled:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tapToDismissGestureRecognizer"));
    objc_msgSend(v14, "setEnabled:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "edgePanGestureRecognizer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "edgePanGestureRecognizer"));
    objc_msgSend(v17, "removeGestureRecognizer:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    objc_msgSend(v20, "setEdgePanGestureRecognizer:", 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "navigationSkrimView"));
    objc_msgSend(v22, "removeFromSuperview");

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    objc_msgSend(v23, "setNavigationSkrimView:", 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentCardViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentContainerView"));
    objc_msgSend(v26, "setClipsToBounds:", 1);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentCardViewController"));
    objc_msgSend(v28, "goContracted");

  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "currentCardViewController"));
    v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "cardNavigationController"));

    objc_msgSend(v31, "bc_updateNavBarVisibleWithTransitionCoordinator:duration:", 0, 0.0);
  }
}

@end
