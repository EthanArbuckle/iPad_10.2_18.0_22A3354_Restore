@implementation BCCardSetExpandingState

- (void)setFractionComplete:(double)a3 cardData:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "animator"));
  objc_msgSend(v5, "setFractionComplete:", a3);

}

- (int64_t)expandedPosition
{
  return 0;
}

- (int64_t)contractedPosition
{
  return 1;
}

- (void)didBecomeCurrentStateCardViewController:(id)a3 previousState:(id)a4 cardData:(id)a5
{
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BCCardSetExpandingState;
  v7 = a5;
  -[BCCardSetTransitioningState didBecomeCurrentStateCardViewController:previousState:cardData:](&v9, "didBecomeCurrentStateCardViewController:previousState:cardData:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cardSetData", v9.receiver, v9.super_class));

  objc_msgSend(v8, "goExpandedInteractive:", 1);
}

- (void)cardViewController:(id)a3 cardData:(id)a4 scrollViewWillBeginDragging:(id)a5 contentScrollView:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a4;
  v9 = a5;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "animator"));

  if (v11)
  {
    -[BCCardSetTransitioningState _resetInteractiveAnimationWithScrollView:cardData:](self, "_resetInteractiveAnimationWithScrollView:cardData:", v9, v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
    objc_msgSend(v15, "scrollViewWillBeginDragging:", v10);

  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Cards/BCCardSetState.m", 1066, (uint64_t)"-[BCCardSetExpandingState cardViewController:cardData:scrollViewWillBeginDragging:contentScrollView:]", (uint64_t)"data.animator != nil", CFSTR("Got begin dragging in Expanding state but we didn't have an animator."), v12, v13, v14, v16);
  }

}

@end
