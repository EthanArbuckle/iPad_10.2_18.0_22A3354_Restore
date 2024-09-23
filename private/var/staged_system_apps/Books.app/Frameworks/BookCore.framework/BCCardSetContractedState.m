@implementation BCCardSetContractedState

- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3
{
  return 0.0;
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BCCardSetContractedState;
  v8 = a5;
  v9 = a3;
  -[BCCardSetState didBecomeCurrentStateCardViewController:previousState:cardData:](&v11, "didBecomeCurrentStateCardViewController:previousState:cardData:", v9, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentScrollView", v11.receiver, v11.super_class));
  -[BCCardSetContractedState cardViewController:contentScrollViewDidChange:cardData:](self, "cardViewController:contentScrollViewDidChange:cardData:", v9, v10, v8);

}

- (void)updateScrollViewsWhenCantExpandCardViewController:(id)a3 cardScrollView:(id)a4 contentScrollView:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;

  v18 = a4;
  v7 = a5;
  v8 = a3;
  objc_msgSend(v18, "contentOffset");
  v10 = v9;
  objc_msgSend(v18, "adjustedContentInset");
  v12 = v11;

  objc_msgSend(v18, "contentSize");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topContentViewController"));

  LODWORD(v8) = objc_msgSend(v15, "prefersAdditionalSafeAreaInsetsForInsetting");
  if ((_DWORD)v8)
    objc_msgSend(v7, "adjustedContentInset");
  else
    objc_msgSend(v7, "contentInset");
  v17 = v10 + v12;
  if (v10 + v12 >= v14)
    v17 = v14;
  objc_msgSend(v7, "setContentOffset:", 0.0, v17 - v16);

}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentScrollView"));
  -[BCCardSetContractedState cardViewController:repositionOffsetsWithContentScrollView:cardData:](self, "cardViewController:repositionOffsetsWithContentScrollView:cardData:", v8, v9, v7);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
  v10 = objc_msgSend(v12, "cardsCanExpand") ^ 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));

  objc_msgSend(v11, "setShowsVerticalScrollIndicator:", v10);
}

- (void)cardViewController:(id)a3 repositionOffsetsWithContentScrollView:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
  v12 = objc_msgSend(v11, "cardsCanExpand");

  if (v12)
  {
    v14.receiver = self;
    v14.super_class = (Class)BCCardSetContractedState;
    -[BCCardSetState cardViewController:repositionOffsetsWithContentScrollView:cardData:](&v14, "cardViewController:repositionOffsetsWithContentScrollView:cardData:", v8, v9, v10);
  }
  else if (v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
    -[BCCardSetContractedState updateScrollViewsWhenCantExpandCardViewController:cardScrollView:contentScrollView:](self, "updateScrollViewsWhenCantExpandCardViewController:cardScrollView:contentScrollView:", v8, v13, v9);

  }
}

