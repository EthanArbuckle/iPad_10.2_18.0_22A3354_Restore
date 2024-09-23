@implementation PalettePresentationInteraction

- (UIView)view
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_view));
}

- (void)setView:(id)a3
{
  id v5;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_141AB8(a3);

}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (char *)&dword_0 + 3
    && !*(Class *)((char *)&v5->super.isa
                 + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_animationController))
  {
    sub_142034(0, 0);
  }

}

- (void)panGestureRecognized:(id)a3
{
  id v4;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "state") == (char *)&dword_0 + 1
    && !*(Class *)((char *)&v5->super.isa
                 + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_animationController))
  {
    sub_142034(0, 0);
  }

}

- (_TtC12NowPlayingUI30PalettePresentationInteraction)init
{
  _TtC12NowPlayingUI30PalettePresentationInteraction *result;

  result = (_TtC12NowPlayingUI30PalettePresentationInteraction *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.PalettePresentationInteraction", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1EC0C((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_presentedViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_accessoryViewFrameObserver));
  sub_1EC0C((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_transitioningDelegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_animationController));
}

- (void)willMoveToView:(id)a3
{
  id v5;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1423CC(a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_142500(a3);

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v10;
  id v11;

  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12NowPlayingUI30PalettePresentationInteraction_panGestureRecognizer);
  sub_F174(0, (unint64_t *)&unk_204070, UIGestureRecognizer_ptr);
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
  _TtC12NowPlayingUI30PalettePresentationInteraction *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1426EC((uint64_t)v4);

  return self & 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_142EF8(v8, v9);

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC12NowPlayingUI30PalettePresentationInteraction *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_142A9C(v4);

  return v6;
}

@end
