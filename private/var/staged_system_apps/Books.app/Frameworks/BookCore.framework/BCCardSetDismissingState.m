@implementation BCCardSetDismissingState

- (double)cardViewControllerStatusBarBackgroundOpacity:(id)a3
{
  return 0.0;
}

- (BOOL)transitioning
{
  return 1;
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BCCardSetDismissingState;
  v8 = a5;
  v9 = a3;
  -[BCCardSetState didBecomeCurrentStateCardViewController:previousState:cardData:](&v11, "didBecomeCurrentStateCardViewController:previousState:cardData:", v9, a4, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentScrollView", v11.receiver, v11.super_class));
  -[BCCardSetDismissingState cardViewController:contentScrollViewDidChange:cardData:](self, "cardViewController:contentScrollViewDidChange:cardData:", v9, v10, v8);

}

- (void)cardViewController:(id)a3 contentScrollViewDidChange:(id)a4 cardData:(id)a5
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "scrollView"));
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v7 = a6;
  v8 = a4;
  v9 = objc_opt_class(BCCardStackInteractiveDismissAnimator);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "animator"));
  v11 = BUDynamicCast(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "pauseDismissCancellationAndReset");
  objc_msgSend(v8, "setRawCurrentCardOffset:");

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
  objc_msgSend(v13, "scrollViewWillBeginDragging:", v7);

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidScroll:(id)a5 contentScrollView:(id)a6
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  id v31;

  v31 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "contentOffset");
  v12 = v11;
  objc_msgSend(v10, "adjustedContentInset");
  v14 = v12 + v13;
  objc_msgSend(v9, "rawCurrentCardOffset");
  objc_msgSend(v9, "setRawCurrentCardOffset:", v15 - v14);
  objc_msgSend(v9, "rawCurrentCardOffset");
  if (v16 <= 0.0)
  {
    objc_msgSend(v9, "setRawCurrentCardOffset:", 0.0);
    objc_msgSend(v9, "rawCurrentCardOffset");
    v24 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
    objc_msgSend(v26, "setFractionComplete:", 0.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
    objc_msgSend(v27, "stopAnimation:", 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
    objc_msgSend(v28, "finishAnimationAtPosition:", 1);

    objc_msgSend(v9, "setAnimator:", 0);
    if ((objc_msgSend(v31, "itemPushedOnCard") & 1) != 0)
      v29 = objc_claimAutoreleasedReturnValue(+[BCCardSetState pushedContractedState](BCCardSetState, "pushedContractedState"));
    else
      v29 = objc_claimAutoreleasedReturnValue(+[BCCardSetState contractedState](BCCardSetState, "contractedState"));
    v21 = (void *)v29;
    objc_msgSend(v9, "setCurrentState:", v29);
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));

    if (!v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardSetData"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "animatorForInteractiveDismiss"));
      objc_msgSend(v9, "setAnimator:", v19);

    }
    v20 = objc_opt_class(BCCardStackInteractiveDismissAnimator);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
    v22 = BUDynamicCast(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v9, "rawCurrentCardOffset");
    objc_msgSend(v23, "updateDismissFractionCompleteWithCardOffset:");

    v24 = 0.0;
  }

  objc_msgSend(v10, "adjustedContentInset");
  -[BCCardSetState adjustScrollView:newContentOffset:cardData:](self, "adjustScrollView:newContentOffset:cardData:", v10, v9, -v24 - v30);

}

