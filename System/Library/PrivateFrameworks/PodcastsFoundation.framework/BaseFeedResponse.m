@implementation BaseFeedResponse

- (id)itemsFor:(int64_t)a3
{
  return (id)sub_1A93F82F8();
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  id v5;
  _TtC18PodcastsFoundation16BaseFeedResponse *v6;
  id v7;

  v5 = objc_allocWithZone(MEMORY[0x1E0DE7910]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_init);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  return 0;
}

- (unint64_t)numberOfSections
{
  return 0;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  id v4;
  _TtC18PodcastsFoundation16BaseFeedResponse *v5;
  id v6;

  v4 = objc_allocWithZone(MEMORY[0x1E0DE7910]);
  v5 = self;
  v6 = objc_msgSend(v4, sel_init);

  return v6;
}

- (_TtC18PodcastsFoundation16BaseFeedResponse)init
{
  _TtC18PodcastsFoundation16BaseFeedResponse *result;

  result = (_TtC18PodcastsFoundation16BaseFeedResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1A9114C30((uint64_t)self + OBJC_IVAR____TtC18PodcastsFoundation16BaseFeedResponse_params);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
