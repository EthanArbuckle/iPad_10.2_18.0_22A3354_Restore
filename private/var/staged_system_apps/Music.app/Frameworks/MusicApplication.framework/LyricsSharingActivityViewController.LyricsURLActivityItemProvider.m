@implementation LyricsSharingActivityViewController.LyricsURLActivityItemProvider

- (id)item
{
  _TtCC16MusicApplication35LyricsSharingActivityViewControllerP33_839C29E1991271367F0411968595092E29LyricsURLActivityItemProvider *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  _QWORD v7[3];
  uint64_t v8;

  v2 = self;
  sub_241BBC((uint64_t)v7);

  v3 = v8;
  v4 = __swift_project_boxed_opaque_existential_1(v7, v8);
  v5 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  __swift_destroy_boxed_opaque_existential_1(v7);
  return v5;
}

- (_TtCC16MusicApplication35LyricsSharingActivityViewControllerP33_839C29E1991271367F0411968595092E29LyricsURLActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  uint64_t v3;
  _TtCC16MusicApplication35LyricsSharingActivityViewControllerP33_839C29E1991271367F0411968595092E29LyricsURLActivityItemProvider *result;
  _QWORD v5[4];

  v3 = swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, v3);
  result = (_TtCC16MusicApplication35LyricsSharingActivityViewControllerP33_839C29E1991271367F0411968595092E29LyricsURLActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LyricsURLActivityItemProvider", 46, "init(placeholderItem:)", 22, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication35LyricsSharingActivityViewControllerP33_839C29E1991271367F0411968595092E29LyricsURLActivityItemProvider_snippetComponents));
}

@end