- (double)cardViewController:(id)a3 cardScrollViewOffsetForContentScrollView:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  objc_super v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
  v12 = objc_msgSend(v11, "cardsCanExpand");

  if (v12)
  {
    v21.receiver = self;
    v21.super_class = (Class)BCCardSetContractedState;
    -[BCCardSetState cardViewController:cardScrollViewOffsetForContentScrollView:cardData:](&v21, "cardViewController:cardScrollViewOffsetForContentScrollView:cardData:", v10, v8, v9);
    v14 = v13;

  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topContentViewController"));

    v16 = objc_msgSend(v15, "prefersAdditionalSafeAreaInsetsForInsetting");
    objc_msgSend(v8, "contentOffset");
    v18 = v17;
    if (v16)
      objc_msgSend(v8, "adjustedContentInset");
    else
      objc_msgSend(v8, "contentInset");
    v14 = v18 + v19;
  }

  return v14;
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v12, "contentOffset");
  v15 = v14;
  objc_msgSend(v12, "adjustedContentInset");
  v17 = v15 + v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topContentViewController"));
  v19 = objc_msgSend(v18, "shouldOnlyAllowDismiss");

  if (v19 && v17 > 0.0)
  {
    objc_msgSend(v12, "contentOffset");
    v21 = v20;
    objc_msgSend(v12, "adjustedContentInset");
    objc_msgSend(v12, "setContentOffset:", v21, v22);
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v24 = v23;
    if (v23)
    {
      objc_msgSend(v23, "transform");
      v25 = *((double *)&v36 + 1);
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      v25 = 0.0;
    }
    objc_msgSend(v11, "setRawCurrentCardOffset:", v25, v34, v35, v36);

    if (v17 <= 0.0)
    {
      objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);
      if ((objc_msgSend(v12, "isDecelerating") & 1) == 0)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState dismissingState](BCCardSetState, "dismissingState"));
        objc_msgSend(v11, "setCurrentState:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentState"));
        objc_msgSend(v31, "cardViewController:cardData:scrollViewDidScroll:contentScrollView:", v10, v11, v12, v13);

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentScrollView"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
      -[BCCardSetState updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:](self, "updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:", v10, v32, v33, v11);

    }
    else
    {
      objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
      v27 = objc_msgSend(v26, "cardsCanExpand");

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandingState](BCCardSetState, "expandingState"));
        objc_msgSend(v11, "setCurrentState:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentState"));
        objc_msgSend(v29, "cardViewController:cardData:scrollViewDidScroll:contentScrollView:", v10, v11, v12, v13);

      }
      else
      {
        -[BCCardSetContractedState updateScrollViewsWhenCantExpandCardViewController:cardScrollView:contentScrollView:](self, "updateScrollViewsWhenCantExpandCardViewController:cardScrollView:contentScrollView:", v10, v12, v13);
      }
    }
  }

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8
{
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  objc_super v21;

  y = a6.y;
  x = a6.x;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
  v20 = objc_msgSend(v19, "cardsCanExpand");

  if (v20)
  {
    v21.receiver = self;
    v21.super_class = (Class)BCCardSetContractedState;
    -[BCCardSetState cardViewController:cardData:scrollViewWillEndDragging:withVelocity:targetContentOffset:contentScrollView:](&v21, "cardViewController:cardData:scrollViewWillEndDragging:withVelocity:targetContentOffset:contentScrollView:", v15, v16, v17, a7, v18, x, y);
  }

}

- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contentScrollView"));
  -[BCCardSetState _scrollScrollViewToTopForCardViewController:animated:](self, "_scrollScrollViewToTopForCardViewController:animated:", v7, v5);

}

- (void)cardViewController:(id)a3 accessibilityWantsToScrollToOffset:(CGPoint)a4 cardData:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  double v33;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  if (y >= 0.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
    v12 = objc_msgSend(v11, "cardsCanExpand");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardSetViewController"));
      objc_msgSend(v13, "scaledContractedOffset");
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
      objc_msgSend(v16, "cardExpandedTopOffset");
      v18 = v15 - v17;

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentScrollView"));
      objc_msgSend(v19, "adjustedContentInset");
      v21 = v18 - v20;

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[BCCardSetState expandingState](BCCardSetState, "expandingState"));
      objc_msgSend(v9, "setCurrentState:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_136538;
      v30[3] = &unk_28B9D8;
      v31 = v23;
      v32 = 0;
      v33 = v21;
      v25 = v23;
      objc_msgSend(v24, "addAnimations:", v30);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
      objc_msgSend(v26, "startAnimation");

    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
      objc_msgSend(v27, "setContentOffset:", x, y);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollView"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentScrollView"));
      -[BCCardSetContractedState updateScrollViewsWhenCantExpandCardViewController:cardScrollView:contentScrollView:](self, "updateScrollViewsWhenCantExpandCardViewController:cardScrollView:contentScrollView:", v9, v28, v29);

    }
  }

}

- (BOOL)cardViewController:(id)a3 dismissPanShouldBegin:(id)a4 cardData:(id)a5
{
  void *v5;
  char v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "configuration"));
  if (objc_msgSend(v5, "cardsCanExpand"))
    v6 = _os_feature_enabled_impl("Books", "unifiedProductPage");
  else
    v6 = 1;

  return v6;
}

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllers"));
  v7 = 0.0;
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardSetViewController"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentCardViewController"));
    if (v9 == v4)
      v7 = 1.0;
    else
      v7 = 0.0;

  }
  return v7;
}

@end
