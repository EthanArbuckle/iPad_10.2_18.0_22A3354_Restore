@implementation LyricsSharingActivityViewController.LyricsURLActivityItemProvider

- (id)item
{
  _TtCC5Music35LyricsSharingActivityViewControllerP33_84E0FBA0540C9AC5FB893F254C8A85DC29LyricsURLActivityItemProvider *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD v7[3];
  uint64_t v8;

  v2 = self;
  sub_100154DD0((uint64_t)v7);

  v3 = v8;
  v4 = sub_100007E68(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  _s5Music18DragDropToPlaylistV6OriginVwxx_0(v7);
  return v5;
}

- (_TtCC5Music35LyricsSharingActivityViewControllerP33_84E0FBA0540C9AC5FB893F254C8A85DC29LyricsURLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  _TtCC5Music35LyricsSharingActivityViewControllerP33_84E0FBA0540C9AC5FB893F254C8A85DC29LyricsURLActivityItemProvider *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3, a2);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtCC5Music35LyricsSharingActivityViewControllerP33_84E0FBA0540C9AC5FB893F254C8A85DC29LyricsURLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("Music.LyricsURLActivityItemProvider", 35, "init(placeholderItem:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewControllerP33_84E0FBA0540C9AC5FB893F254C8A85DC29LyricsURLActivityItemProvider_snippetComponents));
}

@end
