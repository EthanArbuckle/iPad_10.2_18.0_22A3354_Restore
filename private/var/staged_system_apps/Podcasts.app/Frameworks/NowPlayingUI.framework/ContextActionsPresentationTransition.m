@implementation ContextActionsPresentationTransition

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12NowPlayingUI36ContextActionsPresentationTransition *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_116310(v8, v9, v10);

}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12NowPlayingUI36ContextActionsPresentationTransition *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1167E4(v8, v9, v10);

}

- (void)performWithCustomAnimator:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _TtC12NowPlayingUI36ContextActionsPresentationTransition *v10;

  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  v8 = (_QWORD *)swift_allocObject(&unk_1D2500, 24, 7);
  v8[2] = v6;
  v9 = swift_allocObject(&unk_1D2528, 24, 7);
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  sub_116A84(sub_2BE90, v8, (uint64_t)sub_E83A4, v9);

  swift_release(v8);
  swift_release(v9);
}

- (_TtC12NowPlayingUI36ContextActionsPresentationTransition)init
{
  _TtC12NowPlayingUI36ContextActionsPresentationTransition *result;

  result = (_TtC12NowPlayingUI36ContextActionsPresentationTransition *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.ContextActionsPresentationTransition", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_4375C(*(id *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition____lazy_storage___mirroredDismissalTransition));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_viewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_sourceView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_highlighterView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_presentedView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI36ContextActionsPresentationTransition_snapshotView));
}

@end
