@implementation BCCardSetPushedContractedState

- (BOOL)useContentInsetForContentForScrollIndicatorInsets
{
  return !-[BCCardSetPushedContractedState popping](self, "popping");
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  double y;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[3];
  _OWORD v31[2];
  __int128 v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentContainerView"));
  objc_msgSend(v11, "setClipsToBounds:", 1);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[BCCardSetState contractedState](BCCardSetState, "contractedState"));
  if (v12 == v9)
  {
    y = CGPointZero.y;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
    objc_msgSend(v14, "setContentOffset:", CGPointZero.x, y);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardView"));
    v24 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v31[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v23 = v31[0];
    v31[1] = v24;
    v32 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v22 = v32;
    objc_msgSend(v15, "setTransform:", v31);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardNavigationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
    v30[0] = v23;
    v30[1] = v24;
    v30[2] = v22;
    objc_msgSend(v17, "setTransform:", v30);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardNavigationController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "view"));
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "transform");
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v27 = 0u;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "auxiliaryNavigationBarView"));
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    objc_msgSend(v21, "setTransform:", v26);

  }
  objc_msgSend(v10, "_updateScrollViewContentInset");
  v25.receiver = self;
  v25.super_class = (Class)BCCardSetPushedContractedState;
  -[BCCardSetContractedState didBecomeCurrentStateCardViewController:previousState:cardData:](&v25, "didBecomeCurrentStateCardViewController:previousState:cardData:", v8, v9, v10);

}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[BCCardSetContractedState cardViewController:cardScrollViewOffsetForContentScrollView:cardData:](self, "cardViewController:cardScrollViewOffsetForContentScrollView:cardData:", v10, v9, v8);
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v13, "contentOffset");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));
  objc_msgSend(v16, "setContentOffset:", v15, v12);

  -[BCCardSetContractedState cardViewController:repositionOffsetsWithContentScrollView:cardData:](self, "cardViewController:repositionOffsetsWithContentScrollView:cardData:", v10, v9, v8);
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));

  v17 = objc_msgSend(v19, "cardsCanExpand") ^ 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "scrollView"));

  objc_msgSend(v18, "setShowsVerticalScrollIndicator:", v17);
}

- (void)willStopBeingCurrentStateCardViewController:(id)a3 newState:(id)a4 cardDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  if ((objc_msgSend(v10, "transitioning") & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentScrollView"));
    -[BCCardSetContractedState cardViewController:repositionOffsetsWithContentScrollView:cardData:](self, "cardViewController:repositionOffsetsWithContentScrollView:cardData:", v8, v11, v9);

  }
  -[BCCardSetPushedContractedState setPopping:](self, "setPopping:", 1);
  objc_msgSend(v9, "_updateScrollViewContentInset");
  -[BCCardSetPushedContractedState setPopping:](self, "setPopping:", 0);
  v12.receiver = self;
  v12.super_class = (Class)BCCardSetPushedContractedState;
  -[BCCardSetState willStopBeingCurrentStateCardViewController:newState:cardDate:](&v12, "willStopBeingCurrentStateCardViewController:newState:cardDate:", v8, v10, v9);

}

- (BOOL)ignoreContentOffsetForCardViewController:(id)a3
{
  return 1;
}

- (void)cardViewController:(id)a3 scrollToTopAnimated:(BOOL)a4 cardData:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scrollView"));
  -[BCCardSetState _scrollScrollViewToTopForCardViewController:animated:](self, "_scrollScrollViewToTopForCardViewController:animated:", v7, v5);

}

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  return 0.0;
}

- (BOOL)popping
{
  return *(&self->super.super._contentOffsetUpdatesSuspended + 1);
}

- (void)setPopping:(BOOL)a3
{
  *(&self->super.super._contentOffsetUpdatesSuspended + 1) = a3;
}

@end
