@implementation CardPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC23ShelfKitCollectionViews26CardPresentationController *v2;
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
  CGRect result;

  v2 = self;
  v3 = sub_277AEC();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _TtC23ShelfKitCollectionViews26CardPresentationController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_277C78((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (void)containerViewWillLayoutSubviews
{
  _TtC23ShelfKitCollectionViews26CardPresentationController *v2;

  v2 = self;
  sub_277E0C();

}

- (void)presentationTransitionWillBegin
{
  _TtC23ShelfKitCollectionViews26CardPresentationController *v2;

  v2 = self;
  sub_277F78();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[CardPresentationController presentationTransitionDidEnd:](&v5, "presentationTransitionDidEnd:", v3);
  if (!v3)
  {
    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_cardRim], "removeFromSuperview", v5.receiver, v5.super_class);
    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView], "removeFromSuperview");
  }

}

- (void)dismissalTransitionWillBegin
{
  _TtC23ShelfKitCollectionViews26CardPresentationController *v2;

  v2 = self;
  sub_278940();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[CardPresentationController dismissalTransitionDidEnd:](&v5, "dismissalTransitionDidEnd:", v3);
  if (v3)
    objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView], "removeFromSuperview", v5.receiver, v5.super_class);

}

- (void)didTap:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews26CardPresentationController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[CardPresentationController presentedViewController](v5, "presentedViewController");
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC23ShelfKitCollectionViews26CardPresentationController *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  id v12;
  BOOL result;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  BOOL v22;
  CGPoint v23;
  CGRect v24;

  v4 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView);
  v5 = a3;
  v6 = self;
  objc_msgSend(v5, "locationInView:", v4);
  v8 = v7;
  v10 = v9;
  v11 = -[CardPresentationController presentedViewController](v6, "presentedViewController");
  v12 = objc_msgSend(v11, "view");

  if (v12)
  {
    objc_msgSend(v12, "frame");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v24.origin.x = v15;
    v24.origin.y = v17;
    v24.size.width = v19;
    v24.size.height = v21;
    v23.x = v8;
    v23.y = v10;
    v22 = CGRectContainsPoint(v24, v23);

    return !v22;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UIButton)accessibilityDismissButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dismissButton));
}

- (_TtC23ShelfKitCollectionViews26CardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC23ShelfKitCollectionViews26CardPresentationController *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC23ShelfKitCollectionViews26CardPresentationController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.CardPresentationController", 50, "init(presentedViewController:presenting:)", 41, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_sourceViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dimmingView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26CardPresentationController_cardRim));
}

@end
