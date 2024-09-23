@implementation MTSearchResponse

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  MTSearchResponse *v6;
  void *v7;

  v6 = self;
  v7 = (void *)sub_1A9262BA8(a3, a4);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  MTSearchResponse *v4;
  unint64_t v5;

  v4 = self;
  v5 = sub_1A9262CC0(a3);

  return v5;
}

- (unint64_t)numberOfSections
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___MTSearchResponse_params;
  return *(_QWORD *)(*(_QWORD *)&v2[*(int *)(type metadata accessor for MediaRequest.Params() + 112)] + 16);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  MTSearchResponse *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1A9262E10(a3);

  return v5;
}

- (id)itemsFor:(int64_t)a3
{
  MTSearchResponse *v4;
  void *v5;

  v4 = self;
  sub_1A9263288(a3);

  v5 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  return v5;
}

- (MTSearchResponse)init
{
  MTSearchResponse *result;

  result = (MTSearchResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A9114C30((uint64_t)self + OBJC_IVAR___MTSearchResponse_params);
  swift_bridgeObjectRelease();
}

@end
