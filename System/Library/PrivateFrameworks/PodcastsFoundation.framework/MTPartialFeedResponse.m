@implementation MTPartialFeedResponse

- (id)itemsFor:(int64_t)a3
{
  MTPartialFeedResponse *v3;
  unint64_t v4;
  void *v5;

  v3 = self;
  sub_1A92FB71C();
  swift_beginAccess();
  v4 = swift_bridgeObjectRetain();
  sub_1A911E650(v4);

  swift_bridgeObjectRelease();
  v5 = (void *)sub_1A93F82F8();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)itemInSection:(int64_t)a3 row:(int64_t)a4
{
  MTPartialFeedResponse *v6;
  void *v7;

  v6 = self;
  v7 = (void *)sub_1A913D488(a3, a4);

  return v7;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  MTPartialFeedResponse *v4;
  unint64_t v5;

  v4 = self;
  v5 = sub_1A913D688(a3);

  return v5;
}

- (unint64_t)numberOfSections
{
  uint64_t v2;

  type metadata accessor for PartialFeedRequest();
  v2 = swift_dynamicCastClassUnconditional() + OBJC_IVAR___MTPartialFeedRequest_sections;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v2 + 16);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  uint64_t (*v4)(unint64_t);
  MTPartialFeedResponse *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  uint64_t (**v11)();
  uint64_t *v12;
  MTPartialFeedResponse *v13;
  uint64_t v14;
  uint64_t (**v15)();
  objc_super v17;

  v4 = *(uint64_t (**)(unint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x100);
  v5 = self;
  v6 = v4(a3);
  v8 = v7;
  v9 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = (uint64_t (**)())&v10[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *v11 = sub_1A9123748;
  v11[1] = 0;
  v12 = (uint64_t *)&v10[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  *v12 = v6;
  v12[1] = v8;
  v17.receiver = v10;
  v17.super_class = v9;
  v13 = -[BaseFeedResponse init](&v17, sel_init);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v5;
  *(_QWORD *)(v14 + 24) = a3;
  v15 = (uint64_t (**)())((char *)v13 + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  *v15 = sub_1A913E918;
  v15[1] = (uint64_t (*)())v14;
  swift_release();
  return v13;
}

@end
