@implementation MTSeasonFeedResponse

- (id)sectionAtIndex:(unint64_t)a3
{
  MTSeasonFeedResponse *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  uint64_t (**v10)();
  uint64_t *v11;
  MTSeasonFeedResponse *v12;
  uint64_t v13;
  uint64_t (**v14)();
  objc_super v16;

  v4 = self;
  v5 = sub_1A93A15D4(a3);
  v7 = v6;
  v8 = (objc_class *)type metadata accessor for GenericDataSourceSection();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = (uint64_t (**)())&v9[OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock];
  *v10 = sub_1A9123748;
  v10[1] = 0;
  v11 = (uint64_t *)&v9[OBJC_IVAR___MTGenericDataSourceSection_storedTitle];
  *v11 = v5;
  v11[1] = v7;
  v16.receiver = v9;
  v16.super_class = v8;
  v12 = -[BaseFeedResponse init](&v16, sel_init);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v4;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = (uint64_t (**)())((char *)v12 + OBJC_IVAR___MTGenericDataSourceSection_shouldIncludeSeeAllBlock);
  swift_beginAccess();
  *v14 = sub_1A93A1B40;
  v14[1] = (uint64_t (*)())v13;
  swift_release();
  return v12;
}

@end
