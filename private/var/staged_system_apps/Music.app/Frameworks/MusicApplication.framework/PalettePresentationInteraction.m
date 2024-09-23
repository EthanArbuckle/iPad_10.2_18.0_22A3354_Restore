@implementation PalettePresentationInteraction

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_view));
}

- (void)setView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_view);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_view) = (Class)a3;
  v3 = a3;

}

- (_TtC16MusicApplication30PalettePresentationInteraction)init
{
  return (_TtC16MusicApplication30PalettePresentationInteraction *)sub_E9AFC();
}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  _TtC16MusicApplication30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (char *)&dword_0 + 3
    && !*(Class *)((char *)&v5->super.isa
                 + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_animationController))
  {
    sub_EA1F0(0, 0);
  }

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  _TtC16MusicApplication30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (char *)&dword_0 + 1
    && !*(Class *)((char *)&v5->super.isa
                 + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_animationController))
  {
    sub_EA1F0(0, 0);
  }

}

- (void).cxx_destruct
{
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction____lazy_storage___presentationSetupSignpost, (uint64_t *)&unk_14B1190);
  sub_56024((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction____lazy_storage___presentationSignpost, (uint64_t *)&unk_14B1190);
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_delegate);
  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_transitioningDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_presentedViewController);

  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_viewProvider, (uint64_t *)&unk_14B1170);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_animationController));
}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC16MusicApplication30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_EAAE4(a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC16MusicApplication30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_EAC18(a3);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC16MusicApplication30PalettePresentationInteraction *v10;
  id v11;

  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16MusicApplication30PalettePresentationInteraction_panGestureRecognizer);
  sub_4E684(0, (unint64_t *)&unk_14DB170, UIGestureRecognizer_ptr);
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
  _TtC16MusicApplication30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_EAE28((uint64_t)v4);

  return self & 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC16MusicApplication30PalettePresentationInteraction *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_EB43C(v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC16MusicApplication30PalettePresentationInteraction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_EB004(v4);

  return v6;
}

@end
