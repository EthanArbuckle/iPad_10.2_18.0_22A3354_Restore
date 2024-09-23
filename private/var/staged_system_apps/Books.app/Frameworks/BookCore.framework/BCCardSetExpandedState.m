@implementation BCCardSetExpandedState

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BCCardSetExpandedState;
  v8 = a5;
  v9 = a3;
  -[BCCardSetState didBecomeCurrentStateCardViewController:previousState:cardData:](&v11, "didBecomeCurrentStateCardViewController:previousState:cardData:", v9, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentScrollView", v11.receiver, v11.super_class));
  -[BCCardSetExpandedState cardViewController:contentScrollViewDidChange:cardData:](self, "cardViewController:contentScrollViewDidChange:cardData:", v9, v10, v8);

}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentScrollView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
  -[BCCardSetState updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:](self, "updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:", v8, v9, v10, v7);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
  objc_msgSend(v11, "setShowsVerticalScrollIndicator:", 1);

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6
{
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  char *v20;
  void *v21;
  id v22;

  v22 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[BCCardSetState yInScrollView:cardViewController:](self, "yInScrollView:cardViewController:", v11, v22);
  -[BCCardSetState yInScreenFromYInScrollView:cardViewController:cardData:](self, "yInScreenFromYInScrollView:cardViewController:cardData:", v22, v10);
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contentScrollView"));
  -[BCCardSetState updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:](self, "updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:", v22, v15, v11, v10);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
  objc_msgSend(v16, "cardExpandedTopOffset");
  if (v14 <= v17)
    goto LABEL_4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "cardNavigationController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "viewControllers"));
  v20 = (char *)objc_msgSend(v19, "count");

  if (v20 == (_BYTE *)&dword_0 + 1)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState contractingState](BCCardSetState, "contractingState"));
    objc_msgSend(v10, "setCurrentState:", v21);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentState"));
    objc_msgSend(v16, "cardViewController:cardData:scrollViewDidScroll:contentScrollView:", v22, v10, v11, v12);
LABEL_4:

  }
}

- (double)cardViewController:(id)a3 cardScrollViewOffsetForContentScrollView:(id)a4 cardData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "configuration"));
  objc_msgSend(v9, "cardExpandedTopOffset");
  v11 = v10;

  objc_msgSend(v7, "contentOffset");
  v13 = v12;
  objc_msgSend(v7, "contentInset");
  v15 = v14;

  v16 = v13 + v15;
  if (v16 >= -v11)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardSetViewController"));

    objc_msgSend(v17, "scaledContractedOffset");
    v19 = v16 + v20;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));

    objc_msgSend(v17, "contentOffset");
    v19 = v18;
  }

  return v19;
}

- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  BOOL v24;
  id location;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState contractingState](BCCardSetState, "contractingState"));
  objc_msgSend(v7, "setCurrentState:", v9);

  objc_initWeak(&location, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scrollView"));
  objc_msgSend(v10, "setScrollEnabled:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_136C0C;
  v22[3] = &unk_292020;
  objc_copyWeak(&v23, &location);
  v24 = v6;
  objc_msgSend(v11, "addAnimations:", v22);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_136C64;
  v20 = &unk_292048;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v12, "addCompletion:", &v17);

  if (v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator", v17, v18, v19, v20));
    objc_msgSend(v13, "startAnimation");
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator", v17, v18, v19, v20));
    objc_msgSend(v14, "pauseAnimation");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
    objc_msgSend(v15, "setFractionComplete:", 1.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
    objc_msgSend(v16, "stopAnimation:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
    objc_msgSend(v13, "finishAnimationAtPosition:", 0);
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)cardViewController:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4 cardData:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  objc_super v24;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentScrollView"));
  objc_msgSend(v11, "adjustedContentInset");
  v13 = y + v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardSetViewController"));
  objc_msgSend(v14, "scaledContractedOffset");
  v16 = v15 - v13;

  -[BCCardSetState yInScreenFromYInScrollView:cardViewController:cardData:](self, "yInScreenFromYInScrollView:cardViewController:cardData:", v9, v10, v16);
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
  objc_msgSend(v19, "cardExpandedTopOffset");
  v21 = v20;

  if (v18 <= v21)
  {
    v24.receiver = self;
    v24.super_class = (Class)BCCardSetExpandedState;
    -[BCCardSetState cardViewController:accessibilityWantsToScrollToOffset:cardData:](&v24, "cardViewController:accessibilityWantsToScrollToOffset:cardData:", v9, v10, x, y);
  }
  else
  {
    v22 = CGPointZero.y;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
    objc_msgSend(v23, "setContentOffset:", CGPointZero.x, v22);

    -[BCCardSetExpandedState cardViewController:scrollToTopAnimated:cardData:](self, "cardViewController:scrollToTopAnimated:cardData:", v9, 1, v9);
  }

}

- (double)_extraGripperOffsetForViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "statusBarManager"));
  objc_msgSend(v6, "statusBarHeight");
  v8 = v7;

  return v8;
}

@end
