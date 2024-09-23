@implementation RecommendationModuleContentResponse

- (id)itemsFor:(int64_t)a3
{
  unint64_t v3;
  void *v4;

  swift_retain();
  v3 = swift_bridgeObjectRetain();
  sub_1A911E650(v3);
  swift_release();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  uint64_t v5;
  void *v6;

  v5 = *((_QWORD *)self + 2);
  if ((v5 & 0xC000000000000001) != 0)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    v6 = (void *)MEMORY[0x1AF4129DC](a4, v5);
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a4)
  {
    v6 = *(void **)(v5 + 8 * a4 + 32);
    swift_retain();
    swift_unknownObjectRetain();
LABEL_5:
    swift_release();
    return v6;
  }
  __break(1u);
  return self;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  unint64_t result;

  v3 = *(_QWORD *)self->serverObjects;
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
LABEL_3:
    swift_release();
    return v4;
  }
  swift_retain();
  swift_bridgeObjectRetain();
  v4 = sub_1A93F8E5C();
  swift_bridgeObjectRelease();
  if ((v4 & 0x8000000000000000) == 0)
    goto LABEL_3;
  result = sub_1A93F8E08();
  __break(1u);
  return result;
}

- (unint64_t)numberOfSections
{
  return 1;
}

- (id)sectionAtIndex:(unint64_t)a3
{
  objc_class *v3;
  char *v4;
  uint64_t (**v5)();
  char *v6;
  _TtC18PodcastsFoundation35RecommendationModuleContentResponse *v7;
  objc_super v9;

  v3 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = (uint64_t (**)())&v4[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *v5 = sub_1A9123748;
  v5[1] = 0;
  v6 = &v4[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0xE000000000000000;
  v9.receiver = v4;
  v9.super_class = v3;
  swift_retain();
  v7 = -[RecommendationModuleContentResponse init](&v9, sel_init);
  swift_release();
  return v7;
}

@end
