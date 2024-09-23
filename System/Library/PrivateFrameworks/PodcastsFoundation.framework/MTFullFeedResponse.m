@implementation MTFullFeedResponse

- (id)itemsFor:(int64_t)a3
{
  MTFullFeedResponse *v4;
  unint64_t v5;
  void *v6;

  swift_beginAccess();
  v4 = self;
  v5 = swift_bridgeObjectRetain();
  sub_1A911E650(v5);

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  MTFullFeedResponse *v6;
  void *v7;

  v6 = self;
  v7 = (void *)sub_1A913FDFC(a3, a4);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  MTFullFeedResponse *v4;
  unint64_t v5;

  v4 = self;
  v5 = sub_1A913FFAC(a3);

  return v5;
}

- (unint64_t)numberOfSections
{
  char *v2;

  if ((*(_BYTE **)((char *)&self->super.super.isa + OBJC_IVAR___MTFullFeedResponse_fullFeedRequest))[OBJC_IVAR___MTFullFeedRequest_isSerial] != 1)
    return 1;
  v2 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation16BaseFeedResponse_parsedCache;
  swift_beginAccess();
  return *(_QWORD *)(*((_QWORD *)v2 + 2) + 16);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  MTFullFeedResponse *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  uint64_t (**v10)();
  uint64_t *v11;
  MTFullFeedResponse *v12;
  objc_super v14;

  v4 = self;
  v5 = sub_1A91403C0(a3);
  v7 = v6;
  v8 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = (uint64_t (**)())&v9[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *v10 = sub_1A9123748;
  v10[1] = 0;
  v11 = (uint64_t *)&v9[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  *v11 = v5;
  v11[1] = v7;
  v14.receiver = v9;
  v14.super_class = v8;
  v12 = -[BaseFeedResponse init](&v14, sel_init);

  return v12;
}

- (void).cxx_destruct
{

}

@end
