@implementation ModelViewOverflowPresentationController

- (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *result;

  v5 = a3;
  v6 = a4;
  sub_123DA4(v5, a4);
  return result;
}

- (int64_t)presentationStyle
{
  return 5;
}

- (int64_t)adaptivePresentationStyle
{
  return 0;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_124184();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_124490((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)containerViewWillLayoutSubviews
{
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v2;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v3;
  id v4;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v5;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v6;

  v6 = self;
  v2 = (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *)-[ModelViewOverflowPresentationController containerView](v6, "containerView");
  if (v2)
  {
    v3 = v2;
    -[ModelViewOverflowPresentationController bounds](v2, "bounds");
    objc_msgSend(*(id *)((char *)&v6->super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_overlayView), "setFrame:");
    v4 = objc_retain(*(id *)((char *)&v6->super.super.isa
                           + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_presentedContainerView));
    sub_124184();
    objc_msgSend(v4, "setFrame:");

    v5 = v3;
  }
  else
  {
    v5 = v6;
  }

}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v2;

  v2 = self;
  sub_124808();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v4;

  v4 = self;
  sub_124C4C(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v2;

  v2 = self;
  sub_124D74();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
    objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_overlayView), "removeFromSuperview");
}

- (void)dismissTapDidChange:(id)a3
{
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v4;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v5;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v6;

  v4 = (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *)a3;
  v6 = self;
  if (-[ModelViewOverflowPresentationController state](v4, "state") == (char *)&dword_0 + 3)
  {
    v5 = (_TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *)-[ModelViewOverflowPresentationController presentedViewController](v6, "presentedViewController");
    -[ModelViewOverflowPresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_125198(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_isScrollDismissActive) == 1)
  {
    if (a3)
    {
      v4 = a3;
      v5 = self;
      objc_msgSend(v4, "adjustedContentInset");
      objc_msgSend(v4, "contentOffset");
      objc_msgSend(v4, "setContentOffset:");

    }
    else
    {
      __break(1u);
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_dismissTapGestureRecognizer));
  sub_D1D4((uint64_t)self+ OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_interactiveDismissal, &qword_3D7988);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC23ShelfKitCollectionViews39ModelViewOverflowPresentationController_dismissalScrollView);
}

@end
