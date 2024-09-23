@implementation BCCardSetCustomPushNavigationTransition

- (void)setup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition toView](self, "toView"));
  -[BCCardSetCustomNavigationTransition setViewToSlide:](self, "setViewToSlide:", v3);

  -[BCCardSetCustomNavigationTransition offScreen](self, "offScreen");
  -[BCCardSetCustomNavigationTransition setStartingRect:](self, "setStartingRect:");
  -[BCCardSetCustomNavigationTransition onScreen](self, "onScreen");
  -[BCCardSetCustomNavigationTransition setEndingRect:](self, "setEndingRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCardViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardView"));
  -[BCCardSetCustomNavigationTransition setViewToSnapshot:](self, "setViewToSnapshot:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition fromView](self, "fromView"));
  -[BCCardSetCustomNavigationTransition setViewToHide:](self, "setViewToHide:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition viewToSnapshot](self, "viewToSnapshot"));
  objc_msgSend(v8, "bounds");
  -[BCCardSetCustomNavigationTransition setSnapshotFrame:](self, "setSnapshotFrame:");

  -[BCCardSetCustomNavigationTransition setGripperEndingAlpha:](self, "setGripperEndingAlpha:", 0.0);
  -[BCCardSetCustomNavigationTransition setGripperStartingAlpha:](self, "setGripperStartingAlpha:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "contractedTransform");
  else
    memset(&v30, 0, sizeof(v30));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v11, "scaledContractedOffset");
  CGAffineTransformTranslate(&v31, &v30, 0.0, v12);
  v29 = v31;
  -[BCCardSetCustomNavigationTransition setStartingTransform:](self, "setStartingTransform:", &v29);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "expandedTransform");
  else
    memset(&v27, 0, sizeof(v27));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentCardViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
  objc_msgSend(v17, "cardExpandedTopOffset");
  CGAffineTransformTranslate(&v28, &v27, 0.0, v18);
  v26 = v28;
  -[BCCardSetCustomNavigationTransition setTargetTransform:](self, "setTargetTransform:", &v26);

  v19 = objc_alloc((Class)UIView);
  -[BCCardSetCustomNavigationTransition onScreen](self, "onScreen");
  v20 = objc_msgSend(v19, "initWithFrame:");
  objc_msgSend(v20, "setAlpha:", 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  objc_msgSend(v20, "setBackgroundColor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v22, "setNavigationSkrimView:", v20);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentCardViewController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentContainerView"));
  objc_msgSend(v25, "setClipsToBounds:", 0);

  -[BCCardSetCustomNavigationTransition setAfterScreenUpdates:](self, "setAfterScreenUpdates:", 0);
}

- (void)updateAnimator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
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
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition animator](self, "animator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "expandedTransform");
  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scrollView"));
  v35[0] = v36;
  v35[1] = v37;
  v35[2] = v38;
  objc_msgSend(v7, "setTransform:", v35);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
  objc_msgSend(v9, "setScrollEnabled:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tapToDismissGestureRecognizer"));
  objc_msgSend(v11, "setEnabled:", 0);

  v12 = objc_alloc((Class)UIScreenEdgePanGestureRecognizer);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v14 = objc_msgSend(v12, "initWithTarget:action:", v13, "edgePanGesture:");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v15, "setEdgePanGestureRecognizer:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "edgePanGestureRecognizer"));
  objc_msgSend(v17, "setEdges:", 2);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentCardViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cardNavigationController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "edgePanGestureRecognizer"));
  objc_msgSend(v21, "addGestureRecognizer:", v23);

  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_8F16C;
  v34[3] = &unk_28B960;
  v34[4] = self;
  objc_msgSend(v3, "addAnimations:", v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition fromView](self, "fromView"));
  objc_msgSend(v24, "removeFromSuperview");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delegate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v26, "cardSetViewController:animatorForExpanding:", v27, v3);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  objc_msgSend(v28, "scaledContractedOffset");
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentCardViewController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "scrollView"));
  objc_msgSend(v33, "setContentOffset:", 0.0, v30);

}

- (void)animationEnded:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (a3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedState](BCCardSetState, "pushedState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardSetCustomNavigationTransition cardSetViewController](self, "cardSetViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentCardViewController"));
    objc_msgSend(v5, "setCurrentState:", v6);

  }
}

@end
