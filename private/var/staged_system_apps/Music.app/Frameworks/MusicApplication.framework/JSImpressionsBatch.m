@implementation JSImpressionsBatch

- (NSString)debugDescription
{
  _TtC11MusicJSCore18JSImpressionsBatch *v2;
  NSString v3;

  v2 = self;
  JSImpressionsBatch.debugDescription.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore18JSImpressionsBatch_impressions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC11MusicJSCore18JSImpressionsBatch_location));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC11MusicJSCore18JSImpressionsBatch_pageDetailsProvider);
}

@end
