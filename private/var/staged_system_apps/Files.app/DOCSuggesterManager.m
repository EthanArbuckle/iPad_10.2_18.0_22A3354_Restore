@implementation DOCSuggesterManager

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC5Files19DOCSuggesterManager_suggesters));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC5Files19DOCSuggesterManager_gatheredSuggestions));
}

@end
