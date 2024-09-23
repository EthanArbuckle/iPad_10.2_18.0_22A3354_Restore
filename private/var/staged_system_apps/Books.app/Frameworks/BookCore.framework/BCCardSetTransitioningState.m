@implementation BCCardSetTransitioningState

- (BOOL)transitioning
{
  return 1;
}

- (void)setFractionComplete:(double)a3 cardData:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must override %s"), "-[BCCardSetTransitioningState setFractionComplete:cardData:]"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("abstract base class"), v5, 0));

  objc_exception_throw(v6);
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BCCardSetTransitioningState;
  v8 = a5;
  v9 = a3;
  -[BCCardSetState didBecomeCurrentStateCardViewController:previousState:cardData:](&v11, "didBecomeCurrentStateCardViewController:previousState:cardData:", v9, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentScrollView", v11.receiver, v11.super_class));
  -[BCCardSetTransitioningState cardViewController:contentScrollViewDidChange:cardData:](self, "cardViewController:contentScrollViewDidChange:cardData:", v9, v10, v8);

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
  objc_msgSend(v11, "setShowsVerticalScrollIndicator:", 0);

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;

  v35 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "animator"));

  if (v13)
  {
    -[BCCardSetState yInScrollView:cardViewController:](self, "yInScrollView:cardViewController:", v11, v35);
    -[BCCardSetState yInScreenFromYInScrollView:cardViewController:cardData:](self, "yInScreenFromYInScrollView:cardViewController:cardData:", v35, v10);
    v15 = v14;
    -[BCCardSetState updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:](self, "updateCardViewController:contentScrollView:basedOnCardScrollView:cardData:", v35, v12, v11, v10);
    objc_msgSend(v10, "distanceToExpand");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v18, "scale");
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
    objc_msgSend(v21, "cardExpandedTopOffset");
    if (v15 >= v22)
    {
      v23 = vabdd_f64(v15, v22);
      v24 = 1.0 / v20;

      if (v23 >= v24)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
        objc_msgSend(v28, "cardUnexpandedTopOffset");
        if (v15 <= v29)
        {
          v30 = vabdd_f64(v15, v29);

          if (v30 >= v24)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
            objc_msgSend(v32, "cardUnexpandedTopOffset");
            v34 = v33 - v15;

            -[BCCardSetTransitioningState setFractionComplete:cardData:](self, "setFractionComplete:cardData:", v10, v34 / v17);
            goto LABEL_11;
          }
        }
        else
        {

        }
        -[BCCardSetTransitioningState setFractionComplete:cardData:](self, "setFractionComplete:cardData:", v10, 0.0);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "animator"));
        objc_msgSend(v31, "stopAnimation:", 0);

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "animator"));
        v27 = -[BCCardSetTransitioningState contractedPosition](self, "contractedPosition");
        goto LABEL_10;
      }
    }
    else
    {

    }
    -[BCCardSetTransitioningState setFractionComplete:cardData:](self, "setFractionComplete:cardData:", v10, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "animator"));
    objc_msgSend(v25, "stopAnimation:", 0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "animator"));
    v27 = -[BCCardSetTransitioningState expandedPosition](self, "expandedPosition");
LABEL_10:
    objc_msgSend(v26, "finishAnimationAtPosition:", v27);

  }
LABEL_11:

}

- (void)cardViewController:(id)a3 animationCompletedAtPosition:(int64_t)a4 cardData:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v8 = a5;
  v9 = a3;
  v10 = -[BCCardSetTransitioningState expandedPosition](self, "expandedPosition");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardNavigationController"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewControllers"));
  v13 = objc_msgSend(v12, "count");

  if (v10 == a4)
  {
    if ((unint64_t)v13 > 1)
      v14 = objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedState](BCCardSetState, "pushedState"));
    else
      v14 = objc_claimAutoreleasedReturnValue(+[BCCardSetState expandedState](BCCardSetState, "expandedState"));
  }
  else if ((unint64_t)v13 > 1)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedContractedState](BCCardSetState, "pushedContractedState"));
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[BCCardSetState contractedState](BCCardSetState, "contractedState"));
  }
  v15 = (void *)v14;
  objc_msgSend(v8, "setCurrentState:", v14);

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardSetData"));
  objc_msgSend(v16, "animationCompletedExpanded:", v10 == a4);

}

- (int64_t)expandedPosition
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must override %s"), "-[BCCardSetTransitioningState expandedPosition]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("abstract base class"), v2, 0));

  objc_exception_throw(v3);
}

- (int64_t)contractedPosition
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("must override %s"), "-[BCCardSetTransitioningState contractedPosition]"));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("abstract base class"), v2, 0));

  objc_exception_throw(v3);
}

- (void)_resetInteractiveAnimationWithScrollView:(id)a3 cardData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));
  objc_msgSend(v8, "pauseAnimation");

  v16 = v6;
  objc_msgSend(v16, "contentOffset");
  v10 = v9;
  objc_msgSend(v16, "adjustedContentInset");
  v12 = v10 + v11;

  objc_msgSend(v7, "distanceToExpand");
  v14 = v12 / v13;
  objc_msgSend(v7, "setRawCurrentCardOffset:", 0.0);
  -[BCCardSetTransitioningState setFractionComplete:cardData:](self, "setFractionComplete:cardData:", v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "animator"));

  objc_msgSend(v15, "setReversed:", 0);
}

- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4
{
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCCardSetTransitioningState;
  v5 = a4;
  -[BCCardSetState cardViewController:willDismissWithCardData:](&v7, "cardViewController:willDismissWithCardData:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animator", v7.receiver, v7.super_class));

  objc_msgSend(v6, "stopAnimation:", 1);
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

- (double)leftOver
{
  return self->_leftOver;
}

- (void)setLeftOver:(double)a3
{
  self->_leftOver = a3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
