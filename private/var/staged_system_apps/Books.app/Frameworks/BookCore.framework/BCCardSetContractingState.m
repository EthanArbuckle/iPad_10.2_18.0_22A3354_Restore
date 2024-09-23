@implementation BCCardSetContractingState

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BCCardSetContractingState;
  v7 = a5;
  -[BCCardSetTransitioningState didBecomeCurrentStateCardViewController:previousState:cardData:](&v9, "didBecomeCurrentStateCardViewController:previousState:cardData:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardSetData", v9.receiver, v9.super_class));

  objc_msgSend(v8, "goContractedInteractive:", 1);
}

- (void)setFractionComplete:(double)a3 cardData:(id)a4
{
  double v4;
  id v5;

  v4 = fmax(1.0 - a3, 0.0);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "animator"));
  objc_msgSend(v5, "setFractionComplete:", v4);

}

- (int64_t)expandedPosition
{
  return 1;
}

- (int64_t)contractedPosition
{
  return 0;
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;

  v21 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cardNavigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "viewControllers"));
  v14 = objc_msgSend(v13, "count");

  if ((unint64_t)v14 <= 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "animator"));

    if (v15)
    {
      -[BCCardSetTransitioningState _resetInteractiveAnimationWithScrollView:cardData:](self, "_resetInteractiveAnimationWithScrollView:cardData:", v10, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
      objc_msgSend(v19, "scrollViewWillBeginDragging:", v11);

    }
    else
    {
      BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Cards/BCCardSetState.m", 1108, (uint64_t)"-[BCCardSetContractingState cardViewController:cardData:scrollViewWillBeginDragging:contentScrollView:]", (uint64_t)"data.animator != nil", CFSTR("Got begin dragging in Contracting state but we didn't have an animator."), v16, v17, v18, v20);
    }
  }

}

@end
