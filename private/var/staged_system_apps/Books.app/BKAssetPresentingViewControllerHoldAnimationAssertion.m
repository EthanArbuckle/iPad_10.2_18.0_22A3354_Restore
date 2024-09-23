@implementation BKAssetPresentingViewControllerHoldAnimationAssertion

- (BKAssetPresentingViewControllerHoldAnimationAssertion)init
{
  BKAssetPresentingViewControllerHoldAnimationAssertion *v2;
  BCMutableFutureValue *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAssetPresentingViewControllerHoldAnimationAssertion;
  v2 = -[BKAssetPresentingViewControllerHoldAnimationAssertion init](&v5, "init");
  if (v2)
  {
    v3 = objc_opt_new(BCMutableFutureValue);
    -[BKAssetPresentingViewControllerHoldAnimationAssertion setFuture:](v2, "setFuture:", v3);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BKAssetPresentingViewControllerHoldAnimationAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKAssetPresentingViewControllerHoldAnimationAssertion;
  -[BKAssetPresentingViewControllerHoldAnimationAssertion dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BKAssetPresentingViewControllerHoldAnimationAssertion future](self, "future"));
  objc_msgSend(v2, "set:error:", &__kCFBooleanTrue, 0);

}

- (BCMutableFutureValue)future
{
  return self->_future;
}

- (void)setFuture:(id)a3
{
  objc_storeStrong((id *)&self->_future, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
}

@end
