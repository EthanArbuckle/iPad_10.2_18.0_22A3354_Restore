@implementation BCCardSetPushedState

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double y;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[3];
  _OWORD v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[3];
  objc_super v42;

  v8 = a3;
  v42.receiver = self;
  v42.super_class = (Class)BCCardSetPushedState;
  v9 = a5;
  -[BCCardSetState didBecomeCurrentStateCardViewController:previousState:cardData:](&v42, "didBecomeCurrentStateCardViewController:previousState:cardData:", v8, a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardNavigationController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
  v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v35 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v41[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v41[1] = v34;
  v33 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v41[2] = v33;
  objc_msgSend(v11, "setTransform:", v41);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardNavigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "transform");
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "auxiliaryNavigationBarView"));
  v37[0] = v38;
  v37[1] = v39;
  v37[2] = v40;
  objc_msgSend(v15, "setTransform:", v37);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardView"));
  v36[0] = v35;
  v36[1] = v34;
  v36[2] = v33;
  objc_msgSend(v16, "setTransform:", v36);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentScrollView"));
  -[BCCardSetPushedState cardViewController:contentScrollViewDidChange:cardData:](self, "cardViewController:contentScrollViewDidChange:cardData:", v8, v17, v9);

  y = CGPointZero.y;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
  objc_msgSend(v19, "setContentOffset:", CGPointZero.x, y);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
  objc_msgSend(v20, "setShowsVerticalScrollIndicator:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "scrollView"));
  objc_msgSend(v21, "setScrollEnabled:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
  objc_msgSend(v22, "bounds");
  v25 = CGRectMakeWithSize(v23, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardView"));
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

}

- (void)willStopBeingCurrentStateCardViewController:(id)a3 newState:(id)a4 cardDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a5;
  v9 = a4;
  -[BCCardSetPushedState setPopping:](self, "setPopping:", 1);
  objc_msgSend(v8, "_updateCardFrames");
  objc_msgSend(v8, "_updateScrollViewContentInset");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scrollView"));
  objc_msgSend(v10, "setScrollEnabled:", 1);

  LODWORD(v10) = objc_msgSend(v9, "transitioning");
  if ((_DWORD)v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentScrollView"));
    objc_msgSend(v11, "setScrollEnabled:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentScrollView"));
    objc_msgSend(v12, "setShowsVerticalScrollIndicator:", 0);

  }
  -[BCCardSetPushedState setPopping:](self, "setPopping:", 0);

}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 1);
  objc_msgSend(v5, "setScrollEnabled:", 1);

}

- (BOOL)ignoreContentOffsetForCardViewController:(id)a3
{
  return 1;
}

- (BOOL)prefersStatusBarBackgroundHidden
{
  return 1;
}

- (void)cardViewController:(id)a3 updateContentSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[BCCardSetState _adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:](self, "_adjustedContentSizeForCardViewController:contentSize:includeDistanceToExpand:", v7, 0, width, height);
  v9 = v8;
  v11 = v10;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scrollView"));

  objc_msgSend(v12, "setContentSize:", v9, v11);
}

- (void)cardViewControllerUpdateCardSize:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[BCCardSetPushedState popping](self, "popping"))
  {
    -[BCCardSetState updateCardSize:addExtra:](self, "updateCardSize:addExtra:", v5, 1);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    -[BCCardSetState updateCardSize:addExtra:](self, "updateCardSize:addExtra:", v5, objc_msgSend(v4, "cardsCanExpand") ^ 1);

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

- (double)_cardViewControllerAuxiliaryNavigationBarAlpha:(id)a3 cardData:(id)a4
{
  return 0.0;
}

- (BOOL)popping
{
  return *(&self->super._contentOffsetUpdatesSuspended + 1);
}

- (void)setPopping:(BOOL)a3
{
  *(&self->super._contentOffsetUpdatesSuspended + 1) = a3;
}

@end
