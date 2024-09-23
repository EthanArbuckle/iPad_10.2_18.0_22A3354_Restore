@implementation NowPlayingContextInteractionDelegate

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC12NowPlayingUI36NowPlayingContextInteractionDelegate *v6;
  char *v7;

  v5 = a3;
  v6 = self;
  v7 = _s12NowPlayingUI0aB26ContextInteractionDelegateC011contextMenuE0_016configurationForH10AtLocationSo09UIContextH13ConfigurationCSgSo0mhE0C_So7CGPointVtF_0(v5);

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC12NowPlayingUI36NowPlayingContextInteractionDelegate *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_61EFC(v6);

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC12NowPlayingUI36NowPlayingContextInteractionDelegate *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_61FD4(v9, a5);

  swift_unknownObjectRelease(a5);
}

- (_TtC12NowPlayingUI36NowPlayingContextInteractionDelegate)init
{
  _TtC12NowPlayingUI36NowPlayingContextInteractionDelegate *result;

  result = (_TtC12NowPlayingUI36NowPlayingContextInteractionDelegate *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.NowPlayingContextInteractionDelegate", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI36NowPlayingContextInteractionDelegate_contextActionConfiguration));
  sub_61410(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC12NowPlayingUI36NowPlayingContextInteractionDelegate_menuProvider));
  sub_621F8((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI36NowPlayingContextInteractionDelegate_episodeController);
}

@end