- (void)_finishAnimationWithScrollView:(id)a3 cardViewController:(id)a4 cardData:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "scrollViewVerticalVelocityWhenDraggingEnded");
  v11 = v10 * -1000.0;
  v12 = objc_opt_class(BCCardStackInteractiveDismissAnimator);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
  v14 = BUDynamicCast(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = 0.0;
  objc_msgSend(v9, "setScrollViewVerticalVelocityWhenDraggingEnded:", 0.0);
  if (v11 < 0.0
    || v11 < 3000.0
    && (objc_msgSend(v9, "rawCurrentCardOffset"),
        v18 = v17,
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardSetData")),
        objc_msgSend(v19, "cutoffToDismissScrollView:", v7),
        v21 = v20,
        v19,
        v18 <= v21))
  {
    objc_msgSend(v9, "rawCurrentCardOffset");
    if (fabs(v23) >= 2.22044605e-16)
      v16 = -v11 / v23;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_137FA4;
    v24[3] = &unk_28BDF8;
    v25 = v9;
    v26 = v8;
    objc_msgSend(v15, "animateDismissCancellationWithVelocity:completion:", v24, v16);

  }
  else
  {
    objc_msgSend(v15, "stopAnimation:", 1);
    objc_msgSend(v9, "setAnimator:", 0);
    objc_msgSend(v9, "setRawCurrentCardOffset:", 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardSetData"));
    objc_msgSend(v22, "_didCommitDismissWithVelocity:interactiveAnimator:", v15, v11);

  }
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidEndDragging:(id)a5 willDecelerate:(BOOL)a6 contentScrollView:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "animator"));

  if (v13 && !a6)
    -[BCCardSetDismissingState _finishAnimationWithScrollView:cardViewController:cardData:](self, "_finishAnimationWithScrollView:cardViewController:cardData:", v12, v14, v11);

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewDidEndDecelerating:(id)a5 contentScrollView:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));

  if (v11)
    -[BCCardSetDismissingState _finishAnimationWithScrollView:cardViewController:cardData:](self, "_finishAnimationWithScrollView:cardViewController:cardData:", v10, v12, v9);

}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillEndDragging:(id)a5 withVelocity:(CGPoint)a6 targetContentOffset:(CGPoint *)a7 contentScrollView:(id)a8
{
  objc_msgSend(a4, "setScrollViewVerticalVelocityWhenDraggingEnded:", a3, a6.y);
}

- (void)cardViewController:(id)a3 willDismissWithCardData:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BCCardSetDismissingState;
  v5 = a4;
  -[BCCardSetState cardViewController:willDismissWithCardData:](&v10, "cardViewController:willDismissWithCardData:", a3, v5);
  v6 = objc_opt_class(BCCardStackInteractiveDismissAnimator);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animator", v10.receiver, v10.super_class));

  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "stopAnimation:", 1);
}

- (void)cardViewController:(id)a3 dismissPan:(id)a4 cardData:(id)a5
{
  id v8;
  id v9;
  char *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (char *)objc_msgSend(v8, "state");
  if ((unint64_t)(v10 - 3) < 3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scrollView"));
    objc_msgSend(v11, "setScrollEnabled:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cardView"));
    objc_msgSend(v8, "velocityInView:", v12);
    objc_msgSend(v9, "setScrollViewVerticalVelocityWhenDraggingEnded:", v13 / -1000.0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scrollView"));
    -[BCCardSetDismissingState _finishAnimationWithScrollView:cardViewController:cardData:](self, "_finishAnimationWithScrollView:cardViewController:cardData:", v14, v23, v9);
LABEL_7:

    goto LABEL_8;
  }
  if (v10 == (_BYTE *)&dword_0 + 2)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cardView"));
    objc_msgSend(v8, "translationInView:", v15);
    objc_msgSend(v9, "setRawCurrentCardOffset:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
    if (!v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardSetData"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "animatorForInteractiveDismiss"));
      objc_msgSend(v9, "setAnimator:", v19);

    }
    v20 = objc_opt_class(BCCardStackInteractiveDismissAnimator);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "animator"));
    v21 = BUDynamicCast(v20, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v9, "rawCurrentCardOffset");
    objc_msgSend(v22, "updateDismissFractionCompleteWithCardOffset:");

    goto LABEL_7;
  }
LABEL_8:

}

@end
