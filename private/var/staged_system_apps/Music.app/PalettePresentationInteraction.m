@implementation PalettePresentationInteraction

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_view));
}

- (void)setView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_view) = (Class)a3;
  v3 = a3;

}

- (_TtC5Music30PalettePresentationInteraction)init
{
  return (_TtC5Music30PalettePresentationInteraction *)sub_1008EFA60();
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  _TtC5Music30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)3
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_animationController))
  {
    sub_1008F025C(0, 0);
  }

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  _TtC5Music30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (id)1
    && !*(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_animationController))
  {
    sub_1008F025C(0, 0);
  }

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction____lazy_storage___presentationSetupSignpost, &qword_1011CF640);
  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction____lazy_storage___presentationSignpost, &qword_1011CF640);
  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_delegate, v3);
  sub_10013C71C((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_transitioningDelegate, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_presentedViewController, v5);

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_viewProvider, (uint64_t *)&unk_1011B9D90);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_animationController));
}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC5Music30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1008F0B4C(a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC5Music30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1008F0C80(a3);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC5Music30PalettePresentationInteraction *v10;
  id v11;

  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music30PalettePresentationInteraction_panGestureRecognizer);
  sub_10004A07C(0, (unint64_t *)&unk_1011A21D0, UIGestureRecognizer_ptr);
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = v7;
  LOBYTE(a3) = static NSObject.== infix(_:_:)(v8, v11);

  return (a3 & 1) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5Music30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1008F0E90((uint64_t)v4);

  return self & 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Music30PalettePresentationInteraction *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1008F1448(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC5Music30PalettePresentationInteraction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1008F106C(v4);

  return v6;
}

@end
