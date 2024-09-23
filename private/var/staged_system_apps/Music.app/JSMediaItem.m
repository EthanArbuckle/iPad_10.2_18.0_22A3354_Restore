@implementation JSMediaItem

- (NSString)description
{
  _TtC11MusicJSCore11JSMediaItem *v2;
  NSString v3;

  v2 = self;
  JSMediaItem.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore11JSMediaItem_promotionalBackgroundArtwork));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore11JSMediaItem_promotionalThumbnailArtwork));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10004FF60((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore11JSMediaItem____lazy_storage___unmappedMusicItem, &qword_1011E9878);
}

@end
