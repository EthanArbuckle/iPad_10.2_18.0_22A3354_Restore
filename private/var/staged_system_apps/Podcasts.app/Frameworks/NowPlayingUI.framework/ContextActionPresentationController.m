@implementation ContextActionPresentationController

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (void)presentationTransitionWillBegin
{
  _TtC12NowPlayingUI35ContextActionPresentationController *v2;

  v2 = self;
  sub_12EB78();

}

- (void)dismissalTransitionWillBegin
{
  _TtC12NowPlayingUI35ContextActionPresentationController *v2;

  v2 = self;
  sub_12EEA0();

}

- (_TtC12NowPlayingUI35ContextActionPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC12NowPlayingUI35ContextActionPresentationController *v7;

  v5 = a3;
  v6 = a4;
  v7 = (_TtC12NowPlayingUI35ContextActionPresentationController *)sub_12F134((uint64_t)v5, (uint64_t)a4);

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI35ContextActionPresentationController_backgroundView));
  sub_145A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI35ContextActionPresentationController_dismissalAnimations), *(_QWORD *)&self->backgroundView[OBJC_IVAR____TtC12NowPlayingUI35ContextActionPresentationController_dismissalAnimations]);
}

@end
