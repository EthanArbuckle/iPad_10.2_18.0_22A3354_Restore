@implementation BKAssetPresentationController

- (BKAssetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  BKAssetPresentationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAssetPresentationController;
  v4 = -[BKAssetPresentationController initWithPresentedViewController:presentingViewController:](&v6, "initWithPresentedViewController:presentingViewController:", a3, a4);
  if (v4)
    v4->_useUIPFluidOpenTransition = +[BKUIPFeatures useUIPFluidBookOpenTransition](BKUIPFeatures, "useUIPFluidBookOpenTransition");
  return v4;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)shouldRemovePresentersView
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  objc_super v5;

  if (-[BKAssetPresentationController useUIPFluidOpenTransition](self, "useUIPFluidOpenTransition"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverOpenAnimationZoomStart, self);

  }
  v5.receiver = self;
  v5.super_class = (Class)BKAssetPresentationController;
  -[BKAssetPresentationController presentationTransitionWillBegin](&v5, "presentationTransitionWillBegin");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentationController assetPresenter](self, "assetPresenter"));
  objc_msgSend(v4, "setStateShouldOpen:", 1);

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v3 = a3;
  if (-[BKAssetPresentationController useUIPFluidOpenTransition](self, "useUIPFluidOpenTransition"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v5, "postEvent:sender:", kBETestDriverOpenAnimationZoomEnd, self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v6, "postEvent:sender:", kBETestDriverOpenAnimationRevealStart, self);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentationController assetPresenter](self, "assetPresenter"));
  objc_msgSend(v7, "setStateShouldClose:", v3 ^ 1);

  v9.receiver = self;
  v9.super_class = (Class)BKAssetPresentationController;
  -[BKAssetPresentationController presentationTransitionDidEnd:](&v9, "presentationTransitionDidEnd:", v3);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100096644;
  v8[3] = &unk_1008E72C0;
  v8[4] = self;
  objc_msgSend(UIApp, "_performBlockAfterCATransactionCommits:", v8);
}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (-[BKAssetPresentationController useUIPFluidOpenTransition](self, "useUIPFluidOpenTransition"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverOpenAnimationSetupEnd, self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v4, "postEvent:sender:", kBETestDriverOpenAnimationRevealStart, self);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v5, "postEvent:sender:", kBETestDriverOpenAnimationRevealEnd, self);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v6, "postEvent:sender:", kBETestDriverOpenAnimationZoomStart, self);

  }
  v10.receiver = self;
  v10.super_class = (Class)BKAssetPresentationController;
  -[BKAssetPresentationController dismissalTransitionWillBegin](&v10, "dismissalTransitionWillBegin");
  v7 = -[BKAssetPresentationController useUIPFluidOpenTransition](self, "useUIPFluidOpenTransition");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentationController assetPresenter](self, "assetPresenter"));
  v9 = v8;
  if ((v7 & 1) != 0)
    objc_msgSend(v8, "assetPresenterDismissalTransitionWillBegin");
  else
    objc_msgSend(v8, "assetPresenterPrepareForDismissal");

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  objc_super v9;

  v3 = a3;
  if (-[BKAssetPresentationController useUIPFluidOpenTransition](self, "useUIPFluidOpenTransition"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v5, "postEvent:sender:", kBETestDriverOpenAnimationZoomEnd, self);

    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAssetPresentationController assetPresenter](self, "assetPresenter"));
      objc_msgSend(v6, "assetPresenterPrepareForDismissal");

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)BKAssetPresentationController;
  -[BKAssetPresentationController dismissalTransitionDidEnd:](&v9, "dismissalTransitionDidEnd:", v3);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000968F8;
  v7[3] = &unk_1008E83C0;
  v7[4] = self;
  v8 = v3;
  objc_msgSend(UIApp, "_performBlockAfterCATransactionCommits:", v7);
}

- (BOOL)useEndOfBookExperience
{
  return self->_useEndOfBookExperience;
}

- (void)setUseEndOfBookExperience:(BOOL)a3
{
  self->_useEndOfBookExperience = a3;
}

- (BOOL)useUIPFluidOpenTransition
{
  return self->_useUIPFluidOpenTransition;
}

- (void)setUseUIPFluidOpenTransition:(BOOL)a3
{
  self->_useUIPFluidOpenTransition = a3;
}

@end
